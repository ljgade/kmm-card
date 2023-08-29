-- MySQL dump 10.13  Distrib 8.1.0, for Linux (aarch64)
--
-- Host: localhost    Database: kmm_card
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_menu` (
`id` int unsigned NOT NULL AUTO_INCREMENT,
`parent_id` int NOT NULL DEFAULT '0',
`order` int NOT NULL DEFAULT '0',
`title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
`icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
`uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'Dashboard','fa-bar-chart','/',NULL,NULL,NULL),(2,0,2,'系统管理','fa-tasks',NULL,NULL,NULL,'2023-08-20 09:08:43'),(3,2,3,'Users','fa-users','auth/users',NULL,NULL,NULL),(4,2,4,'Roles','fa-user','auth/roles',NULL,NULL,NULL),(5,2,5,'Permission','fa-ban','auth/permissions',NULL,NULL,NULL),(6,2,6,'Menu','fa-bars','auth/menu',NULL,NULL,NULL),(7,2,7,'Operation log','fa-history','auth/logs',NULL,NULL,NULL),(8,9,0,'场景分类','fa-picture-o','category/scene',NULL,'2023-08-19 03:40:07','2023-08-20 09:07:50'),(9,0,0,'分类管理','fa-list-ol',NULL,NULL,'2023-08-20 09:07:03','2023-08-20 09:07:03'),(10,0,0,'模板管理','fa-file-picture-o',NULL,NULL,'2023-08-20 09:09:52','2023-08-20 09:11:09'),(11,10,0,'模板采集','fa-internet-explorer','scene/crawl',NULL,'2023-08-20 09:29:19','2023-08-20 09:29:19'),(12,9,0,'音乐分类','fa-music','category/music','*','2023-08-25 15:16:23','2023-08-25 15:16:23');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_operation_log` (
`id` int unsigned NOT NULL AUTO_INCREMENT,
`user_id` int NOT NULL,
`path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
`ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`input` text COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=595 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
`id` int unsigned NOT NULL AUTO_INCREMENT,
`name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
`slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
`http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`http_path` text COLLATE utf8mb4_unicode_ci,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `admin_permissions_name_unique` (`name`),
UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'场景分类树','分类树','GET','/category/tree/1','2023-08-19 03:39:00','2023-08-19 03:39:00');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_menu` (
`role_id` int NOT NULL,
`menu_id` int NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL),(1,8,NULL,NULL),(1,9,NULL,NULL),(1,10,NULL,NULL),(1,11,NULL,NULL),(1,12,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_permissions` (
`role_id` int NOT NULL,
`permission_id` int NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_users` (
`role_id` int NOT NULL,
`user_id` int NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
`id` int unsigned NOT NULL AUTO_INCREMENT,
`name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
`slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `admin_roles_name_unique` (`name`),
UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2023-08-16 06:50:54','2023-08-16 06:50:54');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_permissions` (
`user_id` int NOT NULL,
`permission_id` int NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
`id` int unsigned NOT NULL AUTO_INCREMENT,
`username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
`password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
`name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$0/uG7J2oEnN6a7ikm6LPK.O070QbAaJW6OABdPbH1tpFGQR5Fyqte','Administrator',NULL,'Rh5RXDaHu2O5u6vYlkwWMU7A2vNIhhAnE9wHg4a2XZm5lr66q0bQxNmOubQT','2023-08-16 06:50:54','2023-08-16 06:50:54');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrage`
--

DROP TABLE IF EXISTS `barrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barrage` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`scene_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
`name` varchar(255) NOT NULL DEFAULT '' COMMENT '名字',
`word` varchar(255) NOT NULL DEFAULT '' COMMENT '祝福语',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_scene_id` (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_record`
--

DROP TABLE IF EXISTS `cash_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_record` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`scene_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
`user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
`name` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
`card_no` varchar(120) NOT NULL DEFAULT '' COMMENT '卡号/账号',
`sum_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
`hand_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
`end_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '到账金额',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_scene_id` (`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_record`
--

LOCK TABLES `cash_record` WRITE;
/*!40000 ALTER TABLE `cash_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
`name` varchar(60) NOT NULL DEFAULT '' COMMENT '品类名称',
`icon` varchar(60) NOT NULL DEFAULT '' COMMENT '图标',
`type` tinyint NOT NULL DEFAULT '0' COMMENT '类型',
`sort` int unsigned NOT NULL DEFAULT '0' COMMENT '排序',
`show_in_home_page` tinyint NOT NULL DEFAULT '0' COMMENT '首页展示',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'个人用途','',1,1,0,'2023-08-18 22:08:00','2023-08-19 06:07:29'),(2,0,'企业用途','',1,2,0,'2023-08-18 22:08:18','2023-08-19 06:07:47'),(3,0,'节日','',1,3,0,'2023-08-18 22:23:31','2023-08-19 06:05:02'),(4,0,'行业','',1,4,0,'2023-08-18 22:23:39','2023-08-19 06:07:11'),(5,0,'教育培训','',1,5,0,'2023-08-18 22:23:49','2023-08-19 06:08:16'),(6,1,'结婚','fa-diamond',1,1,0,'2023-08-18 06:52:34','2023-08-28 11:14:12'),(7,1,'升学宴','',1,2,0,'2023-08-19 06:53:05','2023-08-19 06:53:14'),(8,1,'宝宝请帖','fa-child',1,3,1,'2023-08-18 14:55:51','2023-08-18 14:55:51'),(9,1,'儿童生日','',1,4,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(10,1,'成人生日','fa-birthday-cake',1,5,1,'2023-08-18 23:12:17','2023-08-18 23:16:36'),(11,1,'老人寿宴','fa-leaf',1,6,1,'2023-08-18 23:12:17','2023-08-18 23:16:36'),(12,1,'乔迁之喜','fa-home',1,7,1,'2023-08-18 15:12:17','2023-08-18 15:16:36'),(13,1,'毕业季 · 同学会','',1,8,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(14,1,'相册','',1,9,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(15,1,'旅行','',1,10,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(16,1,'简历','',1,11,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(17,1,'幼儿园','',1,12,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(18,1,'聚会','',1,13,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(19,1,'生活','',1,14,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(20,1,'情感','',1,15,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(21,1,'表白','',1,16,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(22,2,'活动邀请','fa-glass',1,1,1,'2023-08-18 15:12:17','2023-08-18 15:16:36'),(23,2,'企业宣传','',1,2,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(24,2,'开业庆典','',1,3,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(25,2,'婚纱摄影推广','',1,4,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(26,2,'婚庆推广','',1,5,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(27,2,'年会','fa-calendar-check-o',1,6,1,'2023-08-18 23:12:17','2023-08-18 23:16:36'),(28,2,'招聘','',1,7,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(29,2,'名片','',1,8,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(30,2,'教育培训','',1,9,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(31,2,'其它','',1,10,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(32,3,'元旦','',1,1,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(33,3,'春节','',1,2,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(34,3,'元宵节','',1,3,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(35,3,'情人节','',1,4,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(36,3,'妇女节','',1,5,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(37,3,'3.15','',1,6,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(38,3,'愚人节','',1,7,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(39,3,'清明节','',1,8,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(40,3,'母亲节','',1,9,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(41,3,'儿童节','',1,10,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(42,3,'端午节','',1,11,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(43,3,'父亲节','',1,12,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(44,3,'建党节','',1,13,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(45,3,'建军节','',1,14,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(46,3,'七夕','',1,15,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(47,3,'教师节','',1,16,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(48,3,'中秋节','',1,17,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(49,3,'国庆','',1,18,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(50,3,'重阳节','',1,19,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(51,3,'万圣节','',1,20,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(52,3,'双十一','',1,21,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(53,3,'感恩节','',1,22,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(54,3,'双十二','',1,23,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(55,3,'圣诞节','',1,24,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(56,3,'其他','',1,25,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(57,4,'电商','',1,1,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(58,4,'餐饮','',1,2,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(59,4,'家具','',1,3,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(60,4,'IT','',1,4,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(61,4,'教育','',1,5,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(62,4,'媒体','',1,6,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(63,4,'服装','',1,7,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(64,4,'旅游','',1,8,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(65,4,'汽车','',1,9,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(66,4,'美容','',1,10,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(67,4,'摄影','',1,11,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(68,5,'招生宣传','',1,1,0,'2023-08-19 07:12:17','2023-08-19 07:16:36'),(69,0,'结婚','',3,1,0,'2023-08-25 15:19:40','2023-08-25 15:19:40'),(70,0,'生日','',3,2,0,'2023-08-25 15:19:56','2023-08-25 15:19:56'),(71,0,'毕业季·同学会','',3,3,0,'2023-08-25 15:20:23','2023-08-25 15:20:23'),(72,0,'活动·企业宣传','',3,4,0,'2023-08-25 15:21:06','2023-08-25 15:21:06'),(73,0,'乔迁之喜','',3,5,0,'2023-08-25 15:21:22','2023-08-25 15:21:22'),(74,0,'寿宴','',3,6,0,'2023-08-25 15:21:33','2023-08-25 15:21:33'),(75,1,'结婚请帖','fa-diamond',1,1,1,'2023-08-28 11:46:22','2023-08-28 11:14:38'),(76,1,'宝宝生日','',1,3,0,'2023-08-28 11:47:24','2023-08-28 11:47:24'),(77,1,'寿宴','',1,6,0,'2023-08-28 11:47:29','2023-08-28 11:47:29'),(78,1,'乔迁','',1,7,0,'2023-08-28 11:47:32','2023-08-28 11:47:32'),(79,2,'活动 · 会议 · 展会','',1,1,0,'2023-08-28 11:47:35','2023-08-28 11:47:35');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
`queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
`payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
`exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
`failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_data`
--

DROP TABLE IF EXISTS `form_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_data` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`scene_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
`data` text COMMENT '表单内容',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_scene_id` (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gift`
--

DROP TABLE IF EXISTS `gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`cat_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
`title` varchar(120) NOT NULL DEFAULT '' COMMENT '名称',
`info` varchar(255) NOT NULL DEFAULT '' COMMENT '提示语',
`icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
`price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
`default` tinyint NOT NULL DEFAULT '0' COMMENT '默认礼物',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift`
--

LOCK TABLES `gift` WRITE;
/*!40000 ALTER TABLE `gift` DISABLE KEYS */;
INSERT INTO `gift` VALUES (1,75,'一箱红枣','为国家培养社会主义接班人','751ef01c2f3509e29c6b5a615ca4a4b6.jpg',2.88,0,'2023-08-28 12:37:31','2023-08-28 11:13:38'),(2,75,'一个搓衣板','老公不听话，拖出去跪搓衣板','d6d604a14237d28dbce06048b7706fb3.jpg',8.88,0,'2023-08-28 12:37:31','2023-08-28 11:13:38'),(3,75,'蜜月保','蜜月之旅，一帆风顺','90bf594c9382c567aa3eade26df2719e.jpg',9.99,0,'2023-08-28 12:37:31','2023-08-28 11:13:38'),(4,75,'一座城堡','王子公主永远在一起','d9d5c4f87b180623a94555448769c14b.jpg',13.14,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(5,75,'一辆跑车','祝你们成为爱情路上的老司机','97e4a2fcb744520276b49d3c73182946.jpg',19.99,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(6,75,'一根皮鞭','时刻鞭策鼓励对方','163a6868abd4a92c15b72c9be37baca9.jpg',66.66,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(7,75,'月球蜜月游','High上天，在月球肩并肩','8ad44c7e1cbc3b718840bf4005538c69.jpg',99.99,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(8,75,'扫地机器人','他负责扫地看家，你负责貌美如花','d0968c41ecc9d495ba3895d6c8054a4c.jpg',131.40,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(9,75,'一座火箭','祝你们爱情飞上天','3d6c5d6568daac923c740cebc2c84c1e.jpg',166.66,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(10,75,'一车纸尿裤','早生贵子，早日用上','ef4ad0ac65677295ff47b3b5919c45a7.jpg',168.88,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(11,75,'老公牌洗碗机','有了老公，比洗碗机还好用','26470bea1168f3a75c2651468bbe8e2d.jpg',199.99,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(12,75,'时光穿梭机','早点遇到他，余生都是他','e855e1be44c3f3f2ac59c4ae8bbe517c.jpg',999.99,0,'2023-08-28 12:37:32','2023-08-28 11:13:38'),(13,75,'百合花','祝你们百年好合，永结同心','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:33','2023-08-28 11:13:38'),(14,7,'孔夫子的墨水','龙盘宝瓶聚才，胸怀天下气华','f8e10686f6841260ee80c9ba68451e52.jpg',2.88,0,'2023-08-28 12:37:33','2023-08-28 12:37:33'),(15,7,'哪吒的风火轮','龙马精神、飞黄腾达','8c1139e6c05dd78baba49e5e8c660379.jpg',9.99,0,'2023-08-28 12:37:33','2023-08-28 12:37:33'),(16,7,'文曲星的茶叶','学业有成，不负众望','508fb0999e56b9028f1cc64e4d33e44d.jpg',19.99,0,'2023-08-28 12:37:33','2023-08-28 12:37:33'),(17,7,'七彩祥云','前程似锦，荣耀归来','0828b05769b0731068687972bab0638d.jpg',39.99,0,'2023-08-28 12:37:34','2023-08-28 12:37:34'),(18,7,'天马的翅膀','凤舞长河展宏图','75258b430bbdd0b72b308ef581797903.jpg',66.66,0,'2023-08-28 12:37:34','2023-08-28 12:37:34'),(19,7,'大鹏展翅','鹏程万里、大展鸿图','e3275c69680b572057e5748524cdd9e3.jpg',99.99,0,'2023-08-28 12:37:34','2023-08-28 12:37:34'),(20,7,'百合花','祝你学业有成，前程似锦','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:34','2023-08-28 12:37:34'),(21,76,'一颗成长豆','身体壮壮，心情棒棒','d88c0fd8ddfd3ae5cbe91b59d1e57433.jpg',1.99,0,'2023-08-28 12:37:34','2023-08-28 12:37:34'),(22,76,'一个香吻','聪明健康人人爱','701012dcb80f2bfdb077415ff1c2aa5d.jpg',6.66,0,'2023-08-28 12:37:34','2023-08-28 12:37:34'),(23,76,'爱的抱抱','给宝宝温暖呵护','17cabda6a7a9cd0f810afcdfd232e671.jpg',13.14,0,'2023-08-28 12:37:35','2023-08-28 12:37:35'),(24,76,'阿宝的秘籍','功夫熊猫保护你长大','105db3164ece8381250d549223421c7a.jpg',19.99,0,'2023-08-28 12:37:35','2023-08-28 12:37:35'),(25,76,'森林糖果屋','在甜蜜中成长','c7e3eb58a77ff9990fb804c6589ec98f.jpg',66.66,0,'2023-08-28 12:37:35','2023-08-28 12:37:35'),(26,76,'小天使的恩惠','天真可爱，无忧无虑','4b15a1dc66b609de24cb4986f3128434.jpg',99.99,0,'2023-08-28 12:37:35','2023-08-28 12:37:35'),(27,76,'百合花','祝小宝宝生日快乐','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:35','2023-08-28 12:37:35'),(28,9,'一颗成长豆','身体壮壮，心情棒棒','d88c0fd8ddfd3ae5cbe91b59d1e57433.jpg',1.99,0,'2023-08-28 12:37:35','2023-08-28 12:37:35'),(29,9,'一个香吻','聪明健康人人爱','701012dcb80f2bfdb077415ff1c2aa5d.jpg',6.66,0,'2023-08-28 12:37:36','2023-08-28 12:37:36'),(30,9,'爱的抱抱','给宝宝温暖呵护','17cabda6a7a9cd0f810afcdfd232e671.jpg',13.14,0,'2023-08-28 12:37:36','2023-08-28 12:37:36'),(31,9,'阿宝的秘籍','功夫熊猫保护你长大','105db3164ece8381250d549223421c7a.jpg',19.99,0,'2023-08-28 12:37:36','2023-08-28 12:37:36'),(32,9,'森林糖果屋','在甜蜜中成长','c7e3eb58a77ff9990fb804c6589ec98f.jpg',66.66,0,'2023-08-28 12:37:36','2023-08-28 12:37:36'),(33,9,'小天使的恩惠','天真可爱，无忧无虑','4b15a1dc66b609de24cb4986f3128434.jpg',99.99,0,'2023-08-28 12:37:36','2023-08-28 12:37:36'),(34,9,'百合花','祝小朋友生日快乐','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:36','2023-08-28 12:37:36'),(35,10,'99米长寿面','富贵安康，芳龄永继','00fb9afac229216064f8931c437a70c2.jpg',2.88,0,'2023-08-28 12:37:37','2023-08-28 12:37:37'),(36,10,'一车开心果','笑口常开，好彩自然来','44f3b627a663f3d227613f42d77ba3b7.jpg',9.99,0,'2023-08-28 12:37:37','2023-08-28 12:37:37'),(37,10,'一场流星雨','成人之美，心想事成','90fa54202124e9690ea679d34ba599a0.jpg',19.99,0,'2023-08-28 12:37:37','2023-08-28 12:37:37'),(38,10,'灰姑娘的水晶鞋','粘在了我的心上','21de2b37c5cfcc12aeaa702af1d97587.jpg',39.99,0,'2023-08-28 12:37:37','2023-08-28 12:37:37'),(39,10,'一辆跑车','愿你有诗歌也有远方','0cec1247843ecf383e0ab15d14562427.jpg',66.66,0,'2023-08-28 12:37:37','2023-08-28 12:37:37'),(40,10,'一片草原','就为了养你这匹野马','1271b549f3f47f159863ad7cd706ff35.jpg',99.99,0,'2023-08-28 12:37:37','2023-08-28 12:37:37'),(41,10,'百合花','祝您生日快乐','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:38','2023-08-28 12:37:38'),(42,77,'一车开心果','笑口常开，永享天伦','35f33637a04c6a7a26cabdfc726edbea.jpg',1.99,0,'2023-08-28 12:37:38','2023-08-28 12:37:38'),(43,77,'99米长寿面','富贵安康，长命百岁','1d9e75958c0dc23d3c16f70d61d54b92.jpg',6.66,0,'2023-08-28 12:37:38','2023-08-28 12:37:38'),(44,77,'祥瑞仙鹤','事事顺心，幸福长伴','babce9f256fd43c5b71c15e355040cd1.jpg',13.14,0,'2023-08-28 12:37:38','2023-08-28 12:37:38'),(45,77,'万年不老松','健康如意，福乐绵绵','3d8a571cc632ce82c766666bdf41ae93.jpg',19.99,0,'2023-08-28 12:37:38','2023-08-28 12:37:38'),(46,77,'西王母的仙桃','福如东海，寿比南山','3f158f54ee0dc7d7dec518f90cd3462f.jpg',66.66,0,'2023-08-28 12:37:38','2023-08-28 12:37:38'),(47,77,'寿星公的祝愿','日月昌明，福寿无疆','7a7df50ffa39cb9c0d66f6e13569f6bb.jpg',99.99,0,'2023-08-28 12:37:38','2023-08-28 12:37:38'),(48,77,'百合花','祝您福如东海，寿比南山','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:39','2023-08-28 12:37:39'),(49,78,'一车香槟','生活精彩常常有，换个地方喝小酒','252aef060af859cd11378108e643d4cc.jpg',1.99,0,'2023-08-28 12:37:39','2023-08-28 12:37:39'),(50,78,'一座豪宅','迁宅吉祥日，安居大有年','55c4f1d84fb8b2544eead451ca82740d.jpg',6.66,0,'2023-08-28 12:37:39','2023-08-28 12:37:39'),(51,78,'一架飞机','吉星照佳地，紫气指新梁','bc561b547a7b6f18f2c5584b8139e7a6.jpg',13.14,0,'2023-08-28 12:37:39','2023-08-28 12:37:39'),(52,78,'招财猫的爪子','搬新家好运到，入金窝福星照','6354667dee36cbac0f10a8580ff6ea64.jpg',19.99,0,'2023-08-28 12:37:39','2023-08-28 12:37:39'),(53,78,'幸运草花园','恭贺迁居之喜，室染秋香之气','d8ef75627796f5b053c42102e8a441c6.jpg',66.66,0,'2023-08-28 12:37:39','2023-08-28 12:37:39'),(54,78,'土地神的帮助','搬来幸福好运，扔掉忧愁烦恼','4b0bb42c03959243a3eb0216e9f908bb.jpg',99.99,0,'2023-08-28 12:37:40','2023-08-28 12:37:40'),(55,78,'百合花','恭贺乔迁之喜','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:40','2023-08-28 12:37:40'),(56,24,'如意锦鲤','龙腾万里，风生水起','88b11ce7aef8eb7ed3fff31d1f255c62.jpg',2.88,0,'2023-08-28 12:37:43','2023-08-28 12:37:43'),(57,24,'冲天蒸汽机','兴旺发达，蒸蒸日上','1c5657e928ab1f765dac870643d4db40.jpg',8.88,0,'2023-08-28 12:37:43','2023-08-28 12:37:43'),(58,24,'龙王吐珠','鸿运天成、紫气东来','5f80f70eda00cb30f3007036d2fac0ca.jpg',18.88,0,'2023-08-28 12:37:43','2023-08-28 12:37:43'),(59,24,'摇钱树','财源广进，生意兴隆','92609f734710dc2ed1dd8f2119533aac.jpg',66.66,0,'2023-08-28 12:37:43','2023-08-28 12:37:43'),(60,24,'一座金山','好运当头，日进斗金','89973ee5d91bcb712658d92be5b34dd8.jpg',88.88,0,'2023-08-28 12:37:43','2023-08-28 12:37:43'),(61,24,'财神爷的金元宝','如日中天，兴旺发达','4da6f7408de56fce5484b57bb1507b86.jpg',99.99,0,'2023-08-28 12:37:43','2023-08-28 12:37:43'),(62,24,'百合花','恭喜发财,开业大吉','3cf7996ea4abd6e42400d8d1789aadba.png',0.00,1,'2023-08-28 12:37:44','2023-08-28 12:37:44');
/*!40000 ALTER TABLE `gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_record`
--

DROP TABLE IF EXISTS `gift_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_record` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`scene_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
`type` tinyint NOT NULL DEFAULT '0' COMMENT '类型',
`title` varchar(120) NOT NULL DEFAULT '' COMMENT '名称',
`name` varchar(60) NOT NULL DEFAULT '' COMMENT '名字',
`icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
`price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_scene_id` (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invite_list`
--

DROP TABLE IF EXISTS `invite_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invite_list` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`scene_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
`name` varchar(60) NOT NULL DEFAULT '' COMMENT '姓名',
`word` text COMMENT '邀请语',
`url` varchar(255) NOT NULL DEFAULT '' COMMENT '语音链接',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_scene_id` (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_list`
--

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
`id` int unsigned NOT NULL AUTO_INCREMENT,
`migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`batch` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
`url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
`cat_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类',
`user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (2,'850452780552461a85e5e68018d5ce87.m4a','850452780552461a85e5e68018d5ce87',0,1,'2023-08-25 18:06:51','2023-08-25 13:28:02'),(3,'291cf371855d7b535672d5f4e523a3a1.mp3','291cf371855d7b535672d5f4e523a3a1',0,2,'2023-08-27 13:20:52','2023-08-27 13:20:52'),(4,'d99e06d0551d2b1db87b5eb16dcaecb1.m4a','d99e06d0551d2b1db87b5eb16dcaecb1',0,2,'2023-08-27 13:21:05','2023-08-27 13:21:05');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
`email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`created_at` timestamp NULL DEFAULT NULL,
KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`tokenable_id` bigint unsigned NOT NULL,
`name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
`abilities` text COLLATE utf8mb4_unicode_ci,
`last_used_at` timestamp NULL DEFAULT NULL,
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scene`
--

DROP TABLE IF EXISTS `scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scene` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`tpl_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
`name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
`code` varchar(20) NOT NULL DEFAULT '' COMMENT '编码',
`source_code` varchar(20) NOT NULL DEFAULT '' COMMENT '采集编码',
`description` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
`cover` varchar(200) NOT NULL DEFAULT '' COMMENT '缩略图',
`is_luckmoney` tinyint NOT NULL DEFAULT '0' COMMENT '是否开启礼金红包',
`is_gift` tinyint NOT NULL DEFAULT '0' COMMENT '是否开启虚拟礼物',
`is_wish` tinyint NOT NULL DEFAULT '0' COMMENT '是否开启弹幕祝福',
`price` int unsigned NOT NULL DEFAULT '0' COMMENT '价格',
`property` text COMMENT '其他设置',
`music_url` varchar(200) NOT NULL DEFAULT '' COMMENT '背景音乐',
`main_class_id` int unsigned NOT NULL DEFAULT '0' COMMENT '一级分类ID',
`sub_class_id` int unsigned NOT NULL DEFAULT '0' COMMENT '二级分类ID',
`is_show_btn` tinyint NOT NULL DEFAULT '0' COMMENT 'is_show_btn',
`is_show_preview` tinyint NOT NULL DEFAULT '0' COMMENT 'is_show_preview',
`is_show_guide` tinyint NOT NULL DEFAULT '0' COMMENT 'is_show_guide',
`is_wish_h5` tinyint NOT NULL DEFAULT '0' COMMENT 'is_wish_h5',
`barrage_text` varchar(60) NOT NULL DEFAULT '' COMMENT '弹幕祝福提示语',
`end_page` tinyint NOT NULL DEFAULT '0' COMMENT 'end_page',
`user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_code` (`code`),
KEY `idx_source_code` (`source_code`),
KEY `idx_user_id` (`user_id`),
KEY `idx_main_class_id` (`main_class_id`),
KEY `idx_sub_class_id` (`sub_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scene`
--

LOCK TABLES `scene` WRITE;
/*!40000 ALTER TABLE `scene` DISABLE KEYS */;
/*!40000 ALTER TABLE `scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scene_page`
--

DROP TABLE IF EXISTS `scene_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scene_page` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`scene_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
`user_tpl_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户模板ID',
`num` int unsigned NOT NULL DEFAULT '0' COMMENT '页码',
`content` text COMMENT '页面内容',
`extend` text COMMENT '页面及组件关联关系',
`property` text COMMENT '页面属性',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_scene_id` (`scene_id`),
KEY `idx_user_tpl_id` (`user_tpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scene_page`
--

LOCK TABLES `scene_page` WRITE;
/*!40000 ALTER TABLE `scene_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `scene_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pay_record`
--

DROP TABLE IF EXISTS `user_pay_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pay_record` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
`payload` text COMMENT '支付请求信息',
`product_code` varchar(20) NOT NULL DEFAULT '' COMMENT '商品编码',
`trade_no` varchar(60) NOT NULL DEFAULT '' COMMENT '订单号',
`out_trade_no` varchar(60) NOT NULL DEFAULT '' COMMENT '支付单号',
`price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
`pay_status` varchar(60) NOT NULL DEFAULT '' COMMENT '支付状态',
`paid_at` timestamp NULL DEFAULT NULL COMMENT '支付时间',
`trade_info` text COMMENT '订单信息',
`notify_result` text COMMENT '支付回调结果',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
UNIQUE KEY `uk_trade_no` (`trade_no`),
KEY `idx_user_id_product_code` (`user_id`,`product_code`),
KEY `idx_out_trade_no` (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pay_record`
--

LOCK TABLES `user_pay_record` WRITE;
/*!40000 ALTER TABLE `user_pay_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_pay_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tpl`
--

DROP TABLE IF EXISTS `user_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tpl` (
`id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
`user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
`page_id` int unsigned NOT NULL DEFAULT '0' COMMENT '页面ID',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
KEY `idx_user_id` (`user_id`),
KEY `idx_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tpl`
--

LOCK TABLES `user_tpl` WRITE;
/*!40000 ALTER TABLE `user_tpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
`password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
`remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
`wx_openid` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信openid',
`group` tinyint NOT NULL DEFAULT '1' COMMENT '会员等级',
`end_time` date NOT NULL DEFAULT '1970-01-01' COMMENT '会员到期时间',
`kb` int unsigned NOT NULL DEFAULT '0' COMMENT '余额',
`music_token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '音乐上传token',
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-29 14:12:25