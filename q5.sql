SELECT count(*) as '2020 Release Count' from dbkpop.Song s JOIN dbkpop.Releases r
on s.albumName=r.albumName
where releaseDate >='2020' and releaseDate <'2021'