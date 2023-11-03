CREATE DATABASE checklist_db;

SET NAMES utf8mb4;

USE checklist_db;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` INT NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `version` INT DEFAULT 1 COMMENT '乐观锁',
  `is_deleted` INT DEFAULT 0 COMMENT '是否被删除 1 删除  0 未删除',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;



INSERT INTO `user` ( `version`, `is_deleted`) VALUES
(  1, 0),
(  1, 0),
(  1, 0),
(  1, 0);



DROP TABLE IF EXISTS `ck_list`;
CREATE TABLE `ck_list` (
    `cid` INT NOT NULL AUTO_INCREMENT COMMENT 'checklist_id',
    `uid` INT NOT NULL DEFAULT 1 COMMENT '清单作者',
    `header` VARCHAR(255) NOT NULL COMMENT '标题',
    `checklist` json DEFAULT NULL,
    `version` INT DEFAULT 1 COMMENT '乐观锁',
    `is_deleted` INT DEFAULT 0 COMMENT '是否被删除 1 删除  0 未删除',
    PRIMARY KEY (`cid`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;


DROP TABLE IF EXISTS `ck_list_collection`;
CREATE TABLE `ck_list_collection` (
    `colid` INT NOT NULL AUTO_INCREMENT COMMENT 'CheckListCollection_id',
    `cid` INT NOT NULL DEFAULT 1  COMMENT 'checklist_id',
    `uid` INT NOT NULL DEFAULT 1 COMMENT '清单集合作者',
    `view_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `is_team` INT NOT NULL DEFAULT 0 COMMENT '是否为团队清单',
    `version` INT DEFAULT 1 COMMENT '乐观锁',
    `is_deleted` INT DEFAULT 0 COMMENT '是否被删除 1 删除  0 未删除',
    PRIMARY KEY (`colid`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;