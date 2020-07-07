-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2020 um 13:54
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
-- Datenbank: `exercise3`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `auction`
--

DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction` (
  `auction_id` int(11) NOT NULL,
  `fk_catalogue_id` int(11) DEFAULT NULL,
  `fk_bid_id` int(11) DEFAULT NULL,
  `current_price` int(11) DEFAULT NULL,
  `highest_bid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bid`
--

DROP TABLE IF EXISTS `bid`;
CREATE TABLE `bid` (
  `bid_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `bid_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bidder`
--

DROP TABLE IF EXISTS `bidder`;
CREATE TABLE `bidder` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(55) DEFAULT NULL,
  `user_password` varchar(25) DEFAULT NULL,
  `user_email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `catalogue`
--

DROP TABLE IF EXISTS `catalogue`;
CREATE TABLE `catalogue` (
  `catalogue_number` int(11) NOT NULL,
  `start_price` int(11) DEFAULT NULL,
  `highest_bid` int(11) DEFAULT NULL,
  `remaining_time` date DEFAULT NULL,
  `fk_items` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_ID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`auction_id`),
  ADD KEY `fk_catalogue_id` (`fk_catalogue_id`),
  ADD KEY `fk_bid_id` (`fk_bid_id`);

--
-- Indizes für die Tabelle `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `bidder`
--
ALTER TABLE `bidder`
  ADD PRIMARY KEY (`user_id`);

--
-- Indizes für die Tabelle `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`catalogue_number`),
  ADD KEY `fk_items` (`fk_items`);

--
-- Indizes für die Tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`fk_catalogue_id`) REFERENCES `catalogue` (`catalogue_number`),
  ADD CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`fk_bid_id`) REFERENCES `bid` (`bid_id`);

--
-- Constraints der Tabelle `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `bidder` (`user_id`);

--
-- Constraints der Tabelle `catalogue`
--
ALTER TABLE `catalogue`
  ADD CONSTRAINT `catalogue_ibfk_1` FOREIGN KEY (`fk_items`) REFERENCES `item` (`item_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
