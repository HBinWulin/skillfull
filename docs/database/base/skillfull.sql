/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_122.51.135.94
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 122.51.135.94:3306
 Source Schema         : skillfull

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 15/03/2021 11:17:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_common_data_map
-- ----------------------------
DROP TABLE IF EXISTS `auth_common_data_map`;
CREATE TABLE `auth_common_data_map` (
  `data_map_id` varchar(32) NOT NULL COMMENT '数据映射id',
  `map_original_type` smallint NOT NULL COMMENT '映射原类型:1-系统数据，2-区域数据，3-组织数据，4-用户组数据，5-个人数据',
  `original_id` varchar(32) NOT NULL COMMENT '映射原类型id',
  `target_map_type` smallint DEFAULT NULL COMMENT '映射目标类型:1-系统数据，2-区域数据，3-组织数据，4-用户组数据，5-个人数据',
  `target_id` varchar(32) DEFAULT NULL COMMENT '映射目标类型id',
  `operation_type` smallint NOT NULL COMMENT '数据操作类型:1.公有话，2.私有化，3.目标映射',
  `permission_data_rule_mutex` smallint NOT NULL COMMENT '权限添置规则互斥：0.取消填制规则,1. 按原按钮填值规则，默认1',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`data_map_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据映射表';

-- ----------------------------
-- Records of auth_common_data_map
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_common_user_agent
-- ----------------------------
DROP TABLE IF EXISTS `auth_common_user_agent`;
CREATE TABLE `auth_common_user_agent` (
  `agent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理id',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名id',
  `agent_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理人用户id',
  `agent_start_time` datetime DEFAULT NULL COMMENT '代理开始时间',
  `agent_end_time` datetime DEFAULT NULL COMMENT '代理结束时间',
  `agent_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态：0-无效，1-有效',
  `index_help` varchar(32) NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除该值为主键',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`agent_id`),
  UNIQUE KEY `unique_agent` (`user_id`,`agent_user_id`,`index_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户-代理人表';

-- ----------------------------
-- Records of auth_common_user_agent
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_common_user_identity
-- ----------------------------
DROP TABLE IF EXISTS `auth_common_user_identity`;
CREATE TABLE `auth_common_user_identity` (
  `identity_id` varchar(32) NOT NULL COMMENT '实名信息id',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `real_name` varchar(64) NOT NULL COMMENT '真实姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别:0-默认未知,1-男,2-女,默认0',
  `nationality` varchar(32) DEFAULT NULL COMMENT '名族',
  `id_card` varchar(32) DEFAULT NULL COMMENT '身份证件号码',
  `id_card_issue` varchar(256) DEFAULT NULL COMMENT '身份证件发证机关',
  `id_card_effective` datetime DEFAULT NULL COMMENT '身份证书有效期开始',
  `id_card_effective_end` datetime DEFAULT NULL COMMENT '身份证有效期结束',
  `positive_photo` varchar(256) DEFAULT NULL COMMENT '正面照',
  `back_photo` varchar(256) DEFAULT NULL COMMENT '反面照',
  `handheld_photo` varchar(256) DEFAULT NULL COMMENT '证件手持照',
  `identity_status` smallint NOT NULL DEFAULT '0' COMMENT '实名状态:0-待审核,1-审核中，2-无效(审核失败)，3-有效(审核成功),默认0',
  `audit_start_time` datetime DEFAULT NULL COMMENT '审核开始时间',
  `audit_end_time` datetime DEFAULT NULL COMMENT '审核结束时间',
  `bank_card_positive` varchar(256) DEFAULT NULL COMMENT '银行卡正面',
  `bank_card_back` varchar(256) DEFAULT NULL COMMENT '银行卡反面',
  `bank_card_num` varchar(32) DEFAULT NULL COMMENT '银行卡号',
  `bank_reserve_phone` varchar(32) DEFAULT NULL COMMENT '银行预留手机号码',
  `belong_area` varchar(256) DEFAULT NULL COMMENT '银行卡归属地',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`identity_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='实名信息表';

-- ----------------------------
-- Records of auth_common_user_identity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_correlate_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_correlate_role`;
CREATE TABLE `auth_rbac_correlate_role` (
  `correlate_role_id` varchar(32) NOT NULL COMMENT '角色关联关系id',
  `correlate_id` varchar(32) NOT NULL COMMENT '关联id',
  `correlate_type` smallint NOT NULL COMMENT '关联类型：1-组织机构,2-职位,3-个人',
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  PRIMARY KEY (`correlate_role_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_correlate_role` (`correlate_id`,`correlate_type`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色关联关系表';

-- ----------------------------
-- Records of auth_rbac_correlate_role
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_correlate_role` VALUES ('1369207482481164288', '1355167397507022848', 3, '1314235356968173568', NULL, '1355167397507022848', 'zxiaozhou', '2021-03-09 16:44:37', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_correlate_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_correlate_user`;
CREATE TABLE `auth_rbac_correlate_user` (
  `correlate_user_id` varchar(32) NOT NULL COMMENT '用户关联关系id',
  `correlate_id` varchar(32) NOT NULL COMMENT '关联id',
  `correlate_type` smallint NOT NULL COMMENT '关联类型：1-组织机构,2-职位',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`correlate_user_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_correlate_role` (`correlate_id`,`correlate_type`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户关联关系表';

-- ----------------------------
-- Records of auth_rbac_correlate_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_correlate_user` VALUES ('1368827727521038336', '1368825228785401856', 1, '1368827727420375040', NULL, NULL, NULL, NULL, NULL, '1355167397507022848', 'zxiaozhou', NULL, '2021-03-08 15:35:36', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_org
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_org`;
CREATE TABLE `auth_rbac_org` (
  `org_id` varchar(32) NOT NULL COMMENT '组织id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级组织id',
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织名称',
  `org_name_en` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '英文名',
  `org_name_abbr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '缩写',
  `org_order` int DEFAULT '0' COMMENT '排序',
  `org_type` smallint DEFAULT NULL COMMENT '组织机构类型：1-公司,2-部门',
  `org_code` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织编码',
  `org_sys_code` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织编码(系统)',
  `org_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '组织状态：0-无效，1-有效，默认0',
  `auto_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '绑定方式:0-手动,1-自动。默认0',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '传真',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `unique_help` varchar(32) NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除该值为主键',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `Unique_code` (`org_sys_code`,`unique_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`),
  KEY `Unique_org_sys_code` (`org_sys_code`,`unique_help`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组织表';

-- ----------------------------
-- Records of auth_rbac_org
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_org` VALUES ('1368825076939014144', NULL, 'sdfsdfdsf', 'sdfsdf', NULL, 0, 1, 'sdfsdfsdf', 'A001', 1, 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '1355167397507022848', NULL, 'zxiaozhou', '2021-03-08 15:25:05', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_org` VALUES ('1368825138196824064', '1368825076939014144', 'sdfsdf', 'sdfsdf', NULL, 0, 1, 'sdfsdfsdfsdfsdf', 'A001A001', 1, 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '1355167397507022848', NULL, 'zxiaozhou', '2021-03-08 15:25:19', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_org` VALUES ('1368825228785401856', '1368825138196824064', 'sdfsdfsdf', 'sdfsdfsdf', 'sdfsdf', 0, 1, 'sdfsdfsdfsdfsdfsdfsdfsdf', 'A001A001A001', 1, 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '1355167397507022848', NULL, 'zxiaozhou', '2021-03-08 15:25:41', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_permission`;
CREATE TABLE `auth_rbac_permission` (
  `permission_id` varchar(32) NOT NULL COMMENT '权限id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端组件',
  `path_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路由名称',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '重定向地址',
  `permission_type` tinyint NOT NULL COMMENT '权限类型(0:目录; 1:菜单:2:按钮)',
  `permission_sys_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统内置编码(系统自动生成)',
  `actions_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '按钮权限后端对应uri(相对地址,check_action_request为true时必填)',
  `actions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '按钮权限编码，例如：“sys:schedule:list”,多个逗号隔开',
  `is_external` tinyint(1) DEFAULT '0' COMMENT '是否外部链接，1-是，0-不是，默认不是(前端路由为boolean类型)',
  `external_url` varchar(256) DEFAULT '0' COMMENT '外部链接地址',
  `open_type` tinyint(1) DEFAULT '1' COMMENT '外部链接打开方式:1-新页面,2-当前页面,。默认1',
  `button_strategy` tinyint(1) DEFAULT NULL COMMENT '按钮校验策略：1-显示控制(未授权时前端按钮不显示)，2-编辑控制(未授权时前端按钮显示但后端数据不可操作)',
  `check_action_request` tinyint(1) DEFAULT NULL COMMENT '按钮权限是否校验后端，1-校验,0-不校验(前端路由为boolean类型,当校验时actions_uri必填)',
  `sort_no` int NOT NULL DEFAULT '0' COMMENT '排序，值越小越靠前,默认0',
  `icon_type` tinyint(1) DEFAULT '0' COMMENT '图标类型:0-系统自带,1-自定义。默认0',
  `active_menu` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '指定侧边栏高亮路由，设置后点击当前路由侧边栏会高亮制定的路由',
  `icon` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `always_show` tinyint(1) DEFAULT '0' COMMENT '显示为根路由:0-否1-是,默认0,设置后会一直以根路由形式显示(前端路由为boolean类型)',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '隐藏路由:0-隐藏,1-不隐藏,默认0,隐藏后侧边栏不显示(前端路由为boolean类型)',
  `permission_status` tinyint(1) DEFAULT '0' COMMENT '权限状态:0-无效，1-有效,默认0',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '缓存路由:1-缓存,0不缓存,前端路由为boolean类型)',
  `breadcrumb` tinyint(1) DEFAULT '1' COMMENT '面包屑中显示:0-不显示,1-显示,默认1,(前端路由为boolean类型)',
  `affix` tinyint(1) DEFAULT '0' COMMENT '是否tags中固定:0-不固定,1-固定,默认0,(前端路由为boolean类型)',
  `enable_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可删除:0-不可删除,1-可删除。默认1(用户系统内置数据不可删除)',
  `unique_help` varchar(32) NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除该值为主键',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `Unique_permission_sys_code` (`permission_sys_code`,`unique_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_permission_status` (`permission_status`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';

-- ----------------------------
-- Records of auth_rbac_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_permission` VALUES ('1350118557196271616', '', '权限管理', '/rbac', 'BasicLayout', 'rbac', '/rbac/permission', 0, 'A002', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, 'el-icon-_vercode', 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350123000109252608', '1350118557196271616', '菜单管理', '/rbac/permission', '/auth/rbac/PermissionList', 'rbac-permission', NULL, 1, 'A002A001', NULL, NULL, 0, '0', 1, 1, 0, 3, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 0, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '000fd73785565de9ceb24a265a1f5885', 'zxiaozhou', '2021-01-29 01:30:18', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350123560124334080', '', '存储管理', '/storage', 'BasicLayout', 'storage', '/storage/local', 0, 'A009', NULL, NULL, 0, '0', 1, 1, 0, 4, 0, NULL, 'el-icon-folder-opened', 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350124304009314304', '1350123560124334080', '本地存储', '/storage/local', '/storage/local/LocalFileList', 'local', NULL, 1, 'A009A001', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350126916741939200', '1350123560124334080', '对象存储', '/storage/oss', '/storage/oss/OssFileList', 'oss', NULL, 1, 'A009A002', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350133275944337408', '1350118557196271616', '角色管理', '/rbac/role', '/auth/rbac/RoleList', 'rbac-role', NULL, 1, 'A002A002', NULL, NULL, 0, '0', 1, 1, 0, 4, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '000fd73785565de9ceb24a265a1f5885', 'zxiaozhou', '2021-01-29 01:30:29', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350134241062076416', '', '系统管理', '/sys', 'BasicLayout', 'sys', '/sys/dict', 0, 'A008', NULL, NULL, 0, '0', 1, 1, 0, 3, 0, NULL, 'el-icon-setting', 0, 0, 1, 1, 1, 0, 0, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350134884728356864', '1350134241062076416', '数据字典', '/sys/dict', '/system/common/DictList', 'dict', NULL, 1, 'A008A001', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-02-12 21:32:56', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350137977897533440', '1350123000109252608', '添加', '', NULL, NULL, NULL, 2, 'A002A001A001', NULL, 'edit', 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350734475513348096', '', '工具文档', '/doc', 'BasicLayout', 'doc', '/doc/swagger', 0, 'A006', NULL, NULL, 0, '0', 1, 1, 0, 10, 0, NULL, 'el-icon-document', 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-02-12 21:45:16', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350734726659883008', '1350734475513348096', '接口文档', '/swagger', '/common/iframe/index', 'swagger', NULL, 1, 'A006A001', NULL, NULL, 1, 'http://mydivisu.com/gateway/swagger-ui/index.html', 2, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350735701634236416', '', '指示面板', '', 'BasicLayout', 'home', '/workplace', 0, 'A005', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, 'el-icon-data-line', 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350736091574484992', '1350735701634236416', '工作台', '/workplace', '/dashboard/workplace', 'workplace', NULL, 1, 'A005A001', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350736329991307264', '1350735701634236416', '数据分析', '/analysis', '/dashboard/analysis', 'analysis', NULL, 1, 'A005A002', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1350736580051517440', '1350735701634236416', '大屏监控', '/monitor', '/dashboard/monitor', 'monitor', NULL, 1, 'A005A003', NULL, NULL, 0, '0', 1, 1, 0, 4, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351174223121924096', '', '流程管理', '/process', 'BasicLayout', 'process', '/process/design', 0, 'A003', NULL, NULL, 0, '0', 1, 1, 0, 5, 0, NULL, 'el-icon-_condition', 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-02 16:00:18', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351174665662939136', '1351174223121924096', '流程设计', '/process/design', '/process/design/ProcessModelList', 'design-model', NULL, 1, 'A003A001', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-03 15:37:53', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351174868428177408', '1351174223121924096', '表单管理', '/process/from', '/process/design', 'from', NULL, 1, 'A003A002', NULL, NULL, 0, '0', 1, 1, 0, 6, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-03 15:39:09', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351175088528474112', '1351174223121924096', '监听器管理', '/process/listem', '/process/design', 'listen', NULL, 1, 'A003A003', NULL, NULL, 0, '0', 1, 1, 0, 7, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-03 15:39:16', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351175283592970240', '1351174223121924096', '变量管理', '/process/variable', '/process/design', 'variable', NULL, 1, 'A003A004', NULL, NULL, 0, '0', 1, 1, 0, 5, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-03 15:39:05', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351175732081508352', '1350134241062076416', '区域管理', '/sys/area', '/system/common/AreaList', 'area', NULL, 1, 'A008A002', NULL, NULL, 0, '0', 1, 1, 0, 4, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-02-12 21:35:54', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351176139100962816', '1351180494554316800', '调度管理', '/scheduler', '/sdfsdf', 'scheduler', NULL, 1, 'A004A001', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351176363194236928', '1350134241062076416', '系统信息', '/sys/system-info', '/system/common/SystemList', 'system', NULL, 1, 'A008A003', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-02-12 21:43:20', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351176549551357952', '1350134241062076416', '分类字典', '/sys/category', '/system/common/CategoryList', 'category', NULL, 1, 'A008A004', NULL, NULL, 0, '0', 1, 1, 0, 3, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-02-12 21:35:05', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351177101848920064', '1350118557196271616', '职位管理', '/rbac/position', '/auth/rbac/PositionList', 'rbac-position', NULL, 1, 'A002A003', NULL, NULL, 0, '0', 1, 1, 0, 5, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '000fd73785565de9ceb24a265a1f5885', 'zxiaozhou', '2021-01-29 01:30:40', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351177257445015552', '1350118557196271616', '用户管理', '/rbac/user', '/auth/rbac/UserList', 'rbac-user', NULL, 1, 'A002A004', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '000fd73785565de9ceb24a265a1f5885', 'zxiaozhou', '2021-01-29 01:29:55', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351177380610752512', '1350118557196271616', '机构管理', '/rbac/org', '/auth/rbac/OrgList', 'rbac-org', NULL, 1, 'A002A005', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '000fd73785565de9ceb24a265a1f5885', 'zxiaozhou', '2021-01-29 01:30:58', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351180494554316800', '', '调度中心', '/scheduler', 'BasicLayout', 'scheduler', NULL, 0, 'A004', NULL, NULL, 0, '0', 1, 1, 0, 7, 0, NULL, 'el-icon-_api', 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-02-12 21:44:58', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351180820086833152', '1351180494554316800', '调度日志', '/schedule/log', '/schedulelog', 'schedulelog', NULL, 1, 'A004A002', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351181693852631040', '1350734475513348096', '代码生成', '/generation', 'sdfsdf', 'generation', NULL, 1, 'A006A002', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351182973329260544', '', '日志查询', 'logging', 'BasicLayout', 'logging', 'logging', 0, 'A001', NULL, NULL, 0, '0', 1, 1, 0, 9, 0, NULL, 'el-icon-_bug', 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-02-12 21:45:14', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351183099116437504', '1351182973329260544', '系统日志', 'syslog', 'sys/log', 'syslog', NULL, 1, 'A001A001', NULL, NULL, 0, '0', 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351183167689113600', '1351182973329260544', '操作日志', 'sdfsfd', 'sdf', 'sdfsdfsdf', NULL, 1, 'A001A002', NULL, NULL, 0, '0', 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351183324547694592', '', '消息中心', '/message', 'BasicLayout', 'message', NULL, 0, 'A007', NULL, NULL, 0, '0', 1, 1, 0, 8, 0, NULL, 'el-icon-chat-dot-square', 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351183426402172928', '1351183324547694592', '消息模板', '消息模板', '消息模板', '消息模板', NULL, 1, 'A007A001', NULL, NULL, 0, '0', 1, 1, 0, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351183508627308544', '1351183324547694592', '通知公告', 'sdfsfd', 'sdfsf', 'sdfsdfdf', NULL, 1, 'A007A002', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351183637396635648', '1351183324547694592', '消息记录', 'sdfsdf', 'sdfsdf', 'sdfsdf', NULL, 1, 'A007A003', NULL, NULL, 0, '0', 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351189432142184448', '1351174223121924096', '流程实例', '/process/instance', 'sdfsf', '/dsfsdf', NULL, 1, 'A003A005', NULL, NULL, 0, '0', 1, 1, 0, 2, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-03 15:38:03', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351189578213015552', '1351174223121924096', '历史任务', '/process/history-task', 'dfsf', 'sdfsdf', NULL, 1, 'A003A006', NULL, NULL, 0, '0', 1, 1, 0, 3, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-03 15:38:35', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1351189651261014016', '1351174223121924096', '历史流程', '/process/history', 'sdfsf', 'sdfsdf', NULL, 1, 'A003A007', NULL, NULL, 0, '0', 1, 1, 0, 4, 0, NULL, NULL, 0, 0, 1, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', '1355167397507022848', 'zxiaozhou', '2021-03-03 15:38:48', 0);
INSERT INTO `auth_rbac_permission` VALUES ('1368822849243496448', NULL, 'sdfsdfsdf', '', 'BasicLayout', 'sdfsdfsdf', NULL, 0, 'A010', NULL, NULL, 0, '0', 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1355167397507022848', 'zxiaozhou', '2021-03-08 15:16:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1368824348434546688', '1368822849243496448', 'qweqeqwe', '', 'sdfsdfsdf', 'qweqweqwe', NULL, 1, 'A010A001', NULL, NULL, 0, '0', 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1355167397507022848', 'zxiaozhou', '2021-03-08 15:22:11', NULL, NULL, NULL, 1);
INSERT INTO `auth_rbac_permission` VALUES ('1368824503799955456', '1368822849243496448', 'sdfsdfsdfsdf', '', 'sdfsdfsdf', 'sdfsdfsdfsdfdf', NULL, 1, 'A010A002', NULL, NULL, 0, '0', 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1355167397507022848', 'zxiaozhou', '2021-03-08 15:22:48', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_permission` VALUES ('1368824742258720768', '1368822849243496448', '1368822849243496448s', '', 'BasicLayout', '1368822849243496448', NULL, 0, 'A010A003', NULL, NULL, 0, '0', 1, 1, 0, 0, 0, NULL, NULL, 0, 0, 0, 1, 1, 0, 1, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1355167397507022848', 'zxiaozhou', '2021-03-08 15:23:45', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_permission_data_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_permission_data_rule`;
CREATE TABLE `auth_rbac_permission_data_rule` (
  `permission_data_rule_id` varchar(32) NOT NULL COMMENT '填值规则id',
  `correlation_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联业务id:角色id或按钮权限id',
  `rule_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则名称',
  `rule_column` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段',
  `rule_conditions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '条件',
  `rule_value` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则值',
  `rule_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '规则状态:0-无效，1-有效。默认0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  PRIMARY KEY (`permission_data_rule_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限数据填值规则表';

-- ----------------------------
-- Records of auth_rbac_permission_data_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_position
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_position`;
CREATE TABLE `auth_rbac_position` (
  `position_id` varchar(32) NOT NULL COMMENT '职位id',
  `position_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位编码',
  `position_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `auto_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '绑定方式:0-手动,1-自动。默认0',
  `position_rank` int DEFAULT NULL COMMENT '职级',
  `position_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '职位状态：0-无效，1-有效，默认0',
  `unique_help` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除该值为主键',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`position_id`),
  UNIQUE KEY `unique_position` (`position_code`,`unique_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_position_status` (`position_status`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='职位表';

-- ----------------------------
-- Records of auth_rbac_position
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_position` VALUES ('1368827527230439424', '水电费水电费', '水电费水电费', 0, 123123, 1, '1', NULL, NULL, NULL, NULL, NULL, '1355167397507022848', NULL, 'zxiaozhou', '2021-03-08 15:34:49', '1355167397507022848', 'zxiaozhou', '2021-03-08 17:33:33', 0);
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_role`;
CREATE TABLE `auth_rbac_role` (
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_sys_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色系统编码(系统自动创建)',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `parent_role_id` varchar(32) DEFAULT NULL COMMENT '上级角色id',
  `enable_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可删除:0-不可删除,1-可删除。默认1(用户系统内置数据不可删除)',
  `auto_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '绑定方式:0-手动,1-自动。默认0',
  `role_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '角色状态:0-禁用,1-启用,默认0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `unique_help` varchar(32) NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除该值为主键',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `Unique_role` (`role_code`,`unique_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_role_status` (`role_status`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Unique_role_sys_code` (`role_sys_code`,`unique_help`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

-- ----------------------------
-- Records of auth_rbac_role
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_role` VALUES ('1314235356968173568', '超级管理员', 'A001', 'SUPER_ROLE', NULL, 0, 0, 1, '系统最高管理员', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 05:10:13', NULL, NULL, NULL, 0);
INSERT INTO `auth_rbac_role` VALUES ('1369182995916308480', 'test', 'A002', 'teset', NULL, 1, 0, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, '1355167397507022848', 'zxiaozhou', '2021-03-09 15:07:19', '1355167397507022848', 'zxiaozhou', '2021-03-09 15:18:08', 0);
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_role_permission`;
CREATE TABLE `auth_rbac_role_permission` (
  `role_permission_id` varchar(32) NOT NULL COMMENT '权限角色id',
  `permission_id` varchar(32) NOT NULL COMMENT '权限id',
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  PRIMARY KEY (`role_permission_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色-权限表';

-- ----------------------------
-- Records of auth_rbac_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_role_permission` VALUES ('1369184996028891136', '1350736091574484992', '1369182995916308480', NULL, '1355167397507022848', 'zxiaozhou', '2021-03-09 15:15:16', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `auth_rbac_role_permission` VALUES ('1369184996087611392', '1350736329991307264', '1369182995916308480', NULL, '1355167397507022848', 'zxiaozhou', '2021-03-09 15:15:16', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for auth_rbac_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_rbac_user`;
CREATE TABLE `auth_rbac_user` (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nick_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户昵称',
  `real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码盐',
  `short_profile` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人简介',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别:0-默认未知,1-男,2-女,默认0',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮件',
  `is_initial_password` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否初始密码:0-不是,1-是,默认1',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话号码',
  `current_org_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '当前登录部门id',
  `org_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '负责部门',
  `user_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:0-未激活,1-正常,2-冻结,默认1',
  `work_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工号，唯一键',
  `telephone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '座机号',
  `login_fail_error_num` int NOT NULL DEFAULT '0' COMMENT '连续登录错误次数',
  `current_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `unique_help` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除该值为主键',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_user_name` (`user_name`,`unique_help`),
  UNIQUE KEY `unique_phone` (`phone`,`unique_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of auth_rbac_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_rbac_user` VALUES ('1355167397507022848', 'admin', 'admin', 'zxiaozhou', '$2a$10$jZseDrbZtTYAj3iBmmbkc.xrhw7eKSPENZ9A7A.TtUV4iOq2P2HUi', '372aec7db745c409099262388404ea9c', '一个有想法的农民。。。', '1367569980703948800', '1987-10-26 00:00:00', 0, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, 0, '2021-03-09 17:10:28', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 17:07:09', '1355167397507022848', 'zxiaozhou', '2021-03-09 17:10:28', 0);
INSERT INTO `auth_rbac_user` VALUES ('1368827727420375040', '奥术大师大所多', NULL, '奥术大师大所多', '$2a$10$hRdf6LSU/tMGIEqihs3IBe6/JDIamfeD0zu0Pz51k36CkxpfMb2TW', '8be24a7beb7f78be4c1df67a87706ff0', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1355167397507022848', 'zxiaozhou', '2021-03-08 15:35:36', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for logging_data
-- ----------------------------
DROP TABLE IF EXISTS `logging_data`;
CREATE TABLE `logging_data` (
  `data_log_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据日志id',
  `data_table` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `log_note` varchar(256) DEFAULT NULL COMMENT '日志注解',
  `data_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据id',
  `data_content` longtext COMMENT '数据内容',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求ip',
  `request_param` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '请求参数',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方法',
  `request_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求路径',
  `file_name` varchar(512) DEFAULT NULL COMMENT '调用文件名',
  `method_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '调用方法名',
  `method_params` longtext COMMENT '调用方法参数',
  `method_status` smallint NOT NULL COMMENT '调用方法状态:0-失败,1-成功',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人用户id',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人用户名称',
  `exception_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '异常名',
  `stack_trace` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '堆栈信息',
  `exception_message` longtext COMMENT '异常消息',
  `line_number` int DEFAULT NULL COMMENT '代码行数',
  `data_sources` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据来源',
  `cost_time` bigint DEFAULT NULL COMMENT '耗时',
  `request_start_time` datetime DEFAULT NULL COMMENT '请求开始时间',
  `request_end_time` datetime DEFAULT NULL COMMENT '请求结束时间',
  `data_version` int DEFAULT NULL COMMENT '版本号',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`data_log_id`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_data_table` (`data_table`),
  KEY `Index_log_note` (`log_note`),
  KEY `Index_ip` (`ip`),
  KEY `Index_request_url` (`request_url`),
  KEY `Index_data_sources` (`data_sources`),
  KEY `Index_data_id` (`data_id`),
  KEY `Index_request_start_time` (`request_start_time`),
  KEY `Index_request_end_time` (`request_end_time`),
  KEY `Index_data_version` (`data_version`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据日志';

-- ----------------------------
-- Records of logging_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for logging_operate
-- ----------------------------
DROP TABLE IF EXISTS `logging_operate`;
CREATE TABLE `logging_operate` (
  `sys_log_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统日志id',
  `log_note` varchar(256) DEFAULT NULL COMMENT '日志注解',
  `business_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '业务编码',
  `operate_type` int DEFAULT NULL COMMENT ' 操作类型（1查询，2添加，3修改，4删除，5其他）',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人用户id',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人用户名称',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求ip',
  `request_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求路径',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方法',
  `request_param` longtext COMMENT '请求参数',
  `request_result` longtext COMMENT '请求结果',
  `request_status` int DEFAULT NULL COMMENT '请求状态',
  `file_name` varchar(512) DEFAULT NULL COMMENT '调用文件名',
  `method_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '调用方法名',
  `method_params` longtext COMMENT '调用方法参数',
  `exception_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '异常名',
  `stack_trace` longtext COMMENT '堆栈信息',
  `exception_message` longtext COMMENT '异常消息',
  `line_number` int DEFAULT NULL COMMENT '代码行数',
  `data_sources` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据来源',
  `cost_time` bigint DEFAULT NULL COMMENT '耗时',
  `request_start_time` datetime DEFAULT NULL COMMENT '请求开始时间',
  `request_end_time` datetime DEFAULT NULL COMMENT '请求结束时间',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`sys_log_id`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_ip` (`ip`),
  KEY `Index_log_note` (`log_note`),
  KEY `Index_request_method` (`request_method`),
  KEY `Index_operate_type` (`operate_type`),
  KEY `Index_request_url` (`request_url`),
  KEY `Index_request_status` (`request_status`),
  KEY `Index_data_sources` (`data_sources`),
  KEY `Index_business_code` (`business_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志';

-- ----------------------------
-- Records of logging_operate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for msg_manage_announcement
-- ----------------------------
DROP TABLE IF EXISTS `msg_manage_announcement`;
CREATE TABLE `msg_manage_announcement` (
  `annt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `msg_abstract` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摘要',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `sender_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布人姓名',
  `sender_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布人',
  `receive_type` smallint DEFAULT NULL COMMENT '接收对象类型：1-指定用户,2-指定区域,3-指定组织,4-指定角色,5-所有',
  `receive_infos` json DEFAULT NULL COMMENT '接收对象',
  `send_type` smallint DEFAULT NULL COMMENT '发布方式：0-手动,1-自动',
  `finaly_send_time` datetime DEFAULT NULL COMMENT '最终发布时间',
  `send_time` datetime DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '撤销时间',
  `send_status` smallint NOT NULL DEFAULT '0' COMMENT '发布状态：0未发布，1已发布，2已撤销，默认0',
  `page_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面url',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`annt_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_send_type` (`send_type`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统通告管理';

-- ----------------------------
-- Records of msg_manage_announcement
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for msg_manage_send_record
-- ----------------------------
DROP TABLE IF EXISTS `msg_manage_send_record`;
CREATE TABLE `msg_manage_send_record` (
  `es_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息id',
  `es_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '消息标题',
  `es_type` smallint DEFAULT NULL COMMENT '推送方式：1短信 2邮件 3微信',
  `es_receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接收人',
  `es_param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推送所需参数Json格式',
  `es_content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '推送内容',
  `es_send_time` datetime DEFAULT NULL COMMENT '推送时间',
  `es_send_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推送状态 0未推送 1推送成功 2推送失败',
  `es_send_num` int DEFAULT NULL COMMENT '发送次数 超过5次不再发送',
  `es_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推送失败原因',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`es_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`),
  KEY `Index_create_system_code` (`create_system_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消息发送记录表';

-- ----------------------------
-- Records of msg_manage_send_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for msg_manage_template
-- ----------------------------
DROP TABLE IF EXISTS `msg_manage_template`;
CREATE TABLE `msg_manage_template` (
  `template_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板id',
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板名称',
  `template_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板code',
  `template_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板类型',
  `template_content` json DEFAULT NULL COMMENT '模板内容',
  `template_test_json` json DEFAULT NULL COMMENT '模板测试json',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`template_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消息模板';

-- ----------------------------
-- Records of msg_manage_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for msg_message_user_record
-- ----------------------------
DROP TABLE IF EXISTS `msg_message_user_record`;
CREATE TABLE `msg_message_user_record` (
  `msg_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息记录id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `msg_abstract` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摘要',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `busi_state` smallint DEFAULT NULL COMMENT '三方业务状态',
  `busi_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '三方业务id',
  `icon_type` smallint DEFAULT NULL COMMENT '图标类型：0-系统自带,1-自定义',
  `icon` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `sender_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人姓名',
  `sender_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `other_info` json DEFAULT NULL COMMENT '三方业务其他信息',
  `send_time` datetime DEFAULT NULL COMMENT '发布时间',
  `read_status` smallint NOT NULL DEFAULT '0' COMMENT '阅读状态:0-未阅读,1-阅读。默认0',
  `user_id` varchar(32) NOT NULL COMMENT '消息用户id',
  `msg_type` smallint DEFAULT NULL COMMENT '消息类型:0-系统公告,1-代办事项',
  `page_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '页面url',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`msg_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_read_status` (`read_status`),
  KEY `Index_user_id` (`user_id`),
  KEY `Index_msg_type` (`msg_type`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户消息记录';

-- ----------------------------
-- Records of msg_message_user_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_custom_config
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_custom_config`;
CREATE TABLE `qrtz_custom_config` (
  `job_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务类名',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `quartz_status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '状态: 0正常 -1停止,默认-1',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`job_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务管理';

-- ----------------------------
-- Records of qrtz_custom_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for storage_local_file
-- ----------------------------
DROP TABLE IF EXISTS `storage_local_file`;
CREATE TABLE `storage_local_file` (
  `local_file_id` varchar(32) NOT NULL COMMENT '文件id',
  `file_original_name` varchar(256) DEFAULT NULL COMMENT '原始文件名(不包括扩展名)',
  `file_original_full_name` varchar(256) DEFAULT NULL COMMENT '原始文件名全称(包括扩展名)',
  `file_full_name` varchar(256) DEFAULT NULL COMMENT '文件名全名称(包括扩展名)',
  `file_type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  `file_size` varchar(256) NOT NULL COMMENT '文件大小',
  `file_size_detail` bigint NOT NULL DEFAULT '0' COMMENT '文件详细大小',
  `file_md5` varchar(256) DEFAULT NULL COMMENT '文件md5值',
  `file_disk_relative_path` varchar(512) NOT NULL COMMENT '文件磁盘相对路径(即系统定义文件文件存放磁盘开始路径除外)',
  `file_mapping_path` varchar(512) NOT NULL COMMENT '文件预览相对路径(即加了file的映射路径)',
  `file_dir_prefix` varchar(128) DEFAULT NULL COMMENT '文件存放文件夹名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`local_file_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_file_type` (`file_type`),
  KEY `Index_file_original_full_name` (`file_original_full_name`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='本地文件服务';

-- ----------------------------
-- Records of storage_local_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for storage_oss_file
-- ----------------------------
DROP TABLE IF EXISTS `storage_oss_file`;
CREATE TABLE `storage_oss_file` (
  `oss_file_id` varchar(32) NOT NULL COMMENT '文件id',
  `file_original_name` varchar(256) DEFAULT NULL COMMENT '原始文件名(不包括扩展名)',
  `file_full_name` varchar(256) DEFAULT NULL COMMENT '文件名全名称(包括扩展名)',
  `file_original_full_name` varchar(256) DEFAULT NULL COMMENT '原始文件名全称(包括扩展名)',
  `file_type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  `file_size` varchar(256) NOT NULL COMMENT '文件大小',
  `file_size_detail` bigint NOT NULL DEFAULT '0' COMMENT '文件详细大小',
  `oss_tag` varchar(128) DEFAULT NULL COMMENT 'oss tag信息',
  `file_dir_prefix` varchar(256) DEFAULT NULL COMMENT '文件存放文件夹名称',
  `file_md5` varchar(256) NOT NULL DEFAULT '0' COMMENT '文件md5值',
  `endpoint` varchar(128) NOT NULL DEFAULT '0' COMMENT 'endpoint',
  `bucket` varchar(512) NOT NULL DEFAULT '0' COMMENT 'bucket名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`oss_file_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_file_type` (`file_type`),
  KEY `Index_file_original_full_name` (`file_original_full_name`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='oss文件';

-- ----------------------------
-- Records of storage_oss_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_common_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_area`;
CREATE TABLE `sys_common_area` (
  `area_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '本区域id',
  `province_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属省级id',
  `simple_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '中文简称',
  `area_level` int DEFAULT NULL COMMENT '区域级别:1为省级，2为市级，3为县级',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区域名称',
  `area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区号',
  `city_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属城市id',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上级区域id',
  `lon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '本区域经度',
  `lat` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '本区域纬度',
  `zip_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮编',
  `whole_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '完整名称',
  `pre_pin_yin` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区域名称拼音的第一个字母',
  `pin_yin` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称全拼',
  `simple_py` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '首字母简拼',
  `county_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区县id',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `auto_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '绑定方式:0-手动,1-自动。默认0',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识:0-未删除,1-删除。默认0',
  PRIMARY KEY (`area_id`) USING BTREE,
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`),
  KEY `Index_parent_id` (`parent_id`),
  KEY `Index_area_name` (`area_name`),
  KEY `Index_area_level` (`area_level`),
  KEY `Index_province_id` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_common_area
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_common_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_category`;
CREATE TABLE `sys_common_category` (
  `category_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级id',
  `category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `category_common_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类统一编码',
  `category_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类编码',
  `is_parent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否父节:0-不是，1-时，默认0',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `unique_category_code` (`category_code`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_category_common_code` (`category_common_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类字典表';

-- ----------------------------
-- Records of sys_common_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_common_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_dict`;
CREATE TABLE `sys_common_dict` (
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典id',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `dict_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `dict_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '字典状态：1启用，0禁用，默认0',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '字典类型：0-字符串,1-数字。默认0',
  `unique_help` varchar(32) NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除改值未主键',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `unique_dict` (`dict_code`,`unique_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_common_dict
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_common_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_dict_item`;
CREATE TABLE `sys_common_dict_item` (
  `item_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项id',
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典项名称',
  `item_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典项值',
  `dict_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典编码',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序,越小越靠前,默认0',
  `item_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '字典项状态：1启用，0禁用，默认0',
  `unique_help` varchar(32) NOT NULL DEFAULT '1' COMMENT '唯一索引帮助字段,默认1，如果删除改值未主键',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `unique_dict_item` (`dict_id`,`item_value`,`unique_help`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_dict_code` (`dict_code`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据字典配置项表';

-- ----------------------------
-- Records of sys_common_dict_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_common_system
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_system`;
CREATE TABLE `sys_common_system` (
  `system_id` varchar(32) NOT NULL COMMENT '系统id',
  `system_name` varchar(64) NOT NULL COMMENT '系统名称',
  `system_code` varchar(64) NOT NULL COMMENT '系统编码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`system_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统表';

-- ----------------------------
-- Records of sys_common_system
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_manage_source
-- ----------------------------
DROP TABLE IF EXISTS `sys_manage_source`;
CREATE TABLE `sys_manage_source` (
  `data_source_id` varchar(36) NOT NULL COMMENT '数据源id',
  `db_code` varchar(100) DEFAULT NULL COMMENT '数据源编码',
  `db_source_name` varchar(100) DEFAULT NULL COMMENT '数据源名称',
  `db_type` varchar(10) DEFAULT NULL COMMENT '数据库类型',
  `db_driver` varchar(100) DEFAULT NULL COMMENT '驱动类',
  `db_url` varchar(500) DEFAULT NULL COMMENT '数据源地址',
  `db_name` varchar(100) DEFAULT NULL COMMENT '数据库名称',
  `db_username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `db_password` varchar(100) DEFAULT NULL COMMENT '密码',
  `create_area_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建区域编码',
  `create_position_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建职位编码',
  `create_org_sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建机构系统编码',
  `create_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建系统编码',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户姓名',
  `create_tenant_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建租户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户id',
  `update_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新用户姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态:0-正常,1-已删除,默认0',
  PRIMARY KEY (`data_source_id`),
  KEY `Index_del_flag` (`del_flag`),
  KEY `Index_create_time` (`create_time`),
  KEY `Index_create_user_id` (`create_user_id`),
  KEY `Index_create_area_code` (`create_area_code`),
  KEY `Index_create_position_code` (`create_position_code`),
  KEY `Index_create_org_sys_code` (`create_org_sys_code`),
  KEY `Index_create_system_code` (`create_system_code`),
  KEY `Index_create_tenant_id` (`create_tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据源表';

-- ----------------------------
-- Records of sys_manage_source
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
