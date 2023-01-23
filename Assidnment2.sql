CREATE TABLE Worker (
	WORKER_ID INT   identity primary key,
	FIRST_NAME varchar(25),
	LAST_NAME varchar(25),
	SALARY numeric,
	JOINING_DATE DATETIME,
	DEPARTMENT varchar(25)
)
drop table bonus
truncate table worker
select*from worker
INSERT INTO Worker  VALUES( 'Monika', 'Arora', 100000, '2014-02-20 09:00:00' , 'HR')
INSERT INTO Worker  VALUES		( 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin')
INSERT INTO Worker  VALUES		( 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR')
INSERT INTO Worker  VALUES		( 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin')
INSERT INTO Worker  VALUES		( 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin')
INSERT INTO Worker  VALUES		( 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account')
INSERT INTO Worker  VALUES		( 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account')
INSERT INTO Worker  VALUES		( 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin')

CREATE TABLE Bonus (
	WORKER_REF_ID INT foreign key references worker(WORKER_ID) on  delete cascade,
	BONUS_AMOUNT numeric,
	BONUS_DATE DATETIME,
	
)

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(1, 5000, '2016-02-20'),
		(2, 3000, '2016-06-11'),
		(3, 4000, '2016-02-20'),
		(1, 4500, '2016-02-20'),
		(2, 3500, '2016-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE varCHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

 select*from Worker
 select*from Bonus
 select*from Title

 --Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 select FIRST_NAME as'WORKER_NAME' from Worker

 --Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 select upper(FIRST_NAME) from Worker

 --Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 select distinct DEPARTMENT from Worker

 --Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(FIRST_NAME,1,3) from Worker  

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select charindex('a',FIRST_NAME) from Worker where FIRST_NAME='Amitabh'

--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(FIRST_NAME) from Worker

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(DEPARTMENT) from Worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct DEPARTMENT ,len(department) as 'Length' from Worker

--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select REPLACE(FIRST_NAME,'a','A') from Worker

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(first_name,' ',LAST_NAME) as COMPLETE_NAME from Worker

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker
order by FIRST_NAME 

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker
order by FIRST_NAME ,DEPARTMENT desc

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select* from worker where FIRST_NAME in ('Vipul','Satish')

---14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select* from worker where FIRST_NAME not in ('Vipul','Satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select*from worker where DEPARTMENT='Admin'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select *from Worker where FIRST_NAME like '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker where FIRST_NAME like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select *from Worker where FIRST_NAME like '_____h'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select *from worker where SALARY between 100000 and 500000

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where JOINING_DATE between cast('2014-02-01'as datetime) and cast('2014-02-28'as datetime)

Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(DEPARTMENT) from Worker where DEPARTMENT='admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select concat(FIRST_NAME,' ',LAST_NAME) as 'Worker Name',SALARY from worker where salary between 50000 and 100000

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select DEPARTMENT,count(WORKER_ID)as'NO_Of_Worker' from Worker
group by DEPARTMENT
order by NO_Of_Worker desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
 select *from worker w
 inner join Title t on t.WORKER_REF_ID=w.WORKER_ID
 where t.WORKER_TITLE='Manager'

 select *from worker where WORKER_ID in(
 select WORKER_REF_ID from Title where WORKER_TITLE='Manager')

 --Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

select*from Title

--Q-26. Write an SQL query to show only odd rows from a table.
select *from worker 
Copy code
SELECT * FROM worker where ROW_NUMBER()over(order by WORKER_ID)

SELECT * FROM worker WHERE (ROW_NUMBER() OVER(ORDER BY (SELECT 1)) % 2) = 1

--Q-27. Write an SQL query to show only even rows from a table.

--Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker;

--Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

--Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Worker MINUS SELECT * FROM Title;

select *from Worker where WORKER_ID not in(SELECT WORKER_REF_ID FROM bonus)

--Q-31. Write an SQL query to show the current date and time.
select cast(CURRENT_TIMESTAMP as time) as 'todays time',cast(CURRENT_TIMESTAMP as date) as 'todays date'

--Q-32. Write an SQL query to show the top n (say 10) records of a table.
SELECT TOP 10 * FROM Worker ORDER BY Salary DESC;

SELECT * FROM Worker 
ORDER BY Salary DESC
offset 0 rows
fetch  next 10 rows only

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker 
ORDER BY Salary DESC
offset n-1 rows
fetch  next 1 rows only

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT *
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 )

 --Q-35. Write an SQL query to fetch the list of employees with the same salary.
 Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID

--Q-36. Write an SQL query to show the second highest salary from a table.
select *
from Worker
order by SALARY desc
offset 1 rows
fetch next 1 rows only

--Q-37. Write an SQL query to show one row twice in results from a table.
select *from worker
union all
select *from Worker

--Q-38. Write an SQL query to fetch intersecting records of two tables.