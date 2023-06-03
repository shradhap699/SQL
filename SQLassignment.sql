Create Table Employee(
Employee_id int primary key,
First_name VARCHAR(20),
Last_name VARCHAR(20),
Salary int,
Joining_date DATETIME,
Department char(10));
INSERT INTO Employee(Employee_id,First_name,Last_name,Salary,Joining_date,Department) Values
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Shinghal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushant','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin');

Create Table Employee_Bonus(
Employee_ref_id int foreign key(Employee_ref_id) References Employee(Employee_id),
Bonus_Amount int,
Bonus_Date DATETIME);
INSERT INTO Employee_Bonus(Employee_ref_id,Bonus_Amount,Bonus_Date) Values
(1,5000,'2020-02-16 0:00:00'),
(2,3000,'2020-02-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00');

Create Table Employee_title_table(
Employee_ref_id int,
Employee_title VARCHAR(20),
Affective_Date DATETIME);
INSERT INTO Employee_title_table(Employee_ref_id,Employee_title,Affective_Date) Values
(1,'Manager','2016-02-20 0:00:00'),
(2,'Executive','2016-06-11 0:00:00'),
(8,'Executive','2016-06-11 0:00:00'),
(5,'Manager','2016-06-11 0:00:00'),
(4,'Asst.Manager','2016-06-11 0:00:00'),
(7,'Executive','2016-06-11 0:00:00'),
(6,'Lead','2016-06-11 0:00:00'),
(3,'Lead','2016-06-11 0:00:00');
--1:- Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.
Select First_name AS Employee_name from Employee;
--2:- Display “LAST_NAME” from Employee table in upper case.
Select Upper(Last_name) from Employee; 
--3:- Display unique values of DEPARTMENT from EMPLOYEE table.
Select Distinct Department from Employee;
--4:- Display the first three characters of LAST_NAME from EMPLOYEE table.
Select left(Last_name,3) from Employee;
--5:- Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
Select Distinct Department, len(Department) as length from Employee;
--6:- Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.
Select Concat( First_name,' ',Last_name) AS FULL_NAME FROM Employee;
--7:- DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
Select * from Employee order by First_name ASC;
--8:- Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * from Employee order by First_name ASC, Department DESC;
--9:- Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
Select * from Employee where First_name ='Veena' or First_name ='Karan';
--10:- Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select * from employee where department like ‘Admin’
--11:- DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
Select * from Employee where First_name like '%V%';
---12:- DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
Select * from Employee where Salary between 100000 and 500000;
---13:- Display details of the employees who have joined in Feb-2020.
Select * from Employee where month(Joining_date)='2';
--14:- Display employee names with salaries >= 50000 and <= 100000.
Select concat(First_name,' ', last_name) from Employee where Salary between 50000 and 100000;
--16:- DISPLAY details of the EMPLOYEES who are also Managers.
Select * from Employee_title_table where Employee_title='Manager';
--17:- DISPLAY duplicate records having matching data in some fields of a table.
Select department,count(*) as Numbers from employee group by department having count(department)>1;
--18:- Display only odd rows from a table.
Select * from employee where (employee_id %2)=1;
--19:- Clone a new table from EMPLOYEE table.
Select * from Employee;Select* into Employee_clone from Employee;select * from Employee_clone;
--20:- DISPLAY the TOP 2 highest salary from a table.
Select top(2) salary from employee order by salary desc;
---21:- DISPLAY the list of employees with the same salary.
Select * From Employee where salary like(select salary from employee group by salary having count(salary)>1);
---22:- Display the second highest salary from a table.
Select Max(salary) from employee where salary<(select max(salary) from employee);
---23:- Display the first 50% records from a table.
Select top (50) percent * from employee;
---24:- Display the departments that have less than 4 people in it.
Select count(department)[No. of Employee]from Employee group by department having count(*)<4;
---25:- Display all departments along with the number of people in there.
Select count(department) from Employee group by department;
---26:- Display the name of employees having the highest salary in each department
Select concat(first_name,' ', last_name)Name,salary,department from employee where salary in(select max(salary) from employee group by department);
---27:- Display the names of employees who earn the highest salary
Select concat(first_name, ' ', last_name)Name from employee where salary in(select max(salary) from employee group by department);
---28:- Display the average salaries for each department
Select Avg(salary) from employee group by department;
--29:- display the name of the employee who has got maximum bonus
Select concat(First_name,' ',Last_name) from Employee inner join Employee_Bonus on Employee_id=Employee_ref_id where Bonus_Amount in (select max(Bonus_Amount) from Employee_Bonus);
--30:- Display the first name and title of all the employees
Select First_name, Employee_title from Employee inner join Employee_title_table on Employee_id=Employee_ref_id;


 

