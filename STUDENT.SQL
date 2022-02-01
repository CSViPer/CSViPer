TABLE CREATION:

create table student(
usn varchar(20)not null, sname varchar(20), address varchar(20), phone int,
gender char(1), primary key(usn)
);
create table semsec( ssid int not null, sem int,
section char(1), PRIMARY key(ssid)
);
create table class(
usn varchar(20) primary key, ssid int,
foreign key(ssid) references semsec(ssid) on delete cascade, foreign key(usn) references student(usn) on delete cascade
);
create table subject(
subcode varchar(20) primary key, title varchar(30),
sem int, credits int
);
create table iamarks( usn varchar(20), subcode varchar(20), ssid int,
test1 int, test2 int, test3 int, final int,
primary key(usn,subcode,ssid),
foreign key(usn) references student(usn) on delete cascade,
foreign key(subcode) references subject(subcode) on delete cascade, foreign key(ssid) references semsec(ssid) on delete cascade
);

INSERTION:

Student table:
insert into student (usn, sname, address, phone, gender) values ("1hk17CS01","Ajith","Bangalore",1010101010,'M'),
("1hk17CS02","Barat","Mysore",2020202020,'M'),
("1hk17CS03","Clara","Delhi",303030303,'F'),
("1hk17CS04","Denis","Pune",4040404040,'M'),
("1hk17CS05","Elisa","Patna",505050505,'F'),
("1hk17CS06","Franc","Mumbai",6060606060,'M'),
("1hk17CS07","Gaury","Bangalore",077777777,'F'),
("1hk17CS08","Harry","Kolkatta",88888870,'M'),
("1hk17CS09","Isaac","Dehradun",9090909090,'M'),
("1hk17CS010","Jay","Sikkim",111110000,'M');
insert into student(usn, sname, address, phone, gender) values ("1hk16CS41","Aman","Manipal",110110110,'M'),
("1hk16CS42","Barka","Hyderabad",1212121212,'F'),
("1hk16CS43","Chahana","Chennai",1313131313,'F'), ("1hk16CS44","Deepa","Coimbatore",1414141141,'F'), ("1hk16CS45","Emad","Mumbai",15151515,'M'),
("1hk16CS46","Faroq","Chennai",1616161616,'M'),
("1hk16CS47","Ganga","Coimbatore",17171717,'F'), ("1hk16CS48","Hemalatha","Hyderabad",1818181818,'F'), ("1hk16CS49","Inder","Bangalore",1919191919,'M'),
("1hk16CS50","Jamal","Patna",2202020202,'M');
insert into student(usn, sname, address, phone, gender) values ("1hk15CS61","Arti","Pune",2121212121,'F'),
("1hk15CS62","Barti","Delhi",2202202201,'F'),
("1hk15CS63","Ceaser","Mysore",212121212,'M'),
("1hk15CS64","Dia","Mysore",222222222,'F'), ("1hk15CS65","Elmsri","Bangalore",2323232323,'M'), ("1hk15CS67","Geetha","Bangalore",252525252,'F'),
("1hk15CS68","Harish","Bangalore",565656565,'M'),
("1hk15CS69","Iman","Bangalore",2929292929,'M'),
("1hk15CS70","Jibin","Mysore",990990909,'M'),
("1hk15CS71","Kruthi","Mysore",6767676767,'F'),
("1hk15CS72","Lara","Pune",3030303030,'F');
insert into student(usn, sname, address, phone, gender) values ("1hk14CS81", "Athiya", "Patna", 3131313131, 'F'),
("1hk14CS82", "Beema", "New Delhi", 3232323232, 'M'),
("1hk14CS83", "Chitra", "Pune",3333333333, 'F'),
("1hk14CS84", "Dipika", "Patna", 3434343434, 'F'), ("1hk14CS85", "Elizabeth", "Mumbai", 2353535355, 'F'), ("1hk14CS86", "Fakruddin", "Mumbai", 363663663, 'M'),
("1hk14CS87", "Gary", "Bangalore", 3737373737, 'M'),
("1hk14CS88", "Hema", "Kolkatta", 3838383838, 'M'),
("1hk14CS89", "Ishana", "Dehradun", 3939393939, 'F'),
("1hk14CS90", "Jason", "Manipal", 4040404040, 'M'), ("1hk14CS91", "Kirana", "Hyderabad", 4949494949, 'F'), ("1hk14CS92", "Lucky", "Chennai", 454545545, 'F');
Semsec table:
insert into semsec (ssid, sem, section) values (1,2,'A'), (2,2,'B'), (3,2,'C'), (4,4,'A'), (5,4,'B'), (6,4,'C'), (7,6,'A'), (8,6,'B'), (9,6,'C'), (10,8,'A'), (11,8,'B'), (12,8,'C');
class table:
insert into class(usn,ssid) values ("1hk17CS01",'1'), ("1hk17CS02",'1'), ("1hk17CS03",'1'),
("1hk17CS04",'2'),("1hk17CS05",'2'),("1hk17CS06",'2'),
("1hk17CS07",'3'),("1hk17CS08",'3'),("1hk17CS09",'3');
insert into class(usn,ssid) values ("1hk16CS41",'4'), ("1hk16CS42",'4'), ("1hk16CS43",'4'),
("1hk16CS44",'4'),("1hk16CS45",'5'),("1hk16CS46",'5'),("1hk16CS47",'6'),("1hk16CS48"
,'6'),("1hk16CS49",'6'),("1hk16CS50",'6');
insert into class(usn,ssid) values ("1hk15CS61",'7'), ("1hk15CS62",'7'), ("1hk15CS63",'7'),
("1hk15CS64",'8'),("1hk15CS65",'8'),("1hk15CS67",9),("1hk15CS68",9),("1hk15CS69",9
),("1hk15CS70",9),("1hk15CS71",9),("1hk15CS72",9),("1hk14CS81",10),("1hk14CS82",
10),("1hk14CS83",10),("1hk14CS84",10),("1hk14CS85",11),("1hk14CS86",11),("1hk14C
S87",11),("1hk14CS88",12),("1hk14CS89",12),("1hk14CS90",12),("1hk14CS91",12),("1h k14CS92",12);
subject table:
insert into subject(subcode,title,sem,credits) values ("15PCD23","PCD",2,4), ("15CHE21","CHEM",2,4), ("15ELN22","Basic Electronics",2,4), ("15MAT24","Maths",2,4), ("15CS42","SE",4,4), ("15CS43","DAA",4,4),
("15CS44","MP",4,4), ("15CS46","DC",4,4), ("15CS61","Cryptography",6,4),
("15CS62","CGV",6,4), ("15CS63","SS",6,4), ("15CS64","OS",6,4),
("15CS81","IOT",8,4), ("15CS82","Big Data Analytics",8,4), ("15CS834","SMS",8,4), ("15CS86","Seminar",8,4);
iamarks table:
insert into iamarks(usn,subcode,ssid,test1,test2,test3) values("1hk17CS01","15PCD23",1,10,12,14), ("1hk17CS01","15CHE21",1,11,12,13),
("1hk17CS01","15ELN22",1,13,14,15),("1hk17CS01","15MAT24",1,16,17,18),("1hk16C
S41","15CS42",4,19,20,19),("1hk16CS41","15CS43",4,20,20,20),("1hk16CS41","15CS44
",4,7,9,10),("1hk16CS41","15CS46",4,10,15,20),("1hk15CS61","15CS61",7,8,12,16),("1h
k15CS61","15CS62",7,9,13,17),("1hk15CS61","15CS63",7,10,14,18),("1hk15CS61","15
CS64",7,11,15,19),("1hk14CS81","15CS81",10,16,14,20),("1hk14CS81","15CS82",10,20,
12,13),("1hk14CS81","15CS834",10,15,16,20),("1hk14CS81","15CS86",10,20,19,18);
insert into iamarks(usn,subcode,ssid,test1,test2,test3) values("1hk14CS82","15CS81",10,12,15,18), ("1hk14CS82","15CS82",10,13,20,12),
("1hk14CS82","15CS834",10,15,16,10),("1hk14CS82","15CS86",10,12,9,8);
insert into iamarks(usn,subcode,ssid,test1,test2,test3) values("1hk14CS83","15CS81",10,2,5,8),("1hk14CS83","15CS82",10,3,12,2),("1hk14CS
83","15CS834",10,5,6,10),("1hk14CS83","15CS86",10,2,19,18);
insert into iamarks(usn,subcode,ssid,test1,test2,test3) values("1hk14CS84","15CS81",10,12,15,8),("1hk14CS84","15CS82",10,13,0,1),("1hk14
CS84","15CS834",10,15,6,1),("1hk14CS84","15CS86",10,2,19,8);
insert into iamarks(usn,subcode,ssid,test1,test2,test3) values("1hk14CS85","15CS81",11,12,5,11),("1hk14CS85","15CS82",11,13,2,13),("1hk14
CS85","15CS834",11,14,16,19),("1hk14CS85","15CS86",11,2,14,8),("1hk14CS86","15C
S81",11,12,14,13),("1hk14CS86","15CS82",11,3,2,5),("1hk14CS86","15CS834",11,4,6,9)
,("1hk14CS86","15CS86",11,13,17,18),("1hk14CS87","15CS81",11,13,15,19),("1hk14CS
87","15CS82",11,11,2,20),("1hk14CS87","15CS834",11,11,10,6),("1hk14CS87","15CS86
",11,12,4,15),("1hk14CS88","15CS81",12,9,13,19),("1hk14CS88","15CS82",12,1,2,20),("
1hk14CS88","15CS834",12,10,11,12),("1hk14CS88","15CS86",12,13,14,15),("1hk14CS8
9","15CS81",12,19,3,9),("1hk14CS89","15CS82",12,13,12,20),("1hk14CS89","15CS834"
,12,16,17,18),("1hk14CS89","15CS86",12,3,11,15),("1hk14CS90","15CS81",12,16,13,19)
,("1hk14CS90","15CS82",12,20,2,20),("1hk14CS90","15CS834",12,6,7,20),("1hk14CS90
","15CS86",12,6,12,5),("1hk14CS91","15CS81",12,19,10,20),("1hk14CS91","15CS82",1
2,2,20,20),("1hk14CS91","15CS834",12,20,12,15),("1hk14CS91","15CS86",12,12,5,20),(
"1hk14CS92","15CS81",12,9,10,20),("1hk14CS92","15CS82",12,20,19,19),("1hk14CS92","15CS834",12,20,15,13),("1hk14CS92","15CS86",12,20,20,20);

QUERY:

1. List all the student details studying in fourth semester ‘C’ section.
select s.usn,sname,address,phone,gender from student s,semsec m,class c where m.ssid=c.ssid and c.usn=s.usn and sem=4 and section='C';

2. Compute the total number of male and female students in each semester and in each section.
select sem,section,count(case when gender='m' then 1 end) as male_cnt, count(case when gender='f' then 1 end) as female_cnt from student st,class c,semsec s where s.ssid=c.ssid and c.usn=st.usn group by sem,section;

3. Create a view of Test1 marks of student USN ‘1BI15CS101’ in all subjects.
create view test1_mark as select s.subcode as Subject_Code, title as Subject_Name, test1 as Test1_Marks from iamarks i,subject s where s.subcode=i.subcode and usn ='1hk15CS61';
select * from test1_marks;

4. Calculate the FinalIA (average of best two test marks) and update the corresponding table for all students.
create view finalia as (select usn, subcode, greatest(avg(test1+test2)/2, avg(test1+test3)/2, avg(test2+test3)/2) as finalia from iamarks GROUP BY usn, subcode)
select * from finalia;
UPDATE iamarks i set final=(SELECT finalia from finalia f where i.usn=f.usn and i.subcode=f.subcode);
Select * from iamarks;

5. Categorize students based on the following criterion: If FinalIA = 17 to 20 then CAT = ‘Outstanding’
If FinalIA = 12 to 16 then CAT = ‘Average’ If FinalIA< 12 then CAT = ‘Weak’
Give these details only for 8th semester A, B, and C section students.
SELECT i.usn,s.sem,s.section,i.subcode, CASE
WHEN final >=17 AND final <=20 THEN 'Outstanding' WHEN final >=12 AND final <=16 THEN 'Average'
ELSE 'Weak' END AS CAT FROM iamarks i, class c, semsec s where i.usn=c.usn and c.ssid=s.ssid and s.sem=8 and s.section in('A','B','C');
