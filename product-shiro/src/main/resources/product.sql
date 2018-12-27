/*
Navicat MySQL Data Transfer

Source Server         : product
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : product

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2018-12-27 10:59:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', 'admin', '0', 'admin', null, '333333');
INSERT INTO `module` VALUES ('2', 'lisi', '0', 'lisi', null, '22222');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'cs', 'cs1', '0', '', null);
INSERT INTO `role` VALUES ('2', 'lisi', 'lisi', '0', null, null);
INSERT INTO `role` VALUES ('3', 'csd', 'csd', '0', 'sssss', null);
INSERT INTO `role` VALUES ('4', 'sss', 'sss', '0', 'sssss', null);

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES ('1', '1', '1');
INSERT INTO `role_module` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  `login_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '0', 'admin', '1231232', 'admin@123.com', null, null);
INSERT INTO `user` VALUES ('2', 'lisi', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('17', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('18', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('19', 'zs', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('20', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('21', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('22', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('23', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('24', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('25', 'zs', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('26', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('27', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('28', 'ceshidde', '123', '0', 'lisi', '123', 'lisi@123.com', null, null);
INSERT INTO `user` VALUES ('29', 'cheetahyt', 'yuantao123A', '0', 'aa', '12345678963', 'zz@123.com', null, null);
INSERT INTO `user` VALUES ('30', 'cheetahyt', 'yuantao123A', '0', 'aa', '12345678963', 'zz@123.com', null, null);
INSERT INTO `user` VALUES ('31', 'cheetahyt', 'yuantao123A', '0', 'aa', '12345678963', 'zz@123.com', null, null);
INSERT INTO `user` VALUES ('32', 'cheetahyt', 'yuantao123A', '0', 'aa', '12345678963', 'zz@123.com', null, null);
INSERT INTO `user` VALUES ('33', 'ss', '123', '0', 'ss', '12345678963', 'ss@123.com', null, null);
INSERT INTO `user` VALUES ('34', 'cheetahyt', '123', '0', '111', '111234567896', 'qq@qw.com', null, null);
INSERT INTO `user` VALUES ('35', 'cs', '1234', '0', 'cs', '12345678963', 'zs@123.com', '2018-12-26 17:12:25', null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');
