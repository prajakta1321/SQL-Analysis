 create database mango;
 use mango;
 select database();
 show databases;
 
 create database maggi;
 use maggi;
 drop database maggi;
 
 show databases;
 
 create table today(s_id int , s_name char(70) , s_age int);
 desc today;
 select * from today;
 
 show tables;
 create table sunday(s_id int , s_name char (69) , s_age int);
 desc sunday;
 
 show tables;
 show columns from today;
 show columns from sunday;
 
 insert into today values(1 , 'aaa' , 18), (2,"bbb",18), (3,"ccc",19),(4,"ddd",19),(5,"eee",20);
 
select s_id , s_name, s_age from today;

select * from today where s_name="ddd";
insert into today(s_id, s_name) values (8,"ggg");
select s_id , s_name from today;
 
 select * from today where s_id = NULL;
 
 alter table today modify s_name varchar(250);
 desc today;
 
 update today set s_name="mmm" where s_name="ccc";
 show errors;
 