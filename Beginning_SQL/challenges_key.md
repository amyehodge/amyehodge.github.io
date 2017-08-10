# Answers to Challenges

#### Challenge 1
Open each of the csv files and explore them. What information is contained in each file? If you had the following research questions:
* How has the hindfoot length and weight of *Dipodomys* species changed over time?
* What is the average weight of each species, per year?
* What information can I learn about *Dipodomys* species in the 2000s, over time?
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
Produce a table listing the data for all individuals in plot 1 that weighed more than 75 grams, telling us the date, species ID, and weight (in kg).

```
SELECT
```

#### Challenge 6
Identify the species ID, weight, and plot ID for each survey item, and include filters so that only individuals caught on plot 1 or plot 2 and that weigh more than 75g are included.

```
SELECT year, month, day, species_id, plot_id, weight  
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
SELECT
```

#### Challenge 10
* Identify how many animals were counted in each year total.
* Identify how many animals were counted in each year per species.
* Identify the average weight of each species in each year.
* Now try to combine the above queries to list how many and the average weight for each species in each year.

```
SELECT

last part
SELECT species_id, year, COUNT(*), AVG(weight)
FROM surveys
GROUP BY species_id, year;
```

#### Challenge 11
Figure out how many different genera (that's the plural of genus!) there are in each taxa, but only for cases where there are 10 or more genera. List the taxa with the most genera at the top.

```
SELECT
```

#### Challenge 12
Identify the genus, species, and weight of every individual captured at the site.

```
SELECT species.genus, species.species, surveys.weight
FROM surveys
JOIN species ON surveys.species_id = species.species_ID;
```

#### Challenge 13
Rewrite the join above to keep all the entries present in the **surveys** table. How many records are returned by this query?

```
SELECT
```

#### Challenge 14
How many of each genus were caught in each plot? Report the answer with the greatest number at the top of the list.

```
SELECT
```

#### Challenge 15
Have a look at the following questions; these questions are written in plain English. Can you translate them to SQL queries and give a suitable answer?
1. How many plots from each type are there?
```
SELECT plot_type, COUNT(*)
FROM plots  
GROUP BY plot_type  
ORDER BY COUNT(*) DESC
```

2. How many specimens are of each sex are there for each year?
```
SELECT year, sex, COUNT(*)  
FROM surveys  
WHERE sex IS NOT null  
GROUP BY sex, year
```

3. How many specimens of each species were captured in each type of plot?
```
SELECT species_id, plot_type, COUNT(*)
FROM surveys
JOIN plots
ON surveys.plot_id=plots.plot_id
WHERE species_id IS NOT null
GROUP BY species_id, plot_type
```

4. What is the average weight of each taxa?
```
SELECT taxa, AVG(weight)
FROM surveys
JOIN species
ON species.species_id=surveys.species_id
GROUP BY taxa
```

5. What is the percentage of each species in each taxa?
```
SELECT taxa, 100.0*COUNT(*)/(SELECT count(*) FROM surveys)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
GROUP BY taxa
```

6. What are the minimum, maximum and average weight for each species of rodent?
```
SELECT surveys.species_id, MIN(weight), MAX(weight), AVG(weight)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
WHERE taxa = 'Rodent'
GROUP BY surveys.species_id
```

7. What is the average hindfoot length for male and female rodent of each species? Is there a male/female difference?
```
SELECT surveys.species_id, sex, AVG(hindfoot_length)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
WHERE taxa = 'Rodent' AND sex IS NOT NULL
GROUP BY surveys.species_id, sex
```

8. What is the average weight of each rodent species over the course of the years? Is there any noticeable trend for any of the species?
```
SELECT surveys.species_id, year, AVG(weight)
FROM surveys
JOIN species
ON surveys.species_id=species.species_id
WHERE taxa = 'Rodent'
GROUP BY surveys.species_id, year
```
