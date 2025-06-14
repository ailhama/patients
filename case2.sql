-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 14, 2025 at 12:42 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bithealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `name` text,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `age`) VALUES
(1, 'Andi Tian', 30),
(2, 'Budi Jatmiko', 55),
(3, 'Siti Nurjana', 62),
(4, 'Dita Kurniasih', 45),
(5, 'Eka Wira', 51),
(6, 'Rusmini', 68);

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` int NOT NULL,
  `visit_id` int DEFAULT NULL,
  `symptom` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`id`, `visit_id`, `symptom`) VALUES
(1, 1, 'pusing'),
(2, 1, 'mual'),
(3, 1, 'kehilangan keseimbangan'),
(4, 2, 'sakit kepala'),
(5, 2, 'mual'),
(6, 2, 'pusing'),
(7, 4, 'mual'),
(8, 4, 'demam'),
(9, 4, 'batuk'),
(10, 5, 'pusing'),
(11, 5, 'mual'),
(12, 5, 'nyeri dada'),
(13, 6, 'sesak napas');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `department` text,
  `visit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `patient_id`, `department`, `visit_date`) VALUES
(1, 2, 'Neurology', '2025-06-10'),
(2, 3, 'Neurology', '2025-06-11'),
(3, 3, 'Cardiology', '2025-06-09'),
(4, 5, 'Neurology', '2025-06-12'),
(5, 6, 'Neurology', '2025-06-13'),
(6, 1, 'Pulmonology', '2025-06-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD CONSTRAINT `symptoms_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
