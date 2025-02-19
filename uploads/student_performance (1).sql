-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 04 2024 г., 12:23
-- Версия сервера: 8.0.36
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `student_performance`
--

-- --------------------------------------------------------

--
-- Структура таблицы `grades`
--

CREATE TABLE `grades` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `grade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `subject_id`, `grade`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 2),
(3, 1, 3, 2),
(4, 1, 4, 2),
(5, 1, 5, 1),
(6, 2, 1, 1),
(7, 2, 2, 2),
(8, 2, 3, 5),
(9, 2, 4, 1),
(10, 2, 5, 2),
(11, 3, 1, 3),
(12, 3, 2, 3),
(13, 3, 3, 2),
(14, 3, 4, 3),
(15, 3, 5, 1),
(16, 4, 1, 3),
(17, 4, 2, 5),
(18, 4, 3, 3),
(19, 4, 4, 3),
(20, 4, 5, 2),
(21, 5, 1, 1),
(22, 5, 2, 1),
(23, 5, 3, 5),
(24, 5, 4, 5),
(25, 5, 5, 5),
(26, 6, 1, 4),
(27, 6, 2, 3),
(28, 6, 3, 2),
(29, 6, 4, 1),
(30, 6, 5, 3),
(31, 7, 1, 2),
(32, 7, 2, 5),
(33, 7, 3, 5),
(34, 7, 4, 5),
(35, 7, 5, 5),
(36, 8, 1, 1),
(37, 8, 2, 3),
(38, 8, 3, 2),
(39, 8, 4, 4),
(40, 8, 5, 3),
(41, 9, 1, 4),
(42, 9, 2, 5),
(43, 9, 3, 1),
(44, 9, 4, 4),
(45, 9, 5, 4),
(46, 10, 1, 3),
(47, 10, 2, 2),
(48, 10, 3, 1),
(49, 10, 4, 2),
(50, 10, 5, 2),
(51, 11, 1, 4),
(52, 11, 2, 3),
(53, 11, 3, 1),
(54, 11, 4, 3),
(55, 11, 5, 1),
(56, 12, 1, 4),
(57, 12, 2, 3),
(58, 12, 3, 5),
(59, 12, 4, 3),
(60, 12, 5, 5),
(61, 13, 1, 4),
(62, 13, 2, 5),
(63, 13, 3, 1),
(64, 13, 4, 4),
(65, 13, 5, 5),
(66, 14, 1, 1),
(67, 14, 2, 5),
(68, 14, 3, 4),
(69, 14, 4, 4),
(70, 14, 5, 3),
(71, 15, 1, 4),
(72, 15, 2, 4),
(73, 15, 3, 3),
(74, 15, 4, 4),
(75, 15, 5, 1),
(76, 16, 1, 2),
(77, 16, 2, 5),
(78, 16, 3, 5),
(79, 16, 4, 4),
(80, 16, 5, 1),
(81, 17, 1, 5),
(82, 17, 2, 1),
(83, 17, 3, 2),
(84, 17, 4, 2),
(85, 17, 5, 2),
(86, 18, 1, 2),
(87, 18, 2, 1),
(88, 18, 3, 2),
(89, 18, 4, 3),
(90, 18, 5, 3),
(91, 19, 1, 4),
(92, 19, 2, 3),
(93, 19, 3, 4),
(94, 19, 4, 2),
(95, 19, 5, 2),
(96, 20, 1, 1),
(97, 20, 2, 2),
(98, 20, 3, 3),
(99, 20, 4, 1),
(100, 20, 5, 5),
(101, 21, 6, 4),
(102, 21, 7, 1),
(103, 21, 8, 4),
(104, 21, 9, 4),
(105, 21, 10, 2),
(106, 22, 6, 4),
(107, 22, 7, 3),
(108, 22, 8, 2),
(109, 22, 9, 3),
(110, 22, 10, 2),
(111, 23, 6, 3),
(112, 23, 7, 1),
(113, 23, 8, 4),
(114, 23, 9, 5),
(115, 23, 10, 5),
(116, 24, 6, 4),
(117, 24, 7, 3),
(118, 24, 8, 5),
(119, 24, 9, 3),
(120, 24, 10, 1),
(121, 25, 6, 5),
(122, 25, 7, 1),
(123, 25, 8, 2),
(124, 25, 9, 4),
(125, 25, 10, 5),
(126, 26, 6, 3),
(127, 26, 7, 4),
(128, 26, 8, 5),
(129, 26, 9, 4),
(130, 26, 10, 3),
(131, 27, 6, 2),
(132, 27, 7, 5),
(133, 27, 8, 4),
(134, 27, 9, 5),
(135, 27, 10, 2),
(136, 28, 6, 3),
(137, 28, 7, 4),
(138, 28, 8, 4),
(139, 28, 9, 3),
(140, 28, 10, 5),
(141, 29, 6, 5),
(142, 29, 7, 2),
(143, 29, 8, 2),
(144, 29, 9, 3),
(145, 29, 10, 3),
(146, 30, 6, 4),
(147, 30, 7, 2),
(148, 30, 8, 2),
(149, 30, 9, 5),
(150, 30, 10, 4),
(151, 31, 6, 5),
(152, 31, 7, 2),
(153, 31, 8, 4),
(154, 31, 9, 2),
(155, 31, 10, 2),
(156, 32, 6, 1),
(157, 32, 7, 2),
(158, 32, 8, 2),
(159, 32, 9, 3),
(160, 32, 10, 2),
(161, 33, 6, 1),
(162, 33, 7, 2),
(163, 33, 8, 3),
(164, 33, 9, 4),
(165, 33, 10, 2),
(166, 34, 6, 2),
(167, 34, 7, 2),
(168, 34, 8, 4),
(169, 34, 9, 5),
(170, 34, 10, 5),
(171, 35, 6, 3),
(172, 35, 7, 1),
(173, 35, 8, 1),
(174, 35, 9, 3),
(175, 35, 10, 5),
(176, 36, 6, 3),
(177, 36, 7, 2),
(178, 36, 8, 5),
(179, 36, 9, 4),
(180, 36, 10, 1),
(181, 37, 6, 2),
(182, 37, 7, 1),
(183, 37, 8, 3),
(184, 37, 9, 2),
(185, 37, 10, 4),
(186, 38, 6, 5),
(187, 38, 7, 3),
(188, 38, 8, 4),
(189, 38, 9, 5),
(190, 38, 10, 2),
(191, 39, 6, 5),
(192, 39, 7, 5),
(193, 39, 8, 4),
(194, 39, 9, 5),
(195, 39, 10, 4),
(196, 40, 6, 2),
(197, 40, 7, 3),
(198, 40, 8, 5),
(199, 40, 9, 4),
(200, 40, 10, 2),
(201, 41, 6, 1),
(202, 41, 7, 4),
(203, 41, 8, 1),
(204, 41, 9, 4),
(205, 41, 10, 5),
(206, 42, 6, 4),
(207, 42, 7, 4),
(208, 42, 8, 5),
(209, 42, 9, 1),
(210, 42, 10, 4),
(211, 43, 6, 5),
(212, 43, 7, 2),
(213, 43, 8, 2),
(214, 43, 9, 1),
(215, 43, 10, 1),
(216, 44, 6, 2),
(217, 44, 7, 5),
(218, 44, 8, 2),
(219, 44, 9, 5),
(220, 44, 10, 4),
(221, 45, 6, 1),
(222, 45, 7, 5),
(223, 45, 8, 3),
(224, 45, 9, 5),
(225, 45, 10, 2),
(226, 46, 6, 1),
(227, 46, 7, 1),
(228, 46, 8, 4),
(229, 46, 9, 3),
(230, 46, 10, 2),
(231, 47, 6, 4),
(232, 47, 7, 1),
(233, 47, 8, 3),
(234, 47, 9, 2),
(235, 47, 10, 1),
(236, 48, 6, 2),
(237, 48, 7, 3),
(238, 48, 8, 1),
(239, 48, 9, 2),
(240, 48, 10, 5),
(241, 49, 6, 1),
(242, 49, 7, 4),
(243, 49, 8, 1),
(244, 49, 9, 1),
(245, 49, 10, 5),
(246, 50, 6, 3),
(247, 50, 7, 1),
(248, 50, 8, 4),
(249, 50, 9, 4),
(250, 50, 10, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int NOT NULL,
  `speciality_id` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `speciality_id`, `name`) VALUES
(1, 1, 'Группа ИСП-1'),
(2, 1, 'Группа ИСП-2'),
(3, 2, 'Группа ПИ-1'),
(4, 2, 'Группа ПИ-2'),
(5, 2, 'Группа ПИ-3');

-- --------------------------------------------------------

--
-- Структура таблицы `specialities`
--

CREATE TABLE `specialities` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `specialities`
--

INSERT INTO `specialities` (`id`, `name`) VALUES
(1, 'Информационные Системы и программирование'),
(2, 'Программная инженерия');

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`id`, `group_id`, `full_name`) VALUES
(1, 1, 'Александров Алексей Иванович'),
(2, 1, 'Борисов Борис Петрович'),
(3, 1, 'Власов Виктор Сергеевич'),
(4, 1, 'Гаврилов Гавриил Николаевич'),
(5, 1, 'Дмитриев Дмитрий Александрович'),
(6, 1, 'Ефимов Евгений Васильевич'),
(7, 1, 'Жуков Иван Федорович'),
(8, 1, 'Захаров Захар Михайлович'),
(9, 1, 'Игнатьев Игорь Владимирович'),
(10, 1, 'Кузнецов Кирилл Сергеевич'),
(11, 2, 'Ларионов Леонид Петрович'),
(12, 2, 'Макаров Максим Викторович'),
(13, 2, 'Нестеров Николай Иванович'),
(14, 2, 'Орлов Олег Николаевич'),
(15, 2, 'Петров Павел Дмитриевич'),
(16, 2, 'Романов Роман Васильевич'),
(17, 2, 'Сидоров Сергей Федорович'),
(18, 2, 'Трофимов Тимур Гаврилович'),
(19, 2, 'Ульянов Ульян Михайлович'),
(20, 2, 'Федоров Филипп Александрович'),
(21, 3, 'Харитонов Харитон Сергеевич'),
(22, 3, 'Царев Цезарь Петрович'),
(23, 3, 'Чижов Чарльз Викторович'),
(24, 3, 'Шаповалов Шаповал Николаевич'),
(25, 3, 'Щербаков Щербак Васильевич'),
(26, 3, 'Степанов Степан Степанович'),
(27, 3, 'Николаев Николай Николаевич'),
(28, 3, 'Фролов Фрол Фролович'),
(29, 3, 'Макаров Макар Макарович'),
(30, 3, 'Котов Кот Котович'),
(31, 4, 'Борисов Борис Борисович'),
(32, 4, 'Константинов Константин Константинович'),
(33, 4, 'Ларионов Ларион Ларионович'),
(34, 4, 'Михайлов Михаил Михайлович'),
(35, 4, 'Сергеев Сергей Сергеевич'),
(36, 4, 'Алексеев Алексей Алексеевич'),
(37, 4, 'Архипов Архип Архипович'),
(38, 4, 'Волков Волк Волкович'),
(39, 4, 'Зайцев Заяц Зайцевич'),
(40, 4, 'Емельянов Емельян Емельянович'),
(41, 5, 'Мартынов Мартын Мартынович'),
(42, 5, 'Петухов Петух Петухович'),
(43, 5, 'Ильин Илья Ильинич'),
(44, 5, 'Гончаров Гончар Гончарович'),
(45, 5, 'Крылов Крыл Крылович'),
(46, 5, 'Белов Бел Белевич'),
(47, 5, 'Медведев Медведь Медведевич'),
(48, 5, 'Антонов Антон Антонович'),
(49, 5, 'Яковлев Яков Яковлевич'),
(50, 5, 'Громов Гром Громович');

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
(1, 'Программирование'),
(2, 'Базы данных'),
(3, 'Алгоритмы и структуры данных'),
(4, 'Операционные системы'),
(5, 'Сетевые технологии'),
(6, 'Программная инженерия'),
(7, 'Тестирование ПО'),
(8, 'Управление проектами'),
(9, 'Инженерия требований'),
(10, 'Архитектура программных систем');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `speciality_id` (`speciality_id`);

--
-- Индексы таблицы `specialities`
--
ALTER TABLE `specialities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `specialities`
--
ALTER TABLE `specialities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Ограничения внешнего ключа таблицы `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`speciality_id`) REFERENCES `specialities` (`id`);

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
