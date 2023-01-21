-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2023 at 08:14 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trms`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 8979555555, 'adminuser@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2019-10-04 06:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `tblquery`
--

CREATE TABLE `tblquery` (
  `id` int(11) NOT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `fName` varchar(200) DEFAULT NULL,
  `emailId` varchar(200) DEFAULT NULL,
  `mobileNumber` bigint(10) DEFAULT NULL,
  `Query` mediumtext DEFAULT NULL,
  `queryDate` timestamp NULL DEFAULT current_timestamp(),
  `teacherNote` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblquery`
--

INSERT INTO `tblquery` (`id`, `teacherId`, `fName`, `emailId`, `mobileNumber`, `Query`, `queryDate`, `teacherNote`) VALUES
(2, 1, 'Amit Kumar', 'amitk43@gmail.com', 1122336655, 'This is for testing purpose. Test Query', '2022-03-12 10:03:49', 'This is for testing. Test notes'),
(3, 3, 'Sanjeev', 'sanjeev@gmail.com', 4758963214, 'Test query', '2022-03-14 17:03:03', 'Test notes'),
(4, 7, 'xyz', 'abc@gmail.com', 6537475912, 'what subject?', '2023-01-16 09:19:16', 'i have answered'),
(5, 7, 'jag', 'joo@gmail.com', 8888888888, 'hello world', '2023-01-16 09:38:42', 'hiii there!!');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudent`
--

CREATE TABLE `tblstudent` (
  `ID` int(10) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `subject_id` int(10) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudent`
--

INSERT INTO `tblstudent` (`ID`, `name`, `subject_id`, `gender`, `dob`) VALUES
(1, 'afdz  sdfsdfvdcv etstt test', 2, 'Female', '2023-01-10'),
(2, 'divya test', 2, 'Female', '2000-01-01'),
(3, 'bhavana test', 6, 'Female', '2013-12-12');

--
-- Triggers `tblstudent`
--
DELIMITER $$
CREATE TRIGGER `trackEditStudentHistory` AFTER UPDATE ON `tblstudent` FOR EACH ROW BEGIN
    INSERT INTO tbl_edit_student_history
    VALUES (NEW.dob, NEW.gender, NEW.name, NEW.subject_id, CURRENT_TIMESTAMP
           );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trackStudentHistory` AFTER INSERT ON `tblstudent` FOR EACH ROW BEGIN
    INSERT INTO tbl_edit_student_history
    VALUES (NEW.dob, NEW.gender, NEW.name, NEW.subject_id, CURRENT_TIMESTAMP);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `ID` int(10) NOT NULL,
  `Subject` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`ID`, `Subject`, `CreationDate`) VALUES
(1, 'Mathmetics', '2019-10-07 06:11:06'),
(2, 'Physics', '2019-10-07 06:11:19'),
(3, 'Chemistry', '2019-10-07 06:11:32'),
(4, 'Biology', '2019-10-07 06:11:41'),
(5, 'Hindi', '2019-10-07 06:11:49'),
(6, 'English', '2019-10-07 06:11:56'),
(7, 'Science', '2019-10-07 06:12:06'),
(8, 'Social Science', '2019-10-07 06:12:19'),
(9, 'Accounts', '2019-10-07 06:12:32'),
(10, 'Arts', '2019-10-07 06:12:44'),
(13, 'Operating System (OS)', '2019-10-13 19:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `tblteacher`
--

CREATE TABLE `tblteacher` (
  `ID` int(10) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Picture` varchar(200) NOT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Qualifications` varchar(120) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `TeacherSub` varchar(120) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `teachingExp` varchar(10) DEFAULT NULL,
  `JoiningDate` varchar(120) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `isPublic` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblteacher`
--

INSERT INTO `tblteacher` (`ID`, `Name`, `Picture`, `Email`, `MobileNumber`, `password`, `Qualifications`, `Address`, `TeacherSub`, `description`, `teachingExp`, `JoiningDate`, `RegDate`, `isPublic`) VALUES
(1, 'Anuj kumar', '171bb7da1ad6f5b744af8e1693225e661647076737.png', 'ak@gmail.com', 1234567890, '5c428d8875d2948607f3e3fe134d71b4', 'B.Tech, M.tech', 'H 343 Wisdom Society Noida 20301', 'Chemistry', 'NA', '5', '2022-01-01', '2022-03-05 12:41:37', 1),
(2, 'John Doe', 'ebcd036a0db50db993ae98ce380f64191647072141.png', 'jogoe12@yourdomain.com', 1425369874, 'f925916e2754e5e03f75dd58a5733251', 'BSC, MSC', 'New Delhi India', 'Science', 'NA', '10', '2018-01-01', '2022-03-12 08:02:21', 1),
(3, 'Amit kumar', 'ebcd036a0db50db993ae98ce380f64191647277294.png', 'amitkr12@gmail.com', 1425366958, 'f925916e2754e5e03f75dd58a5733251', 'BSC,MSC', 'H 32325 XYZ COlony Raj Nagar Ghaziabad', 'Chemistry', 'I have 10 year exp in chemistry', '10', '2022-02-28', '2022-03-14 17:01:04', 1),
(4, 'divya', '4a301072dec6b6a49050e5b294cd79831673849875.png', 'nai@gmail.com', 9999999999, NULL, 'btech,mtech', 'mysore', 'Biology', 'none', '5', '2023-01-12', '2023-01-16 06:17:55', 1),
(5, 'Bhavana', 'e0adcb648378ddad94cc264f63844cc01673859261jpeg', 'xyz@gmail.com', 1234567890, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 08:49:58', NULL),
(7, 'bhavana', 'e0adcb648378ddad94cc264f63844cc01673860270jpeg', 'uvw@gmail.com', 8888888888, '53f21197fd88556f12d066faea1684e9', 'btech,mtech', 'blore', 'Science', 'none', '5', '2023-01-05', '2023-01-16 09:09:43', 1),
(8, 'sdsa', '4a301072dec6b6a49050e5b294cd79831673861774.png', 'bhavanabn7@gmail.com', 8792234996, NULL, 'btech,mtech', 'old(239) new(339) 8th cross kittur rani chennama road lakshmipura hanumanthanagar banglore', 'Mathmetics', 'fhfh', '5', '2001-02-02', '2023-01-16 09:36:14', NULL),
(9, 'xyz', '', 'admin@gmail.com', 6537475912, 'd16fb36f0911f878998c136191af705e', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 10:49:47', NULL),
(10, 'plu', '', 'plu@gmail.com', 6537475912, 'd16fb36f0911f878998c136191af705e', NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 10:50:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_edit_student_history`
--

CREATE TABLE `tbl_edit_student_history` (
  `dob` datetime DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_edit_student_history`
--

INSERT INTO `tbl_edit_student_history` (`dob`, `gender`, `name`, `subject_id`, `updated_on`) VALUES
('2023-01-20 00:00:00', 'Male', 'afdz', 7, '2023-01-21 12:16:47'),
('2023-01-10 00:00:00', 'Female', 'afdz  sdfsdfvdcv', 2, '2023-01-21 12:18:01'),
('2023-01-10 00:00:00', 'Female', 'afdz  sdfsdfvdcv etstt', 2, '2023-01-21 12:33:27'),
('2023-01-10 00:00:00', 'Female', 'afdz  sdfsdfvdcv etstt test', 2, '2023-01-21 12:37:46'),
('2000-01-01 00:00:00', 'Female', 'divya', 3, '2023-01-21 12:41:04'),
('2013-12-12 00:00:00', 'Female', 'bhavana', 3, '2023-01-21 12:41:25'),
('2000-01-01 00:00:00', 'Female', 'divya test', 2, '2023-01-21 12:41:39'),
('2013-12-12 00:00:00', 'Female', 'bhavana test', 6, '2023-01-21 12:41:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblquery`
--
ALTER TABLE `tblquery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tid` (`teacherId`);

--
-- Indexes for table `tblstudent`
--
ALTER TABLE `tblstudent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sid` (`subject_id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Subject` (`Subject`);

--
-- Indexes for table `tblteacher`
--
ALTER TABLE `tblteacher`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `subname` (`TeacherSub`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblquery`
--
ALTER TABLE `tblquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblstudent`
--
ALTER TABLE `tblstudent`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblteacher`
--
ALTER TABLE `tblteacher`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblquery`
--
ALTER TABLE `tblquery`
  ADD CONSTRAINT `tid` FOREIGN KEY (`teacherId`) REFERENCES `tblteacher` (`ID`);

--
-- Constraints for table `tblstudent`
--
ALTER TABLE `tblstudent`
  ADD CONSTRAINT `sid` FOREIGN KEY (`Subject_id`) REFERENCES `tblsubjects` (`ID`);

--
-- Constraints for table `tblteacher`
--
ALTER TABLE `tblteacher`
  ADD CONSTRAINT `subname` FOREIGN KEY (`TeacherSub`) REFERENCES `tblsubjects` (`Subject`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
