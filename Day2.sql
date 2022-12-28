create table Dept(
deptid int primary key,
deptname varchar(10)
)
alter table Dept alter column deptname varchar(20)
drop table Employee
create table Employee(
empid int primary key,
empname varchar(20) not null,
email varchar(40) unique,
age int check (age>18),
country varchar(20) default 'India',
salary int check (salary>15000),
deptid int foreign key references Dept(deptid)
)
insert into Dept values(1,'HR')
insert into Dept values(2,'Manager')
insert into Dept values(3,'Development')
insert into Dept values(4,'Sales')
insert into Dept values(5,'Testing')
Employee(empid,empname,email,age,country,salary,deptid)values(1,'Rahul','rahul@gmail.com',23,1)
insert into Employee values(1,'John','john2@gmail.com',35,'UK',45000,1)
insert into Employee values(2,'Rohit','Rohit@gmail.com',45,'India',35000,1)
insert into Employee values(3,'Rahul','Rahul@gmail.com',35,'Russia',45000,1)
insert into Employee values(4,'Hitesh','Hitesh@gmail.com',25,'India',35000,2)
insert into Employee values(5,'Sagar','Sagar@gmail.com',35,'UK',35500,2)
insert into Employee values(6,'Varun','Varun@gmail.com',38,'China',40000,2)
insert into Employee values(7,'Hardik','Hardik@gmail.com',25,'Russia',15500,3)
insert into Employee values(8,'Rakesh','Rakesh@gmail.com',25,'USA',16000,3)
insert into Employee values(9,'Arun','Arun@gmail.com',35,'USA',20000,3)
insert into Employee values(10,'Suresh','Suresh@gmail.com',36,'India',25000,4)
insert into Employee values(11,'Payal','payal@gmail.com',45,'USA',35000,5)
insert into Employee values(12,'Kavita','kavita@gmail.com',36,'China',25000,4)
insert into Employee values(13,'Rajesh','rajesh@gmail.com',28,'UK',25000,5)
insert into Employee values(14,'Anita','anita@gmail.com',24,'India',45000,4)
insert into Employee values(15,'Sneha','sneha@gmail.com',23,'China',45000,4)

update Employee set email='rohit@gmail.com' where empid=2
update Employee set email='rahul@gmail.com' where empid=3
update Employee set email='hitesh@gmail.com' where empid=4
update Employee set email='sagar@gmail.com' where empid=5
update Employee set email='varun@gmail.com' where empid=6
update Employee set email='hardik@gmail.com' where empid=7
update Employee set email='rakesh@gmail.com' where empid=8
update Employee set email='arun@gmail.com' where empid=9
update Employee set email='suresh@gmail.com' where empid=10

delete from Employee where empid=11
delete from Employee where empid=12
delete from Employee where empid=13
delete from Employee where empid=14
delete from Employee where empid=15

select empname,age,salary,country from Employee

select * from Employee where empid=1

select * from Employee where country='china'

select * from Employee where empid<10
select * from Employee where salary>=35000

select * from Employee where age >30
--range
select * from Employee where salary between 25000 and 35000
select * from Employee where salary>25000 and age>25
select * from Employee where (salary>30000 and  (country='india' or country='china'))
select * from Employee where (salary>25000 and ( country='india' or country='china') and deptid=2)

Select*from Dept
Select*from Employee
sp_help Employee
sp_help Dept
