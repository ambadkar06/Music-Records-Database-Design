CREATE PROCEDURE disband @bandName NVARCHAR
AS
BEGIN
update dbkpop.Band
set brokeOnDate =  CONVERT (date, SYSDATETIME())
where bandName = @bandName;
UPDATE dbkpop.BandMembers
set dateOfLeaving =  CONVERT (date, SYSDATETIME())
where bandName=@bandName and dateOfLeaving<CONVERT (date, SYSDATETIME());
COMMIT
END