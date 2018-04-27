create database EMPLOYEE;
use EMPLOYEE;

create table INFO(
						 empno int primary key,
                         ename varchar(10),
						 job varchar(9),
                         mgr int null,
                         hiredate date,
                         sal numeric(7,2),
                         comm numeric(7,2) null,
                         dept int
                        );
-- drop table if exists INFO;


                        
insert into INFO values (1,'JOHNSON','ADMIN',6,'1990-12-17',18000,null,4);
insert into INFO values (2,'HARDING','MANAGER',9,'1998-02-02',52000,300,3);
insert into INFO values (3,'TAFT','SALES',2,'1996-02-01',25000,500,3);
insert into INFO values (4,'HOOVER','SALES',2,'1990-02-04',27000,null,3);
insert into INFO values (5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4);
insert into INFO values (6,'GARFIELD','MANAGER',9,'1993-05-01',54000,null,4);
insert into INFO values (7,'POLK','TECH',6,'1997-09-22',25000,null,4);
insert into INFO values (8,'GRANT','ENGINEER',10,'1997-03-30',32000,null,2);
insert into INFO values (9,'JACKSON','CEO',null,'1990-01-01',75000,null,4);
insert into INFO values (10,'FILLMORE','MANAGER',9,'1994-08-09',56000,null,2);
insert into INFO values (11,'ADAMS','ENGINEER',10,'1996-03-15',34000,null,2);
insert into INFO values (12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,null,4);
insert into INFO values (13,'MONROE','ENGINEER',10,'2000-12-03',30000,null,2);
insert into INFO values (14,'ROOSEVELT','CPA',9,'1995-10-12',35000,null,1);
insert into INFO values (15,'HANCOCK','SALES',2,'1990-03-02',27500,null,3); 

select * from info;

create table dept  (

                    deptno int primary key,
                    dname varchar(14),
                    loc varchar(13)
                    );
                    
insert into dept values (1,'ACCOUNTING','ST LOUIS');
insert into dept values (2,'RESEARCH','NEW YORK');
insert into dept values (3,'SALES','ATLANTA');
insert into dept values (4,'OPERATIONS','SEATTLE');

select * from dept;

SET SQL_SAFE_UPDATES = 0;

select ename, 12*sal+12*comm as compensation 
from info;
-- where dept = deptno
 -- group by dept;

-- QUERY 2
update INFO
set job='TECH'
where ename='HOOVER';


-- QUERY 4
select *
FROM INFO
WHERE hiredate > '1990-06-01';


-- QUERY 7
select dname
FROM INFO, dept
where INFO.dept is not null;

-- QUERY 9
select *
from INFO
order by comm;

-- QUERY 10
select dept, empno, ename, sal
from info
order by sal;

-- QUERY 11
select deptno, left(dname, 3)
from dept
order by dname;

-- QUERY 13
select ename, job, date_format(hiredate, '%a %M %d, %Y')
from info
where dept = 3;


-- QUERY 14
select ename, job, date_format(hiredate, '%D %M, %Y')
from info
where dept = 3;

-- QUERY 16
select dept, ename, job
from info
order by ename ASC, dept DESC;

-- QUERY 17
select ename, job, comm
from info
where comm is null;

-- QUERY 18
select ename, sal, dname, loc
from info, dept
where sal>=3000 and dept = deptno;

-- QUERY 20
select *
from info
where job like 'SALES%';

-- QUERY 21
select *
from info
where ename='ADAMS' ;


-- QUERY 22 ???
select dname, job, avg(sal)
from info, dept
where dept = deptno
group by dname;

-- QUERY 24
select dname, count(job)
from info, dept
where job='sales' and deptno = dept
group by dname;


-- QUERY 
select dname, count(job)
from info, dept
where  deptno = dept
group by dname;