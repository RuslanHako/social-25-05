-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 25 2024 г., 05:33
-- Версия сервера: 8.0.31
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `social`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `author_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `author_name`, `content`, `created_at`) VALUES
(2, 3, 'ГРВ', 'Классно!\r\n', '2024-05-04 10:00:42');

-- --------------------------------------------------------

--
-- Структура таблицы `comments_for_video`
--

CREATE TABLE `comments_for_video` (
  `id` int NOT NULL,
  `video_id` int NOT NULL,
  `author_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments_for_video`
--

INSERT INTO `comments_for_video` (`id`, `video_id`, `author_name`, `content`, `upload_date`) VALUES
(1, 2, 'Золотаренко', 'Крутой видео-ролик, очень помог!', '2024-05-18 05:28:09'),
(2, 1, 'Золотаренко', 'Очень интеренсо!', '2024-05-18 05:47:14');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message_text`, `timestamp`) VALUES
(46, 15, 4, 'hjhj', '2024-04-13 06:04:13'),
(47, 15, 4, 'grgr etgrk', '2024-04-13 06:07:09'),
(48, 15, 4, '', '2024-04-13 06:07:10'),
(165, 17, 4, 'Андрей, привет!', '2024-05-04 10:02:20'),
(166, 17, 4, 'Как Дела?', '2024-05-04 10:02:29'),
(167, 18, 17, 'ГРВ, привет!', '2024-05-04 10:04:58'),
(168, 18, 17, 'Как дела?', '2024-05-04 10:05:06'),
(169, 17, 18, 'Хай, Роберт! ', '2024-05-04 10:05:58'),
(170, 17, 18, 'Все отлично, у тебя как?', '2024-05-04 10:06:15');

-- --------------------------------------------------------

--
-- Структура таблицы `music`
--

CREATE TABLE `music` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `music_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `music_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `music`
--

INSERT INTO `music` (`id`, `user_id`, `username`, `music_name`, `upload_date`, `music_path`) VALUES
(1, 23, 'Золотаренко', 'Giorgos Mazonakis - To Gucci Forema', '2024-05-18 06:36:58', 'uploads/Giorgos Mazonakis - To Gucci Forema.mp3');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `image_url`, `created_at`, `user_id`) VALUES
(3, 'Учусь программированию в ДЕЛЬФЕ!🙌', 'Заканчиваю курс программирования!✌', '', '2024-05-04 10:00:03', 17),
(4, 'Заканчиваю работу по программированию!)', 'Работа идёт.', '', '2024-05-04 16:30:54', 17);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `admin` tinyint NOT NULL,
  `us_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` tinyint DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `admin`, `us_name`, `email`, `age`, `password`, `created`, `profile_picture`, `info`) VALUES
(0, 1, 'admin', 'admin', 0, 'admin', '2024-04-20 05:06:54', NULL, NULL),
(4, 0, 'Андрей', 'f@f.ru', 22, '$2y$10$uyG2mU9DuuAesgYPzg6Zw.USiEEVYDXvwf/4qrgUfye657DM.SJcu', '2024-02-24 04:47:05', NULL, NULL),
(9, 0, 'Иванов', 'j@j.ru', 26, '$2y$10$Hk7vkaiZHiDNoOjQMzj4RuSdIbRifAFxUgrBroo8wW0GR/McIGV8.', '2024-03-02 04:11:48', NULL, NULL),
(15, 1, 'Admin', 'Admin@a.ru', 52, '$2y$10$EHXrFqJ0FHTP81MAHzDP3esaeDvGll6Wsz5enSXoXY5ElBFXNQCo6', '2024-04-13 05:41:16', NULL, NULL),
(17, 0, 'ГРВ', 'R@R.ru', 15, '$2y$10$0TQ4chxK0xBVNdwSq76K0eMrmeDe8qj2LWkqphAFLLPFFOrPW8YXa', '2024-05-04 08:30:34', 'avatars/17.jpg', 'Будущий Сеньёр!'),
(18, 0, 'Роберт', 'S@S.ru', 16, '$2y$10$48fz0Wjv0sk99.KmF0nE3.JmIj870QDijmTkeNNysCkjKfw3.oxwG', '2024-05-04 10:04:35', NULL, NULL),
(22, 0, 'Кузнецов', 't@t.ru', 89, '$2y$10$vmqekqYRAzYT9JDl/lw2UOK/Ub4juhvNVGx7fL3IQyVo3lfobCTk2', '2024-05-18 04:33:54', NULL, NULL),
(23, 0, 'Золотаренко', 'z@z.ru', 123, '$2y$10$ILPjEWd8EABLrLTbofRXUuWrSaM6tgxj3iX3wD8qE7UOYQa8/LW92', '2024-05-18 05:09:56', NULL, NULL),
(24, 0, 'Гнатенко', 'rusikgnatenko@yandex.ru', 15, '$2y$10$ssXlprE/gPoBuBvTixAA1uODyIC8PSKB.slcT1kcfE1Ptei0Z6sKu', '2024-05-25 04:46:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `videos`
--

CREATE TABLE `videos` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `video_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `video_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `video_source` enum('link','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `video_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `videos`
--

INSERT INTO `videos` (`id`, `user_id`, `username`, `video_name`, `video_description`, `video_source`, `video_path`, `upload_date`) VALUES
(1, 23, 'Золотаренко', 'js', 'Пишу классические методы CSS по-новому 🙌', 'link', 'https://www.youtube.com/embed/Kl-qyMiHkkY', '2024-05-18 05:11:01'),
(2, 23, 'Золотаренко', 'Эта новинка в CSS смогла заменить JavaScript', '', 'link', 'https://www.youtube.com/embed/dKq0R543Ofg', '2024-05-18 05:22:45');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Индексы таблицы `comments_for_video`
--
ALTER TABLE `comments_for_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_ibfk_1` (`sender_id`),
  ADD KEY `messages_ibfk_2` (`receiver_id`);

--
-- Индексы таблицы `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_ibfk_1` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `comments_for_video`
--
ALTER TABLE `comments_for_video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT для таблицы `music`
--
ALTER TABLE `music`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `comments_for_video`
--
ALTER TABLE `comments_for_video`
  ADD CONSTRAINT `comments_for_video_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
