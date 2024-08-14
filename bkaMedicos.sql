-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdflask
-- ------------------------------------------------------
-- Server version	8.0.30

drop database if exists pingas;
create database pingas;
use pingas;

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
-- Table structure for table `albums`
--

-- Table structure for table `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosticos` (
  `id_diagnostico` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int DEFAULT NULL,
  `sintomas` text,
  `diagnostico` text,
  `tratamiento` text,
  `estudios` text,
  PRIMARY KEY (`id_diagnostico`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `diagnosticos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `tb_pacientes` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosticos`
--

LOCK TABLES `diagnosticos` WRITE;
/*!40000 ALTER TABLE `diagnosticos` DISABLE KEYS */;
INSERT INTO `diagnosticos` VALUES (1,NULL,'nada','no se ','nada','nada\r\n'),(2,NULL,'sdefr','vfds','tgrf','gvfdc'),(3,NULL,'gfrde','vfcd','freds','gvfrd'),(4,NULL,'gfd','gfd','rfdces','vreds'),(5,NULL,'bgrvfd','btgvrf','ytgrvf','btgvrf'),(6,NULL,'btrgvf','tgrf','ytgr','btgrf');
/*!40000 ALTER TABLE `diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exploraciones`
--

DROP TABLE IF EXISTS `exploraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exploraciones` (
  `id_exploracion` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `temperatura` decimal(5,2) DEFAULT NULL,
  `latidos_x_minuto` int DEFAULT NULL,
  `sox` decimal(5,2) DEFAULT NULL,
  `glucosa` decimal(5,2) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  PRIMARY KEY (`id_exploracion`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `exploraciones_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `tb_pacientes` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exploraciones`
--

LOCK TABLES `exploraciones` WRITE;
/*!40000 ALTER TABLE `exploraciones` DISABLE KEYS */;
INSERT INTO `exploraciones` VALUES (1,2,'2024-08-01',23.00,123.00,29.00,23,45.00,22.00,12),(2,2,'2024-08-02',12.00,123.00,23.00,32,43.00,543.00,12),(3,2,'2024-08-01',23.00,543.00,43.00,43,54.00,43.00,12),(4,2,'2024-08-01',12.00,32.00,43.00,345,33.00,23.00,2),(5,2,'2024-08-02',43.00,23.00,43.00,32,3.00,32.00,23),(6,11,'2024-08-03',12.00,32.00,43.00,43,43.00,32.00,32);
/*!40000 ALTER TABLE `exploraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `id_medico` int DEFAULT NULL,
  `id_paciente` int DEFAULT NULL,
  `id_exploracion` int DEFAULT NULL,
  `id_diagnostico` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_receta`),
  KEY `id_medico` (`id_medico`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_exploracion` (`id_exploracion`),
  KEY `id_diagnostico` (`id_diagnostico`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `tb_medicos` (`id_medico`),
  CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `tb_pacientes` (`id_paciente`),
  CONSTRAINT `recetas_ibfk_3` FOREIGN KEY (`id_exploracion`) REFERENCES `exploraciones` (`id_exploracion`),
  CONSTRAINT `recetas_ibfk_4` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnosticos` (`id_diagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `id_roles` int NOT NULL,
  `cedula` varchar(8) NOT NULL,
  `rfc` varchar(11) NOT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `id_medico_UNIQUE` (`id_medico`),
  KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'pepe','aguilar@upq.edu.mx',2,'3','pepe','scrypt:32768:8:1$fYrVhM52gJJAqUUj$63cf6ae46722d4d592982b0a82e9a0c05cf3cc054fa97d7ca3cb30542f6dddc49ecb2154012f659f54373693c65fa8a471aaa2cef17ec455aa685c841d21fb94'),(2,'baruck','sanchez@gmail.com',2,'1221321','baru','scrypt:32768:8:1$KsATUYNp6RbmwMEW$9ae552b415b2e25656381da2cb0c9909751a460a55d3c07e7b63a159382b10cb10b3487b683a1fd62bd8b2f40dd10905e7c8d12156fa58b95d3e7e25ebc03281'),(7,'lola','lola@upq.edu.mx',2,'2131','2131','scrypt:32768:8:1$NHuLzwfnfEVkqpAY$0932bc18b23860701f7e1992703a57348792e4ea4eba3ca32d789e74473c951df513096a41052ebd735a7a9415c018e3608aa29ee5da185db98e1b8966062f69'),(11,'test','test@hotmail.com',1,'123','test','scrypt:32768:8:1$7keruJZoVE6w1awY$70437a6f2eb13274dbc9e4b6c5eb2646ee363b1b9213de543aa7ca91c68177c7871c4350c7b3529a81a0de562cffb859ed1e35e8eda1ecf44d085ebb80bf5aef'),(13,'regina','regina@gmail.com',2,'34567','regina','scrypt:32768:8:1$HOkdGuHqxjq2X7iP$90c53cd83c8807763955bb9fec0454dda58a53014490cf02b9fb8912f57612f868a30ea57e95f5d13a2519f7e1bb3e69bcd5e2abc650ae8e9461863e7d0a4888');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nombre_med` varchar(45) NOT NULL,
  `paciente` varchar(45) NOT NULL,
  `fecha_nac` date NOT NULL,
  `enfermedades_cronicas` varchar(50) DEFAULT NULL,
  `alergias` varchar(50) DEFAULT NULL,
  `antecedentes_familiares` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `nombre_idx` (`nombre_med`),
  CONSTRAINT `nombre` FOREIGN KEY (`nombre_med`) REFERENCES `tb_medicos` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (2,'test','try','2000-10-10','','',''),(5,'lola','gera','2024-08-10','def','degtr','degtr'),(6,'baruck','jose','2024-08-09','sdefgtr','defgtrh','defrg'),(7,'baruck','pedro','2024-08-01','dfrgt','cfvgtbh','vgth'),(8,'lola','Cristopher Antonio Loyola Martinez','2024-08-02','hgfd','hgfd','gfd'),(9,'regina','angel','2024-08-08','nhgtr','jhgrf','yhgtrf'),(10,'regina','asd','2024-08-10','si','no','no'),(11,'lola','antonio','2024-08-02','no','no','no');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14 10:33:28
