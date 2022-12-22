USE niladri_db;
# table creation
create table Department(
id int primary key, 
sname varchar(20) not null, 
sphone bigint(10) not null,
semail varchar(30) not null unique,
sadd varchar (50) not null);
#insert data into tables
insert into Department values
(1,'Niladri',7895483258,'nil@gmail.com','Chinsurah'),
(2,'Soumya',9875984620,'sou@gmail.com','Durgapur'),
(3,'Nisha',5987421569,'nisha@gmail.com','Asansole'),
(4,'Avishek',5487210369,'avi@gmail.com','Midnapur'),
(5,'Shifa',9635879410,'shifa@gmail.com','Odisha');
#add new column using alter
alter table Department ADD age int after sname;
# delete from table
delete from Department where sname='Niladri';
# update table
update Department set age=22 where id=2;
update Department set age=28 where id=4;
#using truncate claws
truncate Department;
#using Drop claws
drop table Department;
