const mongoose = require('mongoose');

const transaccionSchema = new mongoose.Schema({
  productoId: { type: Number, required: true },
  cantidad: { type: Number, required: true },
  tipo: { type: String, enum: ['compra', 'venta'], required: true },
  fecha: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Transaccion', transaccionSchema);