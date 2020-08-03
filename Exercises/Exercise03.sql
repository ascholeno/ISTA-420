.echo on
.headers on

--Name: Anthony Scholeno
--File: Ex 03
--Date: July 19th 2020

--1. Using SQLite and the Northwind database, create a line item report that contains a line for each
--product in the order with the following columns: the order id, the product id, the unit price, the
--quantity sold, the line item price, and the percent of that line item constitutes of the total amount of
--the order.
select orderid, productid, unitprice, (unitprice * quantity) as line_total, ((unitprice*quantity)/(sum(unitprice*quantity)))*100 as PctOfTotalOrder from order_details group by orderid limit 25;

--2. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
--and employees,
select distinct e.city as employees, c.city as customers from employees e join customers c where c.city = e.city;
-- (b) where we have customers but no employees AND both customers ad employees,
--and
select distinct c.city as customers from customers c join employees e where c.city != e.city;
--(c) where we have employees but no customers AND both customers and employees. Write three
--queries, using inner and outer joins. Report the results of the queries. There is no need for any further
--reporting.
select distinct e.city as customers from customers c join employees e where c.city != e.city;
