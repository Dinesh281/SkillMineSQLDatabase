update Employee set country=null where country='china'
select * from Employee

select * from employee where country is not null

select * from employee where country is null

update Employee set country='China' where empid=6

update Employee set country='China' where country is null

select * from employee order by empname 
select * from employee order by empname desc

select * from employee order by salary desc

select * from employee order by age,empname 

select *from employee order by salary desc offset 1 row fetch next 3 rows only

