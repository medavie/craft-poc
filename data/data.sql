-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: craft-poc
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (51,1,1,1,'elements-logo-en.jpg','image',1250,421,166337,NULL,NULL,NULL,'2021-02-12 13:33:47','2021-02-12 13:33:48','2021-02-12 13:33:48','7132b062-5b82-4c95-8754-7749cf943b0f'),(54,1,2,1,'elements-logo-en.jpg','image',1250,421,166337,NULL,NULL,NULL,'2021-02-12 13:56:13','2021-02-12 13:56:13','2021-02-12 13:56:13','fd5cd861-91b8-4606-b42e-09dcd9dc4d13');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (2,1,'fieldLayoutId','2020-06-30 16:58:57',0,1),(2,1,'title','2020-06-30 19:06:36',0,1),(2,1,'uri','2020-08-24 13:40:21',0,1),(13,1,'title','2021-02-12 13:34:23',0,1),(13,1,'uri','2020-06-30 19:52:32',0,1),(17,1,'title','2020-06-30 18:04:28',0,1),(17,1,'uri','2020-06-30 19:52:33',0,1),(23,1,'uri','2020-06-30 19:52:33',0,1),(26,1,'uri','2020-06-30 19:52:33',0,1),(29,1,'fieldLayoutId','2021-02-12 13:20:24',0,1),(29,1,'typeId','2021-02-12 13:20:24',0,1),(29,1,'uri','2020-06-30 19:52:34',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,1,'2020-08-24 13:40:24',0,1),(2,1,3,'2020-08-24 13:40:24',0,1),(2,1,7,'2020-08-24 13:40:24',0,1),(13,1,4,'2021-02-12 13:18:49',0,1),(13,1,5,'2021-02-12 13:18:49',0,1),(13,1,6,'2021-02-12 13:18:49',0,1),(17,1,4,'2021-02-12 13:18:50',0,1),(17,1,5,'2021-02-12 13:18:50',0,1),(17,1,6,'2021-02-12 13:18:50',0,1),(23,1,4,'2021-02-12 13:18:50',0,1),(23,1,5,'2021-02-12 13:18:50',0,1),(23,1,6,'2021-02-12 13:18:50',0,1),(26,1,4,'2021-02-12 13:18:50',0,1),(26,1,5,'2021-02-12 13:18:50',0,1),(26,1,6,'2021-02-12 13:18:50',0,1),(29,1,4,'2021-02-12 13:26:37',0,1),(29,1,5,'2021-02-12 13:26:37',0,1),(29,1,6,'2021-02-12 13:26:37',0,1),(29,1,10,'2021-02-12 13:20:24',0,1),(29,1,11,'2021-02-12 14:28:38',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_leadText` text,
  `field_showLeadText` tinyint(1) DEFAULT NULL,
  `field_header` text,
  `field_bodyText` text,
  `field_summaryText` text,
  `field_companyname` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2020-06-29 20:25:42','2020-06-29 20:25:42','d984aab6-679a-46c9-93ec-a681fa132ed2',NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,'Medavie News','2020-06-29 21:30:31','2020-08-24 13:40:24','9a6dcae0-8be3-4166-9110-518c06038a27','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(3,3,1,'home','2020-06-29 21:30:31','2020-06-29 21:30:31','c2ea844a-9ea8-433c-8f19-afc820c7e85a',NULL,NULL,NULL,NULL,NULL,NULL),(4,4,1,'home','2020-06-30 16:57:46','2020-06-30 16:57:46','1aaea097-9a3a-4bfc-80ab-dd92622ede4b',NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'home','2020-06-30 16:58:57','2020-06-30 16:58:57','a9ef7876-06f1-430e-95aa-5f8b2be82ab8',NULL,NULL,NULL,NULL,NULL,NULL),(6,6,1,'home','2020-06-30 16:59:15','2020-06-30 16:59:15','d11b4c5b-b6d6-4d10-88cd-ea0301dae0ed','My first entry',NULL,NULL,NULL,NULL,NULL),(7,7,1,'home','2020-06-30 17:18:57','2020-06-30 17:18:57','1da66b1b-6083-4471-a882-8221ab8e0d00',NULL,NULL,NULL,NULL,NULL,NULL),(8,8,1,'home','2020-06-30 17:21:34','2020-06-30 17:21:34','9634724b-f925-490f-a6d8-48d6038ef49c','My first entry',0,NULL,NULL,NULL,NULL),(9,9,1,'home','2020-06-30 17:30:22','2020-06-30 17:30:22','9f6a2ae3-ca17-49dd-8185-22caaa18ed80','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',0,NULL,NULL,NULL,NULL),(10,10,1,'home','2020-06-30 17:37:37','2020-06-30 17:37:37','5711f599-9dca-4c2b-a89d-0700b11375f0','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(11,11,1,'Blog','2020-06-30 17:40:04','2020-06-30 17:40:11','3944a8b8-c8f9-4cb8-8eee-1d0ba484b094',NULL,NULL,NULL,NULL,NULL,NULL),(13,13,1,'News 1','2020-06-30 17:52:09','2021-02-12 13:34:23','4fd395b8-4db5-4159-b9b5-92b20473420f',NULL,NULL,'News 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(14,14,1,'post-1','2020-06-30 17:52:10','2020-06-30 17:52:10','e597f0bc-7a63-4a5e-b7cf-784f46f1b061',NULL,NULL,'Post 1','fgdf',NULL,NULL),(15,15,1,'post-1','2020-06-30 17:55:32','2020-06-30 17:55:32','b6dd2201-15d7-41e1-9ac4-b8d3fe798fe3',NULL,NULL,'Post 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(17,17,1,'News 2','2020-06-30 17:58:39','2021-02-12 13:18:49','2baa6665-acb0-43bb-8ca8-4be9a53d6b32',NULL,NULL,'News 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(18,18,1,'news2','2020-06-30 17:58:39','2020-06-30 17:58:39','c5bb9859-4c57-4377-b7cc-5ab3e00148f6',NULL,NULL,'News 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(19,19,1,'post','2020-06-30 18:01:24','2020-06-30 18:01:24','3f7c4b69-5dc2-4cd1-915e-ad5d6edfe09e',NULL,NULL,'News 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(20,20,1,'News 2','2020-06-30 18:04:27','2020-06-30 18:04:27','c55b8176-de1c-431f-a168-65d4878e93dc',NULL,NULL,'News 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(21,21,1,'News 1','2020-06-30 18:04:45','2020-06-30 18:04:45','416c5a47-c382-4014-9f22-0dd29105fd20',NULL,NULL,'News 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(23,23,1,'News 3','2020-06-30 18:05:14','2021-02-12 13:18:50','7271ef81-b0d2-4852-b6c3-3fc897a3e83f',NULL,NULL,'News 3','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(24,24,1,'News 3','2020-06-30 18:05:15','2020-06-30 18:05:15','ce71411a-71ee-4820-a0ef-f5a84c97d826',NULL,NULL,'News 3','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(26,26,1,'News 4','2020-06-30 18:05:34','2021-02-12 13:18:50','aad801cf-a8b2-4982-b3e3-dc80056f8b22',NULL,NULL,'News 4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(27,27,1,'News 4','2020-06-30 18:05:35','2020-06-30 18:05:35','0f1ace5c-3ff3-4195-8346-143e7d86cc9c',NULL,NULL,'News 4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(29,29,1,'News 5','2020-06-30 18:05:57','2021-02-12 14:28:37','30337ee7-6bc8-47de-bf90-81b18a844da1',NULL,NULL,'News 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Medavie Blue Cross'),(30,30,1,'News 5','2020-06-30 18:05:57','2020-06-30 18:05:57','87ddc76c-ad65-4cd5-bfad-f35091444c03',NULL,NULL,'News 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL),(31,31,1,'home','2020-06-30 18:06:36','2020-06-30 18:06:36','76136cfb-e489-4c8a-8414-96bb6a9b56f1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(32,32,1,'News 1','2020-06-30 18:55:29','2020-06-30 18:55:29','f567480a-9d30-4076-abda-5c64dace93f6',NULL,NULL,'News 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(33,33,1,'News 5','2020-06-30 18:55:39','2020-06-30 18:55:39','8ad21c1d-eac6-4311-b726-c68b5a5309e1',NULL,NULL,'News 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(34,34,1,'News 3','2020-06-30 18:55:56','2020-06-30 18:55:56','a4a9303e-ed5d-43e5-ab76-6061cee7845e',NULL,NULL,'News 3','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(35,35,1,'News 2','2020-06-30 18:56:10','2020-06-30 18:56:10','a25ad026-c736-41a3-81fd-dbb642ea154d',NULL,NULL,'News 2',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(36,36,1,'News 2','2020-06-30 18:56:38','2020-06-30 18:56:38','a9d6d179-1709-4661-a32a-7bafb333a9c4',NULL,NULL,'News 2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(37,37,1,'News 4','2020-06-30 18:57:09','2020-06-30 18:57:09','0901ae9f-7621-4526-b23c-7288c1a6840b',NULL,NULL,'News 4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(38,38,1,'Medavie News','2020-06-30 19:06:36','2020-06-30 19:06:36','3246c59f-d058-4acd-92b3-b46331f0219b','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(39,39,1,'Medavie News','2020-07-14 18:48:28','2020-07-14 18:48:28','ea371b34-615d-4205-b046-1043b4693b3b','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(40,40,1,'Medavie News','2020-07-14 18:48:29','2020-07-14 18:48:29','84d294ff-b82e-4b4b-829e-c43b07da7452','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(41,41,1,'Medavie News','2020-07-14 18:48:52','2020-07-14 18:48:52','4524ec33-de98-4e1f-a938-68fa0a62b04f','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(42,42,1,'Medavie News','2020-07-14 18:51:02','2020-07-14 18:51:02','28d9dbc0-6cf7-4d7c-a710-e49003797439','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(43,43,1,'Medavie News','2020-07-14 18:51:57','2020-07-14 18:51:57','07501849-e324-4b86-8896-79ca1ce49f36','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(44,44,1,'Medavie News','2020-07-14 18:55:57','2020-07-14 18:55:57','530643f1-e1e3-4e77-8235-c4eadd39c250','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(45,45,1,'abc','2020-07-14 19:17:11','2020-07-14 19:17:11','0ed4d9dc-eb79-4430-8ce2-ab02535c0c96',NULL,NULL,'News 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(46,46,1,NULL,'2020-07-14 19:22:35','2020-07-14 19:23:02','a9153186-b3f8-48d5-8242-2b2b9432c059',NULL,NULL,NULL,NULL,NULL,'Medavie Blue Cross'),(47,47,1,'Medavie News','2020-08-24 13:40:20','2020-08-24 13:40:20','d135a44a-4b95-471c-868f-38771d07e512','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(48,48,1,'Medavie News','2020-08-24 13:40:21','2020-08-24 13:40:21','e2b77d41-e49d-4406-9ff1-08a4fc8e599f','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1,NULL,NULL,NULL,NULL),(49,49,1,NULL,'2021-02-12 13:19:31','2021-02-12 13:19:45','cebaa8bf-e83c-48db-94b6-618aea7c096a',NULL,NULL,NULL,NULL,NULL,NULL),(50,50,1,'News 5','2021-02-12 13:20:24','2021-02-12 13:20:24','287ddaaf-6d7d-4c3f-9662-33f91a662ecd',NULL,NULL,'News 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Medavie Blue Cross'),(51,51,1,'Elements logo en','2021-02-12 13:33:47','2021-02-12 13:55:21','a2649fd4-b9ce-4bcf-8e5c-208398fe98a6',NULL,NULL,NULL,NULL,NULL,NULL),(52,52,1,'News 5','2021-02-12 13:34:08','2021-02-12 13:34:08','c5646be0-3f02-4392-ac6d-06fbb02f9f70',NULL,NULL,'News 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(53,53,1,'News 1','2021-02-12 13:34:23','2021-02-12 13:34:23','89ec9c59-3b08-4c82-ae05-c137cdea380b',NULL,NULL,'News 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(54,54,1,'Elements logo en','2021-02-12 13:56:13','2021-02-12 13:56:13','4797aa06-7b97-43ce-87da-a587e47d033d',NULL,NULL,NULL,NULL,NULL,NULL),(55,55,1,'News 5','2021-02-12 14:23:02','2021-02-12 14:23:02','0edef10b-0181-446a-862c-30de744cd5e4',NULL,NULL,'News 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL),(56,56,1,'News 5','2021-02-12 14:28:38','2021-02-12 14:28:38','188c6043-21e4-42ae-9d4d-f2afeee001f2',NULL,NULL,'News 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
INSERT INTO `deprecationerrors` VALUES (1,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.html:34','2020-06-30 18:33:48','C:\\projects\\craft-poc\\templates\\index.html',34,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\af\\\\afa6c9bedb025a3412069f172aab6d2d497bc1ab33eb7b170ed8c3b88154fc01.php\",\"line\":97,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 18:33:48','2020-06-30 18:33:48','ecf029de-a59a-414d-aecb-2901cd670cd8'),(7,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.html:33','2020-06-30 18:38:01','C:\\projects\\craft-poc\\templates\\index.html',33,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\af\\\\afa6c9bedb025a3412069f172aab6d2d497bc1ab33eb7b170ed8c3b88154fc01.php\",\"line\":110,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 18:38:01','2020-06-30 18:38:01','b08bde1f-c649-4dda-bed8-bf7b9742a908'),(8,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\vendor\\twig\\twig\\src\\Extension\\CoreExtension.php:666','2020-06-30 18:42:38','C:\\projects\\craft-poc\\vendor\\twig\\twig\\src\\Extension\\CoreExtension.php',666,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Extension\\\\CoreExtension.php\",\"line\":666,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\af\\\\afa6c9bedb025a3412069f172aab6d2d497bc1ab33eb7b170ed8c3b88154fc01.php\",\"line\":133,\"class\":null,\"method\":\"twig_slice\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, craft\\\\elements\\\\db\\\\EntryQuery, 3, 6\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 18:42:38','2020-06-30 18:42:38','7e6b9773-0dbe-42fa-83e9-e5a619468c54'),(10,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.html:35','2020-06-30 18:44:11','C:\\projects\\craft-poc\\templates\\index.html',35,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\af\\\\afa6c9bedb025a3412069f172aab6d2d497bc1ab33eb7b170ed8c3b88154fc01.php\",\"line\":99,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 18:44:11','2020-06-30 18:44:11','f8dc5515-0719-4dbe-b948-5c1376c22e2c'),(11,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.html:36','2020-06-30 18:52:23','C:\\projects\\craft-poc\\templates\\index.html',36,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\af\\\\afa6c9bedb025a3412069f172aab6d2d497bc1ab33eb7b170ed8c3b88154fc01.php\",\"line\":100,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_717f7f0205f2a575a46ab18a76084f8df1740c241f4050f7195203585c36103e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 18:52:23','2020-06-30 18:52:23','476737ce-4ab6-456b-80be-c9e177a0bd6c'),(16,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.twig:35','2020-06-30 19:08:44','C:\\projects\\craft-poc\\templates\\index.twig',35,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":99,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 19:08:44','2020-06-30 19:08:44','7f6fa892-624f-4b22-9667-b18797606fa7'),(22,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.twig:36','2020-06-30 19:23:53','C:\\projects\\craft-poc\\templates\\index.twig',36,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":100,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 19:23:53','2020-06-30 19:23:53','8d1c97f7-2945-4525-b000-47e7d02b553b'),(35,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.twig:37','2020-06-30 19:58:57','C:\\projects\\craft-poc\\templates\\index.twig',37,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":101,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 19:58:57','2020-06-30 19:58:57','6b8b8020-000c-4064-8f40-586a559e1ec9'),(43,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.twig:9','2021-02-12 14:30:59','C:\\projects\\craft-poc\\templates\\index.twig',9,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":69,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\0c\\\\0c4ce6a23f7a128e3a4f2155143d2f787d9e44fcbccc0e7e5ada13b626080360.php\",\"line\":79,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-02-12 14:30:59','2021-02-12 14:30:59','098d51f6-6de5-4ad7-820d-9671db14ae8b'),(45,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.twig:11','2020-06-30 20:09:12','C:\\projects\\craft-poc\\templates\\index.twig',11,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":71,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\0c\\\\0c4ce6a23f7a128e3a4f2155143d2f787d9e44fcbccc0e7e5ada13b626080360.php\",\"line\":79,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 20:09:12','2020-06-30 20:09:12','d78fd83d-b5d9-460d-8749-ec5b392d35d1'),(48,'ElementQuery::getIterator()','C:\\projects\\craft-poc\\templates\\index.twig:10','2020-06-30 20:22:55','C:\\projects\\craft-poc\\templates\\index.twig',10,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":70,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":184,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\0c\\\\0c4ce6a23f7a128e3a4f2155143d2f787d9e44fcbccc0e7e5ada13b626080360.php\",\"line\":79,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2fba0da81574cc1fb1779929e39d500292c529f4e2a30bc89940cb3fd268cdc1\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\storage\\\\runtime\\\\compiled_templates\\\\25\\\\250c684134db5491bd6a3e3375af194ec41fc9c1434b9030718cb9a506b813a3.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d171199d0faba8868a935048a05964ba9eeebed8b7a5c521e684d80eb477468e\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":375,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":436,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\projects\\\\craft-poc\\\\web\\\\index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2020-06-30 20:22:55','2020-06-30 20:22:55','3aa8650a-2e71-4437-89fa-2394ba24eb2c');
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (1,NULL,1,'First draft','',0,NULL),(2,NULL,1,'First draft','',0,NULL);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-06-29 20:25:42','2020-06-29 20:25:42',NULL,'6ae8e6a5-cca3-4af2-bbcc-d402570eaa47'),(2,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-06-29 21:30:31','2020-08-24 13:40:21',NULL,'d3f60eb0-b373-450d-b6ce-346637ce1fa6'),(3,NULL,1,NULL,'craft\\elements\\Entry',1,0,'2020-06-29 21:30:31','2020-06-29 21:30:31',NULL,'7b5352f9-38eb-4502-8fda-2914f62f6511'),(4,NULL,2,NULL,'craft\\elements\\Entry',1,0,'2020-06-30 16:57:46','2020-06-30 16:57:46',NULL,'afd87ac6-a0d2-4f19-91ae-9f4dc7863660'),(5,NULL,3,1,'craft\\elements\\Entry',1,0,'2020-06-30 16:58:57','2020-06-30 16:58:57',NULL,'ae838cbb-f210-4e06-b519-26b85ae3f1d9'),(6,NULL,4,1,'craft\\elements\\Entry',1,0,'2020-06-30 16:59:15','2020-06-30 16:59:15',NULL,'15fd188c-56a3-4a05-894b-4b1b0e2fb35a'),(7,NULL,5,1,'craft\\elements\\Entry',1,0,'2020-06-30 17:18:57','2020-06-30 17:18:57',NULL,'bfb2208f-29f0-4323-9986-2e82f304de02'),(8,NULL,6,1,'craft\\elements\\Entry',1,0,'2020-06-30 17:21:34','2020-06-30 17:21:34',NULL,'33c7e729-2da4-4318-85ed-a50e419d456b'),(9,NULL,7,1,'craft\\elements\\Entry',1,0,'2020-06-30 17:30:21','2020-06-30 17:30:21',NULL,'f2d049be-817f-4b94-bdd2-0d17e1a782c0'),(10,NULL,8,1,'craft\\elements\\Entry',1,0,'2020-06-30 17:37:37','2020-06-30 17:37:37',NULL,'a032b0b2-f9a0-44d8-80b9-c5e6b1944e2c'),(11,1,NULL,NULL,'craft\\elements\\Entry',1,0,'2020-06-30 17:40:03','2020-06-30 17:40:11',NULL,'bcd538a9-c2d1-4c2e-ae91-5926a13571d0'),(13,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2020-06-30 17:52:09','2021-02-12 13:34:23',NULL,'04c04324-5c84-45aa-98dd-5eba79b71a21'),(14,NULL,9,2,'craft\\elements\\Entry',1,0,'2020-06-30 17:52:09','2020-06-30 17:52:09',NULL,'8eaa1463-0744-49af-a7d6-73375011173c'),(15,NULL,10,2,'craft\\elements\\Entry',1,0,'2020-06-30 17:55:32','2020-06-30 17:55:32',NULL,'ea54375a-3682-47db-9a7c-17cb6aef361e'),(17,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2020-06-30 17:58:39','2020-06-30 18:56:38',NULL,'e9ef384e-7645-4cf9-b20a-29a0ead089e7'),(18,NULL,11,2,'craft\\elements\\Entry',1,0,'2020-06-30 17:58:38','2020-06-30 17:58:38',NULL,'da6755db-6dab-4457-93d0-95706a89a97c'),(19,NULL,12,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:01:24','2020-06-30 18:01:24',NULL,'d9586490-7fdc-45d8-a126-683c7aa58882'),(20,NULL,13,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:04:27','2020-06-30 18:04:27',NULL,'8586250c-70b8-45ed-b7a0-75bb6dfde5c4'),(21,NULL,14,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:04:44','2020-06-30 18:04:44',NULL,'b3ebcd04-3e53-4775-80d4-2418de68c60e'),(23,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:05:14','2020-06-30 18:55:56',NULL,'32424e8a-28be-4ba6-945c-63641747f4a4'),(24,NULL,15,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:05:14','2020-06-30 18:05:14',NULL,'7679b002-0e9f-421c-9d90-edd4bc846a3d'),(26,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:05:34','2020-06-30 18:57:09',NULL,'d1af263a-7356-401a-8710-b4e0e881b631'),(27,NULL,16,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:05:34','2020-06-30 18:05:34',NULL,'96cc7e6f-a80a-4273-9c79-9ce49e59f665'),(29,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2020-06-30 18:05:57','2021-02-12 14:28:37',NULL,'f28d7c78-f68b-4ade-bf51-980bdad743f4'),(30,NULL,17,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:05:57','2020-06-30 18:05:57',NULL,'8acf16c1-89b1-463b-89a9-983b8d988745'),(31,NULL,18,1,'craft\\elements\\Entry',1,0,'2020-06-30 18:06:36','2020-06-30 18:06:36',NULL,'640281d7-cbd3-4816-bdbe-1bdc9715800b'),(32,NULL,19,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:55:29','2020-06-30 18:55:29',NULL,'2d1c5a85-e082-4d59-8631-23bf85b47c95'),(33,NULL,20,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:55:39','2020-06-30 18:55:39',NULL,'47b89593-cd41-4c3b-9c8f-b6c185e295aa'),(34,NULL,21,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:55:56','2020-06-30 18:55:56',NULL,'6672ebb2-d262-4f4d-86e1-fdce455c8950'),(35,NULL,22,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:56:10','2020-06-30 18:56:10',NULL,'31c5e7d0-4c77-4367-99a0-4178878f1443'),(36,NULL,23,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:56:38','2020-06-30 18:56:38',NULL,'2212a810-2908-4d69-a515-3430e187dab3'),(37,NULL,24,2,'craft\\elements\\Entry',1,0,'2020-06-30 18:57:09','2020-06-30 18:57:09',NULL,'6c56a815-f1da-46d7-8e4e-9c295e19f406'),(38,NULL,25,1,'craft\\elements\\Entry',1,0,'2020-06-30 19:06:36','2020-06-30 19:06:36',NULL,'41e2b5a5-5f34-4d4c-8235-2844105a2749'),(39,NULL,26,1,'craft\\elements\\Entry',1,0,'2020-07-14 18:48:28','2020-07-14 18:48:28',NULL,'e7dcdc01-36af-4e65-90dd-c2ce38136cbd'),(40,NULL,27,1,'craft\\elements\\Entry',1,0,'2020-07-14 18:48:29','2020-07-14 18:48:29',NULL,'dbcf3f32-8b0b-41c8-85d5-1628161d14be'),(41,NULL,28,1,'craft\\elements\\Entry',1,0,'2020-07-14 18:48:52','2020-07-14 18:48:52',NULL,'a874c5c5-0cd7-420c-a229-fc9fa6d3d5dd'),(42,NULL,29,1,'craft\\elements\\Entry',1,0,'2020-07-14 18:51:02','2020-07-14 18:51:02',NULL,'0db76787-2208-47b1-8e93-3e936cacc057'),(43,NULL,30,1,'craft\\elements\\Entry',1,0,'2020-07-14 18:51:57','2020-07-14 18:51:57',NULL,'3f49f277-0547-466c-a097-6c3d94eb26f2'),(44,NULL,31,1,'craft\\elements\\Entry',1,0,'2020-07-14 18:55:57','2020-07-14 18:55:57',NULL,'58b18c36-63c4-4d38-ae13-09b1b580cc88'),(45,NULL,32,2,'craft\\elements\\Entry',1,0,'2020-07-14 19:17:11','2020-07-14 19:17:11',NULL,'3883f2f3-e4d9-49d5-9f32-506fc6e09a04'),(46,NULL,NULL,5,'craft\\elements\\GlobalSet',1,0,'2020-07-14 19:22:35','2020-07-14 19:23:02',NULL,'cc9ab0b0-6594-4bdd-a5ca-7279bf933f85'),(47,NULL,33,1,'craft\\elements\\Entry',1,0,'2020-08-24 13:40:20','2020-08-24 13:40:20',NULL,'c379889a-0c04-4c46-a5e4-a22987a160ff'),(48,NULL,34,1,'craft\\elements\\Entry',1,0,'2020-08-24 13:40:21','2020-08-24 13:40:21',NULL,'b3ce0179-79d2-46d1-a18f-1d31216b4d4e'),(49,2,NULL,6,'craft\\elements\\Entry',1,0,'2021-02-12 13:19:31','2021-02-12 13:19:45',NULL,'51558d77-3a4c-4b83-9888-f2ad05c4a647'),(50,NULL,35,6,'craft\\elements\\Entry',1,0,'2021-02-12 13:20:24','2021-02-12 13:20:24',NULL,'e2d3cb01-e028-48d8-91ac-3c3ba2146bc0'),(51,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2021-02-12 13:33:47','2021-02-12 13:55:21',NULL,'6baee5cc-de62-4a57-8ce9-ad6153939154'),(52,NULL,36,6,'craft\\elements\\Entry',1,0,'2021-02-12 13:34:08','2021-02-12 13:34:08',NULL,'631bb2d1-0d46-4d80-955c-27de3e9dcd86'),(53,NULL,37,2,'craft\\elements\\Entry',1,0,'2021-02-12 13:34:23','2021-02-12 13:34:23',NULL,'aa210be1-d14e-427f-9d52-7220a8ff7786'),(54,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2021-02-12 13:56:13','2021-02-12 13:56:13',NULL,'62729b48-12dd-4304-9bb1-92c04e2ac958'),(55,NULL,38,6,'craft\\elements\\Entry',1,0,'2021-02-12 14:23:02','2021-02-12 14:23:02',NULL,'f4619bb5-e8bf-46e6-9af8-b981227b8155'),(56,NULL,39,6,'craft\\elements\\Entry',1,0,'2021-02-12 14:28:37','2021-02-12 14:28:37',NULL,'f24c82c1-cb98-4a28-b1c9-94bdc0317f85');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-06-29 20:25:42','2020-06-29 20:25:42','e44db4d9-7b8f-451f-a2c0-df66161289eb'),(2,2,1,'home','__home__',1,'2020-06-29 21:30:31','2020-08-24 13:40:20','e8bc0065-39c1-4580-9e26-694c4827ab26'),(3,3,1,'home','__home__',1,'2020-06-29 21:30:31','2020-06-29 21:30:31','19d9bdb7-a2bb-4fc7-b3ac-363108a075d6'),(4,4,1,'home','__home__',1,'2020-06-30 16:57:46','2020-06-30 16:57:46','0f7b4950-055e-45cb-9a95-9bd9bbf413d4'),(5,5,1,'home','__home__',1,'2020-06-30 16:58:57','2020-06-30 16:58:57','c44a3160-a257-4e0f-99df-f8198d746200'),(6,6,1,'home','__home__',1,'2020-06-30 16:59:15','2020-06-30 16:59:15','d273553a-d649-425b-a0e2-811c1d3b2a48'),(7,7,1,'home','__home__',1,'2020-06-30 17:18:57','2020-06-30 17:18:57','ce290493-8907-4593-a197-b62d93e28bc3'),(8,8,1,'home','__home__',1,'2020-06-30 17:21:34','2020-06-30 17:21:34','cbe82667-82ec-4eb7-a8b1-943dd10c445a'),(9,9,1,'home','__home__',1,'2020-06-30 17:30:22','2020-06-30 17:30:22','4f08b378-1d62-49f3-b1c1-8d64a360134b'),(10,10,1,'home','__home__',1,'2020-06-30 17:37:37','2020-06-30 17:37:37','8d3c2de5-0866-4638-baeb-b521fcdac240'),(11,11,1,'__temp_0xdBWDi1d7AHNJRziZlZTUiPWOGITjTr8Vuj','posts/__temp_0xdBWDi1d7AHNJRziZlZTUiPWOGITjTr8Vuj',1,'2020-06-30 17:40:04','2020-06-30 17:40:11','1194c037-9046-4b86-a19a-ee310fe65712'),(13,13,1,'post-1','news/post-1',1,'2020-06-30 17:52:09','2020-06-30 19:52:32','b542e142-086e-4ad4-b4d9-0a43f2aece6c'),(14,14,1,'post-1','posts/post-1',1,'2020-06-30 17:52:09','2020-06-30 17:52:09','1ec20467-7cc8-457a-be09-13708f34a966'),(15,15,1,'post-1','posts/post-1',1,'2020-06-30 17:55:32','2020-06-30 17:55:32','88773a1f-42f6-4f38-9dc8-9bc6df365ef1'),(17,17,1,'news2','news/news2',1,'2020-06-30 17:58:39','2020-06-30 19:52:33','998c8d34-0381-4a1f-a3c3-3176ec7d6b8c'),(18,18,1,'news2','posts/news2',1,'2020-06-30 17:58:39','2020-06-30 17:58:39','e9ed91d2-69cb-4a5d-89d1-548a1986c78d'),(19,19,1,'post-1','posts/post-1',1,'2020-06-30 18:01:24','2020-06-30 18:01:24','e0c693dc-ddb4-4035-b684-5c73d87c25a6'),(20,20,1,'news2','posts/news2',1,'2020-06-30 18:04:27','2020-06-30 18:04:27','f7a378fc-791d-4ca6-9b3b-c077e9613ebf'),(21,21,1,'post-1','posts/post-1',1,'2020-06-30 18:04:44','2020-06-30 18:04:44','505aaf64-ad15-4352-acc0-3b443d9bdfce'),(23,23,1,'news-3','news/news-3',1,'2020-06-30 18:05:14','2020-06-30 19:52:33','c556c5eb-63f5-4840-92b3-9e7c448d5bbf'),(24,24,1,'news-3','posts/news-3',1,'2020-06-30 18:05:15','2020-06-30 18:05:15','99b47079-b2f5-4be9-b1f6-b5dd940e4143'),(26,26,1,'news-4','news/news-4',1,'2020-06-30 18:05:34','2020-06-30 19:52:33','524672f1-ca47-48b5-9f78-0a7a448a3981'),(27,27,1,'news-4','posts/news-4',1,'2020-06-30 18:05:35','2020-06-30 18:05:35','914044e3-d538-4775-8409-512823fe56a0'),(29,29,1,'news-5','news/news-5',1,'2020-06-30 18:05:57','2020-06-30 19:52:34','27fc2de1-5874-45b3-9317-840d969772e7'),(30,30,1,'news-5','posts/news-5',1,'2020-06-30 18:05:57','2020-06-30 18:05:57','2e081925-2953-4b97-b547-a4d94fdb709e'),(31,31,1,'home','__home__',1,'2020-06-30 18:06:36','2020-06-30 18:06:36','a85d2e9b-80b7-4efe-b30a-8052d07ca8b2'),(32,32,1,'post-1','posts/post-1',1,'2020-06-30 18:55:29','2020-06-30 18:55:29','5ea949e5-98cd-4c61-b89b-714464f1664d'),(33,33,1,'news-5','posts/news-5',1,'2020-06-30 18:55:39','2020-06-30 18:55:39','f87139f2-4403-4b6f-be7e-0e334bc9f354'),(34,34,1,'news-3','posts/news-3',1,'2020-06-30 18:55:56','2020-06-30 18:55:56','d8458bd9-23ef-43e0-b42f-7b4e6edbcb15'),(35,35,1,'news2','posts/news2',1,'2020-06-30 18:56:10','2020-06-30 18:56:10','9a359ce3-13e7-4819-8279-b211fbe747a9'),(36,36,1,'news2','posts/news2',1,'2020-06-30 18:56:38','2020-06-30 18:56:38','fb46b384-1baf-453c-934e-203fcecb7165'),(37,37,1,'news-4','posts/news-4',1,'2020-06-30 18:57:09','2020-06-30 18:57:09','0db65040-794a-484d-ab4c-9d0986bf9246'),(38,38,1,'home','__home__',1,'2020-06-30 19:06:36','2020-06-30 19:06:36','66f1c68e-7da9-43f3-b5dc-8fd03155028c'),(39,39,1,'home','__home__',1,'2020-07-14 18:48:28','2020-07-14 18:48:28','5b8f3b06-8b1a-4bff-86d6-2753cbfc2c4c'),(40,40,1,'home','__home__',1,'2020-07-14 18:48:29','2020-07-14 18:48:29','eca7789b-66c1-46fc-8bdb-35a5fd758ab4'),(41,41,1,'home','about',1,'2020-07-14 18:48:52','2020-07-14 18:48:52','b1c30f47-d517-4a2d-9b2d-294f1db4753b'),(42,42,1,'home','about',1,'2020-07-14 18:51:02','2020-07-14 18:51:02','49b7898e-85bb-4792-80eb-f68e2947d35b'),(43,43,1,'home','about',1,'2020-07-14 18:51:57','2020-07-14 18:51:57','a98400d5-4b1c-4bd1-91ae-b59228cf4296'),(44,44,1,'home','about',1,'2020-07-14 18:55:57','2020-07-14 18:55:57','82905efc-50ba-49a5-82c1-afec251db45a'),(45,45,1,'post-1','news/post-1',1,'2020-07-14 19:17:11','2020-07-14 19:17:11','a18f6d86-8ec6-4d6e-9f68-ee30b6cdf646'),(46,46,1,NULL,NULL,1,'2020-07-14 19:22:35','2020-07-14 19:22:35','2437f4b9-32e1-4dfe-945d-3e4704672cd5'),(47,47,1,'home','__home__',1,'2020-08-24 13:40:20','2020-08-24 13:40:20','d6d050ec-c564-4f5f-bf82-7bd03d7d13b5'),(48,48,1,'home','__home__',1,'2020-08-24 13:40:21','2020-08-24 13:40:21','f59c470b-7485-41d6-bf3a-3f9864dc8daf'),(49,49,1,'__temp_U4FOzDxBy8i5ELTmvbEtVwy0FCgm2ZHGdj3U','news/__temp_U4FOzDxBy8i5ELTmvbEtVwy0FCgm2ZHGdj3U',1,'2021-02-12 13:19:31','2021-02-12 13:19:31','c902945e-de92-4ac6-94f5-d4f30bbaaab2'),(50,50,1,'news-5','news/news-5',1,'2021-02-12 13:20:24','2021-02-12 13:20:24','66af4f6b-8a2e-475b-8252-a61649fa06aa'),(51,51,1,NULL,NULL,1,'2021-02-12 13:33:47','2021-02-12 13:33:47','b7bb4f00-315f-4832-8c1c-7fbbfaf01744'),(52,52,1,'news-5','news/news-5',1,'2021-02-12 13:34:08','2021-02-12 13:34:08','918b2f3a-4ef0-4494-ab8c-4daba75053b7'),(53,53,1,'post-1','news/post-1',1,'2021-02-12 13:34:23','2021-02-12 13:34:23','183c471c-37eb-473a-ad00-c2f228ebec0f'),(54,54,1,NULL,NULL,1,'2021-02-12 13:56:13','2021-02-12 13:56:13','3c5cbe13-7371-4bbd-bf73-a247768eb181'),(55,55,1,'news-5','news/news-5',1,'2021-02-12 14:23:02','2021-02-12 14:23:02','1b02fc15-3662-4ca4-92bc-d3df22c7b15e'),(56,56,1,'news-5','news/news-5',1,'2021-02-12 14:28:38','2021-02-12 14:28:38','53044815-e08d-4af1-9cc5-df0efe136a3d');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-29 21:30:31','2020-06-29 21:30:31','6e12fc7d-ffa4-48f1-b8c0-46720320208d'),(3,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-29 21:30:31','2020-06-29 21:30:31','d4d2b5d0-876b-4eb6-a70f-ecd1b534f8af'),(4,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 16:57:46','2020-06-30 16:57:46','665a026c-edb0-4032-b447-0bb5f6c029f9'),(5,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 16:58:57','2020-06-30 16:58:57','5b53b4b1-05c8-440d-8004-70a0befdd442'),(6,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 16:59:15','2020-06-30 16:59:15','3e6da5d3-a9b6-4b43-945b-0f9f052df8f7'),(7,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 17:18:57','2020-06-30 17:18:57','230ed16f-3397-4756-84fb-3d40a2310b3d'),(8,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 17:21:34','2020-06-30 17:21:34','a35598b3-9f10-4b1a-af4d-d6f157274ce8'),(9,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 17:30:22','2020-06-30 17:30:22','2a61ab4c-46fd-4047-b311-7a894ad4fdbc'),(10,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 17:37:37','2020-06-30 17:37:37','8a831661-7218-4df3-9069-e2fba75431b8'),(11,2,NULL,2,1,'2020-06-30 17:40:00',NULL,NULL,'2020-06-30 17:40:04','2020-06-30 17:40:04','83fff857-b33a-43d5-8dcd-18c5fbaced76'),(13,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2020-06-30 17:52:09','2020-06-30 17:52:09','ce1588b8-6c99-44cc-ad76-d1aded382161'),(14,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2020-06-30 17:52:10','2020-06-30 17:52:10','196591fe-3747-4644-9482-02fa2fd10da2'),(15,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2020-06-30 17:55:32','2020-06-30 17:55:32','bc88afcd-b527-405e-a303-71d8c70c3dd7'),(17,2,NULL,2,1,'2020-06-30 17:55:00',NULL,NULL,'2020-06-30 17:58:39','2020-06-30 17:58:39','5debf663-3b19-4d12-8f37-3808228ac339'),(18,2,NULL,2,1,'2020-06-30 17:55:00',NULL,NULL,'2020-06-30 17:58:39','2020-06-30 17:58:39','f7bc8fad-0ca9-4352-8b35-21bc289a8356'),(19,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2020-06-30 18:01:24','2020-06-30 18:01:24','401dbc86-fd44-4554-bbd1-0b28b9c47fa5'),(20,2,NULL,2,1,'2020-06-30 17:55:00',NULL,NULL,'2020-06-30 18:04:27','2020-06-30 18:04:27','c31822bf-83e6-4a4e-8bca-9d7c94579f53'),(21,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2020-06-30 18:04:45','2020-06-30 18:04:45','d1df82e2-b3aa-40ad-b029-54f6be455abc'),(23,2,NULL,2,1,'2020-06-30 18:04:00',NULL,NULL,'2020-06-30 18:05:15','2020-06-30 18:05:15','5dc0613b-3fbe-473f-9c0a-4f1a8c4b9d27'),(24,2,NULL,2,1,'2020-06-30 18:04:00',NULL,NULL,'2020-06-30 18:05:15','2020-06-30 18:05:15','9eea527e-1624-47f6-9e11-15de8ded97ef'),(26,2,NULL,2,1,'2020-06-30 18:05:00',NULL,NULL,'2020-06-30 18:05:35','2020-06-30 18:05:35','427d37f0-8592-4fd9-a4a7-235f5646bf96'),(27,2,NULL,2,1,'2020-06-30 18:05:00',NULL,NULL,'2020-06-30 18:05:35','2020-06-30 18:05:35','01b5ca46-4dff-4f81-b214-19884312be42'),(29,2,NULL,3,1,'2020-06-30 18:05:00',NULL,NULL,'2020-06-30 18:05:57','2021-02-12 13:20:24','3577534e-1924-4896-a183-cde3062bb23e'),(30,2,NULL,2,1,'2020-06-30 18:05:00',NULL,NULL,'2020-06-30 18:05:57','2020-06-30 18:05:57','682283ee-f00d-4bfc-b1b0-124adae0082c'),(31,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 18:06:36','2020-06-30 18:06:36','78264660-4234-443b-a712-f409d595721c'),(32,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2020-06-30 18:55:29','2020-06-30 18:55:29','c7887afa-6533-4b7a-93df-027f3fc444cb'),(33,2,NULL,2,1,'2020-06-30 18:05:00',NULL,NULL,'2020-06-30 18:55:39','2020-06-30 18:55:39','6c439805-1f9a-4156-9647-0b563fadd036'),(34,2,NULL,2,1,'2020-06-30 18:04:00',NULL,NULL,'2020-06-30 18:55:56','2020-06-30 18:55:56','2123dbaa-eeb7-42e7-a052-ac95ff668343'),(35,2,NULL,2,1,'2020-06-30 17:55:00',NULL,NULL,'2020-06-30 18:56:10','2020-06-30 18:56:10','507db3d4-47b0-4be5-8c08-bdbbbcf72807'),(36,2,NULL,2,1,'2020-06-30 17:55:00',NULL,NULL,'2020-06-30 18:56:38','2020-06-30 18:56:38','69deead1-aa99-41be-aaf5-b1f98c7a100a'),(37,2,NULL,2,1,'2020-06-30 18:05:00',NULL,NULL,'2020-06-30 18:57:09','2020-06-30 18:57:09','719fca33-e695-4d28-88da-c9ca1fa0457f'),(38,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-06-30 19:06:36','2020-06-30 19:06:36','506ba7f0-f97f-4992-8468-7e614f6312a4'),(39,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-07-14 18:48:28','2020-07-14 18:48:28','f0e83228-0e10-4022-b134-279c48796dc3'),(40,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-07-14 18:48:29','2020-07-14 18:48:29','3637a609-0c86-4bea-98be-68fed5930bce'),(41,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-07-14 18:48:52','2020-07-14 18:48:52','9465c91a-b4ba-4d86-883f-f8b3b05d063d'),(42,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-07-14 18:51:02','2020-07-14 18:51:02','7386b164-0053-422e-91f2-9082242233c6'),(43,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-07-14 18:51:57','2020-07-14 18:51:57','c1d8865e-7e8f-472c-9171-6375f35ad86c'),(44,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-07-14 18:55:57','2020-07-14 18:55:57','2ae27c83-fb15-4cea-b5f3-77bfdeca401a'),(45,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2020-07-14 19:17:11','2020-07-14 19:17:11','7caf916f-8fa4-472e-9047-75be65041195'),(47,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-08-24 13:40:20','2020-08-24 13:40:20','22b9881c-e32c-4ef8-8f58-cf3138632f51'),(48,1,NULL,1,NULL,'2020-06-29 21:30:00',NULL,NULL,'2020-08-24 13:40:21','2020-08-24 13:40:21','ace70605-c638-4662-9f71-708d6447a1d6'),(49,2,NULL,3,1,'2021-02-12 13:19:00',NULL,NULL,'2021-02-12 13:19:31','2021-02-12 13:19:42','72ee8bb8-a85d-4370-b4ee-9221a18d9f83'),(50,2,NULL,3,1,'2020-06-30 18:05:00',NULL,NULL,'2021-02-12 13:20:24','2021-02-12 13:20:24','3f99eb70-fea5-46fa-945a-2a5ef1bb54a6'),(52,2,NULL,3,1,'2020-06-30 18:05:00',NULL,NULL,'2021-02-12 13:34:08','2021-02-12 13:34:08','61a40096-2f71-4893-938d-03fa360dee7d'),(53,2,NULL,2,1,'2020-06-30 17:50:00',NULL,NULL,'2021-02-12 13:34:23','2021-02-12 13:34:23','51258b35-ddb5-4597-963a-59aa9f361802'),(55,2,NULL,3,1,'2020-06-30 18:05:00',NULL,NULL,'2021-02-12 14:23:02','2021-02-12 14:23:02','5bc01612-0600-4769-830f-2e23b53d458c'),(56,2,NULL,3,1,'2020-06-30 18:05:00',NULL,NULL,'2021-02-12 14:28:38','2021-02-12 14:28:38','8b8f6d3b-9b1f-4e8e-92da-c071b16b3d8a');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'home','home',1,'Title','{section.name|raw}',1,'2020-06-29 21:30:31','2020-06-30 17:18:56',NULL,'4befb6ab-ee84-4194-9603-dc521c00f7db'),(2,2,2,'Post','post',1,'Title','post',1,'2020-06-30 17:24:41','2021-02-12 13:18:46',NULL,'57d58503-7bd2-4b72-b99a-8df24fc1e233'),(3,2,6,'Image Post','imagePost',1,'Title','',2,'2021-02-12 13:18:26','2021-02-12 13:26:35',NULL,'3b66d9a0-701d-4148-9150-cdbcfac56067');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2020-06-29 20:25:42','2020-06-29 20:25:42','c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (22,1,12,3,0,1,'2020-07-14 18:55:56','2020-07-14 18:55:56','f55102e6-c9d6-4fad-bf11-16dae710b586'),(23,1,12,7,0,2,'2020-07-14 18:55:56','2020-07-14 18:55:56','bb5fbf4a-fe9c-4e20-a0c0-0c6d74e576fc'),(24,1,12,1,0,3,'2020-07-14 18:55:56','2020-07-14 18:55:56','e324aa3c-4fb1-4f2d-856e-62fe183848a0'),(25,5,13,10,0,1,'2020-07-14 19:22:48','2020-07-14 19:22:48','50185ebf-c53b-43bf-bbb9-7303e3a599ab'),(26,3,14,8,0,1,'2021-02-12 13:17:06','2021-02-12 13:17:06','2969ca3f-a946-4604-ad7a-6fbc2b3e9208'),(27,4,15,9,0,1,'2021-02-12 13:17:07','2021-02-12 13:17:07','9ba4801b-ce58-4f5e-b50d-17163ddfd6b3'),(32,2,17,4,0,1,'2021-02-12 13:18:46','2021-02-12 13:18:46','58319b85-fc51-425b-86a5-ebdea9047b09'),(33,2,17,6,0,2,'2021-02-12 13:18:46','2021-02-12 13:18:46','dc7ccf45-90f6-4ab4-b516-b4e1bf2deb70'),(34,2,17,5,0,3,'2021-02-12 13:18:46','2021-02-12 13:18:46','81ec01a0-ef76-4a34-ba1b-e41e889e5d0c'),(35,6,18,4,0,1,'2021-02-12 13:26:35','2021-02-12 13:26:35','0a639421-7c0e-413c-9631-14943f855f28'),(36,6,18,11,0,4,'2021-02-12 13:26:35','2021-02-12 13:26:35','09c83bc2-ac4a-4e9d-8df8-693ad1e8aa4d'),(37,6,18,6,0,2,'2021-02-12 13:26:35','2021-02-12 13:26:35','e9eb46af-1b5e-46ae-bd41-3aba6d1d780c'),(38,6,18,5,0,3,'2021-02-12 13:26:35','2021-02-12 13:26:35','c67553d3-6c18-4e97-9b33-a85e74830488');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2020-06-30 16:58:56','2020-06-30 16:58:56',NULL,'2174996e-496e-4b00-ada0-7a5130adc6de'),(2,'craft\\elements\\Entry','2020-06-30 17:50:46','2020-06-30 17:50:46',NULL,'a908346a-19f7-4fda-ba82-cf2f7d8f3849'),(3,'craft\\elements\\MatrixBlock','2020-07-14 18:55:28','2020-07-14 18:55:28',NULL,'b1f49157-3563-4890-b14a-b034f1f8869a'),(4,'craft\\elements\\MatrixBlock','2020-07-14 18:55:30','2020-07-14 18:55:30',NULL,'fd4d5cff-c2c1-4171-b000-f4deddbedb4b'),(5,'craft\\elements\\GlobalSet','2020-07-14 19:22:48','2020-07-14 19:22:48',NULL,'184c4970-7cd9-409d-8a6e-39514d8fcb96'),(6,'craft\\elements\\Entry','2021-02-12 13:18:26','2021-02-12 13:18:26',NULL,'c2ce45b1-5921-417f-b37a-2ac0107e2746');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (12,1,'Content',1,'2020-07-14 18:55:56','2020-07-14 18:55:56','8ff34ddf-29e9-4740-b2ce-1b46821472be'),(13,5,'Tab 1',1,'2020-07-14 19:22:48','2020-07-14 19:22:48','503670a8-7225-4d41-ae85-fbe71d691032'),(14,3,'Content',1,'2021-02-12 13:17:06','2021-02-12 13:17:06','882dcb16-c2d4-41a9-aa4d-493b3c104038'),(15,4,'Content',1,'2021-02-12 13:17:07','2021-02-12 13:17:07','699edb2a-939a-4b0e-ac54-b475e15d0bca'),(17,2,'Tab 1',1,'2021-02-12 13:18:46','2021-02-12 13:18:46','65c70ed5-a38f-4a03-85ed-612dbf9f8981'),(18,6,'Tab 1',1,'2021-02-12 13:26:35','2021-02-12 13:26:35','13d4ce09-a118-449b-9797-3857db7bf7b2');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,1,'Lead Text','leadText','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"Enter text\"}','2020-06-29 21:29:52','2020-06-30 17:16:50','f58b782d-00f1-4d15-a14b-f8f6bc45927e'),(3,1,'Show Lead Text','showLeadText','global','',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2020-06-30 17:20:42','2020-06-30 17:20:42','ec3d4ec9-b4b2-4752-a081-0f30aaa97885'),(4,1,'Header','header','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2020-06-30 17:47:22','2020-06-30 17:47:22','1da830a1-8e01-45b7-9b00-c0d1927ba86d'),(5,1,'Body Text','bodyText','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2020-06-30 17:49:47','2020-06-30 17:53:25','b5121e65-cd40-4536-8706-750bb58edfbe'),(6,1,'Summary Text','summaryText','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\"}','2020-06-30 18:53:16','2020-06-30 18:53:16','64c7d4ac-9d83-4215-a045-ba4b4f27be0b'),(7,1,'Matrix','matrix','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_matrix}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-07-14 18:55:23','2021-02-12 13:17:06','f3517deb-a6cd-415e-b0c5-78bbea57b509'),(8,NULL,'buttonLabel','buttonLabel','matrixBlockType:7822994e-c3c5-4f89-b9ff-226dfd27b1d8','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2020-07-14 18:55:28','2020-07-14 18:55:28','bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc'),(9,NULL,'text','text','matrixBlockType:b3e8ae77-678a-45ba-832a-3343382ce343','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2020-07-14 18:55:29','2020-07-14 18:55:29','51502800-f819-4b9e-845c-cefefaf46b1c'),(10,1,'Company Name','companyname','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2020-07-14 19:22:17','2021-02-12 13:16:55','4e1df08e-d01f-4e51-bdb6-3c280f0e4987'),(11,1,'Image','image','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":\"\",\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:f2988556-060b-4b24-8483-f9fa5b842aea\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"Add Image\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:f2988556-060b-4b24-8483-f9fa5b842aea\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:f2988556-060b-4b24-8483-f9fa5b842aea\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":\"\",\"viewMode\":\"large\"}','2021-02-12 13:25:23','2021-02-12 14:23:24','2ff59dc5-9326-492f-897d-4365f33b6c9f');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (46,'global','global',5,'2020-07-14 19:22:35','2020-07-14 19:22:48','cc9ab0b0-6594-4bdd-a5ca-7279bf933f85');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.4.25','3.4.10',0,'[]','0vPwNv7f9bug','2020-06-29 20:25:42','2021-02-12 14:23:24','5caa38c3-6a1d-4ebe-a587-571beda208d3');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,7,3,'button','button',1,'2020-07-14 18:55:28','2020-07-14 18:55:28','7822994e-c3c5-4f89-b9ff-226dfd27b1d8'),(2,7,4,'text','text',2,'2020-07-14 18:55:30','2020-07-14 18:55:30','b3e8ae77-678a-45ba-832a-3343382ce343');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_matrix`
--

DROP TABLE IF EXISTS `matrixcontent_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixcontent_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_button_buttonLabel` text,
  `field_text_text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_matrix_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_matrix_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_matrix_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_matrix_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_matrix`
--

LOCK TABLES `matrixcontent_matrix` WRITE;
/*!40000 ALTER TABLE `matrixcontent_matrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixcontent_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `migrations_pluginId_idx` (`pluginId`),
  KEY `migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,NULL,'app','Install','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','3ecdfd48-a8dd-4ec7-9012-90cc89632a07'),(2,NULL,'app','m150403_183908_migrations_table_changes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','1810e252-f91c-453b-b2d6-c885ab255b5e'),(3,NULL,'app','m150403_184247_plugins_table_changes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','aae86a86-0a2d-4915-91ba-72349c33f22c'),(4,NULL,'app','m150403_184533_field_version','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','3cd9312b-9a87-47d7-b6d0-ad84cf5de107'),(5,NULL,'app','m150403_184729_type_columns','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','376714aa-888a-41e0-9707-c74351437030'),(6,NULL,'app','m150403_185142_volumes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','7bfe03cf-6990-47de-976a-b62ac6ec9fa3'),(7,NULL,'app','m150428_231346_userpreferences','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e96c859b-20d3-43cf-b6c0-c4957b255883'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','5c1c1c83-e0d4-48d0-8dfa-dae95c2eb8a8'),(9,NULL,'app','m150617_213829_update_email_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9b2b325f-04bb-4fa0-82f4-4476e0aa1efb'),(10,NULL,'app','m150721_124739_templatecachequeries','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9015327b-28aa-4507-aead-b9e3ec97312e'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','abc44785-f4dc-4ae4-a53a-f2e372528e9f'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','f3de7369-7b04-48ed-aa96-62e35de2f9d8'),(13,NULL,'app','m151002_095935_volume_cache_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','133d5e7c-8b40-482f-8db0-faf9cd7683b5'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','46dd5698-df7a-4b2e-863b-1295d849ba5e'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','290af120-7029-497b-a2be-4f3376f454c5'),(16,NULL,'app','m151209_000000_move_logo','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','1fd180af-587c-4583-a8cd-271a075bfcc7'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','242bf763-1adc-4e7f-87b3-85f0e6493e4c'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9085b851-1005-43cc-a8f8-f08ab36e27c8'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','f3754fa3-887a-4808-ac68-f4755f06d7b8'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e5479427-4cb5-4604-8dba-6f7ec6d28d6b'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','3c82bb0f-5494-4c5f-a42b-9e636b9c25be'),(22,NULL,'app','m160727_194637_column_cleanup','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','173e14b8-7e5c-41b3-a633-674de2bf6409'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b5307b74-d0e1-499a-bbcc-bae7e4790806'),(24,NULL,'app','m160807_144858_sites','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','53273f2a-a1c0-4b0d-b3b8-7fbde82f6b6f'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','c8bb29e1-dc34-4cac-a2f1-9e47d3713b3d'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','82969384-3733-4a80-bdcd-8406d4ab612c'),(27,NULL,'app','m160912_230520_require_entry_type_id','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','631412f3-4374-4420-a9c5-740147d9ffe6'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','271188f2-73bd-4560-ad31-07d274c73005'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','4266c3bb-86b3-428f-9a15-0ade6cf8e15c'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','409d9bb1-d3a4-46dd-bdb2-aa95e6e0a469'),(31,NULL,'app','m160925_113941_route_uri_parts','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','6ccc8c16-0999-4975-b6c2-5f5c17906b68'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','98208fb2-5741-412c-a9bd-7877552dc9eb'),(33,NULL,'app','m161007_130653_update_email_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','663d5de4-aae6-4186-86c7-e47fcd2cc803'),(34,NULL,'app','m161013_175052_newParentId','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e79af488-ad50-4b07-9b84-7c2ae3f7436d'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','ff826c15-1308-407a-a0ee-aa8430e587cc'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','531e8c46-2ae0-4b2d-97ca-82f4d571430e'),(37,NULL,'app','m161025_000000_fix_char_columns','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','d54d1a00-22b4-4258-92ed-68fd2ead8e53'),(38,NULL,'app','m161029_124145_email_message_languages','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','98474790-4217-4132-81e4-c990ea0c150f'),(39,NULL,'app','m161108_000000_new_version_format','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','959380a9-77d6-4547-a3b7-13e88df07777'),(40,NULL,'app','m161109_000000_index_shuffle','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a5a4feef-e505-4bc4-8a52-2511f40f921e'),(41,NULL,'app','m161122_185500_no_craft_app','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','8f46088d-7389-4ab4-b73d-dcd17168a077'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a304ce88-278e-43ee-8124-4725a5501b34'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e89aff29-626b-4523-9b66-d55cbd738a23'),(44,NULL,'app','m170114_161144_udates_permission','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','67478a12-ed97-4a1f-8f13-f18a335b1937'),(45,NULL,'app','m170120_000000_schema_cleanup','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a0b19ab1-098a-4534-92dc-ec6c13a22b86'),(46,NULL,'app','m170126_000000_assets_focal_point','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b12b7007-eed0-4191-aab6-6af33e95867b'),(47,NULL,'app','m170206_142126_system_name','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','0fbb1263-c93d-400c-b2df-36d68ecc129d'),(48,NULL,'app','m170217_044740_category_branch_limits','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b6065b2c-a012-4abc-bfa7-d5be6172da35'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b929ed19-fb85-4d0e-8ecf-11c0565ea87f'),(50,NULL,'app','m170223_224012_plain_text_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','efb64ed8-9915-4cc6-b598-b5593d86ce13'),(51,NULL,'app','m170227_120814_focal_point_percentage','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','3dfab869-2f0e-4607-8e45-d361c2bf0e00'),(52,NULL,'app','m170228_171113_system_messages','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','ff267e23-dd6e-468e-84ab-18fbbeaa83a4'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','438662c4-27f0-4a43-943f-54c023bc5d26'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','5fbcf6d1-ee9a-431f-b9cc-ca6ec2ec8ce5'),(55,NULL,'app','m170523_190652_element_field_layout_ids','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','98759cd6-61ed-4eff-aa65-eb362c625f31'),(56,NULL,'app','m170612_000000_route_index_shuffle','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a1e4a58f-639d-4b86-8066-6e9db86e851c'),(57,NULL,'app','m170621_195237_format_plugin_handles','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','41ea94b9-36a1-4e41-8689-f6afad25b350'),(58,NULL,'app','m170630_161027_deprecation_line_nullable','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','23112b7c-f27e-4735-bf3d-95179c401ee9'),(59,NULL,'app','m170630_161028_deprecation_changes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e2bb2dc7-9c00-4d3f-8db2-5d36a316f29a'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','72c5ac6e-b38d-448e-975d-872b7bf8c972'),(61,NULL,'app','m170704_134916_sites_tables','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','502ed5eb-557c-435e-a0b1-52b6c4b74041'),(62,NULL,'app','m170706_183216_rename_sequences','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','00248240-646a-4700-9f23-24fcb5335a54'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','284885e8-2f0b-4dd9-a850-3769d47d75e0'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','747e2e92-1bb0-4ffc-a68c-39fa99d9a5b9'),(65,NULL,'app','m170810_201318_create_queue_table','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','ec313fa2-be8a-496c-8e46-c2704fff10bd'),(66,NULL,'app','m170903_192801_longblob_for_queue_jobs','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','5b2648c2-25b6-4531-9654-97a46f7992fb'),(67,NULL,'app','m170914_204621_asset_cache_shuffle','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','f51a79c6-96d9-46b6-a399-4623bfbda967'),(68,NULL,'app','m171011_214115_site_groups','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','91a1d6ec-4f13-412f-b829-0d9ffb6bd2a2'),(69,NULL,'app','m171012_151440_primary_site','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','349d64cb-721e-4f0c-922f-9afc50ce1816'),(70,NULL,'app','m171013_142500_transform_interlace','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','d9cec1a3-6883-4aab-8729-73868f506280'),(71,NULL,'app','m171016_092553_drop_position_select','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b26e6e20-a5f9-4eb6-b663-b5aa9f1e27b6'),(72,NULL,'app','m171016_221244_less_strict_translation_method','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','7f3368e0-6e4c-4f4b-bf39-046cd27be06e'),(73,NULL,'app','m171107_000000_assign_group_permissions','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','f3976ca7-d1fe-4e86-886c-6ffe5af57030'),(74,NULL,'app','m171117_000001_templatecache_index_tune','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','f3d7ddce-aba3-4417-8877-80c68ef5907d'),(75,NULL,'app','m171126_105927_disabled_plugins','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e60541a2-e8cd-47fc-ab35-34ce6ef471c9'),(76,NULL,'app','m171130_214407_craftidtokens_table','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','3f1f511e-1497-4d4a-abbe-c8d8ed48d2ed'),(77,NULL,'app','m171202_004225_update_email_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','ab92b7a8-a1da-4732-9933-a61a443d789f'),(78,NULL,'app','m171204_000001_templatecache_index_tune_deux','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b3fccd37-e76c-4245-8e81-fe26e331b10f'),(79,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','1967fd3a-aafa-43be-b5ec-f8a723bb113e'),(80,NULL,'app','m171218_143135_longtext_query_column','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','2b3257e3-ecf7-4592-b037-96cef84b2988'),(81,NULL,'app','m171231_055546_environment_variables_to_aliases','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e14d95df-62c7-4c61-8b8a-dbcac6ae8bb3'),(82,NULL,'app','m180113_153740_drop_users_archived_column','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','209c3e97-8369-403f-b0f6-91b30eab3dba'),(83,NULL,'app','m180122_213433_propagate_entries_setting','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','15f8343e-c9e5-4cc0-8bb0-59507f8830ae'),(84,NULL,'app','m180124_230459_fix_propagate_entries_values','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','96a4ec4c-9754-4704-adbc-bf0af05a473c'),(85,NULL,'app','m180128_235202_set_tag_slugs','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','c1d20497-7024-4237-a9e6-87754bc54bb4'),(86,NULL,'app','m180202_185551_fix_focal_points','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b3f94481-01e1-4979-8441-8def4562f68f'),(87,NULL,'app','m180217_172123_tiny_ints','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','caa4ab85-33fe-431f-b97f-92c9c0754437'),(88,NULL,'app','m180321_233505_small_ints','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','6863a598-57f6-4370-8f22-d07ab18c442f'),(89,NULL,'app','m180328_115523_new_license_key_statuses','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a6cc4360-c627-4023-8e50-41d463dd28d2'),(90,NULL,'app','m180404_182320_edition_changes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','6093a3e3-e17a-4b33-8bfd-66db70b490f3'),(91,NULL,'app','m180411_102218_fix_db_routes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9ab936fd-6db3-4c99-891c-eeedd80ffc15'),(92,NULL,'app','m180416_205628_resourcepaths_table','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a418e756-41db-4a05-91de-ee731e98c87c'),(93,NULL,'app','m180418_205713_widget_cleanup','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','6c102720-c947-40f5-b611-9215cd343a1d'),(94,NULL,'app','m180425_203349_searchable_fields','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9e6e7a4d-85b2-48f3-83b6-66d5716c5dee'),(95,NULL,'app','m180516_153000_uids_in_field_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','76a28ed4-5d37-41a3-b501-b557410a3476'),(96,NULL,'app','m180517_173000_user_photo_volume_to_uid','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','08693ee2-1d62-459b-afda-720011a1b07c'),(97,NULL,'app','m180518_173000_permissions_to_uid','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','7194dde7-e408-4b6f-86b8-713afb621525'),(98,NULL,'app','m180520_173000_matrix_context_to_uids','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e4a61204-1dde-4682-9207-d4fc5471238e'),(99,NULL,'app','m180521_172900_project_config_table','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','3f5ef0a9-79b1-4861-91e7-ef3db43aefff'),(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','4211c3b3-6a51-43f1-bb7b-b94d55f047d4'),(101,NULL,'app','m180731_162030_soft_delete_sites','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','6e4e27c1-14b7-490a-aed9-2708a1b40697'),(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','16343c3f-0e2e-4b02-80ea-c5651d6e212b'),(103,NULL,'app','m180810_214439_soft_delete_elements','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','5714906d-12ec-4c0d-bd67-fe4638d9264c'),(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','d7437949-baf6-48c5-a9b3-71e7e6aa0045'),(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','2209b803-74a9-44c3-a954-258f0d556b12'),(106,NULL,'app','m180904_112109_permission_changes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b01ea664-282c-47df-914c-f53169cd7b8a'),(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','674561a2-475d-40e8-9def-68f8708643ef'),(108,NULL,'app','m181011_160000_soft_delete_asset_support','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b32f4308-bf7c-46a8-b402-785d9e015e7e'),(109,NULL,'app','m181016_183648_set_default_user_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','fc6c66b9-ab5c-408b-8d6d-e88b0d51ec9a'),(110,NULL,'app','m181017_225222_system_config_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','71eef07a-c031-4fe3-a5bd-51845169ca3e'),(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','93715ca1-60be-4554-8ddd-a8adb44fb566'),(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e93071af-70c7-41e7-ad05-73e931c4ccea'),(113,NULL,'app','m181112_203955_sequences_table','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','8b613bfe-2065-4576-9141-2558bf870e68'),(114,NULL,'app','m181121_001712_cleanup_field_configs','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','3a939e1a-bf54-4b02-89fe-13577b9a304b'),(115,NULL,'app','m181128_193942_fix_project_config','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','152a89ba-e512-4972-8eb0-516e97d7c898'),(116,NULL,'app','m181130_143040_fix_schema_version','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','1bf469aa-d36d-44e6-ae04-e2024c409614'),(117,NULL,'app','m181211_143040_fix_entry_type_uids','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','03e1ec72-c356-4eea-93b8-ff0514b85b0f'),(118,NULL,'app','m181213_102500_config_map_aliases','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','ba8ba07c-22dd-458c-b5bb-7b46ee7ad6ba'),(119,NULL,'app','m181217_153000_fix_structure_uids','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9cfd63e8-8a91-4a5c-a605-ba352ffbe226'),(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','8b1298ae-794e-4706-8770-ed981f022873'),(121,NULL,'app','m190108_110000_cleanup_project_config','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','16662216-7595-4044-a558-6ea32f15ef75'),(122,NULL,'app','m190108_113000_asset_field_setting_change','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','ae527cc6-51f8-4b06-9491-c141ece4f087'),(123,NULL,'app','m190109_172845_fix_colspan','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e5bd9b2e-08a1-4ca3-b344-e51755492af2'),(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a1be470e-a040-4d37-9a59-d0d53f6c198e'),(125,NULL,'app','m190110_214819_soft_delete_volumes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','f4b37ca5-fe89-4938-abf2-05e50cd75881'),(126,NULL,'app','m190112_124737_fix_user_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','f7c68ded-bcc8-4246-979e-7cb0bba50770'),(127,NULL,'app','m190112_131225_fix_field_layouts','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','4b546d2a-e850-4ce7-a740-163c85b34e4a'),(128,NULL,'app','m190112_201010_more_soft_deletes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','16720373-7369-4326-9d4c-2fe76ea257fe'),(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','d97e94f2-95d1-40a0-a301-7ccb195563c7'),(130,NULL,'app','m190121_120000_rich_text_config_setting','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','4edd63f9-c0fb-4d7f-bcd3-5b729a42f19f'),(131,NULL,'app','m190125_191628_fix_email_transport_password','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','77933a30-a699-4772-bec8-3959eae3ab66'),(132,NULL,'app','m190128_181422_cleanup_volume_folders','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9f8f849e-e412-4262-bd56-dc2956f2356a'),(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','795145d5-fb0e-4976-8844-d1c9ef3a8822'),(134,NULL,'app','m190208_140000_reset_project_config_mapping','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e31067bc-c32e-4a0b-9b39-1898e065db2c'),(135,NULL,'app','m190218_143000_element_index_settings_uid','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','2d42e44f-bb14-4265-8ed2-31fc143dc653'),(136,NULL,'app','m190312_152740_element_revisions','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','dfbdba9e-ca3f-4aed-9c8a-e5c811394280'),(137,NULL,'app','m190327_235137_propagation_method','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','e2f22ce7-893d-479e-b1c3-3814411a5035'),(138,NULL,'app','m190401_223843_drop_old_indexes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','b85703d3-c51a-4992-b998-f61ad09f0009'),(139,NULL,'app','m190416_014525_drop_unique_global_indexes','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','48996a63-56af-429d-8e19-a8604db6db37'),(140,NULL,'app','m190417_085010_add_image_editor_permissions','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9787530c-2e8f-4f30-895b-4c2c9adae9d4'),(141,NULL,'app','m190502_122019_store_default_user_group_uid','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','08875c4a-8428-4553-a578-78fd9accd7fa'),(142,NULL,'app','m190504_150349_preview_targets','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','fb2f9b2e-f23b-4170-9eb8-25dc849d9f36'),(143,NULL,'app','m190516_184711_job_progress_label','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','28319ade-c2c0-4d2d-8e90-7840bb7fa64c'),(144,NULL,'app','m190523_190303_optional_revision_creators','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','143de5d1-bfb0-4c39-b4aa-98b71bb18f23'),(145,NULL,'app','m190529_204501_fix_duplicate_uids','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','611fb7fc-fb46-4242-bdb9-053448c786be'),(146,NULL,'app','m190605_223807_unsaved_drafts','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','cd70514f-c853-4c7b-94e9-46cb508aac4b'),(147,NULL,'app','m190607_230042_entry_revision_error_tables','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','6e12bdbc-55d4-44bc-a435-01a266323c83'),(148,NULL,'app','m190608_033429_drop_elements_uid_idx','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a455648a-5b7d-44a1-8e83-210fb5d5db5c'),(149,NULL,'app','m190617_164400_add_gqlschemas_table','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a8275e5e-ba44-4740-a65b-4a01b547bc79'),(150,NULL,'app','m190624_234204_matrix_propagation_method','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','481b850f-9c30-43e1-b08d-6f535892ba09'),(151,NULL,'app','m190711_153020_drop_snapshots','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','d8c844b7-951c-492b-a4c1-945512d2b0a9'),(152,NULL,'app','m190712_195914_no_draft_revisions','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','8c14ba37-da9c-4ed4-9503-f65c172ca911'),(153,NULL,'app','m190723_140314_fix_preview_targets_column','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','388da887-2739-47ea-ab0a-2031ce718558'),(154,NULL,'app','m190820_003519_flush_compiled_templates','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','4b79224c-b367-4111-a9f7-a244f6df5129'),(155,NULL,'app','m190823_020339_optional_draft_creators','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','dc902b7b-cbb6-4ec0-9b3a-a1bde1b65ec7'),(156,NULL,'app','m190913_152146_update_preview_targets','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','dbb1257c-3622-4da3-9235-56ec06ea9968'),(157,NULL,'app','m191107_122000_add_gql_project_config_support','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','048e9285-b3a6-40a5-b7d8-df021f7e79cb'),(158,NULL,'app','m191204_085100_pack_savable_component_settings','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','1055eed9-9ce5-451e-946a-5ae9b18ffdbf'),(159,NULL,'app','m191206_001148_change_tracking','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','a5ebb35f-9a11-4690-b66f-71da5b80913a'),(160,NULL,'app','m191216_191635_asset_upload_tracking','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','ae38998b-1190-4d78-9b34-8961e6a3b9f8'),(161,NULL,'app','m191222_002848_peer_asset_permissions','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','6dd0cb7c-3309-4026-b11d-a8ac1b4794ba'),(162,NULL,'app','m200127_172522_queue_channels','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','cb6d9aaf-0f3b-4f2a-bafa-410c4d3a3f9c'),(163,NULL,'app','m200211_175048_truncate_element_query_cache','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','006ed918-330c-43f2-bcda-f8bde66c9120'),(164,NULL,'app','m200213_172522_new_elements_index','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','5a44a9b9-83e7-42a3-817f-098ee560833e'),(165,NULL,'app','m200228_195211_long_deprecation_messages','2020-06-29 20:25:43','2020-06-29 20:25:43','2020-06-29 20:25:43','9723eb05-25d6-422c-bb49-33ac3fe5945d');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1613139804'),('email.fromEmail','\"justin.poirier@medavie.bluecross.ca\"'),('email.fromName','\"craft-poc\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7.name','\"Common\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.contentColumnType','\"text\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.handle','\"header\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.instructions','\"\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.name','\"Header\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.searchable','true'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.settings.byteLimit','null'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.settings.charLimit','null'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.settings.code','\"\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.settings.columnType','null'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.settings.initialRows','\"4\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.settings.multiline','\"\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.settings.placeholder','\"\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.translationKeyFormat','null'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.translationMethod','\"none\"'),('fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.type','\"craft\\\\fields\\\\PlainText\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.contentColumnType','\"string\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.handle','\"image\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.instructions','\"\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.name','\"Image\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.searchable','true'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.allowedKinds.0','\"image\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.allowSelfRelations','\"\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.defaultUploadLocationSource','\"volume:f2988556-060b-4b24-8483-f9fa5b842aea\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.defaultUploadLocationSubpath','\"\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.limit','\"1\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.localizeRelations','false'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.restrictFiles','\"1\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.selectionLabel','\"Add Image\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.showUnpermittedFiles','false'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.showUnpermittedVolumes','false'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.singleUploadLocationSource','\"volume:f2988556-060b-4b24-8483-f9fa5b842aea\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.singleUploadLocationSubpath','\"\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.source','null'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.sources.0','\"volume:f2988556-060b-4b24-8483-f9fa5b842aea\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.targetSiteId','null'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.useSingleFolder','false'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.validateRelatedElements','\"\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.settings.viewMode','\"large\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.translationKeyFormat','null'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.translationMethod','\"site\"'),('fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.type','\"craft\\\\fields\\\\Assets\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.contentColumnType','\"text\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.handle','\"companyname\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.instructions','\"\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.name','\"Company Name\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.searchable','true'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.settings.byteLimit','null'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.settings.charLimit','null'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.settings.code','\"\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.settings.columnType','null'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.settings.initialRows','\"4\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.settings.multiline','\"\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.settings.placeholder','\"\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.translationKeyFormat','null'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.translationMethod','\"none\"'),('fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.type','\"craft\\\\fields\\\\PlainText\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.contentColumnType','\"text\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.handle','\"summaryText\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.instructions','\"\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.name','\"Summary Text\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.searchable','true'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.settings.byteLimit','null'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.settings.charLimit','null'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.settings.code','\"\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.settings.columnType','null'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.settings.initialRows','\"4\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.settings.multiline','\"1\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.settings.placeholder','\"\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.translationKeyFormat','null'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.translationMethod','\"none\"'),('fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.type','\"craft\\\\fields\\\\PlainText\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.contentColumnType','\"text\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.handle','\"bodyText\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.instructions','\"\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.name','\"Body Text\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.searchable','true'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.settings.byteLimit','null'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.settings.charLimit','null'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.settings.code','\"\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.settings.columnType','null'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.settings.initialRows','\"4\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.settings.multiline','\"1\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.settings.placeholder','\"\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.translationKeyFormat','null'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.translationMethod','\"none\"'),('fields.b5121e65-cd40-4536-8706-750bb58edfbe.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.contentColumnType','\"boolean\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.handle','\"showLeadText\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.instructions','\"\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.name','\"Show Lead Text\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.searchable','true'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.settings.default','\"\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.translationKeyFormat','null'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.translationMethod','\"none\"'),('fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.contentColumnType','\"string\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.handle','\"matrix\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.instructions','\"\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.name','\"Matrix\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.searchable','true'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.settings.contentTable','\"{{%matrixcontent_matrix}}\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.settings.maxBlocks','\"\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.settings.minBlocks','\"\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.settings.propagationMethod','\"all\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.translationKeyFormat','null'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.translationMethod','\"site\"'),('fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.type','\"craft\\\\fields\\\\Matrix\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.contentColumnType','\"text\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.fieldGroup','\"c09eaa15-1ea7-44c2-88cc-bc5f5f1728d7\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.handle','\"leadText\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.instructions','\"\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.name','\"Lead Text\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.searchable','false'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.settings.byteLimit','null'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.settings.charLimit','null'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.settings.code','\"\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.settings.columnType','null'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.settings.initialRows','\"4\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.settings.multiline','\"1\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.settings.placeholder','\"Enter text\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.translationKeyFormat','null'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.translationMethod','\"none\"'),('fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.type','\"craft\\\\fields\\\\PlainText\"'),('globalSets.cc9ab0b0-6594-4bdd-a5ca-7279bf933f85.fieldLayouts.184c4970-7cd9-409d-8a6e-39514d8fcb96.tabs.0.fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.required','false'),('globalSets.cc9ab0b0-6594-4bdd-a5ca-7279bf933f85.fieldLayouts.184c4970-7cd9-409d-8a6e-39514d8fcb96.tabs.0.fields.4e1df08e-d01f-4e51-bdb6-3c280f0e4987.sortOrder','1'),('globalSets.cc9ab0b0-6594-4bdd-a5ca-7279bf933f85.fieldLayouts.184c4970-7cd9-409d-8a6e-39514d8fcb96.tabs.0.name','\"Tab 1\"'),('globalSets.cc9ab0b0-6594-4bdd-a5ca-7279bf933f85.fieldLayouts.184c4970-7cd9-409d-8a6e-39514d8fcb96.tabs.0.sortOrder','1'),('globalSets.cc9ab0b0-6594-4bdd-a5ca-7279bf933f85.handle','\"global\"'),('globalSets.cc9ab0b0-6594-4bdd-a5ca-7279bf933f85.name','\"global\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.field','\"f3517deb-a6cd-415e-b0c5-78bbea57b509\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fieldLayouts.b1f49157-3563-4890-b14a-b034f1f8869a.tabs.0.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.required','false'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fieldLayouts.b1f49157-3563-4890-b14a-b034f1f8869a.tabs.0.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.sortOrder','1'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fieldLayouts.b1f49157-3563-4890-b14a-b034f1f8869a.tabs.0.name','\"Content\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fieldLayouts.b1f49157-3563-4890-b14a-b034f1f8869a.tabs.0.sortOrder','1'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.contentColumnType','\"text\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.fieldGroup','null'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.handle','\"buttonLabel\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.instructions','\"\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.name','\"buttonLabel\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.searchable','true'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.settings.byteLimit','null'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.settings.charLimit','null'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.settings.code','\"\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.settings.columnType','null'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.settings.initialRows','\"4\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.settings.multiline','\"\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.settings.placeholder','\"\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.translationKeyFormat','null'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.translationMethod','\"none\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.fields.bbb83ed7-ed1c-49ff-80bf-e9d451f60ebc.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.handle','\"button\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.name','\"button\"'),('matrixBlockTypes.7822994e-c3c5-4f89-b9ff-226dfd27b1d8.sortOrder','1'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.field','\"f3517deb-a6cd-415e-b0c5-78bbea57b509\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fieldLayouts.fd4d5cff-c2c1-4171-b000-f4deddbedb4b.tabs.0.fields.51502800-f819-4b9e-845c-cefefaf46b1c.required','false'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fieldLayouts.fd4d5cff-c2c1-4171-b000-f4deddbedb4b.tabs.0.fields.51502800-f819-4b9e-845c-cefefaf46b1c.sortOrder','1'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fieldLayouts.fd4d5cff-c2c1-4171-b000-f4deddbedb4b.tabs.0.name','\"Content\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fieldLayouts.fd4d5cff-c2c1-4171-b000-f4deddbedb4b.tabs.0.sortOrder','1'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.contentColumnType','\"text\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.fieldGroup','null'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.handle','\"text\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.instructions','\"\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.name','\"text\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.searchable','true'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.settings.byteLimit','null'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.settings.charLimit','null'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.settings.code','\"\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.settings.columnType','null'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.settings.initialRows','\"4\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.settings.multiline','\"\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.settings.placeholder','\"\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.translationKeyFormat','null'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.translationMethod','\"none\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.fields.51502800-f819-4b9e-845c-cefefaf46b1c.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.handle','\"text\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.name','\"text\"'),('matrixBlockTypes.b3e8ae77-678a-45ba-832a-3343382ce343.sortOrder','2'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.enableVersioning','true'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.required','false'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.sortOrder','1'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.required','false'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.2ff59dc5-9326-492f-897d-4365f33b6c9f.sortOrder','4'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.required','false'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.sortOrder','2'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.b5121e65-cd40-4536-8706-750bb58edfbe.required','false'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.fields.b5121e65-cd40-4536-8706-750bb58edfbe.sortOrder','3'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.name','\"Tab 1\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.fieldLayouts.c2ce45b1-5921-417f-b37a-2ac0107e2746.tabs.0.sortOrder','1'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.handle','\"imagePost\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.hasTitleField','true'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.name','\"Image Post\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.sortOrder','2'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.titleFormat','\"\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.3b66d9a0-701d-4148-9150-cdbcfac56067.titleLabel','\"Title\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.required','false'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.fields.1da830a1-8e01-45b7-9b00-c0d1927ba86d.sortOrder','1'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.required','false'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.fields.64c7d4ac-9d83-4215-a045-ba4b4f27be0b.sortOrder','2'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.fields.b5121e65-cd40-4536-8706-750bb58edfbe.required','false'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.fields.b5121e65-cd40-4536-8706-750bb58edfbe.sortOrder','3'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.name','\"Tab 1\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.fieldLayouts.a908346a-19f7-4fda-ba82-cf2f7d8f3849.tabs.0.sortOrder','1'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.handle','\"post\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.hasTitleField','true'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.name','\"Post\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.sortOrder','1'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.titleFormat','\"post\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.entryTypes.57d58503-7bd2-4b72-b99a-8df24fc1e233.titleLabel','\"Title\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.handle','\"news\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.name','\"posts\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.propagationMethod','\"all\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.enabledByDefault','true'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.hasUrls','true'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.template','\"news/entry\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.uriFormat','\"news/{slug}\"'),('sections.05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a.type','\"channel\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.enableVersioning','true'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.required','false'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.fields.ec3d4ec9-b4b2-4752-a081-0f30aaa97885.sortOrder','1'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.required','false'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.fields.f3517deb-a6cd-415e-b0c5-78bbea57b509.sortOrder','2'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.required','false'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.fields.f58b782d-00f1-4d15-a14b-f8f6bc45927e.sortOrder','3'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.name','\"Content\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.fieldLayouts.2174996e-496e-4b00-ada0-7a5130adc6de.tabs.0.sortOrder','1'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.handle','\"home\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.hasTitleField','true'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.name','\"home\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.sortOrder','1'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.titleFormat','\"{section.name|raw}\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.entryTypes.4befb6ab-ee84-4194-9603-dc521c00f7db.titleLabel','\"Title\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.handle','\"home\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.name','\"home\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.propagationMethod','\"all\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.enabledByDefault','true'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.hasUrls','true'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.template','\"index\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.siteSettings.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.uriFormat','\"__home__\"'),('sections.b2e2fc23-ed34-4f09-a510-8d8e2de71c83.type','\"single\"'),('siteGroups.c4552b4c-014f-41af-99c7-31d130ae2ced.name','\"craft-poc\"'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.baseUrl','\"$DEFAULT_SITE_URL\"'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.handle','\"default\"'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.hasUrls','true'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.language','\"en-US\"'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.name','\"Medavie News\"'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.primary','true'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.siteGroup','\"c4552b4c-014f-41af-99c7-31d130ae2ced\"'),('sites.c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Medavie News\"'),('system.schemaVersion','\"3.4.10\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','\"\"'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.f2988556-060b-4b24-8483-f9fa5b842aea.handle','\"local\"'),('volumes.f2988556-060b-4b24-8483-f9fa5b842aea.hasUrls','true'),('volumes.f2988556-060b-4b24-8483-f9fa5b842aea.name','\"local\"'),('volumes.f2988556-060b-4b24-8483-f9fa5b842aea.settings.path','\"C:/projects/craft-poc/web/assets/images\"'),('volumes.f2988556-060b-4b24-8483-f9fa5b842aea.sortOrder','1'),('volumes.f2988556-060b-4b24-8483-f9fa5b842aea.type','\"craft\\\\volumes\\\\Local\"'),('volumes.f2988556-060b-4b24-8483-f9fa5b842aea.url','\"$ASSETS_URL\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (2,11,52,NULL,51,1,'2021-02-12 13:34:08','2021-02-12 13:34:08','22c24834-1024-4f8a-99e0-71d9f847e109'),(4,11,55,NULL,54,1,'2021-02-12 14:23:02','2021-02-12 14:23:02','c604db9b-fa77-4ee5-a73d-0d722c75b2ca'),(5,11,29,NULL,51,1,'2021-02-12 14:28:37','2021-02-12 14:28:37','cde0a720-bc34-401e-884c-3abf8beb4951'),(6,11,56,NULL,51,1,'2021-02-12 14:28:38','2021-02-12 14:28:38','b234a880-983a-4a2d-b5e1-f692f3b50a30');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('12995a4a','@app/web/assets/login/dist'),('133e5a4d','@app/web/assets/fieldsettings/dist'),('1484335e','@app/web/assets/pluginstore/dist'),('178a4aa','@lib/element-resize-detector'),('1ced08ff','@lib/fileupload'),('2286aa23','@app/web/assets/utilities/dist'),('23526eb9','@app/web/assets/installer/dist'),('267cc963','@lib/velocity'),('2c5beae8','@lib/fabric'),('3458b509','@lib/axios'),('37f33e1e','@bower/jquery/dist'),('391d3ed6','@lib/garnishjs'),('3a135c3','@lib/jquery-touch-events'),('3a5b668b','@lib/jquery.payment'),('4050901','@lib/picturefill'),('44915749','@app/web/assets/feed/dist'),('4fe9b1fa','@lib/vue'),('507b2485','@lib/selectize'),('5a17600f','@lib/xregexp'),('5db0cf3f','@app/web/assets/recententries/dist'),('5e7650e5','@app/web/assets/matrixsettings/dist'),('630a8d51','@app/web/assets/updateswidget/dist'),('63c75bde','@app/web/assets/admintable/dist'),('68d552c6','@lib/jquery-ui'),('735fdf6e','@app/web/assets/updater/dist'),('797316ab','@app/web/assets/dashboard/dist'),('85076d13','@lib/jquery.payment'),('88af3586','@bower/jquery/dist'),('8a1cd031','@lib/fabric'),('8c1e2ca9','@app/web/assets/recententries/dist'),('971b91c5','@app/web/assets/craftsupport/dist'),('97614c6b','@app/web/assets/plugins/dist'),('9920c2fb','@lib/velocity'),('9c0d698f','@app/web/assets/updates/dist'),('9f4e494','@app/web/assets/craftsupport/dist'),('9f5a040f','@lib/garnishjs'),('a5e60f1a','@lib/jquery-touch-events'),('a73f9e73','@lib/element-resize-detector'),('aa02950','@lib/d3'),('ace71389','@lib/d3'),('ad91505','@app/web/assets/generalsettings/dist'),('b2a46ec7','@app/web/assets/updateswidget/dist'),('b53dcf70','@app/web/assets/sites/dist'),('b673d490','@app/web/assets/editsection/dist'),('ba7e58e7','@app/web/assets/cp/dist'),('baaa3226','@lib/fileupload'),('bb590299','@lib/picturefill'),('be7b34d2','@lib/prismjs'),('c3651359','@app/web/assets/feed/dist'),('d789595e','@lib/jquery-ui'),('dab433e2','@lib/timepicker'),('dd5e1917','@lib/axios'),('de2190bb','@app/web/assets/editentry/dist'),('e54b6b97','@lib/xregexp'),('ef272f1d','@lib/selectize'),('f9e07cf5','@app/web/assets/fields/dist'),('fa2ee14c','@app/web/assets/matrix/dist'),('fe0fd1c2','@app/web/assets/cp/dist'),('fe8752bb','@app/web/assets/dashboard/dist'),('ff1b40be','@app/web/assets/deprecationerrors/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,NULL),(5,2,1,5,NULL),(6,2,1,6,NULL),(7,2,1,7,NULL),(8,2,1,8,NULL),(9,13,1,1,NULL),(10,13,1,2,NULL),(11,17,1,1,NULL),(12,13,1,3,NULL),(13,17,1,2,NULL),(14,13,1,4,NULL),(15,23,1,1,NULL),(16,26,1,1,NULL),(17,29,1,1,NULL),(18,2,1,9,NULL),(19,13,1,5,NULL),(20,29,1,2,NULL),(21,23,1,2,NULL),(22,17,1,3,NULL),(23,17,1,4,NULL),(24,26,1,2,NULL),(25,2,1,10,NULL),(26,2,1,11,NULL),(27,2,1,12,NULL),(28,2,1,13,NULL),(29,2,1,14,NULL),(30,2,1,15,NULL),(31,2,1,16,NULL),(32,13,1,6,NULL),(33,2,1,17,NULL),(34,2,1,18,NULL),(35,29,1,3,NULL),(36,29,1,4,NULL),(37,13,1,7,NULL),(38,29,1,5,NULL),(39,29,1,6,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' craft user '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' justin poirier medavie bluecross ca '),(1,'slug',0,1,''),(46,'slug',0,1,''),(2,'title',0,1,' medavie news '),(2,'slug',0,1,' home '),(2,'field',3,1,' 1 '),(13,'slug',0,1,' post 1 '),(13,'title',0,1,' news 1 '),(13,'field',5,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),(17,'title',0,1,' news 2 '),(17,'field',4,1,' news 2 '),(17,'slug',0,1,' news2 '),(17,'field',6,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua '),(17,'field',5,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),(13,'field',4,1,' news 1 '),(23,'title',0,1,' news 3 '),(23,'slug',0,1,' news 3 '),(23,'field',4,1,' news 3 '),(23,'field',5,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),(26,'title',0,1,' news 4 '),(26,'slug',0,1,' news 4 '),(26,'field',4,1,' news 4 '),(26,'field',5,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),(29,'title',0,1,' news 5 '),(29,'field',4,1,' news 5 '),(29,'field',5,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum '),(13,'field',6,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua '),(29,'field',6,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua '),(23,'field',6,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua '),(26,'field',6,1,' lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua '),(46,'field',10,1,' medavie blue cross '),(29,'slug',0,1,' news 5 '),(51,'kind',0,1,' image '),(51,'extension',0,1,' jpg '),(51,'filename',0,1,' elements logo en jpg '),(29,'field',11,1,' elements logo en '),(51,'slug',0,1,''),(51,'title',0,1,' elements logo en '),(54,'filename',0,1,' elements logo en jpg '),(54,'extension',0,1,' jpg '),(54,'kind',0,1,' image '),(54,'slug',0,1,''),(54,'title',0,1,' elements logo en ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'home','home','single',1,'all',NULL,'2020-06-29 21:30:31','2020-06-29 21:30:31',NULL,'b2e2fc23-ed34-4f09-a510-8d8e2de71c83'),(2,NULL,'posts','news','channel',1,'all',NULL,'2020-06-30 17:24:41','2020-06-30 19:52:30',NULL,'05eb6ae5-4f48-4f98-a3b7-dd0b74f1c87a');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index',1,'2020-06-29 21:30:31','2020-08-24 13:40:19','3226ceab-8f32-410c-a077-0f8841fc5839'),(2,2,1,1,'news/{slug}','news/entry',1,'2020-06-30 17:24:41','2020-06-30 19:55:12','18761434-921e-4a3e-bee2-fb630d66b80e');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'ed7anffSR7i7fXEcvG708kaBBxU6kn7yywg714Oli2Ti9-0LhYtiX0zZVhp_UvXK0qnr9_pPZYS5-MlDPcMBlwJQxvlnMReIr_xH','2020-06-29 20:25:43','2020-06-29 20:25:49','64aacc84-08d2-48eb-8473-e6a959b79042'),(2,1,'rU7H_hVzyZ7oZFhY6k4wu1WdMj6Ux-7AmQoEWqEuT9M70uW3QIUfwhxRYqSOH7t7arIKUp6eOkSaqAnJ3wVc9KbE8TqIHegPjWjl','2020-06-29 21:27:16','2020-06-29 21:30:39','63eaae8e-1e58-40d6-8550-52963eb10276'),(4,1,'H7fm0KislTg2B4T4g00D6sQu_YcTLX4Csq6PaRkcc80uruYowZs4kM7sKS7iugxbCOFGWdl5_5YnaUOVCjbBxPpvD_r36w3ZGPy0','2020-07-14 18:38:15','2020-07-14 19:57:32','c0706202-4f26-4bf8-a48a-163994394b48'),(6,1,'hTOaSJ_fPQTiHdbyW_yf5Lf29P1zWsy3dupP7ulkcbbNeNSVFIrZonis5iFNITeYt-Ne293OEB09Hkckh1UvwkPos2UgSnt5m8bg','2020-08-24 14:53:14','2020-08-24 14:53:16','ce18fbd5-a7ec-41d5-9e33-362fcfdfaeec'),(7,1,'LpNz1V85fz7gQHKYeSz6amjbx4K4FGS5F-xFJdH4ETYYVrU46pb3iY-OtE8jV2tVNQ2svZBfjMejgwYhDHksdlgC7idIgUUAj3xd','2021-02-12 13:14:46','2021-02-12 14:30:59','0da7c6f9-450f-40d4-878b-2594c2665ca3');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'craft-poc','2020-06-29 20:25:42','2020-06-29 20:25:42',NULL,'c4552b4c-014f-41af-99c7-31d130ae2ced');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'Medavie News','default','en-US',1,'$DEFAULT_SITE_URL',1,'2020-06-29 20:25:42','2020-06-30 20:15:00',NULL,'c29e86a0-04a1-4013-9cbc-e4ac7bedbbd5');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'craft-user',NULL,NULL,NULL,'justin.poirier@medavie.bluecross.ca','$2y$13$eKbuIKIsAsnho04PBO.HDOmE9A9F4PaRyJQAQXlXnDuwRNgdG6Qy2',1,0,0,0,'2021-02-12 13:14:46',NULL,NULL,NULL,'2020-07-14 18:37:33',NULL,1,NULL,NULL,NULL,0,'2020-06-29 20:25:43','2020-06-29 20:25:43','2021-02-12 13:14:46','c4cd7d1a-b0d4-4b76-8898-aaf330bcc42c');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'local','','2021-02-12 13:30:03','2021-02-12 13:30:03','9ee5cfdc-38ae-45d0-ba44-7042dd867726'),(2,1,1,'images','images/','2021-02-12 13:31:48','2021-02-12 13:31:48','e30359dc-9f1d-4847-a2f2-03373b3984a5'),(3,NULL,NULL,'Temporary source',NULL,'2021-02-12 13:31:48','2021-02-12 13:31:48','6632c858-4bcb-4453-9f64-bc6d50f218ad'),(4,3,NULL,'user_1','user_1/','2021-02-12 13:31:48','2021-02-12 13:31:48','40c7f6d6-779d-4bc2-8eb3-d9c66bad50ea');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,NULL,'local','local','craft\\volumes\\Local',1,'$ASSETS_URL','{\"path\":\"C:/projects/craft-poc/web/assets/images\"}',1,'2021-02-12 13:30:03','2021-02-12 14:22:06',NULL,'f2988556-060b-4b24-8483-f9fa5b842aea');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2020-06-29 20:25:45','2020-06-29 20:25:45','f41a2ff4-6daa-40fa-ae86-c22a0c8746ef'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-06-29 20:25:45','2020-06-29 20:25:45','4b6f81ad-b4cf-485c-a081-f100fd21577f'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-06-29 20:25:45','2020-06-29 20:25:45','78aa409b-3d97-4c6f-a151-b3b872f7ccc7'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-06-29 20:25:45','2020-06-29 20:25:45','72b12c25-0ebc-48c1-a583-c587cb29e719');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-12 10:33:36
