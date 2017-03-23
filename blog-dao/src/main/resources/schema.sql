DROP DATABASE IF EXISTS blog;

CREATE DATABASE blog
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_general_ci;

USE blog;

-- ----------------------------
--  Table structure for attachment
-- ----------------------------
DROP TABLE
IF EXISTS attachment;

CREATE TABLE attachment
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  source_id    BIGINT(20)                            NOT NULL
  COMMENT '来源ID',
  type         VARCHAR(3)                            NOT NULL
  COMMENT '类型:{"001":文章, "002":评论}',
  name         VARCHAR(256)                          NOT NULL
  COMMENT '附件原名',
  path         VARCHAR(256)                          NOT NULL
  COMMENT '附件路径',
  is_deleted   TINYINT                               NOT NULL                DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '附件表';
CREATE UNIQUE INDEX id_UNIQUE
  ON attachment (id);
CREATE INDEX create_ix
  ON attachment (created_time);

-- ----------------------------
--  Table structure for article
-- ----------------------------
DROP TABLE
IF EXISTS article;

CREATE TABLE article
(
  id            BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  title         VARCHAR(64)                           NOT NULL
  COMMENT '文章标题',
  category_code VARCHAR(32)                           NOT NULL
  COMMENT '栏目代码',
  category_name VARCHAR(32)                           NOT NULL
  COMMENT '栏目名称',
  tags          VARCHAR(512)                          NOT NULL
  COMMENT '标签',
  comment_count INTEGER                               NOT NULL                    DEFAULT 0
  COMMENT '评论数量',
  glance_count  INTEGER                               NOT NULL                    DEFAULT 0
  COMMENT '浏览数量',
  content       LONGTEXT                              NOT NULL
  COMMENT '文章内容',
  is_deleted    TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time  TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time  TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '文章表';
CREATE UNIQUE INDEX id_UNIQUE
  ON article (id);
CREATE INDEX category_code_ix
  ON article (category_code);
CREATE INDEX create_ix
  ON article (created_time);

-- ----------------------------
--  Table structure for category
-- ----------------------------
DROP TABLE
IF EXISTS category;

CREATE TABLE category
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  code         VARCHAR(32)                           NOT NULL
  COMMENT '代码',
  name         VARCHAR(32)                           NOT NULL
  COMMENT '名称',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '栏目表';
CREATE UNIQUE INDEX id_UNIQUE
  ON category (id);
CREATE INDEX create_ix
  ON category (created_time);

-- ----------------------------
--  Table structure for comment
-- ----------------------------
DROP TABLE
IF EXISTS comment;

CREATE TABLE comment
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  article_id   BIGINT(20)                            NOT NULL
  COMMENT '评论的文章',
  content      LONGTEXT                              NOT NULL
  COMMENT '评论内容',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '评论表';
CREATE UNIQUE INDEX id_UNIQUE
  ON comment (id);
CREATE INDEX article_id_ix
  ON comment (article_id);
CREATE INDEX create_ix
  ON comment (created_time);

-- ----------------------------
--  Table structure for glance
-- ----------------------------
DROP TABLE
IF EXISTS glance;

CREATE TABLE glance
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  article_id   BIGINT(20)                            NOT NULL
  COMMENT '浏览的文章',
  ip           VARCHAR(32)                           NOT NULL
  COMMENT '浏览者IP',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '评论表';
CREATE UNIQUE INDEX id_UNIQUE
  ON glance (id);
CREATE INDEX article_id_ix
  ON glance (article_id);
CREATE INDEX create_ix
  ON glance (created_time);

INSERT INTO category (code, name)
VALUES
  ('web', 'web前端'),
  ('java', 'java后台'),
  ('frame', '架构设计'),
  ('db', '数据库'),
  ('linux', '系统运维'),
  ('mobile', '移动开发'),
  ('program', '编程语言'),
  ('it', '互联网'),
  ('other', '综合');