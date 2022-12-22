USE niladri_db;
create table CUSTOMER(
Cust_id varchar (5) primary key not null,
Fname varchar(15) not null,Lname varchar(15) not null,
Area char(2),
Phone bigint(10),
DOB varchar (15),
 Payment double);
 insert into CUSTOMER values 	#insert the value
('A01','Ivan','Ross','SA',6125467,'15-jan-86',800.50),
('A02','Vandana','Ray','MU',5560379,'20-dec-87',1000.75),
('A03','Pramada','Jauguste','DA',4560389,'25-jul-67',500.00),
('A04','Basu','Navindi','BA',6125401,'30-feb-56',860.00),
('A05','Ravi','Shridhar','NA',null,'15-feb-89',500.50),
('A06','Rukmini','Aiyer','GH',5125274,'23-jul-87',1500.50);
#2. Display the structure of the table you have created.
desc CUSTOMER;
# 3. Display the data of the created table
select * from CUSTOMER;
# 4. Insert a row which will accept system date.
select now();
alter table customer ADD CurrentDate varchar(15) after payment;
UPDATE CUSTOMER SET  CurrentDate=curdate();
# 5. Display the data in the table
select * from CUSTOMER;
# 6. Update the phone numbers of customer A02 and A04.
update CUSTOMER set phone = 5698741 where Cust_id ='A01';
update CUSTOMER set phone = 7854960 where Cust_id ='A04';
# 7. Update the date of birth of customer A03 and A05
update CUSTOMER set DOB = '01-aug-89' where Cust_id ='A03';
update CUSTOMER set DOB = '08-nov-68' where Cust_id ='A05';
# 8. Display the updated table.
select * from CUSTOMER;
# 9. Delete 2 rows from the table for customers A01 and A05.
delete from CUSTOMER where Cust_id='A01' or Cust_id='A05';
# 10. Delete all the rows from the table
TRUNCATE table CUSTOMER;
# 11. Insert 5 records according to your own wish.
insert into CUSTOMER values 	#insert the value
('B01','Niladri','Chowdhury','CN',7896541,'15-jul-93',1800.50,curdate()),
('B02','Soumya','Chatterjee','DU',8974535,'20-jan-97',2000.75,curdate()),
('B03','Nisha','Sutradhar','AS',9856217,'25-may-98',1500.00,curdate()),
('B04','Avishek','Maity','MD',957820,'30-march-96',1860.00,curdate()),
('B05','Misbha','Chaudhury','TA',6325971,'23-june-98',3500.50,curdate());
# 12. Update one record based on any criteria according to your own wish
UPDATE CUSTOMER SET Lname='Das' WHERE Cust_id='B05';
# 13. Delete any 1 record from the table based on particular criteria
DELETE FROM CUSTOMER WHERE Cust_id='B03';

