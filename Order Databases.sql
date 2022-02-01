TABLE CREATION:

create table salesman( salesman_id int primary key, name varchar(45),
city varchar(30), commission float
);
Create table customer( Customer_id int primary key, Cust_name varchar(35),
City varchar(25), Grade int, Salesman_id int,
Foreign key (salesman_id) REFERENCES salesman(salesman_id) ON DELETE CASCADE
);
Create table orders (
Ord_no int primary key,
Purchase_amt float, Ord_date date, Customer_id int, Salesman_id int,
Foreign key (salesman_id) REFERENCES salesman(salesman_id) ON DELETE CASCADE,
Foreign key (customer_id) REFERENCES customer_id(customer_id) ON DELETE CASCADE
);

INSERTION TABLE:

Salesman table:
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5001, 'James', 'Bangalore', 0.15);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5002, 'John', 'Bangalore', 0.13);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5003, 'Alex', 'Chennai', 0.11);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5004, 'Lyon', 'Delhi', 0.14);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5001, 'Nail', 'Delhi', 0.12);
Customer table:
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3001, 'Davis', 'Bangalore', 200, 5001);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3002, 'Rimando', 'Bangalore', 100, 5001);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3003, 'Johns', 'Delhi', 300, 5005);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3004, 'Brainard', 'Chennai', 200, 5002);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3005, 'Zusi', 'Chennai', 100, 5004);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3006, 'Shaini', 'Bangalore', 200, 5004);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3007, 'Smith', 'Mumbai', 400, 5001);
Orders table:
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7001, 150.5, '2017-01-05’, 3005, 5004);
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7002, 270.5, '2017-02-10’, 3001, 5001);
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7003, 110.5, '2016-08-17’, 3002, 5001);
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7004, 948.5, '2016-09-10’, 3005, 5004);
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7005, 2400, '2017-02-10’, 3002, 5001);
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7006, 349, '2017-02-10’, 3004, 5002);
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7007, 5500, '2017-02-10’, 3006, 5004);
INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES (7008, 65, '2017-01-05’, 3004, 5002);

QUERY:


select count(*)No_of_Customers from customer where grade > (select avg(grade) from customer where city='Bangalore');

2. Find the name and numbers of all salesman who had more than one customer.
select salesman_id,name from salesman where salesman_id in (select salesman_id from customer group by salesman_id having count(*) >1);

3. List all the salesman and indicate those who have and don’t have customers in their cities (Use UNION operation.)
select s.salesman_id from salesman s,customer c where s.salesman_id=c.salesman_id and s.city=c.city UNION select s.salesman_id from salesman s,customer c where s.salesman_id=c.salesman_id and s.city!=c.city;


4. Create a view that finds the salesman who has the customer with the highest order of a day.
create view maxorder as select`ord_date`,max(`purchase_amt`)Highest_Sales,o.salesman_id,name from orders o,salesman s where o.`salesman_id`=s.salesman_id group by`ord_date`;
select * from maxorder;

5. Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must also be deleted.
INSERT INTO `salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES ('1000', 'Livingstone', 'Hyderabad', '0.09');
INSERT INTO `customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES ('3008', 'Gabriel', 'Hyderabad', '150', '1000');
INSERT INTO `orders` (`ord_no`, `purchase_amt`, `ord_date`, `customer_id`, `salesman_id`) VALUES ('7009', '400', '2017-07-28', '3008', '1000');
Delete from salesman where salesman_id=1000;
