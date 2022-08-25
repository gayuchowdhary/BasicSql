CREATE DATABASE BasicSql;
USE BasicSql;
CREATE TABLE BasicSql.Employee  
(  
EmployeeID int,  
EmoloyeeName varchar(255),    
Email varchar(255),  
Address varchar(255),  
Gender char(1),
Salary float
);  

insert into Employee (EmployeeID, EmoloyeeName,Email, Gender, salary, Address) values ('4', 'monika','moni@gmail.com','F','31000.0','bng');

insert into Employee (EmployeeID, EmoloyeeName,Email, Gender, salary, Address) values ('2', 'sirisha','babysirisha@gmail.com','F','30080.0','kphb');

insert into Employee (EmployeeID, EmoloyeeName,Email, Gender, salary, Address) values ('3' ,'mahesh','mahesh@gmail.com','m','20000.0','hyd');

select * from BasicSql.Employee where EmoloyeeName = 'mahesh';

alter table BasicSql.Employee rename column Salary to EmpSalary;

create table salary as select EmployeeID,EmoloyeeName,EmpSalary from BasicSql.Employee;

describe salary;

select * from Employee;
update Employee set EmpSalary = '35000' where EmoloyeeName = 'Gayathri';

select sum(EmpSalary) from Employee where Gender = 'F' group by Gender;

select sum(EmpSalary) from Employee where Gender = 'M' group by Gender;

select count(*) from Employee where Gender = 'F';

select avg(EmpSalary) from Employee where Gender = 'F' group by Gender;


select min(EmpSalary) from Employee where Gender = 'M' group by Gender;
select max(EmpSalary) from Employee where Gender = 'M' group by Gender;
select * from Employee order by EmpSalary desc;
select * from Employee order by EmpSalary asc;


create view view1 as select EmoloyeeName , EmpSalary from Employee where Address = "hyd";
select * from view1;
select * from Employee where EmpSalary = "20000" AND Address = "hyd";

select * from Employee where Address in ('hyd','kphb');

select * from Employee where EmpSalary between 30000 AND 40000;
select EmployeeID as Id, EmoloyeeName as Name from Employee;
select * from Employee;

create table Orders(OrderId int Not Null, CustomerId int, OrderDate date);
create table Customers(CustomerId int Not Null, CustomerName varchar(255), country varchar(255),Mobile varchar(10));
create table BasicSql.emp(id int,name varchar(100),city varchar(100));
insert into BasicSql.emp(id, name, city) select EmployeeID,EmoloyeeName,Address from Employee where Address = 'kphb';
select * from emp;

SELECT * FROM Employee.Orders;
insert into Orders(OrderId,CustomerId,OrderDate) values('10308','3','2022-04-09');
insert into Orders(OrderId,CustomerId,OrderDate) values('10309','1','2022-05-05');
insert into Orders(OrderId,CustomerId,OrderDate) values('10310','5','2022-06-03');

SELECT OrderID FROM Orders UNION SELECT CustomerName FROM Customers;

SELECT * FROM employeedetails.Customers;
use employeedetails;

insert into Customers(CustomerId,CustomerName,country,Mobile) values('1','gayatri','India','9908742590');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('2','sirisha','India','9098456560');
insert into Customers(CustomerId,CustomerName,country,Mobile) values('3','mahesh','India','9098781234');

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
