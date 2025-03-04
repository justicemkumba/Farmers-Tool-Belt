-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: malawi_agriculture
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `crops`
--

DROP TABLE IF EXISTS `crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crops` (
  `CropID` int NOT NULL AUTO_INCREMENT,
  `CropName` varchar(255) NOT NULL,
  PRIMARY KEY (`CropID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crops`
--

LOCK TABLES `crops` WRITE;
/*!40000 ALTER TABLE `crops` DISABLE KEYS */;
INSERT INTO `crops` VALUES (1,'Maize'),(2,'Rice'),(3,'Cassava'),(4,'Groundnuts'),(5,'Beans'),(6,'Millet'),(7,'Sorghum'),(8,'Tobacco'),(9,'Tea'),(10,'Coffee'),(11,'Potatoes'),(12,'Cotton'),(13,'Sugarcane'),(14,'Vegetables'),(15,'Macadamia Nuts');
/*!40000 ALTER TABLE `crops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districtcrops`
--

DROP TABLE IF EXISTS `districtcrops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districtcrops` (
  `DistrictCropID` int NOT NULL AUTO_INCREMENT,
  `DistrictID` int NOT NULL,
  `CropID` int NOT NULL,
  PRIMARY KEY (`DistrictCropID`),
  KEY `DistrictID` (`DistrictID`),
  KEY `CropID` (`CropID`),
  CONSTRAINT `districtcrops_ibfk_1` FOREIGN KEY (`DistrictID`) REFERENCES `districts` (`DistrictID`) ON DELETE CASCADE,
  CONSTRAINT `districtcrops_ibfk_2` FOREIGN KEY (`CropID`) REFERENCES `crops` (`CropID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districtcrops`
--

LOCK TABLES `districtcrops` WRITE;
/*!40000 ALTER TABLE `districtcrops` DISABLE KEYS */;
INSERT INTO `districtcrops` VALUES (1,1,1),(2,1,3),(3,1,2),(4,2,3),(5,2,9),(6,2,2),(7,3,10),(8,3,1),(9,3,11),(10,4,1),(11,4,9),(12,4,3),(13,5,3),(14,5,10),(15,5,2),(16,6,11),(17,6,3),(18,6,1),(19,7,1),(20,7,8),(21,7,4),(22,8,1),(23,8,4),(24,8,13),(25,9,1),(26,9,5),(27,9,4),(28,10,8),(29,10,4),(30,10,1),(31,11,1),(32,11,4),(33,11,7),(34,12,1),(35,12,8),(36,12,5),(37,13,4),(38,13,5),(39,13,2),(40,14,2),(41,14,13),(42,14,4),(43,15,1),(44,15,7),(45,15,3),(46,16,1),(47,16,12),(48,16,7),(49,17,1),(50,17,7),(51,17,3),(52,18,3),(53,18,7),(54,18,13),(55,19,13),(56,19,14),(57,19,12),(58,20,14),(59,20,13),(60,20,7),(61,21,12),(62,21,7),(63,21,1),(64,22,7),(65,22,3),(66,22,14),(67,23,7),(68,23,14),(69,23,12),(70,24,13),(71,24,9),(72,24,1),(73,25,9),(74,25,1),(75,25,3),(76,26,7),(77,26,14),(78,26,3),(79,27,14),(80,27,13),(81,27,3),(82,28,14),(83,28,13),(84,28,7);
/*!40000 ALTER TABLE `districtcrops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districtcropvarieties`
--

DROP TABLE IF EXISTS `districtcropvarieties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districtcropvarieties` (
  `DistrictCropVarietyID` int NOT NULL AUTO_INCREMENT,
  `DistrictCropID` int NOT NULL,
  `VarietyID` int NOT NULL,
  PRIMARY KEY (`DistrictCropVarietyID`),
  KEY `DistrictCropID` (`DistrictCropID`),
  KEY `VarietyID` (`VarietyID`),
  CONSTRAINT `districtcropvarieties_ibfk_1` FOREIGN KEY (`DistrictCropID`) REFERENCES `districtcrops` (`DistrictCropID`) ON DELETE CASCADE,
  CONSTRAINT `districtcropvarieties_ibfk_2` FOREIGN KEY (`VarietyID`) REFERENCES `varieties` (`VarietyID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districtcropvarieties`
--

LOCK TABLES `districtcropvarieties` WRITE;
/*!40000 ALTER TABLE `districtcropvarieties` DISABLE KEYS */;
INSERT INTO `districtcropvarieties` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,7),(5,2,8),(6,3,4),(7,3,5),(8,3,6),(9,4,7),(10,4,8),(13,6,4),(14,6,5),(15,6,6),(18,8,1),(19,8,2),(20,8,3),(23,10,1),(24,10,2),(25,10,3),(28,12,7),(29,12,8),(30,13,7),(31,13,8),(34,15,4),(35,15,5),(36,15,6),(39,17,7),(40,17,8),(41,18,1),(42,18,2),(43,18,3),(44,19,1),(45,19,2),(46,19,3),(50,21,9),(51,21,10),(52,22,1),(53,22,2),(54,22,3),(55,23,9),(56,23,10),(58,24,28),(59,25,1),(60,25,2),(61,25,3),(62,26,11),(63,26,12),(64,27,9),(65,27,10),(69,29,9),(70,29,10),(71,30,1),(72,30,2),(73,30,3),(74,31,1),(75,31,2),(76,31,3),(77,32,9),(78,32,10),(80,33,15),(81,34,1),(82,34,2),(83,34,3),(87,36,11),(88,36,12),(89,37,9),(90,37,10),(91,38,11),(92,38,12),(93,39,4),(94,39,5),(95,39,6),(96,40,4),(97,40,5),(98,40,6),(103,43,1),(104,43,2),(105,43,3),(107,44,15),(108,45,7),(109,45,8),(110,46,1),(111,46,2),(112,46,3),(116,48,15),(117,49,1),(118,49,2),(119,49,3),(121,50,15),(122,51,7),(123,51,8),(124,52,7),(125,52,8),(127,53,15),(129,54,28),(131,55,28),(137,59,28),(139,60,15),(143,62,15),(144,63,1),(145,63,2),(146,63,3),(148,64,15),(149,65,7),(150,65,8),(153,67,15),(158,70,28),(161,72,1),(162,72,2),(163,72,3),(166,74,1),(167,74,2),(168,74,3),(169,75,7),(170,75,8),(172,76,15),(174,78,7),(175,78,8),(178,80,28),(179,81,7),(180,81,8),(183,83,28),(185,84,15),(186,42,9),(187,42,10),(188,33,16),(189,44,16),(190,48,16),(191,50,16),(192,53,16),(193,60,16),(194,62,16),(195,64,16),(196,67,16),(197,76,16),(198,84,16),(199,20,17),(200,28,17),(201,35,17),(202,20,18),(203,28,18),(204,35,18),(205,20,19),(206,28,19),(207,35,19),(208,5,20),(209,11,20),(210,71,20),(211,73,20),(212,5,21),(213,11,21),(214,71,21),(215,73,21),(216,7,22),(217,14,22),(218,7,23),(219,14,23),(220,9,24),(221,16,24),(222,9,25),(223,16,25),(224,47,26),(225,57,26),(226,61,26),(227,69,26),(228,47,27),(229,57,27),(230,61,27),(231,69,27),(232,41,28),(233,24,29),(234,41,29),(235,54,29),(236,55,29),(237,59,29),(238,70,29),(239,80,29),(240,83,29),(241,56,30),(242,58,30),(243,66,30),(244,68,30),(245,77,30),(246,79,30),(247,82,30);
/*!40000 ALTER TABLE `districtcropvarieties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districtfertilizercrops`
--

DROP TABLE IF EXISTS `districtfertilizercrops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districtfertilizercrops` (
  `DistrictFertilizerCropID` int NOT NULL AUTO_INCREMENT,
  `DistrictCropID` int NOT NULL,
  `FertilizerID` int NOT NULL,
  PRIMARY KEY (`DistrictFertilizerCropID`),
  KEY `DistrictCropID` (`DistrictCropID`),
  KEY `FertilizerID` (`FertilizerID`),
  CONSTRAINT `districtfertilizercrops_ibfk_1` FOREIGN KEY (`DistrictCropID`) REFERENCES `districtcrops` (`DistrictCropID`) ON DELETE CASCADE,
  CONSTRAINT `districtfertilizercrops_ibfk_2` FOREIGN KEY (`FertilizerID`) REFERENCES `fertilizers` (`FertilizerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districtfertilizercrops`
--

LOCK TABLES `districtfertilizercrops` WRITE;
/*!40000 ALTER TABLE `districtfertilizercrops` DISABLE KEYS */;
INSERT INTO `districtfertilizercrops` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,7),(5,2,8),(6,3,4),(7,3,5),(8,3,6),(9,4,7),(10,4,8),(13,6,4),(14,6,6),(17,8,1),(18,8,2),(19,8,3),(22,10,1),(23,10,2),(24,10,3),(27,12,7),(28,12,8),(29,13,7),(30,13,8),(33,15,4),(34,15,6),(37,17,7),(38,17,8),(39,18,1),(40,18,3),(41,19,1),(42,19,2),(43,19,3),(46,21,9),(47,21,10),(48,22,1),(49,22,3),(50,23,9),(51,23,10),(53,24,27),(54,25,1),(55,25,3),(56,26,11),(57,26,12),(58,27,9),(59,27,10),(62,29,9),(63,29,10),(64,30,1),(65,30,2),(66,30,3),(73,34,1),(74,34,3),(77,36,11),(78,36,12),(79,37,9),(80,37,10),(81,38,11),(82,38,12),(83,39,4),(84,39,5),(85,40,4),(86,40,5),(91,43,1),(92,43,2),(93,43,3),(95,44,15),(96,45,7),(97,45,8),(98,46,1),(99,46,3),(103,48,15),(117,55,27),(119,56,29),(123,58,29),(125,59,27),(127,60,15),(131,62,15),(132,63,1),(133,63,3),(135,64,15),(136,65,7),(137,65,8),(139,66,29),(141,67,15),(143,68,29),(147,70,27),(150,72,1),(151,72,3),(154,74,1),(155,74,3),(156,75,7),(157,75,8),(159,76,15),(161,77,29),(162,78,7),(163,78,8),(165,79,29),(167,80,27),(168,81,7),(169,81,8),(171,82,29),(173,83,27),(175,84,15),(176,31,1),(177,49,1),(178,18,2),(179,22,2),(180,25,2),(181,31,2),(182,34,2),(183,46,2),(184,49,2),(185,63,2),(186,72,2),(187,74,2),(188,31,3),(189,49,3),(190,6,5),(191,15,5),(192,39,6),(193,40,6),(194,51,7),(195,52,7),(196,51,8),(197,52,8),(198,32,9),(199,42,9),(200,32,10),(201,42,10),(202,33,15),(203,50,15),(204,53,15),(205,33,16),(206,44,16),(207,48,16),(208,50,16),(209,53,16),(210,60,16),(211,62,16),(212,64,16),(213,67,16),(214,76,16),(215,84,16),(216,20,17),(217,28,17),(218,35,17),(219,20,18),(220,28,18),(221,35,18),(222,5,19),(223,11,19),(224,71,19),(225,73,19),(226,5,20),(227,11,20),(228,71,20),(229,73,20),(230,7,21),(231,14,21),(232,7,22),(233,14,22),(234,9,23),(235,16,23),(236,9,24),(237,16,24),(238,47,25),(239,57,25),(240,61,25),(241,69,25),(242,47,26),(243,57,26),(244,61,26),(245,69,26),(246,41,27),(247,54,27),(248,24,28),(249,41,28),(250,54,28),(251,55,28),(252,59,28),(253,70,28),(254,80,28),(255,83,28),(256,56,30),(257,58,30),(258,66,30),(259,68,30),(260,77,30),(261,79,30),(262,82,30);
/*!40000 ALTER TABLE `districtfertilizercrops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `DistrictID` int NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(255) NOT NULL,
  `RegionID` int NOT NULL,
  PRIMARY KEY (`DistrictID`),
  KEY `RegionID` (`RegionID`),
  CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`RegionID`) REFERENCES `regions` (`RegionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Chitipa',1),(2,'Karonga',1),(3,'Rumphi',1),(4,'Mzimba',1),(5,'Nkhata Bay',1),(6,'Likoma',1),(7,'Kasungu',2),(8,'Nkhotakota',2),(9,'Ntchisi',2),(10,'Dowa',2),(11,'Mchinji',2),(12,'Lilongwe',2),(13,'Dedza',2),(14,'Salima',2),(15,'Ntcheu',2),(16,'Mangochi',3),(17,'Machinga',3),(18,'Balaka',3),(19,'Zomba',3),(20,'Chiradzulu',3),(21,'Blantyre',3),(22,'Mwanza',3),(23,'Neno',3),(24,'Thyolo',3),(25,'Mulanje',3),(26,'Phalombe',3),(27,'Chikwawa',3),(28,'Nsanje',3);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fertilizers`
--

DROP TABLE IF EXISTS `fertilizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fertilizers` (
  `FertilizerID` int NOT NULL AUTO_INCREMENT,
  `FertilizerName` varchar(255) NOT NULL,
  `CropID` int NOT NULL,
  `NutrientComposition` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FertilizerID`),
  KEY `CropID` (`CropID`),
  CONSTRAINT `fertilizers_ibfk_1` FOREIGN KEY (`CropID`) REFERENCES `crops` (`CropID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fertilizers`
--

LOCK TABLES `fertilizers` WRITE;
/*!40000 ALTER TABLE `fertilizers` DISABLE KEYS */;
INSERT INTO `fertilizers` VALUES (1,'Urea',1,'46% Nitrogen','Nitrogen-based'),(2,'NPK 23:21:0+4S',1,'23% Nitrogen, 21% Phosphorus, 0 Potassium, 4% Sulfur','Balanced'),(3,'DAP',1,'18-46-0','Phosphorus-based'),(4,'NPK 16:16:16',2,'16% Nitrogen, 16% Phosphorus, 16% Potassium','Balanced'),(5,'Urea',2,'46% Nitrogen','Nitrogen-based'),(6,'Ammonium Sulfate',2,'21% Nitrogen, 24% Sulfur','Nitrogen-Sulfur'),(7,'Potassium Sulfate',3,'50% Potassium, 17% Sulfur','Potassium-based'),(8,'NPK 15:15:15',3,'15% Nitrogen, 15% Phosphorus, 15% Potassium','Balanced'),(9,'Single Super Phosphate (SSP)',4,'16% Phosphorus, 12% Sulfur','Phosphorus-based'),(10,'Gypsum',4,'23% Calcium, 18% Sulfur','Calcium-Sulfur'),(11,'Rhizobium Inoculant',5,'Nitrogen-fixing bacteria','Biological'),(12,'NPK 14:18:18',5,'14% Nitrogen, 18% Phosphorus, 18% Potassium','Balanced'),(13,'NPK 10:26:26',6,'10% Nitrogen, 26% Phosphorus, 26% Potassium','Balanced'),(14,'Urea',6,'46% Nitrogen','Nitrogen-based'),(15,'NPK 17:17:17',7,'17% Nitrogen, 17% Phosphorus, 17% Potassium','Balanced'),(16,'DAP',7,'18-46-0','Phosphorus-based'),(17,'Calcium Nitrate',8,'15% Nitrogen, 19% Calcium','Nitrogen-Calcium'),(18,'NPK 6:18:36',8,'6% Nitrogen, 18% Phosphorus, 36% Potassium','Balanced'),(19,'Ammonium Nitrate',9,'33.5% Nitrogen','Nitrogen-based'),(20,'NPK 25:5:5',9,'25% Nitrogen, 5% Phosphorus, 5% Potassium','Balanced'),(21,'Potassium Nitrate',10,'13% Nitrogen, 46% Potassium','Potassium-based'),(22,'NPK 20:10:10',10,'20% Nitrogen, 10% Phosphorus, 10% Potassium','Balanced'),(23,'NPK 12:24:12',11,'12% Nitrogen, 24% Phosphorus, 12% Potassium','Balanced'),(24,'Muriate of Potash',11,'60% Potassium','Potassium-based'),(25,'NPK 15:5:20',12,'15% Nitrogen, 5% Phosphorus, 20% Potassium','Balanced'),(26,'Sulfur-coated Urea',12,'35% Nitrogen, 15% Sulfur','Nitrogen-Sulfur'),(27,'NPK 20:10:30',13,'20% Nitrogen, 10% Phosphorus, 30% Potassium','Balanced'),(28,'Magnesium Sulfate',13,'10% Magnesium, 13% Sulfur','Magnesium-Sulfur'),(29,'NPK 18:18:18',14,'18% Nitrogen, 18% Phosphorus, 18% Potassium','Balanced'),(30,'Compost',14,'Organic matter','Organic'),(31,'NPK 12:8:20',15,'12% Nitrogen, 8% Phosphorus, 20% Potassium','Balanced'),(32,'Bone Meal',15,'22% Phosphorus, 15% Calcium','Organic-Phosphorus');
/*!40000 ALTER TABLE `fertilizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `RegionID` int NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(255) NOT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Northern'),(2,'Central'),(3,'Southern');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(255) NOT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  `DistrictID` int NOT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `DistrictID` (`DistrictID`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`DistrictID`) REFERENCES `districts` (`DistrictID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Chitipa Agro Dealers','123 Chitipa Main Rd, +265-999-000001',1),(2,'Green Valley Supplies Chitipa','45 Chitipa Rd, +265-999-000002',1),(3,'Chitipa Farming Hub','67 Village Market Rd, +265-999-000003',1),(4,'Karonga Farm Supplies','456 Karonga Rd, +265-999-000004',2),(5,'Lake Agro Supplies Karonga','32 Karonga Rd, +265-999-000005',2),(6,'Karonga Growers Hub','98 Karonga Central, +265-999-000006',2),(7,'Rumphi Agro Solutions','789 Rumphi Lane, +265-999-000007',3),(8,'Rumphi Valley Supplies','24 Rumphi Market, +265-999-000008',3),(9,'Mzimba AgriStore','101 Mzimba St, +265-999-000009',4),(10,'Mzimba Fertilizer Depot','202 Mzimba Rd, +265-999-000010',4),(11,'Green World Mzimba','303 Mzimba Market, +265-999-000011',4),(12,'Nkhata Bay Inputs','112 Lake Shore Rd, +265-999-000012',5),(13,'Shoreline Agro Supplies Nkhata Bay','56 Market Rd, +265-999-000013',5),(14,'Likoma Agro Hub','131 Likoma Island, +265-999-000014',6),(15,'Island Farming Supplies','45 Likoma Central, +265-999-000015',6),(16,'Kasungu Fertilizer Depot','212 Kasungu Town, +265-999-000016',7),(17,'Kasungu Growers Hub','87 Market Lane, +265-999-000017',7),(18,'Nkhotakota Growers','345 Nkhotakota Rd, +265-999-000018',8),(19,'Nkhotakota Valley Agro','67 Market Rd, +265-999-000019',8),(20,'Nkhotakota Farm Store','29 Town Centre Rd, +265-999-000020',8),(21,'Ntchisi Farm Shop','456 Ntchisi Village, +265-999-000021',9),(22,'Ntchisi Fertilizer Depot','98 Ntchisi Rd, +265-999-000022',9),(23,'Dowa Agricultural Supplies','678 Dowa Junction, +265-999-000023',10),(24,'Dowa Farmers Hub','101 Main Rd, +265-999-000024',10),(25,'Mchinji Input Centre','789 Mchinji Market, +265-999-000025',11),(26,'Mchinji AgroDepot','303 Main Rd, +265-999-000026',11),(27,'Lilongwe AgriSuppliers','123 Capital City, +265-999-000027',12),(28,'Capital Agro Centre','45 Lilongwe City, +265-999-000028',12),(29,'Lilongwe Fertilizer Hub','89 City Market, +265-999-000029',12),(30,'Dedza Fertilizer Shop','234 Dedza Town, +265-999-000030',13),(31,'Dedza Growers Supplies','67 Main Rd, +265-999-000031',13),(32,'Salima Agri Depot','345 Salima Lakeside, +265-999-000032',14),(33,'Salima Fertilizer Store','78 Town Centre Rd, +265-999-000033',14),(34,'Ntcheu Inputs & Tools','456 Ntcheu Market, +265-999-000034',15),(35,'Ntcheu Fertilizer Depot','90 Main Market Rd, +265-999-000035',15),(36,'Mangochi Farm Supplies','789 Mangochi Town, +265-999-000036',16),(37,'Mangochi Agro Solutions','101 Mangochi Main Rd, +265-999-000037',16),(38,'Lakeside Agro Mangochi','67 Town Centre, +265-999-000038',16),(39,'Machinga Growers Hub','101 Machinga Rd, +265-999-000039',17),(40,'Machinga Agro Centre','34 Machinga Market, +265-999-000040',17),(41,'Balaka Agricultural Store','112 Balaka Rd, +265-999-000041',18),(42,'Balaka AgroDepot','45 Balaka Market, +265-999-000042',18),(43,'Zomba AgriCentre','123 Zomba Town, +265-999-000043',19),(44,'Zomba Fertilizer Depot','98 Main Rd, +265-999-000044',19),(45,'Chiradzulu Fertilizer Depot','234 Chiradzulu St, +265-999-000045',20),(46,'Chiradzulu AgriStore','67 Main Market, +265-999-000046',20),(47,'Blantyre Farm Inputs','345 Blantyre City, +265-999-000047',21),(48,'Blantyre AgroSolutions','78 City Centre Rd, +265-999-000048',21),(49,'Blantyre Fertilizer Depot','89 Main Rd, +265-999-000049',21),(50,'Mwanza Agri Suppliers','456 Mwanza Town, +265-999-000050',22),(51,'Mwanza Growers Centre','90 Mwanza Rd, +265-999-000051',22),(52,'Neno Farm Depot','567 Neno Rd, +265-999-000052',23),(53,'Neno Agro Hub','45 Market St, +265-999-000053',23),(54,'Thyolo Growers Hub','678 Thyolo Rd, +265-999-000054',24),(55,'Thyolo Fertilizer Centre','12 Market Lane, +265-999-000055',24),(56,'Mulanje Agro Dealers','789 Mulanje Rd, +265-999-000056',25),(57,'Mulanje Fertilizer Depot','34 Main Rd, +265-999-000057',25),(58,'Phalombe AgriCentre','101 Phalombe Market, +265-999-000058',26),(59,'Phalombe Growers Supplies','56 Main Market Rd, +265-999-000059',26),(60,'Chikwawa Input Depot','112 Chikwawa Town, +265-999-000060',27),(61,'Chikwawa Fertilizer Hub','89 Main Rd, +265-999-000061',27),(62,'Nsanje Fertilizer Hub','123 Nsanje Village, +265-999-000062',28),(63,'Nsanje AgroDepot','45 Main Market Rd, +265-999-000063',28);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varieties`
--

DROP TABLE IF EXISTS `varieties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varieties` (
  `VarietyID` int NOT NULL AUTO_INCREMENT,
  `VarietyName` varchar(255) NOT NULL,
  `CropID` int NOT NULL,
  `ClimateSuitability` varchar(255) DEFAULT NULL,
  `SoilSuitability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VarietyID`),
  KEY `CropID` (`CropID`),
  CONSTRAINT `varieties_ibfk_1` FOREIGN KEY (`CropID`) REFERENCES `crops` (`CropID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varieties`
--

LOCK TABLES `varieties` WRITE;
/*!40000 ALTER TABLE `varieties` DISABLE KEYS */;
INSERT INTO `varieties` VALUES (1,'Hybrid Maize',1,'Moderate to high rainfall','Loamy soils'),(2,'OPV Maize',1,'Drought-prone areas','Well-drained soils'),(3,'Local Maize',1,'Various climates','Various soils'),(4,'Irrigated Rice',2,'Floodplains','Clay soils'),(5,'Upland Rice',2,'Highlands','Well-drained soils'),(6,'Kilombero Rice',2,'Lowlands','Clay soils'),(7,'Sweet Cassava',3,'Humid areas','Sandy soils'),(8,'Bitter Cassava',3,'Humid areas','Sandy soils'),(9,'Virginia Groundnuts',4,'Well-drained areas','Loamy soils'),(10,'Spanish Groundnuts',4,'Well-drained areas','Loamy soils'),(11,'Common Beans',5,'Moderate rainfall','Loamy soils'),(12,'Climbing Beans',5,'Highlands','Well-drained soils'),(13,'Finger Millet',6,'Highlands','Poor soils'),(14,'Pearl Millet',6,'Dry areas','Sandy soils'),(15,'White Sorghum',7,'Dry areas','Sandy soils'),(16,'Red Sorghum',7,'Dry areas','Sandy soils'),(17,'Flue-Cured Tobacco',8,'Well-drained areas','Loamy soils'),(18,'Burley Tobacco',8,'Well-drained areas','Loamy soils'),(19,'Dark-Fired Tobacco',8,'Well-drained areas','Loamy soils'),(20,'Assamica Tea',9,'High rainfall','Acidic soils'),(21,'Sinensis Tea',9,'High rainfall','Acidic soils'),(22,'Arabica Coffee',10,'Cooler highlands','Volcanic soils'),(23,'Robusta Coffee',10,'Lowlands','Well-drained soils'),(24,'Irish Potatoes',11,'Cool climates','Loamy soils'),(25,'Sweet Potatoes',11,'Warm climates','Sandy soils'),(26,'Upland Cotton',12,'Hot, dry regions','Sandy soils'),(27,'Pima Cotton',12,'Irrigated regions','Clay soils'),(28,'Commercial Sugarcane',13,'Humid areas','Clay soils'),(29,'Smallholder Sugarcane',13,'Humid areas','Clay soils'),(30,'Mixed Vegetables',14,'Various climates','Various soils'),(31,'Improved Macadamia Nuts',15,'Moderate rainfall','Well-drained soils'),(32,'Local Macadamia Nuts',15,'Moderate rainfall','Well-drained soils');
/*!40000 ALTER TABLE `varieties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-25 18:16:10
