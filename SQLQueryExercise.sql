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
SELECT
	ArtistName "Artist Name",
	Name AS [Genre Name]
FROM Album
INNER JOIN Artist
ON Album.ArtistId = Artist.Id
INNER JOIN Genre
ON Album.GenreId = Genre.Id
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
WHERE s.Id IS NULL;
--WHERE COUNT(s.AlbumId) = 0;

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
INSERT INTO Artist (ArtistName) VALUES ('Mamamoo');
--Verifying Mamamoo added to ArtistName column of Artist table
SELECT
    ArtistName
FROM Artist;