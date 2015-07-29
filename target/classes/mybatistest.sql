/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : mybatistest

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2015-07-27 16:05:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) DEFAULT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('42003c93-828c-477f-8bdc-b1c774cc2ccb', null, null);
INSERT INTO `blog` VALUES ('43077626-9b4c-406d-9eaa-e81b473374b0', '是大多数', 'xxx');
INSERT INTO `blog` VALUES ('4e9b594c-505e-48ef-85de-988750a28067', '大的撒旦', 'xxx');
INSERT INTO `blog` VALUES ('60de0f8b-8ce2-4de9-94dc-5169595ba855', '大大', 'xxx');
INSERT INTO `blog` VALUES ('682119f5-74a6-46d4-ad59-6dde77e1c567', null, null);
INSERT INTO `blog` VALUES ('96c252f1-fe33-4452-830d-6e22c0acc24d', '大大', 'hhh');
INSERT INTO `blog` VALUES ('c444cb20-8a93-49b1-8cb5-9d7ff9d5881c', null, null);
INSERT INTO `blog` VALUES ('d1c5a71a-880d-4e36-9676-9a8cf1118e29', 'update', null);
INSERT INTO `blog` VALUES ('d3f3db03-1928-4ef5-aa44-672c33285c6f', '但大叔打的', 'hhh');
INSERT INTO `blog` VALUES ('d7c967ce-8eb2-41dc-b58c-f0d445e220cf', '打撒上', 'lll');
INSERT INTO `blog` VALUES ('ff6b73cc-7bdd-4fe7-85a3-03f1d65ecf61', '阿达说的', 'zzz');

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', 'group1', 'hhh');
INSERT INTO `group` VALUES ('2', 'group2', 'zzz');

-- ----------------------------
-- Table structure for `permit`
-- ----------------------------
DROP TABLE IF EXISTS `permit`;
CREATE TABLE `permit` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permit
-- ----------------------------
INSERT INTO `permit` VALUES ('1', 'edit', '/edit');
INSERT INTO `permit` VALUES ('2', 'delete', '/delete');
INSERT INTO `permit` VALUES ('9515a9c6-b66e-4745-8d62-5d74c13584b3', 'test', '/user/add');
INSERT INTO `permit` VALUES ('e4f8358d-80ad-435e-b293-5eef7ab4468f', 'test2', '/user/findByPage');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for `role_permit`
-- ----------------------------
DROP TABLE IF EXISTS `role_permit`;
CREATE TABLE `role_permit` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `role_id` varchar(255) DEFAULT NULL,
  `permit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permit
-- ----------------------------
INSERT INTO `role_permit` VALUES ('1', '1', '1');
INSERT INTO `role_permit` VALUES ('2', '1', '1');
INSERT INTO `role_permit` VALUES ('3', '1', '2');
INSERT INTO `role_permit` VALUES ('cd5dfe57-23ee-4b33-ae0e-c8fc0ec253e8', '1', 'e4f8358d-80ad-435e-b293-5eef7ab4468f');
INSERT INTO `role_permit` VALUES ('fd485745-0c03-42d2-beae-bd5ce39e7f6e', '1', '9515a9c6-b66e-4745-8d62-5d74c13584b3');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('16a1bc15-547e-48ac-850b-470e9d647057', 'username', 'password');
INSERT INTO `user` VALUES ('hhh', 'dasda', 'dsada');
INSERT INTO `user` VALUES ('xxx', 'dasd', 'dasd');
INSERT INTO `user` VALUES ('zzz', 'dasdad', 'dasdad');
