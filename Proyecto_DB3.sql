/*Creacion y Nombre de base de dtos*/
CREATE DATABASE IF NOT EXISTS InventarioDB;
USE InventarioDB;

/*Tablas que se realizaron para las pruebas de Registro, Actualización y Eliminación de Productos etc etc*/
CREATE TABLE Almacenes (
    id_almacen INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    id_almacen INT,
    stock INT NOT NULL CHECK (stock >= 0),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_almacen) REFERENCES Almacenes(id_almacen)
);

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    clave_hash VARCHAR(255) NOT NULL,
    id_rol INT
);

CREATE TABLE Roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

ALTER TABLE Usuarios ADD FOREIGN KEY (id_rol) REFERENCES Roles(id_rol);

-----------------------------------------------------------------------------------------


/*Proceso de almacenado para registro de un producto*/
DELIMITER $$
CREATE PROCEDURE RegistrarProducto(
    IN p_codigo VARCHAR(50),
    IN p_nombre VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    IF EXISTS (SELECT 1 FROM Producto WHERE codigo = p_codigo) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El código de producto ya existe';
    ELSE
        INSERT INTO Producto (codigo, nombre, descripcion, precio) 
        VALUES (p_codigo, p_nombre, p_descripcion, p_precio);
    END IF;
END
DELIMITER $$ ;

/*Actualizar producto*/

DELIMITER $$
CREATE PROCEDURE ActualizarProducto(
    IN p_id_producto INT,
    IN p_nombre VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
    UPDATE Producto 
    SET nombre = p_nombre, descripcion = p_descripcion, precio = p_precio
    WHERE id_producto = p_id_producto;
END
DELIMITER $$ ;

/*Eliminar un producto*/

DELIMITER $$
CREATE PROCEDURE EliminarProducto(
    IN p_id_producto INT
)
BEGIN
    DELETE FROM Producto WHERE id_producto = p_id_producto;
END
DELIMITER $$ ;

/*Agregar Stock*/
DELIMITER $$
CREATE PROCEDURE AgregarStock(
    IN p_id_producto INT,
    IN p_id_almacen INT,
    IN cantidad INT
)
BEGIN
    INSERT INTO Inventario (id_producto, id_almacen, stock)
    VALUES (p_id_producto, p_id_almacen, cantidad)
    ON DUPLICATE KEY UPDATE stock = stock + cantidad;
END
DELIMITER $$;

/*Reducir algo en stock*/
DELIMITER $$
CREATE PROCEDURE ReducirStock(
    IN p_id_producto INT,
    IN p_id_almacen INT,
    IN cantidad INT
)
BEGIN
    UPDATE Inventario 
    SET stock = stock - cantidad
    WHERE id_producto = p_id_producto AND id_almacen = p_id_almacen 
    AND stock >= cantidad;
END 
DELIMITER $$ ;

/*Roles y Usuarios necesarioss*/
DELIMITER $$
CREATE PROCEDURE RegistrarUsuario(
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(255),
    IN p_clave_hash VARCHAR(255),
    IN p_id_rol INT
)
BEGIN
    INSERT INTO Usuarios (nombre, correo, clave_hash, id_rol)
    VALUES (p_nombre, p_correo, p_clave_hash, p_id_rol);
END //
DELIMITER $$ ;


/*Consultas Inventario General*/
SELECT p.codigo, p.nombre, i.stock, p.precio, (i.stock * p.precio) AS valor_total
FROM Inventario i
JOIN Producto p ON i.id_producto = p.id_producto;

/*Reporte producto por almacen*/
SELECT a.nombre AS almacen, p.nombre AS producto, i.stock
FROM Inventario i
JOIN Almacenes a ON i.id_almacen = a.id_almacen
JOIN Producto p ON i.id_producto = p.id_producto
ORDER BY a.nombre;








