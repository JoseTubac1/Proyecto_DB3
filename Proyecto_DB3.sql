-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_inventarios
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `id_almacen` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  PRIMARY KEY (`id_almacen`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'Almacén Central','Avenida 12, Zona 1, Ciudad Guatemala'),(2,'Almacén Norte','Avenida 6, Zona 2, Ciudad Guatemala'),(3,'Almacén Sur','Calle Real, Zona 3, Ciudad Guatemala'),(4,'Almacén Occidente','Calle 12, Zona 4, Ciudad Guatemala'),(5,'Almacén Este','Avenida 3, Zona 5, Ciudad Guatemala'),(6,'Almacén Las Charcas','Calle 8, Zona 6, Ciudad Guatemala'),(7,'Almacén El Edén','Avenida 7, Zona 7, Ciudad Guatemala'),(8,'Almacén Plaza','Calle 11, Zona 8, Ciudad Guatemala'),(9,'Almacén Santa Fe','Avenida 10, Zona 9, Ciudad Guatemala'),(10,'Almacén Los Pinos','Calle 9, Zona 10, Ciudad Guatemala'),(11,'Almacén Central','Avenida 12, Zona 1, Ciudad Guatemala'),(12,'Almacén Norte','Avenida 6, Zona 2, Ciudad Guatemala'),(13,'Almacén Sur','Calle Real, Zona 3, Ciudad Guatemala'),(14,'Almacén Occidente','Calle 12, Zona 4, Ciudad Guatemala'),(15,'Almacén Este','Avenida 3, Zona 5, Ciudad Guatemala'),(16,'Almacén Las Charcas','Calle 8, Zona 6, Ciudad Guatemala'),(17,'Almacén El Edén','Avenida 7, Zona 7, Ciudad Guatemala'),(18,'Almacén Plaza','Calle 11, Zona 8, Ciudad Guatemala'),(19,'Almacén Santa Fe','Avenida 10, Zona 9, Ciudad Guatemala'),(20,'Almacén Los Pinos','Calle 9, Zona 10, Ciudad Guatemala');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialmodificaciones`
--

DROP TABLE IF EXISTS `historialmodificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialmodificaciones` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `cambio` text NOT NULL,
  `id_producto` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `historialmodificaciones_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historialmodificaciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialmodificaciones`
--

LOCK TABLES `historialmodificaciones` WRITE;
/*!40000 ALTER TABLE `historialmodificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialmodificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio_unitario` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `id_almacen` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_almacen` (`id_almacen`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Producto Actualizado','Nueva descripción',150.00,20,2),(2,'Smartphone Samsung Galaxy S21','Pantalla de 6.2 pulgadas, 128GB almacenamiento',799.99,100,2),(3,'Televisor LG 43\" 4K','Pantalla LED 4K de 43 pulgadas, smart TV',450.00,75,3),(4,'Cámara Canon EOS Rebel T7','Cámara digital SLR con lente 18-55mm',500.00,30,4),(5,'Auriculares Sony WH-1000XM4','Auriculares inalámbricos con cancelación de ruido',350.00,120,5),(6,'Monitor Samsung 24\" Full HD','Monitor LED 24 pulgadas, resolución 1920x1080',200.00,80,6),(7,'Teclado Logitech G Pro','Teclado mecánico para gamers, retroiluminado',120.00,150,7),(8,'Mouse Razer DeathAdder','Mouse para juegos, sensor óptico de 16000 DPI',80.00,200,8),(9,'Smartwatch Apple Watch Series 6','Reloj inteligente con monitoreo de salud',400.00,60,9),(10,'Router TP-Link Archer C7','Router Wi-Fi 5GHz, hasta 1750 Mbps',60.00,95,10),(11,'Producto A','Descripción del Producto A',15.50,100,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `antes_de_actualizar_stock` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El stock no puede ser negativo';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto_detalle`
--

DROP TABLE IF EXISTS `producto_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_detalle` (
  `id_producto` int NOT NULL,
  `descripcion` text,
  `stock` int NOT NULL,
  `id_almacen` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_almacen` (`id_almacen`),
  CONSTRAINT `producto_detalle_ibfk_1` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_detalle`
--

LOCK TABLES `producto_detalle` WRITE;
/*!40000 ALTER TABLE `producto_detalle` DISABLE KEYS */;
INSERT INTO `producto_detalle` VALUES (11,'Descripción del Producto A',100,1);
/*!40000 ALTER TABLE `producto_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_general`
--

DROP TABLE IF EXISTS `producto_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_general` (
  `id_producto` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_general`
--

LOCK TABLES `producto_general` WRITE;
/*!40000 ALTER TABLE `producto_general` DISABLE KEYS */;
INSERT INTO `producto_general` VALUES (11,'Producto A',15.50);
/*!40000 ALTER TABLE `producto_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productosporubicacion`
--

DROP TABLE IF EXISTS `productosporubicacion`;
/*!50001 DROP VIEW IF EXISTS `productosporubicacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productosporubicacion` AS SELECT 
 1 AS `ubicacion`,
 1 AS `producto`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productosvendidos`
--

DROP TABLE IF EXISTS `productosvendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productosvendidos` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_transaccion` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_transaccion` (`id_transaccion`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `productosvendidos_ibfk_1` FOREIGN KEY (`id_transaccion`) REFERENCES `transaccion` (`id_transaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productosvendidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productosvendidos`
--

LOCK TABLES `productosvendidos` WRITE;
/*!40000 ALTER TABLE `productosvendidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productosvendidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reporteinventario`
--

DROP TABLE IF EXISTS `reporteinventario`;
/*!50001 DROP VIEW IF EXISTS `reporteinventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporteinventario` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `stock`,
 1 AS `precio_unitario`,
 1 AS `valor_total`,
 1 AS `almacen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reporteporprecio`
--

DROP TABLE IF EXISTS `reporteporprecio`;
/*!50001 DROP VIEW IF EXISTS `reporteporprecio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporteporprecio` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `precio_unitario`,
 1 AS `stock`,
 1 AS `id_almacen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reporteporubicacion`
--

DROP TABLE IF EXISTS `reporteporubicacion`;
/*!50001 DROP VIEW IF EXISTS `reporteporubicacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reporteporubicacion` AS SELECT 
 1 AS `almacen`,
 1 AS `productos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reportestockbajo`
--

DROP TABLE IF EXISTS `reportestockbajo`;
/*!50001 DROP VIEW IF EXISTS `reportestockbajo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reportestockbajo` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `precio_unitario`,
 1 AS `stock`,
 1 AS `id_almacen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reportetransacciones`
--

DROP TABLE IF EXISTS `reportetransacciones`;
/*!50001 DROP VIEW IF EXISTS `reportetransacciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reportetransacciones` AS SELECT 
 1 AS `id_venta`,
 1 AS `producto`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `valor_total`,
 1 AS `id_transaccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (2,'2025-03-02 11:30:00',300.00,2),(3,'2025-03-03 12:15:00',500.00,3),(4,'2025-03-04 14:00:00',150.00,4),(5,'2025-03-05 09:45:00',250.00,5),(6,'2025-03-06 13:00:00',120.00,6),(7,'2025-03-07 16:30:00',100.00,7),(8,'2025-03-08 17:45:00',450.00,8),(9,'2025-03-09 08:00:00',350.00,9),(10,'2025-03-10 19:00:00',400.00,10);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccionparticionada`
--

DROP TABLE IF EXISTS `transaccionparticionada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccionparticionada` (
  `id_transaccion` int NOT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_transaccion`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
/*!50100 PARTITION BY RANGE (month(`fecha`))
(PARTITION p_enero VALUES LESS THAN (2) ENGINE = InnoDB,
 PARTITION p_febrero VALUES LESS THAN (3) ENGINE = InnoDB,
 PARTITION p_marzo VALUES LESS THAN (4) ENGINE = InnoDB,
 PARTITION p_abril VALUES LESS THAN (5) ENGINE = InnoDB,
 PARTITION p_mayo VALUES LESS THAN (6) ENGINE = InnoDB,
 PARTITION p_junio VALUES LESS THAN (7) ENGINE = InnoDB,
 PARTITION p_julio VALUES LESS THAN (8) ENGINE = InnoDB,
 PARTITION p_agosto VALUES LESS THAN (9) ENGINE = InnoDB,
 PARTITION p_septiembre VALUES LESS THAN (10) ENGINE = InnoDB,
 PARTITION p_octubre VALUES LESS THAN (11) ENGINE = InnoDB,
 PARTITION p_noviembre VALUES LESS THAN (12) ENGINE = InnoDB,
 PARTITION p_diciembre VALUES LESS THAN (13) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccionparticionada`
--

LOCK TABLES `transaccionparticionada` WRITE;
/*!40000 ALTER TABLE `transaccionparticionada` DISABLE KEYS */;
INSERT INTO `transaccionparticionada` VALUES (1,'2025-03-01 10:00:00',200.00,1),(2,'2025-03-02 11:30:00',300.00,2),(3,'2025-03-03 12:15:00',500.00,3),(4,'2025-03-04 14:00:00',150.00,4),(5,'2025-03-05 09:45:00',250.00,5),(6,'2025-03-06 13:00:00',120.00,6),(7,'2025-03-07 16:30:00',100.00,7),(8,'2025-03-08 17:45:00',450.00,8),(9,'2025-03-09 08:00:00',350.00,9),(10,'2025-03-10 19:00:00',400.00,10);
/*!40000 ALTER TABLE `transaccionparticionada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rol` enum('admin','operador') NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'Operador 1','operador'),(3,'Operador 2','operador'),(4,'Admin 2','admin'),(5,'Operador 3','operador'),(6,'Operador 4','operador'),(7,'Admin 3','admin'),(8,'Operador 5','operador'),(9,'Operador 6','operador'),(10,'Admin 4','admin'),(11,'Juan Pérez','operador'),(12,'Admin User','admin'),(13,'Operador 1','operador'),(14,'Operador 2','operador'),(15,'Admin 2','admin'),(16,'Operador 3','operador'),(17,'Operador 4','operador'),(18,'Admin 3','admin'),(19,'Operador 5','operador'),(20,'Operador 6','operador'),(21,'Admin 4','admin');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gestion_inventarios'
--

--
-- Dumping routines for database 'gestion_inventarios'
--
/*!50003 DROP PROCEDURE IF EXISTS `AgregarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarStock`(IN producto_id INT, IN cantidad INT)
BEGIN
    UPDATE Producto
    SET stock = stock + cantidad
    WHERE id_producto = producto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_producto`(
    IN p_nombre VARCHAR(100),
    IN p_descripcion LONGTEXT,
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_id_almacen INT
)
BEGIN
    INSERT INTO Producto (nombre, descripcion, precio_unitario, stock, id_almacen)
    VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_id_almacen);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `productosporubicacion`
--

/*!50001 DROP VIEW IF EXISTS `productosporubicacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productosporubicacion` AS select `a`.`nombre` AS `ubicacion`,`p`.`nombre` AS `producto`,`p`.`stock` AS `stock` from (`producto` `p` join `almacen` `a` on((`p`.`id_almacen` = `a`.`id_almacen`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reporteinventario`
--

/*!50001 DROP VIEW IF EXISTS `reporteinventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporteinventario` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre`,`p`.`stock` AS `stock`,`p`.`precio_unitario` AS `precio_unitario`,(`p`.`stock` * `p`.`precio_unitario`) AS `valor_total`,`a`.`nombre` AS `almacen` from (`producto` `p` join `almacen` `a` on((`p`.`id_almacen` = `a`.`id_almacen`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reporteporprecio`
--

/*!50001 DROP VIEW IF EXISTS `reporteporprecio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporteporprecio` AS select `producto`.`id_producto` AS `id_producto`,`producto`.`nombre` AS `nombre`,`producto`.`descripcion` AS `descripcion`,`producto`.`precio_unitario` AS `precio_unitario`,`producto`.`stock` AS `stock`,`producto`.`id_almacen` AS `id_almacen` from `producto` where (`producto`.`precio_unitario` between 100 and 500) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reporteporubicacion`
--

/*!50001 DROP VIEW IF EXISTS `reporteporubicacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reporteporubicacion` AS select `a`.`nombre` AS `almacen`,group_concat(`p`.`nombre` separator ', ') AS `productos` from (`producto` `p` join `almacen` `a` on((`p`.`id_almacen` = `a`.`id_almacen`))) group by `a`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reportestockbajo`
--

/*!50001 DROP VIEW IF EXISTS `reportestockbajo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reportestockbajo` AS select `producto`.`id_producto` AS `id_producto`,`producto`.`nombre` AS `nombre`,`producto`.`descripcion` AS `descripcion`,`producto`.`precio_unitario` AS `precio_unitario`,`producto`.`stock` AS `stock`,`producto`.`id_almacen` AS `id_almacen` from `producto` where (`producto`.`stock` < 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reportetransacciones`
--

/*!50001 DROP VIEW IF EXISTS `reportetransacciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reportetransacciones` AS select `v`.`id_venta` AS `id_venta`,`p`.`nombre` AS `producto`,`v`.`cantidad` AS `cantidad`,`v`.`precio_unitario` AS `precio_unitario`,(`v`.`cantidad` * `v`.`precio_unitario`) AS `valor_total`,`v`.`id_transaccion` AS `id_transaccion` from (`productosvendidos` `v` join `producto` `p` on((`v`.`id_producto` = `p`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-08  0:58:32
