create database flower;
use flower;
create table customer(cid int, cname char(100),dop date,creditlimit decimal(10,2));


insert into customer values(1,"AAA","2020-05-13",60000);

insert into customer values(2,"BBB","2021-01-12",70000),(3,"CCC","2020-08-15",9000);

DELIMITER //
CREATE FUNCTION CustomerLevel(credit DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
        SET customerLevel = 'PLATINUM';
    ELSEIF credit <= 50000 AND credit >= 10000 THEN
        SET customerLevel = 'GOLD';
    ELSE
        SET customerLevel = 'SILVER';
    END IF;
    RETURN customerLevel;
END //
DELIMITER ;

select CustomerLevel (5000);
select CustomerLevel (60000);
select CustomerLevel (20000);
select cname, CustomerLevel(creditlimit) as level from customer;
select cname, CustomerLevel(creditlimit) as level from customer;
select cname, CustomerLevel(creditlimit) as level from customer order by cname
desc;

DELIMITER //
CREATE PROCEDURE proc11(IN var1 INT, OUT var2 INT)
BEGIN
    SET var2 = var1 + 1;
END //
DELIMITER ;

call proc11(1,@a);
select @a;

call proc11(2,@b);
select @b;
select @b as Output;

#--PROCEDURE 2
DELIMITER //
create procedure proc22(out var2 char(50))
begin
	set var2 = "Hello World";
end //
DELIMITER ;


call proc22(@b);
select @b;
select @b as Output;

DELIMITER //
create procedure proc22(out var2 char(50))
begin
	set var2 = "Hello World";
end //
DELIMITER ;

SHOW PROCEDURE STATUS;

SHOW DATABASES;

CALL sys.create_synonym_db('performance_schema', 'ps');
SHOW FULL TABLES FROM ps;

CALL sys.execute_prepared_stmt('SELECT * FROM sys.sys_config');
CALL sys.ps_setup_disable_consumer('');
CALL sys.ps_setup_disable_comsumers('stage');
CALL sys.ps_setup_enable_consumer('');
CALL sys.ps_setup_enable_consumer('waits');
CALL sys.ps_setup_enable_instrument('wait/synch/mutex');
CALL sys.ps_setup_enable_instrument('wait/io/socket/sql/server_tcpip_socket');
CALL sys.ps_setup_enable_instrument('');
CALL sys.ps_setup_enable_thread(3);
CALL sys.ps_setup_enable_thread(CONNECTION_ID());

CALL sys.ps_setup_save();
UPDATE performance_schema.setup_instruments SET enabled = 'YES', timed = 'YES';
CALL sys.ps_setup_reload_saved();
CALL sys.ps_setup_reset_to_default(true)
CALL sys.ps_setup_reset_to_default(false);
CALL sys.ps_setup_save(-1);
CALL sys.ps_setup_show_disabled(TRUE, TRUE);
CALL sys.ps_setup_show_disabled_instruments();
CALL sys.ps_setup_show_enabled(TRUE, TRUE);

CALL sys.ps_statement_avg_latency_histogram()
call ps_trace_statement_digest('891ec6860f98ba46d89dd20b0c03652c', 10, 0.1, true, true);
CALL sys.ps_trace_thread(25, CONCAT('/tmp/stack-', REPLACE(NOW(), ' ', '-'), '.dot'), NULL, NULL, TRUE, TRUE, TRUE);

CALL sys.statement_performance_analyzer('create_tmp','mydb.tmp_digests_ini', NULL);

CALL sys.ps_statement_avg_latency_histogram();
CALL sys.ps_trace_thread(25, CONCAT(#39;/tmp/stack-&#39;, REPLACE(NOW(), &#39; &#39;, &#39;-&#39;),&#39;.dot&#39;), NULL, NULL, TRUE, TRUE, TRUE);

CALL sys.statement_performance_analyzer('snapshot', NULL, NULL);
DO SLEEP(60);
CALL sys.statement_performance_analyzer('delta', 'mydb.tmp_digests_ini','with_runtimes_in_95th_percentile');
CALL sys.statement_performance_analyzer('delta', 'mydb.tmp_digests_ini','with_runtimes_in_95th_percentile');
CALL sys.statement_performance_analyzer('snapshot', NULL, NULL);

CALL sys.statement_performance_analyzer('snapshot', NULL, NULL);
SET @sys.statement_performance_analyzer.limit = 10;
CALL sys.statement_performance_analyzer('overall', NULL,'with_runtimes_in_95th_percentile,with_full_table_scans');

CREATE OR REPLACE VIEW flower.my_statements AS
SELECT 
    sys.format_statement(DIGEST_TEXT) AS query,
    SCHEMA_NAME AS db,
    COUNT_STAR AS exec_count,
    sys.format_time(SUM_TIMER_WAIT) AS total_latency,
    sys.format_time(AVG_TIMER_WAIT) AS avg_latency,
    ROUND(IFNULL(SUM_ROWS_SENT / NULLIF(COUNT_STAR, 0), 0)) AS rows_sent_avg,
    ROUND(IFNULL(SUM_ROWS_EXAMINED / NULLIF(COUNT_STAR, 0), 0)) AS rows_examined_avg,
    ROUND(IFNULL(SUM_ROWS_AFFECTED / NULLIF(COUNT_STAR, 0), 0)) AS rows_affected_avg,
    DIGEST AS digest
FROM performance_schema.events_statements_summary_by_digest
ORDER BY SUM_TIMER_WAIT DESC;

CALL sys.statement_performance_analyzer('create_table', 'aml3.digests_prev',NULL);

CREATE DATABASE db1;
use db1;
CREATE TABLE t1 (id INT PRIMARY KEY);
CREATE TABLE t2 (id INT PRIMARY KEY);
CREATE view v_t1 AS SELECT * FROM t1 ;
CREATE TEMPORARY TABLE t1 (id INT PRIMARY KEY);
CALL sys.table_exists('db1', 't1', @exists); SELECT @exists;

CALL sys.table_exists('db1', 't2', @exists); SELECT @exists;
CALL sys.table_exists('db1', 'v_t1', @exists); SELECT @exists;
CALL sys.table_exists('db1', 's', @exists); SELECT @exists;
CALL table_exists('information_schema', 'user_variables', @exists);
SELECT @exists;
CALL sys.table_exists('db1', 't3', @exists); SELECT @exists;


DELIMITER //
CREATE PROCEDURE proc55()
BEGIN
    SELECT * FROM customer;
END //
DELIMITER ;

call proc55();

DELIMITER //
CREATE PROCEDURE age_limit(IN age INT, OUT drive VARCHAR(50))
BEGIN
    IF age > 18 THEN 
        SET drive = "Driving Allowed";
    ELSE 
        SET drive = "Not Allowed";
    END IF;
END //
DELIMITER ;
call age_limit(15,@a);
select @a ;


DELIMITER //
CREATE PROCEDURE double1(IN N1 INT, OUT N2 INT)
BEGIN
    SET N2 = N1;  -- Initialize N2 with the value of N1
    WHILE N1 < 5 DO
        SET N1 = N1 + 1;  -- Increment N1
        SET N2 = N2 + 1;  -- Increment N2
    END WHILE;
END //
DELIMITER ;

call double1(2,@a);
select @a as Output;


DELIMITER //
 
CREATE PROCEDURE getCustomerLevel(IN customerNo INT, OUT customerLevel VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;
 
    SELECT creditLimit INTO credit FROM customer WHERE cid = customerNo;
 
    IF credit > 10000 THEN
        SET customerLevel = 'Gold';
    ELSEIF credit > 5000 THEN
        SET customerLevel = 'Silver';
    ELSE
        SET customerLevel = 'Regular';
    END IF;
END //
 
DELIMITER ;
 call getCustomerLevel(1,@CL) ;
 select @CL as Output ;
call getCustomerLevel(2,@CL) ;
select@CL as Output ;







