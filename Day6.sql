create table Custom(
customerid int primary key identity(1,1),
customername varchar(20)
)
insert into Custom values('Dinesh')
insert into Custom values('Rohit')
insert into Custom values('varun')
select*from Custom

--count emp in each dept

select deptid,count(empid) as 'No of Emp' from Employee group by deptid

--count the emp in which is development in departmrnt
select d.deptname,count(e.empid) as 'No of Emp'
from Employee e,Dept d
where e.deptid=d.deptid and d.deptname ='Development'
group by d.deptname

select d.deptname,count(e.empid) as 'No of Emp'
from Employee e
inner join Dept d on e.deptid=d.deptid
where d.deptname='Development'
group by d.deptname

--count emp in each dept name
select d.deptname,count(e.empid) as 'No of Emp'
from Employee e
inner join Dept d on e.deptid=d.deptid
group by d.deptname
order by  [No of Emp] desc

--list of emplyee whose salary less than the average salary
select e.empname,avg(e.salary)
from Employee e
group by e.empname
having e.salary<avg(e.salary)
SELECT * FROM employee
WHERE salary < (SELECT AVG(salary) FROM employee)


--no of employee from country india and usa in ascending order
select e.country,count(e.empid) as 'No of emp'
from Employee e
where e.country in ('India','usa')
group by e.country
order by [No of emp] 

select e.country,count(e.empid) as 'No of emp'
from Employee e
group by e.country
having e.country in ('india','usa')
order by [No of emp] 

create view deptwise_empcount 
as
select d.deptname , count(e.empid) as 'emp count' from Employee e
inner join dept d on d.deptid=e.deptid
group by d.deptname

alter view deptwise_empcount
as
select d.deptname , count(e.empid) as 'employee count' from Employee e
inner join dept d on d.deptid=e.deptid
group by d.deptname

drop view deptwise_empcount

select *from deptwise_empcount

select *from INFORMATION_SCHEMA.CHECK_CONSTRAINTS




select *from Employee
select *from Dept