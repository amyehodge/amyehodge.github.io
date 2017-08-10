# Answers to Challenges

#### Challenge 1
In order to answer the questions, you will need to do the following basic data operations:
* select subsets of the data (rows and columns)
* group subsets of data
* do calculations
* combine data across tables

Instead of searching for the right peices of data ourselves, or clicking between tables, or manually sorting columns, we want to have the computer do this work for us. We also want to make it easy to repeat our analysis in case our data changes and we would prefer not to be modifying our source data when we do these analyses.

Putting our data in a relational database will help us achieve these goals.

#### Challenge 2
Import the plots and surveys tables using the information provided in the table below.

#### Challenge 3
Identify the species ID and weight for each survey item and the date on which it was recorded.

```
SELECT year, month, day, species_id, weight
FROM surveys;
```

#### Challenge 4
Identify the species ID and weight in milligrams for each survey item and the date on which it was recorded.

```
SELECT
```

#### Challenge 5
Produce a table listing the data for all individuals in Plot 1 that weighed more than 75 grams, telling us the date, species ID, and weight (in kg).

```
SELECT
```



#### Challenge 6
Update your query from Challenge **??** to include plot ID in the results, and include filters so that only individuals caught on plot 1 or plot 2 and that weigh more than 75g are returned.

```
SELECT year, month, day, species_id, plot_id, weight  
FROM surveys
WHERE (plot_id=1 OR plot_id=2) AND (weight > 75);
```

#### Challenge 7
Write a query to determine the average weight of the individuals in records 1, 63, and 64. How are null values treated?

```
SELECT AVG(weight)
FROM surveys
WHERE record_id IN (1, 63, 64);
```

To see what the values are for the three records being averaged:

```
SELECT record_id, weight
FROM surveys
WHERE record_id IN (1, 63, 64);
```

The null values are ignored in the calculation. The average weight reported is the average of the two records that have values: (40 + 48)/2.

#### Challenge 8
Update your query from Challenge 2 so that the results are ordered first by plot (ascending) and then lists the individuals in order from the biggest to the smallest.

```
SELECT year, month, day, species_id, plot_id, weight  
FROM surveys
WHERE (plot_id=1 OR plot_id=2) AND (weight > 75)
ORDER BY plot_id ASC, weight DESC;
```

#### Challenge 9
Update your query from Challenge 4 so that weight is displayed in kilograms and rounded to two decimal places. Only display results for female animals captured in 1999. Order the results alphabetically by the species ID.

```
SELECT year, month, day, species_id, plot_id, ROUND(weight/1000.0, 2)
FROM surveys
WHERE sex="F" AND year=1999
ORDER BY species_id ASC;
```

#### Challenge 10
Write a query to determine how many of each sex were counted in each species. Ignore the records with no sex indicated.

```
SELECT species_id, sex, COUNT(*)
FROM surveys
WHERE sex IS NOT NULL
GROUP BY species_id, sex;
```

Then, expanding on this query, list the weight of the largest animal in each category. Ignore the records that do not have weight indicated. What species ID is the largest female and how much does she weigh?

```
SELECT species_id, sex, COUNT(*), MAX(weight)
FROM surveys
WHERE sex IS NOT NULL AND weight IS NOT NULL
GROUP BY species_id,sex
ORDER BY sex, MAX(weight) DESC;
```

#### Challenge 11
Write a query that returns the genus, the species, and the weight of every individual captured at the site.

```
SELECT species.genus, species.species, surveys.weight
FROM surveys
JOIN species ON surveys.species_id = species.species_ID;
```

#### Challenge 12
Expand the query above to include the plot type and average weights (rounded to two decimal places) for each species/plot type combination. Order the output from the lowest weight to the highest. Exclude all records that don't have weight values recorded. Optional: use table name abbreviations and make the output easier to read.

```
SELECT genus, species, plot_type, ROUND(AVG(weight), 2)
FROM surveys
JOIN species ON surveys.species_id = species.species_ID
JOIN plots ON plots.plot_ID = surveys.plot_ID
WHERE weight IS NOT NULL
GROUP BY plot_type, species.species_id
ORDER BY AVG(weight);
```
One example answer with options:

```
SELECT genus AS 'Genus',
   species AS 'Species',
   plot_type AS 'Type of plot',
   ROUND(AVG(weight), 2) AS 'Average weight (g)'
FROM surveys su
JOIN species sp ON su.species_id = sp.species_id
JOIN plots p ON p.plot_ID = su.plot_id
WHERE weight IS NOT NULL
GROUP BY plot_type, sp.species_id
ORDER BY AVG(weight);
```

#### Challenge 13
Write a query using a set operator to identify all the species (by genus, species, and species_id) found in 1977 but not in 2002.

```
SELECT DISTINCT species.genus, species.species, species.species_ID
FROM surveys
JOIN species ON surveys.species_id = species.species_ID
WHERE surveys.year=1977
EXCEPT
SELECT DISTINCT species.genus, species.species, species.species_ID
FROM surveys
JOIN species ON surveys.species_id = species.species_ID
WHERE surveys.year = 2002;
```

#### Challenge 14


#### Challenge 15


#### Challenge 16
1. Solution
`SELECT plot_type, count(*) AS num_plots  FROM plots  GROUP BY plot_type  ORDER BY num_plots DESC`

2. Solution
`SELECT year, sex, count(*) AS num_animal  FROM surveys  WHERE sex IS NOT null  GROUP BY sex, year`

3. Solution
`SELECT species_id, plot_type, count(*) FROM surveys JOIN plots ON surveys.plot_id=plots.plot_id WHERE species_id IS NOT null GROUP BY species_id, plot_type`

4. Solution
`SELECT taxa, AVG(weight) FROM surveys JOIN species ON species.species_id=surveys.species_id GROUP BY taxa`

5. Solution
`SELECT taxa, 100.0*count(*)/(SELECT count(*) FROM surveys) FROM surveys JOIN species ON surveys.species_id=species.species_id GROUP BY taxa`

6. Solution
`SELECT surveys.species_id, MIN(weight) as min_weight, MAX(weight) as max_weight, AVG(weight) as mean_weight FROM surveys JOIN species ON surveys.species_id=species.species_id WHERE taxa = 'Rodent' GROUP BY surveys.species_id`

7. Solution
`SELECT surveys.species_id, sex, AVG(hindfoot_length) as mean_foot_length  FROM surveys JOIN species ON surveys.species_id=species.species_id WHERE taxa = 'Rodent' AND sex IS NOT NULL GROUP BY surveys.species_id, sex`

8. Solution
`SELECT surveys.species_id, year, AVG(weight) as mean_weight FROM surveys JOIN species ON surveys.species_id=species.species_id WHERE taxa = 'Rodent' GROUP BY surveys.species_id, year`
