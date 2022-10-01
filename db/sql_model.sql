-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: institudb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreras` (
  `ID_CARRERA` int NOT NULL,
  `COD_CARRERA` varchar(20) DEFAULT NULL,
  `NOM_CARRERA` varchar(100) DEFAULT NULL,
  `FEC_INICIO_VIGENCIA` date DEFAULT NULL,
  `FEC_FIN_VIGENCIA` date DEFAULT NULL,
  PRIMARY KEY (`ID_CARRERA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'101','DIPLOMADO WEB','2022-01-15','2022-12-01'),(2,'102','DIPLOMADO PHP','2022-01-15','2022-12-01');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos_pago`
--

DROP TABLE IF EXISTS `conceptos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conceptos_pago` (
  `ID_CONCEPTO_PAGO` int NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_CONCEPTO_PAGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos_pago`
--

LOCK TABLES `conceptos_pago` WRITE;
/*!40000 ALTER TABLE `conceptos_pago` DISABLE KEYS */;
INSERT INTO `conceptos_pago` VALUES (1,'MATRICULA'),(2,'SEGURO');
/*!40000 ALTER TABLE `conceptos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `ID_ESTUDIANTE` int NOT NULL,
  `PRIMER_NOMBRE` varchar(50) DEFAULT NULL,
  `SEGUNDO_NOMBRE` varchar(50) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(50) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTUDIANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'YOHEIRA',NULL,'QUINTERO','CANIZARES'),(2,'MARIA','CAMILA','LOPEZ','LEMUS'),(3,'MARIA2','CAMILA2','LOPEZ2','LEMUS2');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_pago`
--

DROP TABLE IF EXISTS `items_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_pago` (
  `ID_ITEM_PAGO` int NOT NULL,
  `ID_PAGO` int DEFAULT NULL,
  `ID_CONCEPTO_PAGO` int DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `VALOR` double DEFAULT NULL,
  PRIMARY KEY (`ID_ITEM_PAGO`),
  KEY `FK_ITEM_PAGO_PAGO` (`ID_PAGO`),
  KEY `FK_ITEM_PAGO_CONCEPTO` (`ID_CONCEPTO_PAGO`),
  CONSTRAINT `FK_ITEM_PAGO_CONCEPTO` FOREIGN KEY (`ID_CONCEPTO_PAGO`) REFERENCES `conceptos_pago` (`ID_CONCEPTO_PAGO`),
  CONSTRAINT `FK_ITEM_PAGO_PAGO` FOREIGN KEY (`ID_PAGO`) REFERENCES `pagos` (`ID_PAGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_pago`
--

LOCK TABLES `items_pago` WRITE;
/*!40000 ALTER TABLE `items_pago` DISABLE KEYS */;
INSERT INTO `items_pago` VALUES (1,1,1,'MATRICULA',2000000),(2,1,2,'SEGURO',150000);
/*!40000 ALTER TABLE `items_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matriculas` (
  `ID_MATRICULA` int NOT NULL,
  `ID_CARRERA` int NOT NULL,
  `ID_PERIODO` int DEFAULT NULL,
  `ID_ESTUDIANTE` int DEFAULT NULL,
  `VALOR` double DEFAULT NULL,
  PRIMARY KEY (`ID_MATRICULA`),
  KEY `FK_CARRERA_MATRICULA` (`ID_CARRERA`),
  KEY `FK_PERIODO_MATRICULA` (`ID_PERIODO`),
  KEY `FK_ESTUDIANTE_MATRICULA` (`ID_ESTUDIANTE`),
  CONSTRAINT `FK_CARRERA_MATRICULA` FOREIGN KEY (`ID_CARRERA`) REFERENCES `carreras` (`ID_CARRERA`),
  CONSTRAINT `FK_ESTUDIANTE_MATRICULA` FOREIGN KEY (`ID_ESTUDIANTE`) REFERENCES `estudiantes` (`ID_ESTUDIANTE`),
  CONSTRAINT `FK_PERIODO_MATRICULA` FOREIGN KEY (`ID_PERIODO`) REFERENCES `periodos` (`ID_PERIODO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` VALUES (1,1,1,1,2000000),(2,1,1,2,2000000);
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `ID_PAGO` int NOT NULL,
  `ID_TIPO_PAGO` int DEFAULT NULL,
  `OBSERVACIONES` varchar(200) DEFAULT NULL,
  `VALOR_TOTAL` double DEFAULT NULL,
  `FEC_PAGO` date DEFAULT NULL,
  `ESTADO` varchar(20) DEFAULT NULL,
  `ID_MATRICULA` int DEFAULT NULL,
  PRIMARY KEY (`ID_PAGO`),
  KEY `FK_TIPO_PAGO_PAGO` (`ID_TIPO_PAGO`),
  KEY `FK_PAGO_MATRICULA` (`ID_MATRICULA`),
  CONSTRAINT `FK_PAGO_MATRICULA` FOREIGN KEY (`ID_MATRICULA`) REFERENCES `matriculas` (`ID_MATRICULA`),
  CONSTRAINT `FK_TIPO_PAGO_PAGO` FOREIGN KEY (`ID_TIPO_PAGO`) REFERENCES `tipos_pago` (`ID_TIPO_PAGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,'OK',2000000,'2022-06-06','A',1);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `ID_PARMETRO` int NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `VALOR` varchar(200) DEFAULT NULL,
  `TIPO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_PARMETRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodos` (
  `ID_PERIODO` int NOT NULL,
  `COD_PERIODO` varchar(50) DEFAULT NULL,
  `FEC_INICIO_MATRICULA` date DEFAULT NULL,
  `FEC_FIN_MATRICULA` date DEFAULT NULL,
  `FEC_INICIO_PRONTO_PAGO` date DEFAULT NULL,
  `FEC_FIN_PRONTO_PAGO` date DEFAULT NULL,
  PRIMARY KEY (`ID_PERIODO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (1,'202201A','2022-06-06','2022-08-06','2022-06-06','2022-07-06');
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_pago`
--

DROP TABLE IF EXISTS `tipos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_pago` (
  `ID_TIPO_PAGO` int NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_PAGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pago`
--

LOCK TABLES `tipos_pago` WRITE;
/*!40000 ALTER TABLE `tipos_pago` DISABLE KEYS */;
INSERT INTO `tipos_pago` VALUES (1,'CONTADO'),(2,'CREDITO');
/*!40000 ALTER TABLE `tipos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'institudb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-01  9:55:24
