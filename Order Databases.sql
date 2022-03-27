TABLE CREATION:

create table Salesman( Salesman_id int primary key, Name varchar(45), City varchar(30), Commission float);
Create table Customer( Customer_id int primary key, Cust_Name varchar(35),City varchar(25), Grade int, Salesman_id int,Foreign key (Salesman_id) REFERENCES Salesman(Salesman_id) ON DELETE CASCADE);
Create table Orders 
(Ord_no int primary key,
Purchase_amt float, Ord_date date, Customer_id int, Salesman_id int,
Foreign key (Salesman_id) REFERENCES Salesman(Salesman_id) ON DELETE CASCADE,
Foreign key (Customer_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE);

INSERTION OF VALUES:

Salesman table:
INSERT INTO Salesman (Salesman_id, Name, City, Commission) VALUES (5001, 'James', 'Bangalore', 0.15);
INSERT INTO Salesman (Salesman_id, Name, City, Commission) VALUES (5002, 'John', 'Bangalore', 0.13);
INSERT INTO Salesman (Salesman_id, Name, City, Commission) VALUES (5003, 'Alex', 'Chennai', 0.11);
INSERT INTO Salesman (Salesman_id, Name, City, Commission) VALUES (5004, 'Lyon', 'Delhi', 0.14);
INSERT INTO Salesman (Salesman_id, Name, City, Commission) VALUES (5005, 'Nail', 'Delhi', 0.12);
Customer table:
INSERT INTO Customer (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES (3001, 'Davis', 'Bangalore', 200, 5001);
INSERT INTO Customer (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES (3002, 'Rimando', 'Bangalore', 100, 5001);
INSERT INTO Customer (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES (3003, 'Johns', 'Delhi', 300, 5005);
INSERT INTO Customer (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES (3004, 'Brainard', 'Chennai', 200, 5002);
INSERT INTO Customer (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES (3005, 'Zusi', 'Chennai', 100, 5004);
INSERT INTO Customer (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES (3006, 'Shaini', 'Bangalore', 200, 5004);
INSERT INTO Customer (Customer_id, Cust_Name, City, Grade, Salesman_id) VALUES (3007, 'Smith', 'Mumbai', 400, 5001);
Orders table:
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7001, 150.5, '2017-01-05', 3005, 5004);
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7002, 270.5, '2017-02-10', 3001, 5001);
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7003, 110.5, '2016-08-17', 3002, 5001);
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7004, 948.5, '2016-09-10', 3005, 5004);
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7005, 2400, '2017-02-10', 3002, 5001);
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7006, 349, '2017-02-10', 3004, 5002);
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7007, 5500, '2017-02-10', 3006, 5004);
INSERT INTO Orders (Ord_no, Purchase_amt, Ord_date, Customer_id, Salesman_id) VALUES (7008, 65, '2017-01-05', 3004, 5002);

QUERY:
1.Count the customers with grades above Bangalore’s average.
    -> select count(*)No_of_Customers
    -> from Customer
    -> where Grade>(select avg(Grade) from Customer where City='Bangalore');
+-----------------+
| No_of_Customers |
+-----------------+
|               5 |
+-----------------+

2. Find the Name and numbers of all Salesman who had more than one Customer.
    -> select Salesman_id,Name
    -> from Salesman
    -> where Salesman_id in (Select Salesman_id from Customer group by Salesman_id having count(*)>1);
+-------------+-------+
| Salesman_id | Name  |
+-------------+-------+
|        5001 | James |
|        5004 | Lyon  |
+-------------+-------+


3. List all the Salesman and indicate those who have and don’t have Customers in their cities (Use UNION operation.)
select s.Salesman_id from Salesman s,Customer c where s.Salesman_id=c.Salesman_id and s.City=c.City UNION select s.Salesman_id from Salesman s,Customer c where s.Salesman_id=c.Salesman_id and s.City!=c.City;
+-------------+
| Salesman_id |
+-------------+
|        5001 |
|        5005 |
|        5002 |
|        5004 |
+-------------+



4. Create a view that finds the Salesman who has the Customer with the highest Order of a day.
    -> create view maxorder as
    -> select Ord_date,max(Purchase_amt)Highest_Sales,o.Salesman_id,Name
    -> from Orders o, Salesman s
    -> where o.Salesman_id=s.Salesman_id
    -> group by Ord_date;


5. Demonstrate the DELETE operation by removing Salesman with id 1000. All his Orders must also be deleted.
INSERT INTO `Salesman` (`Salesman_id`, `Name`, `City`, `Commission`) VALUES ('1000', 'Livingstone', 'Hyderabad', '0.09');
INSERT INTO `Customer` (`Customer_id`, `Cust_Name`, `City`, `Grade`, `Salesman_id`) VALUES ('3008', 'Gabriel', 'Hyderabad', '150', '1000');
INSERT INTO `Orders` (`Ord_no`, `Purchase_amt`, `Ord_date`, `Customer_id`, `Salesman_id`) VALUES ('7009', '400', '2017-07-28', '3008', '1000');
Delete from Salesman where Salesman_id=1000;
