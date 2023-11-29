-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Час створення: Лис 29 2023 р., 08:20
-- Версія сервера: 10.5.20-MariaDB
-- Версія PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `id21542930_java`
--

-- --------------------------------------------------------

--
-- Структура таблиці `Animals`
--

CREATE TABLE `Animals` (
  `animal_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `species` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `habitat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `Animals`
--

INSERT INTO `Animals` (`animal_id`, `name`, `species`, `date_of_birth`, `habitat`) VALUES
(1, 'Fluffy', 'Cat', '2019-05-15', 'Indoor'),
(2, 'Buddy', 'Dog', '2018-02-20', 'Outdoor'),
(3, 'Charlie', 'Parrot', '2020-07-10', 'Cage'),
(4, 'Spike', 'Snake', '2017-09-25', 'Terrarium'),
(5, 'Nemo', 'Fish', '2016-11-08', 'Aquarium');

-- --------------------------------------------------------

--
-- Структура таблиці `Caretakers`
--

CREATE TABLE `Caretakers` (
  `caretaker_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `Caretakers`
--

INSERT INTO `Caretakers` (`caretaker_id`, `name`, `specialization`) VALUES
(1, 'John', 'Mammals'),
(2, 'Emily', 'Reptiles'),
(3, 'Michael', 'Birds'),
(4, 'Sarah', 'Aquatic'),
(5, 'David', 'Insects');

-- --------------------------------------------------------

--
-- Структура таблиці `FeedingSchedule`
--

CREATE TABLE `FeedingSchedule` (
  `feed_id` int(11) NOT NULL,
  `animal_id` int(11) DEFAULT NULL,
  `caretaker_id` int(11) DEFAULT NULL,
  `feed_time` time DEFAULT NULL,
  `feed_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `FeedingSchedule`
--

INSERT INTO `FeedingSchedule` (`feed_id`, `animal_id`, `caretaker_id`, `feed_time`, `feed_type`) VALUES
(1, 1, 1, '08:00:00', 'Dry food'),
(2, 2, 2, '12:30:00', 'Canned food'),
(3, 3, 3, '10:00:00', 'Seeds'),
(4, 4, 2, '15:45:00', 'Frozen mice'),
(5, 5, 4, '09:15:00', 'Fish flakes');

-- --------------------------------------------------------

--
-- Структура таблиці `VisitedAnimals`
--

CREATE TABLE `VisitedAnimals` (
  `visit_id` int(11) NOT NULL,
  `visitor_id` int(11) DEFAULT NULL,
  `animal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `VisitedAnimals`
--

INSERT INTO `VisitedAnimals` (`visit_id`, `visitor_id`, `animal_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Структура таблиці `Visitors`
--

CREATE TABLE `Visitors` (
  `visitor_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `visit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `Visitors`
--

INSERT INTO `Visitors` (`visitor_id`, `name`, `visit_date`) VALUES
(1, 'Alice', '2023-01-10'),
(2, 'Bob', '2023-02-18'),
(3, 'Cynthia', '2023-03-25'),
(4, 'Daniel', '2023-04-05'),
(5, 'Eva', '2023-05-12');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `Animals`
--
ALTER TABLE `Animals`
  ADD PRIMARY KEY (`animal_id`);

--
-- Індекси таблиці `Caretakers`
--
ALTER TABLE `Caretakers`
  ADD PRIMARY KEY (`caretaker_id`);

--
-- Індекси таблиці `FeedingSchedule`
--
ALTER TABLE `FeedingSchedule`
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `caretaker_id` (`caretaker_id`);

--
-- Індекси таблиці `VisitedAnimals`
--
ALTER TABLE `VisitedAnimals`
  ADD PRIMARY KEY (`visit_id`),
  ADD KEY `visitor_id` (`visitor_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Індекси таблиці `Visitors`
--
ALTER TABLE `Visitors`
  ADD PRIMARY KEY (`visitor_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `Animals`
--
ALTER TABLE `Animals`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `Caretakers`
--
ALTER TABLE `Caretakers`
  MODIFY `caretaker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `FeedingSchedule`
--
ALTER TABLE `FeedingSchedule`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `VisitedAnimals`
--
ALTER TABLE `VisitedAnimals`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `Visitors`
--
ALTER TABLE `Visitors`
  MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `FeedingSchedule`
--
ALTER TABLE `FeedingSchedule`
  ADD CONSTRAINT `FeedingSchedule_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `Animals` (`animal_id`),
  ADD CONSTRAINT `FeedingSchedule_ibfk_2` FOREIGN KEY (`caretaker_id`) REFERENCES `Caretakers` (`caretaker_id`);

--
-- Обмеження зовнішнього ключа таблиці `VisitedAnimals`
--
ALTER TABLE `VisitedAnimals`
  ADD CONSTRAINT `VisitedAnimals_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `Visitors` (`visitor_id`),
  ADD CONSTRAINT `VisitedAnimals_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `Animals` (`animal_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
