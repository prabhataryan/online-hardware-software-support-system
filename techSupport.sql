/*
SQLyog Community Edition- MySQL GUI v6.56
MySQL - 5.1.45-community : Database - techsupport
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`techsupport` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `techsupport`;

/*Table structure for table `complain` */

DROP TABLE IF EXISTS `complain`;

CREATE TABLE `complain` (
  `complainId` int(11) NOT NULL AUTO_INCREMENT,
  `complainName` varchar(100) DEFAULT NULL,
  `complainDetail` varchar(1000) NOT NULL,
  `complainType` varchar(10) NOT NULL,
  `complainStatus` varchar(15) NOT NULL DEFAULT 'Pending',
  `complainAnswer` varchar(1000) DEFAULT 'No Answer',
  `customerId` int(11) NOT NULL,
  PRIMARY KEY (`complainId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `complain_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=1300009 DEFAULT CHARSET=latin1;

/*Data for the table `complain` */

insert  into `complain`(`complainId`,`complainName`,`complainDetail`,`complainType`,`complainStatus`,`complainAnswer`,`customerId`) values (1300001,'test','problem for detail','hardware','Processing','No Answer',300002);

/*Table structure for table `complainassign` */

DROP TABLE IF EXISTS `complainassign`;

CREATE TABLE `complainassign` (
  `complainId` int(11) NOT NULL,
  `enggId` int(11) NOT NULL,
  PRIMARY KEY (`complainId`),
  KEY `enggId` (`enggId`),
  CONSTRAINT `complainassign_ibfk_1` FOREIGN KEY (`complainId`) REFERENCES `complain` (`complainId`),
  CONSTRAINT `complainassign_ibfk_2` FOREIGN KEY (`enggId`) REFERENCES `engg` (`enggId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complainassign` */

insert  into `complainassign`(`complainId`,`enggId`) values (1300001,700001);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(20) NOT NULL,
  `customerUserName` varchar(30) NOT NULL,
  `customerMobile` varchar(13) NOT NULL,
  `customerCity` varchar(15) DEFAULT NULL,
  `customerPass` varchar(32) NOT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `customerUserName` (`customerUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=300014 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customerId`,`customerName`,`customerUserName`,`customerMobile`,`customerCity`,`customerPass`) values (300000,'test','test@gmail.com','0000000000','test','test'),(300001,'saurav','s123@gmail.com','8000004584','London','123456'),(300002,'sun','s@gmail.com','8455543543','kolkata','123'),(300003,'sam','sa@gmail.com','800000452','patna','1234567'),(300004,'sunny','abc@gmail.com','7063767963','haldia','1234'),(300005,'purabi','p@gmail.com','8299968896','haldia','456456'),(300006,'sunny','ss@gmail.com','7063767963','Haldia','1234');

/*Table structure for table `engg` */

DROP TABLE IF EXISTS `engg`;

CREATE TABLE `engg` (
  `enggId` int(11) NOT NULL AUTO_INCREMENT,
  `enggName` varchar(20) NOT NULL,
  `enggMail` varchar(20) NOT NULL,
  `enggMobile` varchar(13) DEFAULT NULL,
  `enggPassword` varchar(15) NOT NULL,
  PRIMARY KEY (`enggId`)
) ENGINE=InnoDB AUTO_INCREMENT=700004 DEFAULT CHARSET=latin1;

/*Data for the table `engg` */

insert  into `engg`(`enggId`,`enggName`,`enggMail`,`enggMobile`,`enggPassword`) values (700001,'testEngg','test','7894561230123','test'),(700002,'sam','s@gmail.com','8001620061','s');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
