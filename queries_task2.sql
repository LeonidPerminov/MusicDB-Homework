-- 1. Название и продолжительность самого длинного трека
SELECT name, duration FROM Song ORDER BY duration DESC LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут
SELECT name FROM Song WHERE duration >= '00:03:30';

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title FROM Sbomnik WHERE year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name FROM Artist WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my»
SELECT name FROM Song WHERE name ILIKE '%мой%' OR name ILIKE '%my%';
