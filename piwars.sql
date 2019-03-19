-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- Server version:               8.0.15 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL 版本:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for piwars
CREATE DATABASE IF NOT EXISTS `piwars` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `piwars`;

-- Dumping structure for table piwars.additional
CREATE TABLE IF NOT EXISTS `additional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.apollo
CREATE TABLE IF NOT EXISTS `apollo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) NOT NULL,
  `challengeid` int(11) NOT NULL,
  `judgeid` int(11) NOT NULL,
  `gettime` tinyint(4) NOT NULL,
  `attempt` int(11) NOT NULL,
  `failfirst` tinyint(4) NOT NULL,
  `numcompleted` int(11) NOT NULL,
  `completeall` tinyint(4) NOT NULL,
  `numskip` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_apollo_team` (`teamid`),
  KEY `FK_apollo_challenge` (`challengeid`),
  KEY `FK_apollo_user` (`judgeid`),
  CONSTRAINT `FK_apollo_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_apollo_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_apollo_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.canyons
CREATE TABLE IF NOT EXISTS `canyons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) NOT NULL,
  `challengeid` int(11) NOT NULL,
  `judgeid` int(11) NOT NULL,
  `roundtime` int(11) NOT NULL,
  `spendtime` int(11) NOT NULL,
  `watchwalls` int(11) NOT NULL,
  `numzones` int(11) NOT NULL,
  `comments` text NOT NULL,
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_canyons_team` (`teamid`),
  KEY `FK_canyons_challenge` (`challengeid`),
  KEY `FK_canyons_user` (`judgeid`),
  CONSTRAINT `FK_canyons_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_canyons_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_canyons_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.challenge
CREATE TABLE IF NOT EXISTS `challenge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `timelimit` int(11) NOT NULL COMMENT 'units: minutes',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.curiosity
CREATE TABLE IF NOT EXISTS `curiosity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) NOT NULL,
  `challengeid` int(11) NOT NULL,
  `judgeid` int(11) NOT NULL,
  `numcollect` int(11) NOT NULL,
  `morethan` tinyint(4) NOT NULL,
  `comments` text NOT NULL,
  `addtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_curiosity_team` (`teamid`),
  KEY `challengeid` (`challengeid`),
  KEY `FK_curiosity_user` (`judgeid`),
  CONSTRAINT `FK_curiosity_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_curiosity_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `challengeid` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.hubble
CREATE TABLE IF NOT EXISTS `hubble` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challengeid` int(11) NOT NULL DEFAULT '0',
  `teamid` int(11) NOT NULL DEFAULT '0',
  `judgeid` int(11) NOT NULL,
  `method` int(11) NOT NULL COMMENT '1/2',
  `runtimes` int(11) NOT NULL COMMENT '1/2/3',
  `spendtime` int(11) NOT NULL COMMENT 'unit second',
  `correctred` tinyint(4) NOT NULL COMMENT '0/1',
  `correctblue` tinyint(4) NOT NULL COMMENT '0/1',
  `correctgreen` tinyint(4) NOT NULL COMMENT '0/1',
  `firstrescue` tinyint(4) NOT NULL,
  `scondrescue` tinyint(4) NOT NULL,
  `thirdrescue` tinyint(4) NOT NULL,
  `recorder` tinyint(4) NOT NULL,
  `correctyellow` tinyint(4) NOT NULL COMMENT '0/1',
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_hubble_team` (`teamid`),
  KEY `FK_hubble_challenge` (`challengeid`),
  KEY `FK_hubble_user` (`judgeid`),
  CONSTRAINT `FK_hubble_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_hubble_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_hubble_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.invaders
CREATE TABLE IF NOT EXISTS `invaders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) NOT NULL,
  `challengeid` int(11) NOT NULL,
  `judgeid` int(11) NOT NULL,
  `attempt` int(11) NOT NULL,
  `numtarget` int(11) NOT NULL,
  `allfive` tinyint(4) NOT NULL,
  `notuse` tinyint(4) NOT NULL,
  `passstop` tinyint(4) NOT NULL,
  `comments` text NOT NULL,
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_spaceinvaders_team` (`teamid`),
  KEY `FK_invaders_challenge` (`challengeid`),
  KEY `FK_invaders_user` (`judgeid`),
  CONSTRAINT `FK_invaders_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`),
  CONSTRAINT `FK_invaders_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_spaceinvaders_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.linespeed
CREATE TABLE IF NOT EXISTS `linespeed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challengeid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `judgeid` int(11) NOT NULL,
  `roundtime` tinyint(4) NOT NULL,
  `spendtime` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `touchwall` int(11) NOT NULL,
  `scap` tinyint(4) NOT NULL,
  `first escue` tinyint(4) NOT NULL,
  `thirdrescue` tinyint(4) NOT NULL,
  `secondrescue` tinyint(4) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_linespeed_user` (`judgeid`),
  KEY `FK_linespeed_team` (`teamid`),
  KEY `FK_linespeed_challenge` (`challengeid`),
  CONSTRAINT `FK_linespeed_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_linespeed_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_linespeed_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.morepoints
CREATE TABLE IF NOT EXISTS `morepoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) NOT NULL,
  `judgeid` int(11) NOT NULL,
  `blogpoints` int(11) NOT NULL,
  `blogcommenst` text NOT NULL,
  `technicalpoints` int(11) NOT NULL,
  `technicalcomments` text NOT NULL,
  `artisticpoints` int(11) NOT NULL,
  `artisticcomments` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `teamid` (`teamid`),
  KEY `FK_morepoints_user` (`judgeid`),
  CONSTRAINT `FK_extraPoints_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_morepoints_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.pinoon
CREATE TABLE IF NOT EXISTS `pinoon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `round` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `challengeid` int(11) NOT NULL,
  `judgeid` int(11) NOT NULL,
  `resultdraw` text NOT NULL,
  `nextround` tinyint(4) NOT NULL,
  `bye` tinyint(4) NOT NULL,
  `finalfirst` tinyint(4) NOT NULL,
  `finalsecond` tinyint(4) NOT NULL,
  `finalthird` tinyint(4) NOT NULL,
  `finalforth` tinyint(4) NOT NULL,
  `lostduel` tinyint(4) NOT NULL,
  `felloff` tinyint(4) NOT NULL,
  `enterarena` tinyint(4) NOT NULL,
  `spinspot` tinyint(4) NOT NULL,
  `addtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_pinoon_team` (`teamid`),
  KEY `FK_pinoon_challenge` (`challengeid`),
  KEY `FK_pinoon_user` (`judgeid`),
  CONSTRAINT `FK_pinoon_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pinoon_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pinoon_user` FOREIGN KEY (`judgeid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.schedule
CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `challengeid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_schedule_team` (`teamid`),
  KEY `FK_schedule_challenge` (`challengeid`),
  CONSTRAINT `FK_schedule_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_schedule_team` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.team
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `teamname` varchar(50) NOT NULL,
  `robotname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contactperson` varchar(50) NOT NULL,
  `mobilephone` varchar(50) NOT NULL,
  `daycompetition` date NOT NULL,
  `main` varchar(50) NOT NULL COMMENT '[1,2,3,4]',
  `addtional` varchar(50) NOT NULL COMMENT '[1,2,3,4]',
  `moreinfo` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_team_category` (`categoryid`),
  CONSTRAINT `FK_team_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table piwars.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto increment',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` tinyint(4) NOT NULL COMMENT '0 Ordinary referee\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n1 special referee\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n2 super admin',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastlogin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0/1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
