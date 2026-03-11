-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 11, 2026 at 10:00 PM
-- Server version: 8.0.45
-- PHP Version: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pixelforge_studios`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_location` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_code`, `dept_name`, `dept_location`) VALUES
('ART', 'Art Department', 'Montreal'),
('AUD', 'Audio', 'Montreal'),
('DEV', 'Development', 'Vancouver'),
('GDS', 'Game Design', 'Toronto'),
('HR', 'Human Resources', 'Toronto'),
('MKT', 'Marketing', 'Toronto'),
('QA', 'Quality Assurance', 'Vancouver');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `emp_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `job_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `hire_date` date NOT NULL,
  `salary_cad` decimal(10,2) NOT NULL,
  `dept_code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_no`, `emp_name`, `job_title`, `hire_date`, `salary_cad`, `dept_code`) VALUES
(1001, 'Lucas Romero', 'Gameplay Programmer', '2021-03-15', 92000.00, 'DEV'),
(1002, 'Sofia Chen', 'Character Artist', '2022-06-10', 78000.00, 'ART'),
(1003, 'Daniel Park', 'QA Tester', '2023-01-09', 56000.00, 'QA'),
(1004, 'Emma Rossi', 'Game Designer', '2020-09-21', 88000.00, 'GDS'),
(1005, 'Noah Patel', 'Audio Designer', '2021-11-03', 72000.00, 'AUD'),
(1006, 'Ava Kim', 'Backend Programmer', '2019-07-17', 105000.00, 'DEV'),
(1007, 'Liam Dubois', 'UI Artist', '2022-02-14', 74000.00, 'ART'),
(1008, 'Mia Johnson', 'Marketing Specialist', '2023-04-01', 67000.00, 'MKT'),
(1009, 'Ethan Garcia', 'HR Coordinator', '2021-08-30', 64000.00, 'HR'),
(1010, 'Isabella Nguyen', 'QA Analyst', '2020-12-05', 60000.00, 'QA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_code`),
  ADD UNIQUE KEY `dept_name` (`dept_name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_no`),
  ADD KEY `fk_employees_department` (`dept_code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_department` FOREIGN KEY (`dept_code`) REFERENCES `departments` (`dept_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
