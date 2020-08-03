.echo on
.headers on

-- Name: Anthony Scholeno
-- Date: July 16th, 2020
-- File: Lab 03 Scholeno

--1. What is the order number and the date of each order sold by each employee?
select e.employeeid, e.firstname, e.lastname, o.orderid, o.orderdate from employees e join orders o on e.employeeid = o.employeeid order by e.lastname, e.firstname;

--2. List each territory by region
select rtrim(r.regiondescription), t.territorydescription, t.regionid, r.regionid from territories t join region r on t.regionid = r.regionid order by r.regiondescription, t.territorydescription;

--3. What is the supplier name for each product alphabetically by supplier?
select s.supplierid, s.contactname, s.companyname, p.productname, p.productid from suppliers s join products p on s.supplierid = p.supplierid order by s.companyname, p.productname;

--4. For every order on May 5, 1998, how many of each item was ordered,
-- and what was the price of the item?
select o.orderid, o.customerid, o.orderdate, od.unitprice, od.quantity from orders o join order_details od on o.orderid = od.orderid where o.orderdate like '1998-05-05';



--8. List the products by name that were shipped to Germany
 select p.productid, p.productname, o.orderid, o.shipcountry from (products p join order_details od on p.productid = od.productid) join orders o on od.orderid = o.orderid where o.shipcountry like 'germany' order by p.productname;
