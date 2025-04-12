-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 03, 2025 at 10:41 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aincrad`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(64) NOT NULL DEFAULT '',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `created` int NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `web_lastlogin` int NOT NULL DEFAULT '0',
  `web_flags` int NOT NULL DEFAULT '0',
  `email_hash` varchar(32) NOT NULL DEFAULT '',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `email_next` int NOT NULL DEFAULT '0',
  `premium_points` int NOT NULL DEFAULT '0',
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `premdays` int NOT NULL DEFAULT '0',
  `lastday` int UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `coins` int UNSIGNED NOT NULL DEFAULT '0',
  `creation` int UNSIGNED NOT NULL DEFAULT '0',
  `recruiter` int DEFAULT '0',
  `vote` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `email`, `key`, `blocked`, `created`, `rlname`, `location`, `country`, `web_lastlogin`, `web_flags`, `email_hash`, `email_new`, `email_new_time`, `email_code`, `email_next`, `premium_points`, `email_verified`, `premdays`, `lastday`, `type`, `coins`, `creation`, `recruiter`, `vote`) VALUES
(1, 'god33333', 'f3397740a5ca1ca6819bc5e500f1e4da39f3a6eb', 'rallaz@smoker.gg', '', 0, 0, '', '', '', 1663228159, 0, '', '', 1663400992, '', 0, 0, 0, 0, 0, 5, 0, 0, 0, 0),
(12, 'smoker', 'afb4fb14cfaa5b4777aa0420855bbd8b6c9679d4', 'chrallaz@smoker.gg', '', 0, 0, '', '', 'se', 1663832317, 0, '', '', 0, '', 0, 0, 0, 0, 0, 1, 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint NOT NULL,
  `expires_at` bigint NOT NULL,
  `banned_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int NOT NULL,
  `account_id` int UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint NOT NULL,
  `expired_at` bigint NOT NULL,
  `banned_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int UNSIGNED NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `boosted_boss`
--

CREATE TABLE `boosted_boss` (
  `looktype` int NOT NULL DEFAULT '136',
  `lookfeet` int NOT NULL DEFAULT '0',
  `looklegs` int NOT NULL DEFAULT '0',
  `lookhead` int NOT NULL DEFAULT '0',
  `lookbody` int NOT NULL DEFAULT '0',
  `lookaddons` int NOT NULL DEFAULT '0',
  `lookmount` int DEFAULT '0',
  `date` varchar(250) NOT NULL DEFAULT '',
  `boostname` text,
  `raceid` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `boosted_boss`
--

INSERT INTO `boosted_boss` (`looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(208, 0, 0, 0, 0, 0, 0, '26', 'The Old Widow', '2352');

-- --------------------------------------------------------

--
-- Table structure for table `boosted_creature`
--

CREATE TABLE `boosted_creature` (
  `looktype` int NOT NULL DEFAULT '136',
  `lookfeet` int NOT NULL DEFAULT '0',
  `looklegs` int NOT NULL DEFAULT '0',
  `lookhead` int NOT NULL DEFAULT '0',
  `lookbody` int NOT NULL DEFAULT '0',
  `lookaddons` int NOT NULL DEFAULT '0',
  `lookmount` int DEFAULT '0',
  `date` varbinary(250) NOT NULL DEFAULT '',
  `boostname` blob,
  `raceid` varbinary(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `boosted_creature`
--

INSERT INTO `boosted_creature` (`looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(990, 0, 0, 0, 0, 0, 0, 0x3236, 0x4261726b6c6573732046616e61746963, 0x31343838);

-- --------------------------------------------------------

--
-- Table structure for table `coins_transactions`
--

CREATE TABLE `coins_transactions` (
  `id` int UNSIGNED NOT NULL,
  `account_id` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `description` varchar(3500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_payments`
--

CREATE TABLE `crypto_payments` (
  `paymentID` int UNSIGNED NOT NULL,
  `boxID` int UNSIGNED NOT NULL DEFAULT '0',
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `amountUSD` double(20,8) NOT NULL DEFAULT '0.00000000',
  `unrecognised` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `daily_reward_history`
--

CREATE TABLE `daily_reward_history` (
  `id` int NOT NULL,
  `daystreak` smallint NOT NULL DEFAULT '0',
  `player_id` int NOT NULL,
  `timestamp` int NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `forge_history`
--

CREATE TABLE `forge_history` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `action_type` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `is_success` tinyint NOT NULL DEFAULT '0',
  `bonus` tinyint NOT NULL DEFAULT '0',
  `done_at` bigint NOT NULL,
  `done_at_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `cost` bigint UNSIGNED NOT NULL DEFAULT '0',
  `gained` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `global_storage`
--

INSERT INTO `global_storage` (`key`, `value`) VALUES
('14110', '1711875901');

-- --------------------------------------------------------

--
-- Table structure for table `guilds`
--

CREATE TABLE `guilds` (
  `id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `ownerid` int NOT NULL,
  `creationdata` int NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int NOT NULL DEFAULT '0',
  `balance` bigint UNSIGNED NOT NULL DEFAULT '0',
  `points` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `logo_name` varchar(255) NOT NULL DEFAULT 'default.gif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Triggers `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
		INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('The Leader', 3, NEW.`id`);
		INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
		INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int NOT NULL DEFAULT '0',
  `targetguild` int NOT NULL DEFAULT '0',
  `warid` int NOT NULL DEFAULT '0',
  `time` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int NOT NULL DEFAULT '0',
  `guild_id` int NOT NULL DEFAULT '0',
  `date` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int NOT NULL,
  `guild_id` int NOT NULL,
  `rank_id` int NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int NOT NULL,
  `guild_id` int NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int NOT NULL,
  `guild1` int NOT NULL DEFAULT '0',
  `guild2` int NOT NULL DEFAULT '0',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `started` bigint NOT NULL DEFAULT '0',
  `ended` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int NOT NULL,
  `owner` int NOT NULL,
  `paid` int UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int NOT NULL DEFAULT '0',
  `town_id` int NOT NULL DEFAULT '0',
  `bid` int NOT NULL DEFAULT '0',
  `bid_end` int NOT NULL DEFAULT '0',
  `last_bid` int NOT NULL DEFAULT '0',
  `highest_bidder` int NOT NULL DEFAULT '0',
  `size` int NOT NULL DEFAULT '0',
  `guildid` int DEFAULT NULL,
  `beds` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(22, 0, 0, 0, 'Aincrad Park 4', 5000, 1, 0, 0, 0, 0, 79, NULL, 4),
(24, 0, 0, 0, 'Aincrad Eastyard House', 3400, 1, 0, 0, 0, 0, 33, NULL, 2),
(25, 0, 0, 0, 'Aincrad Townhouse 1', 6500, 1, 0, 0, 0, 0, 62, NULL, 2),
(26, 0, 0, 0, 'Aincrad Townhouse 2', 6500, 1, 0, 0, 0, 0, 55, NULL, 2),
(27, 0, 0, 0, 'Aincrad Townhouse 3', 6500, 1, 0, 0, 0, 0, 57, NULL, 2),
(28, 0, 0, 0, 'Aincrad Lakehouse', 20000, 1, 0, 0, 0, 0, 102, NULL, 8),
(29, 0, 0, 0, 'Aincrad Townhouse 4', 8000, 1, 0, 0, 0, 0, 61, NULL, 2),
(30, 0, 0, 0, 'Aincrad Townhouse 5', 8000, 1, 0, 0, 0, 0, 61, NULL, 2),
(32, 0, 0, 0, 'Aincrad Townhouse 6', 8000, 1, 0, 0, 0, 0, 61, NULL, 2),
(33, 0, 0, 0, 'Aincrad Townhouse 7', 8000, 1, 0, 0, 0, 0, 61, NULL, 2),
(34, 0, 0, 0, 'Aincrad Townhouse 8', 8000, 1, 0, 0, 0, 0, 61, NULL, 2),
(35, 0, 0, 0, 'Aincrad Townhouse 9', 8000, 1, 0, 0, 0, 0, 59, NULL, 1),
(36, 0, 0, 0, 'Aincrad Townhouse 10', 7200, 1, 0, 0, 0, 0, 31, NULL, 2),
(37, 0, 0, 0, 'Aincrad Townhouse 11', 7200, 1, 0, 0, 0, 0, 31, NULL, 2),
(38, 0, 0, 0, 'Aincrad Townhouse 12', 7200, 1, 0, 0, 0, 0, 31, NULL, 2),
(39, 0, 0, 0, 'Aincrad Townhouse 13', 72000, 1, 0, 0, 0, 0, 31, NULL, 2),
(40, 0, 0, 0, 'Aincrad Wood Townhouse 1', 8000, 1, 0, 0, 0, 0, 50, NULL, 2),
(41, 0, 0, 0, 'Aincrad Wood Townhouse 2', 6500, 1, 0, 0, 0, 0, 24, NULL, 2),
(42, 0, 0, 0, 'Aincrad Wooden Lakehouse', 20000, 1, 0, 0, 0, 0, 77, NULL, 4),
(43, 0, 0, 0, 'Aincrad Sidequarter 1', 8000, 1, 0, 0, 0, 0, 112, NULL, 2),
(44, 0, 0, 0, 'Aincrad Sidequarter 2', 8000, 1, 0, 0, 0, 0, 96, NULL, 2),
(45, 0, 0, 0, 'Aincrad Sidequarter 3', 8000, 1, 0, 0, 0, 0, 85, NULL, 2),
(46, 0, 0, 0, 'Aincrad Sidequarter 4', 8000, 1, 0, 0, 0, 0, 50, NULL, 2),
(47, 0, 0, 0, 'Aincrad Sidequarter 5', 8000, 1, 0, 0, 0, 0, 74, NULL, 2),
(3031, 0, 0, 0, 'Aincrad Finehouse 1', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3032, 0, 0, 0, 'Aincrad Finehouse 2', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3033, 0, 0, 0, 'Aincrad Finehouse 3', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3034, 0, 0, 0, 'Aincrad Finehouse 4', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3035, 0, 0, 0, 'Aincrad Finehouse 5', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3036, 0, 0, 0, 'Aincrad Finehouse 6', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3037, 0, 0, 0, 'Aincrad Finehouse 7', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3038, 0, 0, 0, 'Aincrad Finehouse 8', 10000, 1, 0, 0, 0, 0, 98, NULL, 0),
(3039, 0, 0, 0, 'Aincrad Finehouse 9', 10000, 1, 0, 0, 0, 0, 84, NULL, 0),
(3040, 0, 0, 0, 'Aincrad Luxury Villa 1', 2500000, 1, 0, 0, 0, 0, 131, NULL, 4),
(3041, 0, 0, 0, 'Aincrad Luxury Villa 2', 1500000, 1, 0, 0, 0, 0, 205, NULL, 10),
(3042, 0, 0, 0, 'Aincrad Luxury Villa 3', 500000, 1, 0, 0, 0, 0, 115, NULL, 6),
(3043, 0, 0, 0, 'Aincrad Luxury Villa 4', 500000, 1, 0, 0, 0, 0, 118, NULL, 4),
(3044, 0, 0, 0, 'Aincrad Luxury Villa 5', 2500000, 1, 0, 0, 0, 0, 118, NULL, 4),
(3045, 0, 0, 0, 'Aincrad Luxury Villa 6', 2500000, 1, 0, 0, 0, 0, 46, NULL, 2),
(3046, 0, 0, 0, 'Aincrad Luxury Villa 7', 500000, 1, 0, 0, 0, 0, 46, NULL, 2),
(3047, 0, 0, 0, 'Aincrad Luxury Villa 8', 500000, 1, 0, 0, 0, 0, 36, NULL, 2),
(3048, 0, 0, 0, 'Aincrad Luxury Villa 9', 1500000, 1, 0, 0, 0, 0, 90, NULL, 4),
(3049, 0, 0, 0, 'Aincrad Luxury Mansion 1', 15000000, 1, 0, 0, 0, 0, 119, NULL, 0),
(3050, 0, 0, 0, 'Aincrad Luxury Mansion 2', 15000000, 1, 0, 0, 0, 0, 89, NULL, 0),
(3051, 0, 0, 0, 'Aincrad Level 40 plus A', 1500000, 1, 0, 0, 0, 0, 175, NULL, 4),
(3052, 0, 0, 0, 'Aincrad Level 40 plus B', 1500000, 1, 0, 0, 0, 0, 247, NULL, 8),
(3053, 0, 0, 0, 'Aincrad Level 40 plus C', 1500000, 1, 0, 0, 0, 0, 148, NULL, 2),
(3054, 0, 0, 0, 'Aincrad Level 40 plus D', 1500000, 1, 0, 0, 0, 0, 154, NULL, 4),
(3055, 0, 0, 0, 'Aincrad Level 40 plus E', 1500000, 1, 0, 0, 0, 0, 649, NULL, 18),
(3056, 0, 0, 0, 'Aincrad Level 40 plus F', 1500000, 1, 0, 0, 0, 0, 261, NULL, 6),
(3057, 0, 0, 0, 'Aincrad Level 40 plus G', 1500000, 1, 0, 0, 0, 0, 129, NULL, 4),
(3058, 0, 0, 0, 'Aincrad Luxary Floorvilla 1', 15000000, 1, 0, 0, 0, 0, 79, NULL, 0),
(3059, 0, 0, 0, 'Aincrad Luxary Floorvilla 2', 15000000, 1, 0, 0, 0, 0, 56, NULL, 0),
(3060, 0, 0, 0, 'Aincrad Topfloor Villa 1', 1500000, 1, 0, 0, 0, 0, 25, NULL, 2),
(3061, 0, 0, 0, 'Aincrad Topfloor Villa 2', 1500000, 1, 0, 0, 0, 0, 50, NULL, 4),
(3062, 0, 0, 0, 'Aincrad Floor 2 House 1', 30000, 1, 0, 0, 0, 0, 82, NULL, 0),
(3063, 0, 0, 0, 'Aincrad Floor 2 House 2', 30000, 1, 0, 0, 0, 0, 89, NULL, 0),
(3064, 0, 0, 0, 'Aincrad Floor 2 House 3', 30000, 1, 0, 0, 0, 0, 81, NULL, 0),
(3065, 0, 0, 0, 'Aincrad Floor 2 House 4', 30000, 1, 0, 0, 0, 0, 63, NULL, 0),
(3066, 0, 0, 0, 'Aincrad Floor 3 House 1', 35000, 1, 0, 0, 0, 0, 28, NULL, 0),
(3067, 0, 0, 0, 'Aincrad Floor 3 House 2', 35000, 1, 0, 0, 0, 0, 22, NULL, 0),
(3068, 0, 0, 0, 'Aincrad Floor 3 House 3', 35000, 1, 0, 0, 0, 0, 24, NULL, 0),
(3069, 0, 0, 0, 'Aincrad Floor 3 House 4', 35000, 1, 0, 0, 0, 0, 22, NULL, 0),
(3070, 0, 0, 0, 'Aincrad Floor 3 House 5', 35000, 1, 0, 0, 0, 0, 166, NULL, 4),
(3071, 0, 0, 0, 'Aincrad Floor 3 House 6', 35000, 1, 0, 0, 0, 0, 210, NULL, 4),
(3072, 0, 0, 0, 'Aincrad Floor 4 House 1', 40000, 1, 0, 0, 0, 0, 39, NULL, 0),
(3073, 0, 0, 0, 'Aincrad Floor 4 House 2', 40000, 1, 0, 0, 0, 0, 46, NULL, 0),
(3074, 0, 0, 0, 'Aincrad Floor 4 House 3', 40000, 1, 0, 0, 0, 0, 59, NULL, 0),
(3075, 0, 0, 0, 'Aincrad Floor 5 House 1', 45000, 1, 0, 0, 0, 0, 38, NULL, 0),
(3076, 0, 0, 0, 'Aincrad Floor 5 House 2', 45000, 1, 0, 0, 0, 0, 40, NULL, 0),
(3077, 0, 0, 0, 'Aincrad Floor 5 House 3', 45000, 1, 0, 0, 0, 0, 57, NULL, 0),
(3078, 0, 0, 0, 'Aincrad Floor 5 House 4', 45000, 1, 0, 0, 0, 0, 50, NULL, 0),
(3079, 0, 0, 0, 'Aincrad Floor 5 House 5', 45000, 1, 0, 0, 0, 0, 33, NULL, 0),
(3080, 0, 0, 0, 'Aincrad Floor 6 House 1', 50000, 1, 0, 0, 0, 0, 36, NULL, 0),
(3081, 0, 0, 0, 'Aincrad Floor 6 House 2', 50000, 1, 0, 0, 0, 0, 41, NULL, 0),
(3082, 0, 0, 0, 'Aincrad Floor 6 House 3', 50000, 1, 0, 0, 0, 0, 41, NULL, 0),
(3083, 0, 0, 0, 'Aincrad Floor 6 House 4', 50000, 1, 0, 0, 0, 0, 25, NULL, 0),
(3084, 0, 0, 0, 'Aincrad Floor 7 House 1', 55000, 1, 0, 0, 0, 0, 43, NULL, 0),
(3085, 0, 0, 0, 'Aincrad Floor 7 House 2', 55000, 1, 0, 0, 0, 0, 37, NULL, 0),
(3086, 0, 0, 0, 'Aincrad Floor 7 House 3', 55000, 1, 0, 0, 0, 0, 40, NULL, 0),
(3087, 0, 0, 0, 'Aincrad Floor 7 House 4', 55000, 1, 0, 0, 0, 0, 56, NULL, 0),
(3088, 0, 0, 0, 'Aincrad Floor 8 House 1', 60000, 1, 0, 0, 0, 0, 48, NULL, 0),
(3089, 0, 0, 0, 'Aincrad Floor 8 House 2', 60000, 1, 0, 0, 0, 0, 52, NULL, 0),
(3090, 0, 0, 0, 'Aincrad Floor 8 House 3', 60000, 1, 0, 0, 0, 0, 45, NULL, 0),
(3091, 0, 0, 0, 'Aincrad Floor 9 House 1', 70000, 1, 0, 0, 0, 0, 31, NULL, 0),
(3092, 0, 0, 0, 'Aincrad Floor 9 House 2', 70000, 1, 0, 0, 0, 0, 25, NULL, 0),
(3093, 0, 0, 0, 'Aincrad Floor 9 House 3', 70000, 1, 0, 0, 0, 0, 25, NULL, 0),
(3094, 0, 0, 0, 'Aincrad Floor 9 House 4', 70000, 1, 0, 0, 0, 0, 28, NULL, 0),
(3098, 0, 0, 0, 'Aincrad Sand House 1', 555555, 1, 0, 0, 0, 0, 270, NULL, 0),
(3099, 0, 0, 0, 'Aincrad Sand House 2', 555555, 1, 0, 0, 0, 0, 126, NULL, 0),
(3100, 0, 0, 0, 'Aincrad Sand House 3', 555555, 1, 0, 0, 0, 0, 47, NULL, 0),
(3101, 0, 0, 0, 'Aincrad Sand House 4', 555555, 1, 0, 0, 0, 0, 154, NULL, 0),
(3102, 0, 0, 0, 'Aincrad Sand House 5', 555555, 1, 0, 0, 0, 0, 72, NULL, 0),
(3103, 0, 0, 0, 'Aincrad Sand House 6', 555555, 1, 0, 0, 0, 0, 80, NULL, 0),
(3104, 0, 0, 0, 'Aincrad Sand House 7', 555555, 1, 0, 0, 0, 0, 219, NULL, 0),
(3105, 0, 0, 0, 'Aincrad Sand House 8', 555555, 1, 0, 0, 0, 0, 70, NULL, 0),
(3106, 0, 0, 0, 'Aincrad Sand House 9', 555555, 1, 0, 0, 0, 0, 33, NULL, 0),
(3107, 0, 0, 0, 'Aincrad Sand House 10', 555555, 1, 0, 0, 0, 0, 107, NULL, 0),
(3108, 0, 0, 0, 'Aincrad Sand House 11', 555555, 1, 0, 0, 0, 0, 79, NULL, 0),
(3109, 0, 0, 0, 'Aincrad Sand House 12', 555555, 1, 0, 0, 0, 0, 116, NULL, 0),
(3110, 0, 0, 0, 'Aincrad Sand House 13', 555555, 1, 0, 0, 0, 0, 64, NULL, 0),
(3111, 0, 0, 0, 'Aincrad Sand House 14', 555555, 1, 0, 0, 0, 0, 83, NULL, 0),
(3112, 0, 0, 0, 'Aincrad Sand House 15', 555555, 1, 0, 0, 0, 0, 20, NULL, 0),
(3113, 0, 0, 0, 'Aincrad Sand House 16', 555555, 1, 0, 0, 0, 0, 92, NULL, 0),
(3114, 0, 0, 0, 'Aincrad Sand House 17', 555555, 1, 0, 0, 0, 0, 189, NULL, 0),
(3115, 0, 0, 0, 'Aincrad Sand House 18', 555555, 1, 0, 0, 0, 0, 29, NULL, 0),
(3116, 0, 0, 0, 'Aincrad Sand House 20', 555555, 1, 0, 0, 0, 0, 30, NULL, 0),
(3117, 0, 0, 0, 'Aincrad Sand House 21', 555555, 1, 0, 0, 0, 0, 20, NULL, 0),
(3118, 0, 0, 0, 'Aincrad Sand House 22', 555555, 1, 0, 0, 0, 0, 162, NULL, 0),
(3119, 0, 0, 0, 'Aincrad Sand House 23', 555555, 1, 0, 0, 0, 0, 64, NULL, 0),
(3120, 0, 0, 0, 'Aincrad Sand House 24', 555555, 1, 0, 0, 0, 0, 90, NULL, 0),
(3121, 0, 0, 0, 'Aincrad Sand House 25', 555555, 1, 0, 0, 0, 0, 32, NULL, 0),
(3122, 0, 0, 0, 'Aincrad Sand House 26', 555555, 1, 0, 0, 0, 0, 147, NULL, 0),
(3123, 0, 0, 0, 'Aincrad Sand House 27', 555555, 1, 0, 0, 0, 0, 38, NULL, 0),
(3124, 0, 0, 0, 'Aincrad Sand House 28', 555555, 1, 0, 0, 0, 0, 184, NULL, 0),
(3125, 0, 0, 0, 'Aincrad Sand House 29', 555555, 1, 0, 0, 0, 0, 142, NULL, 0),
(3126, 0, 0, 0, 'Aincrad Sand House 30', 555555, 1, 0, 0, 0, 0, 35, NULL, 0),
(3127, 0, 0, 0, 'Aincrad Sand House 31', 555555, 1, 0, 0, 0, 0, 120, NULL, 0),
(3128, 0, 0, 0, 'Aincrad Halfway 1', 777777, 1, 0, 0, 0, 0, 61, NULL, 0),
(3129, 0, 0, 0, 'Aincrad Halfway 2', 777777, 1, 0, 0, 0, 0, 104, NULL, 0),
(3130, 0, 0, 0, 'Aincrad Halfway 3', 777777, 1, 0, 0, 0, 0, 64, NULL, 0),
(3131, 0, 0, 0, 'Aincrad Halfway 4', 777777, 1, 0, 0, 0, 0, 104, NULL, 0),
(3132, 0, 0, 0, 'Aincrad Level 60 House 1', 999999, 1, 0, 0, 0, 0, 49, NULL, 0),
(3133, 0, 0, 0, 'Aincrad Level 60 House 2', 999999, 1, 0, 0, 0, 0, 53, NULL, 0),
(3134, 0, 0, 0, 'Aincrad Level 60 House 3', 999999, 1, 0, 0, 0, 0, 33, NULL, 0),
(3135, 0, 0, 0, 'Aincrad Level 60 House 4', 999999, 1, 0, 0, 0, 0, 35, NULL, 0),
(3136, 0, 0, 0, 'Aincrad Level 60 House 5', 999999, 1, 0, 0, 0, 0, 37, NULL, 0),
(3137, 0, 0, 0, 'Aincrad Level 60 House 6', 999999, 1, 0, 0, 0, 0, 34, NULL, 0),
(3138, 0, 0, 0, 'Aincrad Floor 70 Villa 1', 9999999, 1, 0, 0, 0, 0, 54, NULL, 0),
(3139, 0, 0, 0, 'Aincrad Floor 70 Villa 2', 9999999, 1, 0, 0, 0, 0, 69, NULL, 0),
(3140, 0, 0, 0, 'Aincrad Floor 70 Villa 3', 9999999, 1, 0, 0, 0, 0, 63, NULL, 0),
(3141, 0, 0, 0, 'Aincrad Floor 70 Villa 4', 9999999, 1, 0, 0, 0, 0, 63, NULL, 0),
(3142, 0, 0, 0, 'Aincrad Floor 70 Villa 5', 9999999, 1, 0, 0, 0, 0, 115, NULL, 0),
(3143, 0, 0, 0, 'Aincrad Floor 70 Villa 6', 9999999, 1, 0, 0, 0, 0, 36, NULL, 0),
(3144, 0, 0, 0, 'Aincrad Floor 70 Villa 7', 9999999, 1, 0, 0, 0, 0, 71, NULL, 0),
(3145, 0, 0, 0, 'Aincrad Floor 70 Villa 8', 9999999, 1, 0, 0, 0, 0, 43, NULL, 0),
(3146, 0, 0, 0, 'Aincrad Floor 70 Villa 9', 9999999, 1, 0, 0, 0, 0, 37, NULL, 0),
(3147, 0, 0, 0, 'Aincrad Floor 70 Villa 10', 9999999, 1, 0, 0, 0, 0, 60, NULL, 0),
(3148, 0, 0, 0, 'Aincrad Floor 70 Villa 11', 9999999, 1, 0, 0, 0, 0, 100, NULL, 0),
(3149, 0, 0, 0, 'Aincrad Floor 70 Villa 12', 9999999, 1, 0, 0, 0, 0, 197, NULL, 0),
(3150, 0, 0, 0, 'Aincrad Floor 70 Villa 13', 9999999, 1, 0, 0, 0, 0, 29, NULL, 0),
(3151, 0, 0, 0, 'Aincrad Floor 70 Villa 14', 9999999, 1, 0, 0, 0, 0, 84, NULL, 0),
(3152, 0, 0, 0, 'Aincrad Floor 70 Villa 15', 9999999, 1, 0, 0, 0, 0, 50, NULL, 0),
(3153, 0, 0, 0, 'Aincrad Floor 70 Villa 16', 9999999, 1, 0, 0, 0, 0, 50, NULL, 0),
(3154, 0, 0, 0, 'Aincrad Floor 70 Villa 17', 9999999, 1, 0, 0, 0, 0, 50, NULL, 0),
(3155, 0, 0, 0, 'Aincrad Floor 70 Villa 18', 9999999, 1, 0, 0, 0, 0, 50, NULL, 0),
(3156, 0, 0, 0, 'Aincrad Floor 70 Villa 19', 9999999, 1, 0, 0, 0, 0, 129, NULL, 0),
(3157, 0, 0, 0, 'Aincrad Floor 70 Villa 20', 9999999, 1, 0, 0, 0, 0, 35, NULL, 0),
(3158, 0, 0, 0, 'Aincrad Floor 70 Villa 21', 9999999, 1, 0, 0, 0, 0, 40, NULL, 0),
(3159, 0, 0, 0, 'Aincrad Floor 70 Villa 22', 9999999, 1, 0, 0, 0, 0, 57, NULL, 0),
(3160, 0, 0, 0, 'Aincrad Floor 70 Villa 23', 9999999, 1, 0, 0, 0, 0, 43, NULL, 0),
(3161, 0, 0, 0, 'Aincrad Guild Hall 1', 9999999, 1, 0, 0, 0, 0, 577, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int NOT NULL,
  `listid` int NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint NOT NULL,
  `expires_at` bigint NOT NULL,
  `banned_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `market_history`
--

CREATE TABLE `market_history` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int UNSIGNED NOT NULL,
  `amount` smallint UNSIGNED NOT NULL,
  `price` int UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint UNSIGNED NOT NULL,
  `inserted` bigint UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NOT NULL,
  `tier` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int UNSIGNED NOT NULL,
  `amount` smallint UNSIGNED NOT NULL,
  `created` bigint UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int UNSIGNED NOT NULL DEFAULT '0',
  `tier` tinyint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_account_actions`
--

CREATE TABLE `myaac_account_actions` (
  `account_id` int NOT NULL,
  `ip` int UNSIGNED NOT NULL DEFAULT '0',
  `ipv6` binary(16) NOT NULL DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `date` int NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_account_actions`
--

INSERT INTO `myaac_account_actions` (`account_id`, `ip`, `ipv6`, `date`, `action`) VALUES
(2, 2130706433, 0x00000000000000000000000000000000, 1644320349, 'Account created.'),
(2, 2130706433, 0x00000000000000000000000000000000, 1644323692, 'Created character <b>Uchiha Smoker</b>.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1645622544, 'Account created.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1645622545, 'Created character <b>Uchiha Smoker Ek</b>.'),
(4, 449370014, 0x00000000000000000000000000000000, 1650999693, 'Account created.'),
(4, 449370014, 0x00000000000000000000000000000000, 1650999694, 'Created character <b>Kingen</b>.'),
(5, 447321616, 0x00000000000000000000000000000000, 1651005623, 'Account created.'),
(5, 447321616, 0x00000000000000000000000000000000, 1651005624, 'Created character <b>Kushkan</b>.'),
(6, 448676916, 0x00000000000000000000000000000000, 1651814149, 'Account created.'),
(6, 448676916, 0x00000000000000000000000000000000, 1651814150, 'Created character <b>Flaffe</b>.'),
(7, 449370014, 0x00000000000000000000000000000000, 1651814564, 'Account created.'),
(7, 449370014, 0x00000000000000000000000000000000, 1651814565, 'Created character <b>Jonny</b>.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1653911479, 'Created character <b>Uchiha Smoker Ed</b>.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1653911493, 'Created character <b>Uchiha Smoker Ms</b>.'),
(8, 448676916, 0x00000000000000000000000000000000, 1654804574, 'Account created.'),
(8, 448676916, 0x00000000000000000000000000000000, 1654804575, 'Created character <b>Azte</b>.'),
(6, 448676916, 0x00000000000000000000000000000000, 1654804600, 'Created character <b>Turbo Flaffe</b>.'),
(8, 446894691, 0x00000000000000000000000000000000, 1654809971, 'Created character <b>Azte Tank</b>.'),
(8, 446894691, 0x00000000000000000000000000000000, 1654892095, 'Created character <b>Azte Healer</b>.'),
(6, 448676916, 0x00000000000000000000000000000000, 1654892339, 'Created character <b>Flaffe Healarn</b>.'),
(9, 446202218, 0x00000000000000000000000000000000, 1655496554, 'Account created.'),
(9, 446202218, 0x00000000000000000000000000000000, 1655496555, 'Created character <b>Bringanstrettioslaka</b>.'),
(10, 452559770, 0x00000000000000000000000000000000, 1659043919, 'Account created.'),
(10, 452559770, 0x00000000000000000000000000000000, 1659043921, 'Created character <b>Stephii</b>.'),
(11, 452559770, 0x00000000000000000000000000000000, 1659043998, 'Account created.'),
(11, 452559770, 0x00000000000000000000000000000000, 1659044000, 'Created character <b>Stephhi</b>.'),
(3, 436340757, 0x00000000000000000000000000000000, 1661434267, 'Created character <b>Uchiha Smoker Ekk</b>.'),
(2, 436340757, 0x00000000000000000000000000000000, 1661847168, 'Generated recovery key.'),
(3, 436340757, 0x00000000000000000000000000000000, 1661847660, 'Generated recovery key.'),
(12, 436340757, 0x00000000000000000000000000000000, 1662748115, 'Account created.'),
(12, 436340757, 0x00000000000000000000000000000000, 1662748116, 'Created character <b>Uchiha Smoker</b>.'),
(13, 436340757, 0x00000000000000000000000000000000, 1662748324, 'Account created.'),
(13, 436340757, 0x00000000000000000000000000000000, 1662748325, 'Created character <b>Rekoms</b>.'),
(2, 2130706433, 0x00000000000000000000000000000000, 1644320349, 'Account created.'),
(2, 2130706433, 0x00000000000000000000000000000000, 1644323692, 'Created character <b>Uchiha Smoker</b>.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1645622544, 'Account created.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1645622545, 'Created character <b>Uchiha Smoker Ek</b>.'),
(4, 449370014, 0x00000000000000000000000000000000, 1650999693, 'Account created.'),
(4, 449370014, 0x00000000000000000000000000000000, 1650999694, 'Created character <b>Kingen</b>.'),
(5, 447321616, 0x00000000000000000000000000000000, 1651005623, 'Account created.'),
(5, 447321616, 0x00000000000000000000000000000000, 1651005624, 'Created character <b>Kushkan</b>.'),
(6, 448676916, 0x00000000000000000000000000000000, 1651814149, 'Account created.'),
(6, 448676916, 0x00000000000000000000000000000000, 1651814150, 'Created character <b>Flaffe</b>.'),
(7, 449370014, 0x00000000000000000000000000000000, 1651814564, 'Account created.'),
(7, 449370014, 0x00000000000000000000000000000000, 1651814565, 'Created character <b>Jonny</b>.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1653911479, 'Created character <b>Uchiha Smoker Ed</b>.'),
(3, 2130706433, 0x00000000000000000000000000000000, 1653911493, 'Created character <b>Uchiha Smoker Ms</b>.'),
(8, 448676916, 0x00000000000000000000000000000000, 1654804574, 'Account created.'),
(8, 448676916, 0x00000000000000000000000000000000, 1654804575, 'Created character <b>Azte</b>.'),
(6, 448676916, 0x00000000000000000000000000000000, 1654804600, 'Created character <b>Turbo Flaffe</b>.'),
(8, 446894691, 0x00000000000000000000000000000000, 1654809971, 'Created character <b>Azte Tank</b>.'),
(8, 446894691, 0x00000000000000000000000000000000, 1654892095, 'Created character <b>Azte Healer</b>.'),
(6, 448676916, 0x00000000000000000000000000000000, 1654892339, 'Created character <b>Flaffe Healarn</b>.'),
(9, 446202218, 0x00000000000000000000000000000000, 1655496554, 'Account created.'),
(9, 446202218, 0x00000000000000000000000000000000, 1655496555, 'Created character <b>Bringanstrettioslaka</b>.'),
(14, 438212214, 0x00000000000000000000000000000000, 1662750403, 'Account created.'),
(14, 438212214, 0x00000000000000000000000000000000, 1662750406, 'Created character <b>Lexa</b>.'),
(15, 438212214, 0x00000000000000000000000000000000, 1662750542, 'Account created.'),
(15, 438212214, 0x00000000000000000000000000000000, 1662750544, 'Created character <b>Stephhy</b>.'),
(16, 1408966998, 0x00000000000000000000000000000000, 1662996923, 'Account created.'),
(16, 1408966998, 0x00000000000000000000000000000000, 1662996926, 'Created character <b>Kushkan</b>.'),
(17, 3117685642, 0x00000000000000000000000000000000, 1663008297, 'Account created.'),
(17, 3117685642, 0x00000000000000000000000000000000, 1663008298, 'Created character <b>Benji</b>.'),
(18, 3011346899, 0x00000000000000000000000000000000, 1663076258, 'Account created.'),
(18, 3011346899, 0x00000000000000000000000000000000, 1663076259, 'Created character <b>Leuzin</b>.'),
(17, 3117685642, 0x00000000000000000000000000000000, 1663092285, 'Created character <b>Valter Vit</b>.'),
(19, 637045511, 0x00000000000000000000000000000000, 1663094424, 'Account created.'),
(19, 637045511, 0x00000000000000000000000000000000, 1663094426, 'Created character <b>Drumakaar</b>.'),
(20, 1841590860, 0x00000000000000000000000000000000, 1663095143, 'Account created.'),
(20, 1841590860, 0x00000000000000000000000000000000, 1663095144, 'Created character <b>Qeret</b>.'),
(21, 1486673764, 0x00000000000000000000000000000000, 1663095365, 'Account created.'),
(21, 1486673764, 0x00000000000000000000000000000000, 1663095367, 'Created character <b>Mokra Andzela</b>.'),
(22, 635508376, 0x00000000000000000000000000000000, 1663102982, 'Account created.'),
(22, 635508376, 0x00000000000000000000000000000000, 1663102984, 'Created character <b>Za Dyche Obciagne</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663104861, 'Created character <b>Rallaz</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663104873, 'Created character <b>Chrallaz</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663104890, 'Created character <b>Frallaz</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663105007, 'Created character <b>Drullaz</b>.'),
(23, 3220376925, 0x00000000000000000000000000000000, 1663105166, 'Account created.'),
(23, 3220376925, 0x00000000000000000000000000000000, 1663105168, 'Created character <b>Noah</b>.'),
(24, 635508376, 0x00000000000000000000000000000000, 1663146762, 'Account created.'),
(24, 635508376, 0x00000000000000000000000000000000, 1663146763, 'Created character <b>Chujek</b>.'),
(25, 532079102, 0x00000000000000000000000000000000, 1663148222, 'Account created.'),
(25, 532079102, 0x00000000000000000000000000000000, 1663148223, 'Created character <b>Pepega</b>.'),
(26, 1308555906, 0x00000000000000000000000000000000, 1663158264, 'Account created.'),
(26, 1308555906, 0x00000000000000000000000000000000, 1663158266, 'Created character <b>Mike</b>.'),
(27, 770692352, 0x00000000000000000000000000000000, 1663159164, 'Account created.'),
(27, 770692352, 0x00000000000000000000000000000000, 1663159166, 'Created character <b>Konab</b>.'),
(21, 1486673815, 0x00000000000000000000000000000000, 1663166099, 'Created character <b>Smutna Dziewica</b>.'),
(28, 1291785445, 0x00000000000000000000000000000000, 1663173196, 'Account created.'),
(28, 1291785445, 0x00000000000000000000000000000000, 1663173199, 'Created character <b>Kindov Upset</b>.'),
(29, 405873612, 0x00000000000000000000000000000000, 1663192128, 'Account created.'),
(29, 405873612, 0x00000000000000000000000000000000, 1663192129, 'Created character <b>Alan</b>.'),
(30, 3147416434, 0x00000000000000000000000000000000, 1663197623, 'Account created.'),
(30, 3147416434, 0x00000000000000000000000000000000, 1663197625, 'Created character <b>Beater</b>.'),
(22, 635507099, 0x00000000000000000000000000000000, 1663211133, 'Created character <b>Zabiewra</b>.'),
(31, 1223401363, 0x00000000000000000000000000000000, 1663213990, 'Account created.'),
(31, 1223401363, 0x00000000000000000000000000000000, 1663213993, 'Created character <b>Drap</b>.'),
(25, 532079102, 0x00000000000000000000000000000000, 1663223297, 'Created character <b>Dudu</b>.'),
(32, 3582375603, 0x00000000000000000000000000000000, 1663223483, 'Account created.'),
(32, 3582375603, 0x00000000000000000000000000000000, 1663223485, 'Created character <b>Why Such High Rate</b>.'),
(33, 1497369093, 0x00000000000000000000000000000000, 1663224074, 'Account created.'),
(33, 1497369093, 0x00000000000000000000000000000000, 1663224075, 'Created character <b>Sanczo Panczo</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228213, 'Account password changed.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228231, 'Deleted character <b>Sorcerer Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228241, 'Deleted character <b>Druid Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228250, 'Deleted character <b>Paladin Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228258, 'Deleted character <b>Knight Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228265, 'Deleted character <b>Rook Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228273, 'Changed comment for character <b>Rook Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228284, 'Changed comment for character <b>Sorcerer Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228291, 'Changed comment for character <b>Druid Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228297, 'Changed comment for character <b>Paladin Sample</b>.'),
(1, 3375068451, 0x00000000000000000000000000000000, 1663228303, 'Changed comment for character <b>Knight Sample</b>.'),
(34, 1473135197, 0x00000000000000000000000000000000, 1663240743, 'Account created.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663245280, 'Created character <b>Uchiha Smoker Club</b>.'),
(35, 1441900264, 0x00000000000000000000000000000000, 1663246526, 'Account created.'),
(35, 1441900264, 0x00000000000000000000000000000000, 1663246528, 'Created character <b>Yzzy</b>.'),
(36, 1441900264, 0x00000000000000000000000000000000, 1663247044, 'Account created.'),
(36, 1441900264, 0x00000000000000000000000000000000, 1663247045, 'Created character <b>Chillout</b>.'),
(34, 1473135197, 0x00000000000000000000000000000000, 1663249811, 'Created character <b>Revonret</b>.'),
(37, 1313440595, 0x00000000000000000000000000000000, 1663258580, 'Account created.'),
(37, 1313440595, 0x00000000000000000000000000000000, 1663258583, 'Created character <b>Eclipsey</b>.'),
(38, 1313230376, 0x00000000000000000000000000000000, 1663261693, 'Account created.'),
(38, 1313230376, 0x00000000000000000000000000000000, 1663261694, 'Created character <b>Saint</b>.'),
(38, 1313230376, 0x00000000000000000000000000000000, 1663262524, 'Created character <b>Penna</b>.'),
(39, 2548108136, 0x00000000000000000000000000000000, 1663266415, 'Account created.'),
(39, 2548108136, 0x00000000000000000000000000000000, 1663266417, 'Created character <b>War Bringer</b>.'),
(40, 1580999147, 0x00000000000000000000000000000000, 1663266913, 'Account created.'),
(40, 1580999147, 0x00000000000000000000000000000000, 1663266914, 'Created character <b>Auron</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663268273, 'Changed comment for character <b>Drullaz</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663268279, 'Changed comment for character <b>Rallaz</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663268285, 'Changed comment for character <b>Chrallaz</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663268290, 'Changed comment for character <b>Drullaz</b>.'),
(12, 3232235777, 0x00000000000000000000000000000000, 1663268296, 'Changed comment for character <b>Frallaz</b>.'),
(34, 1473135197, 0x00000000000000000000000000000000, 1663271461, 'Created character <b>Zonkus</b>.'),
(41, 3185191926, 0x00000000000000000000000000000000, 1663273301, 'Account created.'),
(41, 3185191926, 0x00000000000000000000000000000000, 1663273303, 'Created character <b>Above All</b>.'),
(42, 2865487211, 0x00000000000000000000000000000000, 1663276974, 'Account created.'),
(42, 2865487211, 0x00000000000000000000000000000000, 1663276976, 'Created character <b>Remie</b>.'),
(42, 2865487211, 0x00000000000000000000000000000000, 1663280165, 'Created character <b>Hitno</b>.'),
(43, 1759208234, 0x00000000000000000000000000000000, 1663289220, 'Account created.'),
(43, 1759208234, 0x00000000000000000000000000000000, 1663289221, 'Created character <b>Obamanizer</b>.'),
(44, 1497378963, 0x00000000000000000000000000000000, 1663311062, 'Account created.'),
(44, 1497378963, 0x00000000000000000000000000000000, 1663311063, 'Created character <b>Acee</b>.'),
(45, 3184244414, 0x00000000000000000000000000000000, 1663322411, 'Account created.'),
(45, 3184244414, 0x00000000000000000000000000000000, 1663322413, 'Created character <b>Roddet</b>.'),
(46, 3298512923, 0x00000000000000000000000000000000, 1663331005, 'Account created.'),
(46, 3298512923, 0x00000000000000000000000000000000, 1663331007, 'Created character <b>King</b>.'),
(47, 1497599078, 0x00000000000000000000000000000000, 1663331145, 'Account created.'),
(47, 1497599078, 0x00000000000000000000000000000000, 1663331146, 'Created character <b>Knicz</b>.'),
(48, 1497599078, 0x00000000000000000000000000000000, 1663331626, 'Account created.'),
(48, 1497599078, 0x00000000000000000000000000000000, 1663331627, 'Created character <b>Kniczownik</b>.'),
(49, 3181479723, 0x00000000000000000000000000000000, 1663339644, 'Account created.'),
(49, 3181479723, 0x00000000000000000000000000000000, 1663339645, 'Created character <b>Sokratos</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341838, 'Account created.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341839, 'Created character <b>Kola Ananas</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341861, 'Created character <b>Whisky Ananas</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341873, 'Created character <b>Whiski Kola</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341888, 'Created character <b>Robie Laski</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341899, 'Created character <b>Jem Zupe</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341909, 'Created character <b>Lody Ekipy</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341921, 'Created character <b>Bombelkowy Potwor</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341933, 'Created character <b>Boxdel Faja</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341946, 'Created character <b>Zapalkj</b>.'),
(50, 635507099, 0x00000000000000000000000000000000, 1663341956, 'Created character <b>Hycel</b>.'),
(51, 2991907288, 0x00000000000000000000000000000000, 1663342172, 'Account created.'),
(51, 2991907288, 0x00000000000000000000000000000000, 1663342174, 'Created character <b>Insane</b>.'),
(52, 1503080245, 0x00000000000000000000000000000000, 1663345694, 'Account created.'),
(52, 1503080245, 0x00000000000000000000000000000000, 1663345695, 'Created character <b>Kamilq</b>.'),
(53, 3581353193, 0x00000000000000000000000000000000, 1663345697, 'Account created.'),
(53, 3581353193, 0x00000000000000000000000000000000, 1663345698, 'Created character <b>Matiq</b>.'),
(54, 1407352430, 0x00000000000000000000000000000000, 1663345889, 'Account created.'),
(54, 1407352430, 0x00000000000000000000000000000000, 1663345890, 'Created character <b>Rofl</b>.'),
(54, 1407352430, 0x00000000000000000000000000000000, 1663345906, 'Created character <b>Lmao</b>.'),
(54, 1407352430, 0x00000000000000000000000000000000, 1663345913, 'Changed comment for character <b>Lmao</b>.'),
(54, 1407352430, 0x00000000000000000000000000000000, 1663345919, 'Changed comment for character <b>Rofl</b>.'),
(49, 3181479723, 0x00000000000000000000000000000000, 1663346603, 'Created character <b>Summo</b>.'),
(49, 3181479723, 0x00000000000000000000000000000000, 1663346720, 'Created character <b>Protection</b>.'),
(55, 1394270753, 0x00000000000000000000000000000000, 1663348392, 'Account created.'),
(55, 1394270753, 0x00000000000000000000000000000000, 1663348394, 'Created character <b>Ayonica</b>.'),
(56, 1375832739, 0x00000000000000000000000000000000, 1663350115, 'Account created.'),
(56, 1375832739, 0x00000000000000000000000000000000, 1663350117, 'Created character <b>Meth</b>.'),
(57, 1407352430, 0x00000000000000000000000000000000, 1663363304, 'Account created.'),
(57, 1407352430, 0x00000000000000000000000000000000, 1663363307, 'Created character <b>Smega</b>.'),
(52, 1503080245, 0x00000000000000000000000000000000, 1663367977, 'Created character <b>Legendary Warrior</b>.'),
(58, 1508565718, 0x00000000000000000000000000000000, 1663376623, 'Account created.'),
(58, 1508565718, 0x00000000000000000000000000000000, 1663376624, 'Created character <b>Pow Pow</b>.'),
(58, 1508565718, 0x00000000000000000000000000000000, 1663377172, 'Created character <b>Maxi King</b>.'),
(59, 3022047707, 0x00000000000000000000000000000000, 1663416697, 'Account created.'),
(59, 3022047707, 0x00000000000000000000000000000000, 1663416699, 'Created character <b>Atrz</b>.'),
(60, 1337949382, 0x00000000000000000000000000000000, 1663419247, 'Account created.'),
(60, 1337949382, 0x00000000000000000000000000000000, 1663419248, 'Created character <b>Bogdan Rp</b>.'),
(61, 1580999147, 0x00000000000000000000000000000000, 1663422980, 'Account created.'),
(61, 1580999147, 0x00000000000000000000000000000000, 1663422982, 'Created character <b>Waki</b>.'),
(62, 1580999147, 0x00000000000000000000000000000000, 1663423009, 'Account created.'),
(62, 1580999147, 0x00000000000000000000000000000000, 1663423011, 'Created character <b>Auronz</b>.'),
(63, 1497394640, 0x00000000000000000000000000000000, 1663426111, 'Account created.'),
(63, 1497394640, 0x00000000000000000000000000000000, 1663426113, 'Created character <b>Psajdak</b>.'),
(64, 1571848238, 0x00000000000000000000000000000000, 1663426433, 'Account created.'),
(64, 1571848238, 0x00000000000000000000000000000000, 1663426435, 'Created character <b>Yauron</b>.'),
(29, 405873612, 0x00000000000000000000000000000000, 1663428524, 'Created character <b>King Alan</b>.'),
(29, 405873612, 0x00000000000000000000000000000000, 1663429577, 'Created character <b>Knight Alan</b>.'),
(65, 1446990932, 0x00000000000000000000000000000000, 1663440247, 'Account created.'),
(65, 1446990932, 0x00000000000000000000000000000000, 1663440248, 'Created character <b>Greaty</b>.'),
(65, 1446990932, 0x00000000000000000000000000000000, 1663440746, 'Created character <b>Naruto</b>.'),
(66, 95263823, 0x00000000000000000000000000000000, 1663441306, 'Account created.'),
(66, 95263823, 0x00000000000000000000000000000000, 1663441308, 'Created character <b>Kamil\'q</b>.'),
(58, 1508565718, 0x00000000000000000000000000000000, 1663443013, 'Created character <b>Kiritoxd</b>.'),
(67, 1409100634, 0x00000000000000000000000000000000, 1663486850, 'Account created.'),
(66, 95263823, 0x00000000000000000000000000000000, 1663500511, 'Created character <b>Palacz Kurwo Jebana</b>.'),
(68, 1605253058, 0x00000000000000000000000000000000, 1663504109, 'Account created.'),
(68, 1605253058, 0x00000000000000000000000000000000, 1663504110, 'Created character <b>Karington</b>.'),
(69, 1508565718, 0x00000000000000000000000000000000, 1663515614, 'Account created.'),
(69, 1508565718, 0x00000000000000000000000000000000, 1663515615, 'Created character <b>Marila</b>.'),
(29, 405873612, 0x00000000000000000000000000000000, 1663515948, 'Created character <b>Sorc Boi Alan</b>.'),
(70, 1486653138, 0x00000000000000000000000000000000, 1663526345, 'Account created.'),
(70, 1486653138, 0x00000000000000000000000000000000, 1663526347, 'Created character <b>Gimb</b>.'),
(31, 1223401363, 0x00000000000000000000000000000000, 1663526743, 'Created character <b>Magus</b>.'),
(71, 856641062, 0x00000000000000000000000000000000, 1663567502, 'Account created.'),
(71, 856641062, 0x00000000000000000000000000000000, 1663567504, 'Created character <b>Azte</b>.'),
(72, 1528968676, 0x00000000000000000000000000000000, 1663581099, 'Account created.'),
(72, 1528968676, 0x00000000000000000000000000000000, 1663581101, 'Created character <b>Dread</b>.'),
(72, 1528968676, 0x00000000000000000000000000000000, 1663581288, 'Created character <b>Dreddy</b>.'),
(73, 3120985587, 0x00000000000000000000000000000000, 1663589119, 'Account created.'),
(73, 3120985587, 0x00000000000000000000000000000000, 1663589121, 'Created character <b>Percibal</b>.'),
(21, 1486673825, 0x00000000000000000000000000000000, 1663589211, 'Created character <b>Odbytsamicymorsa</b>.'),
(74, 1423300375, 0x00000000000000000000000000000000, 1663594325, 'Account created.'),
(74, 1423300375, 0x00000000000000000000000000000000, 1663594326, 'Created character <b>Makkan</b>.'),
(75, 3149273952, 0x00000000000000000000000000000000, 1663605314, 'Account created.'),
(75, 3149273952, 0x00000000000000000000000000000000, 1663605315, 'Created character <b>Xuxaralho</b>.'),
(76, 1250211393, 0x00000000000000000000000000000000, 1663605575, 'Account created.'),
(76, 1250211393, 0x00000000000000000000000000000000, 1663605576, 'Created character <b>Merk</b>.'),
(75, 3149273952, 0x00000000000000000000000000000000, 1663605609, 'Created character <b>Kiritroxa</b>.'),
(77, 979952627, 0x00000000000000000000000000000000, 1663619584, 'Account created.'),
(77, 979952627, 0x00000000000000000000000000000000, 1663619586, 'Created character <b>Saya</b>.'),
(77, 979952627, 0x00000000000000000000000000000000, 1663619616, 'Created character <b>Ante</b>.'),
(78, 1313787337, 0x00000000000000000000000000000000, 1663628913, 'Account created.'),
(78, 1313787337, 0x00000000000000000000000000000000, 1663628916, 'Created character <b>Zoiich</b>.'),
(79, 1436351985, 0x00000000000000000000000000000000, 1663661058, 'Account created.'),
(79, 1436351985, 0x00000000000000000000000000000000, 1663661060, 'Created character <b>Blink</b>.'),
(53, 3581353193, 0x00000000000000000000000000000000, 1663664149, 'Created character <b>Chillings</b>.'),
(80, 3581353193, 0x00000000000000000000000000000000, 1663664233, 'Account created.'),
(80, 3581353193, 0x00000000000000000000000000000000, 1663664235, 'Created character <b>Tropek</b>.'),
(80, 3581353193, 0x00000000000000000000000000000000, 1663664278, 'Created character <b>Vallendor</b>.'),
(69, 1508565718, 0x00000000000000000000000000000000, 1663678160, 'Created character <b>Merila</b>.'),
(81, 1337970634, 0x00000000000000000000000000000000, 1663699722, 'Account created.'),
(81, 1337970634, 0x00000000000000000000000000000000, 1663699724, 'Created character <b>Booben</b>.'),
(82, 1409265899, 0x00000000000000000000000000000000, 1663701509, 'Account created.'),
(82, 1409265899, 0x00000000000000000000000000000000, 1663701511, 'Created character <b>Zach</b>.'),
(83, 1652601921, 0x00000000000000000000000000000000, 1663703350, 'Account created.'),
(83, 1652601921, 0x00000000000000000000000000000000, 1663703351, 'Created character <b>Original Vampire</b>.'),
(22, 524153890, 0x00000000000000000000000000000000, 1663707211, 'Created character <b>Kutas Zlamany</b>.'),
(84, 1356199007, 0x00000000000000000000000000000000, 1663760715, 'Account created.'),
(84, 1356199007, 0x00000000000000000000000000000000, 1663760717, 'Created character <b>Sunnex</b>.'),
(85, 1394077636, 0x00000000000000000000000000000000, 1663761580, 'Account created.'),
(85, 1394077636, 0x00000000000000000000000000000000, 1663761582, 'Created character <b>Noyek</b>.'),
(86, 1545795987, 0x00000000000000000000000000000000, 1663777641, 'Account created.'),
(86, 1545795987, 0x00000000000000000000000000000000, 1663777643, 'Created character <b>Aqres</b>.'),
(87, 1839106186, 0x00000000000000000000000000000000, 1663778134, 'Account created.'),
(87, 1839106186, 0x00000000000000000000000000000000, 1663778135, 'Created character <b>Jonny</b>.'),
(88, 520847736, 0x00000000000000000000000000000000, 1663788015, 'Account created.'),
(88, 520847736, 0x00000000000000000000000000000000, 1663788017, 'Created character <b>Keiko</b>.'),
(89, 2857329228, 0x00000000000000000000000000000000, 1663797129, 'Account created.'),
(89, 2857329228, 0x00000000000000000000000000000000, 1663797130, 'Created character <b>Mike Tankson</b>.'),
(90, 3386047076, 0x00000000000000000000000000000000, 1663809391, 'Account created.'),
(90, 3386047076, 0x00000000000000000000000000000000, 1663809392, 'Created character <b>Crystal</b>.'),
(91, 1377620500, 0x00000000000000000000000000000000, 1663828422, 'Account created.'),
(91, 1377620500, 0x00000000000000000000000000000000, 1663828423, 'Created character <b>Weeb</b>.'),
(92, 1572066217, 0x00000000000000000000000000000000, 1663833180, 'Account created.'),
(92, 1572066217, 0x00000000000000000000000000000000, 1663833182, 'Created character <b>Mati</b>.'),
(79, 1436351985, 0x00000000000000000000000000000000, 1663844399, 'Created character <b>Tyrone</b>.'),
(93, 2508988027, 0x00000000000000000000000000000000, 1663858933, 'Account created.'),
(93, 2508988027, 0x00000000000000000000000000000000, 1663858935, 'Created character <b>Network</b>.'),
(94, 1426606212, 0x00000000000000000000000000000000, 1663866905, 'Account created.'),
(94, 1426606212, 0x00000000000000000000000000000000, 1663866907, 'Created character <b>Karl</b>.'),
(95, 1154368727, 0x00000000000000000000000000000000, 1663882861, 'Account created.'),
(95, 1154368727, 0x00000000000000000000000000000000, 1663882867, 'Created character <b>Arkangel</b>.'),
(96, 1182922837, 0x00000000000000000000000000000000, 1663892598, 'Account created.'),
(96, 1182922837, 0x00000000000000000000000000000000, 1663892599, 'Created character <b>Ownage</b>.'),
(97, 1423300375, 0x00000000000000000000000000000000, 1663898845, 'Account created.'),
(97, 1423300375, 0x00000000000000000000000000000000, 1663898847, 'Created character <b>Sony</b>.'),
(95, 1154368727, 0x00000000000000000000000000000000, 1663904025, 'Created character <b>Joker</b>.'),
(95, 1154368727, 0x00000000000000000000000000000000, 1663904071, 'Created character <b>Abaddon</b>.'),
(98, 3138814889, 0x00000000000000000000000000000000, 1663949975, 'Account created.'),
(98, 3138814889, 0x00000000000000000000000000000000, 1663949977, 'Created character <b>Aurora Boreal</b>.'),
(99, 3010555459, 0x00000000000000000000000000000000, 1663950082, 'Account created.'),
(99, 3010555459, 0x00000000000000000000000000000000, 1663950083, 'Created character <b>Lethean</b>.'),
(100, 3216159908, 0x00000000000000000000000000000000, 1663955125, 'Account created.'),
(100, 3216159908, 0x00000000000000000000000000000000, 1663955127, 'Created character <b>Samukahere</b>.'),
(101, 3359800962, 0x00000000000000000000000000000000, 1663955377, 'Account created.'),
(101, 3359800962, 0x00000000000000000000000000000000, 1663955379, 'Created character <b>Trembolado</b>.'),
(102, 3135538429, 0x00000000000000000000000000000000, 1663960761, 'Account created.'),
(102, 3135538429, 0x00000000000000000000000000000000, 1663960764, 'Created character <b>Bobsz</b>.'),
(77, 979952627, 0x00000000000000000000000000000000, 1663964783, 'Created character <b>Elya</b>.'),
(103, 3180907244, 0x00000000000000000000000000000000, 1663967760, 'Account created.'),
(103, 3180907244, 0x00000000000000000000000000000000, 1663967763, 'Created character <b>Liro</b>.'),
(97, 1423300375, 0x00000000000000000000000000000000, 1663969261, 'Created character <b>Snuffix</b>.'),
(104, 1085561736, 0x00000000000000000000000000000000, 1663978002, 'Account created.'),
(104, 1085561736, 0x00000000000000000000000000000000, 1663978004, 'Created character <b>Zylix</b>.'),
(105, 3141099425, 0x00000000000000000000000000000000, 1663996177, 'Account created.'),
(105, 3141099425, 0x00000000000000000000000000000000, 1663996178, 'Created character <b>Jhei Greemory</b>.'),
(106, 1423571875, 0x00000000000000000000000000000000, 1664023143, 'Account created.'),
(106, 1423571875, 0x00000000000000000000000000000000, 1664023145, 'Created character <b>Swaag</b>.'),
(86, 1545795987, 0x00000000000000000000000000000000, 1664037370, 'Created character <b>Trilam</b>.'),
(88, 520847736, 0x00000000000000000000000000000000, 1664037585, 'Account email changed to <b>ave.arsis@gmail.com</b>'),
(107, 1503739693, 0x00000000000000000000000000000000, 1664104730, 'Account created.'),
(107, 1503739693, 0x00000000000000000000000000000000, 1664104731, 'Created character <b>Baki</b>.'),
(107, 1503739693, 0x00000000000000000000000000000000, 1664108866, 'Deleted character <b>Baki</b>.'),
(107, 1503739693, 0x00000000000000000000000000000000, 1664108920, 'Created character <b>Taki Sobie</b>.'),
(108, 779625761, 0x00000000000000000000000000000000, 1664110195, 'Account created.'),
(108, 779625761, 0x00000000000000000000000000000000, 1664110197, 'Created character <b>Puzzledfollower</b>.'),
(109, 1522511806, 0x00000000000000000000000000000000, 1664116145, 'Account created.'),
(109, 1522511806, 0x00000000000000000000000000000000, 1664116147, 'Created character <b>Fearbear</b>.'),
(110, 1412755713, 0x00000000000000000000000000000000, 1664123711, 'Account created.'),
(110, 1412755713, 0x00000000000000000000000000000000, 1664123712, 'Created character <b>Mursh</b>.'),
(110, 1412755713, 0x00000000000000000000000000000000, 1664130494, 'Created character <b>Vatuli</b>.'),
(110, 1412755713, 0x00000000000000000000000000000000, 1664130519, 'Created character <b>Murshie</b>.'),
(111, 1313246052, 0x00000000000000000000000000000000, 1664134660, 'Account created.'),
(111, 1313246052, 0x00000000000000000000000000000000, 1664134662, 'Created character <b>Kirito</b>.'),
(112, 1451222334, 0x00000000000000000000000000000000, 1664189723, 'Account created.'),
(112, 1451222334, 0x00000000000000000000000000000000, 1664189725, 'Created character <b>Waixito Saiyajin</b>.'),
(113, 3141571964, 0x00000000000000000000000000000000, 1664216797, 'Account created.'),
(113, 3141571964, 0x00000000000000000000000000000000, 1664216798, 'Created character <b>Razdwatrzy</b>.'),
(114, 3216249237, 0x00000000000000000000000000000000, 1664223038, 'Account created.'),
(114, 3216249237, 0x00000000000000000000000000000000, 1664223040, 'Created character <b>Karin</b>.'),
(115, 3141571964, 0x00000000000000000000000000000000, 1664226766, 'Account created.'),
(115, 3141571964, 0x00000000000000000000000000000000, 1664226768, 'Created character <b>Urso Granada</b>.'),
(113, 3141571964, 0x00000000000000000000000000000000, 1664227016, 'Created character <b>Cervo Bazuca</b>.'),
(116, 2979312475, 0x00000000000000000000000000000000, 1664233503, 'Account created.'),
(116, 2979312475, 0x00000000000000000000000000000000, 1664233506, 'Created character <b>Kibao</b>.'),
(117, 1342540113, 0x00000000000000000000000000000000, 1664276567, 'Account created.'),
(117, 1342540113, 0x00000000000000000000000000000000, 1664276569, 'Created character <b>Ellie</b>.'),
(118, 2975608917, 0x00000000000000000000000000000000, 1664295381, 'Account created.'),
(118, 2975608917, 0x00000000000000000000000000000000, 1664295383, 'Created character <b>Bruxo</b>.'),
(107, 1503739693, 0x00000000000000000000000000000000, 1664301074, 'Created character <b>Basilisk</b>.'),
(119, 1593821455, 0x00000000000000000000000000000000, 1664404101, 'Account created.'),
(119, 1593821455, 0x00000000000000000000000000000000, 1664404102, 'Created character <b>Hassearo</b>.'),
(120, 19891685, 0x00000000000000000000000000000000, 1664409245, 'Account created.'),
(120, 19891685, 0x00000000000000000000000000000000, 1664409248, 'Created character <b>Azteh</b>.'),
(121, 1441018325, 0x00000000000000000000000000000000, 1664472043, 'Account created.'),
(121, 1441018325, 0x00000000000000000000000000000000, 1664472045, 'Created character <b>Mefsito</b>.'),
(122, 1423232832, 0x00000000000000000000000000000000, 1664476318, 'Account created.'),
(122, 1423232832, 0x00000000000000000000000000000000, 1664476319, 'Created character <b>Hviles</b>.'),
(123, 1261234670, 0x00000000000000000000000000000000, 1664478340, 'Account created.'),
(123, 1261234670, 0x00000000000000000000000000000000, 1664478342, 'Created character <b>Sheshooter</b>.'),
(81, 1337966280, 0x00000000000000000000000000000000, 1664550485, 'Created character <b>Titt</b>.'),
(124, 1318548643, 0x00000000000000000000000000000000, 1664552386, 'Account created.'),
(124, 1318548643, 0x00000000000000000000000000000000, 1664552388, 'Created character <b>Shocker</b>.'),
(114, 3216249237, 0x00000000000000000000000000000000, 1664691117, 'Created character <b>Karin Paladin</b>.'),
(125, 1398088346, 0x00000000000000000000000000000000, 1664740445, 'Account created.'),
(125, 1398088346, 0x00000000000000000000000000000000, 1664740447, 'Created character <b>Miss Chien</b>.'),
(126, 3184242253, 0x00000000000000000000000000000000, 1664870776, 'Account created.'),
(126, 3184242253, 0x00000000000000000000000000000000, 1664870778, 'Created character <b>Adrigar</b>.'),
(127, 755353762, 0x00000000000000000000000000000000, 1665022438, 'Account created.'),
(127, 755353762, 0x00000000000000000000000000000000, 1665022440, 'Created character <b>Collossus</b>.'),
(128, 1423488269, 0x00000000000000000000000000000000, 1665391818, 'Account created.'),
(128, 1423488269, 0x00000000000000000000000000000000, 1665391820, 'Created character <b>Fuhrer</b>.'),
(129, 3375240006, 0x00000000000000000000000000000000, 1665439224, 'Account created.'),
(129, 3375240006, 0x00000000000000000000000000000000, 1665439227, 'Created character <b>Ikari</b>.'),
(130, 3375309181, 0x00000000000000000000000000000000, 1665552323, 'Account created.'),
(130, 3375309181, 0x00000000000000000000000000000000, 1665552325, 'Created character <b>Lkenji</b>.'),
(130, 3375309181, 0x00000000000000000000000000000000, 1665558115, 'Created character <b>Lknight</b>.'),
(131, 3375309181, 0x00000000000000000000000000000000, 1665558480, 'Account created.'),
(131, 3375309181, 0x00000000000000000000000000000000, 1665558482, 'Created character <b>Lknj</b>.'),
(132, 1313339085, 0x00000000000000000000000000000000, 1665566532, 'Account created.'),
(132, 1313339085, 0x00000000000000000000000000000000, 1665566533, 'Created character <b>Melliie</b>.'),
(131, 3373680863, 0x00000000000000000000000000000000, 1665639723, 'Created character <b>Lsorc</b>.'),
(133, 770355748, 0x00000000000000000000000000000000, 1665686918, 'Account created.'),
(133, 770355748, 0x00000000000000000000000000000000, 1665686920, 'Created character <b>Wivivol</b>.'),
(134, 1593830606, 0x00000000000000000000000000000000, 1665693335, 'Account created.'),
(134, 1593830606, 0x00000000000000000000000000000000, 1665693337, 'Created character <b>Knuggelugge</b>.'),
(135, 3146286822, 0x00000000000000000000000000000000, 1665701490, 'Account created.'),
(135, 3146286822, 0x00000000000000000000000000000000, 1665701492, 'Created character <b>Hero</b>.'),
(136, 3146286822, 0x00000000000000000000000000000000, 1665701528, 'Account created.'),
(136, 3146286822, 0x00000000000000000000000000000000, 1665701530, 'Created character <b>Sound</b>.'),
(137, 2321668424, 0x00000000000000000000000000000000, 1665722761, 'Account created.'),
(137, 2321668424, 0x00000000000000000000000000000000, 1665722765, 'Created character <b>Meww</b>.'),
(130, 3373680863, 0x00000000000000000000000000000000, 1665788362, 'Created character <b>Ldruid</b>.'),
(138, 3017178672, 0x00000000000000000000000000000000, 1665878357, 'Account created.'),
(138, 3017178672, 0x00000000000000000000000000000000, 1665878359, 'Created character <b>Barcarolle</b>.'),
(139, 623879503, 0x00000000000000000000000000000000, 1665878522, 'Account created.'),
(139, 623879503, 0x00000000000000000000000000000000, 1665878523, 'Created character <b>Vuko</b>.'),
(140, 2487682626, 0x00000000000000000000000000000000, 1665881408, 'Account created.'),
(140, 2487682626, 0x00000000000000000000000000000000, 1665881410, 'Created character <b>Beldroega</b>.'),
(140, 2487682626, 0x00000000000000000000000000000000, 1665881440, 'Created character <b>Kebs</b>.'),
(140, 2487682626, 0x00000000000000000000000000000000, 1665881453, 'Created character <b>Drogado</b>.'),
(141, 2984457127, 0x00000000000000000000000000000000, 1665968329, 'Account created.'),
(141, 2984457127, 0x00000000000000000000000000000000, 1665968331, 'Created character <b>Kikixs</b>.'),
(141, 2984457127, 0x00000000000000000000000000000000, 1665968362, 'Created character <b>Apolo</b>.'),
(142, 3149725092, 0x00000000000000000000000000000000, 1665968377, 'Account created.'),
(142, 3149725092, 0x00000000000000000000000000000000, 1665968380, 'Created character <b>Mexboy</b>.'),
(143, 3187443716, 0x00000000000000000000000000000000, 1665968694, 'Account created.'),
(143, 3187443716, 0x00000000000000000000000000000000, 1665968696, 'Created character <b>Guts</b>.'),
(141, 2984457127, 0x00000000000000000000000000000000, 1665974023, 'Created character <b>Ken Master</b>.'),
(141, 2984457127, 0x00000000000000000000000000000000, 1665974044, 'Created character <b>Apso</b>.'),
(144, 2999709437, 0x00000000000000000000000000000000, 1666040825, 'Account created.'),
(144, 2999709437, 0x00000000000000000000000000000000, 1666040828, 'Created character <b>Schicki</b>.'),
(144, 2999709437, 0x00000000000000000000000000000000, 1666043020, 'Created character <b>Dabombadave</b>.'),
(145, 3149386451, 0x00000000000000000000000000000000, 1666113237, 'Account created.'),
(145, 3149386451, 0x00000000000000000000000000000000, 1666113239, 'Created character <b>Ra\'s Al Ghul</b>.'),
(146, 532073972, 0x00000000000000000000000000000000, 1666131967, 'Account created.'),
(146, 532073972, 0x00000000000000000000000000000000, 1666131968, 'Created character <b>Kunoichi</b>.'),
(147, 2970357860, 0x00000000000000000000000000000000, 1666151400, 'Account created.'),
(147, 2970357860, 0x00000000000000000000000000000000, 1666151402, 'Created character <b>Lazera</b>.'),
(148, 755273855, 0x00000000000000000000000000000000, 1666185615, 'Account created.'),
(148, 755273855, 0x00000000000000000000000000000000, 1666185616, 'Created character <b>Ancaro</b>.'),
(149, 3001794500, 0x00000000000000000000000000000000, 1666221564, 'Account created.'),
(149, 3001794500, 0x00000000000000000000000000000000, 1666221568, 'Created character <b>Pilchu</b>.'),
(150, 3137728634, 0x00000000000000000000000000000000, 1666228800, 'Account created.'),
(150, 3137728634, 0x00000000000000000000000000000000, 1666228801, 'Created character <b>Batosai</b>.'),
(151, 1505489631, 0x00000000000000000000000000000000, 1666255055, 'Account created.'),
(151, 1505489631, 0x00000000000000000000000000000000, 1666255056, 'Created character <b>Geal</b>.'),
(152, 1050915313, 0x00000000000000000000000000000000, 1666272596, 'Account created.'),
(152, 1050915313, 0x00000000000000000000000000000000, 1666272597, 'Created character <b>Harde Kaas</b>.'),
(153, 3657108614, 0x00000000000000000000000000000000, 1666276422, 'Account created.'),
(153, 3657108614, 0x00000000000000000000000000000000, 1666276423, 'Created character <b>Limit</b>.'),
(154, 3657108614, 0x00000000000000000000000000000000, 1666277219, 'Account created.'),
(154, 3657108614, 0x00000000000000000000000000000000, 1666277221, 'Created character <b>Royal Shoot</b>.'),
(144, 2999709437, 0x00000000000000000000000000000000, 1666354406, 'Created character <b>Schickimicki</b>.'),
(144, 2999709437, 0x00000000000000000000000000000000, 1666354415, 'Created character <b>Dabomba</b>.'),
(155, 1138268041, 0x00000000000000000000000000000000, 1666470654, 'Account created.'),
(155, 1138268041, 0x00000000000000000000000000000000, 1666470655, 'Created character <b>Superbeast</b>.'),
(156, 1394268981, 0x00000000000000000000000000000000, 1666479599, 'Account created.'),
(156, 1394268981, 0x00000000000000000000000000000000, 1666479601, 'Created character <b>Melepeta</b>.'),
(157, 2916167802, 0x00000000000000000000000000000000, 1666582851, 'Account created.'),
(157, 2916167802, 0x00000000000000000000000000000000, 1666582852, 'Created character <b>Dylan Maguire</b>.'),
(158, 1593832133, 0x00000000000000000000000000000000, 1666642971, 'Account created.'),
(158, 1593832133, 0x00000000000000000000000000000000, 1666642972, 'Created character <b>Aries</b>.'),
(158, 1593832133, 0x00000000000000000000000000000000, 1666643955, 'Created character <b>Tjoa</b>.'),
(159, 40377627, 0x00000000000000000000000000000000, 1666789258, 'Account created.'),
(159, 40377627, 0x00000000000000000000000000000000, 1666789260, 'Created character <b>Onyx</b>.'),
(159, 40377627, 0x00000000000000000000000000000000, 1666792054, 'Created character <b>Diabloz</b>.'),
(145, 2970223306, 0x00000000000000000000000000000000, 1666828199, 'Generated recovery key.'),
(145, 2970223306, 0x00000000000000000000000000000000, 1666828268, 'Created character <b>Bruce Wayne</b>.'),
(160, 2999709437, 0x00000000000000000000000000000000, 1666877576, 'Account created.'),
(160, 2999709437, 0x00000000000000000000000000000000, 1666877578, 'Created character <b>Sefa</b>.'),
(160, 2999709437, 0x00000000000000000000000000000000, 1666877673, 'Account password changed.'),
(161, 3143593833, 0x00000000000000000000000000000000, 1667046836, 'Account created.'),
(161, 3143593833, 0x00000000000000000000000000000000, 1667046838, 'Created character <b>Klebinho</b>.'),
(161, 3143593833, 0x00000000000000000000000000000000, 1667050529, 'Created character <b>Duda</b>.'),
(161, 3143593833, 0x00000000000000000000000000000000, 1667053753, 'Created character <b>Dudinha</b>.'),
(162, 1374245528, 0x00000000000000000000000000000000, 1667068555, 'Account created.'),
(162, 1374245528, 0x00000000000000000000000000000000, 1667068557, 'Created character <b>Naeksu</b>.'),
(163, 2831327543, 0x00000000000000000000000000000000, 1667153444, 'Account created.'),
(163, 2831327543, 0x00000000000000000000000000000000, 1667153446, 'Created character <b>Danger</b>.'),
(163, 2831327543, 0x00000000000000000000000000000000, 1667153536, 'Created character <b>Gandalff</b>.'),
(150, 3372396995, 0x00000000000000000000000000000000, 1667257117, 'Created character <b>Neliel Tuuh</b>.'),
(164, 2214532693, 0x00000000000000000000000000000000, 1667265301, 'Account created.'),
(164, 2214532693, 0x00000000000000000000000000000000, 1667265303, 'Created character <b>Locked Marley</b>.'),
(165, 3338633895, 0x00000000000000000000000000000000, 1667414353, 'Account created.'),
(165, 3338633895, 0x00000000000000000000000000000000, 1667414354, 'Created character <b>Squatch</b>.'),
(161, 2975609504, 0x00000000000000000000000000000000, 1667418142, 'Changed comment for character <b>Duda</b>.'),
(166, 1592419132, 0x00000000000000000000000000000000, 1667570331, 'Account created.'),
(166, 1592419132, 0x00000000000000000000000000000000, 1667570333, 'Created character <b>Exorp</b>.'),
(167, 3373840077, 0x00000000000000000000000000000000, 1667653307, 'Account created.'),
(167, 3373840077, 0x00000000000000000000000000000000, 1667653308, 'Created character <b>Losfera</b>.');

-- --------------------------------------------------------

--
-- Table structure for table `myaac_admin_menu`
--

CREATE TABLE `myaac_admin_menu` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `flags` int NOT NULL DEFAULT '0',
  `enabled` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_admin_menu`
--

INSERT INTO `myaac_admin_menu` (`id`, `name`, `page`, `ordering`, `flags`, `enabled`) VALUES
(1, 'Gifts', 'gifts', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_bugtracker`
--

CREATE TABLE `myaac_bugtracker` (
  `account` varchar(255) NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `id` int NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `reply` int NOT NULL DEFAULT '0',
  `who` int NOT NULL DEFAULT '0',
  `uid` int NOT NULL,
  `tag` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_changelog`
--

CREATE TABLE `myaac_changelog` (
  `id` int NOT NULL,
  `body` varchar(500) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - added, 2 - removed, 3 - changed, 4 - fixed',
  `where` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - server, 2 - site',
  `date` int NOT NULL DEFAULT '0',
  `player_id` int NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_changelog`
--

INSERT INTO `myaac_changelog` (`id`, `body`, `type`, `where`, `date`, `player_id`, `hidden`) VALUES
(1, 'MyAAC installed. (:', 3, 2, 1644320316, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_config`
--

CREATE TABLE `myaac_config` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_config`
--

INSERT INTO `myaac_config` (`id`, `name`, `value`) VALUES
(1, 'database_version', '32'),
(2, 'status_online', ''),
(3, 'status_players', '0'),
(4, 'status_playersMax', '0'),
(5, 'status_lastCheck', '1667697962'),
(6, 'status_uptime', '58856'),
(7, 'status_monsters', '21265'),
(8, 'views_counter', '33860'),
(9, 'status_uptimeReadable', '16h 20m'),
(10, 'status_motd', 'Welcome to the Aincrad. Try not to die players'),
(11, 'status_mapAuthor', 'SMOKER'),
(12, 'status_mapName', 'aincrad'),
(13, 'status_mapWidth', '34143'),
(14, 'status_mapHeight', '33812'),
(15, 'status_server', 'Canary'),
(16, 'status_serverVersion', '1.2.0'),
(17, 'status_clientVersion', '12.85'),
(18, 'site_closed', '0'),
(19, 'site_closed_message', 'Server is under maintenance, please visit later.');

-- --------------------------------------------------------

--
-- Table structure for table `myaac_faq`
--

CREATE TABLE `myaac_faq` (
  `id` int NOT NULL,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(1020) NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_forum`
--

CREATE TABLE `myaac_forum` (
  `id` int NOT NULL,
  `first_post` int NOT NULL DEFAULT '0',
  `last_post` int NOT NULL DEFAULT '0',
  `section` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0',
  `author_aid` int NOT NULL DEFAULT '0',
  `author_guid` int NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL DEFAULT '',
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_html` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int NOT NULL DEFAULT '0',
  `last_edit_aid` int NOT NULL DEFAULT '0',
  `edit_date` int NOT NULL DEFAULT '0',
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `sticked` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_forum`
--

INSERT INTO `myaac_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_html`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `sticked`, `closed`) VALUES
(2, 2, 1664286803, 3, 0, 29, 13, 26, '<pre><strong>Exura Ico </strong>\r\n<em>Scaling Level &amp; Magic level 100% increased</em>\r\n\r\n<strong>Exura Med Ico</strong> \r\n<em>Scaling Level &amp; Magic level 100% increased</em>\r\n\r\n<strong>Exori</strong> \r\n<em>Skill scaling is 100% increased</em>\r\n\r\n<strong>Exori Gran</strong> \r\n<em>Skill scaling is 100% increased</em>\r\n\r\n <strong>Multi Rasengan has now 4 sec cooldown (was 5)\r\n Multi Rasengan has 50% crit chance</strong> \r\n<em>- Walking cancels channelning\r\n- Cooldown remains 5 seconds but base damage is higher \r\n- Magic level scaling is higher\r\n</em>\r\n<strong> Arcane Missiles has 25% crit chance</strong>\r\n<em>- Walking does not cancel channelning\r\n- Cooldown reduced to 3 seconds (was 5)\r\n- Magic level scaling is higher</em>\r\n\r\n<strong> Lightning Shower / Rain of Meteors now has a wider area spread radius\r\n Lightning Shower / Rain of Meteors had their waves increased to 5 (was 3)</strong>\r\n<em>- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Vita</strong> \r\n<em>- Base healing increased by 100%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Max Vita</strong>\r\n<em>- Base healing increased by 150%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Sio</strong>\r\n<em>- Base healing increased by 80%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Gran Sio</strong> \r\n<em>- Base healing increased by 110%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura San</strong>\r\n<em>- Base healing increased by 70%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Gran San</strong>\r\n<em>- Base healing increased by 110%\r\n- Magic level scaling is higher</em></pre>', 'Patch Notes 1.6.9.5', 0, 1, 1664286803, 0, 1664286978, '193.235.215.103', 0, 0),
(3, 3, 1664287138, 1, 0, 26, 13, 26, '<p><strong>Teaser will be displayed tomorrow..</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Druids will evovle in the Aincrad.</strong></p>\r\n<p><em>Druids have always been close to the nature.&nbsp;</em></p>\r\n<p><em>Therefore they can soon adapt their Combat / play-style with their newly formed allies..</em> ?</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Global Boost system</strong> will be added this week as well needs slightly more testing just in-case.</p>\r\n<p><em>You will be able to purchase Global&nbsp; | ExpBoost or Loot or Skills/Magic Level</em></p>\r\n<p><em>All of these can be active at the same time + your own exp boost.</em></p>\r\n<p><em>You won\'t see a difference in the Client if a \"global boost\" is active.-- it will show 150% anyway.</em></p>\r\n<p><em>I don\'t recommend purchase any of these before Server-save which is always available to check out via Website.</em></p>\r\n<p><em>These will cost Tibia Coins to activate. Price for this is still (TBD)</em></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Commands</strong></p>\r\n<p><em>!gb exp</em></p>\r\n<p><em>!gb loot</em></p>\r\n<p><em>!gb skill</em></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Bossroom news!</strong></p>\r\n<p><em>More mechanics will be added to the upper floors to extend the variation of the gameplay.</em></p>\r\n<p>&nbsp;</p>\r\n<p>Stay tuned&nbsp;</p>', 'Teaser incoming update', 0, 1, 1664287138, 0, 0, '193.235.215.103', 0, 0),
(4, 4, 1665709636, 3, 0, 12, 13, 26, '<p><strong>Patch 1.7.0.0 is now live</strong></p>\r\n<p>Download the new launcher here&nbsp;</p>\r\n<p><a href=\"../Updates/saot.zip\">http://tibia.smoker.gg/Updates/saot.zip</a></p>\r\n<p>or if you don\'t know how to do it you can still use the alternate download link but then you will have to manually patch everything the next time as well..</p>\r\n<p><a href=\"../Updates/client.zip\">http://tibia.smoker.gg/Updates/client.zip</a></p>\r\n<p>&nbsp;</p>\r\n<p>For those who has been playing before this patch you can go to your current <strong>SAOT</strong> folder</p>\r\n<p>Copy these folders below</p>\r\n<p><strong>--- characterdata</strong></p>\r\n<p><strong>--- conf</strong></p>\r\n<p><strong>--- minimap</strong></p>\r\n<p>Now when you have downloaded and install the new <strong>SAOT launcher</strong> to this folder and your settings will be saved for the new client-updater + client<br /><br /></p>\r\n<p><strong><em>C: / Users / YOURUSERNAME / AppData / Roaming / Saot / SAOTversion</em></strong></p>\r\n<p>Paste the folders you copied above to this folder (<strong><em>&nbsp;SAOTversion</em></strong> )</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Warning&nbsp;If you don\'t use the NEW ASSETS</strong></p>\r\n<p>-- you will probably experience crashes</p>\r\n<p>-- you will not be able to loot the new items</p>\r\n<p>-- you will be able to see new effects/missiles</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Features of Patch 1.7.0.0 </strong></p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>Forge system</strong> Allowing players to upgrade 2x identical items from common, rare and epic. The cost varey depending of what you wanna try forge.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>- Cursed chests</strong> A random chest might appear during your adventure in the Aincrad. These chests are a gamblers choice.. When opening a cursed chest depending of the difficulty of it a strong hoard might appear or you can get really lucky and avoid the trap.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>- Floor levels 65/65</strong></li>\r\n<li>130+ new monsters.</li>\r\n<li>54 new bosses.</li>\r\n<li>Floors levels and bosses has been increased to fit the higher levels from 27 - 65.. Keep in mind, usually the higher the floor the more dangerous everything gets..</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>- New spells A new set of spells for each Vocation has been developed to make it possible to Hunt differently. (fireblast, hydropump, boomerang, slay\'n\'prey, [req feral ring] feral bleed, feral slash, feral cleave) and a few more..</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>- 231+ New Items (level 400 and below) -- Will be dropped on most of the lowers floors 1-15. Each floor will have a at least 10 new items</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>New Helmets</li>\r\n<li>New Armors</li>\r\n<li>New Legs</li>\r\n<li>New Boots</li>\r\n<li>New Quivers</li>\r\n<li>New Shields</li>\r\n<li>New Spellbooks</li>\r\n<li>New Wands/Rods</li>\r\n<li>New Crossbow / Bows</li>\r\n<li>New Axe, Clubs &amp; Swords</li>\r\n<li>New Rings</li>\r\n<li>New items with unique abilities like proccing special spells/functions depending of what you get (weapons only)</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>8 New collectable outfits Can be obtained from (A Forgotten Soul) for tasks.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Thanks for being patient.. Also because of the delay for this update I will post-pone Hardcore to OCTOBER 28TH</p>', 'Patch Notes 1.7.0.0', 0, 1, 1665709636, 0, 1665946259, '192.168.1.1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_forum_boards`
--

CREATE TABLE `myaac_forum_boards` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `guild` int NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_forum_boards`
--

INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`, `guild`, `access`, `closed`, `hidden`) VALUES
(1, 'News', 'News commenting', 0, 0, 0, 1, 0),
(2, 'Trade', 'Trade offers.', 1, 0, 0, 0, 0),
(3, 'Changelog', 'Changelogs history', 2, 0, 1, 0, 0),
(6, 'Suggestions', 'Bring up changes', 3, 0, 1, 0, 0),
(7, 'Quest', 'Quest information', 5, 0, 1, 0, 0),
(8, 'General', 'General information', 4, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_gallery`
--

CREATE TABLE `myaac_gallery` (
  `id` int NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_gallery`
--

INSERT INTO `myaac_gallery` (`id`, `comment`, `image`, `thumb`, `author`, `ordering`, `hidden`) VALUES
(3, 'boss room', 'images/gallery/1.png', 'images/gallery/1_thumb.png', 'rekoms', 0, 0),
(4, 'boss room', 'images/gallery/2.png', 'images/gallery/2_thumb.png', 'rekoms', 1, 0),
(5, 'boss room', 'images/gallery/3.png', 'images/gallery/3_thumb.png', 'rekoms', 2, 0),
(6, 'boss room', 'images/gallery/4.png', 'images/gallery/4_thumb.png', 'rekoms', 3, 0),
(7, 'boss room', 'images/gallery/5.png', 'images/gallery/5_thumb.png', 'rekoms', 4, 0),
(8, 'boss room', 'images/gallery/6.png', 'images/gallery/6_thumb.png', 'rekoms', 5, 0),
(9, 'boss room', 'images/gallery/7.png', 'images/gallery/7_thumb.png', 'rekoms', 6, 0),
(10, 'boss room', 'images/gallery/8.png', 'images/gallery/8_thumb.png', 'rekoms', 7, 0),
(11, 'boss room', 'images/gallery/9.png', 'images/gallery/9_thumb.png', 'rekoms', 8, 0),
(12, 'boss room', 'images/gallery/10.png', 'images/gallery/10_thumb.png', 'rekoms', 9, 0),
(13, 'boss room', 'images/gallery/11.png', 'images/gallery/11_thumb.png', 'rekoms', 10, 0),
(14, 'boss room', 'images/gallery/12.png', 'images/gallery/12_thumb.png', 'rekoms', 11, 0),
(15, 'boss room', 'images/gallery/13.png', 'images/gallery/13_thumb.png', 'rekoms', 12, 0),
(16, 'boss room', 'images/gallery/14.png', 'images/gallery/14_thumb.png', 'rekoms', 13, 0),
(17, 'boss room', 'images/gallery/15.png', 'images/gallery/15_thumb.png', 'rekoms', 14, 0),
(18, 'boss room', 'images/gallery/16.png', 'images/gallery/16_thumb.png', 'rekoms', 15, 0),
(19, 'boss room', 'images/gallery/17.png', 'images/gallery/17_thumb.png', 'rekoms', 16, 0),
(20, 'boss room', 'images/gallery/18.png', 'images/gallery/18_thumb.png', 'rekoms', 17, 0),
(21, 'boss room', 'images/gallery/19.png', 'images/gallery/19_thumb.png', 'rekoms', 18, 0),
(22, 'boss room', 'images/gallery/20.png', 'images/gallery/20_thumb.png', 'rekoms', 19, 0),
(23, 'boss room', 'images/gallery/21.png', 'images/gallery/21_thumb.png', 'rekoms', 20, 0),
(24, 'boss room', 'images/gallery/22.png', 'images/gallery/22_thumb.png', 'rekoms', 21, 0),
(25, 'boss room', 'images/gallery/23.png', 'images/gallery/23_thumb.png', 'rekoms', 22, 0),
(26, 'boss room', 'images/gallery/24.png', 'images/gallery/24_thumb.png', 'rekoms', 23, 0),
(27, 'boss room', 'images/gallery/25.png', 'images/gallery/25_thumb.png', 'rekoms', 24, 0),
(28, 'boss room', 'images/gallery/26.png', 'images/gallery/26_thumb.png', 'rekoms', 25, 0),
(29, 'boss room', 'images/gallery/27.png', 'images/gallery/27_thumb.png', 'rekoms', 26, 0),
(30, 'boss room', 'images/gallery/28.png', 'images/gallery/28_thumb.png', 'rekoms', 27, 0),
(31, 'boss room', 'images/gallery/29.png', 'images/gallery/29_thumb.png', 'rekoms', 28, 0),
(32, 'boss room', 'images/gallery/30.png', 'images/gallery/30_thumb.png', 'rekoms', 29, 0),
(33, 'boss room', 'images/gallery/31.png', 'images/gallery/31_thumb.png', 'rekoms', 30, 0),
(34, 'boss room', 'images/gallery/32.png', 'images/gallery/32_thumb.png', 'rekoms', 31, 0),
(35, 'boss room', 'images/gallery/33.png', 'images/gallery/33_thumb.png', 'rekoms', 32, 0),
(36, 'boss room', 'images/gallery/34.png', 'images/gallery/34_thumb.png', 'rekoms', 33, 0),
(37, 'boss room', 'images/gallery/35.png', 'images/gallery/35_thumb.png', 'rekoms', 34, 0),
(38, 'boss room', 'images/gallery/36.png', 'images/gallery/36_thumb.png', 'rekoms', 35, 0),
(39, 'boss room', 'images/gallery/37.png', 'images/gallery/37_thumb.png', 'rekoms', 36, 0),
(40, 'boss room', 'images/gallery/38.png', 'images/gallery/38_thumb.png', 'rekoms', 37, 0);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_menu`
--

CREATE TABLE `myaac_menu` (
  `id` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `blank` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(6) NOT NULL DEFAULT '',
  `category` int NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `enabled` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_menu`
--

INSERT INTO `myaac_menu` (`id`, `template`, `name`, `link`, `blank`, `color`, `category`, `ordering`, `enabled`) VALUES
(1, 'kathrine', 'Latest News', 'news', 0, '', 1, 0, 1),
(2, 'kathrine', 'News Archive', 'news/archive', 0, '', 1, 1, 1),
(3, 'kathrine', 'Changelog', 'changelog', 0, '', 1, 2, 1),
(4, 'kathrine', 'Account Management', 'account/manage', 0, '', 2, 0, 1),
(5, 'kathrine', 'Create Account', 'account/create', 0, '', 2, 1, 1),
(6, 'kathrine', 'Lost Account?', 'account/lost', 0, '', 2, 2, 1),
(7, 'kathrine', 'Server Rules', 'rules', 0, '', 2, 3, 1),
(8, 'kathrine', 'Downloads', 'downloads', 0, '', 5, 4, 1),
(9, 'kathrine', 'Report Bug', 'bugtracker', 0, '', 2, 5, 1),
(10, 'kathrine', 'Who is Online?', 'online', 0, '', 3, 0, 1),
(11, 'kathrine', 'Characters', 'characters', 0, '', 3, 1, 1),
(12, 'kathrine', 'Guilds', 'guilds', 0, '', 3, 2, 1),
(13, 'kathrine', 'Highscores', 'highscores', 0, '', 3, 3, 1),
(14, 'kathrine', 'Last Deaths', 'lastkills', 0, '', 3, 4, 1),
(15, 'kathrine', 'Houses', 'houses', 0, '', 3, 5, 1),
(16, 'kathrine', 'Bans', 'bans', 0, '', 3, 6, 1),
(17, 'kathrine', 'Forum', 'forum', 0, '', 3, 7, 1),
(18, 'kathrine', 'Team', 'team', 0, '', 3, 8, 1),
(19, 'kathrine', 'Monsters', 'creatures', 0, '', 5, 0, 1),
(20, 'kathrine', 'Spells', 'spells', 0, '', 5, 1, 1),
(21, 'kathrine', 'Server Info', 'serverInfo', 0, '', 5, 2, 1),
(22, 'kathrine', 'Commands', 'commands', 0, '', 5, 3, 1),
(23, 'kathrine', 'Gallery', 'gallery', 0, '', 5, 4, 1),
(24, 'kathrine', 'Experience Table', 'experienceTable', 0, '', 5, 5, 1),
(25, 'kathrine', 'FAQ', 'faq', 0, '', 5, 6, 1),
(26, 'kathrine', 'Buy Points', 'points', 0, '', 6, 0, 1),
(27, 'kathrine', 'Shop Offer', 'gifts', 0, '', 6, 1, 1),
(28, 'kathrine', 'Shop History', 'gifts/history', 0, '', 6, 2, 1),
(29, 'tibiacom', 'Latest News', 'news', 0, '', 1, 0, 1),
(30, 'tibiacom', 'News Archive', 'news/archive', 0, '', 1, 1, 1),
(31, 'tibiacom', 'Changelog', 'changelog', 0, '', 1, 2, 1),
(32, 'tibiacom', 'Account Management', 'account/manage', 0, '', 2, 0, 1),
(33, 'tibiacom', 'Create Account', 'account/create', 0, '', 2, 1, 1),
(34, 'tibiacom', 'Lost Account?', 'account/lost', 0, '', 2, 2, 1),
(35, 'tibiacom', 'Server Rules', 'rules', 0, '', 2, 3, 1),
(36, 'tibiacom', 'Downloads', 'downloads', 0, '', 2, 4, 1),
(37, 'tibiacom', 'Report Bug', 'bugtracker', 0, '', 2, 5, 1),
(38, 'tibiacom', 'Characters', 'characters', 0, '', 3, 0, 1),
(39, 'tibiacom', 'Who Is Online?', 'online', 0, '', 3, 1, 1),
(40, 'tibiacom', 'Highscores', 'highscores', 0, '', 3, 2, 1),
(41, 'tibiacom', 'Last Kills', 'lastkills', 0, '', 3, 3, 1),
(42, 'tibiacom', 'Houses', 'houses', 0, '', 3, 4, 1),
(43, 'tibiacom', 'Guilds', 'guilds', 0, '', 3, 5, 1),
(44, 'tibiacom', 'Polls', 'polls', 0, '', 3, 6, 1),
(45, 'tibiacom', 'Bans', 'bans', 0, '', 3, 7, 1),
(46, 'tibiacom', 'Support List', 'team', 0, '', 3, 8, 1),
(47, 'tibiacom', 'Forum', 'forum', 0, '', 4, 0, 1),
(48, 'tibiacom', 'Creatures', 'creatures', 0, '', 5, 0, 1),
(49, 'tibiacom', 'Spells', 'spells', 0, '', 5, 1, 1),
(50, 'tibiacom', 'Commands', 'commands', 0, '', 5, 2, 1),
(51, 'tibiacom', 'Exp Stages', 'experienceStages', 0, '', 5, 3, 1),
(52, 'tibiacom', 'Gallery', 'gallery', 0, '', 5, 4, 1),
(53, 'tibiacom', 'Server Info', 'serverInfo', 0, '', 5, 5, 1),
(54, 'tibiacom', 'Experience Table', 'experienceTable', 0, '', 5, 6, 1),
(55, 'tibiacom', 'Buy Points', 'points', 0, '', 6, 0, 1),
(56, 'tibiacom', 'Shop Offer', 'gifts', 0, '', 6, 1, 1),
(57, 'tibiacom', 'Shop History', 'gifts/history', 0, '', 6, 2, 1),
(156, 'emma', 'Latest News', 'news', 0, '', 1, 0, 1),
(157, 'emma', 'News Archive', 'news/archive', 0, '', 1, 1, 1),
(158, 'emma', 'Account Management', 'account/manage', 0, '', 2, 0, 1),
(159, 'emma', 'Create Account', 'account/create', 0, '', 2, 1, 1),
(160, 'emma', 'Lost Account?', 'account/lost', 0, '', 2, 2, 1),
(161, 'emma', 'Server Rules', 'rules', 0, '', 2, 3, 1),
(162, 'emma', 'Downloads', 'downloads', 0, '', 2, 4, 1),
(163, 'emma', 'Report Bug', 'bugtracker', 0, '', 2, 5, 1),
(164, 'emma', 'Characters', 'characters', 0, '', 3, 0, 1),
(165, 'emma', 'Who is online', 'online', 0, '', 3, 1, 1),
(166, 'emma', 'Highscores', 'highscores', 0, '', 3, 2, 1),
(167, 'emma', 'Last Kills', 'lastkills', 0, '', 3, 3, 1),
(168, 'emma', 'Houses', 'houses', 0, '', 3, 4, 1),
(169, 'emma', 'Guilds', 'guilds', 0, '', 3, 5, 1),
(170, 'emma', 'Bans', 'bans', 0, '', 3, 6, 1),
(171, 'emma', 'Support List', 'team', 0, '', 3, 7, 1),
(172, 'emma', 'Forum', 'forum', 0, '', 3, 8, 1),
(173, 'emma', 'Monsters', 'creatures', 0, '', 5, 0, 1),
(174, 'emma', 'Spells', 'spells', 0, '', 5, 1, 1),
(175, 'emma', 'Commands', 'commands', 0, '', 5, 2, 1),
(176, 'emma', 'Server Info', 'serverInfo', 0, '', 5, 3, 1),
(177, 'emma', 'Gallery', 'gallery', 0, '', 5, 4, 1),
(178, 'emma', 'Experience Table', 'experienceTable', 0, '', 5, 5, 1),
(179, 'emma', 'Experience Stages', 'experienceStages', 0, '', 5, 6, 1),
(180, 'emma', 'FAQ', 'faq', 0, '', 5, 7, 1),
(181, 'emma', 'Buy Points', 'points', 0, '', 6, 0, 1),
(182, 'emma', 'Shop Offer', 'gifts', 0, '', 6, 1, 1),
(183, 'emma', 'Shop History', 'gifts/history', 0, '', 6, 2, 1),
(381, 'tibiana', 'Home', 'news', 0, '', 7, 0, 1),
(382, 'tibiana', 'Forum', 'forum', 0, '', 7, 1, 1),
(383, 'tibiana', 'Highscores', 'highscores', 0, '', 7, 2, 1),
(384, 'tibiana', 'Who Is Online?', 'online', 0, '', 7, 3, 1),
(385, 'tibiana', 'News', 'news', 0, '', 8, 0, 1),
(386, 'tibiana', 'Register', 'account/create', 0, '', 8, 1, 1),
(387, 'tibiana', 'Guidence', 'guidence', 0, 'ffffff', 8, 2, 1),
(388, 'tibiana', 'Reroll | Stats info', 'stats-info', 0, 'ffffff', 8, 3, 1),
(389, 'tibiana', 'Spells', 'Spellsss', 0, '', 8, 4, 1),
(390, 'tibiana', 'Characters', 'characters', 0, '', 8, 5, 1),
(391, 'tibiana', 'Experience', 'experienceTable', 0, '', 8, 6, 1),
(392, 'tibiana', 'Last Kills', 'lastkills', 0, '', 8, 7, 1),
(393, 'tibiana', 'Houses', 'houses', 0, '', 8, 8, 1),
(394, 'tibiana', 'Guilds', 'guilds', 0, '', 8, 9, 1),
(395, 'tibiana', 'Commands', 'commands', 0, '', 8, 10, 1),
(396, 'tibiana', 'Gallery', 'gallery', 0, '', 8, 11, 1),
(397, 'tibiana', 'Support', 'team', 0, '', 8, 12, 1),
(398, 'tibiana', 'Server Info', 'serverInfon', 0, '', 8, 13, 1),
(399, 'tibiana', 'Buy Points', 'points', 0, 'ffffff', 8, 14, 1),
(400, 'tibiana', 'Shop Offers', 'gifts', 0, 'ffffff', 8, 15, 1),
(401, 'tibiana', 'Shop History', 'gifts/history', 0, 'ffffff', 8, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_monsters`
--

CREATE TABLE `myaac_monsters` (
  `id` int NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int NOT NULL DEFAULT '0',
  `exp` int NOT NULL,
  `health` int NOT NULL,
  `speed_lvl` int NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `elements` text NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `pushable` tinyint(1) NOT NULL DEFAULT '0',
  `canpushitems` tinyint(1) NOT NULL DEFAULT '0',
  `canwalkonenergy` tinyint(1) NOT NULL DEFAULT '0',
  `canwalkonpoison` tinyint(1) NOT NULL DEFAULT '0',
  `canwalkonfire` tinyint(1) NOT NULL DEFAULT '0',
  `runonhealth` tinyint(1) NOT NULL DEFAULT '0',
  `hostile` tinyint(1) NOT NULL DEFAULT '0',
  `attackable` tinyint(1) NOT NULL DEFAULT '0',
  `rewardboss` tinyint(1) NOT NULL DEFAULT '0',
  `defense` int NOT NULL DEFAULT '0',
  `armor` int NOT NULL DEFAULT '0',
  `canpushcreatures` tinyint(1) NOT NULL DEFAULT '0',
  `race` varchar(255) NOT NULL,
  `loot` text NOT NULL,
  `summons` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_news`
--

CREATE TABLE `myaac_news` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - news, 2 - ticker, 3 - article',
  `date` int NOT NULL DEFAULT '0',
  `category` tinyint(1) NOT NULL DEFAULT '0',
  `player_id` int NOT NULL DEFAULT '0',
  `last_modified_by` int NOT NULL DEFAULT '0',
  `last_modified_date` int NOT NULL DEFAULT '0',
  `comments` varchar(50) NOT NULL DEFAULT '',
  `article_text` varchar(300) NOT NULL DEFAULT '',
  `article_image` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_news`
--

INSERT INTO `myaac_news` (`id`, `title`, `body`, `type`, `date`, `category`, `player_id`, `last_modified_by`, `last_modified_date`, `comments`, `article_text`, `article_image`, `hidden`) VALUES
(3, 'Welcome to SAOT - Aincrad', '<p>The server is based of the anime series Sword Art Online but in Tibia style and very much the same graphics.</p>\r\n<p>Those the server itself has some unique systems</p>\r\n<p>Upgrade/Gamble system when looting monsters/bosses.</p>\r\n<p>Items will roll common, rare, epic or legendary. Upon that its gonna make your character extremely powerful or weak depending of how you choose to combine the stats you obtain.</p>\r\n<p>You need to beat EACH floor boss to advance to the next floor and with new creatures.</p>\r\n<p>Remember that in SAO the floor is based of how dangerous it is for the player/s and its not really a solo game but one can still beat the game solo if you take good care of your self.</p>\r\n<p>You can read alot of the information we provide in the discord.</p>\r\n<p><strong><a href=\"https://discord.gg/yZN9dEGa5H\">https://discord.gg/yZN9dEGa5H</a></strong></p>', 1, 1662991769, 1, 26, 26, 1663152208, '0', '', 'images/news/announcement.jpg', 0),
(4, 'Starting map help', '<p><img src=\"https://media.discordapp.net/attachments/973302408140693584/1024421643457667132/map.png?width=1230&amp;height=656\" alt=\"\" width=\"846\" height=\"451\" /></p>', 1, 1663152239, 1, 26, 26, 1664311681, '0', '', 'images/news/announcement.jpg', 0),
(7, 'Patch Notes 1.6.9.5', '<pre><strong>Exura Ico </strong>\r\n<em>Scaling Level &amp; Magic level 100% increased</em>\r\n\r\n<strong>Exura Med Ico</strong> \r\n<em>Scaling Level &amp; Magic level 100% increased</em>\r\n\r\n<strong>Exori</strong> \r\n<em>Skill scaling is 100% increased</em>\r\n\r\n<strong>Exori Gran</strong> \r\n<em>Skill scaling is 100% increased</em>\r\n\r\n <strong>Multi Rasengan has now 4 sec cooldown (was 5)\r\n Multi Rasengan has 50% crit chance</strong> \r\n<em>- Walking cancels channelning\r\n- Cooldown remains 5 seconds but base damage is higher \r\n- Magic level scaling is higher\r\n</em>\r\n<strong> Arcane Missiles has 25% crit chance</strong>\r\n<em>- Walking does not cancel channelning\r\n- Cooldown reduced to 3 seconds (was 5)\r\n- Magic level scaling is higher</em>\r\n\r\n<strong> Lightning Shower / Rain of Meteors now has a wider area spread radius\r\n Lightning Shower / Rain of Meteors had their waves increased to 5 (was 3)</strong>\r\n<em>- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Vita</strong> \r\n<em>- Base healing increased by 100%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Max Vita</strong>\r\n<em>- Base healing increased by 150%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Sio</strong>\r\n<em>- Base healing increased by 80%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Gran Sio</strong> \r\n<em>- Base healing increased by 110%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura San</strong>\r\n<em>- Base healing increased by 70%\r\n- Magic level scaling is higher</em>\r\n\r\n<strong>Exura Gran San</strong>\r\n<em>- Base healing increased by 110%\r\n- Magic level scaling is higher</em></pre>', 1, 1664286803, 2, 26, 26, 1664286978, '2', '', 'images/news/announcement.jpg', 0),
(8, 'Teaser incoming update', '<p><strong>Teaser will be displayed tomorrow..</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Druids will evovle in the Aincrad.</strong></p>\r\n<p><em>Druids have always been close to the nature.&nbsp;</em></p>\r\n<p><em>Therefore they can soon adapt their Combat / play-style with their newly formed allies..</em> ?</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Global Boost system</strong> will be added this week as well needs slightly more testing just in-case.</p>\r\n<p><em>You will be able to purchase Global&nbsp; | ExpBoost or Loot or Skills/Magic Level</em></p>\r\n<p><em>All of these can be active at the same time + your own exp boost.</em></p>\r\n<p><em>You won\'t see a difference in the Client if a \"global boost\" is active.-- it will show 150% anyway.</em></p>\r\n<p><em>I don\'t recommend purchase any of these before Server-save which is always available to check out via Website.</em></p>\r\n<p><em>These will cost Tibia Coins to activate. Price for this is still (TBD)</em></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Commands</strong></p>\r\n<p><em>!gb exp</em></p>\r\n<p><em>!gb loot</em></p>\r\n<p><em>!gb skill</em></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Bossroom news!</strong></p>\r\n<p><em>More mechanics will be added to the upper floors to extend the variation of the gameplay.</em></p>\r\n<p>&nbsp;</p>\r\n<p>Stay tuned&nbsp;</p>', 1, 1664287138, 1, 26, 0, 0, '3', '', '', 0),
(9, 'Druids upcoming feature', '<p>TEASER Druid</p>\r\n<p>&nbsp;</p>\r\n<p><em>The Druids is evolving in the Aincrad and along with that, new allies has been found in the world...</em></p>\r\n<p><em>Not only has the druids forge strong bonds with the kings of the jungle..</em></p>\r\n<p><em>They have also learned new abilites themselves.</em></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Druid</strong></p>\r\n<ul>\r\n<li>Can now transform into beast, feral or &lt; secret &gt; forms</li>\r\n<li>You can do this as a druid by obtaining special rings that activates seperate forms of animals..</li>\r\n<li>The animal you transform into will along side fight with you through out the Aincrad</li>\r\n<li>The Druid also recieves special spells/attacks upon going into &lt;the specific&gt; form like as a Feral the druid will get a lethal bleed attack..</li>\r\n</ul>', 1, 1664311939, 1, 26, 0, 0, '0', '', '', 0),
(10, 'Patch Notes 1.7.0.0', '<p><strong>Patch 1.7.0.0 is now live</strong></p>\r\n<p>Download the new launcher here&nbsp;</p>\r\n<p><a href=\"../Updates/saot.zip\">http://tibia.smoker.gg/Updates/saot.zip</a></p>\r\n<p>or if you don\'t know how to do it you can still use the alternate download link but then you will have to manually patch everything the next time as well..</p>\r\n<p><a href=\"../Updates/client.zip\">http://tibia.smoker.gg/Updates/client.zip</a></p>\r\n<p>&nbsp;</p>\r\n<p>For those who has been playing before this patch you can go to your current <strong>SAOT</strong> folder</p>\r\n<p>Copy these folders below</p>\r\n<p><strong>--- characterdata</strong></p>\r\n<p><strong>--- conf</strong></p>\r\n<p><strong>--- minimap</strong></p>\r\n<p>Now when you have downloaded and install the new <strong>SAOT launcher</strong> to this folder and your settings will be saved for the new client-updater + client<br /><br /></p>\r\n<p><strong><em>C: / Users / YOURUSERNAME / AppData / Roaming / Saot / SAOTversion</em></strong></p>\r\n<p>Paste the folders you copied above to this folder (<strong><em>&nbsp;SAOTversion</em></strong> )</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Warning&nbsp;If you don\'t use the NEW ASSETS</strong></p>\r\n<p>-- you will probably experience crashes</p>\r\n<p>-- you will not be able to loot the new items</p>\r\n<p>-- you will be able to see new effects/missiles</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Features of Patch 1.7.0.0 </strong></p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>Forge system</strong> Allowing players to upgrade 2x identical items from common, rare and epic. The cost varey depending of what you wanna try forge.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>- Cursed chests</strong> A random chest might appear during your adventure in the Aincrad. These chests are a gamblers choice.. When opening a cursed chest depending of the difficulty of it a strong hoard might appear or you can get really lucky and avoid the trap.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li><strong>- Floor levels 65/65</strong></li>\r\n<li>130+ new monsters.</li>\r\n<li>54 new bosses.</li>\r\n<li>Floors levels and bosses has been increased to fit the higher levels from 27 - 65.. Keep in mind, usually the higher the floor the more dangerous everything gets..</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>- New spells A new set of spells for each Vocation has been developed to make it possible to Hunt differently. (fireblast, hydropump, boomerang, slay\'n\'prey, [req feral ring] feral bleed, feral slash, feral cleave) and a few more..</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>- 231+ New Items (level 400 and below) -- Will be dropped on most of the lowers floors 1-15. Each floor will have a at least 10 new items</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>New Helmets</li>\r\n<li>New Armors</li>\r\n<li>New Legs</li>\r\n<li>New Boots</li>\r\n<li>New Quivers</li>\r\n<li>New Shields</li>\r\n<li>New Spellbooks</li>\r\n<li>New Wands/Rods</li>\r\n<li>New Crossbow / Bows</li>\r\n<li>New Axe, Clubs &amp; Swords</li>\r\n<li>New Rings</li>\r\n<li>New items with unique abilities like proccing special spells/functions depending of what you get (weapons only)</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>8 New collectable outfits Can be obtained from (A Forgotten Soul) for tasks.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Thanks for being patient.. Also because of the delay for this update I will post-pone Hardcore to OCTOBER 28TH</p>', 1, 1665709636, 2, 26, 26, 1665946259, '4', '', 'images/news/announcement.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_news_categories`
--

CREATE TABLE `myaac_news_categories` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `icon_id` int NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_news_categories`
--

INSERT INTO `myaac_news_categories` (`id`, `name`, `description`, `icon_id`, `hidden`) VALUES
(1, '', '', 0, 0),
(2, '', '', 1, 0),
(3, '', '', 2, 0),
(4, '', '', 3, 0),
(5, '', '', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_notepad`
--

CREATE TABLE `myaac_notepad` (
  `id` int NOT NULL,
  `account_id` int NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_pages`
--

CREATE TABLE `myaac_pages` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `date` int NOT NULL DEFAULT '0',
  `player_id` int NOT NULL DEFAULT '0',
  `php` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - plain html, 1 - php',
  `enable_tinymce` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - enabled, 0 - disabled',
  `access` tinyint NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `myaac_pages`
--

INSERT INTO `myaac_pages` (`id`, `name`, `title`, `body`, `date`, `player_id`, `php`, `enable_tinymce`, `access`, `hidden`) VALUES
(1, 'downloads', 'Downloads', '<p> </p>\r\n<p> </p>\r\n<div style=\"text-align: center;\">We\'re using official Tibia Client <strong>{{ config.client / 100 }}</strong><br />\r\n<p><a href=\"http://tibia.smoker.gg/Updates/SAOT.zip\">Download Tibia Client</a> <strong>{{ config.client / 100 }}</strong> for Windows <a href=\"http://tibia.smoker.gg/Updates/SAOT.zip\" target=\"_blank\" rel=\"noopener\">HERE</a>.</p>\r\n<h2>IMPORTANT..note</h2>\r\n<p>Create a folder and name it <strong>SAOT</strong></p>\r\n<p>Unzip the <strong>SAOT.zip</strong> within that folder.</p>\r\n<p><em>Otherwise the client won\'t update correctly and you may experience problems and crashes</em>.</p>\r\n<p> </p>\r\n<p>if you experience problems with our updater you can try an alternative link </p>\r\n<p><a href=\"http://tibia.smoker.gg/Updates/client.zip\">HERE</a></p>\r\n</div>', 0, 1, 0, 1, 1, 0),
(2, 'commands', 'Commands', '<table style=\"border-collapse: collapse; width: 87.8471%; height: 57px;\" border=\"1\">\r\n<tbody>\r\n<tr style=\"height: 18px;\">\r\n<td style=\"width: 33.3333%; background-color: #505050; height: 18px;\"><span style=\"color: #ffffff;\"><strong>Words</strong></span></td>\r\n<td style=\"width: 38.0639%; background-color: #505050; height: 18px;\"><span style=\"color: #ffffff;\"><strong>Description</strong></span></td>\r\n</tr>\r\n<tr style=\"height: 18px; background-color: #f1e0c6;\">\r\n<td style=\"width: 33.3333%; height: 18px;\"><em>!stats</em></td>\r\n<td style=\"width: 38.0639%; height: 18px;\">This will display all EXTRA STATS you have equipped.</td>\r\n</tr>\r\n<tr style=\"height: 18px; background-color: #d4c0a1;\">\r\n<td style=\"width: 33.3333%; height: 18px;\"><em>!buyhouse</em></td>\r\n<td style=\"width: 38.0639%; height: 18px;\">Buy house you are looking at.</td>\r\n</tr>\r\n<tr style=\"height: 18px; background-color: #f1e0c6;\">\r\n<td style=\"width: 33.3333%; height: 24px;\">!gb exp</td>\r\n<td style=\"width: 38.0639%; height: 24px;\">Increases EXP for everyone for 1hour (50%)</td>\r\n</tr>\r\n<tr style=\"height: 18px; background-color: #d4c0a1;\">\r\n<td style=\"width: 33.3333%; height: 18px;\">!gb loot</td>\r\n<td style=\"width: 38.0639%; height: 18px;\">Increases LOOT for everyone for 1hour (50%)</td>\r\n</tr>\r\n<tr style=\"height: 18px; background-color: #f1e0c6;\">\r\n<td style=\"width: 33.3333%; height: 24px;\">!gb skill</td>\r\n<td style=\"width: 38.0639%; height: 24px;\">Increases SKILLS for everyone for 1hour (50%)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p> </p>', 0, 1, 0, 1, 1, 0),
(3, 'rules_on_the_page', 'Rules', '1. Names\na) Names which contain insulting (e.g. \"Bastard\"), racist (e.g. \"Nigger\"), extremely right-wing (e.g. \"Hitler\"), sexist (e.g. \"Bitch\") or offensive (e.g. \"Copkiller\") language.\nb) Names containing parts of sentences (e.g. \"Mike returns\"), nonsensical combinations of letters (e.g. \"Fgfshdsfg\") or invalid formattings (e.g. \"Thegreatknight\").\nc) Names that obviously do not describe a person (e.g. \"Christmastree\", \"Matrix\"), names of real life celebrities (e.g. \"Britney Spears\"), names that refer to real countries (e.g. \"Swedish Druid\"), names which were created to fake other players\' identities (e.g. \"Arieswer\" instead of \"Arieswar\") or official positions (e.g. \"System Admin\").\n\n2. Cheating\na) Exploiting obvious errors of the game (\"bugs\"), for instance to duplicate items. If you find an error you must report it to CipSoft immediately.\nb) Intentional abuse of weaknesses in the gameplay, for example arranging objects or players in a way that other players cannot move them.\nc) Using tools to automatically perform or repeat certain actions without any interaction by the player (\"macros\").\nd) Manipulating the client program or using additional software to play the game.\ne) Trying to steal other players\' account data (\"hacking\").\nf) Playing on more than one account at the same time (\"multi-clienting\").\ng) Offering account data to other players or accepting other players\' account data (\"account-trading/sharing\").\n\n3. Gamemasters\na) Threatening a gamemaster because of his or her actions or position as a gamemaster.\nb) Pretending to be a gamemaster or to have influence on the decisions of a gamemaster.\nc) Intentionally giving wrong or misleading information to a gamemaster concerning his or her investigations or making false reports about rule violations.\n\n4. Player Killing\na) Excessive killing of characters who are not marked with a \"skull\" on worlds which are not PvP-enforced. Please note that killing marked characters is not a reason for a banishment.\n\nA violation of the Tibia Rules may lead to temporary banishment of characters and accounts. In severe cases removal or modification of character skills, attributes and belongings, as well as the permanent removal of accounts without any compensation may be considered. The sanction is based on the seriousness of the rule violation and the previous record of the player. It is determined by the gamemaster imposing the banishment.\n\nThese rules may be changed at any time. All changes will be announced on the official website.', 0, 1, 0, 0, 1, 0),
(5, 'Spellsss', 'Spells', '<h2><strong>KNIGHTS</strong></h2>\r\n<ul>\r\n<li>Multi Slash <strong>(exevo gran slash)</strong> Lvl req: <strong>100</strong> / <strong>50%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Slay \'n\' Prey <strong>( exori occidere )</strong> Lvl req: 110 | 4 sec cooldown | 200 mana | (does more damage the more monsters you hit)</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Giga Sword <strong>(exori grande sword ico)</strong> Lvl req: <strong>150</strong> /<strong> 50%</strong> mana  -- to dmg use your skill</li>\r\n<li>Giga Axe <strong>(exori grande axe ico)</strong> Lvl req: <strong>150</strong> / <strong>50%</strong> mana -- to dmg use your skill</li>\r\n<li>Giga Club <strong>(exori grande club ico)</strong> Lvl req: <strong>150</strong> / <strong>50%</strong> mana -- to dmg use your skill</li>\r\n</ul>\r\n<h2><strong>PALADIN</strong></h2>\r\n<ul>\r\n<li>Boomerang <strong>( exori shiva rang ) </strong>Lvl req: 100 | 3 sec cooldown | 200 mana | (does more damage at max range)</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Rain of Arrows <strong>(exori mas des con)</strong> Lvl req: <strong>60</strong> / <strong>30%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Multi shoot <strong>(exevo mas hur con)</strong> Lvl req: <strong>100</strong> / <strong>35%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Giant Arrow <strong>(exori grande con)</strong> Lvl req: <strong>150</strong> / <strong>50%</strong> mana</li>\r\n</ul>\r\n<h2><strong>Sorcerer</strong></h2>\r\n<ul>\r\n<li>Rain of Fire <strong>(exori mas des flam)</strong> Lvl req: <strong>60</strong> /<strong> 30%</strong> mana</li>\r\n<li>Rain of Lightning <strong>(exori mas des vis)</strong> Lvl req: <strong>60</strong> / <strong>30%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Arcane Missile <strong>(exevo hur arc)</strong> Lvl req: <strong>80</strong> / <strong>20%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Chain Lightning <strong>(exevo vis catena)</strong> Lvl req: <strong>90</strong> / <strong>35%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Fireblast <strong>( exori was flamur )</strong> Lvl req: 100 | 3 sec cooldown | 1000 mana | (does more damage at max range)</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Hydropump <strong>( exori was aqua )</strong> Lvl req: 100 | 3 sec cooldown | 600 mana | (does more damage at max range)</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Energy Orb <strong>(exevo mas res vis)</strong> Lvl req: <strong>100</strong> / <strong>50%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Meatball/Meteor <strong>(exevo grande flam)</strong> Lvl req: <strong>150</strong> / <strong>50%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Multi Rasengan <strong>(exevo mas hur rasengan)</strong> Lvl req: <strong>150</strong> / 2<strong>0%</strong> mana</li>\r\n</ul>\r\n<h2><strong>Druid</strong></h2>\r\n<ul>\r\n<li>Ice Lances <strong>(exevo hur lance)</strong> Lvl req: <strong>60</strong> / <strong>30%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Frozen Orb <strong>[ Rune ]</strong> Lvl req: <strong>100</strong> / <strong>50%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Hydropump <strong>( exori was aqua )</strong> Lvl req: 100 | 3 sec cooldown | 600 mana | (does more damage at max range)</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Heal over Time <strong>(exura gran mas utura)</strong> Lvl req: <strong>100</strong> / <strong>30%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Tree Upon <strong>(exevo grande tera)</strong> Lvl req: <strong>150</strong> / <strong>30%</strong> mana</li>\r\n<li>ICE EMP <strong>(exevo grande frigo)</strong> Lvl req: <strong>150</strong> / <strong>50%</strong> mana</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li><strong>[ FERAL FORM RING ]</strong> - level 300</li>\r\n<li>Feral Cleave<strong> ( ungula bestia )</strong> | 3 sec cooldown | 1% mana |</li>\r\n<li>Feral Bleed <strong>( bestia vulnus)</strong> | 2 sec cooldown | 1% mana |</li>\r\n<li>Feral Wave <strong>( bestia vavora)</strong> | 2 sec cooldown | 3% mana |</li>\r\n</ul>', 0, 1, 0, 1, 1, 0),
(6, 'serverinfon', 'Server information', '<h2>Server Info:</h2>\r\n<ul>\r\n<li>IP: (Port: <strong>7171</strong>)</li>\r\n<li>Client: <strong>12.85</strong></li>\r\n<li>Online: <strong>24/7</strong></li>\r\n<li>World type: <strong>PVP (Protection level: 50)</strong></li>\r\n<li>House rent: <strong>disabled.</strong></li>\r\n</ul>\r\n<p> </p>\r\n<h2>Rates</h2>\r\n<ul>\r\n<li>Exp Rate: <strong>EXP STAGES</strong></li>\r\n</ul>\r\n<ol>\r\n<li style=\"text-align: left;\"><strong>1-50 (x25)</strong></li>\r\n<li style=\"text-align: left;\"><strong>51-70 (x20)</strong></li>\r\n<li style=\"text-align: left;\"><strong>71-150 (x15)</strong></li>\r\n<li style=\"text-align: left;\"><strong>151-250 (x13)</strong></li>\r\n<li style=\"text-align: left;\"><strong>250-x (x10)</strong></li>\r\n</ol>\r\n<ul>\r\n<li>Magic Level:<strong> x25</strong></li>\r\n<li>Skills: <strong>x50</strong></li>\r\n<li>Loot: <strong>x6</strong></li>\r\n<li>Spawn: <strong>x3</strong></li>\r\n<li>Guilds: 1 level (Create via website)</li>\r\n</ul>\r\n<p> </p>\r\n<h2>Frags & Skull system</h2>\r\n<p>PZ Lock: <strong>1 min</strong></p>\r\n<p>White Skull Time: <strong>900000 min</strong></p>\r\n<p>Red skull length: <strong>0 days</strong></p>\r\n<p> </p>\r\n<h2>Other</h2>\r\n<p>Respect our rules.</p>\r\n<p>Please report rule violations (Botters, players breaking rules etc) with CTRL + R.</p>', 0, 1, 0, 1, 1, 0),
(7, 'guidence', 'guidence', '<p><img src=\"https://cdn.discordapp.com/attachments/1020224299430326304/1031122526778167376/saoguide2.png\" alt=\"\" width=\"856\" height=\"3424\" /></p>\r\n<p><img src=\"https://cdn.discordapp.com/attachments/1020224299430326304/1020224373933744158/saoguide.png\" alt=\"\" width=\"859\" height=\"1677\" /></p>', 0, 1, 0, 1, 1, 0),
(8, 'stats-info', 'stats-info', '<p><img src=\"https://cdn.discordapp.com/attachments/963391013962006539/1020941804260040764/statsreroll.png\" alt=\"\" width=\"800\" height=\"4000\" /></p>', 0, 1, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `myaac_spells`
--

CREATE TABLE `myaac_spells` (
  `id` int NOT NULL,
  `spell` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `words` varchar(255) NOT NULL DEFAULT '',
  `category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - instant, 2 - conjure, 3 - rune',
  `level` int NOT NULL DEFAULT '0',
  `maglevel` int NOT NULL DEFAULT '0',
  `mana` int NOT NULL DEFAULT '0',
  `soul` tinyint NOT NULL DEFAULT '0',
  `conjure_id` int NOT NULL DEFAULT '0',
  `conjure_count` tinyint NOT NULL DEFAULT '0',
  `reagent` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `premium` tinyint(1) NOT NULL DEFAULT '0',
  `vocations` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_videos`
--

CREATE TABLE `myaac_videos` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `youtube_id` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_visitors`
--

CREATE TABLE `myaac_visitors` (
  `ip` varchar(16) NOT NULL,
  `lastvisit` int NOT NULL DEFAULT '0',
  `page` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `myaac_weapons`
--

CREATE TABLE `myaac_weapons` (
  `id` int NOT NULL,
  `level` int NOT NULL DEFAULT '0',
  `maglevel` int NOT NULL DEFAULT '0',
  `vocations` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `item_count` int NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int NOT NULL DEFAULT '1',
  `account_id` int UNSIGNED NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '1',
  `vocation` int NOT NULL DEFAULT '0',
  `health` int NOT NULL DEFAULT '150',
  `healthmax` int NOT NULL DEFAULT '150',
  `experience` bigint NOT NULL DEFAULT '0',
  `lookbody` int NOT NULL DEFAULT '0',
  `lookfeet` int NOT NULL DEFAULT '0',
  `lookhead` int NOT NULL DEFAULT '0',
  `looklegs` int NOT NULL DEFAULT '0',
  `looktype` int NOT NULL DEFAULT '136',
  `lookaddons` int NOT NULL DEFAULT '0',
  `maglevel` int NOT NULL DEFAULT '0',
  `mana` int NOT NULL DEFAULT '0',
  `manamax` int NOT NULL DEFAULT '0',
  `manaspent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `soul` int UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int NOT NULL DEFAULT '1',
  `posx` int NOT NULL DEFAULT '0',
  `posy` int NOT NULL DEFAULT '0',
  `posz` int NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int NOT NULL DEFAULT '0',
  `sex` int NOT NULL DEFAULT '0',
  `lastlogin` bigint UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` bigint NOT NULL DEFAULT '0',
  `lastlogout` bigint UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint NOT NULL DEFAULT '0',
  `blessings1` tinyint NOT NULL DEFAULT '0',
  `blessings2` tinyint NOT NULL DEFAULT '0',
  `blessings3` tinyint NOT NULL DEFAULT '0',
  `blessings4` tinyint NOT NULL DEFAULT '0',
  `blessings5` tinyint NOT NULL DEFAULT '0',
  `blessings6` tinyint NOT NULL DEFAULT '0',
  `blessings7` tinyint NOT NULL DEFAULT '0',
  `blessings8` tinyint NOT NULL DEFAULT '0',
  `onlinetime` int NOT NULL DEFAULT '0',
  `deletion` bigint NOT NULL DEFAULT '0',
  `balance` bigint UNSIGNED NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int NOT NULL DEFAULT '-1',
  `stamina` smallint UNSIGNED NOT NULL DEFAULT '2520',
  `skill_fist` int UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_chance` int UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_chance_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage` int UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance` int UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount` int UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance` int UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount` int UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount_tries` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_chance` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_damage` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_chance` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_amount` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_chance` bigint UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_amount` bigint UNSIGNED NOT NULL DEFAULT '0',
  `manashield` smallint UNSIGNED NOT NULL DEFAULT '0',
  `max_manashield` smallint UNSIGNED NOT NULL DEFAULT '0',
  `prey_stamina_1` int DEFAULT NULL,
  `prey_stamina_2` int DEFAULT NULL,
  `prey_stamina_3` int DEFAULT NULL,
  `prey_column` smallint NOT NULL DEFAULT '1',
  `xpboost_stamina` smallint DEFAULT NULL,
  `xpboost_value` tinyint DEFAULT NULL,
  `marriage_status` bigint UNSIGNED NOT NULL DEFAULT '0',
  `marriage_spouse` int NOT NULL DEFAULT '-1',
  `bonus_rerolls` bigint NOT NULL DEFAULT '0',
  `quickloot_fallback` tinyint(1) DEFAULT '0',
  `lookmountbody` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `lookmountfeet` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `lookmounthead` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `lookmountlegs` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `lookfamiliarstype` int UNSIGNED NOT NULL DEFAULT '0',
  `isreward` tinyint(1) NOT NULL DEFAULT '1',
  `istutorial` tinyint(1) NOT NULL DEFAULT '0',
  `created` int NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `forge_dusts` bigint NOT NULL DEFAULT '0',
  `forge_dust_level` bigint NOT NULL DEFAULT '100',
  `randomize_mount` tinyint(1) NOT NULL DEFAULT '0',
  `boss_points` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `manashield`, `max_manashield`, `prey_stamina_1`, `prey_stamina_2`, `prey_stamina_3`, `prey_column`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `marriage_spouse`, `bonus_rerolls`, `quickloot_fallback`, `lookmountbody`, `lookmountfeet`, `lookmounthead`, `lookmountlegs`, `lookfamiliarstype`, `isreward`, `istutorial`, `created`, `hidden`, `comment`, `forge_dusts`, `forge_dust_level`, `randomize_mount`, `boss_points`) VALUES
(1, 'Rook Sample', 1, 1, 2, 0, 155, 155, 100, 113, 115, 95, 39, 129, 0, 2, 60, 60, 5936, 0, 1, 0, 0, 0, '', 410, 1, 1650050972, 16777343, 1, 0, 0, 1650050975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 43200, -1, 2520, 10, 0, 12, 155, 12, 155, 12, 155, 12, 93, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 0, 100, 0, 0),
(2, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 113, 115, 95, 39, 130, 0, 0, 90, 90, 0, 0, 1, 0, 0, 0, '', 470, 1, 1650050975, 16777343, 1, 0, 0, 1650050986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 0, 100, 0, 0),
(3, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, 113, 115, 95, 39, 130, 0, 0, 90, 90, 0, 0, 1, 0, 0, 0, '', 470, 1, 1650050964, 16777343, 1, 0, 0, 1650050968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 212, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 0, 100, 0, 0),
(4, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 0, 90, 90, 0, 0, 1, 0, 0, 0, '', 470, 1, 1650050968, 16777343, 1, 0, 0, 1650050972, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 0, 100, 0, 0),
(5, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 113, 115, 95, 39, 131, 0, 0, 90, 90, 0, 0, 1, 0, 0, 0, '', 470, 1, 1650050959, 16777343, 1, 0, 0, 1650050964, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 0, 100, 0, 0),
(6, 'GOD', 6, 1, 2, 0, 155, 155, 100, 113, 115, 95, 39, 1322, 3, 0, 60, 60, 0, 0, 1, 0, 0, 0, '', 410, 1, 1649616149, 16777343, 1, 0, 0, 1649616227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483647, 0, 0, 43200, -1, 2520, 10, 0, 150, 0, 150, 0, 150, 0, 150, 0, 150, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 0, 100, 0, 0),
(761, 'Evio', 1, 12, 116, 7, 1298, 1265, 25245005, 68, 76, 78, 58, 136, 3, 18, 1330, 1710, 267233, 200, 1, 1029, 977, 7, 0x010020000002ffffffff03b0a103001b001c000000000470170000050500000006b80b0000070a000000fe0110000000020000000003606d00001b001c000000000b6f0000000c9a99993e0d0000c0c10e9a99993e0f0000c0c1fe, 2630, 0, 1737856820, 3258099904, 1, 0, 0, 1737856866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 474112, 0, 121465, 43200, 4, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 79, 3785, 72, 15419, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 180, 50, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '0', 84, 100, 0, 10),
(762, 'Chrallaz', 1, 12, 8, 1, 185, 185, 4200, 68, 76, 78, 58, 128, 0, 0, 90, 90, 0, 100, 1, 1025, 977, 7, '', 470, 1, 1727691532, 3258099904, 1, 0, 0, 1727691544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 43200, 13, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '0', 0, 100, 0, 0),
(763, 'Benny', 1, 12, 8, 4, 185, 185, 4200, 68, 76, 78, 58, 2029, 0, 0, 90, 90, 0, 100, 1, 1027, 979, 7, '', 470, 1, 1727691505, 3258099904, 1, 0, 0, 1727691530, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 100000, 43200, 2, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '0', 0, 100, 0, 0);

--
-- Triggers `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
		UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_bosstiary`
--

CREATE TABLE `player_bosstiary` (
  `player_id` int NOT NULL,
  `bossIdSlotOne` int NOT NULL DEFAULT '0',
  `bossIdSlotTwo` int NOT NULL DEFAULT '0',
  `removeTimes` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_bosstiary`
--

INSERT INTO `player_bosstiary` (`player_id`, `bossIdSlotOne`, `bossIdSlotTwo`, `removeTimes`) VALUES
(731, 0, 0, 1),
(736, 0, 0, 1),
(729, 0, 0, 1),
(730, 0, 0, 1),
(734, 0, 0, 1),
(739, 0, 0, 1),
(738, 0, 0, 1),
(744, 0, 0, 1),
(741, 0, 0, 1),
(745, 0, 0, 1),
(740, 0, 0, 1),
(733, 0, 0, 1),
(735, 0, 0, 1),
(726, 2351, 0, 4),
(732, 0, 0, 1),
(752, 0, 0, 1),
(756, 0, 0, 1),
(742, 0, 0, 1),
(757, 0, 0, 1),
(743, 0, 0, 1),
(755, 2354, 0, 2),
(727, 0, 0, 1),
(754, 2355, 0, 2),
(728, 0, 0, 1),
(753, 0, 0, 1),
(26, 2352, 0, 1),
(763, 0, 0, 1),
(762, 0, 0, 1),
(761, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_charms`
--

CREATE TABLE `player_charms` (
  `player_guid` int NOT NULL,
  `charm_points` varchar(250) DEFAULT NULL,
  `charm_expansion` tinyint(1) DEFAULT NULL,
  `rune_wound` int DEFAULT NULL,
  `rune_enflame` int DEFAULT NULL,
  `rune_poison` int DEFAULT NULL,
  `rune_freeze` int DEFAULT NULL,
  `rune_zap` int DEFAULT NULL,
  `rune_curse` int DEFAULT NULL,
  `rune_cripple` int DEFAULT NULL,
  `rune_parry` int DEFAULT NULL,
  `rune_dodge` int DEFAULT NULL,
  `rune_adrenaline` int DEFAULT NULL,
  `rune_numb` int DEFAULT NULL,
  `rune_cleanse` int DEFAULT NULL,
  `rune_bless` int DEFAULT NULL,
  `rune_scavenge` int DEFAULT NULL,
  `rune_gut` int DEFAULT NULL,
  `rune_low_blow` int DEFAULT NULL,
  `rune_divine` int DEFAULT NULL,
  `rune_vamp` int DEFAULT NULL,
  `rune_void` int DEFAULT NULL,
  `UsedRunesBit` int DEFAULT NULL,
  `UnlockedRunesBit` varchar(250) DEFAULT NULL,
  `tracker list` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_charms`
--

INSERT INTO `player_charms` (`player_guid`, `charm_points`, `charm_expansion`, `rune_wound`, `rune_enflame`, `rune_poison`, `rune_freeze`, `rune_zap`, `rune_curse`, `rune_cripple`, `rune_parry`, `rune_dodge`, `rune_adrenaline`, `rune_numb`, `rune_cleanse`, `rune_bless`, `rune_scavenge`, `rune_gut`, `rune_low_blow`, `rune_divine`, `rune_vamp`, `rune_void`, `UsedRunesBit`, `UnlockedRunesBit`, `tracker list`) VALUES
(727, '10750', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(726, '3350', 0, 0, 0, 0, 1013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1014, 1022, 0, 0, 98312, '98344', ''),
(729, '150', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(730, '2150', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(728, '8450', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '364543', 0x1f040102100042001e01),
(26, '1055', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(731, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(732, '750', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(733, '1300', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 516, 0, 0, 0, 32768, '33024', ''),
(734, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(735, '600', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(736, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(738, '2200', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(739, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(740, '600', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(742, '2550', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(741, '750', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(744, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(745, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(752, '250', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(754, '6100', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(753, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(755, '8000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 868, 0, 0, 0, 0, 16384, '16384', ''),
(756, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(757, '100', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 512, '512', ''),
(743, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(761, '3000', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(762, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(763, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int NOT NULL,
  `time` bigint UNSIGNED NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '1',
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT '1',
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) NOT NULL DEFAULT '0',
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int NOT NULL,
  `sid` int NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int NOT NULL DEFAULT '0',
  `itemtype` int NOT NULL DEFAULT '0',
  `count` int NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_depotitems`
--

INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(761, 101, 1, 38017, 1, 0x0737000a5b4578747261204465663a202b315d0a5b5265666c6563742045617274683a202b35255d0a5b496365204162736f72623a202b32255d190b0061206c6567656e646172791e0100000025010000000000000006007261726974790109006c6567656e64617279),
(761, 102, 1, 38032, 1, 0x0750000a5b5374756e204368616e63653a20312d332f73207c2033255d0a5b4669726520426c6565643a20312d31303030207c203137255d0a5b496e637265617365204963652044616d6167653a202b32255d190b0061206c6567656e6461727925010000000000000006007261726974790109006c6567656e64617279),
(761, 103, 1, 37926, 1, 0x0743000a5b456e65726779204162736f72623a202b31255d0a5b4561727468204162736f72623a202b31255d0a5b4d617820485020426f6e75733a20323525207c203238255d190b0061206c6567656e6461727925010000000000000006007261726974790109006c6567656e64617279),
(761, 104, 2, 3428, 1, 0x072f000a5b446f6467653a202b32255d0a5b5265666c65637420466972653a202b31255d0a5b446566656e73653a202b315d190700616e20657069631d21000000250100000000000000060072617269747901040065706963),
(761, 105, 2, 3285, 1, 0x0743000a5b446561746820426c6565643a20312d333530207c203132255d0a5b41747461636b3a202b355d0a5b456e6572677920537472696b65204368616e63653a2034255d190700616e20657069631c16000000250100000000000000060072617269747901040065706963),
(761, 106, 2, 3285, 1, 0x0747000a5b466972652044616d6167653a2032362d33385d0a5b486f6c7920426c6565643a20312d333530207c203132255d0a5b49636520537472696b65204368616e63653a2033255d190700616e2065706963250100000000000000060072617269747901040065706963),
(761, 107, 2, 3285, 1, 0x0746000a5b41747461636b2053706565643a202b38255d0a5b486f6c7920426c6565643a20312d333530207c203132255d0a5b426f6e757320444d47204368616e63653a202b32255d190700616e2065706963250100000000000000060072617269747901040065706963),
(761, 108, 2, 3349, 1, 0x074e000a5b466c616d6520537472696b65204368616e63653a2032255d0a5b456e6572677920537472696b65204368616e63653a2035255d0a5b4c696665204c656563683a202b3225207c20313030255d190700616e2065706963250100000000000000060072617269747901040065706963),
(761, 109, 2, 19362, 1, 0x072d000a5b4963652044616d6167653a20392d31395d0a5b546572726120537472696b65204368616e63653a2031255d190600612072617265250100000000000000060072617269747901040072617265),
(761, 110, 2, 3349, 1, 0x0735000a5b446976696e6520537472696b65204368616e63653a2031255d0a5b466c616d6520537472696b65204368616e63653a2031255d190600612072617265250100000000000000060072617269747901040072617265),
(761, 111, 2, 3349, 1, 0x0759000a5b49636520426c6565643a20312d333530207c203132255d0a5b496e63726561736520456e657267792044616d6167653a202b3132255d0a5b496e63726561736520506879736963616c2044616d6167653a202b3134255d190700616e2065706963250100000000000000060072617269747901040065706963),
(761, 112, 17, 29291, 5, 0x0f05),
(761, 113, 18, 29293, 97, 0x0f61),
(761, 114, 19, 29292, 80, 0x0f50),
(761, 115, 20, 29294, 1, ''),
(761, 116, 20, 29294, 1, ''),
(761, 117, 20, 29294, 1, ''),
(761, 118, 20, 29294, 1, ''),
(761, 119, 20, 29294, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `player_hirelings`
--

CREATE TABLE `player_hirelings` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `sex` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `posx` int NOT NULL DEFAULT '0',
  `posy` int NOT NULL DEFAULT '0',
  `posz` int NOT NULL DEFAULT '0',
  `lookbody` int NOT NULL DEFAULT '0',
  `lookfeet` int NOT NULL DEFAULT '0',
  `lookhead` int NOT NULL DEFAULT '0',
  `looklegs` int NOT NULL DEFAULT '0',
  `looktype` int NOT NULL DEFAULT '136'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int NOT NULL,
  `sid` int NOT NULL,
  `pid` int NOT NULL DEFAULT '0',
  `itemtype` int NOT NULL DEFAULT '0',
  `count` int NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int NOT NULL DEFAULT '0',
  `pid` int NOT NULL DEFAULT '0',
  `sid` int NOT NULL DEFAULT '0',
  `itemtype` int NOT NULL DEFAULT '0',
  `count` int NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(6, 3, 101, 2854, 1, 0x24012600000080),
(6, 11, 104, 23396, 1, ''),
(6, 101, 105, 34085, 1, ''),
(6, 101, 106, 3043, 1, 0x0f01),
(6, 101, 107, 3031, 3, 0x0f03),
(6, 101, 108, 3003, 1, ''),
(6, 102, 109, 25757, 1, 0x0f0110000000001101),
(5, 1, 101, 3354, 1, ''),
(5, 3, 102, 2854, 1, 0x24012600000080),
(5, 4, 103, 3359, 1, ''),
(5, 5, 104, 3426, 1, ''),
(5, 6, 105, 3307, 1, ''),
(5, 7, 106, 3372, 1, ''),
(5, 8, 107, 3552, 1, ''),
(5, 10, 108, 2920, 1, ''),
(5, 11, 109, 23396, 1, ''),
(5, 102, 110, 268, 25, 0x0f19),
(5, 102, 111, 266, 10, 0x0f0a),
(5, 102, 112, 3035, 15, 0x0f0f),
(5, 102, 113, 3003, 1, ''),
(5, 102, 114, 5710, 1, ''),
(5, 102, 115, 3031, 3, 0x0f03),
(3, 1, 101, 3355, 1, ''),
(3, 3, 102, 2854, 1, 0x24012600000080),
(3, 4, 103, 7991, 1, ''),
(3, 5, 104, 3412, 1, ''),
(3, 6, 105, 3066, 1, ''),
(3, 7, 106, 3559, 1, ''),
(3, 8, 107, 3552, 1, ''),
(3, 10, 108, 2920, 1, ''),
(3, 11, 109, 23396, 1, ''),
(3, 102, 110, 268, 25, 0x0f19),
(3, 102, 111, 266, 10, 0x0f0a),
(3, 102, 112, 3031, 3, 0x0f03),
(3, 102, 113, 3035, 15, 0x0f0f),
(3, 102, 114, 5710, 1, ''),
(3, 102, 115, 3003, 1, ''),
(4, 1, 101, 3355, 1, ''),
(4, 3, 102, 2854, 1, 0x24012600000080),
(4, 4, 103, 3571, 1, ''),
(4, 5, 104, 35562, 1, 0x2402),
(4, 6, 105, 3350, 1, ''),
(4, 7, 106, 8095, 1, ''),
(4, 8, 107, 3552, 1, ''),
(4, 10, 108, 2920, 1, ''),
(4, 11, 109, 23396, 1, ''),
(4, 102, 110, 268, 25, 0x0f19),
(4, 102, 111, 266, 10, 0x0f0a),
(4, 102, 112, 3277, 2, 0x0f02),
(4, 102, 113, 5710, 1, ''),
(4, 102, 114, 3035, 15, 0x0f0f),
(4, 102, 115, 3031, 3, 0x0f03),
(4, 102, 116, 3003, 1, ''),
(4, 104, 117, 3447, 100, 0x0f64),
(4, 104, 118, 3447, 50, 0x0f32),
(1, 3, 101, 2854, 1, 0x2600000080),
(1, 10, 102, 2920, 1, ''),
(1, 11, 103, 23396, 1, ''),
(1, 101, 104, 3031, 3, 0x0f03),
(1, 101, 105, 3003, 1, ''),
(2, 1, 101, 3355, 1, ''),
(2, 3, 102, 2854, 1, 0x24012600000080),
(2, 4, 103, 7991, 1, ''),
(2, 5, 104, 3412, 1, ''),
(2, 6, 105, 3074, 1, ''),
(2, 7, 106, 3559, 1, ''),
(2, 8, 107, 3552, 1, ''),
(2, 10, 108, 2920, 1, ''),
(2, 11, 109, 23396, 1, ''),
(2, 102, 110, 268, 25, 0x0f19),
(2, 102, 111, 266, 10, 0x0f0a),
(2, 102, 112, 3031, 3, 0x0f03),
(2, 102, 113, 3035, 15, 0x0f0f),
(2, 102, 114, 5710, 1, ''),
(2, 102, 115, 3003, 1, ''),
(763, 1, 101, 3354, 1, ''),
(763, 2, 102, 3572, 1, ''),
(763, 3, 103, 2854, 1, ''),
(763, 4, 104, 3359, 1, ''),
(763, 5, 105, 3425, 1, ''),
(763, 6, 106, 7773, 1, ''),
(763, 7, 107, 3372, 1, ''),
(763, 8, 108, 3552, 1, ''),
(763, 11, 109, 23396, 1, ''),
(763, 103, 110, 2854, 1, ''),
(763, 103, 111, 266, 10, 0x0f0a),
(763, 103, 112, 3457, 1, ''),
(763, 103, 113, 3003, 1, ''),
(763, 103, 114, 3327, 1, ''),
(763, 103, 115, 7774, 1, ''),
(763, 110, 116, 3031, 3, 0x0f03),
(762, 1, 101, 7992, 1, ''),
(762, 2, 102, 3572, 1, ''),
(762, 3, 103, 2854, 1, 0x2600000080),
(762, 4, 104, 7991, 1, ''),
(762, 5, 105, 3059, 1, ''),
(762, 6, 106, 3074, 1, ''),
(762, 7, 107, 3362, 1, ''),
(762, 8, 108, 3552, 1, ''),
(762, 10, 109, 2920, 1, ''),
(762, 11, 110, 23396, 1, ''),
(762, 103, 111, 2854, 1, ''),
(762, 103, 112, 266, 10, 0x0f0a),
(762, 103, 113, 268, 25, 0x0f19),
(762, 103, 114, 3457, 1, ''),
(762, 103, 115, 3003, 1, ''),
(762, 111, 116, 3031, 3, 0x0f03),
(762, 111, 117, 3003, 1, ''),
(761, 1, 101, 3351, 1, 0x072e000a5b506879736963616c20526573697374616e63653a20312d32355d0a5b4d6178204865616c74683a202b33255d190600612072617265250100000000000000060072617269747901040072617265),
(761, 2, 102, 3045, 197, 0x16c500074d000a5b506879736963616c204162736f72623a202b31255d0a5b456e6572677920526573697374616e63653a20312d34305d0a5b506879736963616c20526573697374616e63653a20312d34305d190700616e2065706963250100000000000000060072617269747901040065706963),
(761, 3, 103, 2854, 1, 0x2401),
(761, 4, 104, 3358, 1, 0x0728000a5b506879736963616c20526573697374616e63653a20312d32355d0a5b41726d6f723a202b345d1906006120726172651f0a000000250100000000000000060072617269747901040072617265),
(761, 5, 105, 35848, 1, 0x2405),
(761, 6, 106, 5803, 1, 0x07c20049742069732061206269742068656176792064756520746f207468652069726f6e206d6f756e74696e672c20627574207665727920707265636973650a0a5b41747461636b2053706565643a202b3530255d0a5b4d756c74692d53686f743a20352d3130207c203530255d0a5b506879736963616c2044616d6167653a203132302d3230305d0a5b496e63726561736520506879736963616c2044616d6167653a202b313030255d0a5b5374756e204368616e63653a20312d332f73207c2035255d190b0061206c6567656e6461727925010000000000000006007261726974790109006c6567656e64617279),
(761, 7, 107, 3382, 1, 0x0731000a5b44697374616e636520536b696c6c3a202b315d0a5b506879736963616c20526573697374616e63653a20312d32355d19040072617265250100000000000000060072617269747901040072617265),
(761, 8, 108, 3552, 1, 0x0731000a5b506879736963616c20526573697374616e63653a20312d32355d0a5b44697374616e636520536b696c6c3a202b335d19040072617265250100000000000000060072617269747901040072617265),
(761, 9, 109, 3004, 1, 0x073f000a5b426f6e757320444d47204368616e63653a202b31255d0a5b53776f726420536b696c6c3a202b355d0a5b41747461636b2053706565643a202b3130255d190700616e2065706963250100000000000000060072617269747901040065706963),
(761, 10, 110, 25977, 1, ''),
(761, 11, 111, 23396, 1, ''),
(761, 103, 112, 22516, 1, 0x0f01),
(761, 103, 113, 3035, 20, 0x0f14),
(761, 103, 114, 37110, 2, 0x0f02),
(761, 103, 115, 29293, 3, 0x0f03),
(761, 103, 116, 29292, 4, 0x0f04),
(761, 103, 117, 284, 81, 0x0f51),
(761, 103, 118, 284, 100, 0x0f64),
(761, 103, 119, 5879, 3, 0x0f03),
(761, 103, 120, 22118, 3, 0x0f03),
(761, 103, 121, 3457, 1, ''),
(761, 103, 122, 3003, 1, ''),
(761, 103, 123, 2868, 1, 0x2404),
(761, 103, 124, 2869, 1, 0x24022600000080),
(761, 105, 125, 16141, 8, 0x0f08),
(761, 105, 126, 16141, 100, 0x0f64),
(761, 105, 127, 16141, 100, 0x0f64),
(761, 123, 128, 28495, 1, ''),
(761, 123, 129, 28495, 1, ''),
(761, 123, 130, 28495, 1, ''),
(761, 123, 131, 28495, 1, ''),
(761, 123, 132, 238, 31, 0x0f1f),
(761, 123, 133, 239, 71, 0x0f47),
(761, 123, 134, 28495, 1, ''),
(761, 123, 135, 3161, 60, 0x0f3c),
(761, 123, 136, 3192, 13, 0x0f0d),
(761, 124, 137, 7417, 1, 0x074b000a5b4669726520426c6565643a20312d333530207c203132255d0a5b4c696665204c656563683a202b3525207c20313030255d0a5b4d756c74692d536c6173683a20312d33207c2031255d190700616e2065706963250100000000000000060072617269747901040065706963),
(761, 124, 138, 6390, 1, 0x076a0049742077617320637261667465642062792074686520616e6369656e74206f72646572206f6620746865206e696768746d617265206b6e69676874730a0a5b5370656c6c2044616d6167653a202b3130255d0a5b4669726520526573697374616e63653a20312d32355d190600612072617265250100000000000000060072617269747901040072617265),
(761, 124, 139, 14087, 1, 0x0729000a5b49636520526573697374616e63653a20312d32355d0a5b4d6178204865616c74683a202b34255d190600612072617265250100000000000000060072617269747901040072617265),
(761, 124, 140, 2869, 1, 0x2403);

-- --------------------------------------------------------

--
-- Table structure for table `player_kills`
--

CREATE TABLE `player_kills` (
  `player_id` int NOT NULL,
  `time` bigint UNSIGNED NOT NULL DEFAULT '0',
  `target` int NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_kills`
--

INSERT INTO `player_kills` (`player_id`, `time`, `target`, `unavenged`) VALUES
(12, 1652392039, 10, 1),
(74, 1663546412, 87, 1),
(99, 1679228808, 457, 1),
(99, 1679757630, 491, 1),
(347, 1672150903, 311, 1),
(625, 1690491061, 634, 1),
(625, 1690491522, 469, 1),
(267, 1669497338, 294, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_misc`
--

CREATE TABLE `player_misc` (
  `player_id` int NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_misc`
--

INSERT INTO `player_misc` (`player_id`, `info`) VALUES
(5, 0x7b7d),
(3, 0x7b7d),
(4, 0x7b7d),
(1, 0x7b7d),
(2, 0x7b7d),
(10, 0x7b7d),
(11, 0x7b7d),
(17, 0x7b7d),
(13, 0x7b7d),
(12, 0x7b7d),
(21, 0x7b7d),
(19, 0x7b7d),
(18, 0x7b7d),
(16, 0x7b7d),
(8, 0x7b7d),
(15, 0x7b7d),
(24, 0x7b7d),
(7, 0x7b7d),
(6, 0x7b7d),
(9, 0x7b7d),
(14, 0x7b7d),
(23, 0x7b7d),
(31, 0x7b7d),
(42, 0x7b7d),
(43, 0x7b7d),
(45, 0x7b7d),
(48, 0x7b7d),
(55, 0x7b7d),
(6, 0x7b7d),
(5, 0x7b7d),
(3, 0x7b7d),
(4, 0x7b7d),
(1, 0x7b7d),
(2, 0x7b7d),
(54, 0x7b7d),
(61, 0x7b7d),
(62, 0x7b7d),
(67, 0x7b7d),
(68, 0x7b7d),
(82, 0x7b7d),
(83, 0x7b7d),
(85, 0x7b7d),
(80, 0x7b7d),
(76, 0x7b7d),
(81, 0x7b7d),
(79, 0x7b7d),
(78, 0x7b7d),
(77, 0x7b7d),
(84, 0x7b7d),
(86, 0x7b7d),
(59, 0x7b7d),
(36, 0x7b7d),
(103, 0x7b7d),
(107, 0x7b7d),
(33, 0x7b7d),
(109, 0x7b7d),
(32, 0x7b7d),
(27, 0x7b7d),
(90, 0x7b7d),
(65, 0x7b7d),
(91, 0x7b7d),
(96, 0x7b7d),
(111, 0x7b7d),
(70, 0x7b7d),
(115, 0x7b7d),
(28, 0x7b7d),
(75, 0x7b7d),
(47, 0x7b7d),
(121, 0x7b7d),
(116, 0x7b7d),
(95, 0x7b7d),
(52, 0x7b7d),
(131, 0x7b7d),
(113, 0x7b7d),
(135, 0x7b7d),
(136, 0x7b7d),
(139, 0x7b7d),
(100, 0x7b7d),
(118, 0x7b7d),
(146, 0x7b7d),
(104, 0x7b7d),
(147, 0x7b7d),
(145, 0x7b7d),
(124, 0x7b7d),
(155, 0x7b7d),
(158, 0x7b7d),
(92, 0x7b7d),
(157, 0x7b7d),
(156, 0x7b7d),
(160, 0x7b7d),
(164, 0x7b7d),
(148, 0x7b7d),
(161, 0x7b7d),
(133, 0x7b7d),
(167, 0x7b7d),
(168, 0x7b7d),
(170, 0x7b7d),
(163, 0x7b7d),
(74, 0x7b7d),
(174, 0x7b7d),
(180, 0x7b7d),
(182, 0x7b7d),
(181, 0x7b7d),
(144, 0x7b7d),
(88, 0x7b7d),
(117, 0x7b7d),
(184, 0x7b7d),
(185, 0x7b7d),
(101, 0x7b7d),
(132, 0x7b7d),
(173, 0x7b7d),
(187, 0x7b7d),
(166, 0x7b7d),
(188, 0x7b7d),
(140, 0x7b7d),
(183, 0x7b7d),
(102, 0x7b7d),
(177, 0x7b7d),
(159, 0x7b7d),
(154, 0x7b7d),
(150, 0x7b7d),
(153, 0x7b7d),
(192, 0x7b7d),
(194, 0x7b7d),
(142, 0x7b7d),
(205, 0x7b7d),
(204, 0x7b7d),
(87, 0x7b7d),
(209, 0x7b7d),
(215, 0x7b7d),
(216, 0x7b7d),
(213, 0x7b7d),
(214, 0x7b7d),
(217, 0x7b7d),
(208, 0x7b7d),
(138, 0x7b7d),
(225, 0x7b7d),
(227, 0x7b7d),
(228, 0x7b7d),
(207, 0x7b7d),
(197, 0x7b7d),
(224, 0x7b7d),
(199, 0x7b7d),
(246, 0x7b7d),
(247, 0x7b7d),
(245, 0x7b7d),
(249, 0x7b7d),
(89, 0x7b7d),
(240, 0x7b7d),
(93, 0x7b7d),
(50, 0x7b7d),
(201, 0x7b7d),
(254, 0x7b7d),
(255, 0x7b7d),
(44, 0x7b7d),
(53, 0x7b7d),
(256, 0x7b7d),
(230, 0x7b7d),
(258, 0x7b7d),
(38, 0x7b7d),
(259, 0x7b7d),
(263, 0x7b7d),
(191, 0x7b7d),
(221, 0x7b7d),
(266, 0x7b7d),
(265, 0x7b7d),
(46, 0x7b7d),
(272, 0x7b7d),
(273, 0x7b7d),
(275, 0x7b7d),
(239, 0x7b7d),
(238, 0x7b7d),
(176, 0x7b7d),
(179, 0x7b7d),
(283, 0x7b7d),
(274, 0x7b7d),
(268, 0x7b7d),
(269, 0x7b7d),
(292, 0x7b7d),
(143, 0x7b7d),
(293, 0x7b7d),
(298, 0x7b7d),
(297, 0x7b7d),
(299, 0x7b7d),
(289, 0x7b7d),
(300, 0x7b7d),
(301, 0x7b7d),
(288, 0x7b7d),
(178, 0x7b7d),
(302, 0x7b7d),
(290, 0x7b7d),
(295, 0x7b7d),
(278, 0x7b7d),
(308, 0x7b7d),
(304, 0x7b7d),
(226, 0x7b7d),
(248, 0x7b7d),
(282, 0x7b7d),
(270, 0x7b7d),
(41, 0x7b7d),
(291, 0x7b7d),
(286, 0x7b7d),
(281, 0x7b7d),
(277, 0x7b7d),
(312, 0x7b7d),
(314, 0x7b7d),
(317, 0x7b7d),
(318, 0x7b7d),
(316, 0x7b7d),
(306, 0x7b7d),
(307, 0x7b7d),
(229, 0x7b7d),
(320, 0x7b7d),
(303, 0x7b7d),
(313, 0x7b7d),
(321, 0x7b7d),
(322, 0x7b7d),
(280, 0x7b7d),
(325, 0x7b7d),
(324, 0x7b7d),
(327, 0x7b7d),
(329, 0x7b7d),
(330, 0x7b7d),
(331, 0x7b7d),
(334, 0x7b7d),
(335, 0x7b7d),
(137, 0x7b7d),
(37, 0x7b7d),
(51, 0x7b7d),
(337, 0x7b7d),
(336, 0x7b7d),
(343, 0x7b7d),
(348, 0x7b7d),
(350, 0x7b7d),
(351, 0x7b7d),
(354, 0x7b7d),
(349, 0x7b7d),
(352, 0x7b7d),
(356, 0x7b7d),
(358, 0x7b7d),
(357, 0x7b7d),
(361, 0x7b7d),
(365, 0x7b7d),
(355, 0x7b7d),
(367, 0x7b7d),
(366, 0x7b7d),
(371, 0x7b7d),
(375, 0x7b7d),
(376, 0x7b7d),
(377, 0x7b7d),
(340, 0x7b7d),
(378, 0x7b7d),
(342, 0x7b7d),
(341, 0x7b7d),
(379, 0x7b7d),
(380, 0x7b7d),
(372, 0x7b7d),
(373, 0x7b7d),
(381, 0x7b7d),
(382, 0x7b7d),
(385, 0x7b7d),
(384, 0x7b7d),
(386, 0x7b7d),
(388, 0x7b7d),
(389, 0x7b7d),
(387, 0x7b7d),
(368, 0x7b7d),
(390, 0x7b7d),
(392, 0x7b7d),
(391, 0x7b7d),
(398, 0x7b7d),
(405, 0x7b7d),
(397, 0x7b7d),
(412, 0x7b7d),
(413, 0x7b7d),
(414, 0x7b7d),
(416, 0x7b7d),
(125, 0x7b7d),
(123, 0x7b7d),
(421, 0x7b7d),
(423, 0x7b7d),
(425, 0x7b7d),
(415, 0x7b7d),
(427, 0x7b7d),
(426, 0x7b7d),
(408, 0x7b7d),
(410, 0x7b7d),
(409, 0x7b7d),
(149, 0x7b7d),
(418, 0x7b7d),
(411, 0x7b7d),
(428, 0x7b7d),
(422, 0x7b7d),
(339, 0x7b7d),
(417, 0x7b7d),
(432, 0x7b7d),
(129, 0x7b7d),
(435, 0x7b7d),
(64, 0x7b7d),
(399, 0x7b7d),
(162, 0x7b7d),
(119, 0x7b7d),
(122, 0x7b7d),
(439, 0x7b7d),
(447, 0x7b7d),
(190, 0x7b7d),
(152, 0x7b7d),
(458, 0x7b7d),
(466, 0x7b7d),
(468, 0x7b7d),
(30, 0x7b7d),
(419, 0x7b7d),
(470, 0x7b7d),
(464, 0x7b7d),
(477, 0x7b7d),
(449, 0x7b7d),
(424, 0x7b7d),
(434, 0x7b7d),
(479, 0x7b7d),
(482, 0x7b7d),
(474, 0x7b7d),
(475, 0x7b7d),
(476, 0x7b7d),
(171, 0x7b7d),
(172, 0x7b7d),
(420, 0x7b7d),
(467, 0x7b7d),
(494, 0x7b7d),
(453, 0x7b7d),
(443, 0x7b7d),
(450, 0x7b7d),
(442, 0x7b7d),
(446, 0x7b7d),
(105, 0x7b7d),
(106, 0x7b7d),
(114, 0x7b7d),
(448, 0x7b7d),
(497, 0x7b7d),
(237, 0x7b7d),
(236, 0x7b7d),
(456, 0x7b7d),
(498, 0x7b7d),
(487, 0x7b7d),
(460, 0x7b7d),
(126, 0x7b7d),
(127, 0x7b7d),
(437, 0x7b7d),
(241, 0x7b7d),
(444, 0x7b7d),
(440, 0x7b7d),
(492, 0x7b7d),
(503, 0x7b7d),
(454, 0x7b7d),
(506, 0x7b7d),
(509, 0x7b7d),
(430, 0x7b7d),
(406, 0x7b7d),
(512, 0x7b7d),
(151, 0x7b7d),
(515, 0x7b7d),
(502, 0x7b7d),
(519, 0x7b7d),
(517, 0x7b7d),
(520, 0x7b7d),
(514, 0x7b7d),
(344, 0x7b7d),
(471, 0x7b7d),
(522, 0x7b7d),
(451, 0x7b7d),
(511, 0x7b7d),
(523, 0x7b7d),
(495, 0x7b7d),
(516, 0x7b7d),
(513, 0x7b7d),
(473, 0x7b7d),
(526, 0x7b7d),
(441, 0x7b7d),
(527, 0x7b7d),
(345, 0x7b7d),
(530, 0x7b7d),
(533, 0x7b7d),
(536, 0x7b7d),
(481, 0x7b7d),
(99, 0x7b7d),
(529, 0x7b7d),
(540, 0x7b7d),
(491, 0x7b7d),
(538, 0x7b7d),
(485, 0x7b7d),
(541, 0x7b7d),
(531, 0x7b7d),
(510, 0x7b7d),
(532, 0x7b7d),
(539, 0x7b7d),
(544, 0x7b7d),
(461, 0x7b7d),
(433, 0x7b7d),
(472, 0x7b7d),
(486, 0x7b7d),
(546, 0x7b7d),
(547, 0x7b7d),
(548, 0x7b7d),
(436, 0x7b7d),
(545, 0x7b7d),
(518, 0x7b7d),
(542, 0x7b7d),
(404, 0x7b7d),
(535, 0x7b7d),
(534, 0x7b7d),
(553, 0x7b7d),
(524, 0x7b7d),
(521, 0x7b7d),
(233, 0x7b7d),
(551, 0x7b7d),
(557, 0x7b7d),
(555, 0x7b7d),
(552, 0x7b7d),
(549, 0x7b7d),
(564, 0x7b7d),
(563, 0x7b7d),
(565, 0x7b7d),
(484, 0x7b7d),
(568, 0x7b7d),
(556, 0x7b7d),
(571, 0x7b7d),
(537, 0x7b7d),
(499, 0x7b7d),
(49, 0x7b7d),
(579, 0x7b7d),
(583, 0x7b7d),
(577, 0x7b7d),
(576, 0x7b7d),
(573, 0x7b7d),
(584, 0x7b7d),
(580, 0x7b7d),
(493, 0x7b7d),
(578, 0x7b7d),
(581, 0x7b7d),
(566, 0x7b7d),
(561, 0x7b7d),
(222, 0x7b7d),
(586, 0x7b7d),
(284, 0x7b7d),
(582, 0x7b7d),
(560, 0x7b7d),
(567, 0x7b7d),
(271, 0x7b7d),
(294, 0x7b7d),
(287, 0x7b7d),
(305, 0x7b7d),
(309, 0x7b7d),
(296, 0x7b7d),
(488, 0x7b7d),
(500, 0x7b7d),
(590, 0x7b7d),
(452, 0x7b7d),
(591, 0x7b7d),
(594, 0x7b7d),
(595, 0x7b7d),
(592, 0x7b7d),
(596, 0x7b7d),
(311, 0x7b7d),
(597, 0x7b7d),
(587, 0x7b7d),
(598, 0x7b7d),
(585, 0x7b7d),
(489, 0x7b7d),
(543, 0x7b7d),
(601, 0x7b7d),
(604, 0x7b7d),
(600, 0x7b7d),
(395, 0x7b7d),
(98, 0x7b7d),
(110, 0x7b7d),
(606, 0x7b7d),
(605, 0x7b7d),
(97, 0x7b7d),
(599, 0x7b7d),
(608, 0x7b7d),
(285, 0x7b7d),
(393, 0x7b7d),
(394, 0x7b7d),
(610, 0x7b7d),
(609, 0x7b7d),
(562, 0x7b7d),
(34, 0x7b7d),
(611, 0x7b7d),
(612, 0x7b7d),
(617, 0x7b7d),
(620, 0x7b7d),
(619, 0x7b7d),
(621, 0x7b7d),
(607, 0x7b7d),
(618, 0x7b7d),
(613, 0x7b7d),
(616, 0x7b7d),
(614, 0x7b7d),
(615, 0x7b7d),
(626, 0x7b7d),
(627, 0x7b7d),
(628, 0x7b7d),
(629, 0x7b7d),
(429, 0x7b7d),
(465, 0x7b7d),
(631, 0x7b7d),
(633, 0x7b7d),
(635, 0x7b7d),
(636, 0x7b7d),
(396, 0x7b7d),
(622, 0x7b7d),
(235, 0x7b7d),
(638, 0x7b7d),
(252, 0x7b7d),
(640, 0x7b7d),
(643, 0x7b7d),
(645, 0x7b7d),
(261, 0x7b7d),
(644, 0x7b7d),
(319, 0x7b7d),
(646, 0x7b7d),
(642, 0x7b7d),
(639, 0x7b7d),
(480, 0x7b7d),
(189, 0x7b7d),
(648, 0x7b7d),
(632, 0x7b7d),
(650, 0x7b7d),
(402, 0x7b7d),
(332, 0x7b7d),
(647, 0x7b7d),
(134, 0x7b7d),
(528, 0x7b7d),
(462, 0x7b7d),
(463, 0x7b7d),
(651, 0x7b7d),
(262, 0x7b7d),
(659, 0x7b7d),
(661, 0x7b7d),
(660, 0x7b7d),
(267, 0x7b7d),
(276, 0x7b7d),
(634, 0x7b7d),
(362, 0x7b7d),
(363, 0x7b7d),
(589, 0x7b7d),
(257, 0x7b7d),
(550, 0x7b7d),
(347, 0x7b7d),
(662, 0x7b7d),
(264, 0x7b7d),
(663, 0x7b7d),
(666, 0x7b7d),
(665, 0x7b7d),
(457, 0x7b7d),
(668, 0x7b7d),
(669, 0x7b7d),
(603, 0x7b7d),
(407, 0x7b7d),
(364, 0x7b7d),
(675, 0x7b7d),
(667, 0x7b7d),
(670, 0x7b7d),
(673, 0x7b7d),
(672, 0x7b7d),
(677, 0x7b7d),
(678, 0x7b7d),
(671, 0x7b7d),
(328, 0x7b7d),
(680, 0x7b7d),
(656, 0x7b7d),
(445, 0x7b7d),
(496, 0x7b7d),
(674, 0x7b7d),
(206, 0x7b7d),
(438, 0x7b7d),
(690, 0x7b7d),
(692, 0x7b7d),
(243, 0x7b7d),
(693, 0x7b7d),
(694, 0x7b7d),
(695, 0x7b7d),
(696, 0x7b7d),
(244, 0x7b7d),
(682, 0x7b7d),
(625, 0x7b7d),
(623, 0x7b7d),
(624, 0x7b7d),
(698, 0x7b7d),
(202, 0x7b7d),
(569, 0x7b7d),
(570, 0x7b7d),
(559, 0x7b7d),
(558, 0x7b7d),
(501, 0x7b7d),
(242, 0x7b7d),
(681, 0x7b7d),
(220, 0x7b7d),
(232, 0x7b7d),
(684, 0x7b7d),
(686, 0x7b7d),
(654, 0x7b7d),
(505, 0x7b7d),
(353, 0x7b7d),
(655, 0x7b7d),
(658, 0x7b7d),
(705, 0x7b7d),
(709, 0x7b7d),
(683, 0x7b7d),
(338, 0x7b7d),
(710, 0x7b7d),
(708, 0x7b7d),
(702, 0x7b7d),
(664, 0x7b7d),
(653, 0x7b7d),
(469, 0x7b7d),
(703, 0x7b7d),
(704, 0x7b7d),
(691, 0x7b7d),
(688, 0x7b7d),
(711, 0x7b7d),
(687, 0x7b7d),
(712, 0x7b7d),
(713, 0x7b7d),
(401, 0x7b7d),
(403, 0x7b7d),
(679, 0x7b7d),
(400, 0x7b7d),
(652, 0x7b7d),
(717, 0x7b7d),
(657, 0x7b7d),
(707, 0x7b7d),
(716, 0x7b7d),
(231, 0x7b7d),
(219, 0x7b7d),
(700, 0x7b7d),
(701, 0x7b7d),
(699, 0x7b7d),
(714, 0x7b7d),
(40, 0x7b7d),
(25, 0x7b7d),
(39, 0x7b7d),
(56, 0x7b7d),
(731, 0x7b7d),
(736, 0x7b7d),
(729, 0x7b7d),
(730, 0x7b7d),
(734, 0x7b7d),
(739, 0x7b7d),
(738, 0x7b7d),
(744, 0x7b7d),
(741, 0x7b7d),
(745, 0x7b7d),
(740, 0x7b7d),
(733, 0x7b7d),
(735, 0x7b7d),
(726, 0x7b7d),
(732, 0x7b7d),
(752, 0x7b7d),
(756, 0x7b7d),
(742, 0x7b7d),
(757, 0x7b7d),
(743, 0x7b7d),
(755, 0x7b7d),
(727, 0x7b7d),
(754, 0x7b7d),
(728, 0x7b7d),
(753, 0x7b7d),
(26, 0x7b7d),
(763, 0x7b7d),
(762, 0x7b7d),
(761, 0x7b7d);

-- --------------------------------------------------------

--
-- Table structure for table `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint NOT NULL,
  `namelocked_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_prey`
--

CREATE TABLE `player_prey` (
  `player_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `mindex` smallint NOT NULL,
  `mcolumn` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_preytimes`
--

CREATE TABLE `player_preytimes` (
  `player_id` int NOT NULL,
  `bonus_type1` int NOT NULL,
  `bonus_value1` int NOT NULL,
  `bonus_name1` varchar(50) NOT NULL,
  `bonus_type2` int NOT NULL,
  `bonus_value2` int NOT NULL,
  `bonus_name2` varchar(50) NOT NULL,
  `bonus_type3` int NOT NULL,
  `bonus_value3` int NOT NULL,
  `bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_preytimes`
--

INSERT INTO `player_preytimes` (`player_id`, `bonus_type1`, `bonus_value1`, `bonus_name1`, `bonus_type2`, `bonus_value2`, `bonus_name2`, `bonus_type3`, `bonus_value3`, `bonus_name3`) VALUES
(6, 0, 0, '', 0, 0, '', 0, 0, ''),
(5, 0, 0, '', 0, 0, '', 0, 0, ''),
(4, 0, 0, '', 0, 0, '', 0, 0, ''),
(2, 0, 0, '', 0, 0, '', 0, 0, ''),
(3, 0, 0, '', 0, 0, '', 0, 0, ''),
(8, 0, 0, '', 0, 0, '', 0, 0, ''),
(7, 0, 0, '', 0, 0, '', 0, 0, ''),
(1, 0, 0, '', 0, 0, '', 0, 0, ''),
(9, 0, 0, '', 0, 0, '', 0, 0, ''),
(10, 0, 0, '', 0, 0, '', 0, 0, ''),
(11, 0, 0, '', 0, 0, '', 0, 0, ''),
(12, 0, 0, '', 0, 0, '', 0, 0, ''),
(13, 0, 0, '', 0, 0, '', 0, 0, ''),
(14, 0, 0, '', 0, 0, '', 0, 0, ''),
(15, 0, 0, '', 0, 0, '', 0, 0, ''),
(16, 0, 0, '', 0, 0, '', 0, 0, ''),
(17, 0, 0, '', 0, 0, '', 0, 0, ''),
(18, 0, 0, '', 0, 0, '', 0, 0, ''),
(19, 0, 0, '', 0, 0, '', 0, 0, ''),
(21, 0, 0, '', 0, 0, '', 0, 0, ''),
(23, 0, 0, '', 0, 0, '', 0, 0, ''),
(24, 0, 0, '', 0, 0, '', 0, 0, ''),
(26, 0, 0, '', 0, 0, '', 0, 0, ''),
(27, 0, 0, '', 0, 0, '', 0, 0, ''),
(25, 0, 0, '', 0, 0, '', 0, 0, ''),
(28, 0, 0, '', 0, 0, '', 0, 0, ''),
(31, 0, 0, '', 0, 0, '', 0, 0, ''),
(33, 0, 0, '', 0, 0, '', 0, 0, ''),
(34, 0, 0, '', 0, 0, '', 0, 0, ''),
(36, 0, 0, '', 0, 0, '', 0, 0, ''),
(37, 0, 0, '', 0, 0, '', 0, 0, ''),
(39, 0, 0, '', 0, 0, '', 0, 0, ''),
(40, 0, 0, '', 0, 0, '', 0, 0, ''),
(38, 0, 0, '', 0, 0, '', 0, 0, ''),
(41, 0, 0, '', 0, 0, '', 0, 0, ''),
(42, 0, 0, '', 0, 0, '', 0, 0, ''),
(30, 0, 0, '', 0, 0, '', 0, 0, ''),
(43, 0, 0, '', 0, 0, '', 0, 0, ''),
(44, 0, 0, '', 0, 0, '', 0, 0, ''),
(45, 0, 0, '', 0, 0, '', 0, 0, ''),
(46, 0, 0, '', 0, 0, '', 0, 0, ''),
(47, 0, 0, '', 0, 0, '', 0, 0, ''),
(48, 0, 0, '', 0, 0, '', 0, 0, ''),
(49, 0, 0, '', 0, 0, '', 0, 0, ''),
(50, 0, 0, '', 0, 0, '', 0, 0, ''),
(51, 0, 0, '', 0, 0, '', 0, 0, ''),
(52, 0, 0, '', 0, 0, '', 0, 0, ''),
(53, 0, 0, '', 0, 0, '', 0, 0, ''),
(54, 0, 0, '', 0, 0, '', 0, 0, ''),
(55, 0, 0, '', 0, 0, '', 0, 0, ''),
(6, 0, 0, '', 0, 0, '', 0, 0, ''),
(5, 0, 0, '', 0, 0, '', 0, 0, ''),
(4, 0, 0, '', 0, 0, '', 0, 0, ''),
(2, 0, 0, '', 0, 0, '', 0, 0, ''),
(3, 0, 0, '', 0, 0, '', 0, 0, ''),
(1, 0, 0, '', 0, 0, '', 0, 0, ''),
(56, 0, 0, '', 0, 0, '', 0, 0, ''),
(59, 0, 0, '', 0, 0, '', 0, 0, ''),
(32, 0, 0, '', 0, 0, '', 0, 0, ''),
(61, 0, 0, '', 0, 0, '', 0, 0, ''),
(62, 0, 0, '', 0, 0, '', 0, 0, ''),
(64, 0, 0, '', 0, 0, '', 0, 0, ''),
(65, 0, 0, '', 0, 0, '', 0, 0, ''),
(67, 0, 0, '', 0, 0, '', 0, 0, ''),
(68, 0, 0, '', 0, 0, '', 0, 0, ''),
(70, 0, 0, '', 0, 0, '', 0, 0, ''),
(74, 0, 0, '', 0, 0, '', 0, 0, ''),
(75, 0, 0, '', 0, 0, '', 0, 0, ''),
(82, 0, 0, '', 0, 0, '', 0, 0, ''),
(83, 0, 0, '', 0, 0, '', 0, 0, ''),
(85, 0, 0, '', 0, 0, '', 0, 0, ''),
(80, 0, 0, '', 0, 0, '', 0, 0, ''),
(76, 0, 0, '', 0, 0, '', 0, 0, ''),
(81, 0, 0, '', 0, 0, '', 0, 0, ''),
(79, 0, 0, '', 0, 0, '', 0, 0, ''),
(78, 0, 0, '', 0, 0, '', 0, 0, ''),
(77, 0, 0, '', 0, 0, '', 0, 0, ''),
(84, 0, 0, '', 0, 0, '', 0, 0, ''),
(86, 0, 0, '', 0, 0, '', 0, 0, ''),
(87, 0, 0, '', 0, 0, '', 0, 0, ''),
(88, 0, 0, '', 0, 0, '', 0, 0, ''),
(91, 0, 0, '', 0, 0, '', 0, 0, ''),
(89, 0, 0, '', 0, 0, '', 0, 0, ''),
(90, 0, 0, '', 0, 0, '', 0, 0, ''),
(92, 0, 0, '', 0, 0, '', 0, 0, ''),
(93, 0, 0, '', 0, 0, '', 0, 0, ''),
(95, 0, 0, '', 0, 0, '', 0, 0, ''),
(96, 0, 0, '', 0, 0, '', 0, 0, ''),
(97, 0, 0, '', 0, 0, '', 0, 0, ''),
(98, 0, 0, '', 0, 0, '', 0, 0, ''),
(100, 0, 0, '', 0, 0, '', 0, 0, ''),
(101, 0, 0, '', 0, 0, '', 0, 0, ''),
(102, 0, 0, '', 0, 0, '', 0, 0, ''),
(103, 0, 0, '', 0, 0, '', 0, 0, ''),
(104, 0, 0, '', 0, 0, '', 0, 0, ''),
(105, 0, 0, '', 0, 0, '', 0, 0, ''),
(106, 0, 0, '', 0, 0, '', 0, 0, ''),
(107, 0, 0, '', 0, 0, '', 0, 0, ''),
(108, 0, 0, '', 0, 0, '', 0, 0, ''),
(109, 0, 0, '', 0, 0, '', 0, 0, ''),
(110, 0, 0, '', 0, 0, '', 0, 0, ''),
(111, 0, 0, '', 0, 0, '', 0, 0, ''),
(116, 0, 0, '', 0, 0, '', 0, 0, ''),
(115, 0, 0, '', 0, 0, '', 0, 0, ''),
(117, 0, 0, '', 0, 0, '', 0, 0, ''),
(119, 0, 0, '', 0, 0, '', 0, 0, ''),
(121, 0, 0, '', 0, 0, '', 0, 0, ''),
(122, 0, 0, '', 0, 0, '', 0, 0, ''),
(125, 0, 0, '', 0, 0, '', 0, 0, ''),
(124, 0, 0, '', 0, 0, '', 0, 0, ''),
(127, 0, 0, '', 0, 0, '', 0, 0, ''),
(126, 0, 0, '', 0, 0, '', 0, 0, ''),
(129, 0, 0, '', 0, 0, '', 0, 0, ''),
(131, 0, 0, '', 0, 0, '', 0, 0, ''),
(132, 0, 0, '', 0, 0, '', 0, 0, ''),
(133, 0, 0, '', 0, 0, '', 0, 0, ''),
(113, 0, 0, '', 0, 0, '', 0, 0, ''),
(134, 0, 0, '', 0, 0, '', 0, 0, ''),
(135, 0, 0, '', 0, 0, '', 0, 0, ''),
(136, 0, 0, '', 0, 0, '', 0, 0, ''),
(137, 0, 0, '', 0, 0, '', 0, 0, ''),
(138, 0, 0, '', 0, 0, '', 0, 0, ''),
(139, 0, 0, '', 0, 0, '', 0, 0, ''),
(140, 0, 0, '', 0, 0, '', 0, 0, ''),
(142, 0, 0, '', 0, 0, '', 0, 0, ''),
(143, 0, 0, '', 0, 0, '', 0, 0, ''),
(144, 0, 0, '', 0, 0, '', 0, 0, ''),
(145, 0, 0, '', 0, 0, '', 0, 0, ''),
(146, 0, 0, '', 0, 0, '', 0, 0, ''),
(118, 0, 0, '', 0, 0, '', 0, 0, ''),
(147, 0, 0, '', 0, 0, '', 0, 0, ''),
(149, 0, 0, '', 0, 0, '', 0, 0, ''),
(150, 0, 0, '', 0, 0, '', 0, 0, ''),
(151, 0, 0, '', 0, 0, '', 0, 0, ''),
(152, 0, 0, '', 0, 0, '', 0, 0, ''),
(154, 0, 0, '', 0, 0, '', 0, 0, ''),
(153, 0, 0, '', 0, 0, '', 0, 0, ''),
(156, 0, 0, '', 0, 0, '', 0, 0, ''),
(155, 0, 0, '', 0, 0, '', 0, 0, ''),
(158, 0, 0, '', 0, 0, '', 0, 0, ''),
(157, 0, 0, '', 0, 0, '', 0, 0, ''),
(159, 0, 0, '', 0, 0, '', 0, 0, ''),
(160, 0, 0, '', 0, 0, '', 0, 0, ''),
(161, 0, 0, '', 0, 0, '', 0, 0, ''),
(114, 0, 0, '', 0, 0, '', 0, 0, ''),
(162, 0, 0, '', 0, 0, '', 0, 0, ''),
(148, 0, 0, '', 0, 0, '', 0, 0, ''),
(163, 0, 0, '', 0, 0, '', 0, 0, ''),
(164, 0, 0, '', 0, 0, '', 0, 0, ''),
(166, 0, 0, '', 0, 0, '', 0, 0, ''),
(167, 0, 0, '', 0, 0, '', 0, 0, ''),
(168, 0, 0, '', 0, 0, '', 0, 0, ''),
(170, 0, 0, '', 0, 0, '', 0, 0, ''),
(171, 0, 0, '', 0, 0, '', 0, 0, ''),
(172, 0, 0, '', 0, 0, '', 0, 0, ''),
(173, 0, 0, '', 0, 0, '', 0, 0, ''),
(174, 0, 0, '', 0, 0, '', 0, 0, ''),
(176, 0, 0, '', 0, 0, '', 0, 0, ''),
(177, 0, 0, '', 0, 0, '', 0, 0, ''),
(178, 0, 0, '', 0, 0, '', 0, 0, ''),
(179, 0, 0, '', 0, 0, '', 0, 0, ''),
(180, 0, 0, '', 0, 0, '', 0, 0, ''),
(181, 0, 0, '', 0, 0, '', 0, 0, ''),
(182, 0, 0, '', 0, 0, '', 0, 0, ''),
(183, 0, 0, '', 0, 0, '', 0, 0, ''),
(184, 0, 0, '', 0, 0, '', 0, 0, ''),
(185, 0, 0, '', 0, 0, '', 0, 0, ''),
(187, 0, 0, '', 0, 0, '', 0, 0, ''),
(188, 0, 0, '', 0, 0, '', 0, 0, ''),
(189, 0, 0, '', 0, 0, '', 0, 0, ''),
(190, 0, 0, '', 0, 0, '', 0, 0, ''),
(191, 0, 0, '', 0, 0, '', 0, 0, ''),
(192, 0, 0, '', 0, 0, '', 0, 0, ''),
(194, 0, 0, '', 0, 0, '', 0, 0, ''),
(197, 0, 0, '', 0, 0, '', 0, 0, ''),
(199, 0, 0, '', 0, 0, '', 0, 0, ''),
(201, 0, 0, '', 0, 0, '', 0, 0, ''),
(202, 0, 0, '', 0, 0, '', 0, 0, ''),
(204, 0, 0, '', 0, 0, '', 0, 0, ''),
(205, 0, 0, '', 0, 0, '', 0, 0, ''),
(207, 0, 0, '', 0, 0, '', 0, 0, ''),
(209, 0, 0, '', 0, 0, '', 0, 0, ''),
(208, 0, 0, '', 0, 0, '', 0, 0, ''),
(215, 0, 0, '', 0, 0, '', 0, 0, ''),
(213, 0, 0, '', 0, 0, '', 0, 0, ''),
(216, 0, 0, '', 0, 0, '', 0, 0, ''),
(214, 0, 0, '', 0, 0, '', 0, 0, ''),
(217, 0, 0, '', 0, 0, '', 0, 0, ''),
(206, 0, 0, '', 0, 0, '', 0, 0, ''),
(219, 0, 0, '', 0, 0, '', 0, 0, ''),
(220, 0, 0, '', 0, 0, '', 0, 0, ''),
(221, 0, 0, '', 0, 0, '', 0, 0, ''),
(222, 0, 0, '', 0, 0, '', 0, 0, ''),
(224, 0, 0, '', 0, 0, '', 0, 0, ''),
(225, 0, 0, '', 0, 0, '', 0, 0, ''),
(226, 0, 0, '', 0, 0, '', 0, 0, ''),
(227, 0, 0, '', 0, 0, '', 0, 0, ''),
(228, 0, 0, '', 0, 0, '', 0, 0, ''),
(229, 0, 0, '', 0, 0, '', 0, 0, ''),
(230, 0, 0, '', 0, 0, '', 0, 0, ''),
(232, 0, 0, '', 0, 0, '', 0, 0, ''),
(231, 0, 0, '', 0, 0, '', 0, 0, ''),
(233, 0, 0, '', 0, 0, '', 0, 0, ''),
(234, 0, 0, '', 0, 0, '', 0, 0, ''),
(235, 0, 0, '', 0, 0, '', 0, 0, ''),
(236, 0, 0, '', 0, 0, '', 0, 0, ''),
(237, 0, 0, '', 0, 0, '', 0, 0, ''),
(238, 0, 0, '', 0, 0, '', 0, 0, ''),
(239, 0, 0, '', 0, 0, '', 0, 0, ''),
(240, 0, 0, '', 0, 0, '', 0, 0, ''),
(241, 0, 0, '', 0, 0, '', 0, 0, ''),
(242, 0, 0, '', 0, 0, '', 0, 0, ''),
(243, 0, 0, '', 0, 0, '', 0, 0, ''),
(244, 0, 0, '', 0, 0, '', 0, 0, ''),
(245, 0, 0, '', 0, 0, '', 0, 0, ''),
(246, 0, 0, '', 0, 0, '', 0, 0, ''),
(247, 0, 0, '', 0, 0, '', 0, 0, ''),
(248, 0, 0, '', 0, 0, '', 0, 0, ''),
(249, 0, 0, '', 0, 0, '', 0, 0, ''),
(252, 0, 0, '', 0, 0, '', 0, 0, ''),
(254, 0, 0, '', 0, 0, '', 0, 0, ''),
(255, 0, 0, '', 0, 0, '', 0, 0, ''),
(256, 0, 0, '', 0, 0, '', 0, 0, ''),
(257, 0, 0, '', 0, 0, '', 0, 0, ''),
(258, 0, 0, '', 0, 0, '', 0, 0, ''),
(259, 0, 0, '', 0, 0, '', 0, 0, ''),
(262, 0, 0, '', 0, 0, '', 0, 0, ''),
(263, 0, 0, '', 0, 0, '', 0, 0, ''),
(265, 0, 0, '', 0, 0, '', 0, 0, ''),
(266, 0, 0, '', 0, 0, '', 0, 0, ''),
(267, 0, 0, '', 0, 0, '', 0, 0, ''),
(268, 0, 0, '', 0, 0, '', 0, 0, ''),
(269, 0, 0, '', 0, 0, '', 0, 0, ''),
(270, 0, 0, '', 0, 0, '', 0, 0, ''),
(271, 0, 0, '', 0, 0, '', 0, 0, ''),
(272, 0, 0, '', 0, 0, '', 0, 0, ''),
(273, 0, 0, '', 0, 0, '', 0, 0, ''),
(274, 0, 0, '', 0, 0, '', 0, 0, ''),
(275, 0, 0, '', 0, 0, '', 0, 0, ''),
(276, 0, 0, '', 0, 0, '', 0, 0, ''),
(277, 0, 0, '', 0, 0, '', 0, 0, ''),
(278, 0, 0, '', 0, 0, '', 0, 0, ''),
(261, 0, 0, '', 0, 0, '', 0, 0, ''),
(280, 0, 0, '', 0, 0, '', 0, 0, ''),
(281, 0, 0, '', 0, 0, '', 0, 0, ''),
(282, 0, 0, '', 0, 0, '', 0, 0, ''),
(284, 0, 0, '', 0, 0, '', 0, 0, ''),
(283, 0, 0, '', 0, 0, '', 0, 0, ''),
(285, 0, 0, '', 0, 0, '', 0, 0, ''),
(286, 0, 0, '', 0, 0, '', 0, 0, ''),
(287, 0, 0, '', 0, 0, '', 0, 0, ''),
(288, 0, 0, '', 0, 0, '', 0, 0, ''),
(289, 0, 0, '', 0, 0, '', 0, 0, ''),
(291, 0, 0, '', 0, 0, '', 0, 0, ''),
(292, 0, 0, '', 0, 0, '', 0, 0, ''),
(290, 0, 0, '', 0, 0, '', 0, 0, ''),
(293, 0, 0, '', 0, 0, '', 0, 0, ''),
(294, 0, 0, '', 0, 0, '', 0, 0, ''),
(295, 0, 0, '', 0, 0, '', 0, 0, ''),
(296, 0, 0, '', 0, 0, '', 0, 0, ''),
(297, 0, 0, '', 0, 0, '', 0, 0, ''),
(298, 0, 0, '', 0, 0, '', 0, 0, ''),
(299, 0, 0, '', 0, 0, '', 0, 0, ''),
(300, 0, 0, '', 0, 0, '', 0, 0, ''),
(301, 0, 0, '', 0, 0, '', 0, 0, ''),
(302, 0, 0, '', 0, 0, '', 0, 0, ''),
(303, 0, 0, '', 0, 0, '', 0, 0, ''),
(304, 0, 0, '', 0, 0, '', 0, 0, ''),
(305, 0, 0, '', 0, 0, '', 0, 0, ''),
(306, 0, 0, '', 0, 0, '', 0, 0, ''),
(307, 0, 0, '', 0, 0, '', 0, 0, ''),
(308, 0, 0, '', 0, 0, '', 0, 0, ''),
(99, 0, 0, '', 0, 0, '', 0, 0, ''),
(309, 0, 0, '', 0, 0, '', 0, 0, ''),
(311, 0, 0, '', 0, 0, '', 0, 0, ''),
(312, 0, 0, '', 0, 0, '', 0, 0, ''),
(313, 0, 0, '', 0, 0, '', 0, 0, ''),
(314, 0, 0, '', 0, 0, '', 0, 0, ''),
(316, 0, 0, '', 0, 0, '', 0, 0, ''),
(317, 0, 0, '', 0, 0, '', 0, 0, ''),
(318, 0, 0, '', 0, 0, '', 0, 0, ''),
(319, 0, 0, '', 0, 0, '', 0, 0, ''),
(320, 0, 0, '', 0, 0, '', 0, 0, ''),
(321, 0, 0, '', 0, 0, '', 0, 0, ''),
(322, 0, 0, '', 0, 0, '', 0, 0, ''),
(324, 0, 0, '', 0, 0, '', 0, 0, ''),
(325, 0, 0, '', 0, 0, '', 0, 0, ''),
(327, 0, 0, '', 0, 0, '', 0, 0, ''),
(329, 0, 0, '', 0, 0, '', 0, 0, ''),
(330, 0, 0, '', 0, 0, '', 0, 0, ''),
(331, 0, 0, '', 0, 0, '', 0, 0, ''),
(332, 0, 0, '', 0, 0, '', 0, 0, ''),
(334, 0, 0, '', 0, 0, '', 0, 0, ''),
(335, 0, 0, '', 0, 0, '', 0, 0, ''),
(336, 0, 0, '', 0, 0, '', 0, 0, ''),
(337, 0, 0, '', 0, 0, '', 0, 0, ''),
(338, 0, 0, '', 0, 0, '', 0, 0, ''),
(339, 0, 0, '', 0, 0, '', 0, 0, ''),
(340, 0, 0, '', 0, 0, '', 0, 0, ''),
(341, 0, 0, '', 0, 0, '', 0, 0, ''),
(342, 0, 0, '', 0, 0, '', 0, 0, ''),
(343, 0, 0, '', 0, 0, '', 0, 0, ''),
(345, 0, 0, '', 0, 0, '', 0, 0, ''),
(347, 0, 0, '', 0, 0, '', 0, 0, ''),
(348, 0, 0, '', 0, 0, '', 0, 0, ''),
(349, 0, 0, '', 0, 0, '', 0, 0, ''),
(350, 0, 0, '', 0, 0, '', 0, 0, ''),
(351, 0, 0, '', 0, 0, '', 0, 0, ''),
(352, 0, 0, '', 0, 0, '', 0, 0, ''),
(353, 0, 0, '', 0, 0, '', 0, 0, ''),
(354, 0, 0, '', 0, 0, '', 0, 0, ''),
(355, 0, 0, '', 0, 0, '', 0, 0, ''),
(356, 0, 0, '', 0, 0, '', 0, 0, ''),
(358, 0, 0, '', 0, 0, '', 0, 0, ''),
(357, 0, 0, '', 0, 0, '', 0, 0, ''),
(361, 0, 0, '', 0, 0, '', 0, 0, ''),
(362, 0, 0, '', 0, 0, '', 0, 0, ''),
(363, 0, 0, '', 0, 0, '', 0, 0, ''),
(364, 0, 0, '', 0, 0, '', 0, 0, ''),
(365, 0, 0, '', 0, 0, '', 0, 0, ''),
(366, 0, 0, '', 0, 0, '', 0, 0, ''),
(367, 0, 0, '', 0, 0, '', 0, 0, ''),
(368, 0, 0, '', 0, 0, '', 0, 0, ''),
(371, 0, 0, '', 0, 0, '', 0, 0, ''),
(372, 0, 0, '', 0, 0, '', 0, 0, ''),
(373, 0, 0, '', 0, 0, '', 0, 0, ''),
(375, 0, 0, '', 0, 0, '', 0, 0, ''),
(376, 0, 0, '', 0, 0, '', 0, 0, ''),
(377, 0, 0, '', 0, 0, '', 0, 0, ''),
(378, 0, 0, '', 0, 0, '', 0, 0, ''),
(379, 0, 0, '', 0, 0, '', 0, 0, ''),
(380, 0, 0, '', 0, 0, '', 0, 0, ''),
(381, 0, 0, '', 0, 0, '', 0, 0, ''),
(382, 0, 0, '', 0, 0, '', 0, 0, ''),
(385, 0, 0, '', 0, 0, '', 0, 0, ''),
(384, 0, 0, '', 0, 0, '', 0, 0, ''),
(386, 0, 0, '', 0, 0, '', 0, 0, ''),
(387, 0, 0, '', 0, 0, '', 0, 0, ''),
(389, 0, 0, '', 0, 0, '', 0, 0, ''),
(388, 0, 0, '', 0, 0, '', 0, 0, ''),
(390, 0, 0, '', 0, 0, '', 0, 0, ''),
(392, 0, 0, '', 0, 0, '', 0, 0, ''),
(391, 0, 0, '', 0, 0, '', 0, 0, ''),
(393, 0, 0, '', 0, 0, '', 0, 0, ''),
(395, 0, 0, '', 0, 0, '', 0, 0, ''),
(394, 0, 0, '', 0, 0, '', 0, 0, ''),
(396, 0, 0, '', 0, 0, '', 0, 0, ''),
(397, 0, 0, '', 0, 0, '', 0, 0, ''),
(398, 0, 0, '', 0, 0, '', 0, 0, ''),
(399, 0, 0, '', 0, 0, '', 0, 0, ''),
(400, 0, 0, '', 0, 0, '', 0, 0, ''),
(401, 0, 0, '', 0, 0, '', 0, 0, ''),
(344, 0, 0, '', 0, 0, '', 0, 0, ''),
(403, 0, 0, '', 0, 0, '', 0, 0, ''),
(402, 0, 0, '', 0, 0, '', 0, 0, ''),
(404, 0, 0, '', 0, 0, '', 0, 0, ''),
(405, 0, 0, '', 0, 0, '', 0, 0, ''),
(406, 0, 0, '', 0, 0, '', 0, 0, ''),
(409, 0, 0, '', 0, 0, '', 0, 0, ''),
(410, 0, 0, '', 0, 0, '', 0, 0, ''),
(411, 0, 0, '', 0, 0, '', 0, 0, ''),
(407, 0, 0, '', 0, 0, '', 0, 0, ''),
(408, 0, 0, '', 0, 0, '', 0, 0, ''),
(412, 0, 0, '', 0, 0, '', 0, 0, ''),
(413, 0, 0, '', 0, 0, '', 0, 0, ''),
(414, 0, 0, '', 0, 0, '', 0, 0, ''),
(415, 0, 0, '', 0, 0, '', 0, 0, ''),
(416, 0, 0, '', 0, 0, '', 0, 0, ''),
(123, 0, 0, '', 0, 0, '', 0, 0, ''),
(418, 0, 0, '', 0, 0, '', 0, 0, ''),
(420, 0, 0, '', 0, 0, '', 0, 0, ''),
(419, 0, 0, '', 0, 0, '', 0, 0, ''),
(421, 0, 0, '', 0, 0, '', 0, 0, ''),
(422, 0, 0, '', 0, 0, '', 0, 0, ''),
(417, 0, 0, '', 0, 0, '', 0, 0, ''),
(423, 0, 0, '', 0, 0, '', 0, 0, ''),
(424, 0, 0, '', 0, 0, '', 0, 0, ''),
(425, 0, 0, '', 0, 0, '', 0, 0, ''),
(426, 0, 0, '', 0, 0, '', 0, 0, ''),
(427, 0, 0, '', 0, 0, '', 0, 0, ''),
(428, 0, 0, '', 0, 0, '', 0, 0, ''),
(429, 0, 0, '', 0, 0, '', 0, 0, ''),
(430, 0, 0, '', 0, 0, '', 0, 0, ''),
(432, 0, 0, '', 0, 0, '', 0, 0, ''),
(433, 0, 0, '', 0, 0, '', 0, 0, ''),
(434, 0, 0, '', 0, 0, '', 0, 0, ''),
(435, 0, 0, '', 0, 0, '', 0, 0, ''),
(436, 0, 0, '', 0, 0, '', 0, 0, ''),
(437, 0, 0, '', 0, 0, '', 0, 0, ''),
(438, 0, 0, '', 0, 0, '', 0, 0, ''),
(264, 0, 0, '', 0, 0, '', 0, 0, ''),
(439, 0, 0, '', 0, 0, '', 0, 0, ''),
(440, 0, 0, '', 0, 0, '', 0, 0, ''),
(441, 0, 0, '', 0, 0, '', 0, 0, ''),
(443, 0, 0, '', 0, 0, '', 0, 0, ''),
(444, 0, 0, '', 0, 0, '', 0, 0, ''),
(445, 0, 0, '', 0, 0, '', 0, 0, ''),
(446, 0, 0, '', 0, 0, '', 0, 0, ''),
(447, 0, 0, '', 0, 0, '', 0, 0, ''),
(448, 0, 0, '', 0, 0, '', 0, 0, ''),
(449, 0, 0, '', 0, 0, '', 0, 0, ''),
(450, 0, 0, '', 0, 0, '', 0, 0, ''),
(442, 0, 0, '', 0, 0, '', 0, 0, ''),
(451, 0, 0, '', 0, 0, '', 0, 0, ''),
(452, 0, 0, '', 0, 0, '', 0, 0, ''),
(453, 0, 0, '', 0, 0, '', 0, 0, ''),
(454, 0, 0, '', 0, 0, '', 0, 0, ''),
(456, 0, 0, '', 0, 0, '', 0, 0, ''),
(457, 0, 0, '', 0, 0, '', 0, 0, ''),
(458, 0, 0, '', 0, 0, '', 0, 0, ''),
(460, 0, 0, '', 0, 0, '', 0, 0, ''),
(461, 0, 0, '', 0, 0, '', 0, 0, ''),
(462, 0, 0, '', 0, 0, '', 0, 0, ''),
(463, 0, 0, '', 0, 0, '', 0, 0, ''),
(464, 0, 0, '', 0, 0, '', 0, 0, ''),
(465, 0, 0, '', 0, 0, '', 0, 0, ''),
(466, 0, 0, '', 0, 0, '', 0, 0, ''),
(467, 0, 0, '', 0, 0, '', 0, 0, ''),
(468, 0, 0, '', 0, 0, '', 0, 0, ''),
(469, 0, 0, '', 0, 0, '', 0, 0, ''),
(470, 0, 0, '', 0, 0, '', 0, 0, ''),
(471, 0, 0, '', 0, 0, '', 0, 0, ''),
(473, 0, 0, '', 0, 0, '', 0, 0, ''),
(472, 0, 0, '', 0, 0, '', 0, 0, ''),
(474, 0, 0, '', 0, 0, '', 0, 0, ''),
(475, 0, 0, '', 0, 0, '', 0, 0, ''),
(476, 0, 0, '', 0, 0, '', 0, 0, ''),
(477, 0, 0, '', 0, 0, '', 0, 0, ''),
(479, 0, 0, '', 0, 0, '', 0, 0, ''),
(480, 0, 0, '', 0, 0, '', 0, 0, ''),
(481, 0, 0, '', 0, 0, '', 0, 0, ''),
(482, 0, 0, '', 0, 0, '', 0, 0, ''),
(484, 0, 0, '', 0, 0, '', 0, 0, ''),
(485, 0, 0, '', 0, 0, '', 0, 0, ''),
(487, 0, 0, '', 0, 0, '', 0, 0, ''),
(488, 0, 0, '', 0, 0, '', 0, 0, ''),
(489, 0, 0, '', 0, 0, '', 0, 0, ''),
(491, 0, 0, '', 0, 0, '', 0, 0, ''),
(492, 0, 0, '', 0, 0, '', 0, 0, ''),
(493, 0, 0, '', 0, 0, '', 0, 0, ''),
(494, 0, 0, '', 0, 0, '', 0, 0, ''),
(496, 0, 0, '', 0, 0, '', 0, 0, ''),
(495, 0, 0, '', 0, 0, '', 0, 0, ''),
(497, 0, 0, '', 0, 0, '', 0, 0, ''),
(498, 0, 0, '', 0, 0, '', 0, 0, ''),
(499, 0, 0, '', 0, 0, '', 0, 0, ''),
(500, 0, 0, '', 0, 0, '', 0, 0, ''),
(503, 0, 0, '', 0, 0, '', 0, 0, ''),
(502, 0, 0, '', 0, 0, '', 0, 0, ''),
(504, 0, 0, '', 0, 0, '', 0, 0, ''),
(505, 0, 0, '', 0, 0, '', 0, 0, ''),
(506, 0, 0, '', 0, 0, '', 0, 0, ''),
(507, 0, 0, '', 0, 0, '', 0, 0, ''),
(509, 0, 0, '', 0, 0, '', 0, 0, ''),
(510, 0, 0, '', 0, 0, '', 0, 0, ''),
(511, 0, 0, '', 0, 0, '', 0, 0, ''),
(512, 0, 0, '', 0, 0, '', 0, 0, ''),
(513, 0, 0, '', 0, 0, '', 0, 0, ''),
(514, 0, 0, '', 0, 0, '', 0, 0, ''),
(515, 0, 0, '', 0, 0, '', 0, 0, ''),
(516, 0, 0, '', 0, 0, '', 0, 0, ''),
(517, 0, 0, '', 0, 0, '', 0, 0, ''),
(518, 0, 0, '', 0, 0, '', 0, 0, ''),
(519, 0, 0, '', 0, 0, '', 0, 0, ''),
(520, 0, 0, '', 0, 0, '', 0, 0, ''),
(521, 0, 0, '', 0, 0, '', 0, 0, ''),
(522, 0, 0, '', 0, 0, '', 0, 0, ''),
(523, 0, 0, '', 0, 0, '', 0, 0, ''),
(524, 0, 0, '', 0, 0, '', 0, 0, ''),
(526, 0, 0, '', 0, 0, '', 0, 0, ''),
(527, 0, 0, '', 0, 0, '', 0, 0, ''),
(528, 0, 0, '', 0, 0, '', 0, 0, ''),
(530, 0, 0, '', 0, 0, '', 0, 0, ''),
(529, 0, 0, '', 0, 0, '', 0, 0, ''),
(531, 0, 0, '', 0, 0, '', 0, 0, ''),
(533, 0, 0, '', 0, 0, '', 0, 0, ''),
(532, 0, 0, '', 0, 0, '', 0, 0, ''),
(535, 0, 0, '', 0, 0, '', 0, 0, ''),
(534, 0, 0, '', 0, 0, '', 0, 0, ''),
(536, 0, 0, '', 0, 0, '', 0, 0, ''),
(537, 0, 0, '', 0, 0, '', 0, 0, ''),
(539, 0, 0, '', 0, 0, '', 0, 0, ''),
(538, 0, 0, '', 0, 0, '', 0, 0, ''),
(540, 0, 0, '', 0, 0, '', 0, 0, ''),
(541, 0, 0, '', 0, 0, '', 0, 0, ''),
(542, 0, 0, '', 0, 0, '', 0, 0, ''),
(543, 0, 0, '', 0, 0, '', 0, 0, ''),
(544, 0, 0, '', 0, 0, '', 0, 0, ''),
(545, 0, 0, '', 0, 0, '', 0, 0, ''),
(486, 0, 0, '', 0, 0, '', 0, 0, ''),
(546, 0, 0, '', 0, 0, '', 0, 0, ''),
(547, 0, 0, '', 0, 0, '', 0, 0, ''),
(548, 0, 0, '', 0, 0, '', 0, 0, ''),
(549, 0, 0, '', 0, 0, '', 0, 0, ''),
(550, 0, 0, '', 0, 0, '', 0, 0, ''),
(551, 0, 0, '', 0, 0, '', 0, 0, ''),
(552, 0, 0, '', 0, 0, '', 0, 0, ''),
(553, 0, 0, '', 0, 0, '', 0, 0, ''),
(555, 0, 0, '', 0, 0, '', 0, 0, ''),
(556, 0, 0, '', 0, 0, '', 0, 0, ''),
(557, 0, 0, '', 0, 0, '', 0, 0, ''),
(559, 0, 0, '', 0, 0, '', 0, 0, ''),
(558, 0, 0, '', 0, 0, '', 0, 0, ''),
(560, 0, 0, '', 0, 0, '', 0, 0, ''),
(561, 0, 0, '', 0, 0, '', 0, 0, ''),
(564, 0, 0, '', 0, 0, '', 0, 0, ''),
(563, 0, 0, '', 0, 0, '', 0, 0, ''),
(565, 0, 0, '', 0, 0, '', 0, 0, ''),
(562, 0, 0, '', 0, 0, '', 0, 0, ''),
(566, 0, 0, '', 0, 0, '', 0, 0, ''),
(567, 0, 0, '', 0, 0, '', 0, 0, ''),
(568, 0, 0, '', 0, 0, '', 0, 0, ''),
(569, 0, 0, '', 0, 0, '', 0, 0, ''),
(570, 0, 0, '', 0, 0, '', 0, 0, ''),
(571, 0, 0, '', 0, 0, '', 0, 0, ''),
(573, 0, 0, '', 0, 0, '', 0, 0, ''),
(576, 0, 0, '', 0, 0, '', 0, 0, ''),
(577, 0, 0, '', 0, 0, '', 0, 0, ''),
(579, 0, 0, '', 0, 0, '', 0, 0, ''),
(578, 0, 0, '', 0, 0, '', 0, 0, ''),
(580, 0, 0, '', 0, 0, '', 0, 0, ''),
(581, 0, 0, '', 0, 0, '', 0, 0, ''),
(582, 0, 0, '', 0, 0, '', 0, 0, ''),
(583, 0, 0, '', 0, 0, '', 0, 0, ''),
(584, 0, 0, '', 0, 0, '', 0, 0, ''),
(585, 0, 0, '', 0, 0, '', 0, 0, ''),
(586, 0, 0, '', 0, 0, '', 0, 0, ''),
(587, 0, 0, '', 0, 0, '', 0, 0, ''),
(588, 0, 0, '', 0, 0, '', 0, 0, ''),
(589, 0, 0, '', 0, 0, '', 0, 0, ''),
(590, 0, 0, '', 0, 0, '', 0, 0, ''),
(591, 0, 0, '', 0, 0, '', 0, 0, ''),
(592, 0, 0, '', 0, 0, '', 0, 0, ''),
(595, 0, 0, '', 0, 0, '', 0, 0, ''),
(594, 0, 0, '', 0, 0, '', 0, 0, ''),
(596, 0, 0, '', 0, 0, '', 0, 0, ''),
(597, 0, 0, '', 0, 0, '', 0, 0, ''),
(598, 0, 0, '', 0, 0, '', 0, 0, ''),
(599, 0, 0, '', 0, 0, '', 0, 0, ''),
(600, 0, 0, '', 0, 0, '', 0, 0, ''),
(601, 0, 0, '', 0, 0, '', 0, 0, ''),
(603, 0, 0, '', 0, 0, '', 0, 0, ''),
(604, 0, 0, '', 0, 0, '', 0, 0, ''),
(605, 0, 0, '', 0, 0, '', 0, 0, ''),
(606, 0, 0, '', 0, 0, '', 0, 0, ''),
(607, 0, 0, '', 0, 0, '', 0, 0, ''),
(608, 0, 0, '', 0, 0, '', 0, 0, ''),
(609, 0, 0, '', 0, 0, '', 0, 0, ''),
(610, 0, 0, '', 0, 0, '', 0, 0, ''),
(611, 0, 0, '', 0, 0, '', 0, 0, ''),
(612, 0, 0, '', 0, 0, '', 0, 0, ''),
(613, 0, 0, '', 0, 0, '', 0, 0, ''),
(615, 0, 0, '', 0, 0, '', 0, 0, ''),
(614, 0, 0, '', 0, 0, '', 0, 0, ''),
(616, 0, 0, '', 0, 0, '', 0, 0, ''),
(617, 0, 0, '', 0, 0, '', 0, 0, ''),
(618, 0, 0, '', 0, 0, '', 0, 0, ''),
(619, 0, 0, '', 0, 0, '', 0, 0, ''),
(620, 0, 0, '', 0, 0, '', 0, 0, ''),
(621, 0, 0, '', 0, 0, '', 0, 0, ''),
(623, 0, 0, '', 0, 0, '', 0, 0, ''),
(624, 0, 0, '', 0, 0, '', 0, 0, ''),
(625, 0, 0, '', 0, 0, '', 0, 0, ''),
(626, 0, 0, '', 0, 0, '', 0, 0, ''),
(627, 0, 0, '', 0, 0, '', 0, 0, ''),
(628, 0, 0, '', 0, 0, '', 0, 0, ''),
(629, 0, 0, '', 0, 0, '', 0, 0, ''),
(631, 0, 0, '', 0, 0, '', 0, 0, ''),
(632, 0, 0, '', 0, 0, '', 0, 0, ''),
(633, 0, 0, '', 0, 0, '', 0, 0, ''),
(634, 0, 0, '', 0, 0, '', 0, 0, ''),
(635, 0, 0, '', 0, 0, '', 0, 0, ''),
(636, 0, 0, '', 0, 0, '', 0, 0, ''),
(622, 0, 0, '', 0, 0, '', 0, 0, ''),
(638, 0, 0, '', 0, 0, '', 0, 0, ''),
(639, 0, 0, '', 0, 0, '', 0, 0, ''),
(640, 0, 0, '', 0, 0, '', 0, 0, ''),
(642, 0, 0, '', 0, 0, '', 0, 0, ''),
(643, 0, 0, '', 0, 0, '', 0, 0, ''),
(644, 0, 0, '', 0, 0, '', 0, 0, ''),
(645, 0, 0, '', 0, 0, '', 0, 0, ''),
(646, 0, 0, '', 0, 0, '', 0, 0, ''),
(647, 0, 0, '', 0, 0, '', 0, 0, ''),
(648, 0, 0, '', 0, 0, '', 0, 0, ''),
(650, 0, 0, '', 0, 0, '', 0, 0, ''),
(651, 0, 0, '', 0, 0, '', 0, 0, ''),
(652, 0, 0, '', 0, 0, '', 0, 0, ''),
(655, 0, 0, '', 0, 0, '', 0, 0, ''),
(656, 0, 0, '', 0, 0, '', 0, 0, ''),
(657, 0, 0, '', 0, 0, '', 0, 0, ''),
(658, 0, 0, '', 0, 0, '', 0, 0, ''),
(659, 0, 0, '', 0, 0, '', 0, 0, ''),
(661, 0, 0, '', 0, 0, '', 0, 0, ''),
(660, 0, 0, '', 0, 0, '', 0, 0, ''),
(662, 0, 0, '', 0, 0, '', 0, 0, ''),
(663, 0, 0, '', 0, 0, '', 0, 0, ''),
(664, 0, 0, '', 0, 0, '', 0, 0, ''),
(666, 0, 0, '', 0, 0, '', 0, 0, ''),
(665, 0, 0, '', 0, 0, '', 0, 0, ''),
(667, 0, 0, '', 0, 0, '', 0, 0, ''),
(668, 0, 0, '', 0, 0, '', 0, 0, ''),
(669, 0, 0, '', 0, 0, '', 0, 0, ''),
(670, 0, 0, '', 0, 0, '', 0, 0, ''),
(328, 0, 0, '', 0, 0, '', 0, 0, ''),
(672, 0, 0, '', 0, 0, '', 0, 0, ''),
(671, 0, 0, '', 0, 0, '', 0, 0, ''),
(673, 0, 0, '', 0, 0, '', 0, 0, ''),
(674, 0, 0, '', 0, 0, '', 0, 0, ''),
(675, 0, 0, '', 0, 0, '', 0, 0, ''),
(677, 0, 0, '', 0, 0, '', 0, 0, ''),
(678, 0, 0, '', 0, 0, '', 0, 0, ''),
(679, 0, 0, '', 0, 0, '', 0, 0, ''),
(680, 0, 0, '', 0, 0, '', 0, 0, ''),
(681, 0, 0, '', 0, 0, '', 0, 0, ''),
(682, 0, 0, '', 0, 0, '', 0, 0, ''),
(683, 0, 0, '', 0, 0, '', 0, 0, ''),
(684, 0, 0, '', 0, 0, '', 0, 0, ''),
(653, 0, 0, '', 0, 0, '', 0, 0, ''),
(654, 0, 0, '', 0, 0, '', 0, 0, ''),
(686, 0, 0, '', 0, 0, '', 0, 0, ''),
(687, 0, 0, '', 0, 0, '', 0, 0, ''),
(688, 0, 0, '', 0, 0, '', 0, 0, ''),
(690, 0, 0, '', 0, 0, '', 0, 0, ''),
(691, 0, 0, '', 0, 0, '', 0, 0, ''),
(692, 0, 0, '', 0, 0, '', 0, 0, ''),
(693, 0, 0, '', 0, 0, '', 0, 0, ''),
(694, 0, 0, '', 0, 0, '', 0, 0, ''),
(695, 0, 0, '', 0, 0, '', 0, 0, ''),
(696, 0, 0, '', 0, 0, '', 0, 0, ''),
(698, 0, 0, '', 0, 0, '', 0, 0, ''),
(501, 0, 0, '', 0, 0, '', 0, 0, ''),
(699, 0, 0, '', 0, 0, '', 0, 0, ''),
(701, 0, 0, '', 0, 0, '', 0, 0, ''),
(700, 0, 0, '', 0, 0, '', 0, 0, ''),
(702, 0, 0, '', 0, 0, '', 0, 0, ''),
(703, 0, 0, '', 0, 0, '', 0, 0, ''),
(704, 0, 0, '', 0, 0, '', 0, 0, ''),
(705, 0, 0, '', 0, 0, '', 0, 0, ''),
(707, 0, 0, '', 0, 0, '', 0, 0, ''),
(708, 0, 0, '', 0, 0, '', 0, 0, ''),
(709, 0, 0, '', 0, 0, '', 0, 0, ''),
(710, 0, 0, '', 0, 0, '', 0, 0, ''),
(711, 0, 0, '', 0, 0, '', 0, 0, ''),
(712, 0, 0, '', 0, 0, '', 0, 0, ''),
(713, 0, 0, '', 0, 0, '', 0, 0, ''),
(714, 0, 0, '', 0, 0, '', 0, 0, ''),
(716, 0, 0, '', 0, 0, '', 0, 0, ''),
(717, 0, 0, '', 0, 0, '', 0, 0, ''),
(720, 0, 0, '', 0, 0, '', 0, 0, ''),
(721, 0, 0, '', 0, 0, '', 0, 0, ''),
(727, 0, 0, '', 0, 0, '', 0, 0, ''),
(726, 0, 0, '', 0, 0, '', 0, 0, ''),
(729, 0, 0, '', 0, 0, '', 0, 0, ''),
(730, 0, 0, '', 0, 0, '', 0, 0, ''),
(728, 0, 0, '', 0, 0, '', 0, 0, ''),
(731, 0, 0, '', 0, 0, '', 0, 0, ''),
(732, 0, 0, '', 0, 0, '', 0, 0, ''),
(734, 0, 0, '', 0, 0, '', 0, 0, ''),
(735, 0, 0, '', 0, 0, '', 0, 0, ''),
(733, 0, 0, '', 0, 0, '', 0, 0, ''),
(736, 0, 0, '', 0, 0, '', 0, 0, ''),
(738, 0, 0, '', 0, 0, '', 0, 0, ''),
(739, 0, 0, '', 0, 0, '', 0, 0, ''),
(740, 0, 0, '', 0, 0, '', 0, 0, ''),
(742, 0, 0, '', 0, 0, '', 0, 0, ''),
(741, 0, 0, '', 0, 0, '', 0, 0, ''),
(744, 0, 0, '', 0, 0, '', 0, 0, ''),
(745, 0, 0, '', 0, 0, '', 0, 0, ''),
(752, 0, 0, '', 0, 0, '', 0, 0, ''),
(754, 0, 0, '', 0, 0, '', 0, 0, ''),
(753, 0, 0, '', 0, 0, '', 0, 0, ''),
(755, 0, 0, '', 0, 0, '', 0, 0, ''),
(756, 0, 0, '', 0, 0, '', 0, 0, ''),
(757, 0, 0, '', 0, 0, '', 0, 0, ''),
(743, 0, 0, '', 0, 0, '', 0, 0, ''),
(761, 0, 0, '', 0, 0, '', 0, 0, ''),
(762, 0, 0, '', 0, 0, '', 0, 0, ''),
(763, 0, 0, '', 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int NOT NULL,
  `sid` int NOT NULL,
  `pid` int NOT NULL DEFAULT '0',
  `itemtype` int NOT NULL DEFAULT '0',
  `count` int NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `player_stash`
--

CREATE TABLE `player_stash` (
  `player_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_stash`
--

INSERT INTO `player_stash` (`player_id`, `item_id`, `item_count`) VALUES
(10, 281, 1),
(10, 3037, 1),
(10, 3038, 1),
(10, 3039, 2),
(10, 3041, 2),
(10, 5944, 81),
(10, 7439, 2),
(10, 7443, 6),
(10, 7643, 27),
(10, 9633, 8),
(10, 11447, 22),
(10, 20200, 2),
(10, 23373, 16),
(10, 23374, 4),
(10, 23375, 4),
(10, 25759, 21),
(11, 236, 37),
(11, 237, 378),
(11, 238, 16),
(11, 239, 9),
(11, 284, 426),
(11, 3026, 1),
(11, 3028, 2),
(11, 3032, 3),
(11, 3034, 1),
(11, 3037, 1),
(11, 3038, 4),
(11, 3039, 1),
(11, 3041, 2),
(11, 3061, 2),
(11, 3149, 18),
(11, 3155, 12),
(11, 3161, 36),
(11, 3732, 23),
(11, 5021, 2),
(11, 5479, 1),
(11, 5886, 1),
(11, 5893, 2),
(11, 5898, 3),
(11, 6499, 35),
(11, 6558, 3),
(11, 7368, 25),
(11, 7439, 1),
(11, 7642, 28),
(11, 7643, 2),
(11, 9660, 7),
(11, 9667, 4),
(11, 9694, 17),
(11, 10282, 3),
(11, 10304, 5),
(11, 10311, 25),
(11, 10313, 1),
(11, 10316, 3),
(11, 10450, 22),
(11, 11444, 25),
(11, 11447, 2),
(11, 11488, 2),
(11, 11490, 1),
(11, 11491, 3),
(11, 11493, 4),
(11, 11512, 2),
(11, 20198, 1),
(11, 20199, 1),
(11, 21143, 9),
(11, 21197, 2),
(11, 21814, 6),
(11, 22728, 5),
(17, 283, 94),
(17, 284, 222),
(12, 238, 85),
(12, 284, 115),
(12, 285, 24),
(12, 3155, 73),
(12, 3161, 156),
(8, 238, 198),
(8, 3017, 5),
(8, 3027, 3),
(8, 3028, 1),
(8, 3033, 2),
(8, 3191, 48),
(8, 3202, 224),
(8, 5879, 19),
(8, 5880, 1),
(8, 5886, 4),
(8, 5895, 2),
(8, 5911, 20),
(8, 5914, 2),
(8, 6499, 2),
(8, 7642, 97),
(8, 9633, 10),
(8, 9641, 1),
(8, 9649, 11),
(8, 9663, 2),
(8, 9665, 23),
(8, 9685, 27),
(8, 10298, 4),
(8, 10311, 75),
(8, 11444, 38),
(8, 11449, 5),
(8, 11466, 16),
(8, 11481, 2),
(8, 22516, 2),
(8, 22721, 2),
(8, 22728, 5),
(15, 238, 53),
(15, 284, 127),
(15, 3027, 7),
(15, 5879, 3),
(15, 9685, 27),
(15, 10311, 25),
(15, 11444, 25),
(15, 20062, 1),
(15, 22728, 5),
(24, 3010, 1),
(24, 3027, 1),
(24, 3029, 1),
(24, 3032, 3),
(24, 3033, 2),
(24, 3034, 8),
(24, 5879, 1),
(24, 5886, 1),
(24, 5895, 2),
(24, 5914, 1),
(24, 9649, 2),
(24, 9665, 8),
(24, 9685, 13),
(24, 11444, 118),
(24, 11449, 7),
(24, 11466, 1),
(24, 20062, 1),
(24, 22516, 1),
(9, 236, 14),
(9, 238, 11),
(9, 239, 162),
(9, 281, 11),
(9, 283, 2),
(9, 901, 1),
(9, 3010, 2),
(9, 3027, 5),
(9, 3028, 26),
(9, 3029, 45),
(9, 3030, 32),
(9, 3032, 20),
(9, 3033, 34),
(9, 3034, 27),
(9, 3036, 7),
(9, 3037, 15),
(9, 3038, 21),
(9, 3039, 21),
(9, 3041, 17),
(9, 3061, 13),
(9, 3155, 33),
(9, 3724, 3),
(9, 5021, 27),
(9, 5878, 1),
(9, 5879, 33),
(9, 5880, 2),
(9, 5882, 31),
(9, 5886, 27),
(9, 5892, 13),
(9, 5895, 4),
(9, 5904, 6),
(9, 5909, 7),
(9, 5911, 35),
(9, 5913, 6),
(9, 5914, 7),
(9, 5944, 4),
(9, 5948, 10),
(9, 5954, 7),
(9, 6499, 22),
(9, 7439, 16),
(9, 7440, 15),
(9, 7443, 20),
(9, 7642, 1),
(9, 7643, 117),
(9, 9027, 1),
(9, 9057, 41),
(9, 9058, 4),
(9, 9636, 13),
(9, 9660, 16),
(9, 9663, 18),
(9, 9664, 17),
(9, 9685, 18),
(9, 10293, 73),
(9, 10298, 23),
(9, 10304, 6),
(9, 10310, 1),
(9, 10316, 13),
(9, 11444, 1),
(9, 11449, 11),
(9, 11452, 7),
(9, 11454, 3),
(9, 11481, 4),
(9, 11492, 28),
(9, 11493, 6),
(9, 16119, 10),
(9, 16120, 16),
(9, 16121, 17),
(9, 16122, 7),
(9, 16123, 18),
(9, 16124, 13),
(9, 16125, 3),
(9, 20062, 18),
(9, 20198, 1),
(9, 20200, 11),
(9, 20201, 8),
(9, 21814, 3),
(9, 22516, 205),
(9, 22728, 14),
(9, 22729, 1),
(9, 22730, 2),
(9, 23373, 31),
(9, 23374, 6),
(9, 23519, 1),
(9, 28566, 27),
(9, 28567, 22),
(9, 28824, 1),
(9, 29943, 1),
(9, 30059, 15),
(9, 30060, 1),
(9, 30061, 47),
(9, 30088, 8),
(9, 31588, 1),
(9, 31590, 1),
(9, 31623, 1),
(9, 31624, 1),
(9, 31678, 2),
(9, 32593, 2),
(9, 32594, 1),
(9, 32625, 3),
(9, 32626, 6),
(9, 32703, 4),
(9, 32769, 27),
(9, 32770, 4),
(9, 32771, 20),
(9, 32772, 8),
(9, 32774, 1),
(14, 9685, 1),
(14, 10311, 31),
(14, 11452, 2),
(14, 11492, 1),
(14, 12517, 2),
(104, 238, 53),
(104, 3147, 1),
(104, 3723, 8),
(104, 5922, 2),
(104, 9635, 29),
(104, 10196, 2),
(104, 10311, 44),
(104, 11444, 46),
(104, 11452, 34),
(104, 11492, 11),
(104, 22728, 5),
(104, 23373, 38),
(92, 236, 1),
(92, 237, 2),
(133, 266, 10),
(133, 268, 25),
(88, 237, 21),
(88, 238, 42),
(88, 281, 10),
(88, 282, 10),
(88, 283, 18),
(88, 284, 234),
(88, 3028, 5),
(88, 3029, 2),
(88, 3030, 18),
(88, 3032, 19),
(88, 3033, 10),
(88, 3034, 3),
(88, 3036, 9),
(88, 3038, 27),
(88, 3039, 2),
(88, 3041, 9),
(88, 3060, 1),
(88, 3731, 28),
(88, 5021, 1),
(88, 5944, 7),
(88, 5954, 13),
(88, 6499, 31),
(88, 7440, 13),
(88, 9057, 29),
(88, 9058, 4),
(88, 9633, 3),
(88, 9640, 4),
(88, 9663, 5),
(88, 9685, 43),
(88, 10304, 6),
(88, 10311, 25),
(88, 10316, 1),
(88, 11444, 25),
(88, 16119, 1),
(88, 16123, 4),
(88, 16126, 1),
(88, 16127, 21),
(88, 20062, 6),
(88, 20198, 4),
(88, 20199, 4),
(88, 21143, 3),
(88, 21203, 3),
(88, 21814, 6),
(88, 22516, 54),
(88, 22728, 13),
(88, 30059, 1),
(88, 30061, 1),
(88, 33929, 11),
(88, 33934, 9),
(88, 33935, 2),
(88, 33945, 14),
(88, 34014, 11),
(132, 9635, 24),
(132, 11452, 3),
(140, 284, 13),
(140, 3155, 225),
(140, 3175, 125),
(140, 3191, 534),
(140, 3202, 206),
(140, 9694, 5),
(140, 11492, 30),
(140, 22516, 3),
(140, 27623, 1),
(159, 3034, 100),
(159, 9633, 9),
(159, 9663, 3),
(159, 10311, 22),
(159, 11444, 5),
(159, 11492, 29),
(159, 20062, 7),
(159, 20200, 25),
(159, 22516, 1),
(159, 22728, 15),
(159, 22730, 5),
(154, 9635, 12),
(154, 11443, 27),
(154, 11444, 16),
(154, 11464, 8),
(154, 11465, 6),
(87, 28823, 2),
(93, 237, 48),
(93, 238, 100),
(93, 239, 6),
(93, 268, 1),
(93, 281, 1),
(93, 283, 10),
(93, 284, 96),
(93, 647, 1),
(93, 677, 3),
(93, 678, 27),
(93, 3010, 22),
(93, 3017, 30),
(93, 3026, 6),
(93, 3027, 4),
(93, 3028, 5),
(93, 3029, 8),
(93, 3030, 35),
(93, 3032, 38),
(93, 3033, 31),
(93, 3037, 5),
(93, 3038, 1),
(93, 3039, 4),
(93, 3041, 3),
(93, 3147, 1),
(93, 3202, 167),
(93, 3583, 1),
(93, 3725, 1),
(93, 3731, 39),
(93, 3732, 2),
(93, 3739, 3),
(93, 5804, 1),
(93, 5879, 4),
(93, 5886, 3),
(93, 5892, 3),
(93, 5898, 3),
(93, 5911, 7),
(93, 5912, 1),
(93, 5920, 1),
(93, 6499, 21),
(93, 7439, 1),
(93, 9057, 62),
(93, 9635, 5),
(93, 9649, 17),
(93, 9663, 1),
(93, 9666, 6),
(93, 9685, 10),
(93, 9694, 4),
(93, 10196, 2),
(93, 10276, 4),
(93, 10282, 5),
(93, 10291, 4),
(93, 10304, 4),
(93, 11444, 15),
(93, 11449, 5),
(93, 11452, 4),
(93, 11466, 14),
(93, 11467, 1),
(93, 11470, 2),
(93, 11479, 4),
(93, 11480, 1),
(93, 11487, 1),
(93, 11488, 1),
(93, 11490, 1),
(93, 11491, 4),
(93, 11512, 11),
(93, 12730, 4),
(93, 14008, 1),
(93, 14009, 1),
(93, 14010, 1),
(93, 14011, 1),
(93, 14013, 3),
(93, 14041, 3),
(93, 14085, 4),
(93, 16119, 2),
(93, 16120, 3),
(93, 16121, 6),
(93, 21182, 4),
(93, 22194, 5),
(93, 24391, 21),
(93, 25691, 249),
(93, 25695, 119),
(93, 25696, 36),
(93, 27599, 16),
(93, 27600, 16),
(93, 27601, 15),
(93, 28823, 1),
(93, 30088, 1),
(50, 237, 100),
(50, 9633, 1),
(176, 236, 74),
(176, 237, 51),
(176, 238, 104),
(176, 268, 10),
(176, 3017, 1),
(176, 3026, 1),
(176, 3027, 1),
(176, 3029, 12),
(176, 3030, 1),
(176, 3032, 5),
(176, 3033, 21),
(176, 3037, 1),
(176, 3038, 1),
(176, 3041, 1),
(176, 3161, 3),
(176, 3166, 7),
(176, 3446, 23),
(176, 3447, 127),
(176, 3449, 13),
(176, 3492, 5),
(176, 5804, 1),
(176, 5877, 1),
(176, 5879, 4),
(176, 5886, 2),
(176, 5887, 5),
(176, 5902, 1),
(176, 5904, 2),
(176, 5922, 1),
(176, 7363, 28),
(176, 7364, 74),
(176, 7365, 86),
(176, 9057, 4),
(176, 9633, 24),
(176, 9635, 18),
(176, 9649, 1),
(176, 9663, 8),
(176, 9665, 3),
(176, 9685, 57),
(176, 10276, 1),
(176, 10293, 9),
(176, 10311, 44),
(176, 11443, 23),
(176, 11444, 40),
(176, 11449, 8),
(176, 11452, 14),
(176, 11457, 3),
(176, 11464, 15),
(176, 11466, 1),
(176, 11492, 6),
(176, 11512, 1),
(176, 21194, 1),
(176, 22516, 3),
(176, 22721, 1),
(176, 22728, 5),
(176, 25737, 75),
(176, 32773, 1),
(143, 238, 5),
(143, 239, 5),
(143, 266, 20),
(143, 281, 1),
(143, 282, 2),
(143, 283, 106),
(143, 647, 2),
(143, 678, 1),
(143, 3010, 1),
(143, 3017, 2),
(143, 3027, 4),
(143, 3029, 9),
(143, 3032, 9),
(143, 3448, 35),
(143, 3492, 3),
(143, 3578, 32),
(143, 3581, 19),
(143, 3595, 4),
(143, 3661, 2),
(143, 3725, 1),
(143, 5804, 1),
(143, 5877, 4),
(143, 5895, 3),
(143, 5898, 1),
(143, 5912, 3),
(143, 5920, 2),
(143, 9057, 1),
(143, 9633, 1),
(143, 9649, 4),
(143, 9685, 12),
(143, 10276, 1),
(143, 10291, 3),
(143, 10311, 25),
(143, 11444, 25),
(143, 11449, 6),
(143, 11453, 2),
(143, 11457, 9),
(143, 11466, 7),
(143, 11470, 6),
(143, 11479, 3),
(143, 11487, 2),
(143, 11488, 7),
(143, 11489, 8),
(143, 11490, 2),
(143, 11491, 9),
(143, 11512, 4),
(143, 12730, 4),
(143, 14012, 4),
(143, 14013, 4),
(143, 14041, 4),
(143, 14085, 4),
(143, 21182, 4),
(143, 22728, 5),
(143, 23986, 2),
(143, 24391, 1),
(143, 25691, 7),
(143, 25695, 2),
(143, 25696, 2),
(268, 237, 8),
(268, 266, 7),
(268, 268, 1),
(268, 283, 13),
(268, 285, 13),
(268, 3028, 12),
(268, 3030, 4),
(268, 3032, 2),
(268, 3033, 16),
(268, 3039, 1),
(268, 3042, 7),
(268, 3577, 4),
(268, 3578, 4),
(268, 3585, 60),
(268, 3592, 49),
(268, 3597, 20),
(268, 3723, 478),
(268, 3725, 8),
(268, 3738, 4),
(268, 3741, 1),
(268, 5804, 1),
(268, 5878, 1),
(268, 5880, 11),
(268, 5896, 1),
(268, 5902, 1),
(268, 5921, 10),
(268, 5922, 5),
(268, 9635, 35),
(268, 9641, 20),
(268, 9686, 2),
(268, 10196, 16),
(268, 11443, 232),
(268, 11444, 120),
(268, 11452, 48),
(268, 11453, 6),
(268, 11457, 11),
(268, 11458, 1),
(268, 11463, 1),
(268, 11464, 44),
(268, 11465, 10),
(268, 11472, 2),
(268, 11477, 4),
(268, 11478, 25),
(268, 11479, 27),
(268, 11480, 2),
(268, 11481, 86),
(268, 11482, 1),
(268, 12517, 1),
(268, 12600, 3),
(268, 16119, 3),
(268, 22516, 2),
(290, 237, 34),
(290, 9685, 76),
(290, 10311, 86),
(290, 11492, 2),
(290, 22118, 7),
(41, 238, 55),
(41, 284, 78),
(41, 3028, 1),
(41, 3033, 3),
(41, 3036, 1),
(41, 3161, 139),
(41, 11444, 12),
(280, 238, 15),
(324, 10293, 59),
(324, 10311, 26),
(361, 236, 2),
(361, 237, 58),
(361, 239, 1),
(361, 266, 1),
(361, 649, 1),
(361, 677, 1),
(361, 3026, 8),
(361, 3028, 25),
(361, 3030, 3),
(361, 3032, 18),
(361, 3034, 1),
(361, 5879, 7),
(361, 5895, 39),
(361, 5910, 2),
(361, 9633, 15),
(361, 9641, 12),
(361, 9666, 21),
(361, 9685, 124),
(361, 10311, 25),
(361, 11444, 56),
(361, 11457, 32),
(361, 11480, 4),
(361, 22728, 5),
(306, 236, 29),
(306, 237, 112),
(306, 268, 71),
(306, 283, 20),
(306, 284, 54),
(306, 285, 6),
(306, 5898, 13),
(306, 6499, 1),
(306, 9633, 1),
(306, 9649, 38),
(306, 9663, 17),
(306, 9685, 564),
(306, 9689, 1),
(306, 10293, 100),
(306, 10304, 2),
(306, 10311, 105),
(306, 11449, 163),
(306, 11466, 46),
(306, 11512, 1),
(306, 11515, 1),
(306, 18924, 7),
(306, 18927, 70),
(306, 22118, 16),
(306, 23373, 7),
(342, 5804, 1),
(342, 22118, 3),
(342, 22516, 3),
(390, 3583, 17),
(390, 3723, 345),
(390, 3725, 5),
(390, 5877, 16),
(390, 5879, 22),
(390, 5893, 11),
(390, 5895, 144),
(390, 5921, 4),
(390, 7439, 19),
(390, 7440, 10),
(390, 7443, 10),
(390, 7643, 20),
(390, 9633, 62),
(390, 9635, 17),
(390, 9641, 11),
(390, 9663, 8),
(390, 9685, 143),
(390, 10304, 140),
(390, 11444, 4),
(390, 11447, 58),
(390, 11452, 60),
(390, 11464, 14),
(390, 11467, 5),
(390, 11481, 13),
(390, 11492, 12),
(390, 21194, 7),
(390, 22516, 8),
(390, 23375, 46),
(390, 37110, 12),
(397, 236, 271),
(397, 237, 202),
(397, 238, 7),
(397, 239, 92),
(397, 266, 33),
(397, 268, 3),
(397, 283, 792),
(397, 284, 325),
(397, 285, 225),
(397, 3017, 6),
(397, 3027, 10),
(397, 3028, 10),
(397, 3029, 2),
(397, 3030, 9),
(397, 3032, 3),
(397, 3033, 10),
(397, 3039, 1),
(397, 3042, 2),
(397, 3061, 2),
(397, 3578, 8),
(397, 3725, 2),
(397, 3738, 1),
(397, 5804, 4),
(397, 5878, 1),
(397, 5892, 1),
(397, 5904, 1),
(397, 7439, 1),
(397, 7643, 9),
(397, 11447, 25),
(397, 11472, 1),
(397, 11482, 1),
(397, 12517, 7),
(397, 16119, 1),
(397, 16120, 3),
(397, 16121, 1),
(397, 20062, 3),
(64, 237, 3),
(64, 283, 1475),
(64, 284, 904),
(64, 3034, 43),
(64, 3578, 40),
(64, 3731, 172),
(64, 5954, 1),
(64, 9660, 5),
(64, 9663, 1),
(64, 10293, 62),
(64, 10311, 26),
(64, 11456, 9),
(64, 11492, 25),
(64, 20062, 3),
(64, 20198, 1),
(64, 20199, 1),
(64, 20200, 35),
(64, 20201, 30),
(64, 21194, 4),
(64, 22728, 193),
(64, 22730, 13),
(64, 25691, 1),
(64, 25737, 39),
(30, 236, 208),
(30, 283, 392),
(30, 284, 172),
(30, 3026, 1),
(30, 3027, 1),
(30, 3028, 55),
(30, 3029, 41),
(30, 3030, 51),
(30, 3032, 48),
(30, 3033, 37),
(30, 3034, 25),
(30, 3038, 6),
(30, 3061, 1),
(30, 5895, 1),
(30, 5954, 1),
(30, 6499, 11),
(30, 7643, 6),
(30, 9057, 46),
(30, 9633, 3),
(30, 9665, 7),
(30, 10304, 2),
(30, 11444, 5),
(30, 11488, 1),
(30, 11490, 1),
(30, 11491, 11),
(30, 35901, 460),
(420, 236, 94),
(420, 237, 110),
(420, 239, 532),
(420, 266, 13),
(420, 268, 400),
(420, 281, 2),
(420, 284, 86),
(420, 285, 176),
(420, 675, 3),
(420, 3026, 5),
(420, 3028, 23),
(420, 3029, 1),
(420, 3030, 3),
(420, 3032, 26),
(420, 3033, 17),
(420, 3034, 6),
(420, 3036, 1),
(420, 3037, 5),
(420, 3038, 5),
(420, 3039, 5),
(420, 3041, 4),
(420, 3042, 2),
(420, 3061, 4),
(420, 3110, 4),
(420, 3124, 12),
(420, 3156, 100),
(420, 3581, 5),
(420, 3723, 9),
(420, 3724, 42),
(420, 3725, 4),
(420, 3731, 10),
(420, 3732, 18),
(420, 5021, 1),
(420, 5479, 14),
(420, 5879, 4),
(420, 5892, 4),
(420, 5895, 54),
(420, 5904, 4),
(420, 5914, 1),
(420, 5944, 351),
(420, 5951, 67),
(420, 6499, 102),
(420, 6558, 82),
(420, 7439, 22),
(420, 7440, 22),
(420, 7443, 9),
(420, 7643, 59),
(420, 8010, 8),
(420, 8016, 100),
(420, 9057, 7),
(420, 9058, 1),
(420, 9633, 13),
(420, 9649, 2),
(420, 9663, 9),
(420, 9664, 4),
(420, 9666, 41),
(420, 9685, 241),
(420, 9694, 5),
(420, 10276, 2),
(420, 10293, 85),
(420, 10298, 5),
(420, 10304, 217),
(420, 10311, 24),
(420, 10316, 1),
(420, 11444, 5),
(420, 11447, 25),
(420, 11456, 30),
(420, 11466, 3),
(420, 11472, 1),
(420, 11481, 6),
(420, 11487, 7),
(420, 11488, 24),
(420, 11489, 3),
(420, 11490, 2),
(420, 11491, 16),
(420, 11492, 7),
(420, 11510, 1),
(420, 11512, 1),
(420, 12600, 1),
(420, 12730, 1),
(420, 14010, 1),
(420, 14012, 89),
(420, 14041, 1),
(420, 14085, 2),
(420, 14252, 24),
(420, 16119, 3),
(420, 16120, 9),
(420, 16121, 6),
(420, 20062, 7),
(420, 21158, 3),
(420, 21197, 1),
(420, 21201, 1),
(420, 21203, 8),
(420, 21816, 15),
(420, 22118, 18),
(420, 22516, 2),
(420, 23373, 265),
(420, 23374, 5),
(420, 23375, 51),
(420, 25691, 4),
(420, 27597, 4),
(420, 27653, 2),
(420, 32703, 1),
(420, 37110, 6),
(502, 3028, 1),
(502, 3029, 1),
(502, 3033, 3),
(502, 5895, 1),
(502, 5911, 1),
(502, 6499, 2),
(502, 9640, 3),
(502, 9665, 2),
(502, 10282, 1),
(502, 10306, 2),
(502, 11449, 1),
(502, 11450, 1),
(502, 11491, 1),
(502, 11510, 1),
(502, 22118, 9),
(502, 32703, 12),
(516, 5879, 14),
(516, 5893, 1),
(516, 9633, 2),
(516, 9641, 6),
(516, 9685, 38),
(516, 10304, 49),
(516, 11444, 5),
(516, 11481, 21),
(516, 11492, 1),
(516, 20200, 44),
(516, 22118, 45),
(516, 22730, 60),
(516, 23374, 641),
(473, 236, 252),
(473, 237, 1),
(473, 239, 58),
(473, 283, 52),
(473, 285, 132),
(473, 3029, 1),
(473, 3042, 1),
(473, 3149, 5),
(473, 3191, 84),
(473, 7643, 128),
(473, 10293, 9),
(473, 11443, 40),
(473, 11456, 2),
(473, 11466, 12),
(473, 11479, 1),
(473, 23986, 3),
(473, 25701, 46),
(473, 37110, 3),
(99, 281, 1),
(99, 284, 8),
(99, 676, 20),
(99, 3017, 1),
(99, 3041, 11),
(99, 3077, 9),
(99, 3149, 3),
(99, 3155, 98),
(99, 3180, 12),
(99, 3195, 163),
(99, 3203, 81),
(99, 3492, 72),
(99, 3577, 7),
(99, 3659, 13),
(99, 3732, 113),
(99, 5804, 1),
(99, 5877, 1),
(99, 5880, 314),
(99, 5895, 320),
(99, 5898, 3),
(99, 5911, 99),
(99, 5912, 1),
(99, 5914, 1),
(99, 5920, 1),
(99, 5921, 4),
(99, 5922, 16),
(99, 5925, 704),
(99, 5954, 201),
(99, 6499, 405),
(99, 7439, 111),
(99, 9633, 5),
(99, 9636, 100),
(99, 9644, 15),
(99, 9649, 6),
(99, 9663, 2),
(99, 9665, 5),
(99, 9685, 64),
(99, 9686, 1),
(99, 9691, 1),
(99, 10196, 1),
(99, 10276, 1),
(99, 10291, 5),
(99, 10293, 89),
(99, 10311, 5),
(99, 11444, 1),
(99, 11449, 57),
(99, 11457, 2),
(99, 11466, 20),
(99, 11467, 2),
(99, 11490, 11),
(99, 11492, 2),
(99, 12600, 12),
(99, 16167, 1),
(99, 20062, 91),
(99, 20201, 113),
(99, 22118, 721),
(99, 22516, 316),
(99, 22728, 149),
(99, 22729, 3),
(99, 22730, 2),
(99, 31560, 3),
(99, 33929, 167),
(99, 34008, 1),
(99, 34014, 11),
(99, 34022, 2),
(99, 34023, 123),
(99, 37110, 203),
(531, 268, 21),
(531, 283, 12),
(531, 285, 2),
(531, 3061, 1),
(531, 3447, 3),
(531, 3448, 34),
(531, 3592, 11),
(531, 3593, 4),
(531, 3597, 9),
(531, 3723, 16),
(531, 5922, 3),
(531, 6528, 32),
(531, 7365, 200),
(531, 7440, 1),
(531, 7642, 17),
(531, 7643, 615),
(531, 8011, 2),
(531, 9635, 22),
(531, 9686, 6),
(531, 10196, 7),
(531, 11444, 16),
(531, 11452, 22),
(531, 11464, 24),
(531, 11478, 8),
(531, 11479, 11),
(531, 11515, 1),
(531, 12517, 4),
(531, 15793, 11),
(531, 22118, 3),
(531, 23986, 2),
(531, 29291, 1),
(532, 5877, 23),
(532, 5880, 3),
(532, 5897, 2),
(532, 5914, 2),
(532, 5921, 11),
(532, 5922, 5),
(532, 9633, 24),
(532, 9635, 53),
(532, 9665, 11),
(532, 9685, 3),
(532, 10293, 12),
(532, 10311, 6),
(532, 11444, 14),
(532, 11456, 28),
(532, 11457, 8),
(532, 11464, 48),
(532, 11465, 31),
(532, 11492, 26),
(532, 21194, 4),
(532, 22118, 15),
(433, 237, 226),
(433, 238, 53),
(433, 283, 8),
(433, 284, 205),
(433, 285, 49),
(433, 3028, 6),
(433, 3029, 1),
(433, 3030, 2),
(433, 3033, 5),
(433, 3039, 5),
(433, 3116, 82),
(433, 3161, 91),
(433, 3180, 4),
(433, 3582, 1),
(433, 3724, 6),
(433, 3731, 158),
(433, 5479, 28),
(433, 5895, 89),
(433, 5925, 110),
(433, 5944, 331),
(433, 5951, 195),
(433, 6499, 221),
(433, 6558, 2),
(433, 7368, 3),
(433, 9027, 1),
(433, 9057, 7),
(433, 9058, 20),
(433, 9685, 5),
(433, 10304, 8),
(433, 10311, 4),
(433, 11492, 16),
(433, 16120, 48),
(433, 16123, 327),
(433, 16126, 137),
(433, 16279, 217),
(433, 20062, 14),
(433, 20198, 296),
(433, 20199, 135),
(433, 20200, 66),
(433, 20201, 30),
(433, 22118, 25),
(433, 22516, 26),
(433, 22728, 2),
(433, 22730, 76),
(433, 32625, 1),
(433, 32703, 2),
(433, 32769, 2),
(433, 37110, 9),
(472, 268, 25),
(518, 5895, 1),
(518, 9633, 1),
(518, 9685, 1),
(518, 10304, 41),
(518, 10311, 6),
(518, 11444, 3),
(518, 37109, 40),
(484, 9633, 10),
(484, 9685, 48),
(484, 10311, 21),
(484, 11444, 1),
(566, 3030, 1),
(566, 5921, 7),
(585, 236, 133),
(585, 238, 170),
(585, 3029, 16),
(585, 3032, 20),
(585, 3034, 1),
(585, 3037, 2),
(585, 3042, 4),
(585, 3449, 624),
(585, 5804, 3),
(585, 5878, 3),
(585, 10311, 25),
(585, 11444, 25),
(585, 11472, 2),
(585, 11482, 1),
(585, 12517, 5),
(585, 16143, 487),
(585, 21182, 1),
(585, 22118, 14),
(585, 22728, 5),
(585, 35901, 500),
(98, 7643, 10),
(97, 236, 41),
(97, 237, 83),
(97, 268, 7),
(97, 284, 6),
(97, 3027, 3),
(97, 3028, 1),
(97, 3030, 1),
(97, 3038, 2),
(97, 3039, 11),
(97, 3152, 100),
(97, 3161, 200),
(97, 3175, 123),
(97, 3190, 49),
(97, 3191, 102),
(97, 3202, 122),
(97, 3277, 1),
(97, 4871, 2),
(97, 5804, 4),
(97, 5898, 7),
(97, 5911, 10),
(97, 5922, 1),
(97, 5930, 1),
(97, 6499, 297),
(97, 7290, 1),
(97, 7365, 136),
(97, 7368, 1),
(97, 7439, 6),
(97, 7440, 1),
(97, 7443, 17),
(97, 7642, 129),
(97, 9058, 2),
(97, 9633, 12),
(97, 9660, 2),
(97, 9663, 2),
(97, 9665, 2),
(97, 9685, 1),
(97, 9691, 17),
(97, 10306, 41),
(97, 10311, 1),
(97, 10312, 25),
(97, 11444, 10),
(97, 11449, 1),
(97, 11452, 2),
(97, 11492, 25),
(97, 20062, 5),
(97, 20198, 8),
(97, 20199, 7),
(97, 20200, 28),
(97, 22516, 156),
(97, 22721, 25),
(97, 22728, 111),
(97, 22729, 1),
(97, 22730, 49),
(97, 28824, 1),
(97, 30061, 16),
(599, 283, 1),
(599, 285, 8),
(599, 3030, 1),
(599, 3578, 1),
(599, 5880, 1),
(599, 9635, 16),
(599, 9641, 3),
(599, 11443, 17),
(599, 11444, 10),
(599, 11452, 20),
(599, 11453, 9),
(599, 11464, 16),
(599, 11465, 2),
(599, 11478, 16),
(599, 11479, 19),
(599, 12517, 1),
(599, 22118, 1),
(599, 37109, 3),
(562, 237, 160),
(562, 281, 1),
(562, 283, 1269),
(562, 284, 2353),
(562, 3027, 32),
(562, 3028, 4),
(562, 3029, 90),
(562, 3030, 6),
(562, 3032, 17),
(562, 3033, 63),
(562, 3036, 1),
(562, 3037, 1),
(562, 3038, 4),
(562, 3039, 2),
(562, 3041, 149),
(562, 3042, 20),
(562, 3724, 62),
(562, 4839, 50),
(562, 5466, 2),
(562, 5479, 14),
(562, 5879, 12),
(562, 5880, 286),
(562, 5892, 6),
(562, 5893, 11),
(562, 5895, 468),
(562, 5904, 5),
(562, 5925, 548),
(562, 5930, 39),
(562, 6499, 791),
(562, 7440, 3),
(562, 7643, 310),
(562, 9057, 9),
(562, 9058, 14),
(562, 9633, 46),
(562, 9660, 2),
(562, 9663, 10),
(562, 9664, 12),
(562, 9685, 230),
(562, 9694, 89),
(562, 10282, 18),
(562, 10304, 314),
(562, 10306, 181),
(562, 10309, 60),
(562, 10312, 31),
(562, 10313, 3),
(562, 11472, 1),
(562, 11481, 9),
(562, 16119, 219),
(562, 16120, 233),
(562, 16121, 211),
(562, 16123, 330),
(562, 16124, 322),
(562, 16125, 35),
(562, 16126, 68),
(562, 20198, 1660),
(562, 20199, 1581),
(562, 20200, 264),
(562, 21201, 1),
(562, 22516, 152),
(562, 22721, 170),
(562, 22728, 17),
(562, 22730, 46),
(562, 23373, 7),
(562, 23375, 478),
(562, 30061, 1),
(562, 31340, 14),
(562, 31437, 59),
(562, 31558, 51),
(562, 31559, 38),
(562, 31560, 109),
(562, 31561, 50),
(562, 33934, 231),
(562, 33935, 64),
(562, 34023, 15),
(562, 37110, 3),
(402, 236, 70),
(402, 237, 8),
(402, 266, 38),
(402, 268, 104),
(402, 285, 4),
(402, 3061, 1),
(402, 3577, 4),
(134, 236, 20),
(134, 238, 78),
(134, 239, 9),
(134, 3029, 1),
(134, 3147, 1),
(134, 3155, 153),
(134, 3160, 37),
(134, 3161, 4436),
(134, 3173, 26),
(134, 5911, 24),
(134, 9685, 2),
(134, 10196, 1),
(134, 10282, 1),
(134, 11450, 4),
(134, 11510, 55),
(134, 11512, 1),
(134, 23986, 1),
(134, 31437, 65),
(134, 33929, 4),
(262, 284, 186),
(262, 5904, 2),
(262, 11492, 2),
(262, 22721, 7),
(262, 27621, 1),
(262, 27624, 1),
(262, 30061, 1),
(262, 32594, 1),
(262, 37110, 4),
(276, 238, 322),
(276, 284, 198),
(362, 268, 10),
(257, 239, 355),
(257, 283, 2716),
(257, 284, 8701),
(257, 285, 2),
(257, 3029, 4),
(257, 3160, 17),
(257, 3180, 82),
(257, 3731, 595),
(257, 5904, 1),
(257, 7643, 367),
(257, 9633, 9),
(257, 9663, 108),
(257, 9685, 13),
(257, 10311, 4),
(257, 11444, 5),
(257, 11464, 1),
(257, 11466, 1),
(257, 16120, 30),
(257, 20200, 9),
(257, 22728, 103),
(257, 22730, 109),
(257, 29943, 1),
(257, 30088, 5),
(257, 32594, 1),
(257, 37110, 207),
(550, 10304, 190),
(347, 237, 706),
(347, 238, 310),
(347, 239, 255),
(347, 3010, 4),
(347, 3034, 26),
(347, 3036, 1),
(347, 3039, 1),
(347, 3041, 4),
(347, 3155, 3),
(347, 3590, 252),
(347, 3732, 104),
(347, 5479, 25),
(347, 5804, 6),
(347, 5879, 15),
(347, 5880, 19),
(347, 5882, 5),
(347, 5893, 34),
(347, 5895, 44),
(347, 5896, 2),
(347, 5897, 7),
(347, 5904, 6),
(347, 5905, 79),
(347, 5911, 10),
(347, 5914, 1),
(347, 5922, 10),
(347, 5925, 1),
(347, 5930, 5),
(347, 5944, 39),
(347, 5954, 24),
(347, 6499, 852),
(347, 6528, 24),
(347, 6558, 18),
(347, 7158, 2),
(347, 7439, 95),
(347, 7440, 35),
(347, 7443, 45),
(347, 7642, 343),
(347, 7643, 1439),
(347, 9633, 83),
(347, 9635, 60),
(347, 9640, 20),
(347, 9649, 38),
(347, 9660, 20),
(347, 9663, 31),
(347, 9665, 17),
(347, 9685, 217),
(347, 9694, 120),
(347, 10196, 21),
(347, 10283, 1),
(347, 10304, 393),
(347, 10309, 9),
(347, 10311, 142),
(347, 10313, 2),
(347, 10316, 1),
(347, 10405, 26),
(347, 11444, 36),
(347, 11447, 68),
(347, 11449, 48),
(347, 11452, 68),
(347, 11457, 1),
(347, 11464, 43),
(347, 11466, 92),
(347, 11467, 2),
(347, 11484, 2),
(347, 11492, 105),
(347, 11510, 33),
(347, 11512, 4),
(347, 11658, 19),
(347, 11673, 28),
(347, 14012, 253),
(347, 18924, 18),
(347, 18927, 24),
(347, 20062, 10),
(347, 20199, 77),
(347, 21194, 239),
(347, 22118, 65),
(347, 22516, 29),
(347, 22721, 39),
(347, 22728, 25),
(347, 23373, 117),
(347, 23374, 49),
(347, 23375, 1),
(347, 25759, 178),
(347, 27653, 3),
(347, 32625, 1),
(347, 32626, 1),
(347, 32703, 1),
(347, 37110, 12),
(457, 237, 1),
(457, 9633, 20),
(457, 10316, 30),
(364, 237, 200),
(364, 238, 953),
(364, 266, 10),
(364, 281, 1),
(364, 284, 431),
(364, 3026, 1),
(364, 3029, 10),
(364, 3032, 4),
(364, 3037, 1),
(364, 3038, 2),
(364, 3039, 1),
(364, 3041, 1),
(364, 3147, 5828),
(364, 3155, 213),
(364, 3160, 200),
(364, 3161, 707),
(364, 3191, 157),
(364, 3202, 23788),
(364, 3492, 7),
(364, 3581, 155),
(364, 3593, 35),
(364, 3725, 41),
(364, 3731, 311),
(364, 3732, 231),
(364, 5877, 2),
(364, 5880, 19),
(364, 5882, 7),
(364, 5893, 1),
(364, 5895, 342),
(364, 5896, 5),
(364, 5897, 3),
(364, 5902, 11),
(364, 5904, 12),
(364, 5920, 1),
(364, 5922, 5),
(364, 5925, 38),
(364, 5948, 3),
(364, 5954, 85),
(364, 6499, 314),
(364, 7158, 1),
(364, 7159, 2),
(364, 7439, 313),
(364, 7440, 78),
(364, 7443, 274),
(364, 7642, 6),
(364, 7643, 155),
(364, 8011, 94),
(364, 9057, 9),
(364, 9058, 3),
(364, 9633, 122),
(364, 9635, 45),
(364, 9636, 4),
(364, 9637, 19),
(364, 9649, 72),
(364, 9660, 25),
(364, 9661, 45),
(364, 9664, 2),
(364, 9665, 27),
(364, 9685, 384),
(364, 9694, 274),
(364, 10196, 42),
(364, 10282, 30),
(364, 10298, 3),
(364, 10304, 238),
(364, 10309, 67),
(364, 10311, 242),
(364, 10313, 18),
(364, 10316, 14),
(364, 11444, 92),
(364, 11452, 63),
(364, 11457, 13),
(364, 11464, 25),
(364, 11466, 85),
(364, 11481, 16),
(364, 11492, 42),
(364, 11493, 3),
(364, 11512, 25),
(364, 11673, 13),
(364, 12039, 1),
(364, 12040, 1),
(364, 16120, 2),
(364, 16123, 15),
(364, 16126, 6),
(364, 16131, 13),
(364, 20062, 12),
(364, 20199, 42),
(364, 20200, 12),
(364, 22118, 281),
(364, 22516, 74),
(364, 22721, 83),
(364, 22728, 14),
(364, 22730, 32),
(364, 23373, 51),
(364, 23374, 192),
(364, 23375, 390),
(364, 29291, 4),
(364, 30061, 1),
(364, 31439, 2),
(364, 31440, 1),
(364, 31559, 1),
(364, 31561, 1),
(364, 32626, 1),
(364, 32769, 2),
(364, 37109, 11),
(364, 37110, 64),
(677, 237, 2),
(677, 266, 20),
(677, 268, 25),
(677, 3028, 5),
(677, 3033, 6),
(677, 3041, 2),
(677, 3061, 1),
(677, 3277, 3),
(677, 3446, 1),
(677, 3738, 6),
(677, 5878, 1),
(677, 5922, 5),
(677, 9058, 1),
(677, 9635, 19),
(677, 11443, 171),
(677, 11458, 4),
(677, 11463, 2),
(677, 11464, 14),
(677, 11465, 4),
(677, 11479, 4),
(677, 16121, 5),
(677, 21201, 1),
(677, 32769, 1),
(678, 283, 3),
(678, 285, 2),
(678, 647, 4),
(678, 675, 4),
(678, 676, 7),
(678, 3017, 14),
(678, 3026, 36),
(678, 3027, 48),
(678, 3028, 98),
(678, 3029, 86),
(678, 3030, 75),
(678, 3032, 92),
(678, 3033, 36),
(678, 3034, 7),
(678, 3037, 3),
(678, 3039, 5),
(678, 3042, 10),
(678, 3061, 10),
(678, 3147, 3),
(678, 3723, 95),
(678, 3725, 2),
(678, 3738, 2),
(678, 5021, 2),
(678, 5479, 3),
(678, 5804, 1),
(678, 5877, 4),
(678, 5878, 1),
(678, 5880, 6),
(678, 5892, 1),
(678, 5895, 27),
(678, 5898, 2),
(678, 5904, 1),
(678, 5910, 4),
(678, 5911, 26),
(678, 5912, 4),
(678, 5913, 2),
(678, 5914, 2),
(678, 5920, 9),
(678, 5944, 121),
(678, 6499, 110),
(678, 7368, 40),
(678, 9057, 52),
(678, 9058, 3),
(678, 9635, 6),
(678, 9640, 13),
(678, 9641, 4),
(678, 9649, 18),
(678, 9665, 31),
(678, 9694, 31),
(678, 10196, 4),
(678, 10276, 6),
(678, 10281, 16),
(678, 10282, 18),
(678, 10283, 1),
(678, 10293, 3),
(678, 10304, 48),
(678, 10306, 116),
(678, 10311, 2),
(678, 10312, 78),
(678, 10313, 5),
(678, 10320, 21),
(678, 11447, 2),
(678, 11449, 96),
(678, 11450, 12),
(678, 11457, 69),
(678, 11463, 1),
(678, 11464, 7),
(678, 11465, 4),
(678, 11466, 22),
(678, 11470, 17),
(678, 11472, 1),
(678, 11475, 4),
(678, 11477, 5),
(678, 11479, 19),
(678, 11480, 4),
(678, 11482, 1),
(678, 11484, 2),
(678, 11486, 1),
(678, 11487, 47),
(678, 11488, 108),
(678, 11489, 55),
(678, 11490, 48),
(678, 11491, 80),
(678, 11492, 2),
(678, 11510, 69),
(678, 11512, 9),
(678, 12517, 1),
(678, 12730, 8),
(678, 14008, 2),
(678, 14009, 2),
(678, 14010, 5),
(678, 14011, 7),
(678, 14012, 6),
(678, 14013, 6),
(678, 14041, 6),
(678, 14044, 6),
(678, 16119, 6),
(678, 16120, 5),
(678, 16121, 6),
(678, 16125, 2),
(678, 18924, 36),
(678, 18927, 25),
(678, 21182, 10),
(678, 21194, 22),
(678, 22118, 10),
(678, 27599, 7),
(678, 27600, 7),
(678, 27601, 7),
(678, 32772, 1),
(678, 37109, 12),
(678, 37110, 4),
(671, 237, 2),
(671, 3036, 2),
(671, 3042, 1),
(671, 3738, 1),
(671, 5922, 2),
(671, 9641, 2),
(671, 9686, 1),
(671, 10196, 2),
(671, 11464, 2),
(671, 11465, 4),
(671, 11477, 1),
(671, 11479, 4),
(671, 11481, 5),
(671, 22118, 1),
(328, 285, 8),
(328, 3032, 2),
(328, 3033, 6),
(328, 3042, 2),
(328, 3061, 2),
(328, 3725, 1),
(328, 5880, 5),
(328, 5922, 2),
(328, 9635, 2),
(328, 9641, 18),
(328, 11444, 10),
(328, 11457, 6),
(328, 11464, 7),
(328, 11479, 2),
(328, 11481, 8),
(496, 3446, 5),
(438, 237, 37),
(438, 281, 4),
(438, 282, 1),
(438, 3027, 12),
(438, 3028, 206),
(438, 3030, 14),
(438, 3032, 12),
(438, 3033, 27),
(438, 3036, 3),
(438, 3037, 4),
(438, 3038, 4),
(438, 3039, 3),
(438, 3041, 56),
(438, 3042, 4),
(438, 3058, 4),
(438, 3060, 13),
(438, 3062, 24),
(438, 3116, 2),
(438, 3148, 47),
(438, 3160, 6658),
(438, 3173, 98),
(438, 3192, 79),
(438, 3202, 14),
(438, 3723, 37),
(438, 4871, 1),
(438, 5808, 3),
(438, 5880, 14),
(438, 5910, 3),
(438, 5911, 1),
(438, 5944, 11),
(438, 7439, 7),
(438, 8031, 19),
(438, 9057, 9),
(438, 9058, 6),
(438, 9633, 4),
(438, 9636, 9),
(438, 9685, 10),
(438, 10196, 180),
(438, 10311, 30),
(438, 11492, 2),
(438, 16119, 6),
(438, 16120, 36),
(438, 16124, 57),
(438, 16125, 89),
(438, 16126, 124),
(438, 16127, 33),
(438, 20200, 120),
(438, 20201, 1),
(438, 22193, 29),
(438, 22516, 157),
(438, 22721, 17),
(438, 25737, 287),
(438, 31438, 1),
(438, 31560, 75),
(438, 36780, 170),
(438, 37109, 15),
(438, 37110, 82),
(658, 281, 1),
(658, 284, 234),
(658, 3027, 15),
(658, 3028, 13),
(658, 3030, 15),
(658, 3032, 11),
(658, 3033, 8),
(658, 3037, 2),
(658, 3038, 2),
(658, 3039, 5),
(658, 3041, 1),
(658, 5892, 1),
(658, 5895, 2),
(658, 5904, 1),
(658, 7439, 3),
(658, 7440, 8),
(658, 7443, 2),
(658, 9057, 2),
(658, 9058, 1),
(658, 9685, 76),
(658, 16119, 3),
(658, 16121, 1),
(658, 23374, 2),
(658, 23375, 2),
(658, 30059, 1),
(658, 37110, 2),
(653, 5921, 1),
(653, 9635, 5),
(653, 11464, 5),
(653, 11465, 3),
(703, 5879, 14),
(703, 5895, 17),
(703, 9633, 12),
(703, 9641, 5),
(703, 9660, 9),
(703, 22516, 13),
(703, 22721, 16),
(703, 23375, 150),
(703, 30059, 1),
(703, 37110, 33),
(679, 281, 3),
(679, 282, 3),
(679, 647, 1),
(679, 677, 2),
(679, 3010, 8),
(679, 3017, 5),
(679, 3026, 13),
(679, 3027, 18),
(679, 3028, 36),
(679, 3029, 167),
(679, 3030, 3),
(679, 3032, 76),
(679, 3033, 85),
(679, 3037, 1),
(679, 3042, 2),
(679, 3061, 11),
(679, 3725, 2),
(679, 5021, 6),
(679, 5479, 8),
(679, 5804, 1),
(679, 5877, 3),
(679, 5878, 1),
(679, 5879, 1),
(679, 5880, 2),
(679, 5892, 2),
(679, 5893, 8),
(679, 5895, 23),
(679, 5898, 8),
(679, 5904, 1),
(679, 5911, 20),
(679, 5912, 4),
(679, 5914, 1),
(679, 5920, 3),
(679, 5922, 1),
(679, 5930, 1),
(679, 5944, 126),
(679, 6499, 291),
(679, 7368, 117),
(679, 8031, 3),
(679, 9054, 19),
(679, 9057, 68),
(679, 9058, 7),
(679, 9635, 2),
(679, 9641, 27),
(679, 9649, 4),
(679, 9659, 4),
(679, 9662, 1),
(679, 9663, 1),
(679, 9665, 7),
(679, 9685, 13),
(679, 9694, 137),
(679, 10196, 4),
(679, 10276, 6),
(679, 10281, 4),
(679, 10282, 39),
(679, 10293, 88),
(679, 10304, 450),
(679, 10305, 10),
(679, 10306, 79),
(679, 10311, 52),
(679, 10312, 56),
(679, 10313, 12),
(679, 11443, 12),
(679, 11444, 42),
(679, 11447, 64),
(679, 11449, 25),
(679, 11450, 10),
(679, 11452, 1),
(679, 11453, 3),
(679, 11456, 6),
(679, 11457, 45),
(679, 11458, 2),
(679, 11463, 2),
(679, 11464, 2),
(679, 11465, 2),
(679, 11466, 3),
(679, 11470, 3),
(679, 11472, 2),
(679, 11479, 10),
(679, 11481, 30),
(679, 11482, 1),
(679, 11487, 11),
(679, 11488, 43),
(679, 11489, 12),
(679, 11490, 13),
(679, 11491, 35),
(679, 11492, 14),
(679, 11510, 48),
(679, 11512, 2),
(679, 12600, 2),
(679, 12730, 57),
(679, 14008, 15),
(679, 14009, 15),
(679, 14010, 18),
(679, 14011, 26),
(679, 14012, 40),
(679, 14013, 38),
(679, 14041, 39),
(679, 14044, 18),
(679, 16123, 1),
(679, 16124, 1),
(679, 16138, 2),
(679, 21182, 5),
(679, 21194, 15),
(679, 22118, 12),
(679, 24391, 3),
(679, 25691, 46),
(679, 25695, 24),
(679, 25696, 7),
(679, 27599, 8),
(679, 27600, 8),
(679, 27601, 8),
(652, 3010, 2),
(652, 3028, 7),
(652, 3030, 14),
(652, 3032, 1),
(652, 5895, 1),
(652, 9633, 2),
(652, 9641, 4),
(652, 9685, 63),
(652, 11449, 26),
(652, 11452, 3),
(652, 11481, 7),
(652, 18924, 16),
(652, 18927, 8),
(657, 281, 84),
(657, 282, 55),
(657, 284, 19),
(657, 3027, 23),
(657, 3028, 677),
(657, 3029, 229),
(657, 3030, 896),
(657, 3032, 733),
(657, 3033, 1089),
(657, 3034, 153),
(657, 3036, 18),
(657, 3037, 6),
(657, 3038, 28),
(657, 3039, 11),
(657, 3041, 22),
(657, 3042, 12),
(657, 3060, 5),
(657, 3077, 5),
(657, 3731, 560),
(657, 3732, 411),
(657, 4839, 2),
(657, 5878, 6),
(657, 5879, 18),
(657, 5880, 90),
(657, 5887, 1),
(657, 5888, 6),
(657, 5892, 11),
(657, 5893, 61),
(657, 5895, 194),
(657, 5898, 13),
(657, 5904, 30),
(657, 5911, 2),
(657, 5921, 1),
(657, 5925, 123),
(657, 5930, 11),
(657, 5944, 21),
(657, 5954, 93),
(657, 6499, 33),
(657, 7439, 108),
(657, 7440, 104),
(657, 7443, 127),
(657, 9057, 45),
(657, 9058, 61),
(657, 9633, 93),
(657, 9635, 5),
(657, 9636, 19),
(657, 9641, 18),
(657, 9660, 21),
(657, 9661, 4),
(657, 9663, 47),
(657, 9664, 23),
(657, 9685, 77),
(657, 9694, 4),
(657, 10196, 1),
(657, 10282, 14),
(657, 10283, 1),
(657, 10293, 53),
(657, 10298, 23),
(657, 10304, 1648),
(657, 10311, 51),
(657, 10313, 1),
(657, 10320, 1),
(657, 11444, 16),
(657, 11447, 293),
(657, 11449, 21),
(657, 11452, 14),
(657, 11454, 2),
(657, 11456, 4),
(657, 11464, 5),
(657, 11465, 2),
(657, 11472, 5),
(657, 11478, 9),
(657, 11479, 4),
(657, 11481, 84),
(657, 11487, 32),
(657, 11488, 102),
(657, 11490, 33),
(657, 11491, 90),
(657, 11492, 11),
(657, 11672, 2),
(657, 11673, 5),
(657, 12517, 2),
(657, 12600, 1),
(657, 16119, 393),
(657, 16120, 392),
(657, 16121, 380),
(657, 16122, 728),
(657, 16124, 756),
(657, 16126, 58),
(657, 16127, 55),
(657, 18924, 4),
(657, 18927, 1),
(657, 20062, 475),
(657, 20183, 192),
(657, 20198, 1),
(657, 20200, 2),
(657, 21194, 49),
(657, 21201, 6),
(657, 22193, 55),
(657, 22516, 108),
(657, 22721, 515),
(657, 22728, 167),
(657, 22729, 16),
(657, 22730, 245),
(657, 23373, 772),
(657, 23374, 147),
(657, 23375, 377),
(657, 23517, 1),
(657, 23986, 6),
(657, 25737, 152),
(657, 28566, 174),
(657, 28567, 189),
(657, 28568, 37),
(657, 28570, 6),
(657, 29291, 61),
(657, 30059, 2),
(657, 30061, 5),
(657, 32594, 2),
(657, 32625, 1),
(657, 32626, 2),
(657, 32769, 6),
(657, 32772, 3),
(657, 33929, 205),
(657, 33934, 14),
(657, 33935, 4),
(657, 34014, 48),
(657, 34022, 3),
(657, 37109, 30),
(657, 37110, 152),
(707, 281, 1),
(707, 3028, 2),
(707, 3032, 4),
(707, 3033, 8),
(707, 3037, 1),
(707, 3038, 1),
(707, 3039, 3),
(707, 3041, 1),
(707, 5895, 1),
(707, 5904, 1),
(707, 9058, 1),
(707, 16119, 3),
(707, 16120, 2),
(707, 16121, 3),
(707, 22516, 1),
(707, 22721, 1),
(707, 23373, 13),
(707, 23374, 1),
(707, 23375, 14),
(267, 237, 1),
(267, 238, 8),
(267, 239, 11),
(267, 281, 77),
(267, 282, 3),
(267, 284, 3365),
(267, 675, 64),
(267, 939, 5),
(267, 3026, 80),
(267, 3029, 98),
(267, 3032, 90),
(267, 3033, 40),
(267, 3034, 64),
(267, 3036, 138),
(267, 3037, 38),
(267, 3038, 68),
(267, 3039, 62),
(267, 3041, 215),
(267, 3042, 1),
(267, 3148, 51),
(267, 3155, 10),
(267, 3156, 5),
(267, 3161, 225),
(267, 3164, 18),
(267, 3177, 23),
(267, 3192, 13),
(267, 3202, 373),
(267, 3203, 296),
(267, 3277, 77),
(267, 3449, 8),
(267, 3492, 724),
(267, 3577, 8),
(267, 3582, 32),
(267, 3724, 4),
(267, 3731, 137),
(267, 4839, 1),
(267, 5466, 2),
(267, 5808, 2),
(267, 5809, 1),
(267, 5885, 1),
(267, 5887, 4),
(267, 5888, 18),
(267, 5889, 2),
(267, 5892, 18),
(267, 5914, 1),
(267, 5922, 52),
(267, 5925, 77),
(267, 5943, 2),
(267, 5944, 5),
(267, 5954, 2),
(267, 6499, 354),
(267, 6528, 136),
(267, 6558, 2),
(267, 7366, 35),
(267, 7367, 17),
(267, 7368, 209),
(267, 7439, 4),
(267, 7443, 66),
(267, 7642, 353),
(267, 7643, 549),
(267, 8031, 2),
(267, 8192, 10),
(267, 9054, 1),
(267, 9057, 49),
(267, 9058, 1),
(267, 9633, 718),
(267, 9636, 264),
(267, 9637, 1),
(267, 9663, 10),
(267, 9685, 68),
(267, 10282, 4),
(267, 10298, 120),
(267, 10306, 3),
(267, 10311, 9),
(267, 10316, 148),
(267, 10341, 1),
(267, 10342, 1),
(267, 10343, 2),
(267, 11444, 10),
(267, 11454, 1),
(267, 11481, 200),
(267, 11492, 5),
(267, 12039, 1),
(267, 12040, 1),
(267, 12309, 1),
(267, 12517, 1),
(267, 15793, 4549),
(267, 16120, 183),
(267, 16131, 43),
(267, 16141, 100),
(267, 18927, 4),
(267, 20062, 419),
(267, 20063, 2),
(267, 20200, 1294),
(267, 20203, 4),
(267, 20205, 1),
(267, 21814, 33),
(267, 21816, 3),
(267, 22186, 1),
(267, 22721, 94),
(267, 22728, 117),
(267, 22730, 23),
(267, 23374, 5),
(267, 23507, 2),
(267, 23515, 12),
(267, 23516, 4),
(267, 23517, 1),
(267, 24392, 16),
(267, 27597, 1),
(267, 27621, 2),
(267, 27622, 2),
(267, 27623, 1),
(267, 27624, 2),
(267, 29291, 1),
(267, 29943, 2),
(267, 30059, 3),
(267, 30061, 42),
(267, 30088, 24),
(267, 30180, 1),
(267, 31443, 2),
(267, 31590, 1),
(267, 32594, 1),
(267, 32625, 1),
(267, 32626, 2),
(267, 32703, 32),
(267, 32769, 2),
(267, 32772, 6),
(267, 33932, 70),
(267, 33933, 2),
(267, 33934, 677),
(267, 33935, 1),
(267, 33936, 26),
(267, 33937, 15),
(267, 33982, 1),
(267, 34023, 67),
(267, 34025, 10),
(267, 34160, 1),
(267, 35901, 9492),
(267, 35902, 3141),
(267, 36780, 2),
(267, 37110, 57),
(40, 238, 202),
(40, 23373, 300),
(25, 238, 42),
(25, 239, 137),
(25, 281, 13),
(25, 283, 2358),
(25, 284, 304),
(25, 3010, 4),
(25, 3028, 2),
(25, 3030, 14),
(25, 3033, 9),
(25, 3034, 42),
(25, 3036, 9),
(25, 3037, 20),
(25, 3038, 18),
(25, 3039, 31),
(25, 3041, 16),
(25, 3191, 300),
(25, 3581, 5),
(25, 3724, 3),
(25, 3728, 6),
(25, 3731, 8),
(25, 3732, 26),
(25, 5021, 4),
(25, 5479, 3),
(25, 5879, 7),
(25, 5892, 9),
(25, 5893, 1),
(25, 5895, 6),
(25, 5898, 7),
(25, 5904, 8),
(25, 5948, 2),
(25, 6499, 230),
(25, 6528, 41),
(25, 7439, 7),
(25, 7440, 30),
(25, 7443, 4),
(25, 7642, 3),
(25, 7643, 384),
(25, 9057, 12),
(25, 9058, 12),
(25, 9633, 12),
(25, 9649, 9),
(25, 9663, 10),
(25, 9665, 11),
(25, 9685, 8),
(25, 9694, 7),
(25, 10196, 120),
(25, 10293, 33),
(25, 10298, 13),
(25, 10304, 46),
(25, 10306, 2),
(25, 11443, 64),
(25, 11444, 7),
(25, 11447, 150),
(25, 11449, 25),
(25, 11454, 15),
(25, 11466, 13),
(25, 11491, 1),
(25, 11492, 1),
(25, 11510, 1),
(25, 12600, 1),
(25, 20062, 6),
(25, 22516, 21),
(25, 22728, 23),
(25, 22729, 2),
(25, 22730, 10),
(25, 23373, 43),
(25, 23374, 6),
(25, 23375, 18),
(25, 25691, 72),
(25, 30059, 5),
(25, 30061, 3),
(25, 33778, 1),
(39, 284, 264),
(39, 3036, 2),
(39, 7642, 40),
(39, 9058, 1),
(39, 9633, 15),
(39, 9663, 5),
(39, 9685, 25),
(39, 10311, 50),
(39, 11444, 60),
(39, 22516, 18),
(39, 22728, 90),
(39, 30059, 1),
(39, 32769, 2),
(56, 3034, 11),
(56, 3042, 3),
(56, 3725, 1),
(56, 5880, 4),
(56, 5898, 6),
(56, 5922, 1),
(56, 9633, 6),
(56, 9635, 7),
(56, 9685, 156),
(56, 10276, 1),
(56, 11444, 10),
(56, 11449, 1),
(56, 11452, 6),
(56, 11464, 4),
(56, 11512, 6),
(726, 236, 7),
(726, 283, 137),
(726, 3010, 1),
(726, 3017, 21),
(726, 3027, 1),
(726, 3028, 2),
(726, 3029, 1),
(726, 3030, 1),
(726, 3033, 4),
(726, 3036, 1),
(726, 3042, 4),
(726, 3725, 3),
(726, 5877, 5),
(726, 5879, 4),
(726, 5898, 6),
(726, 5920, 3),
(726, 9633, 15),
(726, 9640, 3),
(726, 9641, 19),
(726, 9660, 3),
(726, 9663, 12),
(726, 9665, 7),
(726, 9685, 29),
(726, 10276, 4),
(726, 10311, 25),
(726, 11444, 20),
(726, 11456, 5),
(726, 11457, 34),
(726, 11481, 21),
(726, 11492, 41),
(726, 11512, 17),
(726, 20200, 25),
(726, 22118, 30),
(726, 22516, 1),
(726, 22728, 5),
(726, 22730, 5),
(726, 29291, 19),
(726, 30061, 1),
(754, 284, 291),
(754, 3277, 3),
(754, 7363, 8),
(754, 7440, 12),
(754, 9635, 11),
(754, 11464, 7),
(754, 11465, 3),
(754, 22118, 5),
(754, 22516, 5),
(754, 29291, 4),
(754, 30059, 1),
(754, 30061, 1),
(754, 35901, 432),
(754, 37110, 15),
(728, 236, 197),
(728, 238, 323),
(728, 239, 313),
(728, 281, 1),
(728, 282, 6),
(728, 647, 82),
(728, 3026, 12),
(728, 3027, 6),
(728, 3028, 64),
(728, 3029, 15),
(728, 3030, 36),
(728, 3032, 46),
(728, 3033, 43),
(728, 3036, 4),
(728, 3037, 1),
(728, 3038, 5),
(728, 3039, 2),
(728, 3041, 1),
(728, 3044, 2),
(728, 5021, 6),
(728, 5479, 14),
(728, 5879, 5),
(728, 5880, 14),
(728, 5882, 10),
(728, 5885, 1),
(728, 5892, 4),
(728, 5893, 7),
(728, 5895, 95),
(728, 5898, 12),
(728, 5904, 1),
(728, 5921, 5),
(728, 5922, 40),
(728, 5925, 20),
(728, 5948, 10),
(728, 6499, 232),
(728, 6558, 7),
(728, 7439, 30),
(728, 7440, 21),
(728, 7443, 31),
(728, 7642, 59),
(728, 7643, 439),
(728, 8031, 7),
(728, 9057, 19),
(728, 9058, 2),
(728, 9633, 18),
(728, 9635, 8),
(728, 9641, 7),
(728, 9649, 3),
(728, 9656, 1),
(728, 9660, 10),
(728, 9663, 1),
(728, 9664, 14),
(728, 9665, 31),
(728, 9666, 4),
(728, 9685, 94),
(728, 9691, 70),
(728, 9694, 131),
(728, 10277, 18),
(728, 10282, 31),
(728, 10291, 1),
(728, 10293, 77),
(728, 10304, 51),
(728, 10305, 1),
(728, 10306, 6),
(728, 10309, 140),
(728, 10311, 24),
(728, 10313, 10),
(728, 10316, 52),
(728, 10397, 101),
(728, 10404, 2),
(728, 10405, 3),
(728, 10449, 6),
(728, 10450, 25),
(728, 11443, 66),
(728, 11444, 20),
(728, 11452, 20),
(728, 11454, 9),
(728, 11456, 8),
(728, 11465, 205),
(728, 11466, 5),
(728, 11474, 110),
(728, 11481, 75),
(728, 11484, 5),
(728, 11487, 7),
(728, 11488, 35),
(728, 11489, 10),
(728, 11490, 16),
(728, 11491, 20),
(728, 11492, 28),
(728, 11493, 7),
(728, 11512, 2),
(728, 11658, 14),
(728, 11671, 254),
(728, 11672, 124),
(728, 11673, 243),
(728, 12517, 1),
(728, 16120, 5),
(728, 16123, 82),
(728, 16126, 34),
(728, 16131, 1),
(728, 16133, 1),
(728, 16135, 1),
(728, 17818, 12),
(728, 17831, 6),
(728, 17849, 1),
(728, 17853, 1),
(728, 17856, 1),
(728, 20062, 1),
(728, 20183, 83),
(728, 20198, 75),
(728, 20199, 61),
(728, 20200, 27),
(728, 21103, 1),
(728, 21203, 9),
(728, 21814, 6),
(728, 21816, 11),
(728, 22118, 7),
(728, 22184, 13),
(728, 22516, 16),
(728, 22721, 18),
(728, 22728, 184),
(728, 22730, 301),
(728, 23373, 35),
(728, 23374, 9),
(728, 23535, 8),
(728, 25737, 17),
(728, 25759, 168),
(728, 28822, 6),
(728, 28823, 3),
(728, 29291, 42),
(728, 30005, 219),
(728, 30058, 112),
(728, 30088, 1),
(728, 31340, 1),
(728, 31439, 1),
(728, 31440, 2),
(728, 31559, 9),
(728, 31560, 9),
(728, 31561, 4),
(728, 31678, 50),
(728, 33945, 27),
(728, 37109, 20),
(728, 37110, 7),
(761, 284, 320),
(761, 3027, 2),
(761, 7365, 224),
(761, 9685, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int NOT NULL DEFAULT '0',
  `key` int UNSIGNED NOT NULL DEFAULT '0',
  `value` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(1, 13413, 1),
(1, 13414, 4),
(1, 14903, 1),
(1, 17101, 0),
(1, 30023, 1),
(1, 30029, 0),
(1, 30058, 1),
(2, 13413, 1),
(2, 13414, 4),
(2, 14903, 1),
(2, 17101, 0),
(2, 30023, 1),
(2, 30029, 0),
(2, 30058, 1),
(3, 13413, 1),
(3, 13414, 4),
(3, 14903, 1),
(3, 17101, 0),
(3, 30023, 1),
(3, 30029, 0),
(3, 30058, 1),
(4, 13413, 1),
(4, 13414, 4),
(4, 14903, 1),
(4, 17101, 0),
(4, 30023, 1),
(4, 30029, 0),
(4, 30058, 1),
(5, 13413, 1),
(5, 13414, 4),
(5, 14903, 1),
(5, 17101, 0),
(5, 30023, 1),
(5, 30029, 0),
(5, 30058, 1),
(6, 13414, 4),
(6, 14903, 1),
(6, 17101, 0),
(6, 30023, 1),
(6, 30029, 0),
(6, 30058, 1),
(6, 10002011, 167),
(761, 1501, 1727690957),
(761, 6000, 1727530229),
(761, 13413, 1711875901),
(761, 13414, 1),
(761, 13700, 1),
(761, 14898, 0),
(761, 14903, 2),
(761, 17101, 0),
(761, 20000, 2780),
(761, 20067, 927),
(761, 30018, 1),
(761, 30023, 1),
(761, 30029, 0),
(761, 30051, 1727690516),
(761, 30058, 1),
(761, 32201, 1),
(761, 33800, 1),
(761, 33801, 1),
(761, 33802, 1),
(761, 33803, 1),
(761, 33804, 1),
(761, 38412, 925),
(761, 38500, 1),
(761, 38501, 1),
(761, 38502, 1),
(761, 38504, 1),
(761, 38505, 1),
(761, 38506, 1),
(761, 38508, 1),
(761, 40301, 1),
(761, 40302, 1),
(761, 40303, 1),
(761, 40304, 1),
(761, 51052, 0),
(761, 60000, 2),
(761, 60001, 39),
(761, 60002, 2),
(761, 60003, 55),
(761, 60004, 2),
(761, 60005, 74),
(761, 60006, 1),
(761, 60007, 0),
(761, 60008, 2),
(761, 60009, 60),
(761, 60010, 2),
(761, 60011, 59),
(761, 60012, 2),
(761, 60013, 65),
(761, 60014, 1),
(761, 60015, 78),
(761, 60016, 2),
(761, 60017, 77),
(761, 60018, 1),
(761, 60019, 54),
(761, 60020, 1),
(761, 60021, 24),
(761, 60022, 1),
(761, 60023, 15),
(761, 60024, 1),
(761, 60025, 0),
(761, 60026, 1),
(761, 60027, 0),
(761, 60028, 1),
(761, 60029, 0),
(761, 60030, 1),
(761, 60031, 0),
(761, 60032, 1),
(761, 60033, 0),
(761, 60034, 1),
(761, 60035, 0),
(761, 60036, 1),
(761, 60037, 0),
(761, 60038, 1),
(761, 60039, 0),
(761, 60040, 1),
(761, 60041, 0),
(761, 60042, 1),
(761, 60043, 0),
(761, 60044, 1),
(761, 60045, 0),
(761, 60046, 1),
(761, 60047, 0),
(761, 60048, 1),
(761, 60049, 0),
(761, 60050, 1),
(761, 60051, 0),
(761, 60052, 1),
(761, 60053, 0),
(761, 60054, 1),
(761, 60055, 0),
(761, 10001001, 8912899),
(761, 10001002, 8978435),
(761, 10001003, 9175043),
(761, 10001004, 9240579),
(761, 10001005, 9699331),
(761, 10001006, 9109507),
(761, 10001007, 9306115),
(761, 61305005, 34),
(761, 61305006, 29),
(761, 61305008, 18),
(761, 61305009, 4),
(761, 61305012, 16),
(761, 61305015, 44),
(761, 61305016, 1),
(761, 61305017, 93),
(761, 61305018, 147),
(761, 61305019, 27),
(761, 61305027, 54),
(761, 61305028, 10),
(761, 61305033, 67),
(761, 61305034, 72),
(761, 61305038, 24),
(761, 61305044, 6),
(761, 61305062, 29),
(761, 61305063, 5),
(761, 61305064, 21),
(761, 61305065, 212),
(761, 61305068, 115),
(761, 61305069, 54),
(761, 61305070, 5),
(761, 61305071, 18),
(761, 61305073, 54),
(761, 61305076, 27),
(761, 61305077, 39),
(761, 61305082, 151),
(761, 61305083, 39),
(761, 61305094, 20),
(761, 61305100, 37),
(761, 61305108, 18),
(761, 61305237, 10),
(761, 61305238, 16),
(761, 61305240, 9),
(761, 61305242, 6),
(761, 61305243, 11),
(761, 61305244, 16),
(761, 61305246, 10),
(761, 61305261, 6),
(761, 61305299, 20),
(761, 61305392, 16),
(761, 61305437, 11),
(761, 61305446, 26),
(761, 61305461, 19),
(761, 61305483, 6),
(761, 61305518, 2),
(761, 61305958, 5),
(761, 61306040, 18),
(761, 61306056, 18),
(761, 61306146, 3),
(761, 61306147, 13),
(761, 61307351, 6),
(761, 61307352, 1),
(761, 61307353, 1),
(761, 61307354, 1),
(762, 13413, 1711875901),
(762, 13414, 9),
(762, 14898, 0),
(762, 14903, 1),
(762, 17101, 0),
(762, 20000, 10),
(762, 30023, 1),
(762, 30029, 0),
(762, 30058, 1),
(763, 13413, 1711875901),
(763, 13414, 9),
(763, 14898, 0),
(763, 14903, 1),
(763, 17101, 0),
(763, 20000, 30),
(763, 30023, 0),
(763, 30029, 0),
(763, 30058, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prey_slots`
--

CREATE TABLE `prey_slots` (
  `player_id` int NOT NULL,
  `num` smallint NOT NULL,
  `state` smallint NOT NULL DEFAULT '1',
  `unlocked` smallint NOT NULL DEFAULT '0',
  `current` varchar(40) NOT NULL DEFAULT '',
  `monster_list` varchar(360) NOT NULL,
  `free_reroll_in` int NOT NULL DEFAULT '0',
  `time_left` smallint NOT NULL DEFAULT '0',
  `next_use` int NOT NULL DEFAULT '0',
  `bonus_type` smallint NOT NULL,
  `bonus_value` smallint NOT NULL DEFAULT '0',
  `bonus_grade` smallint NOT NULL DEFAULT '0',
  `tick` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `prey_slots`
--

INSERT INTO `prey_slots` (`player_id`, `num`, `state`, `unlocked`, `current`, `monster_list`, `free_reroll_in`, `time_left`, `next_use`, `bonus_type`, `bonus_value`, `bonus_grade`, `tick`) VALUES
(763, 0, 1, 2, '', '', 0, 0, 0, 0, 25, 10, 0),
(763, 1, 1, 2, '', '', 0, 0, 0, 0, 25, 10, 0),
(763, 2, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0),
(762, 0, 1, 2, '', '', 0, 0, 0, 0, 13, 4, 0),
(762, 1, 1, 2, '', '', 0, 0, 0, 0, 17, 6, 0),
(762, 2, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0),
(761, 0, 4, 2, '', 'Giant Spider;Betrayed Wraith;Tunnel Tyrant;Killer Caiman;Quara Pincher Scout;Enslaved Dwarf;Turbulent Elemental;Dreadful Walker;Little Corym Charlatan', 0, 0, 1727602224, 0, 7, 1, 0),
(761, 1, 4, 2, '', 'Many Faces;Undertaker;Elf Scout;Gozzler;Worker Golem;Corym Vanguard;Lizard Magistratus;Werebear;Cliff Strider', 0, 0, 1727762270, 0, 15, 5, 0),
(761, 2, 0, 1, '', '', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roulette_plays`
--

CREATE TABLE `roulette_plays` (
  `id` int UNSIGNED NOT NULL,
  `player_id` int NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `reward_id` int NOT NULL,
  `reward_count` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = rolling | 1 = pending | 2 = delivered',
  `created_at` bigint DEFAULT NULL,
  `updated_at` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '19'),
('motd_hash', '12a88e3831f5522b0938c158e12aa8cca66163c1'),
('motd_num', '3'),
('players_record', '2');

-- --------------------------------------------------------

--
-- Table structure for table `store_history`
--

CREATE TABLE `store_history` (
  `id` int NOT NULL,
  `account_id` int UNSIGNED NOT NULL,
  `mode` smallint NOT NULL DEFAULT '0',
  `description` varchar(3500) NOT NULL,
  `coin_amount` int NOT NULL,
  `time` bigint UNSIGNED NOT NULL,
  `timestamp` int NOT NULL DEFAULT '0',
  `coins` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `store_history`
--

INSERT INTO `store_history` (`id`, `account_id`, `mode`, `description`, `coin_amount`, `time`, `timestamp`, `coins`) VALUES
(1431, 12, 0, 'XP Boost', -40, 1708428031, 0, 0),
(1432, 12, 0, 'XP Boost', -40, 1708436159, 0, 0),
(1433, 12, 0, 'XP Boost', -40, 1708443970, 0, 0),
(1434, 12, 0, 'XP Boost', -30, 1708459272, 0, 0),
(1435, 12, 0, 'XP Boost', -40, 1708467553, 0, 0),
(1436, 12, 0, 'All Regular Blessings', -650, 1708505228, 0, 0),
(1437, 12, 0, 'All Regular Blessings', -650, 1708506377, 0, 0),
(1438, 12, 0, 'XP Boost', -40, 1708508303, 0, 0),
(1439, 12, 0, 'XP Boost', -40, 1708639168, 0, 0),
(1441, 12, 0, 'You transfered this amount to Flexa The Legend', -21275, 1711235885, 0, 0),
(1454, 12, 0, 'XP Boost', -40, 1727458275, 0, 0),
(1455, 12, 0, 'XP Boost', -40, 1727527794, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(22, 0x5604ba030701000000b70900),
(22, 0x5604bb030701000000b80900),
(22, 0x5c04ba030701000000b70900),
(22, 0x5c04bb030701000000b80900),
(22, 0x5904c10307010000008f2400),
(24, 0x5504dc030701000000b70900),
(24, 0x5504dd030701000000b80900),
(24, 0x5804df030701000000ee1a00),
(25, 0x6f04da030701000000741b00),
(25, 0x6f04dc030701000000f71a00),
(25, 0x7004dd030701000000b70900),
(25, 0x7004de030701000000b80900),
(25, 0x7504dc030701000000f71a00),
(26, 0x6f04d5030701000000741b00),
(26, 0x6f04d6030701000000f71a00),
(26, 0x7004d7030701000000b70900),
(26, 0x7504d6030701000000f71a00),
(26, 0x7004d8030701000000b80900),
(27, 0x6f04cf030701000000741b00),
(27, 0x7204ce030701000000731b00),
(27, 0x6f04d0030701000000f71a00),
(27, 0x7004d1030701000000b70900),
(27, 0x7004d2030701000000b80900),
(27, 0x7504d0030701000000f71a00),
(28, 0x8a04bd030701000000b70900),
(28, 0x8a04be030701000000b80900),
(28, 0x8c04bd030701000000b70900),
(28, 0x8c04be030701000000b80900),
(28, 0x8904c0030701000000f51300),
(28, 0x8a04c2030701000000b70900),
(28, 0x8a04c3030701000000b80900),
(28, 0x8c04c2030701000000b70900),
(28, 0x8c04c3030701000000b80900),
(28, 0x8704c4030701000000ec1300),
(29, 0x7e04d9030601000000731b00),
(29, 0x7e04d9030701000000731b00),
(29, 0x7c04dc030601000000741b00),
(29, 0x7c04dd030601000000741b00),
(29, 0x7c04dc030701000000741b00),
(29, 0x7e04df030701000000ee1a00),
(29, 0x8004da030601000000b70900),
(29, 0x8004db030601000000b80900),
(30, 0x8304d9030601000000731b00),
(30, 0x8504da030601000000b70900),
(30, 0x8504db030601000000b80900),
(30, 0x8404d9030701000000731b00),
(30, 0x8304df030701000000ee1a00),
(32, 0x8a04da030601000000b70900),
(32, 0x8a04db030601000000b80900),
(32, 0x8804d9030701000000731b00),
(32, 0x8804df030701000000ee1a00),
(33, 0x8f04d9030601000000731b00),
(33, 0x8f04da030601000000b70900),
(33, 0x8f04db030601000000b80900),
(33, 0x8e04d9030701000000731b00),
(33, 0x8d04df030701000000ee1a00),
(34, 0x9304d9030601000000731b00),
(34, 0x9404da030601000000b70900),
(34, 0x9404db030601000000b80900),
(34, 0x9404d9030701000000731b00),
(34, 0x9204df030701000000ee1a00),
(35, 0x9804d9030601000000731b00),
(35, 0x9904db030601000000b80900),
(35, 0x9804d9030701000000731b00),
(35, 0x9804df030701000000ee1a00),
(36, 0x7104e9030701000000b70900),
(36, 0x7104ea030701000000b80900),
(36, 0x7504e8030701000000f71a00),
(37, 0x7104ef030701000000b70900),
(37, 0x7504ee030701000000f71a00),
(37, 0x7104f0030701000000b80900),
(38, 0x7104f5030701000000b70900),
(38, 0x7104f6030701000000b80900),
(38, 0x7504f4030701000000f71a00),
(39, 0x7104fb030701000000b70900),
(39, 0x7504fa030701000000f71a00),
(39, 0x7104fc030701000000b80900),
(40, 0x9204e7030701000000741b00),
(40, 0x9404e6030701000000731b00),
(40, 0x9604e7030701000000741b00),
(40, 0x9204e9030701000000f71a00),
(40, 0x9504ea030701000000b70900),
(40, 0x9504eb030701000000b80900),
(40, 0x9604e9030701000000f71a00),
(41, 0x9204ef030701000000f71a00),
(41, 0x9504ee030701000000b70900),
(41, 0x9504ef030701000000b80900),
(41, 0x9204f1030701000000741b00),
(42, 0x8f0416040701000000ee1a00),
(42, 0x8a041b040701000000e60200),
(42, 0x8a041c040701000000e70200),
(42, 0x93041b040701000000e60200),
(42, 0x93041c040701000000e70200),
(43, 0x3804fd030701000000731b00),
(43, 0x3a04fd030701000000ee1a00),
(43, 0x3c04fd030701000000731b00),
(43, 0x370402040601000000b70900),
(43, 0x370403040601000000b80900),
(44, 0x3e04fd030701000000731b00),
(44, 0x4004fd030701000000ee1a00),
(44, 0x4204fd030701000000731b00),
(44, 0x3e0402040601000000b70900),
(44, 0x3e0403040601000000b80900),
(45, 0x4404fd030701000000731b00),
(45, 0x4604fd030701000000ee1a00),
(45, 0x4804fd030701000000731b00),
(45, 0x440402040601000000b70900),
(45, 0x440403040601000000b80900),
(46, 0x4104f3030701000000741b00),
(46, 0x4504f3030601000000b70900),
(46, 0x4504f4030601000000b80900),
(46, 0x4404f6030701000000ee1a00),
(47, 0x4d04f5030701000000731b00),
(47, 0x4c04f8030701000000f71a00),
(47, 0x5104f6030601000000b70900),
(47, 0x5104f7030601000000b80900),
(3031, 0x6604c00307010000009b4400),
(3032, 0x6504cd0307010000009b4400),
(3033, 0x6504d60307010000009b4400),
(3034, 0x6504df0307010000009b4400),
(3035, 0xa504e4030701000000a44400),
(3036, 0xa904f00307010000009b4400),
(3037, 0xa904fa0307010000009b4400),
(3038, 0x9c04f90307010000009b4400),
(3039, 0x9604f90307010000009b4400),
(3040, 0x2a04c3030701000000a44400),
(3040, 0x2f04c3030701000000a44400),
(3040, 0x2904c4030601000000e60200),
(3040, 0x2904c5030601000000e70200),
(3040, 0x3004c4030601000000e60200),
(3040, 0x3004c5030601000000e70200),
(3041, 0xf903ba0305010000009b4400),
(3041, 0xf903ba0306010000009b4400),
(3041, 0xfd03bb030701000000a44400),
(3041, 0xf403bd030501000000e60200),
(3041, 0xf403be030501000000e70200),
(3041, 0xf403bd030601000000e60200),
(3041, 0xf403be030601000000e70200),
(3041, 0xf403bd030701000000e60200),
(3041, 0xf403be030701000000e70200),
(3041, 0xfc03bd030501000000e60200),
(3041, 0xfc03be030501000000e70200),
(3041, 0xfc03bd030701000000e60200),
(3041, 0xfc03be030701000000e70200),
(3042, 0x0d04a6030501000000e60200),
(3042, 0x0d04a7030501000000e70200),
(3042, 0x0d04a6030601000000e60200),
(3042, 0x0d04a7030601000000e70200),
(3042, 0x0d04a6030701000000e60200),
(3042, 0x0d04a7030701000000e70200),
(3042, 0x0904a90307010000009b4400),
(3043, 0xef03de030701000000e60200),
(3043, 0xef03df030701000000e70200),
(3043, 0xef03e4030701000000e60200),
(3043, 0xef03e5030701000000e70200),
(3043, 0xfb03e2030701000000a44400),
(3044, 0xef03de030601000000e60200),
(3044, 0xef03df030601000000e70200),
(3044, 0xef03e4030601000000e60200),
(3044, 0xef03e5030601000000e70200),
(3044, 0xfb03e1030601000000a44400),
(3045, 0x2104de030601000000e60200),
(3045, 0x2104df030601000000e70200),
(3045, 0x2904de030601000000a44400),
(3046, 0x2104de030701000000e60200),
(3046, 0x2104df030701000000e70200),
(3046, 0x2904dd030701000000a44400),
(3047, 0x3104cf030701000000e60200),
(3047, 0x3104d0030701000000e70200),
(3047, 0x3004d50307010000009b4400),
(3048, 0x3f04ba030601000000e60200),
(3048, 0x3f04bb030601000000e70200),
(3048, 0x3c04b90307010000009b4400),
(3048, 0x3f04bc030701000000e60200),
(3048, 0x3f04bd030701000000e70200),
(3049, 0x1904b3030401000000a44400),
(3049, 0x1704b70305010000009b4400),
(3049, 0x1904b4030401000000a44400),
(3050, 0x2004b3030401000000a44400),
(3050, 0x2004b4030401000000a44400),
(3050, 0x2204b70305010000009b4400),
(3051, 0xaa0dd5030601000000b70900),
(3051, 0xaa0dd6030601000000b80900),
(3051, 0xac0dd5030601000000b70900),
(3051, 0xac0dd6030601000000b80900),
(3051, 0xa90ddb030701000000067b00),
(3052, 0xb70de5030701000000737800),
(3052, 0xb80de7030501000000bd0900),
(3052, 0xb90de7030501000000be0900),
(3052, 0xbb0de7030501000000bd0900),
(3052, 0xb80de5030601000000b70900),
(3052, 0xb80de6030601000000b80900),
(3052, 0xbb0de4030601000000067b00),
(3052, 0xbc0de7030501000000be0900),
(3052, 0xbd0de5030601000000b70900),
(3052, 0xbd0de6030601000000b80900),
(3052, 0xbe0de5030701000000737800),
(3052, 0xba0de8030501000000717800),
(3053, 0xf10dca030701000000bd0900),
(3053, 0xf20dca030701000000be0900),
(3053, 0xf00dcc030701000000717800),
(3053, 0xf00dd0030701000000067b00),
(3054, 0xf70dca030701000000bd0900),
(3054, 0xf80dca030701000000be0900),
(3054, 0xf70dce030701000000bd0900),
(3054, 0xf80dcc030601000000737800),
(3054, 0xf80dce030701000000be0900),
(3054, 0xf90dcc030701000000737800),
(3054, 0xfd0dcd030701000000077b00),
(3055, 0xcf0df4030401000000077b00),
(3055, 0xcf0df4030701000000077b00),
(3055, 0xd00df1030501000000b70900),
(3055, 0xd00df2030501000000b80900),
(3055, 0xd30df1030501000000b70900),
(3055, 0xd30df2030501000000b80900),
(3055, 0xd00df1030601000000b70900),
(3055, 0xd00df2030601000000b80900),
(3055, 0xd30df1030601000000b70900),
(3055, 0xd30df2030601000000b80900),
(3055, 0xd50df1030301000000b70900),
(3055, 0xd50df2030301000000b80900),
(3055, 0xd70df1030301000000b70900),
(3055, 0xd70df2030301000000b80900),
(3055, 0xd40df0030701000000067b00),
(3055, 0xd00df6030501000000bd0900),
(3055, 0xd10df6030501000000be0900),
(3055, 0xd00df6030601000000bd0900),
(3055, 0xd10df6030601000000be0900),
(3055, 0xd10df5030801000000680600),
(3055, 0xd40df4030301000000077b00),
(3055, 0xd50df6030301000000bd0900),
(3055, 0xd60df6030301000000be0900),
(3055, 0xd40df4030501000000077b00),
(3055, 0xd40df4030601000000077b00),
(3055, 0xd20df9030801000000660600),
(3056, 0xc70df9030701000000067b00),
(3056, 0xc30dfd030501000000bd0900),
(3056, 0xc30dfd030601000000bd0900),
(3056, 0xc40dfd030501000000be0900),
(3056, 0xc50dfd030501000000bd0900),
(3056, 0xc60dfd030501000000be0900),
(3056, 0xc40dfd030601000000be0900),
(3057, 0xbe0d01040501000000bd0900),
(3057, 0xbf0d01040501000000be0900),
(3057, 0xbe0d01040601000000bd0900),
(3057, 0xbf0d01040601000000be0900),
(3057, 0xbd0d00040701000000077b00),
(3058, 0x1904b5030701000000a44400),
(3059, 0x2004b5030701000000a44400),
(3060, 0x0504c5030401000000e60200),
(3060, 0x0504c6030401000000e70200),
(3060, 0x0304c80304010000009b4400),
(3061, 0x0504cf0304010000009b4400),
(3061, 0x0104d2030401000000e60200),
(3061, 0x0104d3030401000000e70200),
(3061, 0x0904d2030401000000e60200),
(3061, 0x0904d3030401000000e70200),
(3062, 0xa90488030701000000ee1a00),
(3063, 0xa0048c030701000000f71a00),
(3064, 0x9f0498030701000000f71a00),
(3065, 0xaa04a2030701000000ee1a00),
(3066, 0xd104f10307010000007a0600),
(3067, 0xd104ed0307010000007a0600),
(3068, 0xca04f10307010000007a0600),
(3069, 0xc904ed0307010000007a0600),
(3070, 0xca04e8030501000000bb0900),
(3070, 0xca04e9030501000000bc0900),
(3070, 0xcf04ec0305010000007a0600),
(3070, 0xcf04ef0306010000007a0600),
(3070, 0xd404e8030501000000bb0900),
(3070, 0xd404e9030501000000bc0900),
(3070, 0xd004ec0305010000007a0600),
(3071, 0xcf04f30306010000007a0600),
(3071, 0xcf04f70305010000007a0600),
(3071, 0xca04fb030501000000bb0900),
(3071, 0xca04fc030501000000bc0900),
(3071, 0xd004f70305010000007a0600),
(3071, 0xd404fb030501000000bb0900),
(3071, 0xd404fc030501000000bc0900),
(3072, 0x8c0461040601000000032f00),
(3073, 0x8a0464040601000000012f00),
(3074, 0x920467040601000000032f00),
(3075, 0xb30496040701000000412000),
(3076, 0xae04980407010000003f2000),
(3077, 0xae049d0407010000003f2000),
(3078, 0xb004a1040701000000412000),
(3079, 0xb604a1040701000000412000),
(3080, 0x6804be040701000000e54f00),
(3081, 0x6a04bb040701000000dc4f00),
(3082, 0x7004bb040701000000dc4f00),
(3083, 0x7204be040701000000e54f00),
(3084, 0x9003f0040701000000412000),
(3085, 0x9603f0040701000000412000),
(3086, 0x9803f30407010000003f2000),
(3087, 0x9203fa0407010000003f2000),
(3088, 0x5d05a8040701000000071400),
(3089, 0x5905a4040701000000fe1300),
(3090, 0x5305ab040701000000fe1300),
(3091, 0x20050a050501000000077b00),
(3092, 0x230508050501000000067b00),
(3093, 0x290508050501000000067b00),
(3094, 0x28050c050501000000067b00),
(3098, 0xee03df070401000000371900),
(3098, 0xee03df070501000000371900),
(3098, 0xee03df070601000000371900),
(3098, 0xf203df070401000000371900),
(3098, 0xf203df070501000000371900),
(3098, 0xf203df070601000000371900),
(3098, 0xeb03e2070501000000381900),
(3098, 0xeb03e2070601000000381900),
(3098, 0xeb03e5070501000000381900),
(3098, 0xeb03e5070601000000381900),
(3098, 0xee03e7070401000000371900),
(3098, 0xef03e7070501000000371900),
(3098, 0xee03e7070601000000371900),
(3098, 0xf403e1070401000000381900),
(3098, 0xf403e3070601000000780600),
(3098, 0xf203e7070401000000371900),
(3098, 0xf103e70705010000007a0600),
(3098, 0xf203e7070601000000371900),
(3098, 0xf403e5070401000000381900),
(3098, 0xf403e5070601000000381900),
(3099, 0xfe03dd070501000000780600),
(3099, 0xfe03de070501000000381900),
(3099, 0xfe03dc070601000000381900),
(3099, 0xfe03dd070601000000780600),
(3099, 0x0104d9070501000000371900),
(3099, 0x0204d9070501000000371900),
(3099, 0x0104d9070601000000371900),
(3099, 0x0404dd070501000000381900),
(3099, 0x0404df070501000000381900),
(3099, 0x0104e1070501000000371900),
(3099, 0x0204e1070501000000371900),
(3100, 0xf903e6070501000000381900),
(3100, 0xf903e7070501000000381900),
(3100, 0xfb03e4070501000000371900),
(3100, 0xfe03e4070501000000371900),
(3100, 0xff03e6070501000000780600),
(3100, 0xfb03e9070501000000371900),
(3100, 0xfc03e90705010000007a0600),
(3101, 0xf503ed070401000000371900),
(3101, 0xf703ed070401000000371900),
(3101, 0xf503ed070501000000371900),
(3101, 0xf503ed070601000000371900),
(3101, 0xf703ed0706010000007a0600),
(3101, 0xf803ef070401000000780600),
(3101, 0xf903ed070501000000371900),
(3101, 0xf903ed070601000000371900),
(3101, 0xf303f0070401000000381900),
(3101, 0xf203f0070501000000381900),
(3101, 0xf203f0070601000000381900),
(3101, 0xf503f2070401000000371900),
(3101, 0xf703f2070401000000371900),
(3101, 0xf703f3070501000000371900),
(3101, 0xf803f0070401000000381900),
(3102, 0x080402080601000000381900),
(3102, 0x0a04000806010000007a0600),
(3102, 0x0b0400080601000000371900),
(3102, 0x080405080601000000381900),
(3102, 0x090407080601000000381900),
(3102, 0x0b0408080501000000371900),
(3102, 0x0c0408080501000000371900),
(3103, 0x0f04010806010000007a0600),
(3103, 0x0e0408080501000000371900),
(3103, 0x0f0408080501000000371900),
(3103, 0x100401080601000000371900),
(3103, 0x110403080601000000381900),
(3103, 0x100407080501000000381900),
(3103, 0x110404080501000000381900),
(3103, 0x100407080601000000381900),
(3104, 0x160403080601000000371900),
(3104, 0x1804030806010000007a0600),
(3104, 0x190403080601000000371900),
(3104, 0x1c0407080401000000381900),
(3104, 0x1c0405080501000000381900),
(3104, 0x15040a080501000000371900),
(3104, 0x18040a080401000000371900),
(3104, 0x1b040a080501000000371900),
(3104, 0x18040a080601000000371900),
(3104, 0x1c0409080501000000381900),
(3105, 0x200405080601000000371900),
(3105, 0x2104050806010000007a0600),
(3105, 0x2004090805010000007a0600),
(3105, 0x2004090806010000007a0600),
(3105, 0x20040b080601000000371900),
(3105, 0x21040b080601000000371900),
(3106, 0x1c04ff070601000000381900),
(3106, 0x2204ff070601000000381900),
(3106, 0x1e0400080601000000371900),
(3106, 0x2004000806010000007a0600),
(3107, 0x1204fa070501000000381900),
(3107, 0x1204fa070601000000780600),
(3107, 0x1404f8070501000000371900),
(3107, 0x1604f8070501000000371900),
(3107, 0x1404f8070601000000371900),
(3107, 0x1604f8070601000000371900),
(3107, 0x1304fc070601000000371900),
(3107, 0x1704fe070501000000371900),
(3107, 0x1604fe070601000000371900),
(3107, 0x1904fc070501000000780600),
(3107, 0x1804fe070601000000371900),
(3107, 0x1a04fd070601000000371900),
(3108, 0x1004f3070601000000780600),
(3108, 0x1304f0070601000000371900),
(3108, 0x1204f5070501000000371900),
(3108, 0x1004f4070601000000381900),
(3108, 0x1404f50705010000007a0600),
(3108, 0x1504f5070501000000371900),
(3108, 0x1604f4070501000000381900),
(3109, 0x1a04f2070501000000371900),
(3109, 0x1b04f2070601000000371900),
(3109, 0x1d04f2070501000000371900),
(3109, 0x1c04f20706010000007a0600),
(3109, 0x1d04f2070601000000371900),
(3109, 0x1e04f6070501000000371900),
(3109, 0x2004f5070501000000381900),
(3109, 0x2004f6070501000000381900),
(3110, 0x2404f2070501000000371900),
(3110, 0x2604f2070501000000371900),
(3110, 0x2504f20706010000007a0600),
(3110, 0x2204f4070501000000381900),
(3110, 0x2204f5070501000000381900),
(3110, 0x2504f60705010000007a0600),
(3110, 0x2704f4070501000000381900),
(3110, 0x2704f5070501000000381900),
(3111, 0x1b04e7070501000000371900),
(3111, 0x1e04e7070501000000371900),
(3111, 0x1904e9070501000000381900),
(3111, 0x1904ec070501000000381900),
(3111, 0x1b04ed0705010000007a0600),
(3111, 0x1904ee070601000000381900),
(3111, 0x1e04ed0706010000007a0600),
(3112, 0x1904e7070601000000381900),
(3112, 0x1c04e50706010000007a0600),
(3113, 0x2104e7070501000000371900),
(3113, 0x2304e7070501000000371900),
(3113, 0x2004e7070601000000371900),
(3113, 0x2204e70706010000007a0600),
(3113, 0x2304e7070601000000371900),
(3113, 0x2404e9070501000000381900),
(3113, 0x2304ed0705010000007a0600),
(3113, 0x2004ed070601000000371900),
(3113, 0x2404ec070501000000381900),
(3114, 0x2904ea070601000000381900),
(3114, 0x2b04e8070601000000371900),
(3114, 0x2d04ea070601000000780600),
(3114, 0x2f04e8070601000000371900),
(3114, 0x2904ed070601000000381900),
(3114, 0x3004e7070601000000381900),
(3114, 0x3204e60706010000007a0600),
(3114, 0x3304ec070501000000780600),
(3114, 0x3304ef070501000000371900),
(3114, 0x3004ee070601000000371900),
(3114, 0x3304ed070601000000780600),
(3115, 0x2e04df070501000000371900),
(3115, 0x3204de070501000000371900),
(3115, 0x2c04e1070501000000381900),
(3115, 0x3304e0070501000000381900),
(3115, 0x3304e1070501000000780600),
(3116, 0x2604ce0706010000007a0600),
(3116, 0x2704ce070601000000371900),
(3117, 0x2504c80706010000007a0600),
(3117, 0x2604c8070601000000371900),
(3118, 0x2a04c7070601000000780600),
(3118, 0x2c04cb070501000000371900),
(3118, 0x2d04cb0705010000007a0600),
(3118, 0x2d04ce070601000000371900),
(3118, 0x2e04ce0706010000007a0600),
(3118, 0x2f04ce070601000000371900),
(3118, 0x3104c7070501000000381900),
(3118, 0x3004cb070501000000371900),
(3118, 0x3104ca070501000000381900),
(3118, 0x3104cc070601000000381900),
(3119, 0x3b04c3070501000000371900),
(3119, 0x3c04c3070601000000371900),
(3119, 0x3904c6070501000000381900),
(3119, 0x3904c6070601000000381900),
(3119, 0x3d04c4070501000000381900),
(3119, 0x3d04c5070501000000780600),
(3119, 0x3e04c5070601000000780600),
(3119, 0x3b04c8070501000000371900),
(3119, 0x3b04c8070601000000371900),
(3120, 0x4304be070501000000371900),
(3120, 0x4304be070601000000371900),
(3120, 0x3f04c1070501000000381900),
(3120, 0x3f04c1070601000000381900),
(3120, 0x4104c2070501000000371900),
(3120, 0x4104c20706010000007a0600),
(3120, 0x4404c20705010000007a0600),
(3120, 0x4504c0070501000000381900),
(3120, 0x4404c20706010000007a0600),
(3120, 0x4504c1070601000000381900),
(3120, 0x4204c4070601000000361900),
(3120, 0x4504c4070601000000381900),
(3121, 0x4604c6070601000000371900),
(3121, 0x4204c8070601000000780600),
(3121, 0x4204c9070601000000381900),
(3121, 0x4404cb070601000000371900),
(3121, 0x4704c9070601000000371900),
(3122, 0x2004bf070601000000381900),
(3122, 0x2504bd070601000000371900),
(3122, 0x2804bd070601000000371900),
(3122, 0x2004c3070601000000381900),
(3122, 0x2304c0070601000000780600),
(3122, 0x2204c4070601000000371900),
(3122, 0x2604c5070601000000371900),
(3122, 0x2704c50706010000007a0600),
(3122, 0x2804c5070601000000371900),
(3123, 0x1504c5070601000000381900),
(3123, 0x1b04c4070601000000381900),
(3123, 0x1b04c5070601000000780600),
(3123, 0x1b04c6070601000000381900),
(3124, 0xf003cd070501000000371900),
(3124, 0xf103ce070501000000381900),
(3124, 0xf103cf070501000000780600),
(3124, 0xf003cd070601000000371900),
(3124, 0xf503cd070601000000371900),
(3124, 0xec03d1070601000000381900),
(3124, 0xed03d5070501000000371900),
(3124, 0xec03d4070601000000381900),
(3124, 0xf103d1070501000000381900),
(3124, 0xf103d3070501000000381900),
(3124, 0xf303d0070601000000371900),
(3124, 0xf503d00706010000007a0600),
(3124, 0xf003d6070501000000371900),
(3124, 0xf103d5070501000000780600),
(3124, 0xf103d6070501000000381900),
(3124, 0xf303d5070601000000780600),
(3125, 0x0504cc070501000000371900),
(3125, 0x0704cc070501000000371900),
(3125, 0x0504cc070601000000371900),
(3125, 0x0704cc070601000000371900),
(3125, 0x0a04cf070501000000381900),
(3125, 0x0104d0070501000000381900),
(3125, 0x0504d2070501000000371900),
(3125, 0x0604d20705010000007a0600),
(3125, 0x0704d2070501000000371900),
(3125, 0x0504d2070601000000371900),
(3125, 0x0604d20706010000007a0600),
(3125, 0x0704d2070601000000371900),
(3125, 0x0a04d0070501000000780600),
(3126, 0xfe03ee070601000000371900),
(3126, 0xff03ee0706010000007a0600),
(3126, 0x0104f2070601000000371900),
(3126, 0x0204f0070601000000381900),
(3127, 0x3704f20706010000007a0600),
(3127, 0x3b04f1070501000000381900),
(3127, 0x3804f1070601000000381900),
(3127, 0x3a04f0070601000000371900),
(3127, 0x3c04f2070501000000371900),
(3127, 0x3d04f3070501000000381900),
(3127, 0x3504f4070601000000381900),
(3127, 0x3504f6070601000000381900),
(3127, 0x3c04f6070501000000371900),
(3127, 0x3d04f6070501000000381900),
(3128, 0xc507700908010000006e1800),
(3129, 0xc90775090801000000701800),
(3130, 0xd50775090801000000701800),
(3131, 0xe10775090801000000701800),
(3132, 0xb00d1b0b0501000000741b00),
(3132, 0xb40d190b0501000000731b00),
(3132, 0xb50d1c0b0501000000ee1a00),
(3132, 0xb50d1f0b0501000000ee1a00),
(3133, 0xce0d130b0501000000731b00),
(3133, 0xcb0d150b0501000000741b00),
(3133, 0xcf0d170b0501000000ee1a00),
(3133, 0xcf0d1a0b0501000000ee1a00),
(3133, 0xd40d130b0501000000731b00),
(3134, 0xdb0d130b0501000000731b00),
(3134, 0xde0d130b0501000000731b00),
(3134, 0xd80d140b0501000000741b00),
(3134, 0xde0d170b0501000000ee1a00),
(3135, 0xe30d120b0401000000741b00),
(3135, 0xe50d100b0401000000731b00),
(3135, 0xe50d100b0501000000731b00),
(3135, 0xe60d130b0501000000ee1a00),
(3135, 0xe70d120b0501000000f71a00),
(3136, 0xdd0d0e0b0501000000741b00),
(3136, 0xdf0d0d0b0501000000ee1a00),
(3136, 0xe00d0a0b0501000000731b00),
(3136, 0xe40d0a0b0501000000731b00),
(3136, 0xe20d0c0b0501000000f71a00),
(3136, 0xe40d0d0b0501000000ee1a00),
(3137, 0xe40d1b0b0501000000ee1a00),
(3137, 0xe50d1b0b0501000000731b00),
(3137, 0xe80d1a0b0501000000731b00),
(3137, 0xe20d1e0b0501000000741b00),
(3137, 0xe60d1e0b0501000000f71a00),
(3137, 0xe80d1d0b0501000000ee1a00),
(3138, 0xcc10790d07010000008c1500),
(3139, 0xcd108a0d07010000008c1500),
(3140, 0xbe10800d07010000008a1500),
(3141, 0xbe107b0d07010000008a1500),
(3142, 0xb7107a0d07010000008c1500),
(3143, 0xc910700d07010000008a1500),
(3144, 0xcc106a0d07010000008a1500),
(3145, 0xc310650d07010000008a1500),
(3146, 0xc210650d06010000008c1500),
(3147, 0xce10910d07010000008a1500),
(3148, 0xa9108a0d07010000008c1500),
(3149, 0xa1105e0d07010000008c1500),
(3150, 0xa010670d07010000008c1500),
(3151, 0x9510680d07010000008c1500),
(3152, 0x91106c0d07010000008c1500),
(3153, 0x96106c0d07010000008c1500),
(3154, 0x8b10680d07010000008c1500),
(3155, 0x8110680d07010000008c1500),
(3156, 0x78106b0d07010000008a1500),
(3157, 0x7d106d0d07010000008a1500),
(3158, 0x7e10750d07010000008c1500),
(3159, 0x7d105d0d07010000008c1500),
(3160, 0x96105a0d07010000008a1500),
(3161, 0x55040a0405010000008f2400),
(3161, 0x56040a0405010000008f2400),
(3161, 0x51040f0404010000008f2400),
(3161, 0x53040d0405010000008d2400),
(3161, 0x56040d0403010000008f2400),
(3161, 0x56040f0404010000008f2400),
(3161, 0x5a040f0404010000008f2400),
(3161, 0x58040d0405010000008d2400),
(3161, 0x5604110403010000008f2400);

-- --------------------------------------------------------

--
-- Table structure for table `website_market`
--

CREATE TABLE `website_market` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_count` int NOT NULL DEFAULT '1',
  `item_attributes` text NOT NULL,
  `item_magical` int NOT NULL DEFAULT '0',
  `offer_type` int NOT NULL DEFAULT '0',
  `offer_cost` int NOT NULL DEFAULT '0',
  `offer_cost_count` int NOT NULL DEFAULT '0',
  `date` bigint DEFAULT NULL,
  `sold` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `znote`
--

CREATE TABLE `znote` (
  `id` int NOT NULL,
  `version` varchar(30) NOT NULL COMMENT 'Znote AAC version',
  `installed` int NOT NULL,
  `cached` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote`
--

INSERT INTO `znote` (`id`, `version`, `installed`, `cached`) VALUES
(1, '1.5_SVN', 1667689200, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `znote_accounts`
--

CREATE TABLE `znote_accounts` (
  `id` int NOT NULL,
  `account_id` int NOT NULL,
  `ip` bigint UNSIGNED NOT NULL,
  `created` int NOT NULL,
  `points` int DEFAULT '0',
  `cooldown` int DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '0',
  `active_email` tinyint NOT NULL DEFAULT '0',
  `activekey` int NOT NULL DEFAULT '0',
  `flag` varchar(20) NOT NULL,
  `secret` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote_accounts`
--

INSERT INTO `znote_accounts` (`id`, `account_id`, `ip`, `created`, `points`, `cooldown`, `active`, `active_email`, `activekey`, `flag`, `secret`) VALUES
(95, 13, 3232235777, 1667689200, 18, 1679899620, 0, 0, 0, '', NULL),
(105, 1, 0, 1667689200, 0, 0, 0, 0, 0, '', NULL),
(144, 12, 3232235777, 1667689200, 32932, 0, 0, 0, 0, '', NULL),
(612, 524, 637061377, 1708425048, 40, 0, 1, 0, 526637640, 'ar', NULL),
(613, 525, 1332659910, 1708425615, 0, 0, 1, 0, 755187450, 'pl', NULL),
(614, 526, 1332659910, 1708425930, 0, 0, 1, 0, 821929106, 'pl', NULL),
(615, 527, 1337971730, 1708431513, 0, 0, 1, 0, 881970347, 'pl', NULL),
(616, 528, 1268504764, 1708450343, 0, 0, 1, 0, 731691562, 'gb', NULL),
(617, 529, 3175465655, 1708454421, 0, 0, 1, 0, 348272802, 'br', NULL),
(618, 530, 3163822569, 1708455015, 0, 0, 1, 0, 614162521, 'se', NULL),
(619, 531, 1394099033, 1708466436, 0, 0, 1, 0, 863043737, 'pl', NULL),
(620, 532, 2619481745, 1708475155, 0, 0, 1, 0, 164972831, 'ca', NULL),
(621, 533, 1528197538, 1708528717, 0, 0, 1, 0, 250237938, 'de', NULL),
(622, 534, 1493963436, 1708543790, 0, 0, 1, 0, 324428034, 'de', NULL),
(623, 535, 1047701826, 1708561234, 0, 0, 1, 0, 375163763, 'eg', NULL),
(624, 536, 1394500151, 1708606778, 0, 0, 1, 0, 527501391, 'aq', NULL),
(625, 537, 2987977323, 1708711342, 0, 0, 1, 0, 994536219, 'hr', NULL),
(626, 538, 1047710060, 1708719565, 0, 0, 1, 0, 754186548, 'eg', NULL),
(627, 539, 3146270834, 1708914533, 0, 0, 1, 0, 615732500, 'mx', NULL),
(628, 540, 781495928, 1709682696, 0, 0, 1, 0, 488240702, 'pl', NULL),
(629, 541, 623881995, 1709761620, 0, 0, 1, 0, 797140838, 'pl', NULL),
(630, 542, 1169474803, 1710359604, 0, 0, 1, 0, 812451414, 'us', NULL),
(631, 543, 1599857628, 1710692611, 0, 0, 1, 0, 233890028, 'ad', NULL),
(632, 544, 3232248321, 1711203381, 20505, 0, 1, 0, 581033089, 'se', NULL),
(633, 545, 2999708926, 1711235552, 0, 0, 1, 0, 537910721, 'de', NULL),
(634, 546, 1393024774, 1711637954, 0, 0, 1, 0, 183242186, 'pl', NULL),
(635, 547, 3383037959, 1711756060, 0, 0, 1, 0, 840042519, 'mx', NULL),
(636, 548, 3185275861, 1711925831, 0, 0, 1, 0, 931655867, 'mx', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `znote_auction_player`
--

CREATE TABLE `znote_auction_player` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `original_account_id` int NOT NULL,
  `bidder_account_id` int NOT NULL,
  `time_begin` int NOT NULL,
  `time_end` int NOT NULL,
  `price` int NOT NULL,
  `bid` int NOT NULL,
  `deposit` int NOT NULL,
  `sold` tinyint NOT NULL,
  `claimed` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_changelog`
--

CREATE TABLE `znote_changelog` (
  `id` int NOT NULL,
  `text` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `report_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_deleted_characters`
--

CREATE TABLE `znote_deleted_characters` (
  `id` int NOT NULL,
  `original_account_id` int NOT NULL,
  `character_name` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `done` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote_deleted_characters`
--

INSERT INTO `znote_deleted_characters` (`id`, `original_account_id`, `character_name`, `time`, `done`) VALUES
(6, 13, 'Rekoms', '2024-03-17 18:58:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `znote_forum`
--

CREATE TABLE `znote_forum` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `access` tinyint NOT NULL,
  `closed` tinyint NOT NULL,
  `hidden` tinyint NOT NULL,
  `guild_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote_forum`
--

INSERT INTO `znote_forum` (`id`, `name`, `access`, `closed`, `hidden`, `guild_id`) VALUES
(1, 'General', 1, 0, 0, 0),
(2, 'Bosses', 1, 0, 0, 0),
(3, 'Trade', 1, 0, 0, 0),
(4, 'Changelog', 1, 0, 0, 0),
(5, 'Suggestions', 1, 0, 0, 0),
(6, 'Guild', 1, 0, 0, 5),
(7, 'Guild', 1, 0, 0, 2),
(8, 'Guild', 1, 0, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `znote_forum_posts`
--

CREATE TABLE `znote_forum_posts` (
  `id` int NOT NULL,
  `thread_id` int NOT NULL,
  `player_id` int NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `created` int NOT NULL,
  `updated` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_forum_threads`
--

CREATE TABLE `znote_forum_threads` (
  `id` int NOT NULL,
  `forum_id` int NOT NULL,
  `player_id` int NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `created` int NOT NULL,
  `updated` int NOT NULL,
  `sticky` tinyint NOT NULL,
  `hidden` tinyint NOT NULL,
  `closed` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_global_storage`
--

CREATE TABLE `znote_global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote_global_storage`
--

INSERT INTO `znote_global_storage` (`key`, `value`) VALUES
('23856', '26');

-- --------------------------------------------------------

--
-- Table structure for table `znote_guild_wars`
--

CREATE TABLE `znote_guild_wars` (
  `id` int NOT NULL,
  `limit` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_images`
--

CREATE TABLE `znote_images` (
  `id` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `desc` text NOT NULL,
  `date` int NOT NULL,
  `status` int NOT NULL,
  `image` varchar(50) NOT NULL,
  `delhash` varchar(30) NOT NULL,
  `account_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_news`
--

CREATE TABLE `znote_news` (
  `id` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `text` text NOT NULL,
  `date` int NOT NULL,
  `pid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_paygol`
--

CREATE TABLE `znote_paygol` (
  `id` int NOT NULL,
  `account_id` int NOT NULL,
  `price` int NOT NULL,
  `points` int NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `service_id` varchar(255) NOT NULL,
  `shortcode` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_paypal`
--

CREATE TABLE `znote_paypal` (
  `id` int NOT NULL,
  `txn_id` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accid` int NOT NULL,
  `price` int NOT NULL,
  `points` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote_paypal`
--

INSERT INTO `znote_paypal` (`id`, `txn_id`, `email`, `accid`, `price`, `points`) VALUES
(84, '0', 'Connection from IP: 173.0.81.65', 0, 0, 0),
(85, '51759020T8562681C', 'resul1996@hotmail.de', 545, 5, 200);

-- --------------------------------------------------------

--
-- Table structure for table `znote_players`
--

CREATE TABLE `znote_players` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `created` int NOT NULL,
  `hide_char` tinyint NOT NULL,
  `comment` varchar(255) NOT NULL,
  `exphist_lastexp` bigint UNSIGNED NOT NULL DEFAULT '0',
  `exphist1` bigint UNSIGNED NOT NULL DEFAULT '0',
  `exphist2` bigint UNSIGNED NOT NULL DEFAULT '0',
  `exphist3` bigint UNSIGNED NOT NULL DEFAULT '0',
  `exphist4` bigint UNSIGNED NOT NULL DEFAULT '0',
  `exphist5` bigint UNSIGNED NOT NULL DEFAULT '0',
  `exphist6` bigint UNSIGNED NOT NULL DEFAULT '0',
  `exphist7` bigint UNSIGNED NOT NULL DEFAULT '0',
  `onlinetimetoday` bigint NOT NULL DEFAULT '0',
  `onlinetime1` bigint NOT NULL DEFAULT '0',
  `onlinetime2` bigint NOT NULL DEFAULT '0',
  `onlinetime3` bigint NOT NULL DEFAULT '0',
  `onlinetime4` bigint NOT NULL DEFAULT '0',
  `onlinetime5` bigint NOT NULL DEFAULT '0',
  `onlinetime6` bigint NOT NULL DEFAULT '0',
  `onlinetime7` bigint NOT NULL DEFAULT '0',
  `onlinetimeall` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote_players`
--

INSERT INTO `znote_players` (`id`, `player_id`, `created`, `hide_char`, `comment`, `exphist_lastexp`, `exphist1`, `exphist2`, `exphist3`, `exphist4`, `exphist5`, `exphist6`, `exphist7`, `onlinetimetoday`, `onlinetime1`, `onlinetime2`, `onlinetime3`, `onlinetime4`, `onlinetime5`, `onlinetime6`, `onlinetime7`, `onlinetimeall`) VALUES
(1, 1, 1667689200, 0, '', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, 1667689200, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, 1667689200, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 4, 1667689200, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 5, 1667689200, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 6, 1667689200, 0, '', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 26, 1667689200, 0, '', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 162660),
(729, 726, 1708424600, 0, '', 442089540, 120614250, 59631135, 182800920, 79039035, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86520),
(730, 727, 1708425069, 0, '', 313711057, 130620340, 10276880, 110730471, 62079166, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111840),
(731, 728, 1708426251, 0, '', 81958560, 27866360, 37397060, 9821260, 6869680, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24780, 243960),
(732, 729, 1708431529, 0, '', 384200, 0, 0, 0, 384200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2640),
(733, 730, 1708433743, 0, '', 21247247, 0, 0, 0, 21247247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13440),
(734, 731, 1708450373, 0, '', 23445, 0, 0, 0, 23445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 480),
(735, 732, 1708452391, 0, '', 2638560, 0, 0, 0, 2638560, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7020),
(736, 733, 1708454778, 0, '-&amp;gt; Died by lag\\r\\n-&amp;gt; Equipped a dragonbone staff \\r\\n-&amp;gt; Ran to recover my items\\r\\n-&amp;gt; Dragonbone is bugged, 0 damage\\r\\n-&amp;gt; Died again trapped by dragons\\r\\n-&amp;gt; Game uninstalled\\r\\n\\r\\n(y)', 17174913, 6410730, 7025363, 3618520, 120300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55500),
(737, 734, 1708455027, 0, '', 4200, 0, 0, 0, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120),
(738, 735, 1708455162, 0, '', 2069467, 0, 0, 2030380, 39087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4980),
(739, 736, 1708460583, 0, '', 4200, 0, 0, 0, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60),
(740, 737, 1708466512, 0, '', 4200, 0, 0, 0, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(741, 738, 1708475190, 0, '', 6502830, 0, 0, 6502830, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11940),
(742, 739, 1708528732, 0, '', 68450, 0, 0, 68450, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 900),
(743, 740, 1708543824, 0, '', 1855700, 0, 0, 1855700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4140),
(744, 741, 1708561289, 0, '', 1934346, 1766984, 163162, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15180),
(745, 742, 1708596837, 0, '', 4111370, 3186020, 925350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18120),
(746, 743, 1708606820, 0, '', 4200, 0, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(747, 744, 1708711396, 0, '', 4200, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 240),
(748, 745, 1708719589, 0, '', 39105, 39105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 840),
(749, 746, 1708914566, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750, 747, 1709683227, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(751, 748, 1709683245, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(752, 749, 1709683252, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(753, 750, 1709683260, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(754, 751, 1709761689, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(755, 752, 1710093519, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12540),
(756, 753, 1710359629, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1320, 0, 0, 1620),
(757, 754, 1711203414, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35580),
(758, 755, 1711235567, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71940),
(759, 756, 1711237966, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120),
(760, 757, 1711402871, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3900),
(761, 758, 1711637973, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(762, 759, 1711638259, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(763, 760, 1711756096, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(764, 761, 1727434657, 0, '', 25245005, 0, 8249400, 16028980, 966625, 0, 0, 0, 60, 0, 1560, 9240, 2700, 0, 0, 0, 13560),
(765, 762, 1727689860, 0, '', 4200, 0, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(766, 763, 1727689907, 0, '', 4200, 0, 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `znote_player_reports`
--

CREATE TABLE `znote_player_reports` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `posx` int NOT NULL,
  `posy` int NOT NULL,
  `posz` int NOT NULL,
  `report_description` varchar(255) NOT NULL,
  `date` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_shop`
--

CREATE TABLE `znote_shop` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `itemid` int DEFAULT NULL,
  `count` int NOT NULL DEFAULT '1',
  `description` varchar(255) NOT NULL,
  `points` int NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_shop_logs`
--

CREATE TABLE `znote_shop_logs` (
  `id` int NOT NULL,
  `account_id` int NOT NULL,
  `player_id` int NOT NULL,
  `type` int NOT NULL,
  `itemid` int NOT NULL,
  `count` int NOT NULL,
  `points` int NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_shop_orders`
--

CREATE TABLE `znote_shop_orders` (
  `id` int NOT NULL,
  `account_id` int NOT NULL,
  `type` int NOT NULL,
  `itemid` int NOT NULL,
  `count` int NOT NULL,
  `time` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_tickets`
--

CREATE TABLE `znote_tickets` (
  `id` int NOT NULL,
  `owner` int NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `subject` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip` bigint NOT NULL,
  `creation` int NOT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `znote_tickets`
--

INSERT INTO `znote_tickets` (`id`, `owner`, `username`, `subject`, `message`, `ip`, `creation`, `status`) VALUES
(14, 541, 'bober', 'Cannot log in ', 'hello how long do i need to w8 till it connects? i hit log in button 18 h ago and it still say &quot;connecting to the game. Please wait.&quot;', 623881995, 1709762379, 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `znote_tickets_replies`
--

CREATE TABLE `znote_tickets_replies` (
  `id` int NOT NULL,
  `tid` int NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_visitors`
--

CREATE TABLE `znote_visitors` (
  `id` int NOT NULL,
  `ip` bigint NOT NULL,
  `value` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `znote_visitors_details`
--

CREATE TABLE `znote_visitors_details` (
  `id` int NOT NULL,
  `ip` bigint NOT NULL,
  `time` int NOT NULL,
  `type` tinyint NOT NULL,
  `account_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `param1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `param2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `param3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `param4` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `param5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `param6` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `param7` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `delete_it` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `z_ots_comunication`
--

INSERT INTO `z_ots_comunication` (`id`, `name`, `type`, `action`, `param1`, `param2`, `param3`, `param4`, `param5`, `param6`, `param7`, `delete_it`) VALUES
(1, 'Rekoms', 'login', 'give_item', '22118', '100', '0', '0', 'item', '150 Tibia Coins', '', 1),
(2, 'Chrallaz', 'login', 'give_item', '22118', '100', '0', '0', 'item', '150 Tibia Coins', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int NOT NULL,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end` int NOT NULL DEFAULT '0',
  `start` int NOT NULL DEFAULT '0',
  `answers` int NOT NULL DEFAULT '0',
  `votes_all` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int NOT NULL,
  `answer_id` int NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `z_shop_categories`
--

CREATE TABLE `z_shop_categories` (
  `id` int NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `z_shop_categories`
--

INSERT INTO `z_shop_categories` (`id`, `name`, `description`, `hidden`) VALUES
(1, 'item', 'Items', 0),
(2, 'addon', 'Addons', 0),
(3, 'mount', 'Mounts', 0),
(4, 'pacc', 'Premium Account', 0),
(5, 'container', 'Containers', 0),
(6, 'other', 'Other', 0);

-- --------------------------------------------------------

--
-- Table structure for table `z_shop_history`
--

CREATE TABLE `z_shop_history` (
  `id` int NOT NULL,
  `comunication_id` int NOT NULL DEFAULT '0',
  `to_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '0',
  `to_account` int NOT NULL DEFAULT '0',
  `from_nick` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `from_account` int NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '0',
  `offer_id` int NOT NULL DEFAULT '0',
  `trans_state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trans_start` int NOT NULL DEFAULT '0',
  `trans_real` int NOT NULL DEFAULT '0',
  `is_pacc` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `z_shop_history`
--

INSERT INTO `z_shop_history` (`id`, `comunication_id`, `to_name`, `to_account`, `from_nick`, `from_account`, `price`, `offer_id`, `trans_state`, `trans_start`, `trans_real`, `is_pacc`) VALUES
(1, 1, 'Rekoms', 13, 'Anonymous', 13, 150, 5, 'wait', 1664222381, 0, 0),
(2, 2, 'Chrallaz', 12, 'Anonymous', 13, 150, 5, 'wait', 1664224429, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `itemid1` int NOT NULL DEFAULT '0',
  `count1` int NOT NULL DEFAULT '0',
  `itemid2` int NOT NULL DEFAULT '0',
  `count2` int NOT NULL DEFAULT '0',
  `offer_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `offer_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `offer_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_unique` (`name`);

--
-- Indexes for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_viplist_unique` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `boosted_boss`
--
ALTER TABLE `boosted_boss`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `boosted_creature`
--
ALTER TABLE `boosted_creature`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  ADD PRIMARY KEY (`paymentID`),
  ADD UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  ADD KEY `boxID` (`boxID`),
  ADD KEY `boxType` (`boxType`),
  ADD KEY `userID` (`userID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `amount` (`amount`),
  ADD KEY `amountUSD` (`amountUSD`),
  ADD KEY `coinLabel` (`coinLabel`),
  ADD KEY `unrecognised` (`unrecognised`),
  ADD KEY `addr` (`addr`),
  ADD KEY `txID` (`txID`),
  ADD KEY `txDate` (`txDate`),
  ADD KEY `txConfirmed` (`txConfirmed`),
  ADD KEY `txCheckDate` (`txCheckDate`),
  ADD KEY `processed` (`processed`),
  ADD KEY `processedDate` (`processedDate`),
  ADD KEY `recordCreated` (`recordCreated`),
  ADD KEY `key1` (`boxID`,`orderID`),
  ADD KEY `key2` (`boxID`,`orderID`,`userID`);

--
-- Indexes for table `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `forge_history`
--
ALTER TABLE `forge_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `global_storage_unique` (`key`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guilds_name_unique` (`name`),
  ADD UNIQUE KEY `guilds_owner_unique` (`ownerid`);

--
-- Indexes for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guildwar_kills_unique` (`warid`),
  ADD KEY `warid` (`warid`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indexes for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `myaac_account_actions`
--
ALTER TABLE `myaac_account_actions`
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_config`
--
ALTER TABLE `myaac_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `myaac_faq`
--
ALTER TABLE `myaac_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_forum`
--
ALTER TABLE `myaac_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_menu`
--
ALTER TABLE `myaac_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_news`
--
ALTER TABLE `myaac_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_pages`
--
ALTER TABLE `myaac_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `myaac_spells`
--
ALTER TABLE `myaac_spells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `myaac_videos`
--
ALTER TABLE `myaac_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myaac_visitors`
--
ALTER TABLE `myaac_visitors`
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `myaac_weapons`
--
ALTER TABLE `myaac_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `players_unique` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Indexes for table `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_depotitems_unique` (`player_id`,`sid`);

--
-- Indexes for table `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_inboxitems_unique` (`player_id`,`sid`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD UNIQUE KEY `player_namelocks_unique` (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Indexes for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_rewards_unique` (`player_id`,`sid`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Indexes for table `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `roulette_plays`
--
ALTER TABLE `roulette_plays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Indexes for table `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `website_market`
--
ALTER TABLE `website_market`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote`
--
ALTER TABLE `znote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_accounts`
--
ALTER TABLE `znote_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_auction_player`
--
ALTER TABLE `znote_auction_player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_changelog`
--
ALTER TABLE `znote_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_deleted_characters`
--
ALTER TABLE `znote_deleted_characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_forum`
--
ALTER TABLE `znote_forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_forum_posts`
--
ALTER TABLE `znote_forum_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_forum_threads`
--
ALTER TABLE `znote_forum_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_global_storage`
--
ALTER TABLE `znote_global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `znote_guild_wars`
--
ALTER TABLE `znote_guild_wars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_images`
--
ALTER TABLE `znote_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_news`
--
ALTER TABLE `znote_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_paygol`
--
ALTER TABLE `znote_paygol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_paypal`
--
ALTER TABLE `znote_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_players`
--
ALTER TABLE `znote_players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_player_reports`
--
ALTER TABLE `znote_player_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_shop`
--
ALTER TABLE `znote_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_shop_logs`
--
ALTER TABLE `znote_shop_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_shop_orders`
--
ALTER TABLE `znote_shop_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_tickets`
--
ALTER TABLE `znote_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_tickets_replies`
--
ALTER TABLE `znote_tickets_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_visitors`
--
ALTER TABLE `znote_visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `znote_visitors_details`
--
ALTER TABLE `znote_visitors_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_categories`
--
ALTER TABLE `z_shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_history`
--
ALTER TABLE `z_shop_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;

--
-- AUTO_INCREMENT for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coins_transactions`
--
ALTER TABLE `coins_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  MODIFY `paymentID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2110;

--
-- AUTO_INCREMENT for table `forge_history`
--
ALTER TABLE `forge_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146369;

--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3687;

--
-- AUTO_INCREMENT for table `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myaac_config`
--
ALTER TABLE `myaac_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `myaac_faq`
--
ALTER TABLE `myaac_faq`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myaac_forum`
--
ALTER TABLE `myaac_forum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `myaac_menu`
--
ALTER TABLE `myaac_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myaac_news`
--
ALTER TABLE `myaac_news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myaac_pages`
--
ALTER TABLE `myaac_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `myaac_spells`
--
ALTER TABLE `myaac_spells`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myaac_videos`
--
ALTER TABLE `myaac_videos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=764;

--
-- AUTO_INCREMENT for table `player_hirelings`
--
ALTER TABLE `player_hirelings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roulette_plays`
--
ALTER TABLE `roulette_plays`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1456;

--
-- AUTO_INCREMENT for table `website_market`
--
ALTER TABLE `website_market`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `znote`
--
ALTER TABLE `znote`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `znote_accounts`
--
ALTER TABLE `znote_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=637;

--
-- AUTO_INCREMENT for table `znote_auction_player`
--
ALTER TABLE `znote_auction_player`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `znote_changelog`
--
ALTER TABLE `znote_changelog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_deleted_characters`
--
ALTER TABLE `znote_deleted_characters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `znote_forum`
--
ALTER TABLE `znote_forum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `znote_forum_posts`
--
ALTER TABLE `znote_forum_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `znote_forum_threads`
--
ALTER TABLE `znote_forum_threads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `znote_guild_wars`
--
ALTER TABLE `znote_guild_wars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_images`
--
ALTER TABLE `znote_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_news`
--
ALTER TABLE `znote_news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_paygol`
--
ALTER TABLE `znote_paygol`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_paypal`
--
ALTER TABLE `znote_paypal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `znote_players`
--
ALTER TABLE `znote_players`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- AUTO_INCREMENT for table `znote_player_reports`
--
ALTER TABLE `znote_player_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_shop`
--
ALTER TABLE `znote_shop`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_shop_logs`
--
ALTER TABLE `znote_shop_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_shop_orders`
--
ALTER TABLE `znote_shop_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_tickets`
--
ALTER TABLE `znote_tickets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `znote_tickets_replies`
--
ALTER TABLE `znote_tickets_replies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `znote_visitors`
--
ALTER TABLE `znote_visitors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znote_visitors_details`
--
ALTER TABLE `znote_visitors_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `z_shop_categories`
--
ALTER TABLE `z_shop_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `z_shop_history`
--
ALTER TABLE `z_shop_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_bans_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_history_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD CONSTRAINT `coins_transactions_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD CONSTRAINT `daily_reward_history_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forge_history`
--
ALTER TABLE `forge_history`
  ADD CONSTRAINT `forge_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ownerid_fk` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_warid_fk` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_rank_fk` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `houses_list_house_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_players_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD CONSTRAINT `player_hirelings_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_players2_fk` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD CONSTRAINT `prey_slots_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roulette_plays`
--
ALTER TABLE `roulette_plays`
  ADD CONSTRAINT `roulette_plays_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_account_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;