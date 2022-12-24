USE niladri_db;

create table Student_join( #table no.1
id int ,
Fname varchar(15),
Laname varchar(15),
Age int (3),
City varchar(10),
Form_no varchar(2)primary key);
#insertion in the table
insert into Student_join values(1,'shifa','Iqbal',23,'Hooghly','A1');
insert into Student_join values(2,'Avishek','Maity',24,'Kolkata','A2');
insert into Student_join values(3,'Sourav','Das',25,'Patuli','A3');
insert into Student_join values(4,'Atif','Ansari',19,'Nadia','A4');
insert into Student_join values(5,'Soumya','Chatterjee',24,'New-Town','A5');
insert into Student_join values(6,'Niladri','Chowdhury',24,'Garia','A6');
insert into Student_join values(7,'Elijah','Simphly',23,'Howrah','A7');
insert into Student_join values(8,'Nisha','Sutradhar',25,'Behala','A8');
insert into Student_join values(9,'Peso','harangchal',22,'Barasat','A9');
insert into Student_join values(10,'Elina','Malik',20,'Rampurhat','B1');


create table fees( #new table no.2
form_no varchar(4),foreign key(form_no) references Student_join(form_no),
amount int,
course varchar(15));
#insertion into table
insert into fees values
('A1',4000,'Java'),
('A2',4000,'Java'),
('A3',5000,'Python'),
('A4',3000,'C++'),
('A5',3000,'Sql'),
('A6',2000,'DSA'),
('A7',5500,'DSA'),
('A8',5500,'CA'),
('A9',6000,'C++'),
('B1',7000,'Sql');
# foreign key
#alter table fees add foreign key(form_no) references Student_join(form_no);

# inner join
select Fname,Lname,Amount,Course from Student_join inner join fees on Student_join.form_no = fees.form_no;
select Fname,Amount,Course from Student_join inner join Fees on Student_join.form_no = fees.form_no;
#cross join
select * from Student_join cross join fees;
# self-join
select s1.Fname, s1.Age from Student_join s1 inner join Student_join s2 on s1.age=s2.age and s1.Id<>s2.Id order by s1.ID;
# left outer join
select Student_join.form_no,Fname,Amount from Student_join left join fees on Student_join.form_no = fees.form_no;
# right outer join
select Student_join.form_no,Fname,Amount from Student_join right join fees on Student_join.form_no = fees.form_no;
# sub query 
select * from Student_join where Fname in (select Fname from Student_join where age>24);
select * from fees where form_no in (select form_no from fees where Amount>5000);
select * from Student_join where Age = (select max(Age) from Student_join);
select * from Student_join where City not in (select city from Student_join where city = 'Nadia');
select * from fees where course != (select course from fees where course ='Java');
select * from fees where amount > (select amount from fees where course ='Python');
insert into fees values ('B2',9000,'IT'); #can not update a child row , foreign key constraint fails
insert into Student_join values (11,'pallabi','Bhaduri',26,'Kolkata','B2');
# any
select form_no,fname from Student_join where form_no > any (select form_no from fees);
select form_no,fname from Student_join where form_no < any (select form_no from fees);
select form_no,fname from Student_join where form_no = any (select form_no from fees);
# All
select form_no,Fname from Student_join where form_no < all (select form_no from fees);
select form_no,Fname from Student_join where form_no > all (select form_no from fees);
select form_no,Fname from Student_join where form_no = all (select form_no from fees);

