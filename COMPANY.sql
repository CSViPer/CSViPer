TABLE CREATION:

create table Employee( ssn int not null , name varchar(25), address varchar(25),
sex varchar(10), salary int, superssn int, dno int,
primary key ( ssn),
FOREIGN KEY (superssn) REFERENCES Employee(ssn)
);
create table department( dno int not null , dname varchar(25), mgrssn int(25), mgrstrtdate date, primary key (dno),
FOREIGN key (mgrssn) REFERENCES employee(ssn)
);
alter table employee add FOREIGN key (dno) REFERENCES department (dno); create table dlocation (
dno int not null ,
dloc varchar(25) not null , primary key ( dno,dloc),
FOREIGN KEY (dno) REFERENCES department(dno)
);
create table project( pno int not null , pname varchar(25) , plocation varchar(25), dno int,
primary key (pno),
FOREIGN KEY (dno) REFERENCES department(dno)
);
create table works_on ( ssn int not null ,
pno int not null , hours int not null ,
primary key (ssn, pno),
FOREIGN KEY (pno) REFERENCES project(pno)
);

INSERTION:

Employee table:
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('23412356', 'JENNIFER', 'PARIS', 'FEMALE','700000', '4');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('23456781', 'JAMES', 'NEWYORK', 'MALE','300000', '4');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('33344555', 'FRANKLIN', 'CALIFORNIA','MALE', '600000', '5');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('67891234', 'JOYCE', 'WASHINGTON','FEMALE', '400000', '5');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('123456789', 'JOHN', 'TEXAS', 'MALE','300000', '5');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('888666555', 'AHMAD', 'CALIFORNIA','MALE', '700000', '4');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('984600445', 'MARK', 'WASHINGTON','MALE', '800000', '5');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('56789012', 'ALEENA', 'LONDON', 'FEMALE', '700000', '5');
INSERT INTO `employee` (`SSN`, `NAME`, `ADDRESS`, `SEX`, `SALARY`, `DNO`) VALUES ('89012345', 'ALICE', 'STAFFORD', 'FEMALE', '1200000', '5');
UPDATE `employee` SET `superssn` = '984600445' WHERE `ssn` = 23412356; 
UPDATE `employee` SET `superssn` = '67891234' WHERE `ssn` = 23456781; 
UPDATE `employee` SET `superssn` = '123456789' WHERE `ssn` = 33344555; 
UPDATE `employee` SET `superssn` = '89012345' WHERE `ssn` = 56789012; 
UPDATE `employee` SET `superssn` = '888666555' WHERE `ssn` = 67891234; 
UPDATE `employee` SET `superssn` = '56789012' WHERE `ssn` = 89012345;
UPDATE `employee` SET `superssn` = '33344555' WHERE `ssn` = 123456789; 
UPDATE `employee` SET `superssn` = '23456781' WHERE `ssn` = 888666555; 
UPDATE `department` SET `mgrssn` = '888666555' WHERE `dno` = 1; 
UPDATE `department` SET `mgrssn` = '123456789' WHERE `dno` = 4; 
UPDATE `department` SET `mgrssn` = '33344555' WHERE `dno` = 5;

Dlocation table:
INSERT INTO `dlocation` (`DNO`, `DLOC`) VALUES ('1', 'WASHINGTON');
INSERT INTO `dlocation` (`DNO`, `DLOC`) VALUES ('4', 'CALIFORNIA');
INSERT INTO `dlocation` (`DNO`, `DLOC`) VALUES ('5', 'NEW YORK');
INSERT INTO `dlocation` (`DNO`, `DLOC`) VALUES ('5', 'WASHINGTON');

Project table:
INSERT INTO project (PNAME, PNO, PLOCATION, DNO) VALUES ('PRODUCTA', 1, 'HOUSTON', 5);
INSERT INTO project (`PNAME`,
`PNO`,
`PLOCATION`,
`DNO`)
VALUES
('PRODUCTB', 2, 'WASHINGTON', 5);
INSERT INTO project (`PNAME`,
`PNO`,
`PLOCATION`,
`DNO`)
VALUES
('PRODUCTC', 3, 'CALIFORNIA', 5);
INSERT INTO project (`PNAME`,
`PNO`,
`PLOCATION`,
`DNO`)
VALUES
('COMPUTERIZATION',10,'NEW YORK',4);
INSERT INTO project (`PNAME`, `PNO`, ('IOT',20,'PARIS',1);
INSERT INTO project (`PNAME`, `PNO`, ('REORGANIZATION',30,'STAFFORD',4);
`PLOCATION`,
`PLOCATION`,
`DNO`)
`DNO`)
VALUES VALUES

Works_On table
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('123456789', '1', '33');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('123456789', '2', '8');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('984600445', '3', '40');
INSERT INTO `works_on`(`SSN`, `PNO`, `HOURS`) VALUES ('984600445', '1', '50');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('888666555', '1', '45');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('888666555', '2', '54');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '2', '10');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '3', '10');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '10', '10');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('33344555', '20', '10');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('67891234', '30', '20');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('67891234', '10', '20');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23412356', '30', '12');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23412356', '20', '14');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23456781', '20', '20');
INSERT INTO `works_on` (`SSN`, `PNO`, `HOURS`) VALUES ('23456781', '1', '34');

QUERY:

1. Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’, either as a worker or as a manager of the department that controls the project.
select distinct p.pno from project p, department d, employee e where p.dno=d.dno and d.mgrssn=e.ssn and lname="scott" union select distinct p.pno from project p, works_on w,employee e where w.pno=p.pno and w.ssn=e.ssn and lname="scott";


2. Show the resulting salaries if every employee working on the ‘IoT’ project is given a 10 percent raise.
select fname, lname, 0.1*salary from employee e, works_on w, project p where e.ssn=w.ssn and p.pno=w.pno and p.pname="iot";

3. Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the maximum salary, the minimum salary, and the average salary in this department.
select sum(salary) as SUM, max(salary) as MAX, min(salary) as MIN, avg(salary) as AVG from employee e, department d where e.dno=d.dno and dname="accounts";

4. Retrieve the name of each employee who works on all the projects controlled by department number 5 (use NOT EXISTS operator).
select name from employee where not exists ( ( select Pnumber from project where Dnum=5) except ( select pno from works_on where ssn=essn) );

5. For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than Rs. 6,00,000.
Select d.dno as D_NO,count(*) as No_Of_Employees from department d, employee e where d.dno=e.dno and e.salary>600000 and e.dno in (select dno from employee group by dno having count(*)>5) group by d.dno
