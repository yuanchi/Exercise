/*
SQLyog Community v12.12 (64 bit)
MySQL - 10.0.20-MariaDB : Database - exercise
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`exercise` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `exercise`;

/*Table structure for table `personalinfo` */

DROP TABLE IF EXISTS `personalinfo`;

CREATE TABLE `personalinfo` (
  `id` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `nameEng` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `class` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `personalinfo` */

insert  into `personalinfo`(`id`,`name`,`nameEng`,`code`,`class`) values ('20150620-135554303-dMurV','系統管理','System Manager','System',1),('20150620-135554561-IRxlf','系統管理員','System manager','System_root',2);

/*Table structure for table `shr_allgroup` */

DROP TABLE IF EXISTS `shr_allgroup`;

CREATE TABLE `shr_allgroup` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parentId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_shr_allgroup_1` (`parentId`),
  CONSTRAINT `FK_shr_allgroup_1` FOREIGN KEY (`parentId`) REFERENCES `shr_allgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_allgroup` */

insert  into `shr_allgroup`(`id`,`name`,`parentId`,`type`,`info`) values ('20150620-135554342-fSvdi',NULL,NULL,0,'20150620-135554303-dMurV');

/*Table structure for table `shr_allrole` */

DROP TABLE IF EXISTS `shr_allrole`;

CREATE TABLE `shr_allrole` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_allrole` */

insert  into `shr_allrole`(`id`,`name`) values ('20150620-135553337-KZQOW','ROLE_Test_1'),('20150620-135553371-ZErEp','ROLE_Test_2'),('20150620-135553372-bxnqi','ROLE_Test_3'),('20150620-135553373-PHebq','ROLE_Test_4'),('20150620-135553374-Xloya','ROLE_Test_5'),('20150620-135553375-OtTte','ROLE_Test_6'),('20150620-135553376-WJFlc','ROLE_Test_7'),('20150620-135553377-oPCmI','ROLE_Test_8'),('20150620-135553378-WGwSR','ROLE_Test_9'),('20150620-135553379-sAYss','ROLE_Test_10');

/*Table structure for table `shr_alluser` */

DROP TABLE IF EXISTS `shr_alluser`;

CREATE TABLE `shr_alluser` (
  `userId` varchar(100) DEFAULT NULL,
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `info` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disabled` tinyint(3) unsigned NOT NULL,
  `defaultGroup` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_alluser_userId` (`userId`),
  KEY `FK_alluser_1` (`defaultGroup`),
  CONSTRAINT `FK_alluser_1` FOREIGN KEY (`defaultGroup`) REFERENCES `shr_allgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_alluser` */

insert  into `shr_alluser`(`userId`,`id`,`name`,`password`,`info`,`disabled`,`defaultGroup`) values ('root','20150620-135555247-YLxMm',NULL,'sysmanager','20150620-135554561-IRxlf',0,'20150620-135554342-fSvdi');

/*Table structure for table `shr_datachangelog` */

DROP TABLE IF EXISTS `shr_datachangelog`;

CREATE TABLE `shr_datachangelog` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `docId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `docType` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `logTime` datetime NOT NULL,
  `userId` varchar(100) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_datachangelog` */

/*Table structure for table `shr_datachangelogdetail` */

DROP TABLE IF EXISTS `shr_datachangelogdetail`;

CREATE TABLE `shr_datachangelogdetail` (
  `dataChangeLogId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idx` int(10) unsigned NOT NULL,
  `fieldName` varchar(100) NOT NULL,
  `originalContent` text,
  `changedContent` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_datachangelogdetail` */

/*Table structure for table `shr_defaultserial` */

DROP TABLE IF EXISTS `shr_defaultserial`;

CREATE TABLE `shr_defaultserial` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sep0` varchar(20) DEFAULT NULL,
  `dateSep0` varchar(10) DEFAULT NULL,
  `sep1` varchar(20) DEFAULT NULL,
  `dateSep1` varchar(10) DEFAULT NULL,
  `sep2` varchar(20) DEFAULT NULL,
  `dateSep2` varchar(10) DEFAULT NULL,
  `sep3` varchar(20) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `sep4` varchar(20) DEFAULT NULL,
  `note` varchar(300) DEFAULT NULL,
  `resetNoField` varchar(20) DEFAULT NULL,
  `resetNoFieldLV` varchar(100) DEFAULT NULL,
  `resetNoTo` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_defaultserial` */

/*Table structure for table `shr_emailtemplate` */

DROP TABLE IF EXISTS `shr_emailtemplate`;

CREATE TABLE `shr_emailtemplate` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `toAddress` text,
  `ccAddress` text,
  `fromAddress` text,
  `subject` text,
  `content` text,
  `attachment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_emailtemplate` */

/*Table structure for table `shr_exportcolumn` */

DROP TABLE IF EXISTS `shr_exportcolumn`;

CREATE TABLE `shr_exportcolumn` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `columns` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_exportcolumn` */

/*Table structure for table `shr_group_user` */

DROP TABLE IF EXISTS `shr_group_user`;

CREATE TABLE `shr_group_user` (
  `groupId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`groupId`,`userId`),
  KEY `FK_group_user_2` (`userId`),
  CONSTRAINT `FK_group_user_1` FOREIGN KEY (`groupId`) REFERENCES `shr_allgroup` (`id`),
  CONSTRAINT `FK_group_user_2` FOREIGN KEY (`userId`) REFERENCES `shr_alluser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_group_user` */

/*Table structure for table `shr_indexdocument` */

DROP TABLE IF EXISTS `shr_indexdocument`;

CREATE TABLE `shr_indexdocument` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `docId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `docType` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fullContent` text,
  `displayTitle` varchar(300) DEFAULT NULL,
  `owner` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ownedGroup` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_indexdocument_1` (`owner`),
  KEY `Index_3` (`docId`),
  KEY `FK_shr_indexdocument_2` (`ownedGroup`),
  KEY `FK_shr_indexdocument_3` (`parent`),
  CONSTRAINT `FK_indexdocument_1` FOREIGN KEY (`owner`) REFERENCES `shr_alluser` (`id`),
  CONSTRAINT `FK_shr_indexdocument_2` FOREIGN KEY (`ownedGroup`) REFERENCES `shr_allgroup` (`id`),
  CONSTRAINT `FK_shr_indexdocument_3` FOREIGN KEY (`parent`) REFERENCES `shr_indexdocument` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_indexdocument` */

/*Table structure for table `shr_parameter` */

DROP TABLE IF EXISTS `shr_parameter`;

CREATE TABLE `shr_parameter` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `categoryId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sequence` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parameter_1` (`categoryId`),
  CONSTRAINT `FK_parameter_1` FOREIGN KEY (`categoryId`) REFERENCES `shr_parameter_cat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_parameter` */

/*Table structure for table `shr_parameter_cat` */

DROP TABLE IF EXISTS `shr_parameter_cat`;

CREATE TABLE `shr_parameter_cat` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_parameter_cat` */

/*Table structure for table `shr_parameter_i18n` */

DROP TABLE IF EXISTS `shr_parameter_i18n`;

CREATE TABLE `shr_parameter_i18n` (
  `parameterId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `localString` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`parameterId`,`localString`),
  CONSTRAINT `FK_shr_parameter_i18n_1` FOREIGN KEY (`parameterId`) REFERENCES `shr_parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_parameter_i18n` */

/*Table structure for table `shr_parameter_next` */

DROP TABLE IF EXISTS `shr_parameter_next`;

CREATE TABLE `shr_parameter_next` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nextId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `idx` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`nextId`),
  KEY `FK_shr_parameter_next_2` (`nextId`),
  CONSTRAINT `FK_shr_parameter_next_1` FOREIGN KEY (`id`) REFERENCES `shr_parameter` (`id`),
  CONSTRAINT `FK_shr_parameter_next_2` FOREIGN KEY (`nextId`) REFERENCES `shr_parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_parameter_next` */

/*Table structure for table `shr_printtemplate` */

DROP TABLE IF EXISTS `shr_printtemplate`;

CREATE TABLE `shr_printtemplate` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `note` text,
  `kind` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `kind1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `kind2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `templateFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_shr_printtemplate_1` (`kind`),
  KEY `FK_shr_printtemplate_2` (`kind1`),
  KEY `FK_shr_printtemplate_3` (`kind2`),
  KEY `FK_shr_printtemplate_4` (`templateFile`),
  CONSTRAINT `FK_shr_printtemplate_1` FOREIGN KEY (`kind`) REFERENCES `shr_parameter` (`id`),
  CONSTRAINT `FK_shr_printtemplate_2` FOREIGN KEY (`kind1`) REFERENCES `shr_parameter` (`id`),
  CONSTRAINT `FK_shr_printtemplate_3` FOREIGN KEY (`kind2`) REFERENCES `shr_parameter` (`id`),
  CONSTRAINT `FK_shr_printtemplate_4` FOREIGN KEY (`templateFile`) REFERENCES `shr_storagefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_printtemplate` */

/*Table structure for table `shr_role_group` */

DROP TABLE IF EXISTS `shr_role_group`;

CREATE TABLE `shr_role_group` (
  `roleId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `groupId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`roleId`,`groupId`),
  KEY `FK_role_group_2` (`groupId`),
  CONSTRAINT `FK_role_group_1` FOREIGN KEY (`roleId`) REFERENCES `shr_allrole` (`id`),
  CONSTRAINT `FK_role_group_2` FOREIGN KEY (`groupId`) REFERENCES `shr_allgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_role_group` */

insert  into `shr_role_group`(`roleId`,`groupId`) values ('20150620-135553337-KZQOW','20150620-135554342-fSvdi'),('20150620-135553371-ZErEp','20150620-135554342-fSvdi'),('20150620-135553372-bxnqi','20150620-135554342-fSvdi'),('20150620-135553373-PHebq','20150620-135554342-fSvdi'),('20150620-135553374-Xloya','20150620-135554342-fSvdi'),('20150620-135553375-OtTte','20150620-135554342-fSvdi'),('20150620-135553376-WJFlc','20150620-135554342-fSvdi'),('20150620-135553377-oPCmI','20150620-135554342-fSvdi'),('20150620-135553378-WGwSR','20150620-135554342-fSvdi'),('20150620-135553379-sAYss','20150620-135554342-fSvdi');

/*Table structure for table `shr_role_user` */

DROP TABLE IF EXISTS `shr_role_user`;

CREATE TABLE `shr_role_user` (
  `roleId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `FK_role_user_2` (`userId`),
  CONSTRAINT `FK_role_user_1` FOREIGN KEY (`roleId`) REFERENCES `shr_allrole` (`id`),
  CONSTRAINT `FK_role_user_2` FOREIGN KEY (`userId`) REFERENCES `shr_alluser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_role_user` */

/*Table structure for table `shr_simpleaclentry` */

DROP TABLE IF EXISTS `shr_simpleaclentry`;

CREATE TABLE `shr_simpleaclentry` (
  `docId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `actUser` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `actGroup` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `level` int(10) unsigned NOT NULL,
  `idx` int(10) unsigned DEFAULT NULL,
  KEY `Index_1` (`docId`),
  KEY `FK_simpleaclentry_1` (`actUser`),
  KEY `FK_simpleaclentry_2` (`actGroup`),
  CONSTRAINT `FK_simpleaclentry_1` FOREIGN KEY (`actUser`) REFERENCES `shr_alluser` (`id`),
  CONSTRAINT `FK_simpleaclentry_2` FOREIGN KEY (`actGroup`) REFERENCES `shr_allgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_simpleaclentry` */

/*Table structure for table `shr_storagefile` */

DROP TABLE IF EXISTS `shr_storagefile`;

CREATE TABLE `shr_storagefile` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `docId` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `contentType` varchar(100) DEFAULT NULL,
  `docType` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `rawData` longblob,
  `col` varchar(45) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `fsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Index_2` (`docId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shr_storagefile` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
