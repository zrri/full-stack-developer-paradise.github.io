-- 用户表imooc_user
CREATE TABLE IF NOT EXISTS `imooc_user`(
`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '用户编号',
`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
`password` CHAR(32) NOT NULL COMMENT '密码',
`email` VARCHAR(20) NOT NULL UNIQUE COMMENT '邮箱',
`age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
`sex` ENUM('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
`tel` CHAR(11) NOT NULL UNIQUE COMMENT '电话',
`addr` VARCHAR(50) NOT NULL DEFAULT '北京' COMMENT '地址',
`card` CHAR(18) NOT NULL UNIQUE COMMENT '身份证号',
`married` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '结婚和为未结婚',
`salary` FLOAT(8,2) NOT NULL DEFAULT 0 COMMENT '薪水'
)ENGINE=INNODB DEFAULT CHARSET=UTF8;
