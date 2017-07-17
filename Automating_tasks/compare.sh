#!/bin/bash

#This script will compare the contents of two weekly Argo reports on hydrus items and report back all the newly-accessioned items that I am interested in. See details below.

#To run this
#bash compare.sh [name of first report file for comparison] [name of second report file for comparison]

#Assign current date to a variable.
today=$(date +"20%y%m%d")

#Select only accessioned content from the two files you want to compare and dump the output from both into a single file
grep -i "accessioned" $1 > accessioned.csv
grep -i "accessioned" $2 >> accessioned.csv

#For the new combined set of data, sort the remaining content and 
#remove all entries that are not unique and
#remove content from a specific group (those where the users are dhartwig and jejohns).
sort accessioned.csv | uniq -u | grep -vE "dhartwig|jejohns"  > results$today.csv

#When finished, remove the temporary accessioned.csv
rm accessioned.csv
