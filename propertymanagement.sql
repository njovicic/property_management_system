-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-04-08 01:34:22
-- 服务器版本： 10.1.38-MariaDB
-- PHP 版本： 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `propertymanagement`
--
CREATE DATABASE IF NOT EXISTS propertymanagement;
use propertymanagement;
-- --------------------------------------------------------

--
-- 表的结构 `appointment`
--

CREATE TABLE `appointment` (
  `apptId` int(11) NOT NULL,
  `apptDate` datetime NOT NULL,
  `Client_clientId` int(11) NOT NULL,
  `User_userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `appointment`
--

INSERT INTO `appointment` (`apptId`, `apptDate`, `Client_clientId`, `User_userId`) VALUES
(1, '2019-04-07 14:00:00', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `client`
--

CREATE TABLE `client` (
  `clientId` int(11) NOT NULL,
  `clientName` varchar(100) NOT NULL,
  `clientAddress1` varchar(200) NOT NULL,
  `clientAddress2` varchar(200) NOT NULL,
  `clientCity` varchar(50) NOT NULL,
  `clientProv` varchar(50) NOT NULL,
  `clientPostal` varchar(50) NOT NULL,
  `clientPhone1` varchar(200) NOT NULL,
  `clientPhone2` varchar(200) NOT NULL,
  `clientEmail` varchar(200) NOT NULL,
  `clientDetails` varchar(300) NOT NULL,
  `clientIdentification` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `client`
--

INSERT INTO `client` (`clientId`, `clientName`, `clientAddress1`, `clientAddress2`, `clientCity`, `clientProv`, `clientPostal`, `clientPhone1`, `clientPhone2`, `clientEmail`, `clientDetails`, `clientIdentification`) VALUES
(1, 'Test Client', '000 Test Street', '111 Test Streat', 'Test City', 'Test Prov', 'Test Postal', '000-000-0000', '000-000-0000', 'incaseoftest@test.com', 'this is a test client data', ''),
(2, 'Jason Bourne', '200 Old Carriage Drive', 'apt.200', 'Kitchener', 'ON', 'N2P0C7', '236-777-6717', '778-859-7527', 'riona2626@gmail.com', 'For test purposes only', '');

-- --------------------------------------------------------

--
-- 表的结构 `item`
--

CREATE TABLE `item` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `itemDescription` varchar(300) NOT NULL,
  `itemStandard` int(11) NOT NULL,
  `itemType_typeId` int(11) NOT NULL,
  `itemManufacturer_manuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `item`
--

INSERT INTO `item` (`itemId`, `itemName`, `itemDescription`, `itemStandard`, `itemType_typeId`, `itemManufacturer_manuId`) VALUES
(1, 'Test Item', 'in case of test only', 1, 2, 2),
(2, 'Test Item 2', 'tem', 0, 3, 4);

-- --------------------------------------------------------

--
-- 表的结构 `itemmanufacturer`
--

CREATE TABLE `itemmanufacturer` (
  `manuId` int(11) NOT NULL,
  `manuName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `itemmanufacturer`
--

INSERT INTO `itemmanufacturer` (`manuId`, `manuName`) VALUES
(1, 'Geramic Decor'),
(2, 'GENTEK'),
(3, 'GAF'),
(4, 'Meridian');

-- --------------------------------------------------------

--
-- 表的结构 `itemtopackage`
--

CREATE TABLE `itemtopackage` (
  `itemId` int(11) NOT NULL,
  `packageId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `itemtype`
--

CREATE TABLE `itemtype` (
  `typeId` int(11) NOT NULL,
  `typeName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `itemtype`
--

INSERT INTO `itemtype` (`typeId`, `typeName`) VALUES
(1, 'Ceramic Tile'),
(2, 'Flooring'),
(3, 'Cabinets'),
(4, 'Hardware');

-- --------------------------------------------------------

--
-- 表的结构 `location`
--

CREATE TABLE `location` (
  `locationId` int(11) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `package`
--

CREATE TABLE `package` (
  `packageId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `propertyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `property`
--

CREATE TABLE `property` (
  `propertyId` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `lotNum` varchar(20) NOT NULL,
  `lotSize` varchar(50) NOT NULL,
  `closingDate` date NOT NULL,
  `lotModel` varchar(100) NOT NULL,
  `sub` varchar(100) NOT NULL,
  `block` varchar(20) NOT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `property`
--

INSERT INTO `property` (`propertyId`, `status`, `lotNum`, `lotSize`, `closingDate`, `lotModel`, `sub`, `block`, `clientId`) VALUES
(2, 'firm_offer', '17', '32', '2019-08-21', 'Bridgeport', 'HWK', 'G', 1),
(12, 'available', '18', '23', '2019-04-19', 'Bridgeport', 'HWK', 'F', 0),
(14, 'on_hold', '2', '23', '2019-04-18', 'Bridgeport', 'HWK', 'F', 2),
(15, 'cond_offer', '123', '123', '2019-04-27', 'Brookside', 'HWK', 'F', 2),
(16, 'available', '122', '32', '2019-04-01', 'Brookside', 'HRC', 'F', 0),
(17, 'available', '21', '21', '0000-00-00', 'Bridgeport', 'HWK', 'F', 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `userPass` varchar(100) NOT NULL,
  `userEmail` varchar(200) NOT NULL,
  `userPhone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`userId`, `userName`, `userPass`, `userEmail`, `userPhone`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin@test.com', '234-234-2345');

--
-- 转储表的索引
--

--
-- 表的索引 `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`apptId`);

--
-- 表的索引 `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientId`);

--
-- 表的索引 `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemId`);

--
-- 表的索引 `itemmanufacturer`
--
ALTER TABLE `itemmanufacturer`
  ADD PRIMARY KEY (`manuId`);

--
-- 表的索引 `itemtype`
--
ALTER TABLE `itemtype`
  ADD PRIMARY KEY (`typeId`);

--
-- 表的索引 `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationId`);

--
-- 表的索引 `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packageId`);

--
-- 表的索引 `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`propertyId`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `appointment`
--
ALTER TABLE `appointment`
  MODIFY `apptId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `client`
--
ALTER TABLE `client`
  MODIFY `clientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `item`
--
ALTER TABLE `item`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `itemmanufacturer`
--
ALTER TABLE `itemmanufacturer`
  MODIFY `manuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `itemtype`
--
ALTER TABLE `itemtype`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `location`
--
ALTER TABLE `location`
  MODIFY `locationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `package`
--
ALTER TABLE `package`
  MODIFY `packageId` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `property`
--
ALTER TABLE `property`
  MODIFY `propertyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
