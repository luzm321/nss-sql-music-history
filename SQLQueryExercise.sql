--Query Exercises:

--Query all of the entries in the Genre table
SELECT * FROM Genre;
SELECT
	Id,
	Name
FROM Genre;

--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
--Default is ascending (ASC keyword), DESC is descending order, etc.
SELECT
	Id,
	ArtistName,
	YearEstablished
FROM Artist 
ORDER BY ArtistName ASC;

--Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT
	Title,
	ArtistName
FROM Song
INNER JOIN Artist
ON Song.ArtistId = Artist.Id;

--Write a SELECT query that lists all the Artists that have a Soul Album
--Different ways to rename a column/property on a table
SELECT DISTINCT
	ArtistName "Artist Name",
	Name AS [Genre Name]
FROM Album
INNER JOIN Artist
ON Album.ArtistId = Artist.Id
INNER JOIN Genre
ON Album.GenreId = Genre.Id
WHERE Album.GenreId = 1;

--Same query as above but shorter:
SELECT DISTINCT 
	ArtistName [ArtistName]
FROM Artist
INNER JOIN Album
ON Album.ArtistId = Artist.Id
WHERE Album.GenreId = 1;

--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT
	ArtistName [Artist Name],
	Name AS "Genre Name"
FROM Album
INNER JOIN Artist
ON Album.ArtistId = Artist.Id
INNER JOIN Genre
ON Album.GenreId = Genre.Id
WHERE Album.GenreId = 4 OR Album.GenreId = 2;

--Write a SELECT statement that lists the Albums with no songs
SELECT
	al.Title [Album Title],
	s.Title [Song Title]
FROM Album al 
LEFT OUTER JOIN Song s
ON s.AlbumId = al.Id
WHERE s.Title IS NULL;
--WHERE s.Id IS NULL;


SELECT 
    A.Id [Album Id],
    A.Title [Album Title],
    A.Label,
    S.Id [Song Id],
	S.Title [Song Title]
FROM 
    Album A
LEFT OUTER JOIN Song S 
ON S.AlbumId = A.Id
WHERE S.Id IS NULL;

--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('BigBang', 2006);
--Verifying BigBang added to ArtistName column of Artist table
SELECT
    ArtistName
FROM Artist;

--Inserting Kpop music into Genre table
INSERT INTO Genre (Name) VALUES ('Kpop');

SELECT 
	Name [Music Genre]
FROM Genre
WHERE Name = 'Kpop';

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) 
VALUES ('Alive', '02/29/2012', 2500, 'YG Entertainment', 43, 16);
--Verifying Alive album by BigBang inserted to Album table
SELECT * FROM Album;

--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Blue', 400, '02/29/2012', 16, 43, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Love Dust', 250, '02/29/2012', 16, 43, 23);
--Verifying Blue and Love Dust songs from Alive album added to the Song table:
SELECT * FROM Song;

--Write a SELECT query that provides the song titles, album title, and artist name for 
--all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the 
--tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT
	s.Title [Song Title],
	al.Title [Album Title],
	ArtistName
FROM 
	Album al
LEFT JOIN Song s
ON s.AlbumId = al.Id 
LEFT JOIN Artist
ON s.ArtistId = Artist.Id
WHERE al.Title = 'Alive';

--Changing direction of join to see difference in results:
--Shows albums that have null values/no songs associated (left join all albums):
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--Shows albums that have songs/no null values (left join all songs/all songs are in an album):
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT 
	COUNT(Id) [Number of Songs In Album], 
	Title
FROM  Song 
GROUP BY Title