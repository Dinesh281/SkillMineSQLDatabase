create database Assignment

CREATE TABLE book (
  book_id INT PRIMARY KEY,
  book_name VARCHAR(255) NOT NULL,
  author_id INT NOT NULL,
  price numeric(10, 2) NOT NULL,
  published_date DATE NOT NULL,
  FOREIGN KEY (author_id) REFERENCES author(author_id)
)

CREATE TABLE author (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL,
  ph_no VARCHAR(20),
  email VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  city VARCHAR(255)
)
select *from author
CREATE TABLE awards (
  award_id INT PRIMARY KEY,
  award_type_id INT NOT NULL,
  author_id INT NOT NULL,
  book_id INT NOT NULL,
  years INT NOT NULL,
  FOREIGN KEY (award_type_id) REFERENCES awards_master(award_type_id),
  FOREIGN KEY (author_id) REFERENCES author(author_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
)

CREATE TABLE awards_master (
  award_type_id INT PRIMARY KEY,
  award_name VARCHAR(255) NOT NULL,
  award_price numeric(10, 2) NOT NULL
)

insert into author values (1,'Rabindranath tagore',9869685309,'rtagore@gmail.com','Ganesh Talkies','Kolkata')
insert into author values (2,'Chetan bhagat',7856923012,'Cbhagat@gmail.com','Delhi','New Delhi')
insert into author values (3,'Khushwant Singh',8523127841,'ksingh@gmail.com','Goregaon','Mumbai')
insert into author values (4,'Amrita Pritam',9752612145,'apritam@gmail.com','Rani','Pali')

insert into book values (1,'Gitanjali',1,1500,cast('1990/08/14' as date   ))
insert into book values (2,'Papers boat',1,500,cast('2010/07/04' as date   ))
insert into book values (3,'Fireflies',2,1000,cast('2015/09/24' as date   ))
insert into book values (4,'2 States',1,150,cast('2016/01/05' as date   ))
insert into book values (5,'Wanted',4,700,cast('2018/02/18' as date   ))
insert into book values (6,'Half Girlfriend',2,300,cast('2020/07/09' as date   ))
insert into book values (7,'One Indian Girl',3,550,cast('2021/08/16' as date   ))
 
insert into awards_master values(1,'Padmabhusan',15000)
insert into awards_master values(2,'Jnanpith Award',10000)
insert into awards_master values(3,'Padshree ',150000)
insert into awards_master values(4,'Saraswati Samman',20000)

insert into awards values(1,1,1,2,2020)
insert into awards values(2,2,1,2,2019)
insert into awards values(3,4,2,3,2017)
insert into awards values(4,3,4,5,2018)
insert into awards values(5,2,3,7,2020)
insert into awards values(6,1,1,1,2021)

select *from author
select *from awards_master
select *from awards
select * from book 

--1.	Write a query to show book name , author name and award name for all books which has received any award. 
select b.book_name,au.author_name,am.award_name
from book b inner join author au on au.author_id=b.author_id
inner join awards aw on aw.author_id=au.author_id
inner join awards_master am on am.award_type_id=aw.award_type_id

--2.	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
UPDATE author
SET author_name = 'Honourable ' + author_name
FROM book
WHERE author.author_id = book.author_id AND book.price > 100;

--3.	Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
SELECT author_name, COUNT(book_id) AS books_written FROM author
inner JOIN book ON author.author_id = book.author_id
GROUP BY author_name
ORDER BY books_written DESC

--4.	Write a query to select book name with 5 th highest price.
select *from book
order by price desc
offset 4 rows
fetch next 1 rows only

--5.	Select list of books which have same price as book ‘Diary of Ann Frank’.
SELECT book_name
FROM book
WHERE price = (SELECT price FROM book WHERE book_name = 'Diary of Ann Frank');

--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.
update book set price=price +(price*0.5) where book_id=(
select author_id
from author where author_name='Chetan Bhagat')

--7.	Show award names and number of books which got these awards. 
SELECT am.award_name, COUNT(book_id) as books_received
FROM awards
JOIN awards_master am ON awards.award_type_id = am.award_type_id
GROUP BY award_name;

--8.	Delete all books written by ‘Chetan Bhagat’ 
delete from book where author_id=(
select author_id from author where author_name='chetan Bhagat')

--9.	Create view to show name of book and year when it has received award. 
create view BooksAward as
select b.book_name,aw.years,am.award_name
from awards_master am inner join awards aw on am.award_type_id=aw.award_type_id
inner join book b on b.book_id=aw.book_id

select *from BooksAward
--10.	Create trigger to ensure min price of any book must be Rs. 100. 
create trigger [dbo].tr_min_price
on [dbo].book before insert 
as begin

select*from book
--11.	Increase price of book by 10% if that book has received any award.
update book set price=price+(price*0.1) where book_id in(
select
book_id from awards)

--12.	Show names of author and number of books written by that Author.
SELECT a.author_name, COUNT(book_id) as books_written
FROM author a
JOIN book b ON b.author_id = a.author_id
GROUP BY a.author_name;

--13.	Show names of authors whose books are published before year 2020.
select a.author_name    from author a where a.author_id=(
select b.author_id from book b where year(cast(b.published_date as date))
< (year(cast('2020'as date)))
)


--14.	Show name of books which has published within 1 year after 15 August 2020.
SELECT book_name
FROM book
WHERE published_date BETWEEN '2020-08-16' AND '2021-08-15';

--15.	Delete all authors whose no book is published in year 2020.
delete from author where author_id in(
select b.author_id from book b where year(cast(b.published_date as date))
not in (year(cast('2020'as date)))
)
