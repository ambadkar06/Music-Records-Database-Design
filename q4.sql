SELECT * from dbkpop.Song
where duration = (select MAX(duration) from dbkpop.Song)