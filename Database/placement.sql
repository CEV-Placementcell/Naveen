-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2025 at 07:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `placement`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add student', 7, 'add_student'),
(26, 'Can change student', 7, 'change_student'),
(27, 'Can delete student', 7, 'delete_student'),
(28, 'Can view student', 7, 'view_student'),
(29, 'Can add query', 8, 'add_query'),
(30, 'Can change query', 8, 'change_query'),
(31, 'Can delete query', 8, 'delete_query'),
(32, 'Can view query', 8, 'view_query'),
(33, 'Can add jobs_applied', 9, 'add_jobs_applied'),
(34, 'Can change jobs_applied', 9, 'change_jobs_applied'),
(35, 'Can delete jobs_applied', 9, 'delete_jobs_applied'),
(36, 'Can view jobs_applied', 9, 'view_jobs_applied'),
(37, 'Can add events_applied', 10, 'add_events_applied'),
(38, 'Can change events_applied', 10, 'change_events_applied'),
(39, 'Can delete events_applied', 10, 'delete_events_applied'),
(40, 'Can view events_applied', 10, 'view_events_applied'),
(41, 'Can add contact', 11, 'add_contact'),
(42, 'Can change contact', 11, 'change_contact'),
(43, 'Can delete contact', 11, 'delete_contact'),
(44, 'Can view contact', 11, 'view_contact'),
(45, 'Can add placements', 12, 'add_placements'),
(46, 'Can change placements', 12, 'change_placements'),
(47, 'Can delete placements', 12, 'delete_placements'),
(48, 'Can view placements', 12, 'view_placements'),
(49, 'Can add event', 13, 'add_event'),
(50, 'Can change event', 13, 'change_event'),
(51, 'Can delete event', 13, 'delete_event'),
(52, 'Can view event', 13, 'view_event'),
(53, 'Can add job', 14, 'add_job'),
(54, 'Can change job', 14, 'change_job'),
(55, 'Can delete job', 14, 'delete_job'),
(56, 'Can view job', 14, 'view_job'),
(57, 'Can add notification', 15, 'add_notification'),
(58, 'Can change notification', 15, 'change_notification'),
(59, 'Can delete notification', 15, 'delete_notification'),
(60, 'Can view notification', 15, 'view_notification'),
(61, 'Can add course', 16, 'add_course'),
(62, 'Can change course', 16, 'change_course'),
(63, 'Can delete course', 16, 'delete_course'),
(64, 'Can view course', 16, 'view_course'),
(65, 'Can add result', 17, 'add_result'),
(66, 'Can change result', 17, 'change_result'),
(67, 'Can delete result', 17, 'delete_result'),
(68, 'Can view result', 17, 'view_result'),
(69, 'Can add question', 18, 'add_question'),
(70, 'Can change question', 18, 'change_question'),
(71, 'Can delete question', 18, 'delete_question'),
(72, 'Can view question', 18, 'view_question');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `image`) VALUES
(1, 'cards/placement1.jpeg'),
(2, 'cards/placement2.jpeg'),
(3, 'cards/placement3.jpeg'),
(4, 'cards/placement4.jpeg'),
(5, 'cards/placement5.jpeg'),
(6, 'cards/placement6.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(16, 'exam', 'course'),
(18, 'exam', 'question'),
(17, 'exam', 'result'),
(13, 'management', 'event'),
(14, 'management', 'job'),
(15, 'management', 'notification'),
(11, 'registration', 'contact'),
(10, 'registration', 'events_applied'),
(9, 'registration', 'jobs_applied'),
(12, 'registration', 'placements'),
(8, 'registration', 'query'),
(7, 'registration', 'student'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-01 16:49:46.521986'),
(2, 'auth', '0001_initial', '2024-08-01 16:49:47.667297'),
(3, 'admin', '0001_initial', '2024-08-01 16:49:47.936895'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-01 16:49:47.941587'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-01 16:49:47.951599'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-01 16:49:48.052031'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-01 16:49:48.157353'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-01 16:49:48.184101'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-01 16:49:48.189110'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-01 16:49:48.261795'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-01 16:49:48.266608'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-01 16:49:48.274142'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-01 16:49:48.285990'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-01 16:49:48.300499'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-01 16:49:48.320928'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-01 16:49:48.332448'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-01 16:49:48.352102'),
(18, 'management', '0001_initial', '2024-08-01 16:49:48.458891'),
(19, 'registration', '0001_initial', '2024-08-01 16:49:49.379329'),
(20, 'exam', '0001_initial', '2024-08-01 16:49:49.841612'),
(21, 'management', '0002_job_program', '2024-08-01 16:49:49.867560'),
(22, 'management', '0003_alter_job_req_s_alter_job_sal', '2024-08-01 16:49:49.989220'),
(23, 'management', '0004_alter_event_venue', '2024-08-01 16:49:50.012416'),
(24, 'management', '0005_alter_event_venue', '2024-08-01 16:49:50.155485'),
(25, 'registration', '0002_placements', '2024-08-01 16:49:50.504358'),
(26, 'registration', '0003_query_d_replay_alter_query_d_descr', '2024-08-01 16:49:50.552501'),
(27, 'registration', '0004_student_regno', '2024-08-01 16:49:50.598734'),
(28, 'sessions', '0001_initial', '2024-08-01 16:49:50.666502'),
(29, 'registration', '0005_alter_student_ad_no_alter_student_regno', '2024-11-07 17:15:50.287308');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('08nl3fnbrg09qevu67vrde07m922usty', 'eyJhZG1pbiI6IkFkbWluIn0:1tiaml:f_XIYlMtKe9V0XXWAPwD6e50MV6iX3y-ON9c0Z0rC_0', '2025-02-27 15:05:51.240049'),
('1echokf83y7c1z4tsq5ox0zbimdlshtk', 'eyJhZG1pbiI6IkFkbWluIn0:1tib3i:3oVFHepY6XAqXAdOXROh4bjrQJRlpUOhSZNrI-6AbDE', '2025-02-27 15:23:22.875678'),
('1q0rp86m48g3enm48apqft2qwicg0pga', 'eyJhZF9ubyI6IjEybTExIn0:1tRt0U:oCtFfscFkzbvFevHzVi1EnRh7HuQfRgYYScTiHWdup8', '2025-01-12 13:06:58.137718'),
('2489fq8cmymfjbmbb3bbcfe9xv9jk353', 'eyJhZF9ubyI6IjEybTExIiwiYWRtaW4iOiJBZG1pbiJ9:1tB6tj:O6aqBjKQgyqxcINrXR89ra3HJ1u_QkbaV4ct1K5JUWI', '2024-11-27 06:30:39.513208'),
('2c7q1uaqm4rz8b9fz3dy99nvb5v735wi', 'eyJhZF9ubyI6IjEybTExIn0:1tBHVo:NvDmecvSnOGvuhInSFR2ine7cEQbigCSwojFWSBeXBY', '2024-11-27 17:50:40.810572'),
('2eltfq6qj40b70v5jzyd2ijsz3h88mlc', 'eyJhZF9ubyI6IjEybTExIiwiYWRtaW4iOiJBZG1pbiJ9:1t9Qh6:zE-Uy5XUAzmeMBqX7ERvwwvp6_aGaPNXxgYhP4ajZ-8', '2024-11-22 15:14:40.435296'),
('2w9ynxiuccxsl067sr6j05yemzlijow5', 'eyJhZF9ubyI6IjEybTExIn0:1tRtSx:WAQ7X3Gp_nx2Ad9Hx56FYWqz7R6dVW1o2NKn0-YT3TM', '2025-01-12 13:36:23.172725'),
('42o7szlnv264vb5tnh7nwln54lid7jae', 'eyJhZF9ubyI6IjEybTExIn0:1tZuz4:vhsWNmCx9xq87dUsuHpyDniuHpvNDc-srYk7Wpa-URE', '2025-02-03 16:50:42.961796'),
('4tq2l0pjxhcw12y1flvbd3af7f7iyjeu', 'eyJhZF9ubyI6IjEybTExIiwiYWRtaW4iOiJBZG1pbiJ9:1tAumM:CPTkeGO7wiRaQzxmKxe5O0VUyM4doB5Ky-03ac_RbIs', '2024-11-26 17:34:14.607408'),
('4yfxw7ba4tz6to1xi5f5d3qayicbj6sq', 'eyJhZF9ubyI6IjEybTExIn0:1tRp6h:QWJOLA8s9nWgvTEV9fEzBuBu-CW7kDrmNzLUJZuqujA', '2025-01-12 08:57:07.451112'),
('52vzxmt7lhd9wgkr1pufx4uzn63t1gdj', 'eyJhZG1pbiI6IkFkbWluIn0:1tiRNj:PFJ58GbXbStKH2f2Xi7LejPgGyJ_f_OK1aKFF-VcXaQ', '2025-02-27 05:03:23.798709'),
('5ac2sz27mo0ad9yxns6yhygb7zo0rm9y', 'eyJhZF9ubyI6IjEybTExIn0:1tAubP:WcFZrzdoUcqIf4GpbWTl56gannMgr2cDMZh_mZdIOo8', '2024-11-26 17:22:55.584195'),
('5w60z2d1zadmvgq6r39nmbgi4upp8z8g', 'eyJhZF9ubyI6IjEybTExIn0:1t9S6L:IUISiTjsii6oRmDBwk4pxw7OciUq0HuUjIYucmdctEU', '2024-11-22 16:44:49.941969'),
('69d83gyhi5ss7p98p7u6mxd4oerlds0t', 'eyJhZF9ubyI6IjEybTExIn0:1tTiLn:MtRASqFSz7XlqUD_S_eWl7F9MUaSK6zkDpeNdIKzyJQ', '2025-01-17 14:08:31.933647'),
('6g8gesnptt64rhhh1u9je8j9ot6l7e4z', 'eyJhZG1pbiI6IkFkbWluIn0:1tZ70g:N0Z0soWYvmVfFJaAloqRrkhyPag3SWN9bhbQ-hfKT8Y', '2025-02-01 11:29:02.036684'),
('6lmxp4jzfofa32k02qg1a48b9lt4vtzy', 'eyJhZF9ubyI6IjEybTExIn0:1tRmTr:UjbrAqBDLbXwGASJfQIDTM8jdsp_QlIDwbsrZblj74w', '2025-01-12 06:08:51.882689'),
('6w7x3wsv6gdnadphfj7fylm57pf1xyt6', 'eyJhZG1pbiI6IkFkbWluIiwiYWRfbm8iOiIxMm0xMSJ9:1tAuD2:4NL7Xu4_1TATIEhBh6eznUo6TGcYOcFlJS_c-FkJhBc', '2024-11-26 16:57:44.889324'),
('7qbzh085ycvlz1oep8caxufpy0xbcgho', 'eyJhZG1pbiI6InBsYWNlbWVudGNldiJ9:1tpLmC:5EeY1kl8F8gZACconCtAJUd_sbpzdqdiGleEiteDS7E', '2025-03-18 06:29:12.994872'),
('8cpo5ztm2t4gwrhnzewmz1botety27rw', 'eyJhZG1pbiI6IkFkbWluIiwiYWRfbm8iOiIxMm0xMSJ9:1tSHyy:Fz3dG4uzlerCoRYuQejVHsdKqnBhQG-MxR5rkcaDnuA', '2025-01-13 15:47:04.859713'),
('8yeek4lsvftppictish3t3imhap11j63', 'eyJhZF9ubyI6IjEybTExIn0:1taIbx:U4FS-R3Htxk4lHeAK0TvmXuhmdzJs8OCjcAl7hFI6SQ', '2025-02-04 18:04:25.302918'),
('96evtk54xa6pbaant6qhfyt5n239xjyp', 'eyJhZF9ubyI6IjEybTExIn0:1tgejR:halRwtN581VFdzKNbdcDoFiGvT5y_ZpgLpt_pbr0sIA', '2025-02-22 06:54:25.133350'),
('9cyif9b31x6virsq5sbg8vpqmhgtvkos', 'eyJhZF9ubyI6IjEybTExIn0:1tBB92:i1fYpJhT6yZiV4aSQmwYILLdEGOp0Cvx-YwXmMsXHZ8', '2024-11-27 11:02:44.408657'),
('9ho7r70d2gtvl8fkt2s8t8ka06v5u3xc', 'eyJhZG1pbiI6IkFkbWluIiwiYWRfbm8iOiIxMm0xMSJ9:1tAtTt:0WiHPgtsjOQuT75Fb803c7SMDvK8DXUQ3jb9fgXaXp0', '2024-11-26 16:11:05.632011'),
('9qkzzgwj7tvq2phlks0h4d53amh5jywk', 'eyJhZF9ubyI6IjEybTExIn0:1tAuPg:zE4Xdqadh29Tldnwg2GmGbwm_gsSywTdvc1GJ8LUruE', '2024-11-26 17:10:48.377912'),
('9sitvtm9hs3p4xwz19lriomfuwmm9iwb', 'eyJhZF9ubyI6IjEybTExIn0:1tAup8:gCo77lbUCYhbSP_pDicQwl2AV05Nz8smXju0Y41_QUs', '2024-11-26 17:37:06.692147'),
('bheivl49biq0z97l0wqeac6uym4twx2x', 'eyJhZF9ubyI6IjEybTExIn0:1tAulS:dth9ww5o8zO-Rus7hNNEFNIXhybrE95NG1i34tgsHBI', '2024-11-26 17:33:18.419137'),
('byna6i9t80tduwprtn09ri2jkbimz6vx', 'eyJhZF9ubyI6IjEybTExIiwiYWRtaW4iOiJBZG1pbiJ9:1tB96y:lTxruddB3ftwlUwzDunUdU6rQqN2fhBVJX3tuXFEwcs', '2024-11-27 08:52:28.855125'),
('cjffjlguj68bkc1fl9pkut3eirlwnby1', 'eyJhZG1pbiI6IkFkbWluIn0:1tib0z:IRTAJ9Tg7McZ4yaskqmkZsx7WzvTK-1iXOr21jIpepk', '2025-02-27 15:20:33.306516'),
('cppsfxp5v3ny1klkgd3sp6gtb7foot7i', 'eyJhZF9ubyI6IjEybTExIn0:1tBGuA:12wnjD8fxatiJQHWz3-Sv4Fb6142sw_GbA2yy3yqviI', '2024-11-27 17:11:46.533916'),
('dpxi238jfjnmvkoqc0r1jwqkewr1asb9', 'eyJhZF9ubyI6IjEybTExIn0:1tYnug:7VzfqUhVdVSGRkkltIDus2El7NHcDs5WZbXy52jqpX0', '2025-01-31 15:05:34.183490'),
('eox89n94s9bwhg8b2d6flyvxq9m6ezma', 'eyJhZF9ubyI6IjEybTExIn0:1thObB:wUS0pLFDfLSkZs1Hd4toZqxoW0ifMP5H7gHF0gPmjMA', '2025-02-24 07:52:57.115867'),
('fixep47ozeuj7purqihogf62ej17a05q', 'eyJhZF9ubyI6IjEybTExIn0:1tRt8F:npNffwChhAN3Ox5B3H7XwIrQyBRGwb_SBovRgLox2T0', '2025-01-12 13:14:59.408008'),
('fk9310kn9503asmvdg4uwk9zjcch4fgt', 'eyJhZG1pbiI6InBsYWNlbWVudGNldiJ9:1tipdb:QcJ8mDH4KUs4wXGM-3I3Yy-PNGqYjX_F5JjC__ry4bE', '2025-02-28 06:57:23.099508'),
('fziq51orgklfrvk6e377rl6pdtlw9sg5', 'eyJhZF9ubyI6IjEybTExIiwiYWRtaW4iOiJBZG1pbiJ9:1tYqPD:zFGjC4bZeJXMN6tP9eLYqslmqhdIJpJPD1DokgfQO6A', '2025-01-31 17:45:15.175077'),
('geszrk7cobf2ssgu4o95kc8uo240ba8w', 'eyJhZF9ubyI6IjEybTExIn0:1tBAwy:nU3QXz7SbEYXz7I0By1b-Te6yifNEWUar5G6ymZOiiM', '2024-11-27 10:50:16.602149'),
('gq6qm1xodfw03wif9ai0uvkugwqq4hvm', 'eyJhZF9ubyI6IjEybTExIn0:1tAubv:gGeT-VRh6Hi9kwuoibOVhFDhZMgLNvFDPNbf0RQLdNs', '2024-11-26 17:23:27.805087'),
('hv1j4gvei4th1vxtppdw99o39jj3yq7q', 'eyJhZF9ubyI6IjEybTExIn0:1tAvWE:S-pwuHpDXVpH8OD8rM9-OTOzheLn3t9ALinxjygQhdY', '2024-11-26 18:21:38.825292'),
('jiojasz21sd7cph9nnkfc7v2xlx5qfsq', 'eyJhZF9ubyI6IjEybTExIn0:1t9hWm:amUMtgeK8-dD5l8-2ApPTyboPPWHtpAIRmmBBAp1aYY', '2024-11-23 09:13:08.247439'),
('jmq41fwhcsaszffeb6u4254798ok2mto', 'eyJhZF9ubyI6IjEybTExIn0:1t9i9j:7RCarPCCHrkUsBjqQsYoG67vU2R5tlBrr5CQjh399QQ', '2024-11-23 09:53:23.192173'),
('juuxphkum62lw730qd6l1k81pku5ubdl', 'eyJhZG1pbiI6IkFkbWluIiwiYWRfbm8iOiIxMm0xMSJ9:1tBIVM:30Lo-WFnRt40Xys5IDxINyfKJHbfUyqN6v20YG43jrc', '2024-11-27 18:54:16.933077'),
('k08grhguylqqi146whcknlw8dunfmyw8', 'eyJhZG1pbiI6IkFkbWluIn0:1tibL4:9MtX_DsJ-CX5K2w-tugKyYcTdkLSHATta128gD4MERk', '2025-02-27 15:41:18.765435'),
('kpmlwculoywzoy8dtqj700p1u3847mgq', 'eyJhZG1pbiI6IkFkbWluIn0:1tZ9Im:ft31pl0VDirCfK2CSLM9zUBlLDF6morgiI091xbYTqg', '2025-02-01 13:55:52.019536'),
('l4dap8858g7g3gwdqe84cnglpbrey8hi', 'eyJhZG1pbiI6ImFkbWluIn0:1sZZ7b:cln56fot2ESIxcOHTphrbnfhHfmLgv9Ns3iUvDpojxw', '2024-08-15 16:57:47.710777'),
('lbwex44ger8jhnbiwjiyvvhjr9t2zptr', 'eyJhZF9ubyI6IjEybTExIn0:1tRnnc:fgRUOZHLKXwt33oMpHskBdSZmE8EmYmWnDPbhUDpCqQ', '2025-01-12 07:33:20.670707'),
('lcuzziigso7awckw3brumpyjlup4str8', 'eyJhZF9ubyI6IjEybTExIn0:1tB679:GZQnx6Hj-hl9zcMyZ_LB2XXc-0fo5dpmxrEmH1vcEmw', '2024-11-27 05:40:27.076212'),
('m4qfb5h9w5k3x1bruwbmb3bcmz1dl7xb', 'eyJhZF9ubyI6IjEybTExIn0:1tRuHA:GzG2tt_tBTZerzcwnh7QsfSjjU2JyV_G72dUAgDZvKw', '2025-01-12 14:28:16.433519'),
('mcjok8d9uj8hpgccjxwcw6ij01guppim', 'eyJhZF9ubyI6IjEybTExIn0:1tBBRS:Hrji668Ib4HnegRey9Cf3_FAb0lxRDfAFhPFh5QQGLs', '2024-11-27 11:21:46.705981'),
('mjwc1tdl0syifzk729i5q392y7drjhmg', 'eyJhZG1pbiI6IkFkbWluIn0:1thRKm:SZXCqtv0cMY-5cbzgWllXh9oBbCUnud6fvtg-do5-dw', '2025-02-24 10:48:12.174617'),
('ng12lh7t800locoxzn86lvcft3dl1c79', 'eyJhZG1pbiI6IkFkbWluIn0:1tZ7uH:VjJXmw2iC6IS9RNtSvwEfJv5zVInfZtpWK9w5WjLywA', '2025-02-01 12:26:29.198349'),
('o3ww9i9a86kyq9uym5ba3yginro8qn18', 'eyJhZF9ubyI6IjEybTExIiwiYWRtaW4iOiJBZG1pbiJ9:1thWWo:8i1m2FVWUM14flVktG8m99dj1xuFIjxLOKH2jxCQn0s', '2025-02-24 16:20:58.126665'),
('pe4uln0nwnxh8o6ej0lu9q6r6fjkjrzq', 'eyJhZG1pbiI6IkFkbWluIn0:1tYqSZ:1NCp-aP6p3Y4MeEy0tn_MxlfkAYO6EOkes06kbpPf8c', '2025-01-31 17:48:43.940409'),
('pulec9opjponry90hvspov89dkfqahj7', 'eyJhZF9ubyI6IjEybTExIn0:1thXhp:qiHn8AR4Ic4g_amseCIlaZup0QqAZJn7eXBxFVxwLQI', '2025-02-24 17:36:25.647208'),
('pxtasehv9da5vwoe3136p7dfxls54uxg', 'eyJhZG1pbiI6InBsYWNlbWVudGNldiJ9:1tpLp0:Oman7y3j-Pp8HBU8E1g3JaRwA7ctZP0TQABkB9eKk5k', '2025-03-18 06:32:06.231025'),
('q1bgnaia5l4zizjkv2w1xy5ohsrmskbc', 'eyJhZF9ubyI6IjEybTExIn0:1tAvZ3:iMTYf-L6Q9BMuaDtRpLsRU6BaFwbmJeYf7fCHUvjnGQ', '2024-11-26 18:24:33.755681'),
('qf9a91kgep4aqk4bi4x6zqsrl557bjnp', 'eyJhZG1pbiI6IkFkbWluIn0:1tiSVu:gdID-bkCh25jhCYKDBGUvX473TGCpInYCAtny-r6OQM', '2025-02-27 06:15:54.408340'),
('rawxdzh4aur8qls2dt9gll1krd3h7a6h', 'eyJhZF9ubyI6IjEybTExIn0:1tBH9X:b59D7xonwuw0akaX7aWq5rd2PANl9RhVCGDsZ2dvtcs', '2024-11-27 17:27:39.219714'),
('rjmenla8zjgwjkfk0i9k7ieqcb7gwyy2', 'eyJhZF9ubyI6IjEybTExIn0:1t9RCc:mrBIquQUKTik2jduhzoHd4CBBdj7-OKu5L63DCedOqA', '2024-11-22 15:47:14.294625'),
('s9lpblhlfbeyttx5pjarlb9fm8s7wlme', 'eyJhZG1pbiI6IkFkbWluIn0:1tArQo:zECOeOvuidXIt3BW1FYHr04E-DsvSiJszvvPHQ_N1QE', '2024-11-26 13:59:46.108550'),
('sld3l8njdvawiuo5v1vz4rhdx33gnlsu', 'eyJhZF9ubyI6IjEybTExIiwiYWRtaW4iOiJBZG1pbiJ9:1tAr0R:KqzIqRA8vEASRCmgFFESUFQ2EOQ9KbccXT7pddkys1Y', '2024-11-26 13:32:31.382880'),
('trafpavsyu3lm4q0q1gc0208mhd1yfkt', 'eyJhZF9ubyI6IjEybTExIn0:1t9g7A:i0OqkVOIL-Xv6S8Qdits2Ko32O9tta8CQYimB7hIgTc', '2024-11-23 07:42:36.335257'),
('trviqckzx6zqh72so25in2x5udrh04t5', 'eyJhZF9ubyI6IjEybTExIn0:1taICB:cYKMD0zfn-ZocVHOCWH-QAtdUoMFC9EWvYPqHRKGiks', '2025-02-04 17:37:47.539361'),
('udn1zx46g08uen2mdbh6p99q1pq6un2p', 'eyJhZG1pbiI6IkFkbWluIn0:1tBIN5:mGU8NnqNylacYfh4omid7kQSa6_STaYmlMy0KH74X3c', '2024-11-27 18:45:43.945838'),
('updij0qaxi2w4bvud100trk60h34jalz', 'eyJhZG1pbiI6IkFkbWluIiwiYWRfbm8iOiIxMm0xMSJ9:1tAtSS:EaF8e9MhnLtTHYw3GYB1kpCN1z1O83w8WwA9-7sP7KQ', '2024-11-26 16:09:36.358125'),
('v1c0abue3bg7u5nlonbu0wl11atphe1q', 'eyJhZG1pbiI6IkFkbWluIn0:1tiSPs:vfAVbHWbD7A0IOHrjqXswcaCjxgPNkWfZfgHxTGAmUQ', '2025-02-27 06:09:40.851044'),
('wh6xtryfpdub4ejv562bmn0n5um654uw', 'eyJhZG1pbiI6IkFkbWluIn0:1thVut:dmZRlORLl_lG-idyc9jAofN72MA9oqTBb2VpdCKYWKk', '2025-02-24 15:41:47.148199'),
('wkrvmood4et9z9ys0t2914i80pp77ra7', 'eyJhZF9ubyI6IjEybTExIn0:1tRvEB:Vcj9JzTH_yLv64TqX7k4F48FSzHgt-3w8rRugyfmgpk', '2025-01-12 15:29:15.356034'),
('wn242ynqa2edpcxrifdy1qfiz9sfg992', 'eyJhZG1pbiI6IkFkbWluIn0:1tUpVC:Fck1qtty9jXw3uSo4-IJmZnU3E_TlVP5Q1vz0A1ZCiY', '2025-01-20 15:58:50.828150'),
('wzrwajkmcl59ljny6l2az4qv7ghhvp47', 'eyJhZF9ubyI6IjEybTExIn0:1tRnzz:DQPC_xXwoATG2XGGIYbKyJWh2LcBPuUdYhodtXmQdP8', '2025-01-12 07:46:07.377787'),
('x0jmndlzoshwnjiat6lioiz4s4nfmg09', 'eyJhZF9ubyI6IjEybTExIn0:1tBAc6:yp8nmIVVzuoODtnHVMf1A81ctDQG6eUwvcMtBrvzkZA', '2024-11-27 10:28:42.468222'),
('x5wknmb87w0z50sa3nbhe9t4z0ztxt6p', 'eyJhZF9ubyI6IjEybTExIn0:1tAuKW:b8xk5yrPrJprsXBkfMBNBv2KNNiPb6eG2JcMjw09FMM', '2024-11-26 17:05:28.436148'),
('xfecemivhuzqxldm68l3tkce7jo0l7f4', 'eyJhZG1pbiI6IkFkbWluIn0:1taJC2:prBP7spwzihjDipmSj8ssklZMk5WhvpqginYmaOU_kg', '2025-02-04 18:41:42.165842'),
('xkz1kc1o5ttrpov024w7421tmd7kmzzv', 'eyJhZF9ubyI6IjEybTExIn0:1thY6l:GC1lYkyNzImS0tez63vRlSBgzFxADAebyvrqZZEREnw', '2025-02-24 18:02:11.576536'),
('z9b6iy3sg9ys0zeciu334az4cfbht868', 'eyJhZF9ubyI6IjEybTExIn0:1tBGbc:T1ddnpn_firLXNMey83EppnQfd1_fRvOZ-LlHTZLtYE', '2024-11-27 16:52:36.424824'),
('znijlyftdpzt66dpsdp6u8qw7svngb6q', 'eyJhZF9ubyI6IjEybTExIn0:1tRnMx:ZjE_XyLeITQwOe53tAEfi0OwkkLYcY6l8AMhL95I0eU', '2025-01-12 07:05:47.433225');

-- --------------------------------------------------------

--
-- Table structure for table `drive`
--

CREATE TABLE `drive` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `attended` int(11) NOT NULL,
  `placed` int(11) NOT NULL,
  `companies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drive`
--

INSERT INTO `drive` (`id`, `year`, `attended`, `placed`, `companies`) VALUES
(1, 2025, 100, 100, 1),
(2, 2024, 0, 0, 0),
(15, 2023, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `drivedetails`
--

CREATE TABLE `drivedetails` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `cmpname` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `placed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_course`
--

CREATE TABLE `exam_course` (
  `id` bigint(20) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `question_number` int(10) UNSIGNED NOT NULL CHECK (`question_number` >= 0),
  `total_marks` int(10) UNSIGNED NOT NULL CHECK (`total_marks` >= 0),
  `time` int(10) UNSIGNED NOT NULL CHECK (`time` >= 0),
  `solution` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `qprint` int(10) UNSIGNED NOT NULL CHECK (`qprint` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_question`
--

CREATE TABLE `exam_question` (
  `id` bigint(20) NOT NULL,
  `marks` int(10) UNSIGNED NOT NULL CHECK (`marks` >= 0),
  `question` varchar(600) NOT NULL,
  `option1` varchar(200) NOT NULL,
  `option2` varchar(200) NOT NULL,
  `option3` varchar(200) NOT NULL,
  `option4` varchar(200) NOT NULL,
  `answer` varchar(200) NOT NULL,
  `course_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_result`
--

CREATE TABLE `exam_result` (
  `id` bigint(20) NOT NULL,
  `marks` int(10) UNSIGNED NOT NULL CHECK (`marks` >= 0),
  `date` datetime(6) NOT NULL,
  `exam_id` bigint(20) NOT NULL,
  `student_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_event`
--

CREATE TABLE `management_event` (
  `e_id` varchar(50) NOT NULL,
  `e_name` varchar(50) NOT NULL,
  `topic` varchar(150) NOT NULL,
  `dep` varchar(250) NOT NULL,
  `company` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `date_to` date NOT NULL,
  `time` time(6) NOT NULL,
  `l_date` date NOT NULL,
  `venue` varchar(100) NOT NULL,
  `fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_job`
--

CREATE TABLE `management_job` (
  `d_no` int(11) NOT NULL,
  `j_pos` varchar(50) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `l_date` varchar(20) NOT NULL,
  `j_dis` varchar(2500) NOT NULL,
  `req_s` varchar(500) NOT NULL,
  `qual` varchar(100) NOT NULL,
  `sal` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `poster` varchar(100) NOT NULL,
  `program` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_notification`
--

CREATE TABLE `management_notification` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `notify` varchar(500) NOT NULL,
  `last_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_contact`
--

CREATE TABLE `registration_contact` (
  `id` bigint(20) NOT NULL,
  `adr` varchar(200) NOT NULL,
  `st` varchar(20) NOT NULL,
  `dist` varchar(20) NOT NULL,
  `pin` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `m_name` varchar(50) NOT NULL,
  `gua_ph` varchar(20) NOT NULL,
  `ad_no_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration_contact`
--

INSERT INTO `registration_contact` (`id`, `adr`, `st`, `dist`, `pin`, `email`, `f_name`, `m_name`, `gua_ph`, `ad_no_id`) VALUES
(4, '135-a, Mollappally Vayal', 'Tamilnadu', 'The Nilgiris', 6943211, 'robinjoney22@gmail.com', 'Joney T J', 'Shyja Joney', '9488775379', '12m11');

-- --------------------------------------------------------

--
-- Table structure for table `registration_events_applied`
--

CREATE TABLE `registration_events_applied` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `ad_no_id` varchar(15) NOT NULL,
  `e_id_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_jobs_applied`
--

CREATE TABLE `registration_jobs_applied` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `ad_no_id` varchar(15) NOT NULL,
  `d_no_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_placements`
--

CREATE TABLE `registration_placements` (
  `id` bigint(20) NOT NULL,
  `ad_no_id` varchar(15) NOT NULL,
  `d_no_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_query`
--

CREATE TABLE `registration_query` (
  `id` bigint(20) NOT NULL,
  `d_title` varchar(50) NOT NULL,
  `d_descr` varchar(1000) NOT NULL,
  `d_ss` varchar(100) NOT NULL,
  `ad_no_id` varchar(15) NOT NULL,
  `d_no_id` int(11) NOT NULL,
  `d_replay` varchar(750) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_student`
--

CREATE TABLE `registration_student` (
  `ad_no` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `yo_add` int(11) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `prog` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `area_int` varchar(200) NOT NULL,
  `skill` varchar(200) NOT NULL,
  `stud_ph` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tech_mem` tinyint(1) NOT NULL,
  `aadhar` varchar(15) NOT NULL,
  `hsc` varchar(15) NOT NULL,
  `send` tinyint(1) NOT NULL,
  `sslc` varchar(20) NOT NULL,
  `gpa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration_student`
--

INSERT INTO `registration_student` (`ad_no`, `name`, `dob`, `yo_add`, `dept`, `course`, `prog`, `photo`, `area_int`, `skill`, `stud_ph`, `password`, `tech_mem`, `aadhar`, `hsc`, `send`, `sslc`, `gpa`) VALUES
('12m11', 'Robin Joney', '2002-08-16', 2020, 'IT', 'B.Tech. Information Technology', 'PG', 'img/RJ.jpg', 'Data Analyst', 'Python, Sql ', '9786208122', '0000', 1, '527789247365', '80', 0, '80', '9.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `drive`
--
ALTER TABLE `drive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_year` (`year`);

--
-- Indexes for table `drivedetails`
--
ALTER TABLE `drivedetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_course`
--
ALTER TABLE `exam_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_question_course_id_21e40c24_fk_exam_course_id` (`course_id`);

--
-- Indexes for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_result_exam_id_6eb9dbc7_fk_exam_course_id` (`exam_id`),
  ADD KEY `exam_result_student_id_babc7762_fk_registration_student_ad_no` (`student_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indexes for table `management_event`
--
ALTER TABLE `management_event`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `management_job`
--
ALTER TABLE `management_job`
  ADD PRIMARY KEY (`d_no`);

--
-- Indexes for table `management_notification`
--
ALTER TABLE `management_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration_contact`
--
ALTER TABLE `registration_contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad_no_id` (`ad_no_id`);

--
-- Indexes for table `registration_events_applied`
--
ALTER TABLE `registration_events_applied`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_events__ad_no_id_1a877c98_fk_registrat` (`ad_no_id`),
  ADD KEY `registration_events__e_id_id_36954f60_fk_managemen` (`e_id_id`);

--
-- Indexes for table `registration_jobs_applied`
--
ALTER TABLE `registration_jobs_applied`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_jobs_ap_ad_no_id_d2becbc7_fk_registrat` (`ad_no_id`),
  ADD KEY `registration_jobs_ap_d_no_id_5ff2d270_fk_managemen` (`d_no_id`);

--
-- Indexes for table `registration_placements`
--
ALTER TABLE `registration_placements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_placeme_ad_no_id_f5b25bcc_fk_registrat` (`ad_no_id`),
  ADD KEY `registration_placements_d_no_id_bb4131ca_fk_management_job_d_no` (`d_no_id`);

--
-- Indexes for table `registration_query`
--
ALTER TABLE `registration_query`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_query_ad_no_id_8fb3048d_fk_registrat` (`ad_no_id`),
  ADD KEY `registration_query_d_no_id_ece0354d_fk_management_job_d_no` (`d_no_id`);

--
-- Indexes for table `registration_student`
--
ALTER TABLE `registration_student`
  ADD PRIMARY KEY (`ad_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `drive`
--
ALTER TABLE `drive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `drivedetails`
--
ALTER TABLE `drivedetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exam_course`
--
ALTER TABLE `exam_course`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_question`
--
ALTER TABLE `exam_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_result`
--
ALTER TABLE `exam_result`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `management_notification`
--
ALTER TABLE `management_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `registration_contact`
--
ALTER TABLE `registration_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `registration_events_applied`
--
ALTER TABLE `registration_events_applied`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `registration_jobs_applied`
--
ALTER TABLE `registration_jobs_applied`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registration_placements`
--
ALTER TABLE `registration_placements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `registration_query`
--
ALTER TABLE `registration_query`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD CONSTRAINT `exam_question_course_id_21e40c24_fk_exam_course_id` FOREIGN KEY (`course_id`) REFERENCES `exam_course` (`id`);

--
-- Constraints for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD CONSTRAINT `exam_result_exam_id_6eb9dbc7_fk_exam_course_id` FOREIGN KEY (`exam_id`) REFERENCES `exam_course` (`id`),
  ADD CONSTRAINT `exam_result_student_id_babc7762_fk` FOREIGN KEY (`student_id`) REFERENCES `registration_student` (`ad_no`);

--
-- Constraints for table `registration_contact`
--
ALTER TABLE `registration_contact`
  ADD CONSTRAINT `registration_contact_ad_no_id_a3c15044_fk` FOREIGN KEY (`ad_no_id`) REFERENCES `registration_student` (`ad_no`);

--
-- Constraints for table `registration_events_applied`
--
ALTER TABLE `registration_events_applied`
  ADD CONSTRAINT `registration_events__e_id_id_36954f60_fk_managemen` FOREIGN KEY (`e_id_id`) REFERENCES `management_event` (`e_id`),
  ADD CONSTRAINT `registration_events_applied_ad_no_id_1a877c98_fk` FOREIGN KEY (`ad_no_id`) REFERENCES `registration_student` (`ad_no`);

--
-- Constraints for table `registration_jobs_applied`
--
ALTER TABLE `registration_jobs_applied`
  ADD CONSTRAINT `registration_jobs_ap_d_no_id_5ff2d270_fk_managemen` FOREIGN KEY (`d_no_id`) REFERENCES `management_job` (`d_no`),
  ADD CONSTRAINT `registration_jobs_applied_ad_no_id_d2becbc7_fk` FOREIGN KEY (`ad_no_id`) REFERENCES `registration_student` (`ad_no`);

--
-- Constraints for table `registration_placements`
--
ALTER TABLE `registration_placements`
  ADD CONSTRAINT `registration_placements_ad_no_id_f5b25bcc_fk` FOREIGN KEY (`ad_no_id`) REFERENCES `registration_student` (`ad_no`),
  ADD CONSTRAINT `registration_placements_d_no_id_bb4131ca_fk_management_job_d_no` FOREIGN KEY (`d_no_id`) REFERENCES `management_job` (`d_no`);

--
-- Constraints for table `registration_query`
--
ALTER TABLE `registration_query`
  ADD CONSTRAINT `registration_query_ad_no_id_8fb3048d_fk` FOREIGN KEY (`ad_no_id`) REFERENCES `registration_student` (`ad_no`),
  ADD CONSTRAINT `registration_query_d_no_id_ece0354d_fk_management_job_d_no` FOREIGN KEY (`d_no_id`) REFERENCES `management_job` (`d_no`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `auto_delete_expired_notifications` ON SCHEDULE EVERY 1 DAY STARTS '2025-01-22 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM management_notification WHERE last_date < CURRENT_DATE$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
