# TSQL Homework 07
## Name: Anthony Scholeno


What is a window function?
A window function is a function that, for each row, computes a scalar result value based on a calculation against a subset of the rows from the underlying query.

What does PARTITION do?
The window-partition clause (PARTITION BY) restricts the window to the subset of rows that have the same values in the partitioning columns as in the current row.

What does ORDER BY do?
The window-order clause (ORDER BY) supports a frame specification.

What does ROWS BETWEEN do?
A window frame clause (ROWS BETWEEN) filters a frame, or a subset, of rows from the window partition between the two specified delimiters.

What is a ranking window function? Why would you use it? Give an example.
You use ranking window functions to rank each row with respect to others in the window. You would use this to control the precedence of the output view from your query. (pg 216)

What is an offset window function? Why would you use it? Give an example.
You use offset window functions to return an element from a row that is at a certain offset from the current row or at the beginning or end of a window frame. You would use this to return a specific element that had a specific relationship to the current row. (pg 219)

What do LEAD and LAG do?
The LEAD and LAG functions support window partitions and window order clauses. (pg 219)

What do FIRST_VALUE and LAST_VALUE do?
The FIRST_VALUE and LAST_VALUE functions return an element from the first and last rows in the window frame, respectively. (pg220)

What is an aggregate window function? Why would you use it? Give an example.
Aggregate window functions are used to aggregate the rows in the defined window. They support window-partition, window-order, and window-frame clauses. You would use an aggregate window function if you wanted to isolate a restricted window to expose to a function in an underlying query. (pg 221)

What is a pivot table and what does it do?
Pivoting data involves rotating data from a state of rows to a state of columns, possibly aggregating values along the way. (pg 224)

In mathematical theory, what is a power set? How does this definition of power set relate to grouping sets?
The power set S is the set of all subsets of S, including the empty set and S itself.

What is a bit array? How can you implement a bit array to represent a set of flags?
A bit array is an array data structure that compactly stores bits. It can be used to implement a simple set data structure.

How would interpret this command: chmod 755 myscript.sql?
It adds the execute permission for all users to the existing permission.
