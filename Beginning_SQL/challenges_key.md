# Answers to Challenges

#### Challenge 1
Open each of the csv files and explore them. What information is contained in each file? If you had the following research questions:

* How many specimens of each species were captured in each type of plot?
* What are the minimum, maximum, and average weight for each species of rodent?
* What is the average weight of each rodent species over the course of the years? Is there any noticeable trend for any of the species?

What would you need to answer these questions? Which files have the data you would need? What operations would you need to perform if you were doing these analyses from these csv files?

```
In order to answer the questions, you will need to do the following basic data operations:
* select subsets of the data (rows and columns)
* group subsets of data
* do calculations
* combine data across tables

Instead of searching for the right pieces of data ourselves, or clicking between tables, or manually sorting columns, we want to have the computer do this work for us. We also want to make it easy to repeat our analysis in case our data changes and we would prefer not to be modifying our source data when we do these analyses.

Putting our data in a relational database will help us achieve these goals.
```

#### Challenge 2
Import the **plots** and **species** tables using the information provided in the table below.

```
Follow the step-by-step instructions given in the lesson for this task.
```

#### Challenge 3
Identify the species ID and weight for each survey item and the date on which it was recorded.

```
SELECT year, month, day, species_id, weight
FROM surveys;
```

#### Challenge 4
Identify the species ID and weight in milligrams for each survey item and the date on which it was recorded.

```
SELECT year, month, day, species_id, weight*1000
FROM surveys;
```

#### Challenge 5
Produce a table listing the data for all individuals in plot 1 that weighed more than 75 grams, telling us the date, species ID, and weight (in kg).

```
SELECT year, month, day, species_id, weight/1000
FROM surveys
WHERE plot_id=1 AND weight > 75;
```

#### Challenge 6
Identify the species ID, weight, and plot ID for each survey item, and include filters so that only individuals caught on plot 1 or plot 2 and that weigh more than 75g are included.

```
SELECT species_id, plot_id, weight  
FROM surveys
WHERE (plot_id=1 OR plot_id=2) AND (weight > 75);
```

#### Challenge 7
Write a query to determine the average weight of the individuals in records 1, 63, and 64. How are `NULL` values treated?

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

The `NULL` values are ignored in the calculation. The average weight reported is the average of the two records that have values: (40 + 48)/2.

#### Challenge 8
Alphabetize the **species** table by genus and then species.

```
SELECT *  
FROM species
ORDER BY genus ASC, species ASC;
```

#### Challenge 9
Calculate the total, average, minimum, and maximum weights of the animals collected over the duration of the survey, then see if you can calculate these values only for animals that weighed between 5 and 10 g.

```
SELECT  SUM(weight), AVG(weight), MIN(weight), MAX(weight)  
FROM surveys;
```

```
SELECT  SUM(weight), AVG(weight), MIN(weight), MAX(weight)  
FROM surveys
WHERE weight > 5 AND weight < 10;
```

#### Challenge 10
1. Identify how many animals were counted in each year total.

```
SELECT year, COUNT(*)
FROM surveys
GROUP BY year;
```

2. Identify how many animals were counted in each year per species.

```
SELECT year, species_id, COUNT(*)
FROM surveys
GROUP BY year, species_id;
```

3. Identify the average weight of each species in each year.

```
SELECT year, species_id, ROUND(AVG(weight), 2)
FROM surveys
GROUP BY year, species_id;
```

4. Now try to combine the above queries to list how many and the average weight for each species in each year.

```
SELECT year, species_id, COUNT(*), ROUND(AVG(weight), 2)
FROM surveys
GROUP BY species_id, year;
```

#### Challenge 11
Figure out how many different genera (that's the plural of genus!) there are in each taxa, but only for cases where there are 10 or more genera. List the taxa with the most genera at the top.

```
SELECT taxa, COUNT(genus)
FROM species
GROUP BY taxa
HAVING COUNT(genus) > 10;
```

#### Challenge 12
Identify the genus, species, and weight of every individual captured at the site.

```
SELECT species.genus, species.species, surveys.weight
FROM surveys
JOIN species
ON surveys.species_id = species.species_id;
```

#### Challenge 13
Rewrite the join above to keep all the entries present in the **surveys** table. How many records are returned by this query?

```
SELECT species.genus, species.species, surveys.weight
FROM surveys
LEFT JOIN species
ON surveys.species_id = species.species_id;
```
This query returns 35,549 records. This is the as the number of records in the surveys table, as it should be.


#### Challenge 14
How many of each genus were caught in each plot? Report the answer with the greatest number at the top of the list.

```
SELECT surveys.plot_id, species.genus, COUNT(surveys.species_id)
FROM surveys
JOIN species ON surveys.species_id=species.species_id
GROUP BY surveys.plot_id, species.genus
ORDER BY COUNT(species.genus) DESC;
```

#### Challenge 15
Have a look at the following questions; these questions are written in plain English. Can you translate them to SQL queries and give a suitable answer?

1. How many plots of each treatment type are there?

```
SELECT plot_type, COUNT(*)
FROM plots  
GROUP BY plot_type;
```

2. How many male and female specimens were identified each year? We aren't interested in cases where the sex is not known.  

```
SELECT year, sex, COUNT(*)  
FROM surveys  
WHERE sex IS NOT null  
GROUP BY sex, year;
```

3. How many specimens of each species were captured in each type of plot? We aren't interested if the species isn't known.

```
SELECT surveys.species_id, plots.plot_type, COUNT(*)
FROM surveys
JOIN plots
ON surveys.plot_id=plots.plot_id
WHERE surveys.species_id IS NOT null
GROUP BY surveys.species_id, plots.plot_type;
```

4. What is the average weight of each taxa?

```
SELECT species.taxa, AVG(surveys.weight)
FROM surveys
JOIN species
ON species.species_id=surveys.species_id
GROUP BY species.taxa;
```

5. What are the minimum, maximum, and average weight for each species of rodent?

```
SELECT surveys.species_id, MIN(surveys.weight), MAX(surveys.weight), AVG(surveys.weight)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
WHERE species.taxa = "Rodent"
GROUP BY surveys.species_id;
```

6. What is the average hindfoot length for male and female rodent of each species? Is there a male/female difference?

```
SELECT surveys.species_id, surveys.sex, ROUND(AVG(surveys.hindfoot_length), 2)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
WHERE species.taxa = 'Rodent' AND surveys.sex IS NOT NULL
GROUP BY surveys.species_id, surveys.sex
ORDER BY surveys.species_id;
```

`ORDER BY` helps us be able to scan for differences, though graphing the output (and calculating standard deviation) would be even better.

7. What is the average weight of each rodent species over the course of the years? Is there any noticeable trend for any of the species?

```
SELECT surveys.species_id, surveys.year, ROUND(AVG(surveys.weight), 2)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
WHERE species.taxa = 'Rodent'
GROUP BY surveys.species_id, surveys.year
ORDER BY surveys.species_id;
```

Again, `ORDER BY` helps with trying to get a feel for trends, but graphing would make this much easier to see.

8. What is the percentage of each species in each taxa? (Hint: Start by determining how many of each species there are in each taxa and then see if you can figure out how to report the percentages. Why do the numbers not add up to 100%?)

```
SELECT taxa, ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM surveys), 2)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
GROUP BY taxa;
```

The numbers do not add up to 100% because the JOIN excludes the entries from the surveys table where the species was not recorded, but those entries ARE included in the percentage calculation (`SELECT COUNT(*) FROM surveys`). If you want to include the entries without a species in the results, use a `LEFT JOIN`. If you want to continue to exclude those but make the results add up to 100%, use a filter to exclude them from the percentage calculation (`SELECT COUNT(*) FROM surveys WHERE species IS NOT NULL`).
