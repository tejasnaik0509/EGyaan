-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 04, 2016 at 02:25 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EGyaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `AdminLogin`
--

CREATE TABLE `AdminLogin` (
  `LoginId` int(11) NOT NULL,
  `Username` varchar(5) NOT NULL,
  `Passwd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AdminLogin`
--

INSERT INTO `AdminLogin` (`LoginId`, `Username`, `Passwd`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `Attendance`
--

CREATE TABLE `Attendance` (
  `AttendanceId` int(11) NOT NULL,
  `CourseId` int(11) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `Attendance` varchar(2) DEFAULT NULL,
  `Dates` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Attendance`
--

INSERT INTO `Attendance` (`AttendanceId`, `CourseId`, `StudentId`, `Attendance`, `Dates`) VALUES
(3, 10, 5, 'P', '2016/06/04'),
(4, 10, 4, 'P', '2016/06/04'),
(5, 10, 5, 'P', '2016/07/04'),
(6, 10, 4, 'P', '2016/07/04');

-- --------------------------------------------------------

--
-- Table structure for table `Batch`
--

CREATE TABLE `Batch` (
  `BatchId` int(11) NOT NULL,
  `BatchName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Batch`
--

INSERT INTO `Batch` (`BatchId`, `BatchName`) VALUES
(2, 'Information Technology'),
(3, 'Computer Engineering'),
(4, 'Deletion testing batch');

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `CourseId` int(11) NOT NULL,
  `CourseName` varchar(30) NOT NULL,
  `BatchId` int(11) NOT NULL,
  `Fees` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`CourseId`, `CourseName`, `BatchId`, `Fees`) VALUES
(9, 'Test Deletion Course 1', 4, 10000),
(10, 'Test Deletion Course 2', 4, 12000),
(11, 'Test Deletion Course 3', 4, 10000),
(12, 'COMPS SUB 1', 3, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `Doubt`
--

CREATE TABLE `Doubt` (
  `Doubtid` int(11) NOT NULL,
  `Question` varchar(200) DEFAULT NULL,
  `Answer` varchar(500) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  `StudentFile` varchar(128) DEFAULT NULL,
  `TeacherFile` varchar(128) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Doubt`
--

INSERT INTO `Doubt` (`Doubtid`, `Question`, `Answer`, `CourseId`, `StudentFile`, `TeacherFile`, `StudentID`) VALUES
(2, 'Test question 2?', NULL, 9, '', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Notes`
--

CREATE TABLE `Notes` (
  `NoteId` int(11) NOT NULL,
  `NoteTitle` varchar(30) DEFAULT NULL,
  `NoteFile` varchar(128) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Notes`
--

INSERT INTO `Notes` (`NoteId`, `NoteTitle`, `NoteFile`, `CourseId`) VALUES
(6, 'Delete Notes 1', '../uploads/notes/E-card.doc', 10);

-- --------------------------------------------------------

--
-- Table structure for table `NoticeBoard`
--

CREATE TABLE `NoticeBoard` (
  `NoticeId` int(11) NOT NULL,
  `NoticeTitle` varchar(30) DEFAULT NULL,
  `Notice` varchar(500) DEFAULT NULL,
  `NoticeFile` varchar(128) DEFAULT NULL,
  `UrgentNotice` varchar(3) DEFAULT NULL,
  `NoticeType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NoticeBoard`
--

INSERT INTO `NoticeBoard` (`NoticeId`, `NoticeTitle`, `Notice`, `NoticeFile`, `UrgentNotice`, `NoticeType`) VALUES
(4, 'Test delete title 1 Changed', 'Test title notice Changed', '../uploads/notices/arangodb_setup', 'Y', 0),
(5, 'Batch notice to be deleted', 'Some notice', '../uploads/notices/2_bhk_med.jpg', 'Y', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Result`
--

CREATE TABLE `Result` (
  `ResultId` int(11) NOT NULL,
  `BatchId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  `ResultTitle` varchar(30) DEFAULT NULL,
  `TotalMarks` int(11) DEFAULT NULL,
  `DateOfUpload` varchar(20) DEFAULT NULL,
  `DateOfTest` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Result`
--

INSERT INTO `Result` (`ResultId`, `BatchId`, `CourseId`, `ResultTitle`, `TotalMarks`, `DateOfUpload`, `DateOfTest`) VALUES
(22, 4, 9, 'Delete Result 1', 30, '04/06/2016', '01/06/2016');

-- --------------------------------------------------------

--
-- Table structure for table `SlotTimetable`
--

CREATE TABLE `SlotTimetable` (
  `SlotId` int(11) NOT NULL,
  `Slot` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SlotTimetable`
--

INSERT INTO `SlotTimetable` (`SlotId`, `Slot`) VALUES
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `StudentId` int(11) NOT NULL,
  `StudentFname` varchar(30) NOT NULL,
  `StudentLname` varchar(30) DEFAULT NULL,
  `BatchId` int(11) NOT NULL,
  `StudentEmail` varchar(50) NOT NULL,
  `StudentPasswd` varchar(15) DEFAULT NULL,
  `StudentMobile` bigint(15) DEFAULT NULL,
  `StudentGender` varchar(1) DEFAULT NULL,
  `ParentName` varchar(30) DEFAULT NULL,
  `ParentEmail` varchar(30) DEFAULT NULL,
  `ParentPasswd` varchar(15) DEFAULT NULL,
  `FeesPaid` int(15) DEFAULT NULL,
  `FeesComment` varchar(50) DEFAULT NULL,
  `DateOFAdmission` varchar(12) DEFAULT NULL,
  `ParentMobile` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`StudentId`, `StudentFname`, `StudentLname`, `BatchId`, `StudentEmail`, `StudentPasswd`, `StudentMobile`, `StudentGender`, `ParentName`, `ParentEmail`, `ParentPasswd`, `FeesPaid`, `FeesComment`, `DateOFAdmission`, `ParentMobile`) VALUES
(4, 'Badal', 'Kotak', 4, 'badalkotak@gmail.com', '2GEZ', 9769766106, 'M', 'Manoj', 'mkotak@gmail.com', 'mk123', 22000, '--', '02/06/2016', 9820003397),
(5, 'Nir', 'Jakharia', 4, 'nj@gmail.com', 'hAm9', 9876543210, 'M', 'Rasik', 'rk@gmail.com', 'nyAj', 25000, '--', '04/06/2016', 9980976543);

-- --------------------------------------------------------

--
-- Table structure for table `StudentCourseRegistration`
--

CREATE TABLE `StudentCourseRegistration` (
  `RegistrationId` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `StudentCourseRegistration`
--

INSERT INTO `StudentCourseRegistration` (`RegistrationId`, `StudentId`, `CourseId`) VALUES
(5, 5, 9),
(6, 5, 10),
(7, 5, 11),
(8, 4, 9),
(9, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `StudentMarks`
--

CREATE TABLE `StudentMarks` (
  `MarksId` int(11) NOT NULL,
  `ResultId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `Marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `StudentMarks`
--

INSERT INTO `StudentMarks` (`MarksId`, `ResultId`, `StudentId`, `Marks`) VALUES
(6, 22, 4, 29);

-- --------------------------------------------------------

--
-- Table structure for table `Submission`
--

CREATE TABLE `Submission` (
  `SubmissionId` int(11) NOT NULL,
  `SubmissionTitle` varchar(30) DEFAULT NULL,
  `SubmissionFile` varchar(128) DEFAULT NULL,
  `DateOfSubmission` varchar(20) DEFAULT NULL,
  `DateOfUpload` varchar(20) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Submission`
--

INSERT INTO `Submission` (`SubmissionId`, `SubmissionTitle`, `SubmissionFile`, `DateOfSubmission`, `DateOfUpload`, `CourseId`) VALUES
(4, 'Delete Submission 1', '../uploads/submission/WORKDONE.png', '06/15/2016', '06/13/2016', 10);

-- --------------------------------------------------------

--
-- Table structure for table `SubmissionReport`
--

CREATE TABLE `SubmissionReport` (
  `ReportId` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  `StudentFile` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Syllabus`
--

CREATE TABLE `Syllabus` (
  `SyllabusId` int(11) NOT NULL,
  `CourseId` int(11) DEFAULT NULL,
  `SyllabusFile` varchar(128) DEFAULT NULL,
  `BatchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Syllabus`
--

INSERT INTO `Syllabus` (`SyllabusId`, `CourseId`, `SyllabusFile`, `BatchId`) VALUES
(3, 9, '../uploads/syllabus/SAIL2D.pdf', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Teacher`
--

CREATE TABLE `Teacher` (
  `TeacherId` int(11) NOT NULL,
  `TeacherFname` varchar(30) NOT NULL,
  `TeacherLname` varchar(30) DEFAULT NULL,
  `BatchId` int(11) NOT NULL,
  `TeacherEmail` varchar(128) NOT NULL,
  `TeacherPasswd` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teacher`
--

INSERT INTO `Teacher` (`TeacherId`, `TeacherFname`, `TeacherLname`, `BatchId`, `TeacherEmail`, `TeacherPasswd`) VALUES
(3, 'Test', 'Delete2', 4, 'td2@gmail.com', '12345'),
(4, 'Test', 'Delete1', 4, 'td1@gmail.com', 'b8cI');

-- --------------------------------------------------------

--
-- Table structure for table `TeacherCourse`
--

CREATE TABLE `TeacherCourse` (
  `TeacherCourseId` int(11) NOT NULL,
  `TeacherId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TeacherCourse`
--

INSERT INTO `TeacherCourse` (`TeacherCourseId`, `TeacherId`, `CourseId`) VALUES
(2, 3, 10),
(3, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `Textbook`
--

CREATE TABLE `Textbook` (
  `TextbookId` int(11) NOT NULL,
  `CourseId` int(11) DEFAULT NULL,
  `TextbookFile` varchar(128) DEFAULT NULL,
  `TextbookName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Textbook`
--

INSERT INTO `Textbook` (`TextbookId`, `CourseId`, `TextbookFile`, `TextbookName`) VALUES
(1, 10, '../uploads/textbook/EGyaan_ppt.pdf', 'Delete Book 1');

-- --------------------------------------------------------

--
-- Table structure for table `Timetable`
--

CREATE TABLE `Timetable` (
  `TimetableId` int(11) NOT NULL,
  `BatchId` int(11) DEFAULT NULL,
  `CellNo` varchar(8) NOT NULL,
  `CellValue` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Timetable`
--

INSERT INTO `Timetable` (`TimetableId`, `BatchId`, `CellNo`, `CellValue`) VALUES
(29, 4, 'r0c0', '9-10'),
(30, 4, 'r0c1', '1'),
(31, 4, 'r0c2', '2'),
(32, 4, 'r0c3', '3'),
(33, 4, 'r0c4', '4'),
(34, 4, 'r0c5', '5'),
(35, 4, 'r0c6', '6'),
(36, 4, 'r0c7', '7'),
(37, 4, 'r1c0', '10-11'),
(38, 4, 'r1c1', '8'),
(39, 4, 'r1c2', '9'),
(40, 4, 'r1c3', '10'),
(41, 4, 'r1c4', '11'),
(42, 4, 'r1c5', '12'),
(43, 4, 'r1c6', '13'),
(44, 4, 'r1c7', '14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AdminLogin`
--
ALTER TABLE `AdminLogin`
  ADD PRIMARY KEY (`LoginId`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Passwd` (`Passwd`);

--
-- Indexes for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD PRIMARY KEY (`AttendanceId`),
  ADD KEY `Attendance_ibfk_1` (`CourseId`),
  ADD KEY `Attendance_ibfk_2` (`StudentId`);

--
-- Indexes for table `Batch`
--
ALTER TABLE `Batch`
  ADD PRIMARY KEY (`BatchId`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`CourseId`),
  ADD KEY `Course_ibfk_1` (`BatchId`);

--
-- Indexes for table `Doubt`
--
ALTER TABLE `Doubt`
  ADD PRIMARY KEY (`Doubtid`),
  ADD KEY `Doubt_ibfk_1` (`CourseId`),
  ADD KEY `Doubt_ibfk_2` (`StudentID`);

--
-- Indexes for table `Notes`
--
ALTER TABLE `Notes`
  ADD PRIMARY KEY (`NoteId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `NoticeBoard`
--
ALTER TABLE `NoticeBoard`
  ADD PRIMARY KEY (`NoticeId`);

--
-- Indexes for table `Result`
--
ALTER TABLE `Result`
  ADD PRIMARY KEY (`ResultId`),
  ADD KEY `Result_ibfk_1` (`BatchId`),
  ADD KEY `Result_ibfk_2` (`CourseId`);

--
-- Indexes for table `SlotTimetable`
--
ALTER TABLE `SlotTimetable`
  ADD PRIMARY KEY (`SlotId`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`StudentId`),
  ADD UNIQUE KEY `StudentEmail` (`StudentEmail`),
  ADD UNIQUE KEY `ParentMobile` (`ParentMobile`),
  ADD UNIQUE KEY `StudentMobile` (`StudentMobile`),
  ADD UNIQUE KEY `ParentEmail` (`ParentEmail`),
  ADD KEY `BatchId` (`BatchId`);

--
-- Indexes for table `StudentCourseRegistration`
--
ALTER TABLE `StudentCourseRegistration`
  ADD PRIMARY KEY (`RegistrationId`),
  ADD KEY `StudentCourseRegistration_ibfk_2` (`CourseId`),
  ADD KEY `StudentCourseRegistration_ibfk_1` (`StudentId`);

--
-- Indexes for table `StudentMarks`
--
ALTER TABLE `StudentMarks`
  ADD PRIMARY KEY (`MarksId`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `ResultId` (`ResultId`);

--
-- Indexes for table `Submission`
--
ALTER TABLE `Submission`
  ADD PRIMARY KEY (`SubmissionId`),
  ADD KEY `Submission_ibfk_2` (`CourseId`);

--
-- Indexes for table `SubmissionReport`
--
ALTER TABLE `SubmissionReport`
  ADD PRIMARY KEY (`ReportId`),
  ADD KEY `SubmissionReport_ibfk_1` (`StudentId`),
  ADD KEY `SubmissionReport_ibfk_2` (`CourseId`);

--
-- Indexes for table `Syllabus`
--
ALTER TABLE `Syllabus`
  ADD PRIMARY KEY (`SyllabusId`),
  ADD KEY `Syllabus_ibfk_1` (`CourseId`),
  ADD KEY `BatchId` (`BatchId`);

--
-- Indexes for table `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`TeacherId`),
  ADD UNIQUE KEY `TeacherEmail` (`TeacherEmail`),
  ADD KEY `Teacher_ibfk_1` (`BatchId`);

--
-- Indexes for table `TeacherCourse`
--
ALTER TABLE `TeacherCourse`
  ADD PRIMARY KEY (`TeacherCourseId`),
  ADD KEY `TeacherCourse_ibfk_1` (`TeacherId`),
  ADD KEY `TeacherCourse_ibfk_2` (`CourseId`);

--
-- Indexes for table `Textbook`
--
ALTER TABLE `Textbook`
  ADD PRIMARY KEY (`TextbookId`),
  ADD KEY `Textbook_ibfk_1` (`CourseId`);

--
-- Indexes for table `Timetable`
--
ALTER TABLE `Timetable`
  ADD PRIMARY KEY (`TimetableId`),
  ADD KEY `Timetable_ibfk_1` (`BatchId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AdminLogin`
--
ALTER TABLE `AdminLogin`
  MODIFY `LoginId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Attendance`
--
ALTER TABLE `Attendance`
  MODIFY `AttendanceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Batch`
--
ALTER TABLE `Batch`
  MODIFY `BatchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Course`
--
ALTER TABLE `Course`
  MODIFY `CourseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `Doubt`
--
ALTER TABLE `Doubt`
  MODIFY `Doubtid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Notes`
--
ALTER TABLE `Notes`
  MODIFY `NoteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `NoticeBoard`
--
ALTER TABLE `NoticeBoard`
  MODIFY `NoticeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Result`
--
ALTER TABLE `Result`
  MODIFY `ResultId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `SlotTimetable`
--
ALTER TABLE `SlotTimetable`
  MODIFY `SlotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `StudentCourseRegistration`
--
ALTER TABLE `StudentCourseRegistration`
  MODIFY `RegistrationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `StudentMarks`
--
ALTER TABLE `StudentMarks`
  MODIFY `MarksId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Submission`
--
ALTER TABLE `Submission`
  MODIFY `SubmissionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `SubmissionReport`
--
ALTER TABLE `SubmissionReport`
  MODIFY `ReportId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Syllabus`
--
ALTER TABLE `Syllabus`
  MODIFY `SyllabusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Teacher`
--
ALTER TABLE `Teacher`
  MODIFY `TeacherId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `TeacherCourse`
--
ALTER TABLE `TeacherCourse`
  MODIFY `TeacherCourseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Textbook`
--
ALTER TABLE `Textbook`
  MODIFY `TextbookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Timetable`
--
ALTER TABLE `Timetable`
  MODIFY `TimetableId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD CONSTRAINT `Attendance_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Attendance_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `Student` (`StudentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Doubt`
--
ALTER TABLE `Doubt`
  ADD CONSTRAINT `Doubt_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Doubt_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Notes`
--
ALTER TABLE `Notes`
  ADD CONSTRAINT `Notes_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Result`
--
ALTER TABLE `Result`
  ADD CONSTRAINT `Result_ibfk_1` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Result_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `StudentCourseRegistration`
--
ALTER TABLE `StudentCourseRegistration`
  ADD CONSTRAINT `StudentCourseRegistration_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `Student` (`StudentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `StudentCourseRegistration_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON UPDATE CASCADE;

--
-- Constraints for table `StudentMarks`
--
ALTER TABLE `StudentMarks`
  ADD CONSTRAINT `StudentMarks_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `Student` (`StudentId`),
  ADD CONSTRAINT `StudentMarks_ibfk_2` FOREIGN KEY (`ResultId`) REFERENCES `Result` (`ResultId`);

--
-- Constraints for table `Submission`
--
ALTER TABLE `Submission`
  ADD CONSTRAINT `Submission_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SubmissionReport`
--
ALTER TABLE `SubmissionReport`
  ADD CONSTRAINT `SubmissionReport_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `Student` (`StudentId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `SubmissionReport_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Syllabus`
--
ALTER TABLE `Syllabus`
  ADD CONSTRAINT `Syllabus_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Syllabus_ibfk_2` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`);

--
-- Constraints for table `Teacher`
--
ALTER TABLE `Teacher`
  ADD CONSTRAINT `Teacher_ibfk_1` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`) ON UPDATE CASCADE;

--
-- Constraints for table `TeacherCourse`
--
ALTER TABLE `TeacherCourse`
  ADD CONSTRAINT `TeacherCourse_ibfk_1` FOREIGN KEY (`TeacherId`) REFERENCES `Teacher` (`TeacherId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TeacherCourse_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Textbook`
--
ALTER TABLE `Textbook`
  ADD CONSTRAINT `Textbook_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`) ON UPDATE CASCADE;

--
-- Constraints for table `Timetable`
--
ALTER TABLE `Timetable`
  ADD CONSTRAINT `Timetable_ibfk_1` FOREIGN KEY (`BatchId`) REFERENCES `Batch` (`BatchId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;