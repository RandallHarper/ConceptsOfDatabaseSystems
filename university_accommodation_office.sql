-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2015 at 07:41 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `university accommodation office`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE IF NOT EXISTS `advisor` (
  `advisorID` int(4) NOT NULL,
  `aFirstName` varchar(50) NOT NULL,
  `aLastName` varchar(50) NOT NULL,
  `aPhoneNumber` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `roomNumber` int(4) DEFAULT NULL,
  PRIMARY KEY (`advisorID`),
  KEY `firstName` (`aFirstName`,`aLastName`,`email`,`roomNumber`),
  KEY `lastName` (`aLastName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`advisorID`, `aFirstName`, `aLastName`, `aPhoneNumber`, `email`, `roomNumber`) VALUES
(2, 'dummy', 'dummy', '8067421234', 'dummy.dummy@ttu.edu', 123),
(11234, 'Johnny', 'Smith', '8067427771', 'john.smith@ttu.edu', 301);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseNO` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(50) NOT NULL,
  PRIMARY KEY (`courseNO`),
  KEY `courseNO` (`courseNO`),
  KEY `courseName` (`courseName`),
  KEY `courseNO_2` (`courseNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `deptNO` int(4) NOT NULL,
  `deptName` varchar(50) NOT NULL,
  PRIMARY KEY (`deptNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flat`
--

CREATE TABLE IF NOT EXISTS `flat` (
  `flatNO` int(4) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postCode` int(4) NOT NULL,
  `numOfRooms` int(4) NOT NULL,
  PRIMARY KEY (`flatNO`),
  KEY `numOfRooms` (`numOfRooms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flat`
--

INSERT INTO `flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES
(1, '123 Albany Ln', 'Lubbock', 79406, 3);

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE IF NOT EXISTS `hall` (
  `hallNO` int(4) NOT NULL,
  `placeNO` int(4) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postCode` int(4) NOT NULL,
  `hallName` varchar(50) NOT NULL,
  `phoneNumber` varchar(16) NOT NULL,
  PRIMARY KEY (`hallNO`),
  KEY `hallName` (`hallName`),
  KEY `placeNO` (`placeNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`hallNO`, `placeNO`, `street`, `city`, `postCode`, `hallName`, `phoneNumber`) VALUES
(1, 55, '1234 University Ln', 'Lubbock', 79406, 'Sneed', '8067423333'),
(2, 220, '123 Albany Ln', 'Lubbock', 79406, 'Weymouth', '8067423131'),
(3, 124, '1234 University Ln', 'Lubbock', 79406, 'Bledsoe', '8067422661'),
(4, 89, '1234 University Ln', 'Lubbock', 79406, 'Horn', '8067422661');

-- --------------------------------------------------------

--
-- Table structure for table `inspection`
--

CREATE TABLE IF NOT EXISTS `inspection` (
  `inspectionNO` int(4) NOT NULL,
  `dateOfInspec` varchar(10) NOT NULL,
  `satisfcCondition` varchar(50) NOT NULL,
  `comments` int(140) DEFAULT NULL,
  PRIMARY KEY (`inspectionNO`),
  KEY `dateOfInspec` (`dateOfInspec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoiceNO` int(4) NOT NULL AUTO_INCREMENT,
  `leaseNO` int(11) NOT NULL,
  `semester` varchar(16) NOT NULL,
  `payDue` float NOT NULL,
  `firstName` varchar(16) NOT NULL,
  `lastName` varchar(16) NOT NULL,
  `bannerNumber` int(4) NOT NULL,
  `placeNO` int(4) NOT NULL,
  `roomNO` int(4) NOT NULL,
  `street` varchar(16) NOT NULL,
  `city` varchar(16) NOT NULL,
  `postCode` int(11) NOT NULL,
  `totalPaid` decimal(10,2) NOT NULL,
  `date` varchar(10) NOT NULL,
  `payMethod` varchar(16) NOT NULL,
  `dateOfFirstRem` varchar(10) NOT NULL,
  `dateOfSecondRem` varchar(10) NOT NULL,
  PRIMARY KEY (`invoiceNO`),
  KEY `payMethod` (`payMethod`),
  KEY `totalPaid` (`totalPaid`),
  KEY `leaseNO` (`leaseNO`),
  KEY `firstName` (`firstName`,`lastName`,`bannerNumber`,`placeNO`,`roomNO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `firstName`, `lastName`, `bannerNumber`, `placeNO`, `roomNO`, `street`, `city`, `postCode`, `totalPaid`, `date`, `payMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES
(1, 0, 'Fall 2015', 2064.23, '', '', 0, 0, 0, '', '', 0, '0.00', '10/25/15', 'Visa Debit', '10/15/15', '10/20/15'),
(2, 2, 'Fall 2015', 2064.23, 'Randall', 'Harper', 123456789, 501, 3, '123 Albany Ln', 'Lubbock', 79406, '21423.21', '10/25/15', 'Visa Debit', '10/15/15', '10/20/15');

-- --------------------------------------------------------

--
-- Table structure for table `lease`
--

CREATE TABLE IF NOT EXISTS `lease` (
  `leaseNO` int(4) NOT NULL,
  `numOfSemester` int(4) NOT NULL,
  `moveInDate` varchar(10) NOT NULL,
  `moveOutDate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`leaseNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lease`
--

INSERT INTO `lease` (`leaseNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES
(1, 4, '08/28/16', '08/31/18');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE IF NOT EXISTS `major` (
  `majorID` int(4) NOT NULL,
  `majorName` varchar(50) NOT NULL,
  PRIMARY KEY (`majorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nok`
--

CREATE TABLE IF NOT EXISTS `nok` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postCode` int(4) DEFAULT NULL,
  `phoneNumber` varchar(16) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `firstName` (`firstName`,`lastName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `positionID` int(4) NOT NULL,
  `positionName` varchar(50) NOT NULL,
  PRIMARY KEY (`positionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `placeNO` int(4) NOT NULL,
  `roomNO` int(4) NOT NULL,
  `rentRate` int(4) NOT NULL,
  PRIMARY KEY (`placeNO`),
  KEY `rentRate` (`rentRate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `staffNO` int(4) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postCode` int(4) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `location` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`staffNO`),
  KEY `firstName` (`firstName`,`lastName`,`email`,`DOB`,`gender`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stuattndcourse`
--

CREATE TABLE IF NOT EXISTS `stuattndcourse` (
  `semester` varchar(16) NOT NULL,
  `year` varchar(16) NOT NULL,
  `instructor` varchar(16) NOT NULL,
  `phoneNumber` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `roomNumber` int(4) NOT NULL,
  `deptName` varchar(50) NOT NULL,
  KEY `semester` (`semester`,`year`,`instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `bannerNumber` int(4) NOT NULL,
  `advisorID` int(4) NOT NULL,
  `firstName` varchar(16) NOT NULL,
  `lastName` varchar(16) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(16) NOT NULL,
  `postCode` varchar(16) NOT NULL,
  `placeNO` int(4) DEFAULT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `DOB` varchar(16) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `category` varchar(16) NOT NULL,
  `nationality` varchar(16) NOT NULL,
  `specialNeeds` varchar(16) DEFAULT NULL,
  `comments` varchar(16) DEFAULT NULL,
  `status` varchar(16) NOT NULL,
  `major` varchar(50) NOT NULL,
  `minor` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`bannerNumber`),
  KEY `advisorID` (`advisorID`,`firstName`,`lastName`,`major`),
  KEY `placeNO` (`placeNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`bannerNumber`, `advisorID`, `firstName`, `lastName`, `street`, `city`, `postCode`, `placeNO`, `phoneNumber`, `email`, `DOB`, `gender`, `category`, `nationality`, `specialNeeds`, `comments`, `status`, `major`, `minor`) VALUES
(0, 0, '', '', '', '', '', NULL, '', '', '', '', 'junior', '', NULL, NULL, '', '', NULL),
(1, 0, '', '', '', '', '', NULL, '', '', '', '', 'junior', '', NULL, NULL, '', '', NULL),
(2, 123, 'dummy', 'dummy', '123 Albany Ln', 'Lubbock', '79406', NULL, '8067421234', 'dummy.dummy@ttu.edu', '05/31/1991', 'Male', 'Senior', 'White', NULL, NULL, 'waiting', 'Computer Science', 'Math'),
(3, 111, 'Jane', 'Smith', '1234 University Ln', 'Lubbock', '79406', NULL, '8067423333', 'jane.smith@ttu.edu', '05/31/1991', 'Female', 'Senior', 'White', NULL, NULL, 'waiting', 'Computer Science', 'Math'),
(4, 0, '', '', '', '', '', NULL, '', '', '', '', 'junior', '', NULL, NULL, '', '', NULL),
(5, 0, '', '', '', '', '', NULL, '', '', '', '', 'sophomore', '', NULL, NULL, '', '', NULL),
(6, 0, '', '', '', '', '', NULL, '', '', '', '', 'sophomore', '', NULL, NULL, '', '', NULL),
(7, 0, '', '', '', '', '', NULL, '', '', '', '', 'freshman', '', NULL, NULL, '', '', NULL),
(8, 0, '', '', '', '', '', NULL, '', '', '', '', 'freshman', '', NULL, NULL, '', '', NULL),
(10, 111, 'null', 'null', 'null', 'null', 'null', 0, 'null', 'null', 'null', 'null', 'Freshman', 'null', 'null', 'null', 'null', 'null', 'null'),
(11, 111, 'Jack', 'Smith', '1234 University Ln', 'Lubbock', '79406', 113, '8067421234', 'jack.smith@ttu.edu', 'null', 'null', 'Freshman', 'null', 'null', 'null', 'waiting', 'null', 'null'),
(12, 111, 'Jill', 'Smith', '1234 University Ln', 'Lubbock', '79406', 154, '8067421234', 'jill.smith@ttu.edu', 'null', 'null', 'Freshman', 'null', 'null', 'null', 'waiting', 'null', 'null'),
(13, 111, 'Jimmy', 'Smith', '1234 University Ln', 'Lubbock', '79406', 231, '8067421234', 'jimmy.smith@ttu.edu', 'null', 'null', 'Freshman', 'null', 'null', 'null', 'waiting', 'null', 'null'),
(14, 111, 'Joseph', 'Smith', '1234 University Ln', 'Lubbock', '79406', 221, '8067421234', 'joseph.smith@ttu.edu', 'null', 'null', 'junior', 'null', 'null', 'null', 'waiting', 'null', 'null'),
(15, 111, 'Johnny', 'Smith', '1234 University Ln', 'Lubbock', '79406', 512, '8067421234', 'johnny.smith@ttu.edu', 'null', 'null', 'sophomore', 'null', 'null', 'null', 'waiting', 'null', 'null'),
(16, 111, 'null', 'null', 'null', 'null', 'null', 0, 'null', 'null', 'null', 'null', 'junior', 'null', 'null', 'null', 'null', 'null', 'null'),
(17, 111, 'null', 'null', 'null', 'null', 'null', 0, 'null', 'null', 'null', 'null', 'senior', 'null', 'null', 'null', 'null', 'null', 'null'),
(19, 111, 'null', 'null', 'null', 'null', 'null', 0, 'null', 'null', 'null', 'null', 'senior', 'null', 'null', 'null', 'null', 'null', 'null'),
(20, 111, 'null', 'null', 'null', 'null', 'null', 0, 'null', 'null', 'null', 'null', 'senior', 'null', 'null', 'null', 'null', 'null', 'null'),
(21, 111, 'null', 'null', 'null', 'null', 'null', 0, 'null', 'null', 'null', 'null', 'senior', 'null', 'null', 'null', 'null', 'null', 'null'),
(22, 111, 'Joe', 'Rogan', '123 Albany Ln', 'Lubbock', '79406', 331, '8067421234', 'joe.rogan@ttu.edu', '03/21/1971', 'Male', 'Senior', 'white', NULL, NULL, 'waiting', 'Engineering Undecided', NULL),
(123456789, 11234, 'Randall', 'Harper', '123 Albany Ln', 'Lubbock', '79406', 33, '8176767014', 'randall.harper@t', '05/31/1991', 'Male', 'Senior', 'White', NULL, NULL, 'placed', 'Computer Science', 'Math');

-- --------------------------------------------------------

--
-- Table structure for table `studentlevel`
--

CREATE TABLE IF NOT EXISTS `studentlevel` (
  `levelID` int(4) NOT NULL,
  `levelName` varchar(50) NOT NULL,
  PRIMARY KEY (`levelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
