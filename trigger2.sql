CREATE TRIGGER updateArtist
ON dbkpop.Artist
FOR UPDATE
AS
DECLARE @oldName nVARCHAR(50);
DECLARE @newName nVARCHAR(50);
if UPDATE(artistName)
BEGIN
SELECT @newName=i.artistName FROM inserted as i
SELECT @oldName=d.artistName FROM deleted as d
UPDATE dbkpop.Releases
set artistName=@newName
where artistName=@oldName
UPDATE dbkpop.Band
set bandName=@newName
where bandName=@oldName
UPDATE dbkpop.Musician
set musicianName=@newName
where musicianName=@oldName
UPDATE dbkpop.Aliases
set artistName=@newName
where artistName=@oldName
END
