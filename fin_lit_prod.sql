-- --------------------------------------------------------
-- Host:                         cxmgkzhk95kfgbq4.cbetxkdyhwsb.us-east-1.rds.amazonaws.com
-- Server version:               10.4.24-MariaDB-log - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6449
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for fin_lit
CREATE DATABASE IF NOT EXISTS `fin_lit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `fin_lit`;

-- Dumping structure for table fin_lit.course_completion
CREATE TABLE IF NOT EXISTS `course_completion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_completion_fk0` (`user_id`),
  CONSTRAINT `course_completion_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.course_completion: ~0 rows (approximately)

-- Dumping structure for table fin_lit.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.media: ~0 rows (approximately)

-- Dumping structure for table fin_lit.modules
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.modules: ~3 rows (approximately)
INSERT INTO `modules` (`id`, `name`, `desc`, `image`) VALUES
	(1, 'Credit Cards', 'This module will go through credit cards and its usage', 'credit_card.svg'),
	(2, 'Major Expenditure', 'This module dives deep into all the expenses that are major', 'major.svg'),
	(3, 'Rule of 72', 'This module talks about Rule of 72', '72.svg');

-- Dumping structure for table fin_lit.module_completion
CREATE TABLE IF NOT EXISTS `module_completion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completion` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_completion_fk0` (`module_id`),
  KEY `module_completion_fk1` (`user_id`),
  CONSTRAINT `module_completion_fk0` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `module_completion_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.module_completion: ~0 rows (approximately)

-- Dumping structure for table fin_lit.module_data
CREATE TABLE IF NOT EXISTS `module_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_data_fk0` (`sub_module_id`),
  CONSTRAINT `module_data_fk0` FOREIGN KEY (`sub_module_id`) REFERENCES `submodules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.module_data: ~0 rows (approximately)

-- Dumping structure for table fin_lit.module_media
CREATE TABLE IF NOT EXISTS `module_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_module_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_media_fk0` (`sub_module_id`),
  KEY `module_media_fk1` (`media_id`),
  CONSTRAINT `module_media_fk0` FOREIGN KEY (`sub_module_id`) REFERENCES `submodules` (`id`),
  CONSTRAINT `module_media_fk1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.module_media: ~0 rows (approximately)

-- Dumping structure for table fin_lit.module_quiz
CREATE TABLE IF NOT EXISTS `module_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('quiz','workbook') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'quiz',
  PRIMARY KEY (`id`),
  KEY `module_quiz_fk0` (`module_id`),
  CONSTRAINT `module_quiz_fk0` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.module_quiz: ~3 rows (approximately)
INSERT INTO `module_quiz` (`id`, `module_id`, `name`, `file_name`, `type`) VALUES
	(1, 1, 'Introductory Quiz', 'quiz_1', 'quiz'),
	(2, 1, 'Advance Quiz', 'quiz_2', 'quiz'),
	(3, 1, 'Credit Card Vocabulary', 'workbook_1', 'workbook'),
  (4, 1, 'Credit Card Statement', 'workbook_2', 'workbook'),
  (5, 2, 'Major Expenditure Test', 'test_1', 'quiz'),
  (6, 2, 'Finding A Rental', 'quiz_4', 'quiz'),
  (7, 2, 'Food Reinforcement', 'quiz_5', 'quiz'),
  (8, 2, 'Housing Reinforcement', 'quiz_6', 'quiz'),
  (9, 2, 'Rental Agreement Checklist', 'quiz_7', 'quiz'),
  (10, 2, 'Transportation Reinforcement', 'quiz_8', 'quiz'),
  (11, 2, 'Eating on Budget', 'quiz_3', 'quiz');

-- Dumping structure for table fin_lit.module_scores
CREATE TABLE IF NOT EXISTS `module_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `module_comp_id` int(11) NOT NULL,
  `score` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_scores_fk0` (`module_id`),
  KEY `module_scores_fk1` (`module_comp_id`),
  CONSTRAINT `module_scores_fk0` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `module_scores_fk1` FOREIGN KEY (`module_comp_id`) REFERENCES `module_completion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.module_scores: ~0 rows (approximately)

-- Dumping structure for table fin_lit.points
CREATE TABLE IF NOT EXISTS `points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `points_fk0` (`user_id`),
  CONSTRAINT `points_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.points: ~0 rows (approximately)

-- Dumping structure for table fin_lit.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.roles: ~0 rows (approximately)
INSERT INTO `roles` (`role_id`, `role_name`) VALUES
	(1, 'user'),
	(2, 'admin');

-- Dumping structure for table fin_lit.submodules
CREATE TABLE IF NOT EXISTS `submodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `type` enum('PPT','PDF','IMG','VID') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PPT',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submodules_fk0` (`module_id`),
  CONSTRAINT `submodules_fk0` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.submodules: ~0 rows (approximately)
INSERT INTO `submodules` (`id`, `name`, `desc`, `module_id`, `type`, `data`) VALUES
	(1, 'Introduction', 'This is the introduction', 1, 'PPT', 'https://docs.google.com/presentation/d/e/2PACX-1vRhMeFi6XXwhYt013imfabcuxSocJPzSuVxYGUBQNFNU0RdPX9XoYxyD33MxnWzQ0wrcq0TXiP-Lb88/embed?start=false&loop=false&delayms=5000'),
	(2, 'Introduction Info Sheet', 'This is the info sheet', 1, 'PDF', 'assets/modules/1/intro.pdf'),
	(3, 'Advanced Credit Card', 'These are some advanced topics', 1, 'PPT', 'https://docs.google.com/presentation/d/e/2PACX-1vRq0im-jbjM5UaUOvl1eF4TZqNivzNd5XZk1OvzY1hUbyVGbaXP_ZS6L2gx3pKW0mTzntdcmqiDVzIk/embed?start=false&loop=false&delayms=5000'),
	(4, 'Understanding Credit Cards', 'Understand them', 1, 'PDF', 'assets/modules/1/understand.pdf');

-- Dumping structure for table fin_lit.submodule_completion
CREATE TABLE IF NOT EXISTS `submodule_completion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submodule_id` int(11) NOT NULL,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completion` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submodule_completion_fk0` (`submodule_id`),
  KEY `submodule_completion_fk1` (`user_id`),
  CONSTRAINT `submodule_completion_fk0` FOREIGN KEY (`submodule_id`) REFERENCES `submodules` (`id`),
  CONSTRAINT `submodule_completion_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.submodule_completion: ~0 rows (approximately)

-- Dumping structure for table fin_lit.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `dp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_fk0` (`role_id`),
  CONSTRAINT `users_fk0` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `name`, `school`, `email`, `password`, `role_id`, `dp`, `major`, `phone`) VALUES
	('1001', 'Aman', 'UTA', '', '$pbkdf2-sha256$29000$ao2RMqYUIsSYM2YMAaB0bg$fOMLttz5/VBTS7n.al2.9gT3mQA3M/WHHuhfTlVd.70', 1, 'https://res.cloudinary.com/dtvhyzofv/image/upload/v1647144583/banter/dp/user_awjxuf.png', '', ''),
	('1001750503', 'Aneesh Melkot', 'UTA', '', '$pbkdf2-sha256$29000$AiDE.L/Xeu8dI2TMube2Ng$f7PgXZ2/whPxPLDc9jaQhBrXREBRalFfh3aAaTMTONU', 1, 'https://res.cloudinary.com/dtvhyzofv/image/upload/v1647144583/banter/dp/user_awjxuf.png', '', ''),
	('1001773798', 'Nabeel Eusufzai', 'University of Texas at Arlington', '', '$pbkdf2-sha256$29000$vPee837v/X9vzZmT8l5r7Q$RmFVFRtDBoR6nwkh/HAzoENzpj8AgWCJkRqh50of/JA', 1, 'https://res.cloudinary.com/dtvhyzofv/image/upload/v1647144583/banter/dp/user_awjxuf.png', '', ''),
	('1001860116', 'Tabitha Griffin', 'University of Texas at Arlington ', '', '$pbkdf2-sha256$29000$XisFYKxVCuFci/Fea40RAg$Y6BwRZBqjGwhsT0vTlvHzGzqGfGiGHAH0KR5Yg2wDVc', 1, 'https://res.cloudinary.com/dtvhyzofv/image/upload/v1647144583/banter/dp/user_awjxuf.png', '', ''),
	('100188', 'Lavin', 'University of Texas at Arlington ', '', '$pbkdf2-sha256$29000$ovQ.R4iRMmYsZcxZ6z1HaA$qm38AGregCny.04IJcjqO70mSog1YnAq/9QXJGmVMhk', 1, 'https://res.cloudinary.com/dtvhyzofv/image/upload/v1647144583/banter/dp/user_awjxuf.png', '', ''),
	('101', 'Shashank', 'UTA ', '', '$pbkdf2-sha256$29000$rtX6fy8FwDhHCMF4L0VIiQ$WK9/WBjK.E/XxwDoS0WqUCibKmUfuxLqv.CzJ3Ld6nQ', 1, 'https://res.cloudinary.com/dtvhyzofv/image/upload/v1647144583/banter/dp/user_awjxuf.png', '', '');

-- Dumping structure for table fin_lit.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fin_lit.videos: ~7 rows (approximately)
INSERT INTO `videos` (`id`, `title`, `description`, `file_name`, `cover`) VALUES
	(1, 'Introduction Video', 'Introduction Video', 'intro.mov', 'intro.png'),
	(2, 'UTA Off Campus Apartment Options', 'UTA Off Campus Apartment Options', 'offcampus_apts.mp4', 'offcampus_apts.png'),
	(3, 'Rent a car', 'Rent a car', 'rideshare.mov', 'rideshare.png'),
	(4, 'Arlington VIA service', 'Arlington VIA service', 'via.mp4', 'via.png'),
	(5, 'Budget Friendly Gyms for UTA Students', 'Budget Friendly Gyms for UTA Students', 'gym.mov', 'gym.png'),
	(6, 'Apple Education Pricing', 'Apple Education Pricing', 'apple.mp4', 'apple.png'),
	(7, 'Comparing Textbook Prices', 'Comparing Textbook Prices', 'textbook.mp4', 'textbook.png'),
	(8, 'Free Resume Help for UTA Students', 'Free Resume Help for UTA Students', 'resume.mp4', 'resume.png');

-- Dumping structure for table fin_lit.quiz_1
CREATE TABLE IF NOT EXISTS `quiz_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `q1` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q2` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q3` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q4` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q5` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q6` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q7` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q8` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q9` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q10` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q11` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q12` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q13` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q14` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q15` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q16` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q17` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q18` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q19` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q20` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q21` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q22` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quiz_1_users` (`student_id`),
  CONSTRAINT `FK_quiz_1_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bjspdwgq1ftoekjz.quiz_1: ~0 rows (approximately)
INSERT INTO `quiz_1` (`id`, `student_id`, `semester`, `q1`, `q2`, `q3`, `q4`, `q5`, `q6`, `q7`, `q8`, `q9`, `q10`, `q11`, `q12`, `q13`, `q14`, `q15`, `q16`, `q17`, `q18`, `q19`, `q20`, `q21`, `q22`, `score`) VALUES
	(1, '1001750503', NULL, 'dsgsdg', 'sagdsg', 'sdgsdg', 'sagsfg', 'sfgsfg', 'asdfgfsg', 'afsgfsag', 'afgfag', 'adsgsagf', 'fgafg', 'agsafg', 'afsgfg', 'afsgsafg', 'asgffag', 'agadgfr', 'fgfasgfsa', 'agfag', 'afsgafsg', 'asgsg', 'asgsagr', 'asfgsag', 'sagfsg', 95);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- Dumping structure for table fin_lit.quiz_2
CREATE TABLE IF NOT EXISTS `quiz_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `q1` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q2` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q3` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q4` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q5` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q6` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q7` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q8` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q9` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q10` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q11` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q12` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q13` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q14` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q15` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q16` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q17` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q18` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q19` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q20` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quiz_2_users` (`student_id`),
  CONSTRAINT `FK_quiz_2_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table fin_lit.workbook_1
CREATE TABLE IF NOT EXISTS `workbook_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `q1` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q2` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q3` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q4` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q5` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q6` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q7` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q8` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q9` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q10` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q11` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q12` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q13` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q14` varchar(30) COLLATE utf8mb4_unicode_ci NULL,
  `q15a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q15b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q15c` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q16a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q16b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q16c` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q17a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q17b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q17c` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q18a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q18b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q18c` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q19a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q19b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q19c` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q20a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q20b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q20c` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q21` varchar(1000) COLLATE utf8mb4_unicode_ci NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_workbook_1_users` (`student_id`),
  CONSTRAINT `FK_workbook_1_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table fin_lit.workbook_2
CREATE TABLE IF NOT EXISTS `workbook_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) DEFAULT NULL,  
  `q1a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q1b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q2a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q2b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q3a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q3b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q4a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q4b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q5a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q5b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q6a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q6b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q7a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q7b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q8a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q8b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q9a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q9b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q10a` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q10b` varchar(100) COLLATE utf8mb4_unicode_ci NULL,
  `q11` varchar(1000) COLLATE utf8mb4_unicode_ci NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_workbook_2_users` (`student_id`),
  CONSTRAINT `FK_workbook_2_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table fin_lit.quiz_3
CREATE TABLE IF NOT EXISTS `quiz_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) DEFAULT NULL,  
  `q1` text COLLATE utf8mb4_unicode_ci NULL,
  `q2` text COLLATE utf8mb4_unicode_ci NULL,
  `q3` text COLLATE utf8mb4_unicode_ci NULL,
  `q4` text COLLATE utf8mb4_unicode_ci NULL,
  `q5` text COLLATE utf8mb4_unicode_ci NULL,
  `q6` text COLLATE utf8mb4_unicode_ci NULL,
  `q7` text COLLATE utf8mb4_unicode_ci NULL,
  `q8` text COLLATE utf8mb4_unicode_ci NULL,
  `q9` text COLLATE utf8mb4_unicode_ci NULL,
  `q10` text COLLATE utf8mb4_unicode_ci NULL,
  `q11` text COLLATE utf8mb4_unicode_ci NULL,
  `q12` text COLLATE utf8mb4_unicode_ci NULL,
  `q13` text COLLATE utf8mb4_unicode_ci NULL,
  `q14` text COLLATE utf8mb4_unicode_ci NULL,
  `q15` text COLLATE utf8mb4_unicode_ci NULL,
  `q16` text COLLATE utf8mb4_unicode_ci NULL,
  `q17` text COLLATE utf8mb4_unicode_ci NULL,
  `q18` text COLLATE utf8mb4_unicode_ci NULL,
  `q19` text COLLATE utf8mb4_unicode_ci NULL,
  `q20` text COLLATE utf8mb4_unicode_ci NULL,
  `q21` text COLLATE utf8mb4_unicode_ci NULL,
  `q22` text COLLATE utf8mb4_unicode_ci NULL,
  `q23` text COLLATE utf8mb4_unicode_ci NULL,
  `q24` text COLLATE utf8mb4_unicode_ci NULL,
  `q25` text COLLATE utf8mb4_unicode_ci NULL,
  `q26` text COLLATE utf8mb4_unicode_ci NULL,
  `q27` text COLLATE utf8mb4_unicode_ci NULL,
  `q28` text COLLATE utf8mb4_unicode_ci NULL,
  `q29` text COLLATE utf8mb4_unicode_ci NULL,
  `q30` text COLLATE utf8mb4_unicode_ci NULL,
  `q31` text COLLATE utf8mb4_unicode_ci NULL,
  `q32` text COLLATE utf8mb4_unicode_ci NULL,
  `q33` text COLLATE utf8mb4_unicode_ci NULL,
  `q34` text COLLATE utf8mb4_unicode_ci NULL,
  `q35` text COLLATE utf8mb4_unicode_ci NULL,
  `q36` text COLLATE utf8mb4_unicode_ci NULL,
  `q37` text COLLATE utf8mb4_unicode_ci NULL,  
  `q38` text COLLATE utf8mb4_unicode_ci NULL,
  `q39a` text COLLATE utf8mb4_unicode_ci NULL,
  `q39b` text COLLATE utf8mb4_unicode_ci NULL,
  `q39c` text COLLATE utf8mb4_unicode_ci NULL,
  `q39d` text COLLATE utf8mb4_unicode_ci NULL,

  `q40a` text COLLATE utf8mb4_unicode_ci NULL,
  `q40b` text COLLATE utf8mb4_unicode_ci NULL,
  `q40c` text COLLATE utf8mb4_unicode_ci NULL,
  `q40d` text COLLATE utf8mb4_unicode_ci NULL,
  `q41a` text COLLATE utf8mb4_unicode_ci NULL,
  `q41b` text COLLATE utf8mb4_unicode_ci NULL,
  `q41c` text COLLATE utf8mb4_unicode_ci NULL,
  `q41d` text COLLATE utf8mb4_unicode_ci NULL,
  `q42a` text COLLATE utf8mb4_unicode_ci NULL,
  `q42b` text COLLATE utf8mb4_unicode_ci NULL,
  `q42c` text COLLATE utf8mb4_unicode_ci NULL,
  `q42d` text COLLATE utf8mb4_unicode_ci NULL,
  `q43a` text COLLATE utf8mb4_unicode_ci NULL,
  `q43b` text COLLATE utf8mb4_unicode_ci NULL,
  `q43c` text COLLATE utf8mb4_unicode_ci NULL,
  `q43d` text COLLATE utf8mb4_unicode_ci NULL,
  `q44a` text COLLATE utf8mb4_unicode_ci NULL,
  `q44b` text COLLATE utf8mb4_unicode_ci NULL,
  `q44c` text COLLATE utf8mb4_unicode_ci NULL,
  `q44d` text COLLATE utf8mb4_unicode_ci NULL,
  `q45a` text COLLATE utf8mb4_unicode_ci NULL,
  `q45b` text COLLATE utf8mb4_unicode_ci NULL,
  `q45c` text COLLATE utf8mb4_unicode_ci NULL,
  `q45d` text COLLATE utf8mb4_unicode_ci NULL,
  `q46a` text COLLATE utf8mb4_unicode_ci NULL,
  `q46b` text COLLATE utf8mb4_unicode_ci NULL,
  `q46c` text COLLATE utf8mb4_unicode_ci NULL,
  `q46d` text COLLATE utf8mb4_unicode_ci NULL,
  `q47a` text COLLATE utf8mb4_unicode_ci NULL,
  `q47b` text COLLATE utf8mb4_unicode_ci NULL,
  `q47c` text COLLATE utf8mb4_unicode_ci NULL,
  `q47d` text COLLATE utf8mb4_unicode_ci NULL,
  `q48a` text COLLATE utf8mb4_unicode_ci NULL,
  `q48b` text COLLATE utf8mb4_unicode_ci NULL,
  `q48c` text COLLATE utf8mb4_unicode_ci NULL,
  `q48d` text COLLATE utf8mb4_unicode_ci NULL,
  `q49a` text COLLATE utf8mb4_unicode_ci NULL,
  `q49b` text COLLATE utf8mb4_unicode_ci NULL,
  `q49c` text COLLATE utf8mb4_unicode_ci NULL,
  `q49d` text COLLATE utf8mb4_unicode_ci NULL,
  `q50a` text COLLATE utf8mb4_unicode_ci NULL,
  `q50b` text COLLATE utf8mb4_unicode_ci NULL,
  `q50c` text COLLATE utf8mb4_unicode_ci NULL,
  `q50d` text COLLATE utf8mb4_unicode_ci NULL,
  `q51a` text COLLATE utf8mb4_unicode_ci NULL,
  `q51b` text COLLATE utf8mb4_unicode_ci NULL,
  `q51c` text COLLATE utf8mb4_unicode_ci NULL,
  `q51d` text COLLATE utf8mb4_unicode_ci NULL,
  `q52a` text COLLATE utf8mb4_unicode_ci NULL,
  `q52b` text COLLATE utf8mb4_unicode_ci NULL,
  `q52c` text COLLATE utf8mb4_unicode_ci NULL,
  `q52d` text COLLATE utf8mb4_unicode_ci NULL,
  `q53a` text COLLATE utf8mb4_unicode_ci NULL,
  `q53b` text COLLATE utf8mb4_unicode_ci NULL,
  `q53c` text COLLATE utf8mb4_unicode_ci NULL,
  `q53d` text COLLATE utf8mb4_unicode_ci NULL,
  
  `q54` text COLLATE utf8mb4_unicode_ci NULL,
  `q55` text COLLATE utf8mb4_unicode_ci NULL,
  
  `q56a` text COLLATE utf8mb4_unicode_ci NULL,
  `q56b` text COLLATE utf8mb4_unicode_ci NULL,
  `q56c` text COLLATE utf8mb4_unicode_ci NULL,
  `q57` text COLLATE utf8mb4_unicode_ci NULL,
  
  `q58a` text COLLATE utf8mb4_unicode_ci NULL,
  `q58b` text COLLATE utf8mb4_unicode_ci NULL,
  `q59a` text COLLATE utf8mb4_unicode_ci NULL,
  `q59b` text COLLATE utf8mb4_unicode_ci NULL,
  
  `q60a` text COLLATE utf8mb4_unicode_ci NULL,
  `q60b` text COLLATE utf8mb4_unicode_ci NULL,
  `q60c` text COLLATE utf8mb4_unicode_ci NULL,
  
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quiz_3_users` (`student_id`),
  CONSTRAINT `FK_quiz_3_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table fin_lit.quiz_8
CREATE TABLE IF NOT EXISTS `quiz_8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) DEFAULT NULL,  
  `q1` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q2` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q3` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q4` text  COLLATE utf8mb4_unicode_ci NULL,
  `q5` text  COLLATE utf8mb4_unicode_ci NULL,
  `q6` text  COLLATE utf8mb4_unicode_ci NULL,
  `q7` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8n1a` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8n1d` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8p1a` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8p1d` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8n2a` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8n2d` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8p2a` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8p2d` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8n3a` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8n3d` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8p3a` text  COLLATE utf8mb4_unicode_ci NULL,
  `q8p3d` text  COLLATE utf8mb4_unicode_ci NULL,
  `q9` text  COLLATE utf8mb4_unicode_ci NULL,
  `q10` text  COLLATE utf8mb4_unicode_ci NULL,
  `q11` text  COLLATE utf8mb4_unicode_ci NULL,
  
  
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quiz_8_users` (`student_id`),
  CONSTRAINT `FK_quiz_8_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dumping structure for table fin_lit.test_1
CREATE TABLE IF NOT EXISTS `quiz_8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int(11) DEFAULT NULL,  
  `q1` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q2` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q3` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q4` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q5` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q6` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q7` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q8` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q9` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q10` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q11` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q12` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q13` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q14` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q15` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q16` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q17` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q18` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q19` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q20` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q21` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q22` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q23` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q24` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q25` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q26` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q27` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q28` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q29` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q30` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q31` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q32` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q33` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q34` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q35` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q36` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q37` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q38` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q39` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q40` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q41` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q42` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q43` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q44` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q45` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q46` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q47` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
  `q48` varchar(100)  COLLATE utf8mb4_unicode_ci NULL,
    
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_test_1_users` (`student_id`),
  CONSTRAINT `FK_test_1_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

