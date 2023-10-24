SELECT * from dbkpop.Musician
where musicianName in (select leader from dbkpop.Band)