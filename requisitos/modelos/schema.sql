-- Bitácora Escolar: esquema completo. Supabase > SQL Editor > New query > pegar todo > Run (una sola vez).

create table profiles (
  id uuid primary key references auth.users on delete cascade,
  nombre text not null,
  rol text not null default 'autor' check (rol in ('lector','autor','reviewer')),
  created_at timestamptz default now()
);
create table articulos (
  id uuid primary key default gen_random_uuid(),
  autor_id uuid references profiles(id),
  autor_nombre text, autor_correo text,
  titulo text not null, eje text not null, resumen text not null, archivo_path text not null,
  estado text not null default 'en_revision' check (estado in ('en_revision','con_observaciones','aprobado','rechazado')),
  etiquetas text[] not null default '{}',
  created_at timestamptz default now()
);
create table comentarios (
  id uuid primary key default gen_random_uuid(),
  articulo_id uuid not null references articulos(id) on delete cascade,
  autor_id uuid not null references profiles(id),
  rol text not null, texto text not null,
  created_at timestamptz default now()
);
create table postulaciones (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  nombre text, correo text, rol_interes text, experiencia text, mensaje text,
  estado text not null default 'pendiente' check (estado in ('pendiente','aceptada','rechazada')),
  created_at timestamptz default now()
);

create or replace function es_reviewer() returns boolean
language sql security definer set search_path = public stable as
$$ select exists (select 1 from profiles where id = auth.uid() and rol = 'reviewer') $$;

alter table profiles enable row level security;
alter table articulos enable row level security;
alter table comentarios enable row level security;
alter table postulaciones enable row level security;

create policy "ver perfiles" on profiles for select using (true);
create policy "crear mi perfil" on profiles for insert to authenticated with check (id = auth.uid() and rol in ('lector','autor'));
create policy "admin asigna roles" on profiles for update to authenticated using (es_reviewer()) with check (rol in ('lector','autor','reviewer'));

create policy "ver articulos" on articulos for select using (estado = 'aprobado' or autor_id = auth.uid() or es_reviewer());
create policy "autor crea" on articulos for insert to authenticated with check (autor_id = auth.uid() and estado = 'en_revision' and exists (select 1 from profiles where id = auth.uid() and rol in ('autor','reviewer')));
create policy "envio desde la portada" on articulos for insert to anon, authenticated with check (autor_id is null and estado = 'en_revision' and autor_nombre is not null and autor_correo is not null);
create policy "admin actualiza" on articulos for update to authenticated using (es_reviewer()) with check (es_reviewer());
create policy "autor reenvia" on articulos for update to authenticated using (autor_id = auth.uid()) with check (autor_id = auth.uid() and estado = 'en_revision');

create policy "ver comentarios" on comentarios for select to authenticated using (es_reviewer() or exists (select 1 from articulos a where a.id = articulo_id and a.autor_id = auth.uid()));
create policy "comentar" on comentarios for insert to authenticated with check (autor_id = auth.uid() and (es_reviewer() or exists (select 1 from articulos a where a.id = articulo_id and a.autor_id = auth.uid())));

create policy "postular" on postulaciones for insert to anon, authenticated with check (estado = 'pendiente' and (user_id is null or user_id = auth.uid()));
create policy "ver postulaciones" on postulaciones for select to authenticated using (es_reviewer() or user_id = auth.uid());
create policy "admin gestiona postulaciones" on postulaciones for update to authenticated using (es_reviewer()) with check (es_reviewer());

-- Archivos (manuscritos)
insert into storage.buckets (id, name, public) values ('manuscritos', 'manuscritos', false) on conflict do nothing;
create policy "subir manuscritos" on storage.objects for insert to anon, authenticated with check (bucket_id = 'manuscritos' and ((storage.foldername(name))[1] = 'publico' or (storage.foldername(name))[1] = auth.uid()::text));
create policy "leer manuscritos" on storage.objects for select using (bucket_id = 'manuscritos' and ((storage.foldername(name))[1] = auth.uid()::text or es_reviewer() or exists (select 1 from articulos a where a.archivo_path = name and a.estado = 'aprobado')));

-- PASO FINAL: primero regístrate en sistema.html con tu correo; luego ejecuta esto (cambia el correo) para ser admin:
-- update profiles set rol = 'reviewer' where id = (select id from auth.users where email = 'TU_CORREO@ejemplo.com');
