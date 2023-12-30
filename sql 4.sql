create database table1;
use table1;
select database();
show databases;
create table table1 (s_id int , s_name char(100), s_age int);

desc table1;

select * from table1;
show columns from table1;

select s_id , s_name from table1;

select * from table1;

insert into table1 values(1 , 'aneesh',22);

select s_id , s_name from table1;

select * from table1;

select s_id , s_name from table1 where s_name = 'aneesh';



insert into table1(s_name, s_age) values ("devangi", 18);

select * from table1;

select * from table1 where s_id is NULL;

alter table table1 modify s_name varchar(500);
desc table1;

alter table table1 change s_age age  int;

desc table1;

update table1  set s_name = "praju" where s_name="devangi";

select * from table1;

delete from table1 where s_name = "aneesh";

select * from table1;

truncate table1;

rename table table1 to table2;

drop table table2;

create database cats ;
use cats;
select database();
show databases;
create table catz  (c_id int , c_name char, c_age int);
INSERT INTO catz(c_name, c_age)
VALUES('This is some text blah blah blah blah blah text text text something about cats
lalalalal meowwwwwwwwwww', 10);
SHOW WARNINGS;
CREATE TABLE people (
name VARCHAR(100),
birthdate DATE,
birthtime TIME,
birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11&', '39;9:45:10', '39;1985-04-11 9:45:10');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan' ,'2020-08-15&', '39;23:59:00', '2020-08-15 23:59:00');

SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt);
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());
SELECT
birthdate,
DAY(birthdate),
DAYOFWEEK(birthdate),
DAYOFYEAR(birthdate)
FROM people;

SELECT
birthdate,
MONTHNAME(birthdate),
YEAR(birthdate)
FROM people;

SELECT
birthtime,
HOUR(birthtime),
MINUTE(birthtime)
FROM people;

SELECT
birthdt,
MONTH(birthdt),
DAY(birthdt),
HOUR(birthdt),
MINUTE(birthdt)
FROM people;

select DATEDIFF(CURDATE(),birthdate) from people;
select DATEDIFF(CURDATE(),birthdt) from people;
select DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
select DATE_ADD(birthdate, INTERVAL 1 YEAR) from people;
select DATE_ADD(CURDATE(), INTERVAL 12 YEAR);
select DATE_ADD(CURDATE(), INTERVAL 1 MONTH);
select DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

SELECT TIMEDIFF(CURTIME(),&#39;07:00:00&#39;);


SELECT birthdate, DATE_FORMAT(birthdate, '%a%b%D') FROM people;

CREATE TABLE captions (
text VARCHAR(150),
created_at TIMESTAMP default CURRENT_TIMESTAMP
);
insert into captions (text) values ('I hate you');


CREATE TABLE captions2 (
text VARCHAR(150),
created_at TIMESTAMP default CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
insert into captions2 (text) values ('I hate you');
select * from captions2;
update captions2 set text ='I miss you';
select * from captions2;




SELECT * FROM people WHERE birthtime
BETWEEN CAST('12:00:00' AS TIME)
AND CAST('16:00:00' AS TIME);
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;




use pML;
create table employee(eid int , ename char(30) , edob date);
insert into employee values (1,"AAA","1990-05-12"),(2,"BBB","1991-04-11"),(3,"CCC","1989-06-23");
select * from employee;

create view v1 as select eid,edob from employee;
select * from v1;

show tables;

create view v2 as select ename, edob from employee;
select * from v2;

desc v2;

insert into v1 values(4,"1988-12-09");
select * from v1;
select * from employee;

update v2 set ename="eee" where ename="AAA";
select * from v2;
select * from employee;

SET SQL_SAFE_UPDATES = 0;
delete from v1 where eid=1;
select * from v1;
select * from employee;

create view v4 as select eid, ename from employee where eid>3;
select * from v4;

alter table v2 add ename char(30);
alter table v2 modify ename char (30);
alter table v2 change ename ename1 char(30);
show warnings;

create or replace view v2 as select eid, ename from employee;
select * from v2;


drop view v2;

create table student(id int , sname char(30), sdob date);
insert into student(id, sname,sdob)(select eid, ename, edob from employee);
select * from student;




create database tokyo;
use tokyo;
select database();
show databases;

CREATE TABLE customer (cid int, cname char(30), dop date, primary key(cid));

DESC customer ;

SHOW CREATE TABLE customer;

ALTER TABLE customer drop primary key;
DESC customer ;
ALTER TABLE customer  ADD PRIMARY KEY(cid) ;
DESC customer ;
ALTER TABLE customer ADD CONSTRAINT pk PRIMARY KEY(cid); 
SHOW ERRORS;
ALTER TABLE customer drop primary key;
ALTER TABLE customer ADD CONSTRAINT pk PRIMARY KEY(cid);
INSERT INTO customer(cname, dop)  VALUES("John Doe", "1998-12-23");
SHOW ERRORS ; 
INSERT INTO customer VALUES(1,"John Doe", "1998-12-23");
INSERT INTO customer VALUES(1,"Prajakta Gurav", "1998-12-23");
SHOW ERRORS;
SELECT * FROM customer;

CREATE TABLE cus1 (cid int auto_increment, cname char(30), dop date, primary key(cid)) INSERT INTO cus1(cname, dop) VALUES ("prajakta" ,"1998-12-23" ) ,  ("aneesh" ,"1998-12-23" );
SELECT * FROM cus1 ;
INSERT INTO cus1(cid,cname, dop) VALUES (4,"margish" ,"1998-12-23" );
INSERT INTO cus1(cname, dop) VALUES ("neha" ,"1998-12-23" );
SELECT * FROM cus1 ;
CREATE TABLE orders ( oid int,id int,oname char(30),FOREIGN KEY(id) REFERENCES customer(cid));
ALTER TABLE orders add constraint fk foreign key(id) references customer(cid);
SELECT * FROM customer;

ALTER TABLE customer  ADD PRIMARY KEY(cid) ;
DESC customer ;
ALTER TABLE customer ADD CONSTRAINT pk PRIMARY KEY(cid); 
SHOW ERRORS;
ALTER TABLE customer drop primary key;
ALTER TABLE customer ADD CONSTRAINT pk PRIMARY KEY(cid);
INSERT INTO customer(cname, dop)  VALUES("John Doe", "1998-12-23");
SHOW ERRORS ; 
INSERT INTO customer VALUES(1,"John Doe", "1998-12-23");
INSERT INTO customer VALUES(1,"Prajakta Gurav", "1998-12-23");
SHOW ERRORS;
SELECT * FROM customer;




CREATE TABLE cus1 (cid int auto_increment, cname char(30), dop date, primary key(cid)); 
INSERT INTO cus1(cname, dop) VALUES ("prajakta" ,"1998-12-23" ) ,  ("devangi" ,"1998-12-23" );
SELECT * FROM cus1 ;
INSERT INTO cus1(cid,cname, dop) VALUES (4,"prerana" ,"1998-12-23" );
INSERT INTO cus1(cname, dop) VALUES ("ashutosh" ,"1998-12-23" );
SELECT * FROM cus1 ;
CREATE TABLE orders ( oid int,id int,oname char(30),FOREIGN KEY(id) REFERENCES customer(cid));
ALTER TABLE orders add constraint fk foreign key(id) references customer(cid);
SELECT * FROM customer;








ALTER TABLE customer  ADD PRIMARY KEY(cid) ;
DESC customer ;
ALTER TABLE customer ADD CONSTRAINT pk PRIMARY KEY(cid); 
SHOW ERRORS;
ALTER TABLE customer drop primary key;
ALTER TABLE customer ADD CONSTRAINT pk PRIMARY KEY(cid);





INSERT INTO orders VALUES (111, 1, "laptops") ;
INSERT INTO orders VALUES (112, 2, "keyboards") ;
SHOW ERRORS;


DELETE FROM customer WHERE cid=1;
SHOW ERRORS;
UPDATE customer SET cid =2 WHERE cid=1 ;
SHOW ERRORS; 



CREATE TABLE EMPLOYEES (eid int, ename char(30), age int default 20);
INSERT INTO EMPLOYEES(eid,ename) values(1,"BBB");
SELECT * FROM EMPLOYEES;


ALTER TABLE EMPLOYEES alter age drop default ; 
DESC EMPLOYEES ;
ALTER TABLE EMPLOYEES ALTER age set default 20; 
DESC EMPLOYEES ;



CREATE TABLE payment (pid int check(pid > 1));
INSERT INTO payment VALUES(2);
SELECT * FROM payment ;





ALTER TABLE payment MODIFY pid int ;
DESC payment;
ALTER TABLE payment ADD CONSTRAINT ch check(pid > 1) ; 
DESC payment;





CREATE TABLE order2 (id int UNIQUE) ; 
DESC order2;

INSERT INTO order2 VALUES (1), (1) ; 
SHOW ERRORS ;
INSERT INTO order2 VALUES (1), (2) ;
SELECT * FROM order2 ; 



ALTER TABLE order2 ADD oname char(30);
SET SQL_SAFE_UPDATES = 0;
UPDATE order2 set oname = "HOD" ;
SELECT * FROM order2;












DELETE FROM order2 where id=2 ; 
ALTER TABLE order2 ADD CONSTRAINT cu UNIQUE(oname) ;
SHOW CREATE TABLE order2;


CREATE TABLE order3 (id int NOT NULL);
INSERT INTO order3 VALUES(NULL) ; 
SHOW ERRORS ;


CREATE TABLE student (id int, marks decimal(4,2));
INSERT INTO student VALUES(1,8888);
 SHOW ERRORS ;


INSERT INTO student VALUES(1,88);
SELECT * FROM student ; 

CREATE TABLE cus1 (cid int auto_increment, cname char(30), dop date, primary key(cid)) INSERT INTO cus1(cname, dop) VALUES ("prajakta" ,"1998-12-23" ) ,  ("aneesh" ,"1998-12-23" );
SELECT * FROM cus1 ;
INSERT INTO cus1(cid,cname, dop) VALUES (4,"margish" ,"1998-12-23" );
INSERT INTO cus1(cname, dop) VALUES ("neha" ,"1998-12-23" );
SELECT * FROM cus1 ;
CREATE TABLE orders ( oid int,id int,oname char(30),FOREIGN KEY(id) REFERENCES customer(cid));
ALTER TABLE orders add constraint fk foreign key(id) references customer(cid);
SELECT * FROM customer;








