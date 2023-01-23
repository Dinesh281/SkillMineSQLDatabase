--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
--Course – course id , course name, duration (in months), trainer id , total fees
--Trainer – Trainer id , trainer name , join date , email , experience in years

create table Trainer (
trainer_id int primary key,
trainer_name varchar(20),
join_date date,
email varchar(15),
experience int)

create table Course(
course_id int primary key,
course_name varchar(20),
duration int,
trainer_id int foreign key references Trainer(trainer_id),
total_fees numeric)

create table Student(
roll_no int primary key,
student_name varchar(20),
degree varchar(20),
birth_date date,
course_id int foreign key references Course(course_id),
batch_id int,
fees_paid numeric,
remark varchar(20),
is_placed varchar(20))

insert into Trainer values(101,'Ramesh','2019-04-14','ramh@gmail.com',5)
insert into Trainer values(102,'Suresh','2020-04-16','ramh@gmail.com',7)
insert into Trainer values(103,'Rahul','2021-04-04','ramh@gmail.com',10)
insert into Trainer values(104,'Lux','2019-04-21','ramh@gmail.com',8)
insert into Trainer values(105,'Mahesh','2018-04-15','ramh@gmail.com',3)


insert into Course values(201,'Html',20,101,15000)
insert into Course values(202,'PHP',4,101,20000)
insert into Course values(203,'Java',6,101,30000)
insert into Course values(204,'Python',5,101,40000)
insert into Course values(205,'Ruby',10,101,25000)
insert into Course values(206,'SQL',5,101,35000)



insert into Student values(1,'Ram','MCA','1994-02-13',202,501,15000,'No','Yes')
insert into Student values(2,'Rahul','BE','1994-02-15',202,501,5000,'No','Yes')
insert into Student values(3,'arun','MCA','1996-02-14',201,501,15000,'No','No')
insert into Student values(4,'sahil','BTech','1998-04-13',202,501,15000,'No','Yes')
insert into Student values(5,'yogesh','Electrical','2000-02-13',203,501,30000,'No','Yes')
insert into Student values(6,'sushil','Computer','2005-03-13',202,501,15000,'No','No')
insert into Student values(7,'aditya','BE','2006-12-27',204,501,15000,'No','Yes')
insert into Student values(8,'ayesha','MCA','1995-02-13',205,501,15000,'No','Yes')
insert into Student values(9,'pranit','MCA','1996-02-13',206,501,15000,'No','No')
insert into Student values(10,'rakesh','BscIt','1993-08-11',203,501,20000,'No','Yes')
insert into Student values(11,'kaliya','MCA','1998-09-13',203,501,15000,'No','Yes')
insert into Student values(12,'suresh','MCA','1994-02-13',203,501,15000,'No','Np')
insert into Student values(13,'rohit','computer','1994-02-09',204,501,40000,'No','Yes')
insert into Student values(14,'varun','BTech','1994-02-13',205,501,15000,'No','Yes')
insert into Student values(15,'sneha','Mechanical','1994-02-13',206,501,35000,'No','Yes')

--1. Show list of students. List contains roll no , student name , course name , trainer name in
--order of course name and student name.
SELECT roll_no, student_name, course.course_name, trainer.trainer_name FROM student
JOIN course ON student.course_id = course.course_id
JOIN trainer ON course.trainer_id = trainer.trainer_id
ORDER BY course.course_name, student.student_name

--2. Show list of students who have pending fees more than 1000rs . List should have student
--name , course name , balance fees . Show this list in descending order of balance fees. 
select s.student_name,c.course_name,(c.total_fees-s.fees_paid)as balance_fees
from Student s inner join Course c on s.course_id=c.course_id 
where (c.total_fees-s.fees_paid)>=15000

--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’
update Student set batch_id=concat('_spl',' ',batch_id) where batch_id in (
select s.batch_id
from Student s inner join  Course c on c.course_id=s.course_id
inner join Trainer t on t.trainer_id=c.trainer_id
where t.trainer_name='Deepa')

--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid
--by student is more than 60%.
update Student set remark='Eligible for Exam' where roll_no in
(
select s.roll_no
from Student s inner join Course c on s.course_id=c.course_id
where (c.total_fees-s.fees_paid)>=(0.6*c.total_fees)
)

--5. Create a index to make retrieval faster based on course name.
create index in_Course on course(course_name)

--6. List name of course for which more than 20 students are enrolled.
select c.course_name,count(s.roll_no) as 'Total Enrolled Student'
from Student s inner join Course c on s.course_id=c.course_id
where s.is_placed='Yes'
group by c.course_name
having count(s.roll_no)>=3

--7. List name of course for which maximum revenue was generated. ( max fee collection)
select top 1 c.course_name,sum(s.fees_paid) as 'Total revenue'
from Student s inner join Course c on s.course_id=c.course_id
group by course_name
order by [Total revenue] desc

--8. Select name of student who are in same batch as ‘Atul’.
select student_name from student where batch_id in
(
select batch_id
from student where student_name='Rakesh'
)
--9. Delete all students who are in course which is less than 2 months duration.
delete from Student where  course_id in
(
select course_id 
from course where duration<=2
)

--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from Student where student_name in
(select s.student_name
from Student s inner join Course c on s.course_id=c.course_id
where s.is_placed='Yes' and c.total_fees=s.fees_paid)

--11. Create a trigger to add student data in ex-student table if student is deleted from student
--table.
create table EXStudent(
roll_no int ,
student_name varchar(20),
degree varchar(20),
birth_date date,
course_id int foreign key references Course(course_id),
batch_id int,
fees_paid numeric,
remark varchar(20),
is_placed varchar(20))

create trigger tr_add_student
on student after delete
as begin
declare @id int
declare @name varchar(20)
declare @degree varchar(20)
declare @birthdate date
declare @courseid int
declare @batchid int
declare @feespaid numeric
declare @remark varchar(20)
declare @isplaced varchar(20)
select * into #TempTable from deleted
while(Exists(select roll_no from #TempTable))
begin
select top 1
@id=roll_no,@name=student_name,@degree=degree,@birthdate=birth_date,@courseid=course_id,@batchid=batch_id,@feespaid=fees_paid,@remark=remark,@isplaced=is_placed
from #TempTable
insert into EXStudent values (@id,@name,@degree,@birthdate,@courseid,@batchid,@feespaid,@remark,@isplaced)
delete from #TempTable where @id=roll_no
end
end

delete Student  where roll_no=5 
select *from exStudent



--12. Create a view which shows name of trainer and number of students he is training.
create view ViewStudent as
select t.trainer_name,count(s.roll_no) as 'Total No of Stuednt'
from Student s inner join Course c on s.course_id=c.course_id
inner join Trainer t on t.trainer_id=c.trainer_id
group by t.trainer_name


--13. Show names of students who are more than 20 years old.
select student_name from Student where
      (year(cast(CURRENT_TIMESTAMP as date))-year(cast(birth_date as date)))>=25

--14. Show names of students who have paid all the fees.
select s.student_name
from Student s inner join Course c on s.course_id=c.course_id
where (c.total_fees=s.fees_paid)

--15. Write a procedure which accepts student id and returns his balance fees. 
create procedure BalanceFees (@rollno int) as
(
select s.student_name,(c.total_fees-s.fees_paid) as 'Balance'
from Student s inner join Course c on s.course_id=c.course_id
where (c.total_fees-s.fees_paid)>0 and @rollno=s.roll_no
)
exec BalanceFees
@rollno=1