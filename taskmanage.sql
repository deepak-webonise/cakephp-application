-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 21, 2014 at 04:03 PM
-- Server version: 5.5.40
-- PHP Version: 5.3.10-1ubuntu3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `acos`
--

CREATE TABLE IF NOT EXISTS `acos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT '',
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT '',
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `acos`
--

INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(28, NULL, NULL, NULL, 'controllers', 1, 76),
(29, 28, NULL, NULL, 'Pages', 2, 5),
(30, 29, NULL, NULL, 'display', 3, 4),
(31, 28, NULL, NULL, 'Tasks', 6, 21),
(32, 31, NULL, NULL, 'index', 7, 8),
(33, 31, NULL, NULL, 'add', 9, 10),
(34, 31, NULL, NULL, 'edit', 11, 12),
(35, 31, NULL, NULL, 'view', 13, 14),
(36, 31, NULL, NULL, 'delete', 15, 16),
(37, 28, NULL, NULL, 'Technologies', 22, 33),
(38, 37, NULL, NULL, 'index', 23, 24),
(39, 28, NULL, NULL, 'Types', 34, 39),
(40, 39, NULL, NULL, 'index', 35, 36),
(41, 28, NULL, NULL, 'Users', 40, 57),
(42, 41, NULL, NULL, 'index', 41, 42),
(43, 41, NULL, NULL, 'login', 43, 44),
(44, 41, NULL, NULL, 'logout', 45, 46),
(45, 41, NULL, NULL, 'add', 47, 48),
(46, 41, NULL, NULL, 'edit', 49, 50),
(47, 41, NULL, NULL, 'delete', 51, 52),
(48, 28, NULL, NULL, 'AclExtras', 58, 59),
(49, 28, NULL, NULL, 'Microsaves', 60, 63),
(50, 49, NULL, NULL, 'index', 61, 62),
(51, 31, NULL, NULL, 'listTasks', 17, 18),
(52, 37, NULL, NULL, 'add', 25, 26),
(53, 28, NULL, NULL, 'CakeResque', 64, 65),
(54, 28, NULL, NULL, 'MicroSave', 66, 71),
(55, 54, NULL, NULL, 'MicroSaves', 67, 70),
(56, 55, NULL, NULL, 'index', 68, 69),
(57, 37, NULL, NULL, 'edit', 27, 28),
(58, 37, NULL, NULL, 'delete', 29, 30),
(59, 41, NULL, NULL, 'dashboard', 53, 54),
(60, 31, NULL, NULL, 'adminListTasks', 19, 20),
(61, 41, NULL, NULL, 'adminDashboard', 55, 56),
(62, 28, NULL, NULL, 'Migrations', 72, 73),
(64, 39, NULL, NULL, 'autoCompleteList', 37, 38),
(65, 28, NULL, NULL, 'Search', 74, 75),
(67, 37, NULL, NULL, 'autoCompleteList', 31, 32);

-- --------------------------------------------------------

--
-- Table structure for table `aros`
--

CREATE TABLE IF NOT EXISTS `aros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT '',
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT '',
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, 'Group', 1, 'admin', 1, 6),
(2, NULL, 'Group', 2, 'normal', 7, 38),
(3, 1, 'User', 1, '', 2, 3),
(4, 2, 'User', 2, 'guest', 8, 9),
(5, 2, 'User', 4, '', 10, 11),
(6, 2, 'User', 5, '', 12, 13),
(7, 1, 'User', 6, '', 4, 5),
(8, 2, 'User', 7, '', 14, 15),
(9, 2, 'User', 8, '', 16, 17),
(10, 2, 'User', 9, '', 18, 19),
(11, 2, 'User', 10, '', 20, 21),
(12, 2, 'User', 11, '', 22, 23),
(13, 2, 'User', 12, '', 24, 25),
(14, 2, 'User', 14, '', 26, 27),
(15, 2, 'User', 15, '', 28, 29),
(16, 2, 'User', 16, '', 30, 31),
(17, 2, 'User', 17, '', 32, 33),
(18, 2, 'User', 18, '', 34, 35),
(19, 2, 'User', 19, '', 36, 37);

-- --------------------------------------------------------

--
-- Table structure for table `aros_acos`
--

CREATE TABLE IF NOT EXISTS `aros_acos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) unsigned NOT NULL,
  `aco_id` int(10) unsigned NOT NULL,
  `_create` char(2) NOT NULL DEFAULT '0',
  `_read` char(2) NOT NULL DEFAULT '0',
  `_update` char(2) NOT NULL DEFAULT '0',
  `_delete` char(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `aros_acos`
--

INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`) VALUES
(8, 1, 28, '1', '1', '1', '1'),
(9, 2, 28, '-1', '-1', '-1', '-1'),
(10, 2, 31, '1', '1', '1', '1'),
(11, 4, 41, '-1', '-1', '-1', '-1'),
(12, 1, 31, '1', '1', '1', '1'),
(13, 1, 33, '1', '1', '1', '1'),
(14, 1, 37, '1', '1', '1', '1'),
(15, 2, 41, '1', '1', '1', '1'),
(16, 2, 39, '1', '1', '1', '1'),
(17, 2, 67, '1', '1', '1', '1'),
(18, 2, 51, '1', '1', '1', '1'),
(19, 2, 37, '1', '1', '1', '1'),
(20, 2, 60, '-1', '-1', '-1', '-1');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'administrator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`id`, `class`, `type`, `created`) VALUES
(1, 'InitMigrations', 'Migrations', '2014-11-17 18:42:21'),
(2, 'ConvertVersionToClassNames', 'Migrations', '2014-11-17 18:42:21'),
(3, 'IncreaseClassNameLength', 'Migrations', '2014-11-17 18:42:22'),
(4, 'FirstMigration', 'app', '2014-11-17 18:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `comments` text NOT NULL,
  `modified` date DEFAULT NULL,
  `closed` date NOT NULL,
  `technology_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `technology_id` (`technology_id`,`type_id`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id_2` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=140 ;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `duration`, `created`, `comments`, `modified`, `closed`, `technology_id`, `type_id`, `user_id`) VALUES
(15, 'Pagination', 2, '2014-11-15 00:00:00', 'create pagination for tasks ', '0000-00-00', '0000-00-00', 1, 1, 1),
(16, 'pAGINATION 2', 2, '2014-11-15 00:00:00', 'PAGINATION ', '0000-00-00', '0000-00-00', 1, 1, 1),
(17, 'Send mail', 2, '2014-11-17 00:00:00', 'send mail to new users ', '2014-11-17', '0000-00-00', 1, 2, 1),
(18, 'Cakephp request object', 1, '2014-11-17 00:00:00', 'create object 23', '2014-11-17', '0000-00-00', 1, 1, 1),
(22, 'Cakephp request object', 1, '2014-11-17 00:00:00', 'comments', '2014-11-17', '0000-00-00', 1, 1, 5),
(23, 'Cakephp request object', 2, '2014-11-18 10:06:58', 'cahephp', '2014-11-18', '0000-00-00', 1, 1, 5),
(24, 'Send mail from localhost', 1, '2014-11-18 10:24:08', 'setup SMTP for gmail', '2014-11-18', '0000-00-00', 1, 1, 1),
(25, 'Cakephp request object', 1, '2014-11-19 14:03:44', 'aaaqqq', '2014-11-19', '0000-00-00', 1, 1, 1),
(26, 'Cakephp request object', 1, '2014-11-19 14:05:54', 'aaaaaaaaa', '2014-11-19', '0000-00-00', 1, 1, 1),
(28, 'Send mail from localhost', 1, '2014-11-19 18:27:01', 'sasasasasas', '2014-11-19', '0000-00-00', 1, 1, 5),
(29, 'Cakephp request object', 1, '2014-11-19 18:58:03', '', '2014-11-19', '0000-00-00', 1, 1, 5),
(30, 'Cakephp request object', 1, '2014-11-19 18:58:08', '', '2014-11-19', '0000-00-00', 1, 1, 5),
(31, 'Cakephp request object', 1, '2014-11-19 18:58:11', '', '2014-11-19', '0000-00-00', 1, 1, 5),
(32, 'Deploy on openshift', 1, '2014-11-19 19:00:06', '', '2014-11-19', '0000-00-00', 1, 1, 5),
(33, 'Deploy on openshift', 1, '2014-11-19 19:00:07', '', '2014-11-19', '0000-00-00', 1, 1, 5),
(34, 'validation', 1, '2014-11-19 19:00:57', '', '2014-11-19', '0000-00-00', 1, NULL, 5),
(35, 'validation', 1, '2014-11-19 19:00:58', '', '2014-11-19', '0000-00-00', 1, NULL, 5),
(36, 'Install cakeresque', 1, '2014-11-19 19:01:40', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(37, 'Install cakeresque', 1, '2014-11-19 19:01:42', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(38, 'Cakephp request object', 1, '2014-11-19 19:03:11', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(39, 'Send mail from localhost', 1, '2014-11-19 19:03:31', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(40, 'validation', 1, '2014-11-19 19:04:44', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(41, 'validation', 1, '2014-11-19 19:04:53', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(42, 'Cakephp request object', 1, '2014-11-19 19:05:44', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(43, 'Cakephp request object', 1, '2014-11-19 19:06:49', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(44, 'Cakephp request object', 1, '2014-11-19 19:07:15', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(45, 'Install cakeresque', 1, '2014-11-19 19:07:52', 'aaaaaaaaaaaaaa', '2014-11-19', '0000-00-00', 1, 1, 5),
(47, 'Cakephp request object', 1, '2014-11-19 19:10:13', 'aaaaaaaaaaaaa', '2014-11-19', '0000-00-00', 1, 1, 5),
(48, 'validation', 1, '2014-11-19 19:10:31', 'aaaaaaaaaa', '2014-11-19', '0000-00-00', 1, 1, 5),
(51, 'Install cakeresque', 1, '2014-11-19 19:12:37', 'aaaaaaaaa', '2014-11-19', '0000-00-00', 1, 1, 5),
(56, 'abcderf ', 1, '2014-11-19 19:27:42', 'aaaaaaaa', '2014-11-19', '0000-00-00', 1, 1, 5),
(57, 'validation', 1, '2014-11-19 19:29:23', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(58, 'Cakephp request object', 1, '2014-11-19 19:31:10', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(59, 'Cakephp request object', 1, '2014-11-19 19:31:49', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(60, 'Install cakeresque', 1, '2014-11-19 19:32:22', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(61, 'Cakephp request object', 1, '2014-11-19 19:35:04', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(62, 'a', 1, '2014-11-19 19:36:06', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(63, 'aaaaaaaaa', 1, '2014-11-19 19:36:54', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(64, 'Cakephp request object', 1, '2014-11-19 19:37:48', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(65, 'Cakephp request object', 1, '2014-11-19 19:38:39', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(66, 'Cakephp request object', 1, '2014-11-19 19:38:53', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(67, 'Cakephp request object', 1, '2014-11-19 19:39:11', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(68, 'Cakephp request object', 1, '2014-11-19 19:39:36', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(69, 'aa', 1, '2014-11-19 19:41:01', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(70, 'ssss', 1, '2014-11-19 19:42:01', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(71, 'aaa', 1, '2014-11-19 19:42:13', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(73, 'ss', 1, '2014-11-19 19:43:15', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(74, 'Install cakeresque', 1, '2014-11-19 19:49:12', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(75, 'validation', 1, '2014-11-19 19:50:17', '', '2014-11-19', '0000-00-00', NULL, NULL, 5),
(76, 'Cakephp request object', 1, '2014-11-20 08:51:39', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(77, 'Cakephp request object 2', 1, '2014-11-20 08:53:57', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(78, 'Cakephp request object3', 1, '2014-11-20 08:54:40', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(79, 'Cakephp request object', 1, '2014-11-20 08:55:47', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(80, 'Cakephp request object 4', 1, '2014-11-20 08:56:27', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(81, 'Cakephp request object', 1, '2014-11-20 08:56:52', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(82, 'Install cakeresque', 1, '2014-11-20 08:58:53', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(83, 'Send mail from localhost', 1, '2014-11-20 09:01:02', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(84, 'Cakephp request object', 1, '2014-11-20 09:01:44', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(85, 'Cakephp request object', 1, '2014-11-20 09:02:43', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(86, 'Cakephp request object 4', 1, '2014-11-20 09:09:19', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(87, 'validation 2', 1, '2014-11-20 09:29:03', '', '2014-11-20', '0000-00-00', 1, 1, 5),
(88, 'Cakephp request object3', 2, '2014-11-20 09:32:59', 'aaaaaaaa', '2014-11-21', '0000-00-00', 1, 1, 5),
(89, 'aaaaa', 1, '2014-11-20 10:33:31', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(90, 'validation', 1, '2014-11-20 14:12:29', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(91, 'validation', 1, '2014-11-20 14:12:43', '', '2014-11-21', '0000-00-00', 1, 1, 5),
(93, 'Cakephp request object', 1, '2014-11-20 14:23:38', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(94, 'Cakephp request object', 1, '2014-11-20 14:29:23', '', '2014-11-20', '0000-00-00', 1, 1, 19),
(98, 'validation', 1, '2014-11-20 18:47:26', '', '2014-11-20', '0000-00-00', NULL, NULL, 5),
(99, 'added', 1, '2014-11-21 10:02:42', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(102, 'Install cakeresque', 1, '2014-11-21 10:06:50', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(103, 'added', 1, '2014-11-21 10:07:29', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(105, 'Cakephp request object2', 4, '2014-11-21 10:15:30', '', '2014-11-21', '0000-00-00', 1, 1, 5),
(106, 'aaaaaa', 1, '2014-11-21 11:06:11', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(107, 'Cakephp request object', 1, '2014-11-21 11:07:48', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(108, 'validation', 1, '2014-11-21 11:08:23', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(110, 'aaaaaa', 1, '2014-11-21 11:34:52', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(111, 'validation', 1, '2014-11-21 11:35:02', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(112, 'Cakephp request object', 1, '2014-11-21 11:36:49', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(113, 'Cakephp request object', 1, '2014-11-21 11:37:15', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(114, 'Cakephp requesa2t object', 1, '2014-11-21 11:37:21', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(115, 'Send mail from localhost', 1, '2014-11-21 11:37:50', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(116, 'Cakephp request object', 1, '2014-11-21 11:38:39', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(117, 'validation', 1, '2014-11-21 11:42:17', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(118, 'Send mail from localhost', 1, '2014-11-21 11:42:24', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(119, 'Install cakeresque', 1, '2014-11-21 11:42:36', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(120, 'Cakephp request object', 1, '2014-11-21 11:42:45', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(121, 'aaaa', 1, '2014-11-21 11:45:04', '', '2014-11-21', '0000-00-00', 1, 1, 5),
(122, 'aaaa', 1, '2014-11-21 11:59:26', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(123, 'Cakephp request object', 1, '2014-11-21 12:04:31', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(124, 'abcderf ', 1, '2014-11-21 12:06:29', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(125, 'Install cakeresque', 1, '2014-11-21 12:06:53', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(130, 'Cakephp request object', 1, '2014-11-21 12:11:07', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(131, 'Install cakeresque', 1, '2014-11-21 12:11:39', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(132, 'Install cakeresque', 1, '2014-11-21 12:21:14', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(133, 'Install cakeresque 2', 1, '2014-11-21 12:21:20', '', '2014-11-21', '0000-00-00', NULL, NULL, 5),
(134, 'admin', 1, '2014-11-21 13:00:58', '', '2014-11-21', '0000-00-00', NULL, NULL, 1),
(135, 'addnow', 1, '2014-11-21 14:03:32', '', '2014-11-21', '0000-00-00', NULL, NULL, 1),
(136, 'added', 1, '2014-11-21 14:03:52', '', '2014-11-21', '0000-00-00', NULL, NULL, 1),
(137, 'Install cakeresque', 1, '2014-11-21 14:04:31', '', '2014-11-21', '0000-00-00', NULL, NULL, 1),
(138, 'Cakephp request object', 1, '2014-11-21 14:10:53', '', '2014-11-21', '0000-00-00', NULL, NULL, 1),
(139, 'validation', 1, '2014-11-21 14:11:01', '', '2014-11-21', '0000-00-00', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

CREATE TABLE IF NOT EXISTS `technologies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `technologies`
--

INSERT INTO `technologies` (`id`, `name`, `created`, `modified`) VALUES
(1, 'PHP', '2014-11-04 00:00:00', '2014-11-17 00:00:00'),
(2, 'Angular Js', '2014-11-17 19:05:44', '2014-11-17 00:00:00'),
(3, 'Python', '2014-11-13 00:00:00', '2014-11-13 00:00:00'),
(4, 'Ruby', '2014-11-13 00:00:00', '2014-11-13 00:00:00'),
(5, 'Java', '2014-11-14 00:00:00', '2014-11-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(1, 'Technical'),
(2, 'Non Technical');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `group_id`) VALUES
(1, 'admin', 'admin', '', '', '', 1),
(2, 'user', 'user', '', '', '', 2),
(3, 'deepak', 'deepak', '', '', '', 1),
(4, 'ramesh', 'abc', '', '', '', 2),
(5, 'harshal', 'harshal', '', '', '', 2),
(6, 'chetna', 'chetna', '', '', '', 1),
(7, 'ashish', 'ashish', '', '', '', 2),
(8, 'yogesh', 'qwaszx', 'yogesh', 'yogesh', 'yogesh@webonise.com', 2),
(9, 'aaaaaa', 'aaaaaaa', 'aaaaaa', 'aaaaaa', 'aaa@aa.com', 2),
(10, 'deepak', 'qwasazx', 'yogesh', 'yogesh', 'aaa@aa.com', 2),
(11, 'deepak', 'qwasazx', 'yogesh', 'yogesh', 'aaa@aa.com', 2),
(12, 'qqqqqq', 'qqqqqq', 'qqqqqq', 'qqqqq', 'deepakkabbur@gmail.com', 2),
(14, 'naveen', 'qwaszx', 'Naveen', 'Naveen', 'naveen@gmail.com', 2),
(15, 'adminaa', 'aaaaaa', 'aaaaaa', 'aaaa', 'aaa@aa.com', 2),
(16, 'aaabbbb', 'aaaaaaaa', 'aaaaaaa', 'aaaa', 'aaa@aa.com', 2),
(17, 'bbbbbb', 'qqqqqqq', 'bbbbbb', 'bbbb', 'aaa@aa.com', 2),
(18, 'deepak123', 'aaaaaa', 'deepak', 'deepak', 'deepakkabbur123@gmail.com', 2),
(19, 'prajakta', 'qwaszx', 'prajakta', 'rajapure', 'prajakta@weboniselab.com', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`technology_id`) REFERENCES `technologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
