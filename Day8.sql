select *from employee

select SUBSTRING(email,1,5) from Employee

select CONCAT(empname,' ',empid) from Employee

select LEN(email)from Employee

select ROUND(salary,2) from Employee

select TRIM(empname) from Employee

select REVERSE(empname) from Employee

select UPPER(empname) from Employee

select LOWER(email) from Employee

select CURRENT_TIMESTAMP
select GETDATE()
select cast(CURRENT_TIMESTAMP as date)
select cast(GETDATE() as time) as timeclock

select empname*(isnull(deptid,0)) from Employee

create function Addition(@a int,@b int)
returns int
as begin
declare @sum int
set @sum=@a+@b
return @sum
end

select dbo.Addition(250,150) as sum

create function GetEmpNameByDep(@id int)
returns varchar(20)
as begin
declare @empname varchar(20)
set @empname= (select empname from Employee where empid=@id)
return @empname
end

select dbo.GetEmpNameByDep(5) as empname

create function GetEmpDetailsByDep(@id int)
returns table
return (select *from Employee where deptid=@id)

select * from dbo.GetEmpDetailsByDep(3) 

create function SalaryHike(@salary int)
returns int
as begin
declare @Hikesalary int
set @Hikesalary=@salary+(@salary*0.15)
return @Hikesalary
end

select empname ,salary,dbo.SalaryHike(salary) as 'Hike salary' from Employee

drop function GetEmpNameByDep

create proc SP_InsetEmployee(
@empid int,
@empname varchar(20),
@email varchar(30),
@age int,
@country varchar(20),
@deptid int,
@sal int,
@managerid int
)
as begin
insert into Employee values(@empid,@empname,@email,@age,@country,@deptid,@sal,@managerid)
return
end

create proc SP_UpdateEmployee(
@empid int,
@empname varchar(20),
@email varchar(30),
@age int,
@country varchar(20),
@deptid int,
@sal int,
@managerid int
)
as begin
update Employee set empname=@empname,email=@email,age=@age,country=@country,deptid=@deptid,salary=@sal,managerid=@managerid where empid=@empid
return
End

create proc SP_DeleteEmployee(
@empid int)
as begin
delete from Employee where empid=@empid
return
End

exec SP_DeleteEmployee
@empid=16



sp_help employee