# TSQL Homework Chapter 8a
### Anthony Scholeno


1. When using INSERT, is the list of columns necessary? Why or why not?

No, it is optional, but by doing so you control the value-column associations instead of relying on the order of the columns in the CREATE TABLE statement. (pg 250)

2. When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do you not use a subquery?

Yes when using the INSERT SELECT statement the result of a select query (derived table) is what's being inserted into the specified table.  You would not want to use this if your query invokes a system functions as the function will only run once for the entire query. (pg 251)

3. What is the operand for the INSERT EXEC statement?

When using the INSERT EXEC statement the target table for the insertion is the operand. (pg 252)

4. How would you use the SELECT INTO statement?

The SELECT INTO statement is a nonstandard T-SQL statement that creates a target table and populates it with the result set of a query.  To use it you simply add INTO right before the FROM clause of the select query you want to use to produce the result set. (pg 252)

5. What are the parameters to the BULK INSERT statement?

In the statement, you specify the target table, the source file, and options. (pg 253)

6. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness.

No Identity does not guarantee uniqueness, to guarantee uniqueness make sure you define a primary key or a unique constraint on that column. (pg 257)

7. How do you create a SEQUENCE object?

To create a SEQUENCE object, use the CREATE SEQUENCE command. (pg 258)

8. How do you use a SEQUENCE object?

To use a sequence object you can either generate a new value or store the value in a variable to be used later. (pg 259)

9. How do you alter a SEQUENCE object?

You can change any of the sequence properties except the data type with the ALTER SEQUENCE command. (pg 259)

10. What is the difference between DELETE and TRUNCATE?

the DELETE statements deletes data from a table based on a filter predicate.  The TRUNCATE statements deletes all rows from a table and has no filter predicate. Both are transactional however, TRUNCATE is minimally logged and thus offers faster performance. Truncate also resets the identity value back to the original seed, but DELETE doesn't. (pg 264)

11. What is the difference between DELETE and DROP TABLE?

The DROP TABLE statement drops a table entirely and does not have any filter predicate. (pg 264)
