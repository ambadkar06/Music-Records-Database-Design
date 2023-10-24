CREATE TRIGGER updateAlbum
ON dbkpop.Album
FOR UPDATE
AS
DECLARE @oldAlbumName nVARCHAR(50);
DECLARE @newAlbumName nVARCHAR(50);
if UPDATE(albumName)
BEGIN
SELECT @newAlbumName=i.albumName FROM inserted as i
SELECT @oldAlbumName=d.albumName FROM deleted as d
UPDATE dbkpop.Song
set albumName=@newAlbumName
where albumName=@oldAlbumName
UPDATE dbkpop.Releases
set albumName=@newAlbumName
where albumName=@oldAlbumName
END