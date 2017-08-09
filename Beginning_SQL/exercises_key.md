# Answers to Exercises

#### Exercise 1
Write a query that returns the year, month, day, species ID, and weight.

```
SELECT year, month, day, species_id, weight
FROM surveys;
```

#### Exercise 2
Update your query from Exercise 1 to include plot ID in the results, and include filters so that only individuals caught on plot 1 or plot 2 and that weigh more than 75g are returned.

```
SELECT year, month, day, species_id, plot_id, weight  
FROM surveys
WHERE (plot_id=1 OR plot_id=2) AND (weight > 75);
```

#### Exercise 3
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

#### Exercise 4
Update your query from Exercise 2 so that the results are ordered first by plot (ascending) and then lists the individuals in order from the biggest to the smallest.

```
SELECT year, month, day, species_id, plot_id, weight  
FROM surveys
WHERE (plot_id=1 OR plot_id=2) AND (weight > 75)
ORDER BY plot_id ASC, weight DESC;
```

#### Exercise 5
Update your query from Exercise 4 so that weight is displayed in kilograms and rounded to two decimal places. Only display results for female animals captured in 1999. Order the results alphabetically by the species ID.

```
SELECT year, month, day, species_id, plot_id, ROUND(weight/1000.0, 2)
FROM surveys
WHERE sex="F" AND year=1999
ORDER BY species_id ASC;
```

#### Exercise 6
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

#### Exercise 7
Write a query that returns the genus, the species, and the weight of every individual captured at the site.

```
SELECT species.genus, species.species, surveys.weight
FROM surveys
JOIN species ON surveys.species_id = species.species_ID;
```

#### Exercise 8
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

#### Exercise 9
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
