CREATE DATABASE  IF NOT EXISTS `restaurants` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `restaurants`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurants
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Aaa','+34123456789','asd@asd.com'),(2,'Bbb','+34789456123','ads@ads.com'),(3,'Ccc','+34789456789','dsa@dsa.com'),(4,'Ddd','+34456123789','sda@sda.sda');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_has_tables`
--

DROP TABLE IF EXISTS `clients_has_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_has_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clients_id` int(11) NOT NULL,
  `tables_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clients_has_tables_tables1_idx` (`tables_id`),
  KEY `fk_clients_has_tables_clients1_idx` (`clients_id`),
  CONSTRAINT `fk_clients_has_tables_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_has_tables_tables1` FOREIGN KEY (`tables_id`) REFERENCES `tables` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_has_tables`
--

LOCK TABLES `clients_has_tables` WRITE;
/*!40000 ALTER TABLE `clients_has_tables` DISABLE KEYS */;
INSERT INTO `clients_has_tables` VALUES (1,1,1),(2,1,18),(3,2,7),(4,3,10),(5,3,4),(6,4,20);
/*!40000 ALTER TABLE `clients_has_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locals_id` int(11) NOT NULL,
  `clients_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locals_has_clients_clients1_idx` (`clients_id`),
  KEY `fk_locals_has_clients_locals1_idx` (`locals_id`),
  CONSTRAINT `fk_locals_has_clients_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_locals_has_clients_locals1` FOREIGN KEY (`locals_id`) REFERENCES `locals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (1,1,2),(2,1,1),(3,2,3),(4,2,1),(5,2,4),(6,2,2),(7,3,4),(8,4,1);
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locals`
--

DROP TABLE IF EXISTS `locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locals`
--

LOCK TABLES `locals` WRITE;
/*!40000 ALTER TABLE `locals` DISABLE KEYS */;
INSERT INTO `locals` VALUES (1,'L1','Falsa 1','+34654','Rob',1),(2,'L2','Falsa 2','+3456789','Bob',1),(3,'L3','Falsa 3','+34789546','Tom',1),(4,'L4','Falsa 4','+3456128','Cop',0),(5,'L5','Falsa 5','+3456578','Dom',1);
/*!40000 ALTER TABLE `locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_number` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diners_number` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `date_used` datetime NOT NULL,
  `locals_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tables_locals_idx` (`locals_id`),
  CONSTRAINT `fk_tables_locals` FOREIGN KEY (`locals_id`) REFERENCES `locals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,'1','2',1,'2023-09-23 22:00:00',1),(2,'2','',0,'0000-00-00 00:00:00',1),(3,'3','',0,'0000-00-00 00:00:00',1),(4,'4','4',1,'2023-09-24 15:00:00',1),(5,'1','',0,'0000-00-00 00:00:00',2),(6,'2','',0,'0000-00-00 00:00:00',2),(7,'3','3',1,'2023-09-23 21:00:00',2),(8,'4','',0,'0000-00-00 00:00:00',2),(9,'1','',0,'0000-00-00 00:00:00',3),(10,'2','2',1,'2023-09-23 21:30:00',3),(11,'3','',0,'0000-00-00 00:00:00',3),(12,'4','',0,'0000-00-00 00:00:00',3),(13,'1','',0,'0000-00-00 00:00:00',4),(14,'2','',0,'0000-00-00 00:00:00',4),(15,'3','',0,'0000-00-00 00:00:00',4),(16,'4','',0,'0000-00-00 00:00:00',4),(17,'1','',0,'0000-00-00 00:00:00',5),(18,'2','5',1,'2023-09-25 14:30:00',5),(19,'3','',0,'0000-00-00 00:00:00',5),(20,'4','2',1,'2023-09-25 22:00:00',5);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-23 17:52:35
