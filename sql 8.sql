use mango;

create table employee(id int , name char(30) , salary float);

insert into employee values(1 , "SSS", 50000.00), (2 , "TTT" , 60000.00),(3 , "QQQ",70000.00);

SELECT * FROM EMPLOYEE;

create table department(did int , dname char (50) , eid int);

insert into department values (111,"CSE" , 1),(222,"EXTC" ,2) ,(333, "TEX" , 3);

SELECT * FROM DEPARTMENT;

#--cartesian join;
select * from employee , department;

#--inner join;
select * from employee inner join department on employee.id = department.eid;

#--left join with a condition;
select * from employee left join department on employee.id = department.eid;

insert into employee values(4 ,"RRR" , 75000.00);
SELECT * FROM employee LEFT JOIN department on employee.id = department.eid;

select * from employee right join department on employee.id = department.eid;

INSERT INTO DEPARTMENT VALUES(444 , "MECHANICAL" , 5);

#--right join;
select * from employee right join department on employee.id = department.eid;

select * from employee left join department on employee.id = department.eid union select * from employee right join department on employee.id = department.eid;

select * from employee left join department on employee.id = department.eid union all select * from employee right join department on employee.id = department.eid;

#--sum;
select sum(salary) as total_salary from employee;

#--use of count();
select count(id) as employee_count from employee;


#--count the number of records from tables;
select count(*) from employee;

set sql_safe_updates = 0;
select count(distinct(id)) from employee;
delete from employee where id = 4;

#--use of min()
select min(salary) as lowest_salary from employee;

select max(salary) as highest_salary from employee;

select avg(salary) as average_salary from employee;

select upper(name) from employee;
select lower(name) from employee;

select * from department;

insert into department values(111, "CSE", 2), (222 , "CSE" , 3) , (222, "EXTC" , 3);

select * from department;

#--groupby clause;
select dname , count(eid) from department group by dname;

#-- use of having clause;
select dname , count(eid) from department group by dname having count(eid) > 1;

select dname , count(eid) as total_emp 
from department
group by dname
having total_emp >1;

select dname ,count(eid) as total_emp
from department
group by dname 
order by dname desc;

#--TCL 
start transaction;
select * from employee;
insert into employee values(4 , "YYY" , 90000);
savepoint s1;

insert into employee values(5 , "ZZZ" , 85000);
savepoint s2;

select * from employee;

rollback to s1;
select * from employee;

commit;