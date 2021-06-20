-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.4.6-MariaDB
-- PHP 版本： 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `brian`
--

-- --------------------------------------------------------

--
-- 資料表結構 `account`
--

CREATE TABLE `account` (
  `Name` varchar(8) DEFAULT NULL,
  `Sex` varchar(4) DEFAULT NULL,
  `Birthday` varchar(8) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Account` varchar(10) DEFAULT NULL,
  `Password` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `account`
--

INSERT INTO `account` (`Name`, `Sex`, `Birthday`, `Phone`, `Address`, `Account`, `Password`) VALUES
('黃道彥', '男', '20010215', '908576215', '台北市內湖區金湖路328號二樓', 'admin', '1234'),
('王圓明', '男', '20010314', '301415926', '桃園市中壢區普忠路206號三樓', 'mrpi', '3014'),
('黃尤拉', '男', '20010207', '271828180', '桃園市中壢區普忠路206號四樓', 'mryu', '2718'),
('張亞佛', '男', '19750705', '602214076', '桃園市中壢區中北路200號二樓', 'mrya', '6022'),
('朴朗客', '男', '19800801', '662607015', '桃園市中壢區普忠路200號三樓', 'mypu', '6626');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
