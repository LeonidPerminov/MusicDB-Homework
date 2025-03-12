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