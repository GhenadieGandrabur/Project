-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2023 at 09:49 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ijdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `email`, `password`) VALUES
(1, 'Kevin Yank', 'thatguy@kevinyank.com', ''),
(2, 'Tom Butler', 'tom@r.je', ''),
(3, 'Ghenadie Gandrabur', 'test@test.md', '$2y$10$jCcSfIV37oyRzg/Lq5lsreroc4qAWH5m0QVtN38N3LNh/uf7nUl.W');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'programming jokes'),
(4, 'one-liners'),
(5, 'first'),
(6, 'Politics'),
(7, 'Medicine'),
(8, 'Aero');

-- --------------------------------------------------------

--
-- Table structure for table `joke`
--

CREATE TABLE `joke` (
  `id` int(11) NOT NULL,
  `joketext` text DEFAULT NULL,
  `jokedate` date NOT NULL,
  `authorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joke`
--

INSERT INTO `joke` (`id`, `joketext`, `jokedate`, `authorId`) VALUES
(1, 'How many programmers does it take to screw in a lightbulb? None, it\'s a hardware problem.', '2017-04-01', 1),
(2, 'Why did the programmer quit his job? He didn\'t get arrays', '2017-04-01', 1),
(3, 'Why was the empty array stuck outside? It didn\'t have any keys', '2017-04-01', 2),
(12, 'Secont', '2022-12-04', 3),
(13, 'It’s tricky being a magician. (“one-liners” only)', '2022-11-24', 3),
(14, 'Venison’s dear, isn’t it? (“one-liners” only)\r\n\r\n', '2022-11-24', 3),
(15, 'Why was the empty array stuck outside? It didn\'t have any keys (by Tom Butler on 1st April 2017)', '2022-11-24', 3),
(16, 'Bugs come in through open Windows. (“programming jokes” and “one-liners” categories)', '2022-11-24', 3),
(17, 'Bugs come in through open Windows. (“programming jokes” and “one-liners” categories)', '2022-11-24', 3),
(21, 'Politics', '2023-01-25', 3),
(22, 'Politics 2', '2023-01-25', 3),
(23, 'Politics 3', '2022-01-25', 3),
(24, 'Test joke 1', '2023-01-28', 3);

-- --------------------------------------------------------

--
-- Table structure for table `joke_category`
--

CREATE TABLE `joke_category` (
  `jokeId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `joke_category`
--

INSERT INTO `joke_category` (`jokeId`, `categoryId`) VALUES
(11, 1),
(12, 1),
(14, 1),
(16, 1),
(16, 4),
(16, 5),
(21, 6),
(22, 6),
(22, 7),
(23, 6),
(23, 8),
(24, 4),
(24, 8);

-- --------------------------------------------------------

--
-- Table structure for table `taho`
--

CREATE TABLE `taho` (
  `id` int(9) NOT NULL,
  `tahonumber` varchar(20) NOT NULL,
  `tahotypeId` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taho`
--

INSERT INTO `taho` (`id`, `tahonumber`, `tahotypeId`) VALUES
(1, '123456789', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joke`
--
ALTER TABLE `joke`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joke_category`
--
ALTER TABLE `joke_category`
  ADD PRIMARY KEY (`jokeId`,`categoryId`);

--
-- Indexes for table `taho`
--
ALTER TABLE `taho`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `joke`
--
ALTER TABLE `joke`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `taho`
--
ALTER TABLE `taho`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
