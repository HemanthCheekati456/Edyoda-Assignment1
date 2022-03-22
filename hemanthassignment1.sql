
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



select count(*) from SalesPeople where Sname like 'a%' or 'A%';
select Sname from SalesPeople as A join Orders as B on A.Snum=B.Snum group by B.Snum having Sum(Amt)>2000.00;
select count(Snum) from SalesPeople where City='Newyork';
select count(Snum) from SalesPeople where City in ('London','Paris');
select snum , count(Onum) , Odate from Orders group by Snum, Odate order by Snum;