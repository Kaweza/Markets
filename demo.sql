-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2023 at 06:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `biashara_view`
-- (See below for the actual view)
--
CREATE TABLE `biashara_view` (
`Mfanyabiashara_ID` int(11)
,`NIN` varchar(24)
,`Jina_la_Kwanza` varchar(15)
,`Jina_Kati` varchar(15)
,`Jina_Mwisho` varchar(15)
,`Namba_ya_Simu` int(11)
,`Jinsi` text
,`Umri` int(11)
,`Street` varchar(15)
,`Ward` varchar(15)
,`MarketType` varchar(20)
,`infrastructure` varchar(20)
,`date_of_rent` date
,`date_of_return` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `biasha_view`
-- (See below for the actual view)
--
CREATE TABLE `biasha_view` (
`Mfanyabiashara_ID` int(11)
,`NIN` varchar(24)
,`Jina_la_Kwanza` varchar(15)
,`Jina_Kati` varchar(15)
,`Jina_Mwisho` varchar(15)
,`Namba_ya_Simu` int(11)
,`Jinsi` text
,`Umri` int(11)
,`Street` varchar(15)
,`Ward` varchar(15)
,`MarketType` varchar(20)
,`infrastructure` varchar(20)
,`date_of_rent` date
,`date_of_return` date
);

-- --------------------------------------------------------

--
-- Table structure for table `markets`
--

CREATE TABLE `markets` (
  `name` text NOT NULL,
  `imageURL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `markets`
--

INSERT INTO `markets` (`name`, `imageURL`) VALUES
('SOKO LA MITWERO', 'lindi 1.jpg'),
('SOKO LA NAPA', 'photo 2.jpg'),
('SOKO LA MANGANO', 'lindi 2.jpg'),
('SOKO LA MWENGE', 'lindi 1.jpg'),
('SOKO LA MBUYUNI', 'lindi 1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(255) NOT NULL,
  `name` text NOT NULL,
  `Role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `name`, `Role`, `email`, `Password`) VALUES
(26, 'mwarami athumani bakari', 'admin', 'mudi@gmail.com', '123456'),
(27, 'Mohamedi omari kaweza', 'user', 'hemedi@gmail.com', '321'),
(28, 'Mohamedi omari kaweza', 'user', 'hemedikaweza@gmail.com', '1234'),
(29, 'Mohamedi omari kaweza', 'user', 'kaweza@gmail.com', 'dscychvhuk'),
(30, 'Mohamedi omari kaweza', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(31, 'Mohamedi omari kaweza', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(32, 'Mohamedi omari kaweza', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(33, 'mwarami athumani bakari', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(34, 'mwarami athumani bakari', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(35, 'mwarami athumani bakari', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(36, 'mwarami athumani bakari', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(37, 'Mohamedi omari kaweza', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(38, 'Mohamedi omari kaweza', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(39, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(40, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(41, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(42, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(43, 'Mohamedi omari kaweza', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(44, 'Mohamedi omari kaweza', 'admin', 'kaweza@gmail.com', 'dscychvhuk'),
(45, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(46, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(47, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(48, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(49, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(50, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(51, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(52, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(53, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(54, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(55, 'mwarami athumani bakari', 'admin', 'mudi@gmail.com', '123456'),
(56, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(57, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(58, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(59, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(60, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(61, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(62, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(63, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(64, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(65, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(66, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(67, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(68, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(69, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(70, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(71, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(72, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(73, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(74, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(75, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456'),
(76, 'Mohamedi omari kaweza', 'admin', 'mudi@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `wafanyabiashara`
--

CREATE TABLE `wafanyabiashara` (
  `Mfanyabiashara_ID` int(11) NOT NULL,
  `NIN` varchar(24) NOT NULL,
  `Jina_la_Kwanza` varchar(15) NOT NULL,
  `Jina_Kati` varchar(15) NOT NULL,
  `Jina_Mwisho` varchar(15) NOT NULL,
  `Namba_ya_Simu` int(11) NOT NULL,
  `Jinsi` text NOT NULL,
  `Umri` int(11) NOT NULL,
  `Street` varchar(15) NOT NULL,
  `Ward` varchar(15) NOT NULL,
  `MarketType` varchar(20) NOT NULL,
  `business` varchar(30) NOT NULL,
  `infrastructure` varchar(20) NOT NULL,
  `date_of_rent` date NOT NULL,
  `date_of_return` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wafanyabiashara`
--

INSERT INTO `wafanyabiashara` (`Mfanyabiashara_ID`, `NIN`, `Jina_la_Kwanza`, `Jina_Kati`, `Jina_Mwisho`, `Namba_ya_Simu`, `Jinsi`, `Umri`, `Street`, `Ward`, `MarketType`, `business`, `infrastructure`, `date_of_rent`, `date_of_return`) VALUES
(37, '12345678', 'jamali', 'mwarami', 'kasuyku', 654676542, 'Male', 56, 'ngoni', 'kimboji', 'kariakoo', 'samaki', 'table', '2023-09-29', '2023-09-29'),
(38, '12345678', 'john', 'jafari', 'kipandu', 766262273, 'Male', 45, 'kongoro', 'kimboji', 'Fisi', 'mchele', 'table', '2023-09-28', '2023-09-29'),
(39, '12345678', 'john', 'jafari', 'kipandu', 766262273, 'Male', 45, 'kongoro', 'kimboji', 'Fisi', 'mchele', 'table', '2023-09-28', '2023-09-29'),
(40, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(41, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(42, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(43, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(44, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(45, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(46, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(47, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(48, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(49, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(50, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(51, '12345678', 'mariam', 'mwarami', 'kipandu', 654676542, 'Female', 56, 'mbombwe', 'mangondeni', 'kariakoo', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(52, '2345', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 45, 'mbombwe', 'london', 'sabasaba', 'mchele', 'cage', '2023-09-22', '2023-09-27'),
(53, '1234567890', 'mariam', 'OMARI', 'kipandu', 654676545, 'Female', 56, 'kongoro', 'kimboji', 'sabasaba', 'mchele', 'table', '2023-09-28', '2023-09-15'),
(54, '12345678', 'ashimu', 'abasi', 'mwiru', 654676542, 'Male', 45, 'mbombwe', 'mangondeni', 'samaki', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(55, '10203040', 'ashimu', 'abasi', 'mwiru', 654676542, 'Male', 45, 'mbombwe', 'mangondeni', 'samaki', 'mchele', 'other', '2023-09-21', '2023-09-21'),
(56, '10203040', 'athumani', 'bakari', 'ndondo', 766262273, 'Male', 34, 'mbweni', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-27', '2023-08-31'),
(57, '12345678', 'john', 'dulla', 'ngomba', 654676542, 'Male', 24, 'naogocha', 'Mbagala', 'kuu', 'samaki', 'frame', '2023-09-22', '2023-09-30'),
(58, '12345678', 'john', 'dulla', 'ngomba', 654676542, 'Male', 24, 'naogocha', 'Mbagala', 'kuu', 'samaki', 'frame', '2023-09-22', '2023-09-30'),
(59, '12345678901234567890', 'mariam', 'OMARI', 'kipandu', 766262273, 'Female', 23, 'mbombwe', 'mangondeni', 'Fisi', 'mchele', 'cage', '2023-09-19', '2023-09-20'),
(60, '12345677', 'rahma', 'jafari', 'ngomba', 654676545, 'Female', 23, 'ngoni', 'Mbagala', 'sabasaba', 'mchele', 'cage', '2023-09-06', '2023-09-14'),
(61, '12345677', 'rahma', 'jafari', 'ngomba', 654676545, 'Female', 23, 'ngoni', 'Mbagala', 'sabasaba', 'mchele', 'cage', '2023-09-06', '2023-09-14'),
(62, '12345678', 'mariam', 'jafari', 'ngomba', 766262273, 'Female', 45, 'mbombwe', 'mangondeni', 'Fisi', 'mchele', 'table', '2023-09-21', '2023-09-29'),
(63, '12345678', 'aruna', 'jonson', 'ngomba', 654676545, 'Male', 56, 'manyoni', 'kimboji', 'samaki', 'samaki', 'table', '2023-09-20', '2023-09-30'),
(64, '12345678', 'aruna', 'jonson', 'ngomba', 654676545, 'Male', 56, 'manyoni', 'kimboji', 'samaki', 'samaki', 'table', '2023-09-20', '2023-09-30'),
(65, '12345678', 'aruna', 'jonson', 'ngomba', 654676545, 'Male', 56, 'manyoni', 'kimboji', 'samaki', 'samaki', 'table', '2023-09-20', '2023-09-30'),
(66, '12345678', 'aruna', 'jonson', 'ngomba', 654676545, 'Male', 56, 'manyoni', 'kimboji', 'samaki', 'samaki', 'table', '2023-09-20', '2023-09-30'),
(67, '12345678', 'mariam', 'dulla', 'abasi', 654676542, 'Female', 67, 'mbweni', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-27', '2023-08-30'),
(68, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Female', 54, 'naogocha', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-28', '2023-09-20'),
(69, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-29', '2023-09-29'),
(70, '12345678', 'mariam', 'jafari', 'kipandu', 654676545, 'Male', 56, 'mbombwe', 'london', 'kuu', 'samaki', 'table', '2023-09-28', '2023-09-29'),
(71, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-12', '2023-09-08'),
(72, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-12', '2023-09-08'),
(73, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-12', '2023-09-08'),
(74, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-12', '2023-09-08'),
(75, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-12', '2023-09-08'),
(76, '12345678', 'mariam', 'jafari', 'kipandu', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-12', '2023-09-08'),
(77, '12345678', 'mariam', 'jafari', 'KAWEZA', 654676542, 'Male', 23, 'mbombwe', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-19', '2023-09-05'),
(78, '12345678', 'mariam', 'jafari', 'KAWEZA', 654676542, 'Male', 23, 'mbombwe', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-19', '2023-09-05'),
(79, '12345678', 'mariam', 'jafari', 'KAWEZA', 654676542, 'Male', 23, 'mbombwe', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-19', '2023-09-05'),
(80, '12345678', 'mariam', 'jafari', 'KAWEZA', 654676542, 'Male', 23, 'mbombwe', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-19', '2023-09-05'),
(81, '12345678', 'mariam', 'jafari', 'KAWEZA', 654676542, 'Male', 23, 'mbombwe', 'kimboji', 'Fisi', 'mchele', 'cage', '2023-09-19', '2023-09-05'),
(82, '12345678', 'mariam', 'jafari', 'kipandu', 766262273, 'Male', 23, 'naogocha', 'mangondeni', 'sabasaba', 'samaki', 'table', '2023-10-06', '2023-09-04'),
(83, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 789675623, 'Female', 45, 'kongoro', 'kimboji', 'kuu', 'samaki', 'frame', '2023-09-29', '2023-09-15'),
(84, '12348673156521272341', 'mariam', 'jafari', 'kasuyku', 766262273, 'Female', 28, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-29', '2023-09-14'),
(85, '12348673156521272341', 'mariam', 'jafari', 'kasuyku', 766262273, 'Female', 28, 'mbombwe', 'kimboji', 'sabasaba', '', 'cage', '2023-09-29', '2023-09-14'),
(86, '12348673156521272341', 'mariam', 'jafari', 'kasuyku', 766262273, 'Female', 28, 'mbombwe', 'kimboji', 'sabasaba', '', 'cage', '2023-09-29', '2023-09-14'),
(87, '12348673156521272341', 'mariam', 'jafari', 'kasuyku', 766262273, 'Female', 28, 'mbombwe', 'kimboji', 'sabasaba', '', 'cage', '2023-09-29', '2023-09-14'),
(88, '12348673156521272341', 'mariam', 'jafari', 'kasuyku', 766262273, 'Female', 28, 'mbombwe', 'kimboji', 'sabasaba', '', 'cage', '2023-09-29', '2023-09-14'),
(89, '12348673156521272341', 'mariam', 'jafari', 'kasuyku', 766262273, 'Female', 28, 'mbombwe', 'kimboji', 'sabasaba', 'mchele', 'cage', '2023-09-29', '2023-09-14'),
(90, '12345678', 'mariam', 'jafari', 'kipandu', 766262273, 'Male', 77, 'naogocha', 'kimboji', 'kariakoo', '', 'chini', '2023-09-21', '2023-09-28'),
(91, '12345678', 'mariam', 'jafari', 'kipandu', 766262273, 'Male', 77, 'naogocha', 'kimboji', 'kariakoo', '', 'chini', '2023-09-21', '2023-09-28'),
(92, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 766262273, 'Female', 45, 'mbombwe', 'chumo B', 'feri', '', 'frame', '2023-09-30', '2023-09-14'),
(93, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 766262273, 'Female', 45, 'mbombwe', 'chumo B', 'feri', '', 'frame', '2023-09-30', '2023-09-14'),
(94, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 766262273, 'Female', 45, 'mbombwe', 'chumo B', 'feri', '', 'frame', '2023-09-30', '2023-09-14'),
(95, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 766262273, 'Female', 45, 'mbombwe', 'chumo B', 'feri', '', 'frame', '2023-09-30', '2023-09-14'),
(96, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 766262273, 'Female', 45, 'mbombwe', 'chumo B', 'feri', '', 'frame', '2023-09-30', '2023-09-14'),
(97, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 766262273, 'Female', 45, 'mbombwe', 'chumo B', 'feri', '', 'frame', '2023-09-30', '2023-09-14'),
(98, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676512, 'Male', 45, 'manyoni', 'magogoni', 'Fisi', '', 'frame', '2023-09-29', '2023-09-30'),
(99, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676512, 'Male', 45, 'manyoni', 'magogoni', 'Fisi', '', 'frame', '2023-09-29', '2023-09-30'),
(100, '12345678456425000123', 'mariam', 'jafari', 'kipandu', 654676542, 'Male', 23, 'manyoni', 'magogoni', 'Fisi', 'mchele', 'cage', '2023-09-28', '2023-09-20'),
(101, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 789675623, 'Female', 34, 'kongoro', 'kimboji', 'sangala', 'mchele', 'cage', '2023-09-29', '2023-09-22'),
(102, '12345678900987654321', 'john', 'jafari', 'kipandu', 789675623, 'Male', 24, 'mbombwe', 'kimboji', 'SOKO LA MTANDA', 'mchele', 'cage', '2023-09-28', '2023-08-31'),
(103, '12345678901234567890', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 34, 'naogocha', 'kimboji', 'soko_la_mtanda', 'mchele', 'cage', '2023-09-22', '2023-09-13'),
(104, '12345678900987654321', 'john', 'jafari', 'KAWEZA', 789675623, 'Male', 34, 'mbombwe', 'kimboji', 'soko_la_napa', 'samaki', 'table', '2023-09-22', '2023-09-22'),
(105, '12345678564250000123', 'mariam', 'jafari', 'kipandu', 789675623, 'Female', 24, 'mbombwe', 'kimboji', 'soko la mitwero', 'mchele', 'table', '2023-09-20', '2023-09-09'),
(106, '12345678900987654321', 'aruna', 'jafari', 'kipandu', 789675623, 'Male', 43, 'kongoro', 'chumo B', 'soko la mangano', 'samaki', 'frame', '2023-09-28', '2023-09-09'),
(107, '12345678900987654321', 'jamali', 'dulla', 'ngomba', 654676545, 'Male', 34, 'naogocha', 'magogoni', 'soko la napa', 'mchele', 'frame', '2023-09-27', '2023-09-30'),
(108, '12345678900987654321', 'rahma', 'mwarami', 'kasuyku', 789675623, 'Female', 24, 'ngoni', 'Mbagala', 'soko la mitwero', 'mchele', 'cage', '2023-09-15', '2023-09-08'),
(109, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 34, 'mbombwe', 'kimboji', 'fisi', 'mchele', 'cage', '2023-09-21', '2023-09-30'),
(110, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 34, 'mbombwe', 'kimboji', 'fisi', 'mchele', 'cage', '2023-09-21', '2023-09-30'),
(111, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 34, 'mbombwe', 'kimboji', 'fisi', 'mchele', 'cage', '2023-09-21', '2023-09-30'),
(112, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 55, 'mbombwe', 'mangondeni', 'feri', 'mchele', 'cage', '2023-09-27', '2023-09-09'),
(113, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 55, 'mbombwe', 'mangondeni', 'feri', 'mchele', 'cage', '2023-09-27', '2023-09-09'),
(114, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 55, 'mbombwe', 'mangondeni', 'feri', 'mchele', 'cage', '2023-09-27', '2023-09-09'),
(115, '12345678900987654321', 'john', 'jafari', 'kipandu', 766262273, 'Male', 34, 'mbombwe', 'Mbagala', 'kuu', 'samaki', 'table', '2023-09-21', '2023-09-30'),
(116, '12345678900987654321', 'john', 'jafari', 'kipandu', 766262273, 'Male', 34, 'mbombwe', 'Mbagala', 'kuu', 'samaki', 'table', '2023-09-21', '2023-09-30'),
(117, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676542, 'Female', 34, 'mbombwe', 'mangondeni', 'fisi', 'samaki', 'cage', '2023-09-12', '2023-09-30'),
(118, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676542, 'Female', 34, 'mbombwe', 'mangondeni', 'fisi', 'samaki', 'cage', '2023-09-12', '2023-09-30'),
(119, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(120, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(121, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(122, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(123, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(124, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(125, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(126, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(127, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(128, '12345678900987654321', 'jamali', 'jonson', 'kasuyku', 766262273, 'Male', 34, 'kongoro', 'Mbagala', 'sabasaba', 'mchele', 'table', '2023-08-31', '2023-09-16'),
(129, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 34, 'mbombwe', 'london', 'sabasaba', 'samaki', 'table', '2023-09-23', '2023-09-30'),
(130, '12345678900987654321', 'mariam', 'jafari', 'kipandu', 654676545, 'Female', 34, 'mbombwe', 'london', 'sabasaba', 'samaki', 'table', '2023-09-23', '2023-09-30'),
(131, '20081203123455432187', 'Juma', 'Hamza', 'Kadee', 678123456, 'Male', 45, 'Mtanda', 'Makonde', 'kuu', 'Mchele', 'table', '2023-09-29', '2024-03-29'),
(132, '20081203123455432187', 'Juma', 'Hamza', 'Kadee', 678123456, 'Male', 45, 'Mtanda', 'Makonde', 'kuu', 'Mchele', 'table', '2023-09-29', '2024-03-29'),
(133, '20081203123455432187', 'Juma', 'Hamza', 'Kadee', 678123456, 'Male', 45, 'Mtanda', 'Makonde', 'kuu', 'Mchele', 'table', '2023-09-29', '2024-03-29'),
(134, '18990627987653456723', 'Gambo', 'Man', 'West', 713876543, 'Male', 34, 'Mpilipili', 'Mpilipili', 'soko la mwenge', 'matunda', 'table', '2023-09-24', '2024-01-31'),
(135, '19870712456785432112', 'John', 'Joseph', 'Kaweche', 734876543, 'Male', 32, 'Wailes', 'Matopeni', 'kuu', 'Samaki', 'cage', '2023-09-29', '2024-02-28'),
(136, '20020824456782345612', 'Fausta', 'John', 'Joseph', 645865487, 'Female', 23, 'Mpilipili', 'Msinjahili', 'sabasaba', 'matunda', 'table', '2023-09-29', '2024-03-27'),
(137, '20001213654328765412', 'John', 'Joseph', 'Masawe', 764765432, 'Male', 34, 'Ghana', 'Makonde', 'soko la mbuyuni', 'Mchele', 'cage', '2023-09-24', '2024-01-25');

-- --------------------------------------------------------

--
-- Structure for view `biashara_view`
--
DROP TABLE IF EXISTS `biashara_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `biashara_view`  AS  select `wafanyabiashara`.`Mfanyabiashara_ID` AS `Mfanyabiashara_ID`,`wafanyabiashara`.`NIN` AS `NIN`,`wafanyabiashara`.`Jina_la_Kwanza` AS `Jina_la_Kwanza`,`wafanyabiashara`.`Jina_Kati` AS `Jina_Kati`,`wafanyabiashara`.`Jina_Mwisho` AS `Jina_Mwisho`,`wafanyabiashara`.`Namba_ya_Simu` AS `Namba_ya_Simu`,`wafanyabiashara`.`Jinsi` AS `Jinsi`,`wafanyabiashara`.`Umri` AS `Umri`,`wafanyabiashara`.`Street` AS `Street`,`wafanyabiashara`.`Ward` AS `Ward`,`wafanyabiashara`.`MarketType` AS `MarketType`,`wafanyabiashara`.`infrastructure` AS `infrastructure`,`wafanyabiashara`.`date_of_rent` AS `date_of_rent`,`wafanyabiashara`.`date_of_return` AS `date_of_return` from `wafanyabiashara` ;

-- --------------------------------------------------------

--
-- Structure for view `biasha_view`
--
DROP TABLE IF EXISTS `biasha_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `biasha_view`  AS  select `wafanyabiashara`.`Mfanyabiashara_ID` AS `Mfanyabiashara_ID`,`wafanyabiashara`.`NIN` AS `NIN`,`wafanyabiashara`.`Jina_la_Kwanza` AS `Jina_la_Kwanza`,`wafanyabiashara`.`Jina_Kati` AS `Jina_Kati`,`wafanyabiashara`.`Jina_Mwisho` AS `Jina_Mwisho`,`wafanyabiashara`.`Namba_ya_Simu` AS `Namba_ya_Simu`,`wafanyabiashara`.`Jinsi` AS `Jinsi`,`wafanyabiashara`.`Umri` AS `Umri`,`wafanyabiashara`.`Street` AS `Street`,`wafanyabiashara`.`Ward` AS `Ward`,`wafanyabiashara`.`MarketType` AS `MarketType`,`wafanyabiashara`.`infrastructure` AS `infrastructure`,`wafanyabiashara`.`date_of_rent` AS `date_of_rent`,`wafanyabiashara`.`date_of_return` AS `date_of_return` from `wafanyabiashara` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `wafanyabiashara`
--
ALTER TABLE `wafanyabiashara`
  ADD PRIMARY KEY (`Mfanyabiashara_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `wafanyabiashara`
--
ALTER TABLE `wafanyabiashara`
  MODIFY `Mfanyabiashara_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
