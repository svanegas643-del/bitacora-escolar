# Requisitos validados de Bitácora Escolar (versión 1.2)

Los 8 requerimientos seleccionados para el taller: 5 funcionales y 3 no funcionales.
Responsable de requisitos: Maira Alejandra García Marchena.
Estado de todos: Implementado (pasan a Validado cuando se ejecuten las pruebas de pruebas.md).

## RF-02. Registro e inicio de sesión
- Descripción: El sistema permitirá a un visitante registrarse con nombre, correo, contraseña (mínimo 6 caracteres) y rol lector o autor; iniciar sesión con correo y contraseña; y cerrar sesión. Con credenciales incorrectas mostrará un mensaje de error y no dará acceso. La recuperación de contraseña queda fuera del alcance de esta versión.
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha: 12/11/2026
- Criterio de aceptación: un usuario registrado inicia sesión y accede a su panel; con contraseña incorrecta se muestra un error y no se accede; al cerrar sesión ya no se accede a Mi panel.

## RF-03. Roles y permisos
- Descripción: El rol se elegirá al registrarse (lector o autor). Solo un usuario con rol reviewer podrá otorgar el rol reviewer, al aceptar una postulación con cuenta; el primer reviewer se asigna directamente en la base de datos. Solo autor y reviewer verán el envío de artículos y solo reviewer verá Administración. Las mismas restricciones se aplicarán en la base de datos mediante políticas por fila.
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha: 12/11/2026
- Criterio de aceptación: un lector no ve las opciones de envío ni de revisión; solo un reviewer ve Administración.

## RF-04. Envío de artículos
- Descripción: El sistema permitirá enviar un artículo con título, autores, correo, eje, resumen y un archivo PDF o Word (máximo 8 MB desde la portada y 10 MB desde la cuenta de autor). Si el archivo es válido, guardará el artículo con estado "en revisión" y mostrará una confirmación. Si no lo es, mostrará un mensaje que indique la causa y no creará el artículo. Los envíos desde la portada no requieren cuenta y su autor no podrá consultarlos después.
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha: 12/11/2026
- Criterio de aceptación: con un archivo válido, el sistema confirma y el artículo queda "en revisión"; con un archivo inválido, muestra un error claro y no crea el artículo.

## RF-07. Revisión y decisión
- Descripción: Un reviewer podrá abrir el manuscrito de cualquier artículo y registrar una decisión (aprobar, pedir correcciones o rechazar) con observaciones obligatorias. El sistema actualizará el estado y guardará la observación en el historial con rol y fecha, sin que pueda quedar un cambio de estado sin observación.
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha: 12/11/2026
- Criterio de aceptación: al decidir, el artículo cambia de estado y la observación queda en el historial visible para el autor; sin observaciones, la decisión no se guarda.

## RF-13. Artículos aprobados públicos
- Descripción: La plataforma (sistema.html) mostrará, sin iniciar sesión, solo los artículos en estado "aprobado", con eje, resumen y descarga del manuscrito mediante un enlace temporal de 2 minutos. Los artículos de la portada estarán rotulados como "Ejemplo".
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha: 12/11/2026
- Criterio de aceptación: un artículo aprobado aparece en la lista pública y puede abrirse y descargarse; uno en revisión o rechazado no aparece.

## RNF-01. Usabilidad
- Descripción: Todo formulario mostrará "Enviando..." mientras procesa y, al terminar, una confirmación o un mensaje de error que indique la causa. Todo campo tendrá etiqueta visible.
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha: 12/11/2026
- Criterio de aceptación: cada formulario muestra "Enviando...", y luego una confirmación o un error con la causa.

## RNF-04. Seguridad de acceso
- Descripción: (a) Enviar desde cuenta y administrar exigirá sesión iniciada. (b) Las políticas por fila impedirán que un usuario sin rol reviewer lea o modifique artículos ajenos, incluso consultando la base de datos directamente. (c) El cliente usará solo la clave pública y nunca la clave de servicio. (d) Todo texto ingresado se escapará antes de mostrarse.
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha:  12/11/2026
- Criterio de aceptación: un usuario sin rol reviewer no puede leer ni modificar artículos ajenos, ni siquiera consultando la base de datos directamente.

## RNF-07. Disponibilidad
- Descripción: El sitio estará publicado en una URL HTTPS de Netlify de acceso público, sin iniciar sesión. Se considera cumplido si abre desde dos dispositivos y redes distintos. No se garantiza un porcentaje de disponibilidad por usar planes gratuitos.
- Versión: 1.2
- Prioridad: Alta
- Responsable: Maira Alejandra García Marchena
- Estado: Implementado
- Fecha: 12/11/2026
- Criterio de aceptación: el sitio abre sin iniciar sesión desde dos dispositivos y redes distintos.
