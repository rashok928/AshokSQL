create database inventory;
use inventory;
create table employ (s_no INT auto_increment primary key, e_name varchar(40), designation varchar(40), location varchar(40),gender enum('Male','Female'), 
emp_id int unique, ph_no int unique, salary int, department varchar(50), join_date date);
INSERT INTO employ (e_name, designation, location, Gender, emp_id, ph_no, salary, department, join_date) VALUES
('Ashok', 'Director', 'Tiruppur', 'Male', 001, 6548445, 100000, 'Executive', '2020-02-02'),
('Kumar', 'Director', 'Avinashi', 'Male', 002, 865154, 85000, 'Executive', '2020-02-02'),
('Niresh', 'Manager', 'Kammitiyar colony', 'Male', 003, 8786546, 50000, 'Executive', '2020-02-02'),
('Ashwin', 'Manager', 'lingampalayam', 'Male', 004, 8683225, 50000, 'Executive', '2020-04-08'),
('Siva', 'Supplier', 'Thekkalur', 'Male', 005, 8982168, 35000, 'Delivery', '2020-06-24'),
('Sabari', 'Supplier', 'Kaikattipudur', 'Male', 006, 8684353, 30000, 'Delivery', '2020-12-25'),
('Gomathy', 'Supplier', 'Ranga nagar', 'Female', 007, 7979829, 30000, 'Delivery', '2020-12-31'),
('Harish', 'Supplier', 'Sevur', 'Male', 008, 8985631, 30000, 'Delivery', '2020-02-02'),
('Kavin', 'Supplier', 'Ammapalayam', 'Male', 009, 84562175, 25000, 'Delivery', '2021-05-01'),
('Kruthika', 'Operator', 'Poondi', 'Female', 010, 95478125, 30000, 'Production', '2020-03-05'),
('Praveen', 'Operator', 'Thanneerpanthal', 'Male', 011, 95478123, 28000, 'Production', '2020-08-23'),
('Jawar', 'Filler', 'Anuparpalayam', 'Male', 012, 69478966, 29000, 'Production', '2020-03-25'),
('Archana', 'Quality Checker', 'Mangalam', 'Female', 013, 96844458, 20000, 'Quality', '2021-05-08'),
('Anjali', 'Quality Checker', 'Anaipudur', 'Female', 014, 78966548, 15000, 'Quality', '2021-12-14'),
('Abinaya', 'Security', 'Karumathampatti', 'Female', 015, 96476321, 10000, 'Security', '2021-03-06'),
('Santhosh', 'Security', 'Kunnathur', 'Male', 016, 63214945, 10000, 'Security', '2021-03-10');
Select * from Employ;
CREATE TABLE Products (pro_id INT, pro_name VARCHAR(40), emp_id INT, FOREIGN KEY (emp_id) REFERENCES Employ(emp_id), 
Delivery_loc VARCHAR(40), delivery_date DATE);
insert into products values
(201, 'Washing machine', 008, 'Avinashi', '2022-02-25'),
(203, 'Refridgerator', 008, 'Tiruppur', '2022-02-28'),
(201, 'Washing machine', 006, 'Sevur', '2022-05-01'),
(203, 'Refridgerator', 005, 'Karumathampatti', '2022-03-01'),
(203, 'Refridgerator', 006, 'Mangalam', '2022-03-08'),
(201, 'Washing machine', 009, 'Ammapalayam', '2022-04-02');
select * from products;
-- update
UPDATE employ SET salary = 26000 WHERE Emp_id = 009;
-- where
SELECT * FROM employ WHERE salary > 50000;
-- sum
SELECT SUM(salary) AS total_salary FROM employ;
-- avg
SELECT AVG(salary) AS avg_salary FROM employ;
-- order by
SELECT * FROM employ ORDER BY salary DESC;
-- group by
SELECT department, SUM(salary) AS total_salary FROM employ GROUP BY department;
-- inner join
SELECT e.e_name, e.department, p.pro_name, p.delivery_loc FROM employ e INNER JOIN Products p ON e.emp_id = p.emp_id;
-- left join
SELECT e.e_name, e.department, p.pro_name, p.delivery_loc FROM employ e LEFT JOIN Products p ON e.emp_id = p.emp_id;
-- right join
SELECT e.e_name, e.department, p.pro_name, p.delivery_loc FROM employ e RIGHT JOIN Products p ON e.emp_id = p.emp_id;
-- sub query
SELECT * FROM employ WHERE salary > (SELECT AVG(salary) FROM employ);
-- Minimum
SELECT min(salary) as 'minimum salary' from employ;
-- maximum
Select max(salary) as 'maximum salary' from employ;
-- count
select count(emp_id) from products;
-- Upper Case
select ucase(e_name) as Upper_case from employ;
-- lower case
select Lcase(e_name) as Lower_case from employ;
-- to find character length
select e_name, char_length(e_name) from employ;
 -- Concat and format
 select e_name, concat('Rs.',format(salary,0)) as Salary from employ;
-- left
select e_name , left(designation,4) from employ;
-- right
select e_name , right(designation,4) from employ;
-- Date Refference
select now(); # to get date n time
select Date(now()); # to get only date
select curdate(); # to get approximate current date when there are many dates
select date_format(curdate(),'%d/%m/%y'); # to get desired date format
select datediff(curdate(),'2024-01-15'); # to get number of days
-- Interval
select date_add(curdate(),interval 1 day) Aft_1_day;
select date_add(curdate(),interval 15 day) 15_days;  
select date_add(curdate(),interval 1 week);
select date_add(curdate(),interval 3 year);
-- Having
select salary from employ group by salary having max(salary) >= 10000;