CREATE PROCEDURE deleteAlbum @albumName nvarchar(50)
AS
BEGIN
DELETE FROM dbkpop.Song WHERE albumName=@albumName;
DELETE FROM dbkpop.Album WHERE albumName=@albumName;
DELETE FROM dbkpop.Releases WHERE albumName=@albumName;
COMMIT
END