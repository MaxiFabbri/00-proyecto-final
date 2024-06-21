CREATE DATABASE IF NOT EXISTS merchanmanager;

USE merchanmanager;

CREATE TABLE remitos(
	id_remito INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_usuario INT NOT NULL,
    id_cliente INT NOT NULL,
    fecha  DATE NOT NULL DEFAULT (CURRENT_DATE),
	transporte VARCHAR(245),
	detalle VARCHAR(245),
    PRIMARY KEY(id_remito)
);

CREATE TABLE items_remitos(
	id_item_remito INT NOT NULL AUTO_INCREMENT,
    id_remito INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
	producto VARCHAR(245),
    PRIMARY KEY(id_item_remito)
);

CREATE TABLE clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(245),
    cuit VARCHAR(11) UNIQUE,
    domicilio VARCHAR(245),
    contacto VARCHAR(245),
	email VARCHAR(245) UNIQUE,
    telefono VARCHAR(30),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE roles_usuarios(
	id_rol INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion VARCHAR(245),
    PRIMARY KEY(id_rol)
);

CREATE TABLE usuarios(
	id_usuario INT NOT NULL AUTO_INCREMENT,
	id_rol INT NOT NULL,
    nombre VARCHAR(245),
    password VARCHAR(50),
	email VARCHAR(245),
    telefono VARCHAR(30),
    PRIMARY KEY(id_usuario)
);

CREATE TABLE proveedores(
	id_proveedor INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(245),
    cuit VARCHAR(11) UNIQUE,
    domicilio VARCHAR(245),
    contacto VARCHAR(245),
	email VARCHAR(245) UNIQUE,
    telefono VARCHAR(30),
    PRIMARY KEY(id_proveedor)
);

CREATE TABLE estado_pedidos(
	id_estado_pedido INT NOT NULL AUTO_INCREMENT,
    estado_pedido VARCHAR(50),
    PRIMARY KEY(id_estado_pedido)
);

CREATE TABLE pedidos(
	id_pedido INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    id_estado_pedido INT NOT NULL DEFAULT 1,
    fecha_inicio DATE NOT NULL DEFAULT(current_date),
	fecha_entrega DATE,
    cantidad INT NOT NULL,
	precio_unitario DECIMAL(10,2),
    condicion_pago VARCHAR(245),
    observaciones VARCHAR(245),
    PRIMARY KEY(id_pedido)
);

CREATE TABLE estado_items(
	id_estado_item INT NOT NULL AUTO_INCREMENT,
    estado_item VARCHAR(50),
    PRIMARY KEY(id_estado_item)
);

CREATE TABLE items(
	id_item INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_proveedor INT NOT NULL,
    id_usuario INT NOT NULL,
    id_estado_item INT NOT NULL DEFAULT 1,
    detalle VARCHAR(245),
    costo_unitario DECIMAL(10,2),
    PRIMARY KEY(id_item)
);

CREATE TABLE movimiento_pedidos(
	id_movimiento_pedido INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_hora DATETIME DEFAULT(current_timestamp),
    descripcion VARCHAR(245),
    id_estado_pedido INT NOT NULL,
    PRIMARY KEY(id_movimiento_pedido)
);

CREATE TABLE movimiento_items(
	id_movimiento_item INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_hora DATETIME DEFAULT(current_timestamp),
    descripcion VARCHAR(245),
    id_estado_item INT NOT NULL,
    PRIMARY KEY(id_movimiento_item)
);

ALTER TABLE remitos
	ADD CONSTRAINT fk_remito_pedido
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),

    ADD CONSTRAINT fk_remito_usuario
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
    
    ADD CONSTRAINT fk_remito_cliente
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente);
    
ALTER TABLE items_remitos
	ADD CONSTRAINT fk_items_remito_remito
    FOREIGN KEY(id_remito) REFERENCES remitos(id_remito);

ALTER TABLE usuarios
	ADD CONSTRAINT fk_usuarios_roles
    FOREIGN KEY(id_rol) REFERENCES roles_usuarios(id_rol) ;

ALTER TABLE pedidos
	ADD CONSTRAINT fk_pedidos_cliente
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente) ,
    ADD CONSTRAINT fk_pedidos_usuarios
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario) ,
    ADD CONSTRAINT fk_pedidos_esto_pedidos
    FOREIGN KEY(id_estado_pedido) REFERENCES estado_pedidos(id_estado_pedido) ;

ALTER TABLE items
	ADD CONSTRAINT fk_items_pedidos
    FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido) ,
	ADD CONSTRAINT fk_items_proveedores
    FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor) ,	
    ADD CONSTRAINT fk_items_usuarios
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario) ,
	ADD CONSTRAINT fk_items_estado_items
    FOREIGN KEY(id_estado_item) REFERENCES estado_items(id_estado_item) ;

ALTER TABLE movimiento_pedidos
	ADD CONSTRAINT fk_movimiento_pedidos_usuario
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario) ,
	ADD CONSTRAINT fk_movimiento_pedidos_estado
    FOREIGN KEY(id_estado_pedido) REFERENCES estado_pedidos(id_estado_pedido) ;

ALTER TABLE movimiento_items
	ADD CONSTRAINT fk_movimiento_items_usuario
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario) ,
	ADD CONSTRAINT fk_movimiento_items_estado
    FOREIGN KEY(id_estado_item) REFERENCES estado_items(id_estado_item) ;

    