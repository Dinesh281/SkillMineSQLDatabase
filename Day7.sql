
--emp who get less than avg salary of sales dept
select *from Employee where   salary<(
select avg(salary) from Employee where deptid=(select deptid from Dept where deptname='sales')
)

--select the emp whose country is same as empid 3
select *from Employee where country=(
select country from Employee where empid=3
)

--display emp who get the more salary than empid 11
select *from Employee where salary>(
select salary from Employee where empid=11
)
---display avg salary of all department

select deptid,avg(salary) as 'avg_salary'
from employee
group by deptid



select* from Employee where salary < all (
select avg(salary) from Employee 
group by deptid
)

-- insert with subquery
insert into orders select id,name,price from product where id in
(select pid from product where price >1000)
--10
--update with subquery
-- add 20% in the salary dept name --> development

update Employee set salary=salary+(salary*0.10) where deptid=(
select deptid from Dept where deptname='development'
)
update Employee set salary=41000 where deptid=4
select * from Employee


--delete with subquery
delete from Employee where deptid=(
select deptid from dept where deptname='admin')

create table orderlist (customerid int,productname varchar(20),city varchar(20),country varchar(15),postalcode int,price int)

insert into orderlist select customerid,productname,city ,country ,postalcode ,price from Customers where customerid in(
select customerid from Customers where price>15)

sp_help Customers
select *from Employee
select *from Product
select *from Customers
select *from Dept
select *from orderlist