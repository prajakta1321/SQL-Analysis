
create database db27;
Use db27;

Create table books(title char(150),
ISBN int, author_name char(150),
bib_ref_no varchar(150), 
rating float,SPC int,
stock_available int,
SBC int);

insert into books values("Database
System Concepts",1260,"Henry
Korth","DBMS1001",4.4,500,10000,200);

insert into books values("Database
System Design",1337,"Carlos
Coronel","DBMS2001",3.8,600,10500,100);

insert into books
values("DBMS",0072,"Johannes
Gherke","DBMS3001",4.0,200,9000,250);

insert into books values("An Intro to
DBMS system",0201,"C.J.
Date","DBMS3005",4.5,350,8500,350);

select * from books;

# increase the stock available value by 100 for each book.
select stock_available + 100 
from books;

# reduce the stock availabe of each book by 50
select stock_available - 50 
from books;

select stock_available - SBC 
from books;

select stock_available - SBC 
as remaining_stock 
from books;

# double the stock booked by the customer
select SBC * 2
from books;

# reduce the available stock by 50%
select stock_available/2
from books;

# AND OPERATOR
select * from books;
select * 
from books
where (author_name = 'Henry
Korth' and SBC = 200);

# OR OPERATOR
select * 
from books
where (author_name ="Henry Korth" or  author_name = "C.J.
Date");

# NOT OPERATOR
select * from books
where not author_name = "Henry
Korth";

# RELATIONAL OPERATOR
# EQUAL  , NOT EQUAL TO AND GREATER THAN LESS THAN OPERATOR
select * 
from books
where ISBN 1260;

# > , < , <= , >=
select * 
from books 
where rating > 3;

select * 
from books 
where rating > 3.8;

select * 
from books 
where rating < 4.5;

select * 
from books 
where rating < 4.5;

