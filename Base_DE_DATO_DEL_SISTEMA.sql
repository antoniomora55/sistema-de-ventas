CREATE DATABASE  IF NOT EXISTS `mi_sistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mi_sistema`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: mi_sistema
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez','Calle Falsa 123, Ciudad','1234567890','juan.perez@example.com','2025-04-01 00:52:01'),(2,'María','Gómez','Avenida Principal 456, Pueblo','9876543210','maria.gomez@example.com','2025-04-01 00:52:01'),(3,'Carlos','juares','alvaro obregon,i1i4','1234567','Carlos@gmail.com','2020-02-01 00:52:01');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` int unsigned NOT NULL,
  `cantidad` int NOT NULL DEFAULT '0',
  `fecha_ultima_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inventario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,50,'2025-04-01 00:52:01'),(2,2,100,'2025-04-01 00:52:01'),(3,3,75,'2025-04-01 00:52:01'),(4,4,120,'2025-04-01 00:52:01');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelacceso`
--

DROP TABLE IF EXISTS `nivelacceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivelacceso` (
  `id_nivel` int NOT NULL,
  `nombre_nivel` varchar(255) NOT NULL,
  `permisos` text,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelacceso`
--

LOCK TABLES `nivelacceso` WRITE;
/*!40000 ALTER TABLE `nivelacceso` DISABLE KEYS */;
INSERT INTO `nivelacceso` VALUES (1,'Administrador','Acceso total'),(2,'Gerente','Acceso a ventas, inventario y clientes'),(3,'Vendedor','Acceso a ventas y clientes'),(4,'Inventario','Acceso a inventario');
/*!40000 ALTER TABLE `nivelacceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int unsigned DEFAULT NULL,
  `id_producto` int unsigned DEFAULT NULL,
  `costo_pedido` varchar(255) DEFAULT NULL,
  `fecha_pedido` date NOT NULL,
  `estado` varchar(50) NOT NULL,
  `direccion_envio` varchar(255) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_cliente` (`id_cliente`),
  KEY `fk_producto` (`id_producto`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,1,'150.00','2025-04-01','en camino','123 Calle Principal, Córdoba, Veracruz','2025-04-01'),(2,2,2,'200.00','2025-04-02','enviado','456 Avenida Secundaria, Córdoba, Veracruz','2025-04-06'),(3,3,3,'300.00','2025-04-03','entregado','789 Boulevard Tercero, Córdoba, Veracruz','2025-04-07'),(4,2,3,'250.00','2025-04-04','pendiente','1010 Calle Cuarta, Córdoba, Veracruz','2025-04-08'),(5,2,2,'350.00','2025-04-05','enviado','1111 Avenida Quinta, Orizaba, Veracruz','2025-04-05');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_p` varchar(255) NOT NULL,
  `descripcion_p` text NOT NULL,
  `precio_p` decimal(10,2) NOT NULL,
  `id_proveedor_p` int unsigned NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `productos_ibfk_1` (`id_proveedor_p`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor_p`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop Dell XPS 13','Laptop ultrabook de 13 pulgadas',1200.00,1,'2025-04-01 00:52:01',43),(2,'Monitor LG 27\"','Monitor IPS de 27 pulgadas, resolución 4K',350.50,1,'2025-04-01 00:52:01',35),(3,'Teclado Mecánico Logitech','Teclado mecánico con retroiluminación RGB',150.75,2,'2025-04-01 00:52:01',37),(4,'Mouse Inalámbrico ASUS','Mouse inalámbrico para gaming',80.99,2,'2024-01-08 09:03:05',44);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor A','Ana Rodríguez','5551234567','proveedora@example.com'),(2,'Proveedor B','Pedro Martínez','5559876543','proveedorb@example.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_nivel` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivelacceso` (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','contrasena_admin',1,'correo1@ejemplo.com'),(2,'gerente1','contrasena_gerente1',2,'correo2@ejemplo.com'),(3,'martin','12q34',2,'example@correo.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` int unsigned NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha_venta` varchar(255) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,1200.00,1200.00,1,'2025-03-31 18:52:01'),(2,2,1,350.50,350.50,2,'2025-03-31 18:52:01'),(3,3,1,150.75,75.38,3,'2025-03-31 18:52:01'),(4,4,1,80.99,80.99,1,'2025-03-31 18:52:01');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-09  8:22:06
