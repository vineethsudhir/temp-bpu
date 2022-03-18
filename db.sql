-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2022 at 04:36 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE bpusurvey;

USE bpusurvey;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bpusurvey`
--

-- --------------------------------------------------------

--
-- Table structure for table `connectiontype`
--

CREATE TABLE `connectiontype` (
  `connectionID` int(11) NOT NULL,
  `connectionName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `connectiontype`
--

INSERT INTO `connectiontype` (`connectionID`, `connectionName`) VALUES
(1, 'Digital Subscriber Line(DSL)'),
(2, 'Cable Modem'),
(3, 'Fiber'),
(4, 'Wireless'),
(5, 'Satellite'),
(6, 'Broadband over Powerlines( BPL )'),
(7, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE `counties` (
  `countyID` int(11) NOT NULL,
  `countyName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`countyID`, `countyName`) VALUES
(1, 'Atlantic County'),
(2, 'Bergen County'),
(3, 'Burlington County'),
(4, 'Camden County'),
(5, 'Cape May County'),
(6, 'Cumberland County'),
(7, 'Essex County'),
(8, 'Gloucester County'),
(9, 'Hudson County'),
(10, 'Hunterdon County'),
(11, 'Mercer County'),
(12, 'Middlesex County'),
(13, 'Manmouth County'),
(14, 'Morris County'),
(15, 'Ocean County'),
(16, 'Passaic County'),
(17, 'Salem County'),
(18, 'Somerset County'),
(19, 'Sussex County'),
(20, 'Union County'),
(21, 'Warren County');

-- --------------------------------------------------------

--
-- Table structure for table `housingtype`
--

CREATE TABLE `housingtype` (
  `houseTypeID` int(11) NOT NULL,
  `houseTypeName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `housingtype`
--

INSERT INTO `housingtype` (`houseTypeID`, `houseTypeName`) VALUES
(1, 'Single-Family Home'),
(2, 'Multifamily Home'),
(3, 'Townhome'),
(4, 'Apartment'),
(5, 'Condominiums'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `internetserviceprovider`
--

CREATE TABLE `internetserviceprovider` (
  `ispID` int(11) NOT NULL,
  `ispName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `internetserviceprovider`
--

INSERT INTO `internetserviceprovider` (`ispID`, `ispName`) VALUES
(1, 'Xfinity'),
(2, 'Optimum'),
(3, 'Spectrum'),
(4, 'Century Link'),
(5, 'Verizon'),
(6, 'Starry Internet'),
(7, 'Viasat'),
(8, 'HughesNet'),
(9, 'Ultra Home Internet'),
(10, 'Atlantic Broadband'),
(11, 'Consolidated Communications'),
(12, 'Service Electric Cable TV'),
(13, 'Jersey Shore Wireless'),
(14, 'Xchange Telecom'),
(15, 'Argent Communications'),
(16, 'Warwick Valley Telephone'),
(17, 'Wavecomm'),
(18, 'Upstream'),
(19, 'Cyberpine Cooperative'),
(20, 'Access One'),
(21, 'NetCarrier Telecom'),
(22, 'Goes Telecom'),
(23, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `surveyresponse`
--

CREATE TABLE `surveyresponse` (
  `responseID` bigint(20) UNSIGNED NOT NULL,
  `streetAddress` varchar(100) NOT NULL,
  `aptNumber` int(11) NOT NULL,
  `housingType` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` int(11) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `connection` tinyint(1) NOT NULL,
  `downloadSpeed` float NOT NULL,
  `uploadSpeed` float NOT NULL,
  `internetSP` int(11) NOT NULL,
  `connectType` int(11) NOT NULL,
  `affordability` tinyint(1) NOT NULL,
  `accessibility` tinyint(1) NOT NULL,
  `necessity` tinyint(1) NOT NULL,
  `comments` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `connectiontype`
--
ALTER TABLE `connectiontype`
  ADD PRIMARY KEY (`connectionID`);

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`countyID`);

--
-- Indexes for table `housingtype`
--
ALTER TABLE `housingtype`
  ADD PRIMARY KEY (`houseTypeID`);

--
-- Indexes for table `internetserviceprovider`
--
ALTER TABLE `internetserviceprovider`
  ADD PRIMARY KEY (`ispID`);

--
-- Indexes for table `surveyresponse`
--
ALTER TABLE `surveyresponse`
  ADD PRIMARY KEY (`responseID`),
  ADD UNIQUE KEY `responseID` (`responseID`),
  ADD KEY `county` (`county`),
  ADD KEY `connectConstraint` (`connectType`),
  ADD KEY `houseConstraint` (`housingType`),
  ADD KEY `ispConstraint` (`internetSP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `surveyresponse`
--
ALTER TABLE `surveyresponse`
  MODIFY `responseID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `surveyresponse`
--
ALTER TABLE `surveyresponse`
  ADD CONSTRAINT `connectConstraint` FOREIGN KEY (`connectType`) REFERENCES `connectiontype` (`connectionID`),
  ADD CONSTRAINT `countyConstraint` FOREIGN KEY (`county`) REFERENCES `counties` (`countyID`),
  ADD CONSTRAINT `houseConstraint` FOREIGN KEY (`housingType`) REFERENCES `housingtype` (`houseTypeID`),
  ADD CONSTRAINT `ispConstraint` FOREIGN KEY (`internetSP`) REFERENCES `internetserviceprovider` (`ispID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


CREATE USER webinsert IDENTIFIED BY 'WebUser';

GRANT INSERT ON bpusurvey.* to webinsert;

FLUSH PRIVILEGES;
