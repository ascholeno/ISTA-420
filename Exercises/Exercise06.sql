--Name: Anthony Scholeno
--File: Exercise 6

use Cars;

drop table if exists dbo.productlines
go
create table dbo.productlines 
	(
	productLine, textDescription varchar(1000), htmlDescription varchar(1000), imagePath varchar(1000) 
	);
go

BULK INSERT dbo.productlines FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\productLine.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO




drop table if exists dbo.employees
go
create table dbo.employees
	(
	employeeNumber varchar(50) constraint eN primary key, lastName varchar(50), firstName varchar(50), extension varchar(50), email varchar(50), officeCode varchar(50), reportsTo varchar(50), jobTitle varchar(50) 
	);
go

BULK INSERT dbo.employees FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\employees.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO

drop table if exists dbo.offices
go
create table dbo.offices
	(
	officeCode varchar(50) constraint oC primary key, city varchar(50), phone varchar(50), addressLine1 varchar(50), addressLine2 varchar(50), state varchar(50), country varchar(50), postalCode varchar(50), territory varchar(50)
	);
go

BULK INSERT dbo.offices FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\offices.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO

drop table if exists dbo.products
go
create table dbo.products
	(
	productCode varchar(1000) constraint pC primary key, productName varchar(100), productLine varchar(50), productScale varchar(50), productVendor varchar(50), productDescription varchar(1000), quantityInStock varchar(500), buyPrice varchar(500), MSRP varchar(500)
	);
go

BULK INSERT dbo.products FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\products.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO

drop table if exists dbo.customers
go
create table dbo.customers
	(
	customerNumber varchar(50) constraint customer_Number primary key, 
	customerName varchar(50), 
	contactLastName varchar(50), 
	contactFirstName varchar(50), 
	phone varchar(50), 
	addressLine1 varchar(50),
	addressLine2 varchar(50),
	city varchar(50), state varchar(50), 
	postalCode varchar(50),
	country varchar(50),
	salesRepEmployeeNumber varchar(50),
	creditLimit varchar(50)
	);
go

BULK INSERT dbo.customers FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\customers.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO

use cars; 

drop table if exists orderdetails
go
create table orderdetails
	(
	orderNumber varchar(50), productCode varchar(50), quantityOrdered smallint not null, priceEach money not null, orderLineNumber varchar(50)
	);
go

BULK INSERT dbo.orderdetails FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\orderdetails.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO

drop table if exists dbo.orders
go
create table dbo.orders
	(
	orderNumber varchar(500) constraint oNu primary key, orderDate date, requiredDate varchar(500), shippedDate date, status varchar(500), comments varchar(500), customerNumber varchar(500)
	);
go

BULK INSERT dbo.orders FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\orders.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO

drop table if exists dbo.payments
go
create table dbo.payments
	(
	customerNumber varchar(50), checkNumber varchar(50) constraint cN primary key, paymentDate varchar(50), amount varchar(50)
	);
go

BULK INSERT dbo.payments FROM 'C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\Cars\payments.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );
GO


--Part 3

--1. How many distinct products does ClassicModels sell?

select distinct count(productCode), productName from dbo.products;

--2. Report the name and city of customers who don't have sales representatives?

select customerName, city, salesRepEmployeeNumber from customers where salesRepEmployeeNumber like 'null';

--3. What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's rst name and last name into a single eld for reporting.

select firstName, lastName, jobTitle from employees where jobTitle like '%V%' or jobTitle like '%man%';

--4 Which orders have a value greater than $5,000? **

select distinct sum(quantityOrdered * priceEach) as totalValue from Orderdetails group by productCOde;

--5 Report the account representative for each customer. **

select customerNumber, customerName, salesRepEmployeeNumber from dbo.customers;

--6 Report total payments for Atelier graphique.

select c.customerName, count(p.paymentDate) as totalPayments from Payments p join  Customers c on p.customerNumber=c.customerNumber where c.customerName like '%telier graphiqu%' group by c.customerName, p.customerNumber;

--7 Report the total payments by date

select  paymentDate, count(paymentDate) as totalPayments from Payments group by paymentDate order by paymentDate;

--8 Report the products that have not been sold.

select p.productName from Products p
left join 
OrderDetails od on p.productCode=od.productCode
where od.productCode is null; 

--9 List the amount paid by each customer. **

select p.amount, c.customerName from payments p join Customers c on p.customerNumber=c.customerNumber group by p.amount, p.customerNumber, c.customerName;

--10 List products sold by order date.

select od.productCode, o.orderDate from orderdetails as od join orders o on o.orderNumber  = od.orderNumber order by o.orderDate;

--11 List the order dates in descending order for orders for the 1940 Ford Pickup Truck.

select p.productName, o.orderdate from (orderdetails od join products p on p.productcode=od.productcode) join orders o on od.ordernumber=o.ordernumber where p.productName like '%1940 Ford Pickup Truck' order by o.orderdate desc;

--12 List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?

select sum(od.quantityOrdered * od.priceeach) as Total_Value, c.customerName, od.orderNumber from customers as c join orders o on c.customerNumber = o.customerNumber join orderdetails od on od.orderNumber = o.orderNumber
group by od.orderNumber, c.customerName;

select top (213) c.customerName, od.ordernumber, sum(od.quantityordered * od.priceEach) as totalValue from (customers c join orders o on c.customernumber=o.customerNumber)
join orderdetails od on o.ordernumber=od.orderNumber group by c.customerName, od.orderNumber order by totalValue desc;


--13 What is the diference in days between the most recent and oldest order date in the Orders file?

select distinct datediff(DAY, '2003/01/06', '2005/05/31') as totalDiffDays from orders;

--14 Compute the average time between order date and ship date for each customer ordered by the largest diference.

select o.customernumber, datediff(day, o.orderdate, o.shippedDate) Date_Diff from orders as o order by Date_Diff desc; 
