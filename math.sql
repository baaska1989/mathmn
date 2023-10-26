-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: qwik1
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_code_unique` (`code`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprehension_passages`
--

DROP TABLE IF EXISTS `comprehension_passages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprehension_passages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comprehension_passages_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprehension_passages`
--

LOCK TABLES `comprehension_passages` WRITE;
/*!40000 ALTER TABLE `comprehension_passages` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprehension_passages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulty_levels`
--

DROP TABLE IF EXISTS `difficulty_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `difficulty_levels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `difficulty_levels_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty_levels`
--

LOCK TABLES `difficulty_levels` WRITE;
/*!40000 ALTER TABLE `difficulty_levels` DISABLE KEYS */;
INSERT INTO `difficulty_levels` VALUES (1,'Very Easy','VERYEASY',1,NULL,NULL,NULL),(2,'Easy','EASY',1,NULL,NULL,NULL),(3,'Medium','MEDIUM',1,NULL,NULL,NULL),(4,'High','HIGH',1,NULL,NULL,NULL),(5,'Very High','VERYHIGH',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `difficulty_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_questions`
--

DROP TABLE IF EXISTS `exam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_questions` (
  `exam_id` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `exam_section_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`exam_id`,`question_id`),
  KEY `exam_questions_question_id_foreign` (`question_id`),
  KEY `exam_questions_exam_section_id_index` (`exam_section_id`),
  CONSTRAINT `exam_questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_questions`
--

LOCK TABLES `exam_questions` WRITE;
/*!40000 ALTER TABLE `exam_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_schedules`
--

DROP TABLE IF EXISTS `exam_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `schedule_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT '5',
  `send_email` tinyint(1) NOT NULL DEFAULT '0',
  `settings` json DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_schedules_code_unique` (`code`),
  KEY `exam_schedules_exam_id_foreign` (`exam_id`),
  CONSTRAINT `exam_schedules_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_schedules`
--

LOCK TABLES `exam_schedules` WRITE;
/*!40000 ALTER TABLE `exam_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_sections`
--

DROP TABLE IF EXISTS `exam_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `total_questions` int(10) unsigned NOT NULL DEFAULT '0',
  `total_duration` int(10) unsigned DEFAULT NULL,
  `correct_marks` double(10,2) DEFAULT NULL,
  `total_marks` double(10,2) DEFAULT NULL,
  `negative_marking_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `negative_marks` double(10,2) DEFAULT NULL,
  `section_cutoff` int(10) unsigned DEFAULT NULL,
  `section_order` int(10) unsigned NOT NULL DEFAULT '1',
  `assign_examiner` int(10) unsigned NOT NULL DEFAULT '0',
  `examiner_id` bigint(20) unsigned DEFAULT NULL,
  `examined` tinyint(1) NOT NULL DEFAULT '0',
  `examined_at` datetime DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_at` datetime DEFAULT NULL,
  `approved_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_sections_exam_id_foreign` (`exam_id`),
  CONSTRAINT `exam_sections_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_sections`
--

LOCK TABLES `exam_sections` WRITE;
/*!40000 ALTER TABLE `exam_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_session_questions`
--

DROP TABLE IF EXISTS `exam_session_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_session_questions` (
  `exam_session_id` bigint(20) unsigned NOT NULL,
  `sno` bigint(20) unsigned NOT NULL DEFAULT '1',
  `question_id` bigint(20) unsigned NOT NULL,
  `exam_section_id` bigint(20) unsigned NOT NULL,
  `original_question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `user_answer` text COLLATE utf8mb4_unicode_ci,
  `correct_answer` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unanswered',
  `is_correct` tinyint(1) DEFAULT NULL,
  `time_taken` int(11) NOT NULL DEFAULT '0',
  `marks_earned` double(5,2) NOT NULL DEFAULT '0.00',
  `marks_deducted` double(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`exam_session_id`,`question_id`),
  KEY `exam_session_questions_question_id_foreign` (`question_id`),
  CONSTRAINT `exam_session_questions_exam_session_id_foreign` FOREIGN KEY (`exam_session_id`) REFERENCES `exam_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_session_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_session_questions`
--

LOCK TABLES `exam_session_questions` WRITE;
/*!40000 ALTER TABLE `exam_session_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_session_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_session_sections`
--

DROP TABLE IF EXISTS `exam_session_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_session_sections` (
  `sno` bigint(20) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_session_id` bigint(20) unsigned NOT NULL,
  `exam_section_id` bigint(20) unsigned NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `total_time_taken` int(11) NOT NULL DEFAULT '0',
  `current_question` int(11) NOT NULL DEFAULT '0',
  `results` json DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_visited',
  PRIMARY KEY (`exam_session_id`,`exam_section_id`),
  KEY `exam_session_sections_sno_index` (`sno`),
  KEY `exam_session_sections_status_index` (`status`),
  CONSTRAINT `exam_session_sections_exam_session_id_foreign` FOREIGN KEY (`exam_session_id`) REFERENCES `exam_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_session_sections`
--

LOCK TABLES `exam_session_sections` WRITE;
/*!40000 ALTER TABLE `exam_session_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_session_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_sessions`
--

DROP TABLE IF EXISTS `exam_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `exam_schedule_id` bigint(20) unsigned DEFAULT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime NOT NULL,
  `total_time_taken` int(11) NOT NULL DEFAULT '0',
  `current_section` int(11) NOT NULL DEFAULT '0',
  `current_question` int(11) NOT NULL DEFAULT '0',
  `results` json DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'started',
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_sessions_code_unique` (`code`),
  KEY `exam_sessions_status_index` (`status`),
  KEY `exam_sessions_user_id_foreign` (`user_id`),
  KEY `exam_sessions_exam_id_foreign` (`exam_id`),
  CONSTRAINT `exam_sessions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_sessions`
--

LOCK TABLES `exam_sessions` WRITE;
/*!40000 ALTER TABLE `exam_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_types`
--

DROP TABLE IF EXISTS `exam_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'http://placehold.it/100x100',
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '444444',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_types_code_unique` (`code`),
  UNIQUE KEY `exam_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_types`
--

LOCK TABLES `exam_types` WRITE;
/*!40000 ALTER TABLE `exam_types` DISABLE KEYS */;
INSERT INTO `exam_types` VALUES (1,'aaaa','etp_lkC7Y3ymSY2','aaaa','aa','http://placehold.it/100x100','444444',1,'2023-10-23 15:58:06','2023-10-23 15:58:06',NULL);
/*!40000 ALTER TABLE `exam_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `exam_type_id` int(11) NOT NULL,
  `exam_mode` enum('objective','subjective','mixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'objective',
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `exam_template_id` bigint(20) unsigned DEFAULT NULL,
  `total_marks` double(10,2) DEFAULT NULL,
  `total_duration` int(10) unsigned NOT NULL DEFAULT '0',
  `total_questions` int(10) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `price` bigint(20) unsigned DEFAULT NULL,
  `can_redeem` tinyint(1) NOT NULL DEFAULT '0',
  `points_required` int(10) unsigned DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exams_slug_unique` (`slug`),
  UNIQUE KEY `exams_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,'Practice Sets','practice_sets',NULL,1,1,NULL,NULL),(2,'Quizzes','quizzes',NULL,2,1,NULL,NULL),(3,'Lessons','lessons',NULL,3,1,NULL,NULL),(4,'Videos','videos',NULL,4,1,NULL,NULL),(5,'Exams','exams',NULL,5,1,NULL,NULL);
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '1',
  `skill_id` bigint(20) unsigned NOT NULL,
  `topic_id` bigint(20) unsigned DEFAULT NULL,
  `difficulty_level_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `preferences` json DEFAULT NULL,
  `avg_read_time` int(11) NOT NULL DEFAULT '0',
  `total_reads` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lessons_code_unique` (`code`),
  KEY `lessons_skill_id_foreign` (`skill_id`),
  KEY `lessons_topic_id_foreign` (`topic_id`),
  CONSTRAINT `lessons_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`),
  CONSTRAINT `lessons_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2018_11_06_222923_create_transactions_table',1),(5,'2018_11_07_192923_create_transfers_table',1),(6,'2018_11_07_202152_update_transfers_table',1),(7,'2018_11_15_124230_create_wallets_table',1),(8,'2018_11_19_164609_update_transactions_table',1),(9,'2018_11_20_133759_add_fee_transfers_table',1),(10,'2018_11_22_131953_add_status_transfers_table',1),(11,'2018_11_22_133438_drop_refund_transfers_table',1),(12,'2019_05_13_111553_update_status_transfers_table',1),(13,'2019_06_25_103755_add_exchange_status_transfers_table',1),(14,'2019_07_29_184926_decimal_places_wallets_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_10_02_193759_add_discount_transfers_table',1),(17,'2019_12_14_000001_create_personal_access_tokens_table',1),(18,'2020_10_30_193412_add_meta_wallets_table',1),(19,'2021_01_19_122742_create_sessions_table',1),(20,'2021_01_26_103623_create_permission_tables',1),(21,'2021_01_26_145101_create_user_groups_table',1),(22,'2021_02_01_111346_create_categories_table',1),(23,'2021_02_01_123941_create_sub_categories_table',1),(24,'2021_03_11_165355_create_sections_table',1),(25,'2021_03_11_165427_create_skills_table',1),(26,'2021_03_11_165437_create_topics_table',1),(27,'2021_03_11_170421_create_difficulty_levels_table',1),(28,'2021_03_11_170645_create_question_types_table',1),(29,'2021_03_11_171040_create_comprehension_passages_table',1),(30,'2021_03_11_171818_create_questions_table',1),(31,'2021_05_06_170328_create_sub_category_types_table',1),(32,'2021_05_13_105405_create_quiz_types_table',1),(33,'2021_05_13_133602_create_quizzes_table',1),(34,'2021_05_13_162316_create_quiz_questions_table',1),(35,'2021_05_13_174530_create_practice_sets_table',1),(36,'2021_05_13_174705_create_practice_set_questions_table',1),(37,'2021_05_17_165018_create_settings_table',1),(38,'2021_05_18_094439_create_general_settings',1),(39,'2021_05_20_120637_create_sub_category_sections_table',1),(40,'2021_05_24_115523_create_practice_sessions_table',1),(41,'2021_05_25_153658_create_practice_session_questions',1),(42,'2021_06_06_121703_create_quiz_sessions_table',1),(43,'2021_06_06_122342_create_quiz_session_questions_table',1),(44,'2021_06_16_130734_create_quiz_schedules_table',1),(45,'2021_06_18_120842_create_user_group_users_table',1),(46,'2021_06_18_121246_create_user_group_quiz_schedules_table',1),(47,'2021_09_18_121222_create_tags_table',1),(48,'2021_09_20_065115_create_taggables_table',1),(49,'2021_10_18_064312_create_top_bar_settings',1),(50,'2021_10_18_072244_create_stat_settings',1),(51,'2021_10_18_092059_create_cta_settings',1),(52,'2021_10_18_100722_create_feature_settings',1),(53,'2021_10_18_100740_create_testimonial_settings',1),(54,'2021_11_11_051939_modify_home_page_hero_settings',1),(55,'2021_11_11_082743_create_category_settings',1),(56,'2021_11_11_095920_footer_settings',1),(57,'2021_11_15_165120_create_theme_settings',1),(58,'2021_11_22_074935_create_videos_table',1),(59,'2021_11_22_075107_create_lessons_table',1),(60,'2021_11_25_083402_create_practice_lessons_table',1),(61,'2021_11_30_093225_create_license_settings',1),(62,'2021_12_11_085821_create_practice_videos_table',1),(63,'2021_12_14_124247_add_columns_to_quiz_types_table',1),(64,'2021_12_15_124247_add_preferences_column_to_users_table',1),(65,'2021_12_16_102442_add_sno_column_to_quiz_session_questions_table',1),(66,'2021_12_17_102442_add_paid_column_to_practice_sets_table',1),(67,'2022_01_26_085924_create_plans_table',1),(68,'2022_01_26_173546_create_features_table',1),(69,'2022_01_26_173624_create_plan_features_table',1),(70,'2022_01_28_064934_create_payments_table',1),(71,'2022_01_28_073453_create_subscriptions_table',1),(72,'2022_01_28_164017_create_billing_settings',1),(73,'2022_01_28_164025_create_payment_settings',1),(74,'2022_01_29_145619_create_tax_settings',1),(75,'2022_02_01_083750_create_bank_settings',1),(76,'2022_02_01_093000_create_razorpay_settings',1),(77,'2022_03_17_075120_create_exam_types_table',1),(78,'2022_03_17_083916_create_exams_table',1),(79,'2022_03_18_133511_create_exam_sections_table',1),(80,'2022_03_18_141450_create_exam_questions_table',1),(81,'2022_03_19_130734_create_exam_schedules_table',1),(82,'2022_03_19_151246_create_user_group_exam_schedules_table',1),(83,'2022_03_20_075827_create_exam_sessions_table',1),(84,'2022_03_20_082540_create_exam_session_sections_table',1),(85,'2022_03_20_102540_create_exam_session_questions_table',1),(86,'2022_04_01_065832_create_pay_pal_settings',1),(87,'2022_04_01_065855_create_stripe_settings',1),(88,'2022_07_04_094828_add_cascades_to_existing_tables',1),(89,'2022_07_04_102504_add_user_delete_cascades',1),(90,'2022_07_04_102536_add_quiz_delete_cascades',1),(91,'2022_07_04_102605_add_practice_set_delete_cascades',1),(92,'2022_07_04_103832_add_exam_delete_cascades',1),(93,'2022_07_08_104218_add_question_delete_cascades',1),(94,'2022_07_12_085926_add_plan_delete_cascades',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `total_amount` double(8,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_processor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json DEFAULT NULL,
  `status` enum('created','pending','success','failed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_payment_id_unique` (`payment_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `status` (`status`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_plan_id_foreign` (`plan_id`),
  CONSTRAINT `payments_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_features`
--

DROP TABLE IF EXISTS `plan_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_features` (
  `plan_id` bigint(20) unsigned NOT NULL,
  `feature_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`plan_id`,`feature_id`),
  KEY `plan_features_feature_id_foreign` (`feature_id`),
  CONSTRAINT `plan_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plan_features_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_features`
--

LOCK TABLES `plan_features` WRITE;
/*!40000 ALTER TABLE `plan_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `duration` int(11) NOT NULL,
  `price` bigint(20) unsigned NOT NULL DEFAULT '0',
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `has_trial` tinyint(1) NOT NULL DEFAULT '0',
  `trial_days` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_restrictions` tinyint(1) NOT NULL DEFAULT '0',
  `settings` json DEFAULT NULL,
  `sort_order` bigint(20) unsigned NOT NULL DEFAULT '1',
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_code_unique` (`code`),
  KEY `plans_category_type_category_id_index` (`category_type`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_lessons`
--

DROP TABLE IF EXISTS `practice_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practice_lessons` (
  `lesson_id` bigint(20) unsigned NOT NULL,
  `skill_id` bigint(20) unsigned NOT NULL,
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`lesson_id`,`skill_id`,`sub_category_id`),
  KEY `practice_lessons_skill_id_foreign` (`skill_id`),
  KEY `practice_lessons_sub_category_id_foreign` (`sub_category_id`),
  CONSTRAINT `practice_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `practice_lessons_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE,
  CONSTRAINT `practice_lessons_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_lessons`
--

LOCK TABLES `practice_lessons` WRITE;
/*!40000 ALTER TABLE `practice_lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_session_questions`
--

DROP TABLE IF EXISTS `practice_session_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practice_session_questions` (
  `practice_session_id` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `original_question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `user_answer` text COLLATE utf8mb4_unicode_ci,
  `correct_answer` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unanswered',
  `is_correct` tinyint(1) DEFAULT NULL,
  `time_taken` int(11) NOT NULL DEFAULT '0',
  `points_earned` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`practice_session_id`,`question_id`),
  KEY `practice_session_questions_question_id_foreign` (`question_id`),
  CONSTRAINT `practice_session_questions_practice_session_id_foreign` FOREIGN KEY (`practice_session_id`) REFERENCES `practice_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `practice_session_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_session_questions`
--

LOCK TABLES `practice_session_questions` WRITE;
/*!40000 ALTER TABLE `practice_session_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_session_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_sessions`
--

DROP TABLE IF EXISTS `practice_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practice_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `practice_set_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `total_time_taken` int(11) NOT NULL DEFAULT '0',
  `percentage_completed` decimal(5,2) NOT NULL DEFAULT '0.00',
  `total_points_earned` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'started',
  `completed_at` datetime DEFAULT NULL,
  `results` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `practice_sessions_code_unique` (`code`),
  KEY `practice_sessions_status_index` (`status`),
  KEY `practice_sessions_user_id_foreign` (`user_id`),
  KEY `practice_sessions_practice_set_id_foreign` (`practice_set_id`),
  CONSTRAINT `practice_sessions_practice_set_id_foreign` FOREIGN KEY (`practice_set_id`) REFERENCES `practice_sets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `practice_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_sessions`
--

LOCK TABLES `practice_sessions` WRITE;
/*!40000 ALTER TABLE `practice_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_set_questions`
--

DROP TABLE IF EXISTS `practice_set_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practice_set_questions` (
  `practice_set_id` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`practice_set_id`,`question_id`),
  KEY `practice_set_questions_question_id_foreign` (`question_id`),
  CONSTRAINT `practice_set_questions_practice_set_id_foreign` FOREIGN KEY (`practice_set_id`) REFERENCES `practice_sets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `practice_set_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_set_questions`
--

LOCK TABLES `practice_set_questions` WRITE;
/*!40000 ALTER TABLE `practice_set_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_set_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_sets`
--

DROP TABLE IF EXISTS `practice_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practice_sets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `skill_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `total_questions` int(10) unsigned NOT NULL DEFAULT '0',
  `auto_grading` tinyint(1) NOT NULL DEFAULT '1',
  `correct_marks` int(10) unsigned DEFAULT NULL,
  `allow_rewards` tinyint(1) NOT NULL DEFAULT '1',
  `settings` json DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `price` bigint(20) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `practice_sets_slug_unique` (`slug`),
  UNIQUE KEY `practice_sets_code_unique` (`code`),
  KEY `practice_sets_skill_id_foreign` (`skill_id`),
  KEY `practice_sets_sub_category_id_foreign` (`sub_category_id`),
  CONSTRAINT `practice_sets_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`),
  CONSTRAINT `practice_sets_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_sets`
--

LOCK TABLES `practice_sets` WRITE;
/*!40000 ALTER TABLE `practice_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_videos`
--

DROP TABLE IF EXISTS `practice_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practice_videos` (
  `video_id` bigint(20) unsigned NOT NULL,
  `skill_id` bigint(20) unsigned NOT NULL,
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`video_id`,`skill_id`,`sub_category_id`),
  KEY `practice_videos_skill_id_foreign` (`skill_id`),
  KEY `practice_videos_sub_category_id_foreign` (`sub_category_id`),
  CONSTRAINT `practice_videos_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE,
  CONSTRAINT `practice_videos_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `practice_videos_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_videos`
--

LOCK TABLES `practice_videos` WRITE;
/*!40000 ALTER TABLE `practice_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_types`
--

DROP TABLE IF EXISTS `question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_types_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_types`
--

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;
INSERT INTO `question_types` VALUES (1,'Multiple Choice Single Answer','MSA','objective','msa.png','This question type is easy to set up and is the most frequent MCQ question in online exams. Users are allowed to pick just one answer from a list of given options.',1,NULL,NULL,NULL),(2,'Multiple Choice Multiple Answers','MMA','objective','mma.png','Multiple Choice Multiple Answers type question allows users to select one or several answers from a list of given options.',1,NULL,NULL,NULL),(3,'True or False','TOF','objective','tof.png','A true or false question consists of a statement that requires a true or false response. We can also format the options such as: Yes/No, Correct/Incorrect, and Agree/Disagree.',1,NULL,NULL,NULL),(4,'Short Answer','SAQ','objective','saq.png','Short answer questions allow users to provide text or numeric answers. These responses will be validated against the provided possible answers.',1,NULL,NULL,NULL),(5,'Match the Following','MTF','objective','mtf.png','A matching question is two adjacent lists of related words, phrases, pictures, or symbols. Each item in one list is paired with at least one item in the other list.',1,NULL,NULL,NULL),(6,'Ordering/Sequence','ORD','objective','ord.png','An ordering/sequence question consists of a scrambled list of related words, phrases, pictures, or symbols. The User needs to arrange them in a logical order/sequence.',1,NULL,NULL,NULL),(7,'Fill in the Blanks','FIB','objective','fib.png','A Fill in the Blank question consists of a phrase, sentence, or paragraph with a blank space where a student provides the missing word or words.',1,NULL,NULL,NULL),(8,'Long Answer/Paragraph','LAQ','subjective','laq.png','In Long answer or paragraph question type is equivalent to essay writing where a student provides a text box to write his response.',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_type_id` bigint(20) unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  `correct_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_marks` int(11) NOT NULL DEFAULT '1',
  `default_time` int(11) NOT NULL DEFAULT '60',
  `skill_id` bigint(20) unsigned NOT NULL,
  `topic_id` bigint(20) unsigned DEFAULT NULL,
  `difficulty_level_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `preferences` json DEFAULT NULL,
  `has_attachment` tinyint(1) NOT NULL DEFAULT '0',
  `attachment_type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprehension_passage_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_options` json DEFAULT NULL,
  `solution` text COLLATE utf8mb4_unicode_ci,
  `solution_video` json DEFAULT NULL,
  `hint` text COLLATE utf8mb4_unicode_ci,
  `avg_time_taken` int(11) NOT NULL DEFAULT '0',
  `total_attempts` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_code_unique` (`code`),
  KEY `questions_skill_id_foreign` (`skill_id`),
  KEY `questions_comprehension_passage_id_foreign` (`comprehension_passage_id`),
  KEY `questions_topic_id_foreign` (`topic_id`),
  CONSTRAINT `questions_comprehension_passage_id_foreign` FOREIGN KEY (`comprehension_passage_id`) REFERENCES `comprehension_passages` (`id`),
  CONSTRAINT `questions_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`),
  CONSTRAINT `questions_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_questions` (
  `quiz_id` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`quiz_id`,`question_id`),
  KEY `quiz_questions_question_id_foreign` (`question_id`),
  CONSTRAINT `quiz_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_schedules`
--

DROP TABLE IF EXISTS `quiz_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `schedule_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `grace_period` int(11) NOT NULL DEFAULT '5',
  `send_email` tinyint(1) NOT NULL DEFAULT '0',
  `settings` json DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_schedules_code_unique` (`code`),
  KEY `quiz_schedules_quiz_id_foreign` (`quiz_id`),
  CONSTRAINT `quiz_schedules_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_schedules`
--

LOCK TABLES `quiz_schedules` WRITE;
/*!40000 ALTER TABLE `quiz_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_session_questions`
--

DROP TABLE IF EXISTS `quiz_session_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_session_questions` (
  `quiz_session_id` bigint(20) unsigned NOT NULL,
  `sno` bigint(20) unsigned NOT NULL DEFAULT '1',
  `question_id` bigint(20) unsigned NOT NULL,
  `original_question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `user_answer` text COLLATE utf8mb4_unicode_ci,
  `correct_answer` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unanswered',
  `is_correct` tinyint(1) DEFAULT NULL,
  `time_taken` int(11) NOT NULL DEFAULT '0',
  `marks_earned` double(5,2) NOT NULL DEFAULT '0.00',
  `marks_deducted` double(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`quiz_session_id`,`question_id`),
  KEY `quiz_session_questions_question_id_foreign` (`question_id`),
  CONSTRAINT `quiz_session_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_session_questions_quiz_session_id_foreign` FOREIGN KEY (`quiz_session_id`) REFERENCES `quiz_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_session_questions`
--

LOCK TABLES `quiz_session_questions` WRITE;
/*!40000 ALTER TABLE `quiz_session_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_session_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_sessions`
--

DROP TABLE IF EXISTS `quiz_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `quiz_schedule_id` bigint(20) unsigned DEFAULT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime NOT NULL,
  `total_time_taken` int(11) NOT NULL DEFAULT '0',
  `current_question` int(11) NOT NULL DEFAULT '0',
  `results` json DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'started',
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_sessions_code_unique` (`code`),
  KEY `quiz_sessions_status_index` (`status`),
  KEY `quiz_sessions_user_id_foreign` (`user_id`),
  KEY `quiz_sessions_quiz_id_foreign` (`quiz_id`),
  CONSTRAINT `quiz_sessions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_sessions`
--

LOCK TABLES `quiz_sessions` WRITE;
/*!40000 ALTER TABLE `quiz_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_types`
--

DROP TABLE IF EXISTS `quiz_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '444444',
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'http://placehold.it/100x100',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_types_code_unique` (`code`),
  UNIQUE KEY `quiz_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_types`
--

LOCK TABLES `quiz_types` WRITE;
/*!40000 ALTER TABLE `quiz_types` DISABLE KEYS */;
INSERT INTO `quiz_types` VALUES (1,'Quiz','qtp_lLvoMjFoKRf','quiz',NULL,'444444','http://placehold.it/100x100',1,NULL,NULL,NULL),(2,'Contest','qtp_uqQvsmXRube','contest',NULL,'444444','http://placehold.it/100x100',1,NULL,NULL,NULL),(3,'Daily Challenge','qtp_xJnjmbmgV5E','daily-challenge',NULL,'444444','http://placehold.it/100x100',1,NULL,NULL,NULL),(4,'Daily Task','qtp_dJ7t7b2onxc','daily-task',NULL,'444444','http://placehold.it/100x100',1,NULL,NULL,NULL),(5,'Hackathon','qtp_pALr8tBpML7','hackathon',NULL,'444444','http://placehold.it/100x100',1,NULL,NULL,NULL),(6,'Assignment','qtp_ok3cIEqIHg4','assignment',NULL,'444444','http://placehold.it/100x100',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `quiz_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `quiz_type_id` bigint(20) unsigned NOT NULL,
  `total_questions` int(10) unsigned NOT NULL DEFAULT '0',
  `total_duration` int(10) unsigned DEFAULT NULL,
  `total_marks` double(5,2) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `price` bigint(20) unsigned DEFAULT NULL,
  `can_redeem` tinyint(1) NOT NULL DEFAULT '0',
  `points_required` int(10) unsigned DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quizzes_slug_unique` (`slug`),
  UNIQUE KEY `quizzes_code_unique` (`code`),
  KEY `quizzes_sub_category_id_foreign` (`sub_category_id`),
  CONSTRAINT `quizzes_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2023-10-23 06:49:53','2023-10-23 06:49:53'),(2,'instructor','web','2023-10-23 06:49:53','2023-10-23 06:49:53'),(3,'student','web','2023-10-23 06:49:53','2023-10-23 06:49:53'),(4,'parent','web','2023-10-23 06:49:53','2023-10-23 06:49:53'),(5,'guest','web','2023-10-23 06:49:53','2023-10-23 06:49:53'),(6,'employee','web','2023-10-23 06:49:53','2023-10-23 06:49:53'),(7,'institute','web','2023-10-23 06:49:53','2023-10-23 06:49:53'),(8,'candidate','web','2023-10-23 06:49:53','2023-10-23 06:49:53');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_code_unique` (`code`),
  UNIQUE KEY `sections_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('FczB5zFw3RFLEjDMQ1kG53qSn5GGZA5G9YXi2L0X',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiU0RrMGpKNVM5R00xMlBKRG1tZGxkRmVUdE1iZUJqYUpmMGlOSU05dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9xd2lrLnVuaXQ6ODA4MS9hZG1pbi9xdWVzdGlvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkWVBCQ2g4aGhRTEJWNks4b1VkcHRCT0NwbFQ0OVZpcDZvRkk2V29YUFNQZG9YS21KdEVURmEiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJFlQQkNoOGhoUUxCVjZLOG9VZHB0Qk9DcGxUNDlWaXA2b0ZJNldvWFBTUGRvWEttSnRFVEZhIjt9',1698286903);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `payload` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_group_index` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site','app_name',0,'\"QwikTest\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(2,'site','tag_line',0,'\"Everything You Need For Your Exam Preparation.\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(3,'site','seo_description',0,'\"Qwiktest Pro is an online test examination software and assessment tool that assists educational institutions,corporate companies to create and conduct web and mobile based exams.\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(4,'site','logo_path',0,'\"site/logo.png\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(5,'site','can_register',0,'true','2023-10-23 06:49:43','2023-10-23 06:49:43'),(6,'site','favicon_path',0,'\"site/favicon.png\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(11,'localization','default_locale',0,'\"en\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(12,'localization','default_timezone',0,'\"UTC\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(13,'email','host',0,'\"smtp.mailtrap.io\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(14,'email','port',0,'2525','2023-10-23 06:49:43','2023-10-23 06:49:43'),(15,'email','username',0,'\"username\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(16,'email','password',0,'\"password\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(17,'email','encryption',0,'\"tls\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(18,'email','from_address',0,'\"admin@qwiktest.com\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(19,'email','from_name',0,'\"QwikTest\"','2023-10-23 06:49:43','2023-10-23 06:49:43'),(20,'top_bar','message',0,'\"Top bar message here\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(21,'top_bar','button_text',0,'\"Details\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(22,'top_bar','button_link',0,'\"#\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(23,'stats','title',0,'\"Students love using QwikTest\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(24,'stats','subtitle',0,'\"25,000+ Happy students\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(25,'stats','stat1',0,'[\"9,55,878+\", \"Questions Practiced\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(26,'stats','stat2',0,'[\"1,13,540+\", \"Tests Taken\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(27,'stats','stat3',0,'[\"1,78,658+\", \"Videos Viewed\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(28,'cta','title',0,'\"Unlock all Online Test Series\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(29,'cta','subtitle',0,'\"Starts $49/Month\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(30,'cta','button_text',0,'\"Buy Now\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(31,'cta','button_link',0,'\"#\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(32,'features','title',0,'\"Better Learning. Better Results.\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(33,'features','subtitle',0,'\"One platform for all your learning needs\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(34,'features','feature1',0,'[\"Top Quality Questions\", \"All questions and solutions, designed by top exam experts, based on latest patterns and actual exam level\", \"https://via.placeholder.com/48x48\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(35,'features','feature2',0,'[\"Detailed Analysis\", \"Know your weaknesses, strengths and everything else that you need to know to improve your score and rank.\", \"https://via.placeholder.com/48x48\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(36,'features','feature3',0,'[\"Live Quizzes\", \"Get your All-India Rank and feel the thrill of a real-exam. Groom your pressure handling and time management skills.\", \"https://via.placeholder.com/48x48\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(37,'features','feature4',0,'[\"Learning Videos\", \"Become lifelong learners with best teachers, engaging video lessons and personalised learning journeys\", \"https://via.placeholder.com/48x48\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(38,'testimonials','title',0,'\"Our students and parents love us\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(39,'testimonials','subtitle',0,'\"Hear it directly from our students\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(40,'testimonials','testimonial1',0,'[\"Sarah Meyer\", \"GMAT Aspirant\", \"Mock tests on QwikTest helped me develop my exam strategy. I was able to focus on my shortcomings and improve them!\", \"https://ui-avatars.com/api/?name=Sarah+Meyer\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(41,'testimonials','testimonial2',0,'[\"Vijay Shah\", \"Class 12 Student\", \"QwikTest helped me get AIR 1 in KCET and AIR 105 in NEET. Thank you QwikTest!\", \"https://ui-avatars.com/api/?name=Vijay+Shah\"]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(42,'hero','title',0,'\"Learn & Upgrade Your Skills on Your Schedule\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(43,'hero','subtitle',0,'\"Anywhere, anytime. Everything You Need For Your Exam Preparation\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(44,'hero','cta_text',0,'\"Get Started\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(45,'hero','image_path',0,'\"site/hero_image_bg.png\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(46,'hero','cta_link',0,'\"#\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(47,'home_page','enable_top_bar',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(48,'home_page','enable_hero',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(49,'home_page','enable_features',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(50,'home_page','enable_categories',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(51,'home_page','enable_stats',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(52,'home_page','enable_testimonials',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(53,'home_page','enable_cta',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(54,'home_page','enable_footer',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(55,'home_page','enable_search',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(56,'site','white_logo_path',0,'\"site/logo_white.png\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(57,'localization','default_direction',0,'\"ltr\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(58,'category','title',0,'\"Comprehensive learning programs for all students\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(59,'category','subtitle',0,'\"Become lifelong learners with the best teachers, engaging video lessons and personalised learning journeys\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(60,'category','limit',0,'8','2023-10-23 06:49:45','2023-10-23 06:49:45'),(61,'footer','copyright_text',0,'\"All rights reserved.\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(62,'footer','enable_links',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(63,'footer','footer_links',0,'[[\"About\", \"#\", true], [\"Features\", \"#\", true], [\"Pricing\", \"#\", true], [\"Help\", \"#\", true], [\"Disclaimer\", \"#\", true], [\"Privacy Policy\", \"#\", true]]','2023-10-23 06:49:45','2023-10-23 06:49:45'),(64,'footer','enable_social_links',0,'true','2023-10-23 06:49:45','2023-10-23 06:49:45'),(65,'footer','social_links',0,'{\"github\": [\"GitHub\", true, \"#\"], \"twitter\": [\"Twitter\", true, \"#\"], \"youtube\": [\"Youtube\", true, \"#\"], \"facebook\": [\"Facebook\", true, \"#\"], \"linkedin\": [\"LinkedIn\", true, \"#\"], \"instagram\": [\"Instagram\", true, \"#\"]}','2023-10-23 06:49:45','2023-10-23 06:49:45'),(66,'theme','primary_color',0,'\"32064a\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(67,'theme','secondary_color',0,'\"e56b1f\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(68,'theme','default_font',0,'\"Inter\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(69,'theme','default_font_url',0,'\"https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap\"','2023-10-23 06:49:45','2023-10-23 06:49:45'),(70,'license','purchase_code',0,'\"NO_PURCHASE_CODE\"','2023-10-23 06:49:46','2023-10-23 06:49:46'),(71,'license','activation_key',0,'\"NO_ACTIVATION_KEY\"','2023-10-23 06:49:46','2023-10-23 06:49:46'),(72,'billing','vendor_name',0,'\"QwikTest\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(73,'billing','invoice_prefix',0,'\"INVOICE\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(74,'billing','address',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(75,'billing','city',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(76,'billing','state',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(77,'billing','zip',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(78,'billing','country',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(79,'billing','phone_number',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(80,'billing','vat_number',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(81,'billing','enable_invoicing',0,'false','2023-10-23 06:49:48','2023-10-23 06:49:48'),(82,'payments','default_payment_processor',0,'\"bank\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(83,'payments','default_currency',0,'\"USD\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(84,'payments','currency_symbol',0,'\"$\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(85,'payments','currency_symbol_position',0,'\"left\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(86,'tax','enable_tax',0,'false','2023-10-23 06:49:48','2023-10-23 06:49:48'),(87,'tax','tax_name',0,'\"VAT\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(88,'tax','tax_type',0,'\"exclusive\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(89,'tax','tax_amount_type',0,'\"percentage\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(90,'tax','tax_amount',0,'5','2023-10-23 06:49:48','2023-10-23 06:49:48'),(91,'tax','enable_additional_tax',0,'false','2023-10-23 06:49:48','2023-10-23 06:49:48'),(92,'tax','additional_tax_name',0,'\"Platform Charges\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(93,'tax','additional_tax_type',0,'\"exclusive\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(94,'tax','additional_tax_amount_type',0,'\"fixed\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(95,'tax','additional_tax_amount',0,'2','2023-10-23 06:49:48','2023-10-23 06:49:48'),(96,'payments','enable_bank',0,'false','2023-10-23 06:49:48','2023-10-23 06:49:48'),(97,'bank','bank_name',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(98,'bank','account_owner',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(99,'bank','account_number',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(100,'bank','iban',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(101,'bank','routing_number',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(102,'bank','bic_swift',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(103,'bank','other_details',0,'\"-\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(104,'payments','enable_razorpay',0,'false','2023-10-23 06:49:48','2023-10-23 06:49:48'),(105,'razorpay','key_id',0,'\"RZP_KEY_ID_HERE\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(106,'razorpay','key_secret',0,'\"RZP_KEY_SECRET_HERE\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(107,'razorpay','webhook_url',0,'\"webhooks/razorpay\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(108,'razorpay','webhook_secret',0,'\"RZP_WEBHOOK_SECRET_HERE\"','2023-10-23 06:49:48','2023-10-23 06:49:48'),(109,'payments','enable_paypal',0,'false','2023-10-23 06:49:50','2023-10-23 06:49:50'),(110,'paypal','client_id',0,'\"CLIENT_ID_HERE\"','2023-10-23 06:49:50','2023-10-23 06:49:50'),(111,'paypal','secret',0,'\"SECRET_HERE\"','2023-10-23 06:49:50','2023-10-23 06:49:50'),(112,'paypal','webhook_url',0,'\"webhooks/paypal\"','2023-10-23 06:49:50','2023-10-23 06:49:50'),(113,'payments','enable_stripe',0,'false','2023-10-23 06:49:50','2023-10-23 06:49:50'),(114,'stripe','api_key',0,'\"STRIPE_API_KEY_HERE\"','2023-10-23 06:49:50','2023-10-23 06:49:50'),(115,'stripe','secret_key',0,'\"STRIPE_SECRET_KEY_HERE\"','2023-10-23 06:49:50','2023-10-23 06:49:50'),(116,'stripe','webhook_url',0,'\"webhooks/stripe\"','2023-10-23 06:49:50','2023-10-23 06:49:50'),(117,'stripe','webhook_secret',0,'\"STRIPE_WEBHOOK_SECRET_HERE\"','2023-10-23 06:49:50','2023-10-23 06:49:50');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skills_code_unique` (`code`),
  UNIQUE KEY `skills_slug_unique` (`slug`),
  KEY `skills_section_id_foreign` (`section_id`),
  CONSTRAINT `skills_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `sub_category_type_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_categories_code_unique` (`code`),
  UNIQUE KEY `sub_categories_slug_unique` (`slug`),
  KEY `sub_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category_sections`
--

DROP TABLE IF EXISTS `sub_category_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category_sections` (
  `sub_category_id` bigint(20) unsigned NOT NULL,
  `section_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`sub_category_id`,`section_id`),
  KEY `sub_category_sections_section_id_foreign` (`section_id`),
  CONSTRAINT `sub_category_sections_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub_category_sections_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category_sections`
--

LOCK TABLES `sub_category_sections` WRITE;
/*!40000 ALTER TABLE `sub_category_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_category_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category_types`
--

DROP TABLE IF EXISTS `sub_category_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_category_types_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category_types`
--

LOCK TABLES `sub_category_types` WRITE;
/*!40000 ALTER TABLE `sub_category_types` DISABLE KEYS */;
INSERT INTO `sub_category_types` VALUES (1,'Course','course',1,NULL,NULL,NULL),(2,'Certification','certification',1,NULL,NULL,NULL),(3,'Class','class',1,NULL,NULL,NULL),(4,'Exam','exam',1,NULL,NULL,NULL),(5,'Grade','grade',1,NULL,NULL,NULL),(6,'Standard','standard',1,NULL,NULL,NULL),(7,'Stream','stream',1,NULL,NULL,NULL),(8,'Level','level',1,NULL,NULL,NULL),(9,'Skill','skill',1,NULL,NULL,NULL),(10,'Branch','branch',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sub_category_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `payment_id` bigint(20) unsigned DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` enum('created','pending','active','cancelled','expired','halted','paused') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_code_unique` (`code`),
  KEY `subscriptions_category_type_category_id_index` (`category_type`,`category_id`),
  KEY `status` (`status`),
  KEY `subscriptions_user_id_foreign` (`user_id`),
  KEY `subscriptions_plan_id_foreign` (`plan_id`),
  KEY `subscriptions_payment_id_foreign` (`payment_id`),
  CONSTRAINT `subscriptions_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggables`
--

DROP TABLE IF EXISTS `taggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggables` (
  `tag_id` int(11) NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) unsigned NOT NULL,
  KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggables`
--

LOCK TABLES `taggables` WRITE;
/*!40000 ALTER TABLE `taggables` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skill_id` bigint(20) unsigned NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `topics_code_unique` (`code`),
  UNIQUE KEY `topics_slug_unique` (`slug`),
  KEY `topics_skill_id_foreign` (`skill_id`),
  CONSTRAINT `topics_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) unsigned NOT NULL,
  `wallet_id` bigint(20) unsigned DEFAULT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,0) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` json DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) unsigned NOT NULL,
  `to_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint(20) unsigned NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` bigint(20) unsigned NOT NULL,
  `withdraw_id` bigint(20) unsigned NOT NULL,
  `discount` decimal(64,0) NOT NULL DEFAULT '0',
  `fee` decimal(64,0) NOT NULL DEFAULT '0',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  KEY `transfers_deposit_id_foreign` (`deposit_id`),
  KEY `transfers_withdraw_id_foreign` (`withdraw_id`),
  CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_exam_schedules`
--

DROP TABLE IF EXISTS `user_group_exam_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_exam_schedules` (
  `exam_schedule_id` bigint(20) unsigned NOT NULL,
  `user_group_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`exam_schedule_id`,`user_group_id`),
  KEY `user_group_exam_schedules_user_group_id_foreign` (`user_group_id`),
  CONSTRAINT `user_group_exam_schedules_exam_schedule_id_foreign` FOREIGN KEY (`exam_schedule_id`) REFERENCES `exam_schedules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_exam_schedules_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_exam_schedules`
--

LOCK TABLES `user_group_exam_schedules` WRITE;
/*!40000 ALTER TABLE `user_group_exam_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_exam_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_quiz_schedules`
--

DROP TABLE IF EXISTS `user_group_quiz_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_quiz_schedules` (
  `quiz_schedule_id` bigint(20) unsigned NOT NULL,
  `user_group_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`quiz_schedule_id`,`user_group_id`),
  KEY `user_group_quiz_schedules_user_group_id_foreign` (`user_group_id`),
  CONSTRAINT `user_group_quiz_schedules_quiz_schedule_id_foreign` FOREIGN KEY (`quiz_schedule_id`) REFERENCES `quiz_schedules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_quiz_schedules_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_quiz_schedules`
--

LOCK TABLES `user_group_quiz_schedules` WRITE;
/*!40000 ALTER TABLE `user_group_quiz_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_quiz_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_users`
--

DROP TABLE IF EXISTS `user_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `user_group_id` bigint(20) unsigned NOT NULL,
  `joined_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`),
  KEY `user_group_users_user_group_id_foreign` (`user_group_id`),
  CONSTRAINT `user_group_users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_users`
--

LOCK TABLES `user_group_users` WRITE;
/*!40000 ALTER TABLE `user_group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_code_unique` (`code`),
  UNIQUE KEY `user_groups_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preferences` json DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code_expires_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'QwikTest','Admin','admin','admin@qwiktest.com',NULL,'2023-10-23 06:49:53',NULL,NULL,NULL,NULL,'$2y$10$YPBCh8hhQLBV6K8oUdptBOCplT49Vip6oFI6WoXPSPdoXKmJtETFa',NULL,NULL,NULL,NULL,NULL,1,'2023-10-23 06:49:53','2023-10-23 06:49:53',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mp4',
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int(10) unsigned NOT NULL DEFAULT '1',
  `skill_id` bigint(20) unsigned NOT NULL,
  `topic_id` bigint(20) unsigned DEFAULT NULL,
  `difficulty_level_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `preferences` json DEFAULT NULL,
  `avg_watch_time` int(11) NOT NULL DEFAULT '0',
  `total_views` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `videos_code_unique` (`code`),
  KEY `videos_skill_id_foreign` (`skill_id`),
  KEY `videos_topic_id_foreign` (`topic_id`),
  CONSTRAINT `videos_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`),
  CONSTRAINT `videos_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `holder_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `balance` decimal(64,0) NOT NULL DEFAULT '0',
  `decimal_places` smallint(6) NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`holder_id`,`slug`),
  KEY `wallets_holder_type_holder_id_index` (`holder_type`,`holder_id`),
  KEY `wallets_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,'App\\Models\\User',1,'Default Wallet','default',NULL,'[]',0,2,'2023-10-23 06:52:55','2023-10-23 06:52:55');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-26 13:41:42
