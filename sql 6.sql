use  mango;
CREATE TABLE products (
    p_id INT,
    p_name CHAR(30),
    Supplier_id INT,
    category_id INT,
    price INT
);

create table orders (orderdetailsID int, orderID int, PID int, quantity int);

insert into orders values (1,10248,1,12),
(2,10248,2,1),
(3,10248,3,15),
(4,10249,1,8),
(5,10249,4,4),
(6,10249,5,6),
(7,10250,3,5),
(8,10250,4,18),
(9,10251,5,2),
(10,10251,6,8),
(11,10252,7,9),
(12,10252,8,9),
(13,10250,9,20),
(14,10249,9,4);

insert into products values (1,"Chas",1,1,18),
(2,"Chai",1,1,19),
(3,"Syrup",1,2,10),
(4,"Seasoning",2,2,22),
(5,"Gumbo Mix",2,2,21),
(6,"Berry Spread",3,2,25),
(7,"Dried Pears",3,7,30),
(8,"Sauce",3,2,40),
(9,"Kobe Niku",4,6,97);

-- find any records in the orders table that quantity =9. display their details from product table
select p_name
from products
where p_id = ANY(select PID
from orders 
where quantity = 9);

select * from orders;
select PID
from orders 
where quantity = 9;


-- find the distinct categoryid of the products which have any record in orders table
select category_id 
from products
where p_id = ANY(select PID from orders);

-- all operator
select * from orders order by PID asc;

select p_name 
from products
where p_id = ALL(select PID from orders where quantity =6 OR quantity=2);


-- FALSE operator
select p_name 
from products
where p_id = ALL(select PID from orders where quantity =12 OR quantity=8);

-- use of some keyword
-- find any records in the orders table that has the quantity 9 and display
select p_id 
from products
where p_id = some(select PID from orders where quantity = 9);

select p_id 
from products
where p_id > some(select PID from orders where quantity = 9);

select p_id 
from products
where p_id < some(select PID from orders where quantity = 9);

select * from orders order by PID asc;

select distinct PID
from orders where quantity > SOME (select quantity from orders);

-- between operator
select * from products where price between 10 and 20;

-- not between
select * from products where price not between 20 and 30;

-- use of in and not in keywords
select * from products 
where price in (10,20);

select * from products 
where price not in (10,20);


-- fetch product names whose product ids falling in the product written in subquery
select p_name from products where p_id in (select pid from orders);

-- is null operator
insert into products values(10 , "Figs" , 5 , 8 , 100);

select p_name from products where p_id not in (select pid from orders);

insert into products values(11 , null, 6 ,9 ,110);
select * from products where p_name is NULL;


-- is not null operator
select * from products where p_name is not NULL;

-- exists operator
select * from products where exists(select p_id from products);

select p_id from products where exists(select p_id from products);

select p_name 
from products 
where exists(select p_id 
from orders
where products.p_id = orders.PID and orders.quantity = 1);

set sql_safe_updates = 0;

delete from orders 
where exists(select * from products 
where products.p_id = orders.pid and products.p_name = 'chas');

-- like operator
select * from orders 
where orderID like "%248%";

select * from orders 
where orderID like "10%";

select * from orders 
where orderID like "%50";

select * from orders 
where orderID like "_0%";

-- union and union all operator
select p_id from products union select pid from orders;

-- union and union all operator
select p_id from products union all  select pid from orders;

-- except operator
select p_id from products except(select PID from orders);

-- except operator
select PID from orders except(select p_id from products);