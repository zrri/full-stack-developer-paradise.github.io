-- 添加和删除字断操作
CREATE TABLE IF NOT EXISTS user1(
    id INT UNSIGNED AUTO_INCREMENT KEY
);
-- 添加用户名字断 username varchar(20)
ALTER TABLE user1
ADD username VARCHAR(20);

-- 添加password not null CHAR(32);
ALTER TABLE user1
ADD password CHAR(32) NOT NULL;
-- 添加固定位置email
ALTER TABLE user1
ADD email CHAR(32) NOT NULL UNIQUE AFTER username;
-- test TINYINT(1) NOT NULL
ALTER TABLE user1
ADD test TINYINT NOT NULL DEFAULT 0 FIRST;

-- 删除TEST
ALTER TABLE user1
DROP test;



-- 添加age,addr,删除email
ALTER TABLE user1
ADD age TINYINT UNSIGNED NOT NULL DEFAULT 18,
ADD addr VARCHAR(32) NOT NULL DEFAULT '北京',
DROP email;


-- 测试添加和删除默认值的操作
CREATE TABLE user2(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL,
    age TINYINT UNSIGNED NOT NULL DEFAULT 18,
    email VARCHAR(50) NOT NULL
);

ALTER TABLE user2
ALTER email SET DEFAULT 'imooc@qq.com';

ALTER TABLE user2
ALTER age DROP DEFAULT;

CREATE TABLE user4(
    id INT UNSIGNED,
    username VARCHAR(20) NOT NULL
);
-- 添加主键
ALTER TABLE user4
ADD PRIMARY KEY(id);
-- 删除主键
ALTER TABLE user4
DROP PRIMARY KEY;


CREATE TABLE user5(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL
);

-- 去掉AUTO_INCRE
ALTER TABLE user5
MODIFY id INT UNSIGNED;

ALTER TABLE user1
MODIFY emial emial VARCHAR(20);

CREATE TABLE user6(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL,
    password CHAR(32) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

-- 删除唯一索引
ALTER TABLE user6
DROP INDEX email;

-- 添加唯一索引
ALTER TABLE user6
ADD UNIQUE KEY(username);

ALTER TABLE user6
ADD UNIQUE INDEX uni_email(email);

-- user6 ---user 66
ALTER TABLE user6
RENAME TO user666;

ALTER TABLE user666
RENAME AS user6;


-- 测试MyISAM
CREATE TABLE test_myisam(
    a INT UNSIGNED,
    b VARCHAR(26),
    c CHAR(32)
)ENGINE=MyISAM;

CREATE TABLE test_myisam1(
    a char(30),
    id int
)ENGINE=MyISAM;

CREATE TABLE test_myisam2(
    a varchar(30),
    id int
)ENGINE=MyISAM;

CREATE TABLE test_myisam3(
    a varchar(30),
    id int
)ENGINE=MyISAM ROW_FORMAT=FIXED;

--
CREATE TABLE test_innodb(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL
);

SELECT addr,
GROUP_CONCAT(username) AS userDetail,
COUNT(*) AS totalUsers
FROM user1
GROUP BY addr;



SELECT sdept FROM student
GROUP BY sdept;

INSERT INTO user1 (username,age,sex,addr,married,salary,userDesc) values
('李武帝',28,'男','北京',1,30000,'为版本'),
('mapbar_front',28,'男','天津',1,20000,'大概是'),
('lily',28,'女','上海',1,40000,'围观'),
('rose',28,'女','北京',1,50000,'比较看好过'),
('fengmeng',28,'女','深圳',1,890000,'喊口号'),
('locy',28,'男','北京',1,35000,'是回家可好');

SELECT addr,
GROUP_CONCAT(username) AS usersDetail,
COUNT(*) AS totalUsers,
SUM(age) AS sum_age,
MAX
