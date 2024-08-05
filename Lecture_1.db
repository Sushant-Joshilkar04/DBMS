-- Lecture 1
SHOW databases;
CREATE DATABASE sushant;
SHOW databases;
create database if not exists sushant;
use sushant;
select database();

-- single line comment
/* multiple line commnents */

CREATE TABLE employee(
EID INT primary key,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Age int NOT NULL,
Salary int NOT NULL,
Location varchar(50) NOT NULL
);

-- CREATE TABLE employee(
-- EID INT ,
-- FirstName varchar(50) NOT NULL,
-- LastName varchar(50) NOT NULL,
-- Age int NOT NULL,
-- Salary int NOT NULL,
-- Location varchar(50) NOT NULL,
-- primary key(EID,FirstName,Age)   when there are composite 
-- );

desc employee;
-- or describe employee;
SHOW TABLES;

insert into employee values(1,"Sushant","Joshilkar",20,75000,"Pune");
desc employee;
drop table employee;

CREATE TABLE employee(
EID INT auto_increment,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Age int NOT NULL,
Salary int NOT NULL,
Location varchar(50) NOT NULL,
primary key(EID,FirstName,Age)
-- auto_increment = 100  -- start auto increment from value
);
show tables;
desc employee;

insert into employee (FirstName,LastName,Age,Salary,Location)values("Sushant","Joshilkar",20,75000,"Pune");
insert into employee (FirstName,LastName,Age,Salary,Location)values("Suyash","Patil",21,75000,"Pune");
insert into employee (FirstName,LastName,Age,Salary,Location)values("Sourabh","Jagtap",21,75000,"Pune");
insert into employee (FirstName,LastName,Age,Salary,Location)values("Rushi","Magdum",20,75000,"Pune");
insert into employee (FirstName,LastName,Age,Salary,Location)values("Pranav","Kulkarni",21,75000,"Pune");

select * from employee where Salary > 50000;
-- Data retrieval
select FirstName,LastName from employee where Salary > 50000;
select FirstName,LastName from employee where Age > 20;
update employee set LastName ="Joshilkarr" where eid=1;
-- update employee set LastName ="Joshilkarr" where FirstName = "Sushant"; it is logically correct but use primary keys because primary keys are unique
select * from employee;

-- delete

delete from employee where eid =3;
select * from employee;
