-- ЗАДАНИЕ 2: SELECT-запросы

-- 1. Название и продолжительность самого длинного трека
SELECT name, duration FROM Song ORDER BY duration DESC LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут
SELECT name FROM Song WHERE duration >= '00:03:30';

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title FROM Sbomnik WHERE year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name FROM Artist WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «my» (учитываем целые слова)
SELECT name FROM Song 
WHERE name ILIKE 'my' 
   OR name ILIKE 'my %' 
   OR name ILIKE '% my' 
   OR name ILIKE '% my %';

-- ЗАДАНИЕ 3: SELECT-запросы

-- 1. Количество исполнителей в каждом жанре
SELECT g.title AS genre, COUNT(ag.artist_id) AS artist_count
FROM Genre g
LEFT JOIN Artist_Genre ag ON g.ID = ag.genre_id
GROUP BY g.title;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(s.ID) AS track_count
FROM Song s
JOIN Album a ON s.album_id = a.ID
WHERE a.year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT a.title AS album, AVG(s.duration) AS avg_duration
FROM Album a
JOIN Song s ON a.ID = s.album_id
GROUP BY a.title;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name
FROM Artist ar
WHERE ar.ID NOT IN (
    SELECT aa.artist_id FROM Album a
    JOIN Album_Artist aa ON a.ID = aa.album_id
    WHERE a.year = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель ('Queen')
SELECT DISTINCT sb.title
FROM Sbomnik sb
JOIN Sbomnik_Song ss ON sb.ID = ss.sbomnik_id
JOIN Song s ON ss.song_id = s.ID
JOIN Album a ON s.album_id = a.ID
JOIN Album_Artist aa ON a.ID = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.ID
WHERE ar.name = 'Queen';

-- Вставка данных в таблицу Album_Artist (Связь альбомов и исполнителей)
INSERT INTO Album_Artist (album_id, artist_id) VALUES
(1, 1),  -- A Night at the Opera → Queen
(2, 2),  -- Abbey Road → The Beatles
(3, 4);  -- Kind of Blue → Miles Davis

-- Дополнительные треки для проверки запроса на целые слова
INSERT INTO Song (name, year, duration, album_id) VALUES
('my own', 2023, '00:03:00', 1),
('own my', 2023, '00:02:45', 1),
('my', 2023, '00:02:30', 2),
('oh my god', 2023, '00:03:10', 3),
('myself', 2023, '00:04:00', 1),
('by myself', 2023, '00:03:50', 2),
('bemy self', 2023, '00:03:20', 3),
('myself by', 2023, '00:02:50', 1),
('by myself by', 2023, '00:04:30', 2),
('beemy', 2023, '00:02:40', 3),
('premyne', 2023, '00:03:15', 1);
