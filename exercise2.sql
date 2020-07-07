-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 11:06
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `exercise2`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctor_code` int(11) NOT NULL,
  `doctor_speciality` varchar(55) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `intervention`
--

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE `intervention` (
  `intervention_id` int(11) NOT NULL,
  `intervention_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `intervention_symptom` varchar(150) DEFAULT NULL,
  `intervention_treatment` varchar(150) DEFAULT NULL,
  `fk_unit_id` int(11) DEFAULT NULL,
  `fk_doctor_code` int(11) DEFAULT NULL,
  `fk_social_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `social_number` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `arrive_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `age` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(55) DEFAULT NULL,
  `floor` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_code`);

--
-- Indizes für die Tabelle `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`intervention_id`),
  ADD KEY `fk_unit_id` (`fk_unit_id`),
  ADD KEY `fk_doctor_code` (`fk_doctor_code`),
  ADD KEY `fk_social_number` (`fk_social_number`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`social_number`);

--
-- Indizes für die Tabelle `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`fk_unit_id`) REFERENCES `unit` (`unit_id`),
  ADD CONSTRAINT `intervention_ibfk_2` FOREIGN KEY (`fk_doctor_code`) REFERENCES `doctor` (`doctor_code`),
  ADD CONSTRAINT `intervention_ibfk_3` FOREIGN KEY (`fk_social_number`) REFERENCES `patient` (`social_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
