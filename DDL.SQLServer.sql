CREATE SCHEMA dbkpop
GO

GO


CREATE TABLE dbkpop.Artist
(
	artistName nvarchar(50) NOT NULL,
	CONSTRAINT Artist_PK PRIMARY KEY(artistName)
)
GO


CREATE TABLE dbkpop.Musician
(
	musicianName nvarchar(50) NOT NULL,
	dateOfBirth date NOT NULL,
	CONSTRAINT Musician_PK PRIMARY KEY(musicianName)
)
GO


CREATE TABLE dbkpop.Band
(
	bandName nvarchar(50) NOT NULL,
	wasFormedOnDate date NOT NULL,
	leader nvarchar(50),
	brokeOnDate date,
	CONSTRAINT Band_PK PRIMARY KEY(bandName)
)
GO


CREATE VIEW dbkpop.Band_UC (leader)
WITH SCHEMABINDING
AS
	SELECT leader
	FROM 
		dbkpop.Band
	WHERE leader IS NOT NULL
GO


CREATE UNIQUE CLUSTERED INDEX Band_UCIndex ON dbkpop.Band_UC(leader)
GO


CREATE TABLE dbkpop.BandMembers
(
	bandName nvarchar(50) NOT NULL,
	dateOfJoining date NOT NULL,
	musicianName nvarchar(50) NOT NULL,
	dateOfLeaving date NOT NULL,
	CONSTRAINT BandMembers_PK PRIMARY KEY(musicianName, bandName, dateOfJoining)
)
GO


CREATE TABLE dbkpop.Album
(
	albumName nvarchar(50) NOT NULL,
	isASingle bit,
	CONSTRAINT Album_PK PRIMARY KEY(albumName)
)
GO


CREATE TABLE dbkpop.Releases
(
	albumName nvarchar(50) NOT NULL,
	artistName nvarchar(50) NOT NULL,
	lang nchar(50) NOT NULL,
	recordLabelName nvarchar(50) NOT NULL,
	releaseDate date NOT NULL,
	CONSTRAINT Releases_PK PRIMARY KEY(artistName, albumName, recordLabelName, releaseDate, lang)
)
GO


CREATE TABLE dbkpop.Song
(
	songName nvarchar(50) NOT NULL,
	albumName nvarchar(50) NOT NULL,
	duration decimal(38,38) NOT NULL,
	CONSTRAINT Song_PK PRIMARY KEY(songName)
)
GO


CREATE TABLE dbkpop.Aliases
(
	alias nchar(50) NOT NULL,
	artistName nvarchar(50) NOT NULL,
	CONSTRAINT Aliases_PK PRIMARY KEY(alias, artistName)
)
GO


ALTER TABLE dbkpop.Musician ADD CONSTRAINT Musician_FK FOREIGN KEY (musicianName) REFERENCES dbkpop.Artist (artistName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.Band ADD CONSTRAINT Band_FK1 FOREIGN KEY (leader) REFERENCES dbkpop.Musician (musicianName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.Band ADD CONSTRAINT Band_FK2 FOREIGN KEY (bandName) REFERENCES dbkpop.Artist (artistName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.BandMembers ADD CONSTRAINT BandMembers_FK1 FOREIGN KEY (musicianName) REFERENCES dbkpop.Musician (musicianName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.BandMembers ADD CONSTRAINT BandMembers_FK2 FOREIGN KEY (bandName) REFERENCES dbkpop.Band (bandName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.Releases ADD CONSTRAINT Releases_FK1 FOREIGN KEY (artistName) REFERENCES dbkpop.Artist (artistName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.Releases ADD CONSTRAINT Releases_FK2 FOREIGN KEY (albumName) REFERENCES dbkpop.Album (albumName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.Song ADD CONSTRAINT Song_FK FOREIGN KEY (albumName) REFERENCES dbkpop.Album (albumName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE dbkpop.Aliases ADD CONSTRAINT Aliases_FK FOREIGN KEY (artistName) REFERENCES dbkpop.Artist (artistName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


GO