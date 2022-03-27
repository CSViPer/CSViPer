TABLE CREATION:

create table Employee
(SSN int not null , NAME varchar(25), ADDRESS varchar(25),
SEX varchar(10), SALARY int, SUPERSSN int, DNO int,
primary key ( SSN),
FOREIGN KEY (SUPERSSN) REFERENCES Employee(SSN));
create table Department
( DNO int not null , dNAME varchar(25), MGRSSN int(25), MGRstrtdate date, primary key (DNO),
FOREIGN key (MGRSSN) REFERENCES Employee(SSN));
alter table Employee add FOREIGN key (DNO) REFERENCES Department (DNO); create table Dlocation (
DNO int not null ,
DLOC varchar(25) not null , primary key ( DNO,DLOC),
FOREIGN KEY (DNO) REFERENCES Department(DNO)
);
create table Project( PNO int not null , PNAME varchar(25) , Plocation varchar(25), DNO int,
primary key (PNO),
FOREIGN KEY (DNO) REFERENCES Department(DNO)
);
create table Works_on ( SSN int not null ,
PNO int not null , HOURS int not null ,
primary key (SSN, PNO),
FOREIGN KEY (PNO) REFERENCES Project(PNO)
);

INSERTION:

Department Table:
insert into Department(DNO,dNAME) values(1,'Accounts');
insert into Department(DNO,dNAME) values(2,'Research');
insert into Department(DNO,dNAME) values(3,'Computer');
insert into Department(DNO,dNAME) values(4,'Mechanical');
insert into Department(DNO,dNAME) values(5,'Electronics');

Employee table:
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('23412356', 'JENNIFER', 'PARIS', 'FEMALE','700000', '4');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('23456781', 'JAMES', 'NEWYORK', 'MALE','300000', '4');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('33344555', 'FRANKLIN', 'CALIFORNIA','MALE', '600000', '5');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('67891234', 'JOYCE', 'WASHINGTON','FEMALE', '400000', '5');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('123456789', 'JOHN', 'TEXAS', 'MALE','300000', '5');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('888666555', 'AHMAD', 'CALIFORNIA','MALE', '700000', '4');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('984600445', 'MARK', 'WASHINGTON','MALE', '800000', '5');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('56789012', 'ALEENA', 'LONDON', 'FEMALE', '700000', '5');
INSERT INTO `Employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('89012345', 'ALICE', 'STAFFORD', 'FEMALE', '1200000', '5');
UPDATE `Employee` SET `SUPERSSN` = '984600445' WHERE `SSN` = 23412356; 
UPDATE `Employee` SET `SUPERSSN` = '67891234' WHERE `SSN` = 23456781; 
UPDATE `Employee` SET `SUPERSSN` = '123456789' WHERE `SSN` = 33344555; 
UPDATE `Employee` SET `SUPERSSN` = '89012345' WHERE `SSN` = 56789012; 
UPDATE `Employee` SET `SUPERSSN` = '888666555' WHERE `SSN` = 67891234; 
UPDATE `Employee` SET `SUPERSSN` = '56789012' WHERE `SSN` = 89012345;
UPDATE `Employee` SET `SUPERSSN` = '33344555' WHERE `SSN` = 123456789; 
UPDATE `Employee` SET `SUPERSSN` = '23456781' WHERE `SSN` = 888666555; 
UPDATE `Department` SET `MGRSSN` = '888666555' WHERE `DNO` = 1; 
UPDATE `Department` SET `MGRSSN` = '123456789' WHERE `DNO` = 4; 
UPDATE `Department` SET `MGRSSN` = '33344555' WHERE `DNO` = 5;

Dlocation table:
INSERT INTO `Dlocation` (`DNO`, `DLOC`) VALUES ('1', 'WASHINGTON');
INSERT INTO `Dlocation` (`DNO`, `DLOC`) VALUES ('4', 'CALIFORNIA');
INSERT INTO `Dlocation` (`DNO`, `DLOC`) VALUES ('5', 'NEW YORK');
INSERT INTO `Dlocation` (`DNO`, `DLOC`) VALUES ('5', 'WASHINGTON');

Project table:
INSERT INTO Project (PNAME, PNO, PLOCATION, DNO) VALUES ('PRODUCTA', 1, 'HOUSTON', 5);
INSERT INTO Project (`PNAME`, `PNO`, `PLOCATION`, `DNO`) VALUES ('PRODUCTB', 2, 'WASHINGTON', 5);
INSERT INTO Project (`PNAME`, `PNO`, `PLOCATION`, `DNO`) VALUES ('PRODUCTC', 3, 'CALIFORNIA', 5);
INSERT INTO Project (`PNAME`, `PNO`, `PLOCATION`, `DNO`) VALUES ('COMPUTERIZATION',10,'NEW YORK',4);
INSERT INTO Project (`PNAME`, `PNO`, `PLOCATION`, `DNO`) VALUES ('IOT',20,'PARIS',1);
INSERT INTO Project (`PNAME`, `PNO`, `PLOCATION`, `DNO`) VALUES ('REORGANIZATION',30,'STAFFORD',4);

Works_on table
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('123456789', '1', '33');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('123456789', '2', '8');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('984600445', '3', '40');
INSERT INTO `Works_on`(`SSN`, `PNO`, `HOURS`) VALUES ('984600445', '1', '50');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('888666555', '1', '45');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('888666555', '2', '54');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '2', '10');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '3', '10');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '10', '10');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '20', '10');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('67891234', '30', '20');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('67891234', '10', '20');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23412356', '30', '12');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23412356', '20', '14');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23456781', '20', '20');
INSERT INTO `Works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23456781', '1', '34');

QUERY:

1. Make a list of all Project numbers for Projects that involve an Employee whose last NAME is ‘Scott’, either as a worker or as a manager of the Department that controls the Project.
select distinct p.PNO from Project p, Department d, Employee e where p.DNO=d.DNO and d.MGRSSN=e.SSN and lNAME="scott" union select distinct p.PNO from Project p, Works_on w,Employee e where w.PNO=p.PNO and w.SSN=e.SSN and lNAME="scott";


2. Show the resulting salaries if every Employee working on the ‘IoT’ Project is given a 10 percent raise.
select NAME, 0.1*SALARY from Employee e, Works_on w, Project p where e.SSN=w.SSN and p.PNO=w.PNO and p.PNAME="iot";
+----------+------------+
| NAME     | 0.1*SALARY |
+----------+------------+
| JENNIFER |    70000.0 |
| JAMES    |    30000.0 |
| FRANKLIN |    60000.0 |
+----------+------------+

3. Find the sum of the salaries of all Employees of the ‘Accounts’ Department, as well as the maximum SALARY, the minimum SALARY, and the average SALARY in this Department.
select sum(SALARY) as SUM, max(SALARY) as MAX, min(SALARY) as MIN, avg(SALARY) as AVG from Employee e, Department d where e.DNO=d.DNO and dNAME="accounts";

4. Retrieve the NAME of each Employee who works on all the Projects controlled by Department number 5 (use NOT EXISTS operator).
select NAME from Employee where not exists ( ( select Pnumber from Project where Dnum=5) except ( select PNO from Works_on where SSN=eSSN) );

5. For each Department that has more than five Employees, retrieve the Department number and the number of its Employees who are making more than Rs. 6,00,000.
Select d.DNO as D_NO,count(*) as No_Of_Employees from Department d, Employee e where d.DNO=e.DNO and e.SALARY>600000 and e.DNO in (select DNO from Employee group by DNO having count(*)>5) 
group by d.DNO;
+------+-----------------+
| D_NO | No_Of_Employees |
+------+-----------------+
|    5 |               3 |
+------+-----------------+
