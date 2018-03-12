/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.7.18-log : Database - educenter
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`educenter` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `educenter`;

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `lecturer` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`description`,`lecturer`,`price`) values 
(1,'Java','Lavn e','Karen Gasparyan',350000),
(2,'C++','super','Valod',200000);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `age` int(2) DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('MANAGER','STUDENT') NOT NULL DEFAULT 'STUDENT',
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`surname`,`age`,`phone`,`email`,`password`,`type`,`verify`,`token`) values 
(15,'manager','manager',24,'234567','manager@mail.com','$2a$10$xYpQMP//U.OYgkvG2w5GfuNvkjnCuIWc0ywiihPjuHLr9tmNLR1ki','MANAGER',0,NULL),
(16,'Gor','Gevorgyan',23,'098149490','gevorgyan604@gmail.com','$2a$10$et8tYamXNCcmVUf7dbWhl.l9vnLcMQ1hkExgGD8i6Hj8AXSnUftSC','STUDENT',0,'e7a981ff-bff7-4d1a-87df-aaa200ae4b6e'),
(17,'Poxos','Poxosyan',24,'09876543','poxos@mail.ru','$2a$10$s8LboYhwnmdwnwRAyiv55.XekWBpVbCwNe8JX6xER8IwBRbDFlE4O','STUDENT',0,'248a63aa-0768-4f38-bb7b-9a4d7cdd7ec4');

/*Table structure for table `user_subject` */

DROP TABLE IF EXISTS `user_subject`;

CREATE TABLE `user_subject` (
  `subject_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`subject_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `user_subject_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_subject` */

insert  into `user_subject`(`subject_id`,`user_id`) values 
(1,16);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
