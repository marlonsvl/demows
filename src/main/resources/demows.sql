/*
 Navicat Premium Data Transfer

 Source Server         : mysqllocal
 Source Server Type    : MySQL
 Source Server Version : 50612
 Source Host           : localhost
 Source Database       : demows

 Target Server Type    : MySQL
 Target Server Version : 50612
 File Encoding         : utf-8

 Date: 12/10/2015 18:10:29 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `person`
-- ----------------------------
BEGIN;
INSERT INTO `person` VALUES ('1', 'Bilbo', 'Baggins'), ('2', 'Marlon', 'Viñan');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
