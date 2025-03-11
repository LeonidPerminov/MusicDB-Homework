CREATE TABLE Genre (
    ID SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Genre (title) VALUES
('Rock'),
('Pop'),
('Jazz');

CREATE TABLE Artist (
    ID SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Artist (name) VALUES
('Queen'),
('The Beatles'),
('Elvis Presley'),
('Miles Davis');

CREATE TABLE Artist_Genre (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(ID) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genre(ID) ON DELETE CASCADE
);
INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
(1, 1),  
(2, 1),  
(3, 2),  
(4, 3);

CREATE TABLE Album (
    ID SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL
);
INSERT INTO Album (title, year) VALUES
('A Night at the Opera', 1975),
('Abbey Road', 1969),
('Kind of Blue', 1959);

CREATE TABLE Album_Artist (
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES Album(ID) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES Artist(ID) ON DELETE CASCADE
);

CREATE TABLE Song (
    ID SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Album(ID) ON DELETE CASCADE
);
INSERT INTO Song (name, year, album_id) VALUES
('Bohemian Rhapsody', 1975, 1), -- Queen
('Love of My Life', 1975, 1), -- Queen
('Come Together', 1969, 2), -- The Beatles
('Something', 1969, 2), -- The Beatles
('So What', 1959, 3), -- Miles Davis
('Freddie Freeloader', 1959, 3); -- Miles Davis

CREATE TABLE Sbomnik (
    ID SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL
);
INSERT INTO Sbomnik (title, year) VALUES
('Rock Classics', 2000),
('Greatest Hits', 1995),
('Jazz Legends', 2010),
('Timeless Pop', 2020);

CREATE TABLE Sbomnik_Song (
    sbomnik_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (sbomnik_id, song_id),
    FOREIGN KEY (sbomnik_id) REFERENCES Sbomnik(ID) ON DELETE CASCADE,
    FOREIGN KEY (song_id) REFERENCES Song(ID) ON DELETE CASCADE
);
INSERT INTO Sbomnik_Song (sbomnik_id, song_id) VALUES
(1, 1),  -- Rock Classics → Bohemian Rhapsody
(1, 3),  -- Rock Classics → Come Together
(2, 1),  -- Greatest Hits → Bohemian Rhapsody
(2, 2),  -- Greatest Hits → Love of My Life
(3, 5),  -- Jazz Legends → So What
(3, 6),  -- Jazz Legends → Freddie Freeloader
(4, 4),  -- Timeless Pop → Something
(4, 2);  -- Timeless Pop → Love of My Life