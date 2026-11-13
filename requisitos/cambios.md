# Registro de cambios

## CR-01. Autenticación y base de datos
- Requerimiento afectado: RF-02, RF-03, RF-04, RF-07, RF-13 y RNF-04.
- Descripción: agregar autenticación y base de datos (Supabase) con roles, panel de revisión, seguimiento del autor y artículos aprobados reales.
- Solicitante: grupo de compañeros de la elicitación (10 mejoras) y profesor (sistema completo y funcional).
- Motivo: cumplir las 10 mejoras elicitadas; la versión estática no permite login, roles ni seguimiento.
- Prioridad: Alta
- Impacto: Alto
- Decisión: Aprobado
- Nueva versión: RF-02 1.0, RF-03 1.0 y RF-07 1.0 (nuevos); RF-04 1.1; RF-13 1.1; RNF-04 1.1.
- Estado: implementado (v4 del sistema); verificación pendiente en el sitio publicado.

## CR-SEG-01. Cambio originado por seguridad
- Requerimiento afectado: RNF-04 y RNF-05; indirectamente RF-02, RF-04 y RF-07.
- Descripción: escenario de vulnerabilidad en una dependencia (supabase-js, cargada por CDN). Se crea el requisito RNF-14 de gestión de dependencias y se endurece la carga de la librería y la configuración del bucket de archivos.
- Solicitante: resultado de la auditoría del taller.
- Prioridad: Alta
- Impacto: Medio
- Decisión: Aprobado por Nicol Estefany Díaz Zambrano, Maira Alejandra García Marchena y Sarha Daniela Vanegas Jiménez el 12 de noviembre de 2026.
- Nueva versión: RNF-04 1.2, RNF-05 1.1 y RNF-14 1.0.
- Pruebas a repetir: TC-02, TC-03, TC-04, TC-05, TC-08 y la nueva TC-10.
- Estado: aprobado, pendiente de implementar.

## Historial de versiones de RF-04
| Versión | Fecha | Cambio | Responsable | Motivo |
|---|---|---|---|---|
| 1.0 | Octubre de 2026 | Requisito inicial: formulario de envío en la portada | Equipo (Nicol, Maira y Sarha) | Pedido del profesor |
| 1.1 | Noviembre de 2026 | Envío también desde la cuenta de autor, con Supabase y estado "en revisión" (CR-01) | Equipo (Nicol, Maira y Sarha) | Elicitación de compañeros y exigencia de un sistema completo |
| 1.2 | 12 de noviembre de 2026 | Se separan los límites por flujo, se define el mensaje de error y se aclara que el envío sin cuenta no es consultable | Equipo (Nicol, Maira y Sarha) | Review, auditoría y walk-through |
