# Casos de prueba

Estado de ejecución de todas las pruebas: Pendiente. 12/11/2026

| ID | Requisito | Qué se prueba | Resultado esperado | Estado |
|---|---|---|---|---|
| TC-02 | RF-02 | Registrarse, iniciar sesión, cerrar sesión y usar credenciales incorrectas | Con datos correctos se accede al panel; con credenciales incorrectas se muestra un error | Pendiente |
| TC-03 | RF-03 | Entrar como lector y como reviewer | El lector no ve envío ni revisión; solo el reviewer ve Administración | Pendiente |
| TC-04 | RF-04 | Enviar un PDF válido, un .exe, un archivo de más de 10 MB y un envío desde la portada | El PDF válido queda "en revisión"; los archivos inválidos se rechazan con mensaje claro | Pendiente |
| TC-05 | RF-07 | Aprobar, pedir correcciones y rechazar, con y sin observaciones | El estado cambia y la observación queda en el historial; sin observaciones no se guarda | Pendiente |
| TC-06 | RF-13 | Ver artículos aprobados, filtrar por eje, buscar y descargar | Solo aparecen los aprobados; el filtro y el buscador funcionan; la descarga funciona | Pendiente |
| TC-07 | RNF-01 | Enviar cada formulario con datos válidos y con un error | Se muestra "Enviando...", luego confirmación o error con la causa | Pendiente |
| TC-08 | RNF-04 | Consultar la base de datos directamente sin rol reviewer | No se pueden leer ni modificar artículos ajenos | Pendiente |
| TC-09 | RNF-07 | Abrir el sitio sin sesión desde dos dispositivos y redes distintos | El sitio abre correctamente en ambos | Pendiente |
| TC-10 | RNF-14 | Comprobar que la librería del CDN carga con versión fija e integridad (cuando se implemente CR-SEG-01) | La librería carga y la verificación de integridad no falla | Pendiente |
