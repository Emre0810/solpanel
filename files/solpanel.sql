-- phpMyAdmin SQL Dump
-- version 5.2.3deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2026 at 02:17 PM
-- Server version: 8.4.13-0ubuntu0.26.04.2
-- PHP Version: 8.5.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `solpanel`
--

-- --------------------------------------------------------

--
-- Table structure for table `installation`
--

CREATE TABLE `installation` (
  `installationid` int NOT NULL,
  `instruktion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `installation`
--

INSERT INTO `installation` (`installationid`, `instruktion`) VALUES
(1, 'text');

-- --------------------------------------------------------

--
-- Table structure for table `kund`
--

CREATE TABLE `kund` (
  `id` int NOT NULL,
  `namn` text,
  `address` text,
  `email` varchar(255) DEFAULT NULL,
  `tele` varchar(45) DEFAULT NULL,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lager`
--

CREATE TABLE `lager` (
  `lagerid` int NOT NULL,
  `panelid` int DEFAULT NULL,
  `antal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `idorder` int NOT NULL,
  `id` int DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `panelkostnad` decimal(10,0) DEFAULT NULL,
  `installationskostnad` decimal(10,0) DEFAULT NULL,
  `installationsdatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetaljer`
--

CREATE TABLE `orderdetaljer` (
  `idorderdetaljid` int NOT NULL,
  `idorder` int DEFAULT NULL,
  `panelid` int DEFAULT NULL,
  `antal` int DEFAULT NULL,
  `pris` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produkt`
--

CREATE TABLE `produkt` (
  `panelid` int NOT NULL,
  `installationid` int DEFAULT NULL,
  `modell` varchar(45) DEFAULT NULL,
  `effekt` varchar(45) DEFAULT NULL,
  `pris` decimal(10,0) DEFAULT NULL,
  `bild` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`panelid`, `installationid`, `modell`, `effekt`, `pris`, `bild`) VALUES
(1, 1, 'modellnummer', '45kw', 1500, 'bilder/asfsafsdgd_60cd8fa4-be96-4111-b0d4-47c62add6826.webp'),
(2, 1, 'modellnummer', '45kw', 1300, 'bilder/asfsafsdgd_60cd8fa4-be96-4111-b0d4-47c62add6826.webp'),
(3, 1, 'modellnummer dftgdf', '45kw', 1300, 'bilder/asfsafsdgd_60cd8fa4-be96-4111-b0d4-47c62add6826.webp'),
(4, 1, 'modellnummer 56', '45kw', 1300, 'bilder/asfsafsdgd_60cd8fa4-be96-4111-b0d4-47c62add6826.webp'),
(5, 1, 'modellnummer 0987', '45kw', 1300, 'bilder/asfsafsdgd_60cd8fa4-be96-4111-b0d4-47c62add6826.webp'),
(6, 1, 'modellnummer hhh', '45kw', 1300, 'bilder/asfsafsdgd_60cd8fa4-be96-4111-b0d4-47c62add6826.webp'),
(7, 1, 'modellnummer  rty', '45kw', 1300, 'bilder/asfsafsdgd_60cd8fa4-be96-4111-b0d4-47c62add6826.webp');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `installation`
--
ALTER TABLE `installation`
  ADD PRIMARY KEY (`installationid`);

--
-- Indexes for table `kund`
--
ALTER TABLE `kund`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `tele_UNIQUE` (`tele`);

--
-- Indexes for table `lager`
--
ALTER TABLE `lager`
  ADD PRIMARY KEY (`lagerid`),
  ADD KEY `idx_panelid` (`panelid`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`idorder`),
  ADD KEY `fk_order_1_idx` (`id`);

--
-- Indexes for table `orderdetaljer`
--
ALTER TABLE `orderdetaljer`
  ADD PRIMARY KEY (`idorderdetaljid`),
  ADD KEY `fk_orderdetaljer_1_idx` (`idorder`),
  ADD KEY `fk_orderdetaljer_2_idx` (`panelid`);

--
-- Indexes for table `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`panelid`),
  ADD KEY `idx_produkt_1` (`installationid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `installation`
--
ALTER TABLE `installation`
  MODIFY `installationid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kund`
--
ALTER TABLE `kund`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `panelid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lager`
--
ALTER TABLE `lager`
  ADD CONSTRAINT `fk_lager_1` FOREIGN KEY (`panelid`) REFERENCES `produkt` (`panelid`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_1` FOREIGN KEY (`id`) REFERENCES `kund` (`id`);

--
-- Constraints for table `orderdetaljer`
--
ALTER TABLE `orderdetaljer`
  ADD CONSTRAINT `fk_orderdetaljer_1` FOREIGN KEY (`idorder`) REFERENCES `order` (`idorder`),
  ADD CONSTRAINT `fk_orderdetaljer_2` FOREIGN KEY (`panelid`) REFERENCES `produkt` (`panelid`);

--
-- Constraints for table `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `fk_produkt_1` FOREIGN KEY (`installationid`) REFERENCES `installation` (`installationid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
