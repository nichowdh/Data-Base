USE niladri_db; #(create, insert,modify, alter, drop)
create table Student(id int primary key, sname varchar(20) not null, #create table Student
sphone bigint(11) not null unique,semail varchar(30) not null unique,
sadd varchar (50) not null,sdept varchar(20));
insert into Student values 	#insert the value
(1,'RANOJOY',8954765125,'ran@gmail.com','chennai','IT'),
(2,'NILADRI',6974854269,'nil@gmail.com','chunsurah','ECE'),
(3,'SOUMYA',9578465135,'soum@gmail.com','Durgapur','CS'),
(4,'NISHA',7548968713,'nisha@gmail.com','Asansole','CS'),
(5,'ABHISHEK',457357915,'abhi@gmail.com','Midnapur','IT'),
(6,'SOURAV',8954756248,'sou@gmail.com','Chandrakona','ME'),
(7,'MISBAH',7489658173,'mis@gmail.com','Kolkata','EE');
#add new column
alter table Student ADD age int after sname;
#modify datatype size
alter table Student MODIFY sdept varchar (30);
#modify constraint
alter table Student MODIFY sphone int(11) not null;
#drop column
alter table Student DROP COLUMN sdept;
#change column name
alter table Student RENAME TO student_details;
#insert single row
insert into student_details values
(8,'Pallabi',27,9632147855,'pal@gmail.com','kolkata');
#delete rows
truncate student_details;
#delete whole table
drop table student_details;
update student_details set sage=20 where id=1;
update student_details set sage=22 where id=2;
update student_details set sage=26 where id=3;
update student_details set sage=28 where id=4;
update student_details set sage=25 where id=5;
update student_details set sage=30 where id=10;
alter table student_details add fees double after squalification;
update student_details set fees=3000.60 where id=1;
update student_details set fees=3000.60 where id=2;
update student_details set fees=3000.60 where id=3;
update student_details set fees=3000.60 where id=4;
update student_details set fees=3000.60 where id=5;
update student_details set fees=3000.60 where id=10;
update student_details set squalification='BCA' where sname='Baisali';

delete from student_details where sname='pallabi';

alter table student_details drop column fees;
