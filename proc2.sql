CREATE PROCEDURE searchFromAlias @alias nchar(50)
AS
BEGIN
if (SELECT artistName from dbkpop.Aliases where alias=@alias)=0
BEGIN
SELECT 'Not Found' Err
END
ELSE
BEGIN
SELECT artistName from dbkpop.Aliases
where alias=@alias
END
END