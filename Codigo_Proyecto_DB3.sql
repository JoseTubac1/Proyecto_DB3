-- MySQL Script generated by MySQL Workbench
-- Sun Mar 16 16:58:28 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Creación de la base de datos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gestion_inventarios`;
CREATE SCHEMA IF NOT EXISTS `gestion_inventarios` DEFAULT CHARACTER SET utf8;
USE `gestion_inventarios`;

-- -----------------------------------------------------
-- Tabla: Almacén
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Almacen` (
  `id_almacen` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` TEXT NOT NULL
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Producto` (
  `id_producto` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `stock` INT NOT NULL,
  `id_almacen` INT NOT NULL,
  FOREIGN KEY (`id_almacen`) REFERENCES `Almacen` (`id_almacen`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario` (
  `id_usuario` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(100) NOT NULL,
  `rol` ENUM('admin', 'operador') NOT NULL
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Transacción
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Transaccion` (
  `id_transaccion` INT AUTO_INCREMENT PRIMARY KEY,
  `fecha` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `total` DECIMAL(10,2) NOT NULL,
  `id_usuario` INT NOT NULL,
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Productos Vendidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProductosVendidos` (
  `id_venta` INT AUTO_INCREMENT PRIMARY KEY,
  `cantidad` INT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  `id_transaccion` INT NOT NULL,
  `id_producto` INT NOT NULL,
  FOREIGN KEY (`id_transaccion`) REFERENCES `Transaccion` (`id_transaccion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id_producto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Historial de Modificaciones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HistorialModificaciones` (
  `id_historial` INT AUTO_INCREMENT PRIMARY KEY,
  `fecha` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `cambio` TEXT NOT NULL,
  `id_producto` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id_producto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

SHOW TABLES FROM gestion_inventarios;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Algunos Registros

INSERT INTO Almacen (nombre, direccion) VALUES
('Almacén Central', 'Avenida 12, Zona 1, Ciudad Guatemala'),
('Almacén Norte', 'Avenida 6, Zona 2, Ciudad Guatemala'),
('Almacén Sur', 'Calle Real, Zona 3, Ciudad Guatemala'),
('Almacén Occidente', 'Calle 12, Zona 4, Ciudad Guatemala'),
('Almacén Este', 'Avenida 3, Zona 5, Ciudad Guatemala'),
('Almacén Las Charcas', 'Calle 8, Zona 6, Ciudad Guatemala'),
('Almacén El Edén', 'Avenida 7, Zona 7, Ciudad Guatemala'),
('Almacén Plaza', 'Calle 11, Zona 8, Ciudad Guatemala'),
('Almacén Santa Fe', 'Avenida 10, Zona 9, Ciudad Guatemala'),
('Almacén Los Pinos', 'Calle 9, Zona 10, Ciudad Guatemala');

INSERT INTO Producto (id_producto, nombre, descripcion, precio_unitario, stock, id_almacen) VALUES
(1,'Laptop Dell Inspiron', 'Laptop de 15.6 pulgadas, 8GB RAM, 512GB SSD', 650.00, 50, 1),
(2,'Smartphone Samsung Galaxy S21', 'Pantalla de 6.2 pulgadas, 128GB almacenamiento', 799.99, 100, 2),
(3,'Televisor LG 43" 4K', 'Pantalla LED 4K de 43 pulgadas, smart TV', 450.00, 75, 3),
(4,'Cámara Canon EOS Rebel T7', 'Cámara digital SLR con lente 18-55mm', 500.00, 30, 4),
(5,'Auriculares Sony WH-1000XM4', 'Auriculares inalámbricos con cancelación de ruido', 350.00, 120, 5),
(6,'Monitor Samsung 24" Full HD', 'Monitor LED 24 pulgadas, resolución 1920x1080', 200.00, 80, 6),
(7,'Teclado Logitech G Pro', 'Teclado mecánico para gamers, retroiluminado', 120.00, 150, 7),
(8,'Mouse Razer DeathAdder', 'Mouse para juegos, sensor óptico de 16000 DPI', 80.00, 200, 8),
(9,'Smartwatch Apple Watch Series 6', 'Reloj inteligente con monitoreo de salud', 400.00, 60, 9),
(10,'Router TP-Link Archer C7', 'Router Wi-Fi 5GHz, hasta 1750 Mbps', 60.00, 95, 10);

INSERT INTO Usuario (nombre, rol) VALUES
('Admin User', 'admin'),
('Operador 1', 'operador'),
('Operador 2', 'operador'),
('Admin 2', 'admin'),
('Operador 3', 'operador'),
('Operador 4', 'operador'),
('Admin 3', 'admin'),
('Operador 5', 'operador'),
('Operador 6', 'operador'),
('Admin 4', 'admin');

INSERT INTO Transaccion (fecha, total, id_usuario) VALUES
('2025-03-01 10:00:00', 200.00, 1),
('2025-03-02 11:30:00', 300.00, 2),
('2025-03-03 12:15:00', 500.00, 3),
('2025-03-04 14:00:00', 150.00, 4),
('2025-03-05 09:45:00', 250.00, 5),
('2025-03-06 13:00:00', 120.00, 6),
('2025-03-07 16:30:00', 100.00, 7),
('2025-03-08 17:45:00', 450.00, 8),
('2025-03-09 08:00:00', 350.00, 9),
('2025-03-10 19:00:00', 400.00, 10);

INSERT INTO ProductosVendidos (cantidad, precio_unitario, id_transaccion, id_producto) VALUES
(2, 15.50, 1, 1),
(5, 25.75, 2, 2),
(3, 5.99, 3, 3),
(1, 19.99, 4, 4),
(10, 30.00, 5, 5),
(6, 9.99, 6, 6),
(4, 13.49, 7, 7),
(8, 22.00, 8, 8),
(3, 17.50, 9, 9),
(7, 12.50, 10, 10);

INSERT INTO HistorialModificaciones (fecha, cambio, id_producto, id_usuario) VALUES
('2025-03-01 10:00:00', 'Se actualizó el precio a 16.00', 1, 1),
('2025-03-02 11:30:00', 'Se cambió la descripción', 2, 2),
('2025-03-03 12:15:00', 'Se añadió nuevo stock de 50 unidades', 3, 3),
('2025-03-04 14:00:00', 'Se actualizó el nombre a Producto D Actualizado', 4, 4),
('2025-03-05 09:45:00', 'Se aumentó el stock a 200 unidades', 5, 5),
('2025-03-06 13:00:00', 'Se cambió el precio a 10.99', 6, 6),
('2025-03-07 16:30:00', 'Se actualizó la ubicación del producto', 7, 7),
('2025-03-08 17:45:00', 'Se cambió el nombre y la descripción', 8, 8),
('2025-03-09 08:00:00', 'Se actualizó el precio a 20.00', 9, 9),
('2025-03-10 19:00:00', 'Se añadió nuevo stock de 100 unidades', 10, 10);

DELETE FROM Producto;

SHOW TABLES FROM gestion_inventarios;
SELECT * FROM Transaccion;
SELECT * FROM Producto;
SELECT * FROM ProductosVendidos;
SELECT * FROM HistorialModificaciones;
SELECT * FROM Usuario;
SELECT * FROM Almacen;

-- Algunos procedimientos 

-- Registrar Producto 
DELIMITER $$
CREATE PROCEDURE registrar_producto(
    IN p_nombre VARCHAR(100),
    IN p_descripcion LONGTEXT,
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_id_almacen INT
)
BEGIN
    INSERT INTO Producto (nombre, descripcion, precio_unitario, stock, id_almacen)
    VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_id_almacen);
END $$
DELIMITER ;

-- Tigger para evitar que el stock sea negativo 
DELIMITER $$
CREATE TRIGGER antes_de_actualizar_stock
BEFORE UPDATE ON Producto
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;
END $$
DELIMITER ;

-- Registro de nuevo productos 

INSERT INTO Producto (nombre, descripcion, precio_unitario, stock, id_almacen)
VALUES ('Producto A', 'Descripción del Producto A', 15.50, 100, 1);


-- Actualización de un producto existente
UPDATE Producto
SET nombre = 'Producto A Actualizado', stock = 150
WHERE id_producto = 1;

-- Eliminación de un producto
DELETE FROM Producto
WHERE id_producto = 1;


-- Disminuir stock cuando se realiza una venta
UPDATE Producto
SET stock = stock - 1
WHERE id_producto = 1;

-- Ver el inventario (stock) de todos los productos
SELECT id_producto, nombre, stock
FROM Producto;


-- Registro de un nuevo usuario
INSERT INTO Usuario (nombre, rol)
VALUES ('Juan Pérez', 'operador');

-- Actualización del rol de un usuario
UPDATE Usuario
SET rol = 'admin'
WHERE id_usuario = 1;

-- Eliminación de un usuario
DELETE FROM Usuario
WHERE id_usuario = 1;

-- Reporte de inventario general
SELECT p.id_producto, p.nombre, p.stock, p.precio_unitario, (p.stock * p.precio_unitario) AS valor_total
FROM Producto p;

-- Reporte de productos por almacén
SELECT p.id_producto, p.nombre AS producto, p.stock, a.nombre AS almacen
FROM Producto p
JOIN Almacen a ON p.id_almacen = a.id_almacen
ORDER BY a.nombre, p.nombre;  -- Ordenar primero por almacén y luego por producto


-- Crear una función almacenada para agregar stock
DELIMITER $$
CREATE PROCEDURE AgregarStock(IN producto_id INT, IN cantidad INT)
BEGIN
    UPDATE Producto
    SET stock = stock + cantidad
    WHERE id_producto = producto_id;
END $$
DELIMITER ;

-- Llamar a la función para agregar stock
CALL AgregarStock(1, 50);  -- Agregar 50 unidades al producto con id_producto = 1



-- Partición Horizontal
CREATE TABLE TransaccionParticionada (
    id_transaccion INT NOT NULL,
    fecha DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_transaccion, fecha)
)
PARTITION BY RANGE (MONTH(fecha)) (
    PARTITION p_enero VALUES LESS THAN (2),
    PARTITION p_febrero VALUES LESS THAN (3),
    PARTITION p_marzo VALUES LESS THAN (4),
    PARTITION p_abril VALUES LESS THAN (5),
    PARTITION p_mayo VALUES LESS THAN (6),
    PARTITION p_junio VALUES LESS THAN (7),
    PARTITION p_julio VALUES LESS THAN (8),
    PARTITION p_agosto VALUES LESS THAN (9),
    PARTITION p_septiembre VALUES LESS THAN (10),
    PARTITION p_octubre VALUES LESS THAN (11),
    PARTITION p_noviembre VALUES LESS THAN (12),
    PARTITION p_diciembre VALUES LESS THAN (13)
);

INSERT INTO TransaccionParticionada (id_transaccion, fecha, total, id_usuario) VALUES
(1, '2025-03-01 10:00:00', 200.00, 1),
(2, '2025-03-02 11:30:00', 300.00, 2),
(3, '2025-03-03 12:15:00', 500.00, 3),
(4, '2025-03-04 14:00:00', 150.00, 4),
(5, '2025-03-05 09:45:00', 250.00, 5),
(6, '2025-03-06 13:00:00', 120.00, 6),
(7, '2025-03-07 16:30:00', 100.00, 7),
(8, '2025-03-08 17:45:00', 450.00, 8),
(9, '2025-03-09 08:00:00', 350.00, 9),
(10, '2025-03-10 19:00:00', 400.00, 10);

SELECT *
FROM TransaccionParticionada
WHERE MONTH(fecha) = 3;

SELECT *, PARTITION_NAME
FROM information_schema.partitions
WHERE TABLE_NAME = 'TransaccionParticionada'
AND TABLE_SCHEMA = 'gestion_inventarios';


-- Partición Vertical
CREATE TABLE Producto_General (
  id_producto INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Producto_Detalle (
  id_producto INT PRIMARY KEY,
  descripcion TEXT,
  stock INT NOT NULL,
  id_almacen INT,
  FOREIGN KEY (id_almacen) REFERENCES Almacen(id_almacen)
);

INSERT INTO Producto_General (id_producto, nombre, precio_unitario)
SELECT id_producto, nombre, precio_unitario FROM Producto;

INSERT INTO Producto_Detalle (id_producto, descripcion, stock, id_almacen)
SELECT id_producto, descripcion, stock, id_almacen FROM Producto;
/*
OPCIONAL SI SE QUIERE ELIMINAR LA TABLA ORIGINAL
DROP TABLE Producto;
*/
SELECT 
  pg.id_producto,
  pg.nombre,
  pg.precio_unitario,
  pd.descripcion,
  pd.stock,
  pd.id_almacen
FROM 
  Producto_General pg
JOIN 
  Producto_Detalle pd ON pg.id_producto = pd.id_producto;



-- Replica
CREATE USER 'replicator'@'%' IDENTIFIED BY 'replicator_password';
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
FLUSH PRIVILEGES;

-- Verificar estado del binlog
SHOW MASTER STATUS;

/* Queda pendiente la replica o se puede hacer de la siguiente manera:

	En el servidor maestro, puedes generar un volcado (dump) de la base de datos con el siguiente comando:
    mysqldump -u usuario -p gestion_inventarios > backup.sql

	Luego, en el servidor esclavo (o en otro servidor), puedes restaurar la base de datos:
    mysql -u usuario -p gestion_inventarios < backup.sql

*/


-- Reporte de las transacciones por cada usuario
SELECT 
    t.id_transaccion, 
    t.fecha, 
    t.total, 
    u.nombre AS usuario
FROM 
    Transaccion t
JOIN 
    Usuario u ON t.id_usuario = u.id_usuario
WHERE 
    t.fecha BETWEEN '2025-03-01' AND '2025-03-10'
    AND t.total > 100
ORDER BY 
    t.fecha DESC;
    
-- Vista de reporte agrupado que muestra el total de ventas por usuario
CREATE VIEW reporte_ventas_por_usuario AS
SELECT 
    u.nombre AS usuario, 
    SUM(t.total) AS total_ventas
FROM 
    Transaccion t
JOIN 
    Usuario u ON t.id_usuario = u.id_usuario
GROUP BY 
    u.id_usuario
ORDER BY 
    total_ventas DESC;

SELECT * FROM reporte_ventas_por_usuario;


-- Reporte de Productos vendidos
SELECT 
    p.nombre AS producto, 
    SUM(pv.cantidad) AS total_vendido
FROM 
    Producto p
JOIN 
    ProductosVendidos pv ON p.id_producto = pv.id_producto
GROUP BY 
    p.id_producto
ORDER BY 
    total_vendido DESC;


-- GESTION DE USUARIOS Y SEGURIDAD

CREATE TABLE IF NOT EXISTS `Roles` (
  `id_rol` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Permisos` (
  `id_permiso` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Roles_Permisos` (
  `id_rol` INT,
  `id_permiso` INT,
  PRIMARY KEY (`id_rol`, `id_permiso`),
  FOREIGN KEY (`id_rol`) REFERENCES `Roles`(`id_rol`) ON DELETE CASCADE,
  FOREIGN KEY (`id_permiso`) REFERENCES `Permisos`(`id_permiso`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Crear tabla de Usuarios con referencia a Roles
ALTER TABLE `Usuario` ADD COLUMN `id_rol` INT NOT NULL;

SELECT DISTINCT `id_rol`
FROM `Usuario`
WHERE `id_rol` NOT IN (SELECT `id_rol` FROM `Roles`);

DELETE FROM `Usuario`
WHERE `id_rol` NOT IN (SELECT `id_rol` FROM `Roles`);

ALTER TABLE `Usuario`
ADD FOREIGN KEY (`id_rol`) REFERENCES `Roles`(`id_rol`) ON DELETE CASCADE;


INSERT INTO `Roles` (nombre) VALUES
('Administrador'),
('Vendedor'),
('Supervisor');

INSERT INTO `Permisos` (nombre) VALUES
('Crear Producto'),
('Actualizar Producto'),
('Eliminar Producto'),
('Ver Reportes'),
('Gestionar Usuarios');


-- Asignar permisos al rol Administrador
INSERT INTO `Roles_Permisos` (id_rol, id_permiso) VALUES
(1, 1), -- Crear Producto
(1, 2), -- Actualizar Producto
(1, 3), -- Eliminar Producto
(1, 4), -- Ver Reportes
(1, 5); -- Gestionar Usuarios

-- Asignar permisos al rol Vendedor
INSERT INTO `Roles_Permisos` (id_rol, id_permiso) VALUES
(2, 4); -- Ver Reportes

-- Asignar permisos al rol Supervisor
INSERT INTO `Roles_Permisos` (id_rol, id_permiso) VALUES
(3, 1), -- Crear Producto
(3, 2), -- Actualizar Producto
(3, 4); -- Ver Reportes

-- Verificar los roles y permisos
SELECT r.nombre AS rol, p.nombre AS permiso
FROM `Roles` r
JOIN `Roles_Permisos` rp ON r.id_rol = rp.id_rol
JOIN `Permisos` p ON rp.id_permiso = p.id_permiso
WHERE r.nombre = 'Administrador'; 

SELECT r.nombre AS rol, p.nombre AS permiso
FROM `Roles` r
JOIN `Roles_Permisos` rp ON r.id_rol = rp.id_rol
JOIN `Permisos` p ON rp.id_permiso = p.id_permiso
WHERE r.nombre = 'Vendedor'; 

SELECT r.nombre AS rol, p.nombre AS permiso
FROM `Roles` r
JOIN `Roles_Permisos` rp ON r.id_rol = rp.id_rol
JOIN `Permisos` p ON rp.id_permiso = p.id_permiso
WHERE r.nombre = 'Supervisor'; 


-- Asignar rol de Administrador a un usuario con id_usuario = 1
UPDATE `Usuario`
SET `id_rol` = 1
WHERE `id_usuario` = 1;

-- Asignar rol de Vendedor a un usuario con id_usuario = 2
UPDATE `Usuario`
SET `id_rol` = 2
WHERE `id_usuario` = 2;




