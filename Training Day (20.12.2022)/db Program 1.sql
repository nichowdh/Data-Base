USE niladri_db;
create table Employee(
id int primary key,Ename varchar(20) not null,Ephone bigint(11) not null unique,Eaddr varchar(50),
Edept varchar (10) not null, Esalary double);
insert into Employee values
(1,'Bishnupriya',8745968120,'Mumbai','IT',1000.50);
#insert multiple rows
insert into Employee values
(2,'Soumya',7896548213,'Kolkata','BSC',2000.50),
(3,'Nisha',9874893594,'Bihar','CSE',3000.50),
(4,'Akshay',8475120394,'Odisha','ME',5000.50),
(5,'Niladri',7598125974,'Hooghly','ECE',7000.50);
#select
select * from Employee where Edept = 'IT';
#and (both the condition should true)
select * from Employee where Eaddr = 'Kolkata' and Esalary = '1000.50';
#or (any one condition should true)
select * from Employee where Eaddr = 'Mumbai' or Esalary = '3000.50';
#not
select * from Employee where Edept != 'IT';
#in
select * from Employee where Eaddr in ('Mumbai','Hooghly'); 
#starts with
select * from Employee where Ename like 'B%';
#ends with
select * from Employee where Ename like '%a';
#both stsrts & ends with
select * from Employee where Ename like '%i%';
#missing letter
select * from Employee where Eaddr like 'Bih_r';
select * from Employee where Edept like 'E_E';
select id,Ename,Ephone,Eaddr from Employee;
select * from Employee where id =5;
select * from Employee where Ename='Nisha';
#Distinct (separate)
select distinct id from Employee;
alter table Employee add Comm_pact int after Esalary;
update Employee set Comm_pact = 20 where id = 1;
update Employee set Comm_pact = 15 where id = 2;
update Employee set Comm_pact = 10 where id = 3;
update Employee set Comm_pact = 15 where id = 4;
update Employee set Comm_pact = 25 where id = 5;
#as (add)
select Ename,Esalary,Esalary + 300 as 'Increased_Salary' from Employee;
select Ename,Esalary,Esalary + Comm_pact + 100 as 'Annual_Compensation' from Employee;
select Comm_pact from Employee;
#greater than
select id,Esalary from Employee where Esalary>1500;
#between
select Ename, Esalary from Employee where Esalary between 2000 and 5000;
select * from Employee Where  Esalary = 1000.50 or 5000.50;
select * from Employee where id =1 or id=5 or id=3;
# not equal
select * from Employee where Esalary !=1500.00;
select * from Employee where Ename='Nisha';
update Employee set id =8 where Esalary >5000.50;
select Ename,id from Employee where Esalary > 1500 and Eaddr ='Hooghly';
