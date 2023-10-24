select * from dbkpop.Artist 
where artistName in (select artistName from dbkpop.Releases
GROUP by artistName
HAVING COUNT(albumName)>1)