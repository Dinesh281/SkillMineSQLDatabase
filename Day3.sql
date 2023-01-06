select *from Employee where empname like 'a%'
select *from Employee where empname like '%a'
select *from Employee where country like '[ic]%'
select *from Employee where email like '%esh%'
select *from Employee where email like '%[esh]%'

select * from Employee where deptid in(1,2,4)
select * from Employee where country in('india','usa')

select *from Employee where email not like '%esh%'
