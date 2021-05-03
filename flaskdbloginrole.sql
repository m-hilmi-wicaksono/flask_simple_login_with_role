/*
 Navicat MySQL Data Transfer

 Source Server         : lokal
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 127.0.0.1:3306
 Source Schema         : flaskdb

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 03/05/2021 15:08:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for computer
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

-- ----------------------------
-- Records of computer
-- ----------------------------
BEGIN;
INSERT INTO `computer` VALUES (1, 'haha');
INSERT INTO `computer` VALUES (2, 'hihi');
INSERT INTO `computer` VALUES (4, 'yyyy');
INSERT INTO `computer` VALUES (5, 'ttt');
INSERT INTO `computer` VALUES (6, 'asas');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(35) NOT NULL DEFAULT '',
  `isaktif` bit(1) NOT NULL DEFAULT b'0',
  `role` enum('user','admin','manager') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (2, 'Hilmi', '$2b$12$P0I25q5jGzuOsRnLTNrBpOV0HtTlZueIKJQYly6hSRL7KgHDp4zTW', 'hilmi@hihi.com', b'1', 'admin');
INSERT INTO `users` VALUES (3, 'tamu', '$2b$12$P0I25q5jGzuOsRnLTNrBpOV0HtTlZueIKJQYly6hSRL7KgHDp4zTW', 'tamu@hihi.com', b'0', 'user');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
