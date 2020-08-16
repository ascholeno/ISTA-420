# TSQL Homework Chapter 8B
### Anthony Scholeno


1. The sales tax rate for a state just changed. How would you update the state sales tax table to reflect the changes? Assume that this table has an ID column, an RATE column, and a STATE column.

```
UPDATE state sales tax
SET RATE = newVal
Where STATE = State
```

2. The revenue division has requested that you provide a report on what the actual sales taxes would have been for all orders in the past year, assuming the retroactivity of the new sales tax rate. How would you calculate this?

Update based on a join.
```
UPDATE ST
SET RATE = newVal
Where STATE = State
FROM TAXES as ST
JOIN ORDERS as O
on ST.ORDERS = O.Orderdate
WHERE STATE = State
```

3. Explain how the proprietary assignment update command works.

The proprietary assignment update syntax both updates data in a table and assigns values to variables at the same time. (Page 271)

4. What is one very important purpose of the MERGE SQL statement. What is ETL (not in the book).

Extract, transform, load. 

5. What are the semantics of MERGE.

You specify the target table name in the MERGE clause and the source table name in the USING clause. You define a merge condition by specifying a predicate in the ON clause. The merge condition defines which rows in the source table have matches in the target and which don't. You define the action to take when a match is found in a clause called WHEN MATCHED THEN, and the action to take when a match is not found in the WHEN NOT MATCHED THEN clause. (pg 273)

6. Write a typical INSERT OUTPUT statement. (281)

```
INSERT INTO dbo.T1(datacol)
  OUTPUT inserted.keycol, inserted.datacol
	SELECT lastname
	FROM HR.Employees
	WHERE country = N'USA':
```

7. Write a typical UPDATE OUTPUT statement.

```
UPDATE dbo.OrderDetails
  SET discount += 0.05
OUTPUT
  inserted.orderid,
  inserted.productid,
  deleted.discount AS olddiscount,
  inserted.discount AS newdiscount
WHERE productid = 51;
```
(pg 284)

8. Write a typical DELETE OUTPUT statement.

```
DELETE FROM dbo.Orders
  OUTPUT
    deleted.orderid,
    deleted.orderdate,
    deleted.empid,
    deleted.custid
WHERE orderdate < '20160101';
```
(pg 282)

9. Write a typical MERGE OUTPUT statement.

```
MERGE INTO dbo.Customers as TGT
USING dbo.CustomersStage AS SRC
  ON TGT.custid = SRC.custid
WHEN MATCHED THEN
  UPDATE SET
    TGT.companyname = SRC.companyname,
    TGT.phone = SRC.phone,
    TGT.address = SRC.address
WHEN NOT MATCHED THEN
  INSERT (custid, companyname, phone, address)
  VALUES (SRC.custid, SRC.companyname, SRC.phone, SRC.address)
OUTPUT $action AS theaction, inserted.custid,
  deleted.companyname AS oldcompanyname,
  inserted.companyname AS newcompanyname,
  deleted.phone AS oldphone,
  inserted.phone AS newphone,
  deleted.address AS oldaddress,
  inserted.address AS newaddress;
  ```
  (pg 284/285)

10. What is nested DML?

A feature you can use to directly insert into the final target table only the subset of rows you need from the full set of modified rows. (pg 285)

11. Alter table

    Alter table Person
    Add Column DayofBirth string Null;

12.(Not in book) Write a query adding a DEFAULT constraint to the column DayOfBirth. The constraint is that the value matches one of SUN, MON, TUE, WED, THU, FRI, or SAT.

Constraint CHK_DayOfBirth CHECK 
(DayOfBirth like '[SUN], [MON], [TUE], [WED], [THU]. [FRI], [SAT]'); 



13.(Not in book) Write a query adding a foreign key to the column DayOfBirth. The referenced table is named WEEK and the referenced column is ValidDay.

      Alter table PERSON
      add foreign key (dayofBirth)
      not null reference
      Week(ValidDay)
