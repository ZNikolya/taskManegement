/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.18-log : Database - task_manegement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`task_manegement` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `task_manegement`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`task_id`,`user_id`,`comment`,`date`) values (12,5,2,'ÖÕ¿Õ¤Õ°Õ²Õ£','2020-06-26 19:59:22'),(16,7,4,'fdghjkghj','2020-06-26 20:34:30'),(21,5,4,'Õ¤Õ£ÖÕ¨Õ°Õ½Õ¿Õ²Õ£Õ¼ÖÕ£','2020-06-26 20:49:55');

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('NEW','IN_PROGRESS','FINISHED') NOT NULL DEFAULT 'NEW',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `task` */

insert  into `task`(`id`,`name`,`description`,`deadline`,`status`,`user_id`) values (5,'fgdf',' dfgfdg','2020-06-14','NEW',2),(6,'jkcxtg',' rtdhgxrfd','2020-07-03','FINISHED',3),(7,'Poxosi Task',' poxosner','2020-07-04','IN_PROGRESS',19),(8,'etsrgf',' dgxfd','2020-07-04','FINISHED',19);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('MANAGER','USER') NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`surname`,`email`,`password`,`type`,`picture_url`) values (1,'admin','admin','admin@mail.com','admin','MANAGER',NULL),(2,' Artash','Shagoyan','artash@mail.ru','artash','USER',NULL),(3,'barev','petrosyan','bala','jana','USER',NULL),(4,'srdgdthxb','ÖÕ£Õ¤Õ°','nikozohrabyan@mail.ru','B5trfAeek4zHf3M','MANAGER',NULL),(10,'9','9','9','9','USER',NULL),(11,'1','1','5','5','USER',NULL),(12,'Õ¤Õ¼Õ£Õ¤Õ¿Õ°','ÖÕ£Õ¤Õ°','6','6','USER',NULL),(13,'8','8','8','8','USER',NULL),(14,'gffdg','dfgdfdf','6dfgdfg','gfd','USER',NULL),(15,'ghjghj','hjhgj','6ghjhgj','hjhgj','USER',NULL),(16,'tryr','rtytry','rtyrty','tytry','USER',NULL),(17,'fdssdf','sdfdsf','dfdsf','6sdfsdf','USER',NULL),(18,'ghg','ghjghj','fgh','fghf','USER','1593020562108111.jpg'),(19,'Poxos','Poxosyan','poxos@mail.ru','poxos','USER','1593160332978111.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
