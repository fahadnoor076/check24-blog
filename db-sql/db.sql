/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 5.7.36 : Database - db_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_blog` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_blog`;

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `AuthorId` int(11) DEFAULT NULL,
  `Title` varchar(75) DEFAULT NULL,
  `Slug` varchar(100) DEFAULT NULL,
  `Content` text,
  `IsPublished` tinyint(4) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `PublishedAt` datetime DEFAULT NULL,
  `ImageUrl` varchar(200) DEFAULT NULL,
  `DeletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AuthorId` (`AuthorId`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `post` */

insert  into `post`(`Id`,`AuthorId`,`Title`,`Slug`,`Content`,`IsPublished`,`CreatedAt`,`UpdatedAt`,`PublishedAt`,`ImageUrl`,`DeletedAt`) values 
(16,1,'bbb','bbb','bbbbb',1,'2022-08-29 10:47:04','2022-08-29 10:47:04','2022-08-29 10:47:04','bbbb',NULL),
(15,1,'aaaa','aaaa','aaaaaa',1,'2022-08-29 10:46:26','2022-08-29 10:46:26','2022-08-29 10:46:26','aaaa',NULL),
(17,1,'ccc','ccc','cccccc',1,'2022-08-29 10:47:10','2022-08-29 10:47:10','2022-08-29 10:47:10','cccc',NULL),
(18,1,'ddd','ddd','ddddddd',1,'2022-08-29 10:47:17','2022-08-29 10:47:17','2022-08-29 10:47:17','ddd',NULL),
(19,1,'gggg','gggg','ggggggggggggggasdasd',1,'2022-08-29 11:16:09','2022-08-29 11:16:09','2022-08-29 11:16:09','ggg',NULL);

/*Table structure for table `post_comment` */

DROP TABLE IF EXISTS `post_comment`;

CREATE TABLE `post_comment` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PostId` bigint(20) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Content` text,
  `CreatedAt` datetime DEFAULT NULL,
  `PublishedAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `DeletedAt` datetime DEFAULT NULL,
  `CommentedBy` bigint(20) DEFAULT NULL,
  `Url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PostId` (`PostId`),
  KEY `CommentedBy` (`CommentedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `post_comment` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PasswordHash` varchar(100) DEFAULT NULL,
  `RegisteredAt` datetime DEFAULT NULL,
  `ModifiedAt` datetime DEFAULT NULL,
  `LastLoginAt` datetime DEFAULT NULL,
  `DeletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`Id`,`FirstName`,`LastName`,`Mobile`,`Email`,`PasswordHash`,`RegisteredAt`,`ModifiedAt`,`LastLoginAt`,`DeletedAt`) values 
(1,'Fahad','Noor','+60164926818','fahadnoor076@gmail.com','$2y$10$w6odk5qQJuSqBYMd8FM7XeeOhuHxQbkgInL9vDXFEmGjuDswoVh2m','2022-08-29 16:09:41','2022-08-29 16:09:44',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
