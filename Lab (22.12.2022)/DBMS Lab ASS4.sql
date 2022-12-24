# lab assignment 4
USE niladri_db;
# 1st table creation
create table Customer_1(
Cust_id varchar(4) primary key unique,
Fname varchar (15) not null,
Lname varchar (15),
Area varchar (4) not null,
Phone int);
# Data insertion
insert into Customer_1 values
('A01', 'Ivan', 'Ross', 'SA', 6125467),
('A02', 'Vandana', 'Ray', 'MU', 5560379),
('A03', 'Pramada', 'Jauguste', 'DA', 4560389),
('A04', 'Basu', 'Navindi', 'BA', 6125401),
('A05', 'Ravi', 'Shridhar', 'NA', null),
('A06', 'Rukmini', 'Aiyer', 'GH', 5125274);

#2nd table creation
create table Movie(
Mv_no int primary key,
Cust_id varchar(4),foreign key(Cust_id) references Customer_1(Cust_id),
Title varchar (25) not null,
Star varchar (2) not null,
Price int );
# data insertion 
insert into Movie values
(1, 'A02', 'Bloody', 'JC', 181),
(2, 'A04', 'The Firm', 'TC', 200),
(3, 'A01', 'Pretty Woman', 'RG', 151),
(4, 'A06', 'Home Alone', 'MC', 150),
(5, 'A05', 'The Fugitive', 'MF', 200),
(6, 'A03', 'Coma', 'MD', 100),
(7, 'A02', 'Dracula', 'GO', 150),
(8, 'A06', 'Quick Change', 'BM', 100),
(9, 'A03', 'Gone with the Wind', 'CB', 200),
(10, 'A05', 'Carry on Doctor', 'LP', 100);
# 2. Prove that entity integrity constraint is ensured by both the tables. (2 conditions to be checked).
insert into Movies values (11, 'A07', 'John Wick', 'PU', 400);# this entity will not allow because Referential Integrity Constraints is not satisfy
insert into Customer_1 values(null, 'Kia', 'Charlse', 'AD', 9542684);# this entity will not allow because Entity integrity constraints is not satisfy
# 3. Prove that referential integrity constraint is ensured by both the tables.
insert into Movie values ('11','A01','Harry Potter','LO',200);  # here cust_id 'A01' present in the Customer4 table(parent table)

# 4. Prove that domain integrity constraint is ensured by the Movie table
insert into Movie values ('12','A03','Gone Girl','DB',BB);   # this entity will not allow because data type of domain includes integer but we input a string

# 5. Display the movie titles, whose price is greater than 100 but less than 200.
select Title from Movie where price between 100 and 200;
# 6. Display the cust_id who have seen movies having stars as either JC or TC or MC.
select Cust_id from Movie where star = 'JC' or Star = 'TC' or Star = 'MC';
# 7. Display the details of those customers who have an A in their area name.
select * from Customer_1 where Area like '%A%';
# 8. Display the movie titles, whose price is within 180 and the movie titles are of exactly 6 characters.
select Title from Movie where Price < 180  and length(Title) = 6;
# 9. Display the movie name, their original prices and the prices after 10% increment. Give alias name to the incremented price column.
select Title,Price,Price + price % 10 as ' Incremented price' from Movie;
# 10.Display all the customer details in the following way:‘Ivan Ross stays in SA and his phone number is 6125467.’
select Fname,Lname,  Area ,phone from Customer_1;
# 11.Add a not null constraint to the Lname field in Customer.
alter table Customer_1 modify Lname varchar(15) not null;
# 12.Display the customer’s name whose phone number is not recorded.
select Fname from Customer_1 where Phone is null;
# 13.Add the phone number according to your own wish for the person mentioned in problem no 12.
update Customer_1 set phone = 7894561 where Cust_id = 'A05';
# 14.Display the unique customer ids from movie table.
select distinct Cust_id from Movie;
# 15.Remove the not null constraint from Star column in movie table.
# 16.Delete any row from the Customer table. If you cannot delete, then note the error message displayed
DELETE from Customer_1 where Cust_id ='A04';  #Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`niladri_db`.`movie`, CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `customer_1` (`Cust_id`))
# 17.Delete any row from the Movie table. If you cannot delete, then note the error  message displayed
DELETE from Movie  where Mv_no = 7;
# 18.Drop the Customer table. If you cannot drop, then note the error message displayed.
drop table Customer_1; # Error Code: 3730. Cannot drop table 'customer_1' referenced by a foreign key constraint 'movie_ibfk_1' on table 'movie'.
# 19.Drop the Movie table. If you cannot drop, then note the error message displayed.
drop table Movie;
# 20.Drop the foreign key from Movie table.
alter table Movie drop FOREIGN KEY movie_ibfk_1;
