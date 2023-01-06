-- inner join

select e.*, d.deptname from Employee e
inner join dept d on d.deptid=e.deptid

-- left join
-- display all records from the left table & match records from another table
-- when there is no match record right table returns null

select e.*, d.deptname from Employee e
left join dept d on d.deptid=e.deptid


--right join
select e.*, d.deptname from Employee e
right join dept d on d.deptid=e.deptid

--full join
select e.*, d.deptname as 'Department Name' from Employee e
full join dept d on d.deptid=e.deptid

insert into Dept values(6,'Tech Lead')
insert into Employee values(16,'Ramesh','ramesh@gmail.com',22,'India',25000,null)

alter table employee add managerid int
update Employee set managerid=1 where empid in (2,3,4)
update Employee set managerid=12 where empid in (13,14,15)
update Employee set managerid=5 where empid in (6,7,8)
update Employee set managerid=9 where empid in (10,11,12,16)

select emp.empname,man.empname as Manager
from Employee emp ,Employee man
where man.empid=emp.managerid

create table Product(productid int,productname varchar(10))
create table Sizes(sizeid int ,sizename varchar(10))

insert into Product values (1,'T-shirt')
insert into Product values (2,'Shirt')
insert into Product values (3,'Jacket')
insert into Product values (4,'Pant')

insert into Sizes values(1,'S')
insert into Sizes values(2,'M')
insert into Sizes values(3,'L')
insert into Sizes values(4,'XL')

select p.*,s.sizename   from Product p cross join Sizes s

create table Colour(colourid int,colourname varchar(10))
insert into Colour values(1,'Red')
insert into Colour values(2,'White')
insert into Colour values(3,'Black')
insert into Colour values(4,'Blue')

select p.*,s.sizename,c.colourname   from Product p cross join Sizes s cross join Colour c
select max(salary)   as 'Max' from Employee 
select min(salary)   as 'Max' from Employee 
select avg(salary)   as 'Max' from Employee 
select count(empname) as 'Total Emp' from Employee
select count(distinct country) as 'Total country' from Employee
select*from Employee