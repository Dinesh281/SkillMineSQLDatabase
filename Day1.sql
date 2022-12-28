create table Person(
personid int,
name varchar(20)
)
create table Employee(
empid int,
empname varchar(20),
salary numeric(10,2),
age int,
deptname varchar(10)
)
--alter to modify the datatype or its size

alter table Person alter column name varchar(40)
alter table Employee alter column deptname varchar(20)

--rename the column in sql server
sp_rename 'Person.name' , 'pname'


-- drop the column in the table
alter table person drop column pname

--add new column in the table

alter table person add pname varchar(20)
sp_help Employee
sp_help Person
