

CREATE TABLE IF NOT EXISTS Salesman(
  salesman_id INT PRIMARY KEY NOT NULL,
  name VARCHAR(100),
  city VARCHAR(100),
  commission NUMERIC(2, 2)
);

CREATE TABLE IF NOT EXISTS Customer(
  customer_id INT PRIMARY KEY NOT NULL,
  cust_name VARCHAR(100),
  city VARCHAR(100),
  grade NUMERIC(3),
  salesman_id INT,
  FOREIGN KEY(salesman_id) REFERENCES Salesman(salesman_id)
);

CREATE TABLE IF NOT EXISTS Orders(
  ord_no INT PRIMARY KEY NOT NULL,
  purch_amt NUMERIC(6, 2),
  ord_date DATE,
  customer_id INT,
  salesman_id INT,
  FOREIGN KEY(salesman_id) REFERENCES Salesman(salesman_id),
  FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Salesman(salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

INSERT INTO Customer(customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', null, 5005);

INSERT INTO Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009,  5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

-- 1.
select s.name as salesman_name, c.cust_name as customer_name,
c.city
from Customer c 
inner join Salesman s on c.city = s.city;

-- 2.
select ord_no, purch_amt, c.cust_name, c.city
from Orders o
inner join Customer c on o.customer_id = c.customer_id 
where o.purch_amt between 500 and 2000;

-- 3.
select c.cust_name, c.city, s.name as salesman_name, s.commission
from Salesman s 
left outer join Customer c on c.salesman_id = s.salesman_id;

-- 4.
select c.cust_name, c.city, s.name as salesman_name, s.commission
from Customer c 
left outer join Salesman s on s.salesman_id = c.salesman_id
where s.commission > 0.12;

-- 5.
select c.cust_name, c.city as cust_city, 
s.name as salesman_name, s.city as cust_city,
s.commission
from Customer c
inner join Salesman s on c.salesman_id = s.salesman_id
where c.city != s.city and s.commission > 0.12;

-- 6.
select ord_no, ord_date, purch_amt, c.cust_name,
c.grade, s.name as salesman_name, s.commission 
from Orders o 
inner join Customer c on o.customer_id = c.customer_id
inner join Salesman s on o.salesman_id = s.salesman_id;

-- 7.
select * from orders 
natural join Customer
natural join Salesman;

-- 8.
select cust_name, c.city as cust_city, c.grade,
s.name as salesman_name, s.city as salesman_city
from Customer c 
left outer join Salesman s on c.salesman_id = s.salesman_id
order by c.customer_id asc;

-- 9.
select cust_name, c.city as cust_city,
s.name as salesman_name, s.city as salesman_city
from Customer c 
left outer join Salesman s on s.salesman_id = c.salesman_id
where c.grade < 300;

-- 10.
select cust_name, c.city as cust_city,
ord_no, ord_date, purch_amt
from Orders o
right outer join Customer c on o.customer_id = c.customer_id
order by ord_date asc;

-- 11.
select cust_name, c.city as cust_city,
ord_no, ord_date, purch_amt,
s.name as salesman_name, commission
from Customer c 
left outer join Orders o on c.customer_id = o.customer_id
left outer join Salesman s on s.salesman_id = c.salesman_id;

-- 12.
select c.cust_name, c.city as cust_city, s.name as salesman_name
from Customer c 
right outer join Salesman s on c.salesman_id = s.salesman_id
order by s.salesman_id asc;

-- 13.
select s.name as salesman_name,
c.cust_name, c.city as cust_city, grade,
ord_no, ord_date, purch_amt
from Orders o
left outer join Salesman s on o.salesman_id = s.salesman_id
left outer join Customer c on o.customer_id = c.customer_id;

-- 14.
select cust_name, c.city as cust_city,
ord_no, ord_date, purch_amt
from Orders o 
left outer join Customer c on c.customer_id = o.customer_id
where c.grade is not null;

-- 15.
select * from Customer
cross join Salesman;

-- 16.
select * from Salesman
cross join customer;

-- 17.
select * from Salesman s
cross join Customer c on s.city != c.city 
where c.grade is not null;
