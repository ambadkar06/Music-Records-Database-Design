select albumName from dbkpop.Song
GROUP By albumName
HAVING count(*)=6