Alumno: Maximiliano Fabbri
Curso: Coderhouse - SQL
Comision: 57190
Proyecto: Merchanmanger

Detalle: Base de Datos para seguimiento de trabajos de una empresa de Merchandising

Los trabajos estan compuestos por un pedido, que tiene uno o más items, La base de datos, debe reflejar el estado de tanto los Items, como los Pedidos en general.
Registrando que usuario hace el cambio de estado en cada caso.
Tambien debe registrar los Remitos generados para cada pedido.

TABLAS
- remitos: registra los datos generales del remito.
- items_remitos: registra los items remitidos y su cantidad.
- clientes: datos completos de los clientes.
- roles_usuario: registra los roles de usuario.
- usuarios: registra los usuarios.
- proveedores: datos completos de los proveedores.
- estado_pedidos: incluye todos los posibles estados en que pueden estar los pedidos.
- pedidos: registra los datos genereales del pedido y su estado.
- movimiento_pedidos: tabla de hechos, que registra los movimientos en el estado de los pedidos y que usuario los realizó.
- estado_items: incluye todos los posibles estados en que pueden estar los items.
- items: detalle de cada item incluido en el pedido, los items, pueden ser productos o servicios a incluir en el producto (impresión, grabado, bordado, etc.).
- movimiento_items: tabla de hechos, que registra los movimientos en el estado de los items y que usuario los realizó.

