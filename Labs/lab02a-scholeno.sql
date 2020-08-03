.echo on
.headers on

-- Name: Anthony Scholeno
-- File: lab02a-scholeno.sql
-- Date: July 8th, 2020

-- 1. What are the regions?
select * from region;

-- 2. What are the Cities?
select territoryID, territoryDescription from territories;

-- 3. What are the cities in the Southern region?
select * from territories where RegionID = 4;

-- 4. How do you run this query with the fully qualified column name?
select territories.territoryid, territories.territoryDescription, territories.RegionID from territories where regionID=4;

-- 5. How do you run this query with a table alias?
select t.territoryID, t.territoryDescription, t.RegionID from territories t where regionID=4;

-- 6. What is the contact name, telephone number, and city for each customer?
select c.customerid, c.companyname, c.contactname, c.city, c.phone from customers c;

-- 7. What are the products currently out of stock?
select p.ProductID, p.ProductName, p.UnitsInStock from products p where p.unitsinstock = 0;

-- 8. What are the ten products currently in stock with the least amout on hand?
select p.ProductID, p.ProductName, p.UnitsInStock from products p where p.unitsinstock > 0 order by p.unitsinstock limit 10;

-- 9. What are the five most expensive products in stock?
select p.ProductID, p.ProductName, p.Unitprice from products p order by p.unitprice desc limit 5;

-- 10. How many products does Northwind have? How many customers? How many suppliers?
select count(*) from suppliers s;
select count(*) from customers;
select count(*) from products;
