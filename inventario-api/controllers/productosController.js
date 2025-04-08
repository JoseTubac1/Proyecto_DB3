const db = require('../config/mysql'); // Conexión a la base de datos MySQL
const HistorialCambio = require('../models/HistorialCambio'); // Modelo de MongoDB para registrar historial de cambios
const express = require('express'); // Framework para manejar solicitudes HTTP

// Registrar producto
exports.crearProducto = async (req, res) => {
  try {
    // Extraer datos del cuerpo de la solicitud
    const { nombre, descripcion, precio_unitario, stock, id_almacen } = req.body;

    // Insertar un nuevo producto en la base de datos MySQL
    const [result] = await db.query('INSERT INTO producto (nombre, descripcion, precio_unitario, stock, id_almacen) VALUES (?, ?, ?, ?, ?)', [nombre, descripcion, precio_unitario, stock, id_almacen]);

    // Responder con los datos del producto creado
    res.status(201).json({ id: result.insertId, nombre, descripcion, precio_unitario, stock, id_almacen });
  } catch (error) {
    console.error(error); // Registrar error en consola
    res.status(500).json({ error: 'Error al crear producto' }); // Responder con error
  }
}

// Actualizar producto
exports.actualizarProducto = async (req, res) => {
  try {
    const { id } = req.params; // Obtener ID del producto desde los parámetros de la URL
    const { nombre, descripcion, precio_unitario, stock, id_almacen } = req.body; // Datos del cuerpo de la solicitud

    // Validar que los campos requeridos no sean null o undefined
    if (!nombre || !descripcion || !precio_unitario || !stock || !id_almacen) {
      return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    // Obtener el producto actual desde la base de datos MySQL
    const [productoActual] = await db.query('SELECT * FROM producto WHERE id_producto = ?', [id]);
    if (productoActual.length === 0) {
      return res.status(404).json({ error: 'Producto no encontrado' }); // Producto no existe
    }

    // Actualizar el producto en la base de datos MySQL
    const [result] = await db.query(
      'UPDATE producto SET nombre = ?, descripcion = ?, precio_unitario = ?, stock = ?, id_almacen = ? WHERE id_producto = ?',
      [nombre, descripcion, precio_unitario, stock, id_almacen, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Producto no encontrado' }); // Producto no encontrado para actualizar
    }

    // Registrar los cambios en MongoDB
    const cambios = {};
    for (const campo in req.body) {
      if (req.body[campo] !== productoActual[0][campo]) {
        cambios[campo] = { anterior: productoActual[0][campo], nuevo: req.body[campo] }; // Registrar cambios
      }
    }

    if (Object.keys(cambios).length > 0) {
      const historial = new HistorialCambio({
        productoId: id, // ID del producto
        cambios, // Detalles de los cambios
      });
      await historial.save(); // Guardar el historial en MongoDB
    }

    // Responder con éxito
    res.json({ mensaje: 'Producto actualizado correctamente', id, nombre, descripcion, precio_unitario, stock, id_almacen });
  } catch (error) {
    console.error(error); // Registrar error en consola
    res.status(500).json({ error: 'Error al actualizar producto' }); // Responder con error
  }
};

// Eliminar producto
exports.eliminarProducto = async (req, res) => {
  try {
    const { id } = req.params; // Obtener ID del producto desde los parámetros de la URL

    // Eliminar el producto de la base de datos MySQL
    const [result] = await db.query('DELETE FROM producto WHERE id_producto = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Producto no encontrado' }); // Producto no existe
    }

    res.status(204).send(); // Responder con éxito sin contenido
  } catch (error) {
    console.error(error); // Registrar error en consola
    res.status(500).json({ error: 'Error al eliminar producto' }); // Responder con error
  }
}

// Obtener un producto por ID
exports.obtenerProductoPorId = async (req, res) => {
  try {
    const { id } = req.params; // Obtener ID del producto desde los parámetros de la URL

    // Consultar el producto en la base de datos MySQL
    const [rows] = await db.query('SELECT * FROM producto WHERE id_producto = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ error: 'Producto no encontrado' }); // Producto no existe
    }

    res.json(rows[0]); // Responder con los datos del producto
  } catch (error) {
    console.error(error); // Registrar error en consola
    res.status(500).json({ error: 'Error al obtener producto' }); // Responder con error
  }
}
