-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 02 2023 г., 21:30
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `this_is_the_base`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `ID` int NOT NULL COMMENT 'ID марки',
  `Brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Марка'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Марки машин';

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`ID`, `Brand`) VALUES
(1, 'Audi'),
(2, 'BMW'),
(3, 'Ford'),
(5, 'KIA'),
(7, 'Mitsubishi'),
(8, 'Porsche');

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `ID` int NOT NULL COMMENT 'ID машины',
  `Reg_number` varchar(255) NOT NULL COMMENT 'Регистрационный номер',
  `damage` tinyint(1) NOT NULL COMMENT 'Наличие повреждений',
  `ID_owner` int NOT NULL COMMENT 'ID владельца',
  `ID_model` int NOT NULL COMMENT 'ID модели',
  `ID_color` int NOT NULL COMMENT 'ID цвета'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Сами машины';

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`ID`, `Reg_number`, `damage`, `ID_owner`, `ID_model`, `ID_color`) VALUES
(1, 'е404да 27', 0, 2, 1, 1),
(2, 'а228уф 77', 0, 4, 20, 4),
(3, 'в004ко 69', 1, 5, 2, 7),
(4, 'ж123ук 57', 0, 4, 23, 2),
(5, 'к444ум 45', 0, 2, 24, 5),
(6, 'п743ке 56', 1, 2, 20, 4),
(7, 'к532ук 34', 0, 4, 23, 2),
(8, 'с123су 64', 0, 5, 3, 3),
(9, 'с422ру 86', 0, 5, 24, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `ID` int NOT NULL COMMENT 'ID пользователя',
  `name` varchar(255) NOT NULL COMMENT 'ФИО',
  `rights` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Водительское удостоверение'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Клиенты';

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`ID`, `name`, `rights`) VALUES
(1, 'Бухтияров К. А.', NULL),
(2, 'Кузин Д. А.', NULL),
(3, 'Иванов П. П.', NULL),
(4, 'Петров И. И.', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `color`
--

CREATE TABLE `color` (
  `ID` int NOT NULL COMMENT 'ID цвета',
  `Color` varchar(255) NOT NULL COMMENT 'Цвет'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Цвета машин';

--
-- Дамп данных таблицы `color`
--

INSERT INTO `color` (`ID`, `Color`) VALUES
(1, 'Красный'),
(2, 'Синий'),
(3, 'Белый'),
(4, 'Чёрный'),
(5, 'Зелёный'),
(6, 'Серый'),
(7, 'Металлик');

-- --------------------------------------------------------

--
-- Структура таблицы `das model`
--

CREATE TABLE `das model` (
  `ID` int NOT NULL COMMENT 'ID модели',
  `ID_brand` int NOT NULL COMMENT 'ID марки',
  `Das model` varchar(255) NOT NULL COMMENT 'Модель'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Модели машин';

--
-- Дамп данных таблицы `das model`
--

INSERT INTO `das model` (`ID`, `ID_brand`, `Das model`) VALUES
(1, 7, 'Lancer Evolution X'),
(2, 8, 'Pz.Kpfw.VI (P)'),
(3, 8, '911 GT3'),
(14, 1, 'A8'),
(15, 1, 'A4'),
(16, 1, 'Q5'),
(17, 1, 'Q7'),
(18, 2, 'X5'),
(19, 2, 'X6'),
(20, 2, 'X7'),
(21, 3, 'Mustang'),
(22, 3, 'Focus'),
(23, 5, 'Rio'),
(24, 8, 'Cayenne'),
(25, 3, 'Explorer'),
(26, 5, 'Picanto'),
(27, 5, 'Sportage'),
(28, 7, 'Outlander'),
(29, 7, 'Pajero');

-- --------------------------------------------------------

--
-- Структура таблицы `donations`
--

CREATE TABLE `donations` (
  `ID` int NOT NULL COMMENT 'ID пополнения баланса',
  `ID_client` int NOT NULL COMMENT 'ID клиента',
  `BUCKS` int NOT NULL COMMENT 'Сколько BUCKS положили'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `donations`
--

INSERT INTO `donations` (`ID`, `ID_client`, `BUCKS`) VALUES
(1, 2, 100500),
(2, 2, 100600),
(3, 2, 100700),
(4, 4, 5000),
(5, 4, 40000),
(6, 4, 10000),
(7, 1, 100),
(8, 1, 18193),
(9, 1, 45000),
(10, 3, 666),
(11, 3, 6000),
(12, 3, 60000);

-- --------------------------------------------------------

--
-- Структура таблицы `owners`
--

CREATE TABLE `owners` (
  `ID` int NOT NULL COMMENT 'ID Владельца',
  `name` varchar(255) NOT NULL COMMENT 'ФИО/Организация'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Владельцы машин';

--
-- Дамп данных таблицы `owners`
--

INSERT INTO `owners` (`ID`, `name`) VALUES
(2, 'Петров П. П.'),
(4, 'Сидоров С. С.'),
(5, 'Фердинанд Порше');

-- --------------------------------------------------------

--
-- Структура таблицы `trip`
--

CREATE TABLE `trip` (
  `ID` int NOT NULL COMMENT 'ID поездки',
  `ID_client` int NOT NULL COMMENT 'ID клиента',
  `ID_car` int NOT NULL COMMENT 'ID машины',
  `since` date NOT NULL COMMENT 'Дата начала поездки',
  `days` int NOT NULL COMMENT 'Количество дней',
  `cost` int NOT NULL COMMENT 'Стоимость, руб/сут',
  `price` int GENERATED ALWAYS AS ((`days` * `cost`)) VIRTUAL NOT NULL COMMENT 'Цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Поездки';

--
-- Дамп данных таблицы `trip`
--

INSERT INTO `trip` (`ID`, `ID_client`, `ID_car`, `since`, `days`, `cost`) VALUES
(1, 4, 4, '2023-04-02', 5, 5000),
(2, 3, 2, '2023-04-01', 3, 3000),
(3, 1, 4, '2023-05-15', 7, 2599),
(4, 1, 8, '2023-04-04', 10, 2999),
(5, 1, 9, '2023-05-24', 2, 4000),
(6, 2, 7, '2023-05-01', 15, 3000),
(7, 2, 6, '2023-06-01', 1, 5000),
(8, 2, 1, '2023-02-16', 7, 3000),
(9, 4, 3, '2023-05-26', 3, 3000),
(10, 3, 8, '2022-12-31', 3, 5000),
(11, 4, 9, '2022-12-31', 4, 4000),
(12, 3, 7, '2023-05-02', 5, 5000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_color` (`ID_color`),
  ADD KEY `ID_model` (`ID_model`),
  ADD KEY `ID_owner` (`ID_owner`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `das model`
--
ALTER TABLE `das model`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_brand` (`ID_brand`);

--
-- Индексы таблицы `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_client` (`ID_client`);

--
-- Индексы таблицы `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_car` (`ID_car`),
  ADD KEY `ID_client` (`ID_client`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID марки', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `car`
--
ALTER TABLE `car`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID машины', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID пользователя', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `color`
--
ALTER TABLE `color`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID цвета', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `das model`
--
ALTER TABLE `das model`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID модели', AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `donations`
--
ALTER TABLE `donations`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID пополнения баланса', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `owners`
--
ALTER TABLE `owners`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID Владельца', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `trip`
--
ALTER TABLE `trip`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID поездки', AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`ID_color`) REFERENCES `color` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`ID_model`) REFERENCES `das model` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `car_ibfk_3` FOREIGN KEY (`ID_owner`) REFERENCES `owners` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `das model`
--
ALTER TABLE `das model`
  ADD CONSTRAINT `das model_ibfk_1` FOREIGN KEY (`ID_brand`) REFERENCES `brands` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `client` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`ID_car`) REFERENCES `car` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`ID_client`) REFERENCES `client` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
