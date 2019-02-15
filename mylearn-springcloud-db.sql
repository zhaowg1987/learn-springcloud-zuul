
/*

项目中 数据库密码 用户名：root 密码：ZRBH （涉及到数据库中的密码使用druid加密，可自行修改加密替换密码） 

*/

/*
Navicat MySQL Data Transfer

Source Server         : 10.0.8.253_测试环境
Source Server Version : 50637
Source Host           : 10.0.8.253:3306
Source Database       : mylearn

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-02-15 10:05:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(48) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('admin', null, '$2a$10$cKRbR9IJktfmKmf/wShyo.5.J8IxO/7YVn8twuWFtvPgruAF8gtKq', null, 'authorization_code,password,refresh_token,client_credentials', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_resource`;
CREATE TABLE `t_sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `resource_name` varchar(64) DEFAULT NULL COMMENT '资源名称',
  `resource_code` varchar(64) DEFAULT NULL COMMENT '资源编码',
  `resource_uri` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '资源父ID',
  `http_method` varchar(8) DEFAULT NULL COMMENT '请求方式（GET\\POST）',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序编码',
  `careate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_operate` char(2) DEFAULT NULL COMMENT '是否可以操作（0：否 \\ 1：是）',
  `is_menu` char(2) DEFAULT NULL COMMENT '是否菜单（0：否、1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sys_resource
-- ----------------------------
INSERT INTO `t_sys_resource` VALUES ('1', '首页', 'm_index', '/', null, '', null, '2019-02-02 09:31:11', '2019-02-02 09:31:28', '1', '1');
INSERT INTO `t_sys_resource` VALUES ('2', '测试接口_你好', 'i_test_sayhi', '/sayHi', null, 'GET', null, '2019-02-02 09:53:08', '2019-02-02 09:54:31', '1', '0');
INSERT INTO `t_sys_resource` VALUES ('3', '资源服务器_你好', 'i_resource_hello', '/hello', null, 'GET', null, null, null, '1', '0');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_code` varchar(64) DEFAULT NULL COMMENT '角色代码',
  `role_name` varchar(128) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', 'Admin', '系统管理员');

-- ----------------------------
-- Table structure for t_sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_resource`;
CREATE TABLE `t_sys_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sys_role_resource
-- ----------------------------
INSERT INTO `t_sys_role_resource` VALUES ('1', '1', '1');
INSERT INTO `t_sys_role_resource` VALUES ('2', '1', '2');
INSERT INTO `t_sys_role_resource` VALUES ('3', '1', '3');

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(128) DEFAULT NULL COMMENT '用户登录名',
  `user_password` varchar(1024) DEFAULT NULL COMMENT '用户密码',
  `display_name` varchar(128) DEFAULT NULL COMMENT '前台展示名',
  `telephone` varchar(32) DEFAULT NULL COMMENT '办公电话',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '上次登录时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建用户ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新用户ID',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(2) DEFAULT '0' COMMENT '删除标志0 否 1是',
  `is_active` char(2) DEFAULT NULL COMMENT '0 禁用、1 启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'admin', '$2a$10$XqXf1RcJFj7oNa0hbTPxsulgO57UaTiamR5aPwtUpCry49bpVWOw6', '系统管理员', null, null, null, null, null, '2019-01-29 14:03:56', null, '2019-02-01 15:18:59', '0', '1');

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES ('1', '1', '1');
