SQL Cheat Sheet
==================================

Basic Queries
-------------

Select one or more columns of data from a table:

    SELECT column_name_1, column_name_2
    FROM table_name;

Select all of the columns in a table:

    SELECT *
    FROM table_name;

Get only unique lines in a query:

    SELECT DISTINCT column_name
    FROM table_name;

Perform calculations in a query:

    SELECT column_name_1, AVG(column_name_2)
    FROM table_name;

Round values returned by a query (where **n** is the number of digits to round to):

    SELECT column_name_1, ROUND(column_name_2 / 1000.0, n)
    FROM table_name;


Filtering
---------

Select only the data meeting certain criteria:

    SELECT *
    FROM table_name
    WHERE column_name = 'Hello World';

Combine conditions:

    SELECT *
    FROM table_name
    WHERE (column_name_1 >= 1000) AND (column_name_2 = 'A' OR column_name_2 = 'B');

Simplify lists of conditions with `IN`:

    SELECT * 
    FROM table_name 
    WHERE column_name IN ("A", "B", "C", "D");


Sorting
-------

Sort results using `ASC` for ascending order or `DESC` for descending order:

    SELECT *
    FROM table_name
    ORDER BY column_name_1 ASC, column_name_2 DESC;


Missing Data
------------

`NULL` can be used in queries to represent missing data (note that this is not the same as true or false or 0).


Grouping and Aggregation
------------------------

Combine data into groups and calculate combined values in groups:

    SELECT column_name_1, SUM(column_name_2), COUNT(*)
    FROM table_name
    GROUP BY column_name_1;


Joins
-----

Join data from two tables:

    SELECT *
    FROM table_name_1
    JOIN table_name_2 ON table_name_1.column_name = table_name_2.column_name;
    
Joining data from multiple tables requires that enough `JOIN...ON` conditions be specified to link all the tables together.


Combining Commands
------------------

SQL commands must be combined in the following order:
`SELECT`, `FROM`, `JOIN`, `ON`, `WHERE`, `GROUP BY`, `ORDER BY`.


Set Operators
-------------

The set operators `UNION`, `UNION ALL`, `INTERSECT`, and `EXCEPT` can be used to compare the results from two `SELECT` statements.

    SELECT statement 1
    EXCEPT
    SELECT statement 2 
