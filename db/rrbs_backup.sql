-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.2-m5


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema rrbs_development
--

CREATE DATABASE IF NOT EXISTS rrbs_development;
USE rrbs_development;

--
-- Definition of table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_location` text,
  `user_id` int(11) DEFAULT NULL,
  `branch_contactNumber` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;


--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` text,
  `restaurant_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`,`category_name`,`category_description`,`restaurant_category_id`,`created_at`,`updated_at`) VALUES 
 (0,'Food','Meat, Poultry, etc.',0,'2011-07-29 01:50:54','2011-07-29 01:50:54'),
 (1,'Liquor','Alcoholic beverages',0,'2011-07-29 01:51:23','2011-07-29 01:51:23'),
 (2,'Beverages','Sodas, teas, non alcoholic beverages',0,'2011-07-29 01:51:50','2011-07-29 01:51:50');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `categorysales`
--

DROP TABLE IF EXISTS `categorysales`;
CREATE TABLE `categorysales` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cs_amount` float DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `employee_id` int(11) DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `void` float DEFAULT NULL,
  `servicecharge` float DEFAULT NULL,
  `cs_revenue` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customer_count` int(11) DEFAULT NULL,
  `transaction_count` int(11) DEFAULT NULL,
  FOREIGN KEY (`category_id`) references `categories` (`id`),
  FOREIGN KEY (`employee_id`) references `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorysales`
--

/*!40000 ALTER TABLE `categorysales` DISABLE KEYS */;
INSERT INTO `categorysales` (`id`,`cs_amount`,`category_id`,`employee_id`,`vat`,`void`,`servicecharge`,`cs_revenue`,`created_at`,`updated_at`,`date`,`customer_count`,`transaction_count`) VALUES 
 (1,1.2,0,1,1.2,1.2,20,200,'2011-07-22 08:43:35','2011-07-29 03:21:05','2011-07-29',5,5),
 (2,123,1,2,1234,1.2,15,100,'2011-07-23 15:02:18','2011-07-29 03:23:13','2011-07-23',6,6),
 (3,12,1,1,1.2,112,1.2,1000,'2011-07-29 02:24:25','2011-07-29 03:23:41','2011-07-30',3,3),
 (4,200,0,1,0.12,1.3,0.1,1000,'2011-07-29 02:34:09','2011-07-29 03:24:28','2011-07-30',8,8),
 (5,11313,0,1,12,NULL,233,132323,'2011-07-29 08:17:08','2011-07-29 08:17:08',NULL,8,7),
 (68,1,0,NULL,NULL,NULL,NULL,NULL,'2011-08-07 16:00:21','2011-08-07 16:00:21','2000-01-01',NULL,NULL),
 (69,2,1,NULL,NULL,NULL,NULL,NULL,'2011-08-07 16:00:21','2011-08-07 16:00:21','2000-01-01',NULL,NULL),
 (70,3,2,NULL,NULL,NULL,NULL,NULL,'2011-08-07 16:00:21','2011-08-07 16:00:21','2000-01-01',NULL,NULL),
 (71,60,0,1,11,11,11,120,'2011-08-07 16:05:16','2011-08-07 16:05:16',NULL,13,13),
 (72,10,0,NULL,NULL,NULL,NULL,NULL,'2011-08-07 16:05:16','2011-08-07 16:05:16','2011-08-08',NULL,NULL),
 (73,20,1,NULL,NULL,NULL,NULL,NULL,'2011-08-07 16:05:16','2011-08-07 16:05:16','2011-08-08',NULL,NULL),
 (74,30,2,NULL,NULL,NULL,NULL,NULL,'2011-08-07 16:05:16','2011-08-07 16:05:16','2011-08-08',NULL,NULL),
 (76,1,0,1,6,1111110000,222,2,'2011-08-07 16:07:12','2011-08-14 11:10:04','2011-09-08',3,40),
 (77,2,1,NULL,6,1111110000,222,2,'2011-08-07 16:07:12','2011-08-07 16:07:12','2011-09-08',3,45),
 (78,3,2,NULL,6,1111110000,222,2,'2011-08-07 16:07:12','2011-08-07 16:07:12','2011-09-08',3,45),
 (82,1,0,NULL,1,1,1,1,'2011-08-07 16:12:47','2011-08-07 16:12:47','1111-01-11',1,1),
 (83,1,1,NULL,1,1,1,1,'2011-08-07 16:12:47','2011-08-07 16:12:47','1111-01-11',1,1),
 (84,1,2,NULL,1,1,1,1,'2011-08-07 16:12:47','2011-08-07 16:12:47','1111-01-11',1,1),
 (85,1,0,NULL,1,1,1,1,'2011-08-07 16:13:35','2011-08-07 16:13:35','1111-01-11',1,1),
 (86,1,1,NULL,1,1,1,1,'2011-08-07 16:13:35','2011-08-07 16:13:35','1111-01-11',1,1),
 (87,1,2,NULL,1,1,1,1,'2011-08-07 16:13:35','2011-08-07 16:13:35','1111-01-11',1,1),
 (91,12,0,NULL,0.12,1.2,0.13,123,'2011-08-10 02:34:03','2011-08-10 02:34:03','2011-08-10',11,22),
 (92,13,1,NULL,0.12,1.2,0.13,123,'2011-08-10 02:34:04','2011-08-10 02:34:04','2011-08-10',11,22),
 (93,14,2,NULL,0.12,1.2,0.13,123,'2011-08-10 02:34:04','2011-08-10 02:34:04','2011-08-10',11,22),
 (190,123,0,NULL,0.12,1.2,50,800,'2011-08-11 20:44:27','2011-08-11 20:44:27','2011-08-12',12,11),
 (191,456,1,NULL,0.12,1.2,50,800,'2011-08-11 20:44:28','2011-08-11 20:44:28','2011-08-12',12,11),
 (192,789,2,NULL,0.12,1.2,50,800,'2011-08-11 20:44:28','2011-08-11 20:44:28','2011-08-12',12,11),
 (193,123,0,NULL,0.12,1.2,5,6,'2011-08-14 09:01:20','2011-08-14 09:01:20','1111-02-11',12,7),
 (194,789,1,NULL,0.12,1.2,5,6,'2011-08-14 09:01:20','2011-08-14 09:01:20','1111-02-11',12,7),
 (195,456,2,NULL,0.12,1.2,5,6,'2011-08-14 09:01:20','2011-08-14 09:01:20','1111-02-11',12,7),
 (202,1,0,NULL,1,1,1,1,'2011-08-17 02:03:02','2011-08-17 02:03:02','2011-09-08',1,1),
 (203,1,1,NULL,1,1,1,1,'2011-08-17 02:03:02','2011-08-17 02:03:02','2011-09-08',1,1),
 (204,1,2,NULL,1,1,1,1,'2011-08-17 02:03:02','2011-08-17 02:03:02','2011-09-08',1,1),
 (205,7,0,NULL,7,7,7,7,'2011-08-17 02:08:16','2011-08-17 02:08:16','2011-08-17',7,7),
 (206,7,1,NULL,7,7,7,7,'2011-08-17 02:08:16','2011-08-17 02:08:16','2011-08-17',7,7),
 (207,7,2,NULL,7,7,7,7,'2011-08-17 02:08:16','2011-08-17 02:08:16','2011-08-17',7,7),
 (208,2,0,NULL,2,2,2,2,'2011-08-19 02:59:44','2011-08-19 02:59:44','2011-08-19',2,2);
/*!40000 ALTER TABLE `categorysales` ENABLE KEYS */;


--
-- Definition of table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_firstName` varchar(255) DEFAULT NULL,
  `employee_lastName` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `employee_dateEmployed` date DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `employee_birthday` date DEFAULT NULL,
  `employee_age` int(11) DEFAULT NULL,
  `employee_contactNumber` varchar(255) DEFAULT NULL,
  `employee_sss` varchar(255) DEFAULT NULL,
  `employee_tin` varchar(255) DEFAULT NULL,
  `employee_address` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`,`employee_firstName`,`employee_lastName`,`branch_id`,`employee_dateEmployed`,`job_id`,`department_id`,`employee_birthday`,`employee_age`,`employee_contactNumber`,`employee_sss`,`employee_tin`,`employee_address`,`created_at`,`updated_at`) VALUES 
 (1,'Zor','Abad',1,'2011-07-29',1,1,'2006-07-29',20,'09151975674','111','111','Don Antonio Heights','2011-07-29 02:00:49','2011-07-29 02:00:49'),
 (2,'Bia','Esmero',1,'2011-07-29',1,1,'2011-07-29',19,'9999999','111','111','Tandang Sora QC','2011-07-29 02:01:54','2011-07-29 02:01:54');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


--
-- Definition of table `endcounts`
--

DROP TABLE IF EXISTS `endcounts`;
CREATE TABLE `endcounts` (`id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, `beginning_date` varchar(255), `endcount_date` varchar(255), `created_at` datetime, `updated_at` datetime);

--
-- Dumping data for table `endcounts`
--

/*!40000 ALTER TABLE `endcounts` DISABLE KEYS */;

INSERT INTO `endcounts` VALUES(6,'1 August 2011','30 August 2011','2011-08-18 20:29:18.296875','2011-08-18 20:29:18.296875');
INSERT INTO `endcounts` VALUES(7,'1 December 2011','31 December 2011','2011-08-18 23:19:18.187500','2011-08-18 23:19:18.187500');
INSERT INTO `endcounts` VALUES(8,'1 August 2011','30 August 2011','2011-08-19 10:59:51.750000','2011-08-19 10:59:51.750000');

/*!40000 ALTER TABLE `endcounts` ENABLE KEYS */;


--
-- Definition of table `inventoryitems`
--

DROP TABLE IF EXISTS `inventoryitems`;
CREATE TABLE `inventoryitems` (`id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, `item_name` varchar(255), `branch_id` integer, `unit_id` integer, `created_at` datetime, `updated_at` datetime);


--
-- Dumping data for table `inventoryitems`
--

/*!40000 ALTER TABLE `inventoryitems` DISABLE KEYS */;
INSERT INTO `inventoryitems` VALUES(1,'Hotdog',1,3,'2011-08-14 11:47:21.984375','2011-08-14 11:47:21.984375');
INSERT INTO `inventoryitems` VALUES(2,'Ketchup',1,2,'2011-08-14 11:47:44.906250','2011-08-14 11:47:44.906250');
INSERT INTO `inventoryitems` VALUES(3,'Chicken Wings',1,1,'2011-08-14 14:04:16.281250','2011-08-14 14:04:16.281250');
INSERT INTO `inventoryitems` VALUES(4,'Bread',1,3,'2011-08-17 16:07:27.000000','2011-08-17 16:07:27.000000');
INSERT INTO `inventoryitems` VALUES(5,'Soy Sauce',1,2,'2011-08-17 17:21:45.296875','2011-08-17 17:21:45.296875');
/*!40000 ALTER TABLE `inventoryitems` ENABLE KEYS */;


--
-- Definition of table `purchaseitems`
--

DROP TABLE IF EXISTS `purchaseitems`;
CREATE TABLE `purchaseitems` (`id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, `purchase_date` varchar(255), `invoice_id` integer, `supplier_id` integer, `branch_id` integer, `inventory_id` integer, `purchase_unitcost` float, `purchase_quantity` float, `purchase_amount` float, `vat_type` varchar(255), `vat_amount` float, `net_amount` float, `created_at` datetime, `updated_at` datetime);

--
-- Dumping data for table `purchaseitems`
--

/*!40000 ALTER TABLE `purchaseitems` DISABLE KEYS */;
INSERT INTO `purchaseitems` VALUES(1,'13 August 2011',1234,1,1,1,10.0,100.0,1000.0,'VAT-Inclusive',12.0,1000.0,'2011-08-14 12:04:37.390625','2011-08-14 12:04:37.390625');
INSERT INTO `purchaseitems` VALUES(3,'13 August 2011',1234,1,1,2,10.0,100.0,1000.0,'VAT-Inclusive',12.0,1000.0,'2011-08-14 12:09:38.859375','2011-08-14 12:09:38.859375');
INSERT INTO `purchaseitems` VALUES(5,'13 August 2011',1234,1,1,2,10.0,5.0,500.0,'VAT-Inclusive',12.0,1000.0,'2011-08-14 13:19:13.890625','2011-08-14 13:19:13.890625');
INSERT INTO `purchaseitems` VALUES(6,'13 August 2011',1234,1,1,2,10.0,NULL,NULL,NULL,NULL,NULL,'2011-08-14 13:34:03.031250','2011-08-14 13:34:03.031250');
INSERT INTO `purchaseitems` VALUES(7,'19 August 2011',3456,1,1,3,100.0,5.0,500.0,'VAT-Inclusive',12.0,500.0,'2011-08-18 22:29:47.546875','2011-08-18 22:29:47.546875');
INSERT INTO `purchaseitems` VALUES(8,'21 August 2011',2,1,4,2,10.0,10.0,100.0,'VAT-Inclusive',12.0,100.0,'2011-08-18 23:02:15.609375','2011-08-18 23:02:15.609375');
INSERT INTO `purchaseitems` VALUES(9,'22 August 2011',1234,4,1,4,50.0,10.0,500.0,'VAT-Inclusive',12.0,500.0,'2011-08-19 08:17:30.359375','2011-08-19 08:17:30.359375');
/*!40000 ALTER TABLE `purchaseitems` ENABLE KEYS */;


--
-- Definition of table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `restaurant_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `restaurant_description` text,
  `currency_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` (`id`,`store_id`,`restaurant_name`,`company_id`,`restaurant_description`,`currency_id`,`created_at`,`updated_at`) VALUES 
 (1,0,'Italianni\'s',0,'Italian cuisine',0,'2011-08-03 05:11:06','2011-08-03 05:11:06'),
 (2,1,'Fish and Co.',0,'Serves delightful fish dishes ',0,'2011-08-03 05:12:20','2011-08-03 05:12:20');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;


--
-- Definition of table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*INSERT INTO `schema_migrations` (`version`) VALUES 
 ('20110722081839'),
 ('20110729012027'),
 ('20110729012317'),
 ('20110729014506'),
 ('20110807141953'),
 ('20110811223824'),
 ('20110812000417'),
 ('20110814110823'),
 ('20110814111319'),
 ('20110814112606'),
 ('20110814113725'),
 ('20110814115123'),
 ('20110817041726');*/
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

--
-- Definition of table `settlement_sales`
--

DROP TABLE IF EXISTS `settlement_sales`;
CREATE TABLE `settlement_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_amount` float DEFAULT NULL,
  `st_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `vat` float DEFAULT NULL,
  `void` float DEFAULT NULL,
  `ss_date` date DEFAULT NULL,
  `ss_revenue` float DEFAULT NULL,
  `customerCount` int(11) DEFAULT NULL,
  `transactionCount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_type` int(10) unsigned DEFAULT NULL,
  `gross_total` float DEFAULT NULL,
  `net_total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settlement_sales`
--

/*!40000 ALTER TABLE `settlement_sales` DISABLE KEYS */;
INSERT INTO `settlement_sales` (`id`,`ss_amount`,`st_id`,`employee_id`,`vat`,`void`,`ss_date`,`ss_revenue`,`customerCount`,`transactionCount`,`created_at`,`updated_at`,`customer_type`,`gross_total`,`net_total`) VALUES 
 (136,1,1,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (137,1,2,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (138,1,3,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (139,1,4,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (140,1,5,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (141,1,6,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (142,1,7,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (143,1,9,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (144,1,10,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (145,1,11,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:00:27','2011-08-18 22:00:27',NULL,1,1),
 (146,1,1,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (147,1,2,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (148,1,3,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (149,1,4,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (150,1,5,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (151,1,6,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (152,1,7,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (153,1,9,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (154,1,10,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (155,1,11,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-18 22:01:02','2011-08-18 22:01:02',NULL,1,1),
 (156,5,1,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (157,5,2,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (158,5,3,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (159,5,4,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (160,5,5,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (161,5,6,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (162,5,7,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (163,5,9,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (164,5,10,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (165,5,11,2,NULL,5,'2011-08-19',NULL,5,5,'2011-08-18 22:51:44','2011-08-18 22:51:44',NULL,5,5),
 (166,1,1,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:04','2011-08-19 02:29:04',NULL,1,1),
 (167,1,2,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:04','2011-08-19 02:29:04',NULL,1,1),
 (168,1,3,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:04','2011-08-19 02:29:04',NULL,1,1),
 (169,1,4,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:04','2011-08-19 02:29:04',NULL,1,1),
 (170,1,5,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:04','2011-08-19 02:29:04',NULL,1,1),
 (171,1,6,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:04','2011-08-19 02:29:04',NULL,1,1),
 (172,1,7,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:04','2011-08-19 02:29:04',NULL,1,1),
 (173,1,9,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:05','2011-08-19 02:29:05',NULL,1,1),
 (174,1,10,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:05','2011-08-19 02:29:05',NULL,1,1),
 (175,1,11,1,NULL,1,'2011-08-19',NULL,1,1,'2011-08-19 02:29:05','2011-08-19 02:29:05',NULL,1,1),
 (176,9,1,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (177,9,2,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (178,9,3,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (179,9,4,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (180,9,5,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (181,9,6,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (182,9,7,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (183,9,9,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (184,9,10,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9),
 (185,9,11,2,NULL,9,'2011-09-25',NULL,9,9,'2011-08-19 02:30:09','2011-08-19 02:30:09',NULL,9,9);
/*!40000 ALTER TABLE `settlement_sales` ENABLE KEYS */;


--
-- Definition of table `settlement_types`
--

DROP TABLE IF EXISTS `settlement_types`;
CREATE TABLE `settlement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `st_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settlement_types`
--

/*!40000 ALTER TABLE `settlement_types` DISABLE KEYS */;
INSERT INTO `settlement_types` (`id`,`st_name`,`created_at`,`updated_at`) VALUES 
 (1,'Comp 91','2011-08-03 01:36:05','2011-08-03 01:36:05'),
 (2,'Comp 92','2011-08-03 01:36:15','2011-08-03 01:36:15'),
 (3,'Comp 93','2011-08-03 01:36:27','2011-08-03 01:36:27'),
 (4,'Comp 94','2011-08-03 01:36:39','2011-08-03 01:36:39'),
 (5,'Comp 95','2011-08-03 01:36:49','2011-08-03 01:36:49'),
 (6,'Comp 96','2011-08-03 01:37:00','2011-08-03 01:37:00'),
 (7,'Comp 97','2011-08-03 01:37:08','2011-08-03 01:37:08'),
 (8,'Delivery','2011-08-03 01:39:15','2011-08-03 01:39:15'),
 (9,'Credit Card','2011-08-03 02:00:56','2011-08-03 02:00:56'),
 (10,'CASH','2011-08-03 02:01:10','2011-08-03 02:01:10'),
 (11,'Gift Certificate','2011-08-03 02:01:26','2011-08-03 02:01:26');
/*!40000 ALTER TABLE `settlement_types` ENABLE KEYS */;


--
-- Definition of table `ssrows`
--

DROP TABLE IF EXISTS `ssrows`;
CREATE TABLE `ssrows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `settlement_type_id` int(10) unsigned DEFAULT NULL,
  `ss_amount` float DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ssrows`
--

/*!40000 ALTER TABLE `ssrows` DISABLE KEYS */;
/*!40000 ALTER TABLE `ssrows` ENABLE KEYS */;


--
-- Definition of table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `subcategory_description` text,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` (`id`,`subcategory_name`,`subcategory_description`,`category_id`,`created_at`,`updated_at`) VALUES 
 (1,'Beef','',0,'2011-07-29 03:14:58','2011-07-29 03:14:58'),
 (2,'Chicken','',0,'2011-07-29 03:15:41','2011-07-29 03:15:41'),
 (3,'Beer','',1,'2011-07-29 03:15:59','2011-07-29 03:15:59'),
 (4,'Wine','',1,'2011-07-29 03:16:54','2011-07-29 03:16:54'),
 (5,'Iced Tea','',2,'2011-07-29 03:17:10','2011-07-29 03:17:10'),
 (6,'Soda','',2,'2011-07-29 03:17:24','2011-07-29 03:17:24');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;

--
-- Definition of table `ecrows`
--

DROP TABLE IF EXISTS `ecrows`;
CREATE TABLE `ecrows` (`id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, `endcount_id` integer, `inventory_id` integer, `beginning_quantity` float, `endcount_quantity` float, `created_at` datetime, `updated_at` datetime);

--
-- Dumping data for table `ecrows`
--

/*!40000 ALTER TABLE `ecrows` DISABLE KEYS */;
INSERT INTO `ecrows` VALUES(1,1,1,1.0,2.0,'2011-08-14 11:21:23.625000','2011-08-14 11:21:23.625000');
INSERT INTO `ecrows` VALUES(2,1,2,3.0,4.0,'2011-08-14 11:21:23.625000','2011-08-14 11:21:23.625000');
INSERT INTO `ecrows` VALUES(3,1,3,5.0,1.0,'2011-08-14 11:21:23.640625','2011-08-14 11:21:23.640625');
INSERT INTO `ecrows` VALUES(4,2,1,1.0,10.0,'2011-08-17 16:18:04.812500','2011-08-17 16:18:04.812500');
INSERT INTO `ecrows` VALUES(5,2,2,10.0,100.0,'2011-08-17 16:18:04.828125','2011-08-17 16:18:04.828125');
INSERT INTO `ecrows` VALUES(6,2,3,5.0,1.0,'2011-08-17 16:18:04.843750','2011-08-17 16:18:04.843750');
INSERT INTO `ecrows` VALUES(7,2,4,1.0,0.0,'2011-08-17 16:18:04.843750','2011-08-17 16:18:04.843750');
INSERT INTO `ecrows` VALUES(8,3,NULL,1.0,2.0,'2011-08-17 17:29:36.109375','2011-08-17 17:29:36.109375');
INSERT INTO `ecrows` VALUES(9,3,NULL,1.0,3.0,'2011-08-17 17:29:36.109375','2011-08-17 17:29:36.109375');
INSERT INTO `ecrows` VALUES(10,3,NULL,3.0,3.0,'2011-08-17 17:29:36.125000','2011-08-17 17:29:36.125000');
INSERT INTO `ecrows` VALUES(11,3,NULL,4.0,3.0,'2011-08-17 17:29:36.125000','2011-08-17 17:29:36.125000');
INSERT INTO `ecrows` VALUES(12,3,NULL,5.0,8.0,'2011-08-17 17:29:36.125000','2011-08-17 17:29:36.125000');
INSERT INTO `ecrows` VALUES(13,4,5,1.0,10.0,'2011-08-17 17:32:42.906250','2011-08-17 17:32:42.906250');
INSERT INTO `ecrows` VALUES(14,4,5,3.0,4.0,'2011-08-17 17:32:42.906250','2011-08-17 17:32:42.906250');
INSERT INTO `ecrows` VALUES(15,4,5,NULL,NULL,'2011-08-17 17:32:42.906250','2011-08-17 17:32:42.906250');
INSERT INTO `ecrows` VALUES(16,4,5,NULL,NULL,'2011-08-17 17:32:42.906250','2011-08-17 17:32:42.906250');
INSERT INTO `ecrows` VALUES(17,4,5,NULL,NULL,'2011-08-17 17:32:42.906250','2011-08-17 17:32:42.906250');
INSERT INTO `ecrows` VALUES(18,5,1,1.0,2.0,'2011-08-17 19:46:31.546875','2011-08-17 19:46:31.546875');
INSERT INTO `ecrows` VALUES(19,5,2,2.0,1.0,'2011-08-17 19:46:31.546875','2011-08-17 19:46:31.546875');
INSERT INTO `ecrows` VALUES(20,5,3,4.0,5.0,'2011-08-17 19:46:31.562500','2011-08-17 19:46:31.562500');
INSERT INTO `ecrows` VALUES(21,5,4,2.0,2.0,'2011-08-17 19:46:31.562500','2011-08-17 19:46:31.562500');
INSERT INTO `ecrows` VALUES(22,5,5,3.0,1.0,'2011-08-17 19:46:31.562500','2011-08-17 19:46:31.562500');
INSERT INTO `ecrows` VALUES(23,6,1,2.0,5.0,'2011-08-18 20:29:18.421875','2011-08-18 20:29:18.421875');
INSERT INTO `ecrows` VALUES(24,6,2,1.0,9.0,'2011-08-18 20:29:18.437500','2011-08-18 20:29:18.437500');
INSERT INTO `ecrows` VALUES(25,6,3,4.0,2.0,'2011-08-18 20:29:18.437500','2011-08-18 20:29:18.437500');
INSERT INTO `ecrows` VALUES(26,6,4,5.0,3.0,'2011-08-18 20:29:18.437500','2011-08-18 20:29:18.437500');
INSERT INTO `ecrows` VALUES(27,6,5,3.0,2.0,'2011-08-18 20:29:18.437500','2011-08-18 20:29:18.437500');
INSERT INTO `ecrows` VALUES(28,7,1,1.0,2.0,'2011-08-18 23:19:18.203125','2011-08-18 23:19:18.203125');
INSERT INTO `ecrows` VALUES(29,7,2,2.0,3.0,'2011-08-18 23:19:18.203125','2011-08-18 23:19:18.203125');
INSERT INTO `ecrows` VALUES(30,7,3,4.0,3.0,'2011-08-18 23:19:18.203125','2011-08-18 23:19:18.203125');
INSERT INTO `ecrows` VALUES(31,7,4,1.0,3.0,'2011-08-18 23:19:18.203125','2011-08-18 23:19:18.203125');
INSERT INTO `ecrows` VALUES(32,7,5,6.0,3.0,'2011-08-18 23:19:18.203125','2011-08-18 23:19:18.203125');
INSERT INTO `ecrows` VALUES(33,8,1,8.0,9.0,'2011-08-19 10:59:51.765625','2011-08-19 10:59:51.765625');
INSERT INTO `ecrows` VALUES(34,8,2,6.0,3.0,'2011-08-19 10:59:51.781250','2011-08-19 10:59:51.781250');
INSERT INTO `ecrows` VALUES(35,8,3,6.0,4.0,'2011-08-19 10:59:51.781250','2011-08-19 10:59:51.781250');
INSERT INTO `ecrows` VALUES(36,8,4,9.0,0.0,'2011-08-19 10:59:51.781250','2011-08-19 10:59:51.781250');
INSERT INTO `ecrows` VALUES(37,8,5,5.0,2.0,'2011-08-19 10:59:51.781250','2011-08-19 10:59:51.781250');
/*!40000 ALTER TABLE `ecrows` ENABLE KEYS */;

--
-- Definition of table `units`
--


DROP TABLE IF EXISTS `units`;
CREATE TABLE `units` (`id` INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, `unit_name` varchar(255), `created_at` datetime, `updated_at` datetime);

--
-- Dumping data for table `units`
--

/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES(1,'KG','2011-08-14 11:36:16.312500','2011-08-14 11:36:16.312500');
INSERT INTO `units` VALUES(2,'L','2011-08-14 11:36:21.640625','2011-08-14 11:36:21.640625');
INSERT INTO `units` VALUES(3,'Piece(s)','2011-08-14 11:36:36.187500','2011-08-14 11:36:36.187500');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
