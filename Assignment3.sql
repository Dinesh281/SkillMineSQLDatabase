create table Students(
sid int primary key,
name varchar(20),
city varchar(20)
)

create table Subjects(
subid int primary key,
subname varchar(20),
maxmarks int,
passing int
)

create table Exam(
sid int foreign key references Students(sid),
subid int foreign key references subjects(subid),
marks int
)

insert into Students values(1,'Ram','Pune')
insert into Students values(2,'Sham','Mumbai')
insert into Students values(3,'Sita','Pune')
insert into Students values(4,'Gita','Nashik')

insert into Subjects values(1,'Maths',100,40)
insert into Subjects values(2,'English',100,40)
insert into Subjects values(3,'Marathi',50,15)
insert into Subjects values(4,'Hindi',50,15)

insert into Exam values(1,1,100)
insert into Exam values(1,2,85)
insert into Exam values(1,3,40)
insert into Exam values(1,4,45)
insert into Exam values(2,1,35)
insert into Exam values(2,2,55)
insert into Exam values(2,3,25)
insert into Exam values(3,1,95)
insert into Exam values(3,2,87)
insert into Exam values(3,3,45)
insert into Exam values(3,4,42)

--a. 
insert into Students values(5,'Ramesh','Hyderabad')

--b.
update Students set city='Sangli' where sid=4

--c.
select*from Students

--d.
select s.sid,s.name,su.subname,e.marks,su.maxmarks,((e.marks*100)/su.maxmarks) as 'Percentage' from Students s 
inner join Exam e on e.sid=s.sid
inner join Subjects su on e.subid=su.subid


--e.xxx
select s.sid,s.name
from Students s
inner join Exam e on e.sid=s.sid 
inner join Subjects su on e.subid=su.subid

--f.
select s.sid,s.name from Students s where s.sid not in(
select e.subid from Exam e where e.sid=s.sid and e.subid=(
select su.subid from Subjects su where e.subid=su.subid)
)


--g.

select s.subid,s.subname,max(e.marks) as 'Max Marks'
from Exam e inner join Subjects s on s.subid=e.subid 
inner join Students st on st.sid=e.sid 
group by s.subid,s.subname


select s.subid,s.subname,st.name,e.marks,s.maxmarks
from students st
inner join exam e on e.sid=st.sid 
inner join Subjects s on s.subid=e.subid
where e.marks =(
select max(marks) from Exam where Exam.subid=s.subid)
order by s.subid 

--h.return subject list with count of students who attempted the exam and count of students who passed the exam
select s.subid,s.subname,count(e.sid) as 'AttemptCount',count(e.marks) as'PassCount'
from students st
inner join exam e on e.sid=st.sid 
inner join Subjects s on s.subid=e.subid 
--where e.marks>=s.passing 
group by s.subid,s.subname


select*from Exam
--i.


--j.
