TABLE CREATION:

CREATE TABLE Actor (
Act_Id INT,
Act_Name VARCHAR(25), Act_Gender CHAR(1), PRIMARY KEY(Act_Id)
);
CREATE TABLE Director (
Dir_Id INT NOT NULL,
Dir_Name VARCHAR(25) NOT NULL,
Dir_Phone INT NOT NULL, PRIMARY KEY (Dir_Id)
);
CREATE TABLE Movies (
Mov_Id INT NOT NULL,
Mov_Title VARCHAR(50) NOT NULL,
Mov_Year INT NOT NULL,
Mov_Lang VARCHAR(15) NOT NULL, Dir_Id INT NOT NULL,
PRIMARY KEY (Mov_Id),
FOREIGN key (Dir_Id) references Director(Dir_Id) on DELETE CASCADE
);
CREATE TABLE Movie_Cast (
Act_id INT NOT NULL , Mov_Id INT NOT NULL,
Role VARCHAR(45) NOT NULL ,
PRIMARY KEY (Act_id, Mov_Id),
FOREIGN KEY (Act_Id) REFERENCES Actor(Act_Id) on DELETE CASCADE,
FOREIGN KEY (Mov_Id) REFERENCES movies(Mov_Id) on DELETE CASCADE
);
CREATE TABLE Rating (
Mov_Id INT NOT NULL ,
Rev_Stars INT NOT NULL, PRIMARY KEY (Mov_Id),
FOREIGN KEY (Mov_Id) REFERENCES Movies(Mov_Id) on DELETE CASCADE
);

DATA INSERTION:

Actor table:
INSERT INTO `actor` (`Act_Id`, `Act_Name`, `Act_Gender`) VALUES ('101', 'James', 'M'), ('102', 'Deborah', 'F'), ('103', 'Peter', 'M'), ('104', 'Robert', 'M'), ('105', 'Murray', 'M');
INSERT INTO `actor` (`Act_Id`, `Act_Name`, `Act_Gender`) VALUES ('106', 'Harrison', 'M'), ('107', 'Nicole', 'F'), ('108', 'Stephen', 'M'), ('109', 'Jack', 'M'), ('110', 'Kate', 'F');


Director table:
INSERT INTO `director` (`Dir_Id`, `Dir_Name`, `Dir_Phone`) VALUES ('201', 'Alfred', '675409'), ('202', 'Jack', '689543'), ('203', 'David', '660908'), ('204', 'Michael', '656432'),
('205', 'Milos', '600944');
INSERT INTO `director` (`Dir_Id`, `Dir_Name`, `Dir_Phone`) VALUES ('206', 'Stanley', '677543'), ('207', 'Roman', '660089');


Movies table:
INSERT INTO `movies` (`Mov_Id`, `Mov_Title`, `Mov_Year`, `Mov_Lang`, `Dir_Id`) VALUES ('1', 'Vertigo', '1994', 'English', '201'),
('2', 'Innocents', '1997', 'English', '201'), 
('3', 'Deer Hunter', '1972', 'English', '202'), 
('4', 'Eyes Wid Shut', '2002', 'English', '202'), 
('5', 'Wings', '2016', 'English', '203'), 
('6', 'Usual Suspects', '2006', 'English', '204'), 
('7', 'Samurai', '2017', 'English', '205'), 
('8', 'The Prestige', '2016', 'English', '206'), 
('9', 'American Beauty', '2015', 'English', '201'), 
('10', 'Walls', '2000', 'English', '207');


Movie_cast table:
INSERT INTO `movie_cast` (`Act_id`, `Mov_Id`, `Role`) VALUES 
('101', '1', 'James'), ('101', '6', 'Fero'), ('101', '2', 'Eddie'), ('102', '5', 'July'), ('103', '3', 'John'), ('104', '7', 'Adam'),
('105', '8', 'Manus'), ('106', '1', 'Rick'), ('107', '8', 'Rose'), ('107', '9', 'Sam'), ('108', '1',
'Rock'), ('108', '5', 'Bobby'), ('109', '10', 'Ed'), ('110', '4', 'Cathie');

Rating table:
INSERT INTO `rating` (`Mov_Id`, `Rev_Stars`) VALUES ('1', '3'), ('3', '2'), ('4', '5'), ('5', '4'), ('6', '3'), ('7', '2'), ('8', '1'), ('9', '5'), ('10', '4');

QUERY:

1. List the titles of all movies directed by ‘Hitchcock’.
select m.mov_title from movies m,director d where d.dir_id=m.dir_id and d.Dir_Name ='Hitchcock';

2. Find the movie names where one or more actors acted in two or more movies.
select mov_title from movies where mov_id in( select mov_id from movie_cast where act_id in( select act_id from movie_cast group by act_id having count(*)>1));
(OR)
select distinct(mov_title) from movies join movie_cast on movies.mov_id = movie_cast.mov_id and act_id in( select act_id from movie_cast group by act_id having count(*)>1);

3. List all actors who acted in a movie before 2000 and also in a movie after 2015 (use JOIN operation).
SELECT A.act_id FROM
(SELECT act_id FROM movie_cast join movies on movie_cast.Mov_Id = movies.Mov_Id WHERE mov_year<2000 )A ,
(SELECT act_id FROM movie_cast join movies on movie_cast.Mov_Id=movies.Mov_Id WHERE mov_year>2015) B where A.act_id =B.act_id;

4. Find the title of movies and number of stars for each movie that has at least one rating and find the highest number of stars that movie received. Sort the result by movie title.
SELECT mov_title,rev_stars from movies m,rating r where m.mov_id=r.mov_id order by mov_title;

5. Update rating of all movies directed by ‘Steven Spielberg’ to 5.
update rating r set rev_stars=5 where r.mov_id = (select m.mov_id from movies m,director d where m.dir_id=d.dir_id and Dir_Name='Steven Spielberg');
