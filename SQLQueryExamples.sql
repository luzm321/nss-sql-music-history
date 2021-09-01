--Query all rows from Song table by column/property
SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song;

--Query only certain rows from Song table
SELECT
    Id,
    Title,
    ReleaseDate
FROM Song;

--Asterisk shortcut for selecting all columns in Song table to be used ONLY in development
SELECT * FROM Song;

--Filtering songs with duration greater than 100 seconds
SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song
WHERE SongLength > 100;

--Using left join to combine tables together into one result set
SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

--Creating new row in Genre table to represent techno music
INSERT INTO Genre (Name) VALUES ('Techno');
--Verifying techno music added to Name column of Genre table
SELECT
    Name
FROM Genre;

--Updating existing data: Change the length (in seconds) for one of the songs.
SELECT SongLength FROM Song WHERE Id = 18;
-- The following is the output you get when you run the query above.
--> 237
UPDATE Song
SET SongLength = 515
WHERE Id = 18;
-- Once you run the update statement, in order to make sure the value has changed, we run the select query again.
SELECT SongLength FROM Song WHERE Id = 18;
--> 515

--Deleting rows from database table
SELECT * FROM Song;
DELETE FROM Song WHERE Id = 18;
SELECT * FROM Song;