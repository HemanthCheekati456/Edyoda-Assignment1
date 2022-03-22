
create table SalesPeople(
Snum int primary key,
Sname varchar(40) unique,
City varchar(40),
Comm int);

create table Customers(
Cnum int primary key,
Cname varchar(40),
City varchar(40) not null,
Snum int,
foreign key(Snum) references SalesPeople(Snum));

create table Orders(
Onum int primary key,
Amt decimal(10,2),
Odate date,
Cnum int,
Snum int,
foreign key(Cnum) references Customers(Cnum),
foreign key(Snum) references SalesPeople(Snum));

insert into SalesPeople values(1001,'Peel','London',12);
insert into SalesPeople values(1002,'Serres','Sanjose',13);
insert into SalesPeople values(1004,'Motika','London',11);
insert into SalesPeople values(1007,'Rifkin','Barcelona',15);
insert into SalesPeople values(1003,'Axelrod','Newyork',10);
insert into Customers values(2001,'Hoffman','London',1001);
insert into Customers values(2002,'Giovanni','Rome',1003);
insert into Customers values(2003,'Liu','Sanjose',1002);
insert into Customers values(2004,'Grass','Berlin',1002);
insert into Customers values(2006,'Clemens','London',1001);
insert into Customers values(2008,'Cisneros','Sanjose',1007);
insert into Customers values(2007,'Pereira','Rome',1004);
insert into Orders values (3001,18.69,'1990-10-03',2008,1007);
insert into Orders values (3003,767.19,'1990-10-03',2001,1001);
insert into Orders values (3002,1900.10,'1990-10-03',2007,1004);
insert into Orders values (3005,5160.45,'1990-10-03',2003,1002);
insert into Orders values (3006,1098.16,'1990-10-03',2008,1007);
insert into Orders values (3009,1713.23,'1990-10-04',2002,1003);
insert into Orders values (3007,75.75,'1990-10-04',2004,1002);
insert into Orders values (3008,4273.00,'1990-10-05',2006,1001);
insert into Orders values (3010,1309.95,'1990-10-06',2004,1002);
insert into Orders values (3011,9891.88,'1990-10-06',2006,1001);

select count(*) from SalesPeople where Sname like 'a%' or 'A%';
select Sname from SalesPeople as A join Orders as B on A.Snum=B.Snum group by B.Snum having Sum(Amt)>2000.00;
select count(Snum) from SalesPeople where City='Newyork';
select count(Snum) from SalesPeople where City in ('London','Paris');
select snum , count(Onum) , Odate from Orders group by Snum, Odate order by Snum;