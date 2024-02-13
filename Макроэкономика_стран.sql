-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 13 2024 г., 21:04
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Macroeconomics`
--

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL COMMENT 'ID Страны',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Страны',
  `capital` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Столицы',
  `population` int(123) NOT NULL COMMENT 'Население',
  `square` int(123) NOT NULL COMMENT 'Площадь(в км^2)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `country`, `capital`, `population`, `square`) VALUES
(1, 'Россия', 'Москва', 146203613, 17098246),
(2, 'США', 'Вашингтон', 336000000, 9600000),
(5, 'Китай', 'Пекин', 1409000000, 9598962),
(7, 'Великобритания', 'Лондон', 69425995, 243610),
(8, 'Германия', 'Берлин', 84400000, 357592);

-- --------------------------------------------------------

--
-- Структура таблицы `economy`
--

CREATE TABLE `economy` (
  `country_id` int(11) NOT NULL COMMENT 'ID_Страны',
  `year` year(4) NOT NULL COMMENT 'Год',
  `GDP` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ВВП',
  `GDP_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ВВП на человека'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `economy`
--

INSERT INTO `economy` (`country_id`, `year`, `GDP`, `GDP_person`) VALUES
(1, 2022, '2,24 USD трлн', '10079 USD'),
(2, 2022, '25,46 USD трлн', '76348 USD '),
(5, 2022, '18,1 USD трлн ', '12810 USD'),
(7, 2022, '3,776 USD трлн', '47232 USD'),
(8, 2022, '5 USD трлн', '63500 USD');

-- --------------------------------------------------------

--
-- Структура таблицы `event`
--

CREATE TABLE `event` (
  `country_id` int(11) NOT NULL COMMENT 'ID_Страны',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'Описание',
  `date` date NOT NULL COMMENT 'Дата'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `event`
--

INSERT INTO `event` (`country_id`, `description`, `date`) VALUES
(1, 'ЦБ поднял ключевую ставку до 8,5% годовых', '2022-07-21'),
(2, 'ФРС повысила ставку на 25 базисных пунктов до 5,25%-5,5%', '2023-05-03'),
(5, 'снижение ставки по среднесрочным кредитам до 2,5 процента', '2023-08-15'),
(7, 'Банк Англии решил повысить процентную ставку на 0,25% до 5,25%', '2023-11-01'),
(8, 'Размер учетной ставки центрального банка вырос до 4.5 %', '2023-09-02');

-- --------------------------------------------------------

--
-- Структура таблицы `trade turnover`
--

CREATE TABLE `trade turnover` (
  `id_country1` int(11) NOT NULL COMMENT 'ID первой страны',
  `id_country2` int(11) NOT NULL COMMENT 'ID второй страны',
  `year` year(4) NOT NULL COMMENT 'Год',
  `export_from_country1_to_country2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Экспорт из страны 1 в страну 2',
  `export_from_country2_to_country1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Экспорт из страны 2 в страну 1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `trade turnover`
--

INSERT INTO `trade turnover` (`id_country1`, `id_country2`, `year`, `export_from_country1_to_country2`, `export_from_country2_to_country1`) VALUES
(1, 5, 2023, '5,18 USD млрд', '110,97 USD  млрд'),
(1, 8, 2023, '3,5 USD млрд', '8,3 USD млрд'),
(1, 7, 2023, '2,9 USD млрд', '7,6 USD млрд'),
(1, 2, 2023, '3 USD млрд', '0,36 USD млрд'),
(5, 2, 2023, '458 USD млрд', '149 USD млрд');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `economy`
--
ALTER TABLE `economy`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `trade turnover`
--
ALTER TABLE `trade turnover`
  ADD KEY `id_country1` (`id_country1`),
  ADD KEY `trade turnover_ibfk_2` (`id_country2`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Страны', AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `economy`
--
ALTER TABLE `economy`
  ADD CONSTRAINT `economy_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Ограничения внешнего ключа таблицы `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Ограничения внешнего ключа таблицы `trade turnover`
--
ALTER TABLE `trade turnover`
  ADD CONSTRAINT `trade turnover_ibfk_1` FOREIGN KEY (`id_country1`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `trade turnover_ibfk_2` FOREIGN KEY (`id_country2`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
