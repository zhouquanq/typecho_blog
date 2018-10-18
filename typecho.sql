/*
Navicat MySQL Data Transfer

Source Server         : wamp3
Source Server Version : 50709
Source Host           : 127.0.0.1:3306
Source Database       : typecho

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2018-10-18 15:35:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `typecho_comments`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_comments`;
CREATE TABLE `typecho_comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT '0',
  `ownerId` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `text` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `typecho_contents`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_contents`;
CREATE TABLE `typecho_contents` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `text` longtext,
  `order` int(10) unsigned DEFAULT '0',
  `authorId` int(10) unsigned DEFAULT '0',
  `template` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `password` varchar(32) DEFAULT NULL,
  `commentsNum` int(10) unsigned DEFAULT '0',
  `allowComment` char(1) DEFAULT '0',
  `allowPing` char(1) DEFAULT '0',
  `allowFeed` char(1) DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_contents
-- ----------------------------
INSERT INTO `typecho_contents` VALUES ('1', '留言板', 'guestbook', '1539845996', '1539845996', '<!--markdown-->留下你的脚步~', '0', '2', 'guestbook.php', 'page', 'publish', null, '0', '1', '0', '0', '0');
INSERT INTO `typecho_contents` VALUES ('2', '关于我', 'aboutme', '1539846000', '1539846092', '<!--markdown-->我就是我~\r\n是不一样的烟火~', '0', '2', 'about.php', 'page', 'publish', null, '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `typecho_fields`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_fields`;
CREATE TABLE `typecho_fields` (
  `cid` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `str_value` text,
  `int_value` int(10) DEFAULT '0',
  `float_value` float DEFAULT '0',
  PRIMARY KEY (`cid`,`name`),
  KEY `int_value` (`int_value`),
  KEY `float_value` (`float_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_fields
-- ----------------------------
INSERT INTO `typecho_fields` VALUES ('5', 'viewsNum', 'str', '1', '0', '0');

-- ----------------------------
-- Table structure for `typecho_metas`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_metas`;
CREATE TABLE `typecho_metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `count` int(10) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_metas
-- ----------------------------
INSERT INTO `typecho_metas` VALUES ('1', '学无止境', 'Study', 'category', '记录学习的过程，优秀的文章转载', '0', '1', '0');
INSERT INTO `typecho_metas` VALUES ('2', '心情日记', 'diary', 'category', '记录心情、日记', '0', '2', '0');

-- ----------------------------
-- Table structure for `typecho_options`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_options`;
CREATE TABLE `typecho_options` (
  `name` varchar(32) NOT NULL,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`name`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_options
-- ----------------------------
INSERT INTO `typecho_options` VALUES ('theme', '0', 'default');
INSERT INTO `typecho_options` VALUES ('plugin:CateFilter', '0', 'a:1:{s:6:\"CateId\";s:1:\"2\";}');
INSERT INTO `typecho_options` VALUES ('timezone', '0', '28800');
INSERT INTO `typecho_options` VALUES ('lang', '0', null);
INSERT INTO `typecho_options` VALUES ('charset', '0', 'UTF-8');
INSERT INTO `typecho_options` VALUES ('contentType', '0', 'text/html');
INSERT INTO `typecho_options` VALUES ('gzip', '0', '0');
INSERT INTO `typecho_options` VALUES ('generator', '0', 'Typecho 1.1/17.10.30');
INSERT INTO `typecho_options` VALUES ('title', '0', 'Spring');
INSERT INTO `typecho_options` VALUES ('description', '0', 'hi blog');
INSERT INTO `typecho_options` VALUES ('keywords', '0', 'typecho,php,blog');
INSERT INTO `typecho_options` VALUES ('rewrite', '0', '0');
INSERT INTO `typecho_options` VALUES ('frontPage', '0', 'recent');
INSERT INTO `typecho_options` VALUES ('frontArchive', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsRequireMail', '0', '1');
INSERT INTO `typecho_options` VALUES ('commentsWhitelist', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsRequireURL', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsRequireModeration', '0', '0');
INSERT INTO `typecho_options` VALUES ('plugins', '0', 'a:2:{s:9:\"activated\";a:2:{s:9:\"CodeStyle\";a:1:{s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:16:\"CodeStyle_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:16:\"CodeStyle_Plugin\";i:1;s:6:\"footer\";}}}}s:10:\"CateFilter\";a:1:{s:7:\"handles\";a:1:{s:26:\"Widget_Archive:indexHandle\";a:1:{i:0;a:2:{i:0;s:17:\"CateFilter_Plugin\";i:1;s:6:\"filter\";}}}}}s:7:\"handles\";a:3:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:16:\"CodeStyle_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:16:\"CodeStyle_Plugin\";i:1;s:6:\"footer\";}}s:26:\"Widget_Archive:indexHandle\";a:1:{i:0;a:2:{i:0;s:17:\"CateFilter_Plugin\";i:1;s:6:\"filter\";}}}}');
INSERT INTO `typecho_options` VALUES ('commentDateFormat', '0', 'Y-m-d h:i a');
INSERT INTO `typecho_options` VALUES ('siteUrl', '0', 'http://build.dev');
INSERT INTO `typecho_options` VALUES ('defaultCategory', '0', '5');
INSERT INTO `typecho_options` VALUES ('allowRegister', '0', '1');
INSERT INTO `typecho_options` VALUES ('defaultAllowComment', '0', '1');
INSERT INTO `typecho_options` VALUES ('defaultAllowPing', '0', '1');
INSERT INTO `typecho_options` VALUES ('defaultAllowFeed', '0', '1');
INSERT INTO `typecho_options` VALUES ('pageSize', '0', '10');
INSERT INTO `typecho_options` VALUES ('postsListSize', '0', '6');
INSERT INTO `typecho_options` VALUES ('commentsListSize', '0', '6');
INSERT INTO `typecho_options` VALUES ('commentsHTMLTagAllowed', '0', null);
INSERT INTO `typecho_options` VALUES ('postDateFormat', '0', 'Y-m-d');
INSERT INTO `typecho_options` VALUES ('feedFullText', '0', '0');
INSERT INTO `typecho_options` VALUES ('editorSize', '0', '350');
INSERT INTO `typecho_options` VALUES ('autoSave', '0', '0');
INSERT INTO `typecho_options` VALUES ('markdown', '0', '1');
INSERT INTO `typecho_options` VALUES ('xmlrpcMarkdown', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsMaxNestingLevels', '0', '5');
INSERT INTO `typecho_options` VALUES ('commentsPostTimeout', '0', '2592000');
INSERT INTO `typecho_options` VALUES ('commentsUrlNofollow', '0', '1');
INSERT INTO `typecho_options` VALUES ('commentsShowUrl', '0', '1');
INSERT INTO `typecho_options` VALUES ('commentsMarkdown', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsPageBreak', '0', '1');
INSERT INTO `typecho_options` VALUES ('commentsThreaded', '0', '1');
INSERT INTO `typecho_options` VALUES ('commentsPageSize', '0', '5');
INSERT INTO `typecho_options` VALUES ('commentsPageDisplay', '0', 'last');
INSERT INTO `typecho_options` VALUES ('commentsOrder', '0', 'DESC');
INSERT INTO `typecho_options` VALUES ('commentsCheckReferer', '0', '1');
INSERT INTO `typecho_options` VALUES ('commentsAutoClose', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsPostIntervalEnable', '0', '1');
INSERT INTO `typecho_options` VALUES ('commentsPostInterval', '0', '60');
INSERT INTO `typecho_options` VALUES ('commentsShowCommentOnly', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsAvatar', '0', '0');
INSERT INTO `typecho_options` VALUES ('commentsAvatarRating', '0', 'G');
INSERT INTO `typecho_options` VALUES ('commentsAntiSpam', '0', '1');
INSERT INTO `typecho_options` VALUES ('routingTable', '0', 'a:26:{i:0;a:25:{s:5:\"index\";a:6:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:8:\"|^[/]?$|\";s:6:\"format\";s:1:\"/\";s:6:\"params\";a:0:{}}s:7:\"archive\";a:6:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:13:\"|^/blog[/]?$|\";s:6:\"format\";s:6:\"/blog/\";s:6:\"params\";a:0:{}}s:2:\"do\";a:6:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:32:\"|^/action/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:10:\"/action/%s\";s:6:\"params\";a:1:{i:0;s:6:\"action\";}}s:4:\"post\";a:6:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:26:\"|^/archives/([0-9]+)[/]?$|\";s:6:\"format\";s:13:\"/archives/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:10:\"attachment\";a:6:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:28:\"|^/attachment/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/attachment/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:8:\"category\";a:6:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:25:\"|^/category/([^/]+)[/]?$|\";s:6:\"format\";s:13:\"/category/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:3:\"tag\";a:6:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:20:\"|^/tag/([^/]+)[/]?$|\";s:6:\"format\";s:8:\"/tag/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:6:\"author\";a:6:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:24:\"|^/author/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/author/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"uid\";}}s:6:\"search\";a:6:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:23:\"|^/search/([^/]+)[/]?$|\";s:6:\"format\";s:11:\"/search/%s/\";s:6:\"params\";a:1:{i:0;s:8:\"keywords\";}}s:10:\"index_page\";a:6:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/page/([0-9]+)[/]?$|\";s:6:\"format\";s:9:\"/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:12:\"archive_page\";a:6:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:27:\"|^/blog/page/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/blog/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:13:\"category_page\";a:6:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:34:\"|^/category/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:16:\"/category/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:8:\"tag_page\";a:6:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:29:\"|^/tag/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/tag/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:11:\"author_page\";a:6:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/author/([0-9]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/author/%s/%s/\";s:6:\"params\";a:2:{i:0;s:3:\"uid\";i:1;s:4:\"page\";}}s:11:\"search_page\";a:6:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:32:\"|^/search/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/search/%s/%s/\";s:6:\"params\";a:2:{i:0;s:8:\"keywords\";i:1;s:4:\"page\";}}s:12:\"archive_year\";a:6:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:19:\"|^/([0-9]{4})[/]?$|\";s:6:\"format\";s:4:\"/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"year\";}}s:13:\"archive_month\";a:6:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:30:\"|^/([0-9]{4})/([0-9]{2})[/]?$|\";s:6:\"format\";s:7:\"/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:5:\"month\";}}s:11:\"archive_day\";a:6:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:41:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})[/]?$|\";s:6:\"format\";s:10:\"/%s/%s/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";}}s:17:\"archive_year_page\";a:6:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/([0-9]{4})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:12:\"/%s/page/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:4:\"page\";}}s:18:\"archive_month_page\";a:6:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:44:\"|^/([0-9]{4})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/%s/%s/page/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:4:\"page\";}}s:16:\"archive_day_page\";a:6:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:55:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"/%s/%s/%s/page/%s/\";s:6:\"params\";a:4:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";i:3;s:4:\"page\";}}s:12:\"comment_page\";a:6:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:36:\"|^(.+)/comment\\-page\\-([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"%s/comment-page-%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:11:\"commentPage\";}}s:4:\"feed\";a:6:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";s:4:\"regx\";s:17:\"|^/feed(.*)[/]?$|\";s:6:\"format\";s:7:\"/feed%s\";s:6:\"params\";a:1:{i:0;s:4:\"feed\";}}s:8:\"feedback\";a:6:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:29:\"|^(.+)/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:5:\"%s/%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:4:\"type\";}}s:4:\"page\";a:6:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/([^/]+)\\.html[/]?$|\";s:6:\"format\";s:8:\"/%s.html\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}}s:5:\"index\";a:3:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:7:\"archive\";a:3:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:2:\"do\";a:3:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";}s:4:\"post\";a:3:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"attachment\";a:3:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"category\";a:3:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:3:\"tag\";a:3:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"author\";a:3:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"search\";a:3:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"index_page\";a:3:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_page\";a:3:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"category_page\";a:3:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"tag_page\";a:3:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"author_page\";a:3:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"search_page\";a:3:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_year\";a:3:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"archive_month\";a:3:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"archive_day\";a:3:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:17:\"archive_year_page\";a:3:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:18:\"archive_month_page\";a:3:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:16:\"archive_day_page\";a:3:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"comment_page\";a:3:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:4:\"feed\";a:3:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";}s:8:\"feedback\";a:3:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";}s:4:\"page\";a:3:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}}');
INSERT INTO `typecho_options` VALUES ('actionTable', '0', 'a:0:{}');
INSERT INTO `typecho_options` VALUES ('panelTable', '0', 'a:0:{}');
INSERT INTO `typecho_options` VALUES ('attachmentTypes', '0', '@image@');
INSERT INTO `typecho_options` VALUES ('secret', '0', 'W&v*AvI%pG!5nbl&2gRq@t$&cTu(n4GV');
INSERT INTO `typecho_options` VALUES ('installed', '0', '1');
INSERT INTO `typecho_options` VALUES ('allowXmlRpc', '0', '2');
INSERT INTO `typecho_options` VALUES ('plugin:CodeStyle', '0', 'a:2:{s:10:\"code_style\";s:19:\"monokai-sublime.css\";s:6:\"showln\";a:1:{i:0;s:6:\"showln\";}}');
INSERT INTO `typecho_options` VALUES ('theme:default', '0', 'a:2:{s:7:\"logoUrl\";s:0:\"\";s:12:\"sidebarBlock\";a:5:{i:0;s:15:\"ShowRecentPosts\";i:1;s:18:\"ShowRecentComments\";i:2;s:12:\"ShowCategory\";i:3;s:11:\"ShowArchive\";i:4;s:7:\"ShowTag\";}}');

-- ----------------------------
-- Table structure for `typecho_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_relationships`;
CREATE TABLE `typecho_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_relationships
-- ----------------------------
INSERT INTO `typecho_relationships` VALUES ('1', '3');
INSERT INTO `typecho_relationships` VALUES ('1', '5');
INSERT INTO `typecho_relationships` VALUES ('3', '2');
INSERT INTO `typecho_relationships` VALUES ('3', '4');
INSERT INTO `typecho_relationships` VALUES ('3', '5');
INSERT INTO `typecho_relationships` VALUES ('3', '8');
INSERT INTO `typecho_relationships` VALUES ('3', '9');
INSERT INTO `typecho_relationships` VALUES ('3', '10');
INSERT INTO `typecho_relationships` VALUES ('3', '12');
INSERT INTO `typecho_relationships` VALUES ('5', '2');
INSERT INTO `typecho_relationships` VALUES ('5', '5');
INSERT INTO `typecho_relationships` VALUES ('7', '7');
INSERT INTO `typecho_relationships` VALUES ('11', '7');

-- ----------------------------
-- Table structure for `typecho_users`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_users`;
CREATE TABLE `typecho_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `screenName` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `group` varchar(16) DEFAULT 'visitor',
  `authCode` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_users
-- ----------------------------
INSERT INTO `typecho_users` VALUES ('1', 'admin', '$P$BJunMTwcWBxBLCmvnfZUHF9ZpQ9QYb0', '123456@qq.com', 'http://www.typecho.org', 'admin', '1539245330', '1539844036', '1539843867', 'administrator', 'b25a7a5d6731798e4229ac9bb61f4872');
