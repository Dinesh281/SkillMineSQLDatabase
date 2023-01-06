create table Customers(customerid int unique,productname varchar(20),city varchar(20),country varchar(15),postalcode int,price int )

insert into Customers values(1,'Laptop','Mumbai','India',400104,15)
insert into Customers values(2,'Geitost','Carcassonne','UK',12110,11)
insert into Customers values(10,'Honey','Paris','France',12113,20)
insert into Customers values(4,'Pavlova','Marseille','France',null,15)
insert into Customers values(5,'Cheese','Avignon','Norway',12110,14)
insert into Customers values(15,'Geitost','London','Norway',12112,17)
insert into Customers values(20,'Lemon','Ajaccio','Norway',null,19)
insert into Customers values(22,'Pavlova','Berlin','Germnay',12110,7)
insert into Customers values(23,'Orange','Bergen','Norway',12115,18)
insert into Customers values(21,'Pavlova','Ajaccio','UK',null,15)
insert into Customers values(25,'Lagoon','Marseille','France',12110,20)

update Customers set postalcode=121110 where customerid=22
select * from Customers



--1.	Write a statement that will select the City column from the Customers table
select city from Customers

--2.	Select all the different values from the Country column in the Customers table.
select distinct country from Customers

--3.	Select all records where the City column has the value "London
select *from Customers where city='london'

--4.	Use the NOT keyword to select all records where City is NOT "Berlin".
select *from Customers where not city='Berlin'

--5.	Select all records where the CustomerID column has the value 23.
select *from Customers where customerid=23

--6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select *from Customers where city='Berlin' and postalcode=121110

--7.	Select all records where the City column has the value 'Berlin' or 'London'.
select *from Customers where city='Berlin' or city='London'

--8.	Select all records from the Customers table, sort the result alphabetically by the column City.
select *from Customers order by city 


--9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select *from Customers order by city desc

--10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select *from Customers order by country,city

--11.	Select all records from the Customers where the PostalCode column is empty.
select *from Customers where postalcode is null

--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select *from Customers where postalcode is not null

--13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update Customers set city='Oslo' where country='Norway'

--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
DELETE FROM Customers WHERE Country = 'Norway'

--15.	Use the MIN function to select the record with the smallest value of the Price column.
SELECT * FROM Customers WHERE Price = (SELECT MIN(Price) FROM Customers)

--16.	Use an SQL function to select the record with the highest value of the Price column.
SELECT * FROM Customers WHERE Price = (SELECT MAX(Price) FROM Customers)

--17.	Use the correct function to return the number of records that have the Price value set to 20
SELECT COUNT(*) FROM Customers WHERE Price = 20

--18.	Use an SQL function to calculate the average price of all products.
SELECT AVG(Price) as Average FROM Customers

--19.	Use an SQL function to calculate the sum of all the Price column values in the Products table
SELECT SUM(Price) as SumofPrice FROM Customers

--20.	Select all records where the value of the City column starts with the letter "a".
SELECT * FROM Customers WHERE City LIKE 'a%'

--21.	Select all records where the value of the City column ends with the letter "a".
SELECT * FROM Customers WHERE City LIKE '%a'

--22.	Select all records where the value of the City column contains the letter "a".
SELECT * FROM Customers WHERE City LIKE '%a%'

--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
SELECT * FROM Customers WHERE City LIKE 'a%b'

--24.	Select all records where the value of the City column does NOT start with the letter "a".
SELECT * FROM Customers WHERE City NOT LIKE 'a%'

--25.	Select all records where the second letter of the City is an "a".
SELECT * FROM Customers WHERE City LIKE '_a%'

--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
SELECT * FROM Customers WHERE City LIKE 'a%' OR City LIKE 'c%' OR City LIKE 's%'

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
SELECT * FROM Customers WHERE City LIKE '[a-f]%'

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
SELECT * FROM Customers WHERE City NOT LIKE '[acf]%'

--29.	Use the IN operator to select all the records where the Country is either "Norway" or "France".
SELECT * FROM Customers WHERE Country IN ('Norway', 'France')

--30.	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
SELECT * FROM Customers WHERE Country NOT IN ('Norway', 'France')

--31.	Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
SELECT * FROM Customers WHERE Price BETWEEN 10 AND 20

--32.	Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
SELECT * FROM Customers WHERE Price NOT BETWEEN 10 AND 20

--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select *from Customers where productname  between 'Geitost' and 'pavlova' order by productname

--34.	When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
SELECT customerid,productname,city,country, PostalCode AS Pno,price FROM Customers

--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.
SELECT * FROM Customers AS Consumers

--36.	List the number of customers in each country.
SELECT Country, COUNT(*) AS NumCustomers FROM Customers GROUP BY Country

--37.	List the number of customers in each country, ordered by the country with the most customers first.
SELECT Country, COUNT(*) AS NumCustomers FROM Customers GROUP BY Country ORDER BY NumCustomers DESC

--38.	Write the correct SQL statement to create a new database called testDB.
CREATE DATABASE testDB

--39.	Write the correct SQL statement to delete a database named testDB
DROP DATABASE testDB

--40.	Add a column of type DATE called Birthday in Persons table
create table Persons( Birthday DATE)
ALTER TABLE Persons add personid int

--41.	Delete the column Birthday from the Persons table
ALTER TABLE Persons DROP COLUMN Birthday

