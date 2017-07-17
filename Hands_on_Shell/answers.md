# Answers to Exercises

## Exercise 3 Answer
To order files in a directory by their file size, in combination with the `-l` flag:
~~~
ls -lS
~~~
Note that the `S` is **case-sensitive!**

To order files in a directory by their last modification date, in combination with the `-l` flag:
~~~
ls -lt
~~~

## Exercise 4 Answer
~~~
cp gulliver.txt gulliver-backup.txt
~~~

## Exercise 5 Answer
~~~
mv firstdir backup
~~~

## Exercise 6 Answer
~~~
mv gulliver-backup.txt backup
~~~
This would also work:
~~~
mv gulliver-backup.txt backup/gulliver-backup.txt
~~~

## Exercise 8 Answer
You may think there is not much value in such a basic command like `echo`. However, from the moment you start writing automated shell scripts, it becomes very useful. For instance, you often need to output text to the screen, such as the current status of a script.

Moreover, you just used a shell variable for the first time, which can be used to temporarily store information, that you can reuse later on. It will give many opportunities from the moment you start writing automated scripts.

## Exercise 9 Answer
The `cat` command just outputs whatever it gets as input, so you get exactly
the same output from

~~~
$ wc -l *.tsv | sort -n | head -n 1
~~~
and
~~~
$ wc -l *.tsv | sort -n | head -n 1 | cat
~~~

## Exercise 10 Answer
Here we use the `wc` command with the `-w` (word) flag on all `csv` files, `sort` them and then output the last 10 lines using the `tail` command.
~~~
wc -w *.csv | sort | tail -n 10
~~~

## Exercise 11 Answer
You get close with
~~~
$ ls -l | wc -l
~~~
but the count will be one too high, since the "total" line from `ls`
is included in the count. We'll get back to a way to fix that later
when we've learned about the `grep` command.

## Exercise 12 Answer
~~~
$ date > logfile.txt
$ cat logfile.txt
~~~
To check the contents, you could also use `less` or many other commands.
Beware that `>` will happily overwrite an existing file without warning you,
so please be careful.

## Exercise 13 Answer
~~~
$ date >> logfile.txt
$ cat logfile.txt
~~~

## Exercise 14 Answer
From `man wc`, you will see that there is a `-w` flag to print the number of words:
~~~
-w      The number of words in each input file is written to the standard output.
~~~
So to print the word counts of the `.tsv` files:
~~~
$ wc -w *.tsv
~~~
Output:
~~~
   511261 2014-01-31_JA-africa.tsv
  1049601 2014-01-31_JA-america.tsv
 17606310 2014-01_JA.tsv
   196999 2014-02-02_JA-britain.tsv
 19364171 total
~~~
And to sort the lines numerically:
~~~
$ wc -w *.tsv | sort -n
~~~
Output:
~~~
   196999 2014-02-02_JA-britain.tsv
   511261 2014-01-31_JA-africa.tsv
  1049601 2014-01-31_JA-america.tsv
 17606310 2014-01_JA.tsv
 19364171 total
~~~

## Exercise 15 Answer
~~~
$ grep hero *.tsv
~~~

## Exercise 16 Answer
~~~
$ grep hero *a.tsv
~~~

## Exercise 17 Answer
~~~
$ grep -c hero *a.tsv
~~~

## Exercise 18 Answer
~~~
$ grep -ci hero *a.tsv
~~~

## Exercise 19 Answer
~~~
$ grep -i hero *a.tsv > results/new.tsv
~~~

## Exercise 20 Answer
~~~
$ grep -iw hero *a.tsv > results/new2.tsv
~~~

## Exercise 21 Answer
~~~
$ grep -E '\d{4}-\d{4}' 2014-01_JA.tsv > issns.tsv
~~~
or
~~~
$ grep -P '\d{4}-\d{4}' 2014-01_JA.tsv > issns.tsv
~~~
If you came up with something more advanced, perhaps including word boundaries,
please share your result on the Etherpad and give yourself a pat on the shoulder.

## Exercise 22 Answer
~~~
$ grep -Eo '\d{4}-\d{4}' 2014-01_JA.tsv | uniq | wc -l
~~~

## Exercise 23 Answer
To find any lines starting with "total", we would use:
~~~
$ ls -l | grep -E '^total'
~~~
To *exclude* those lines, we add the `-v` flag:
~~~
$ ls -l | grep -v -E '^total'
~~~
The grand finale is to pipe this into `wc -l`:
~~~
$ ls -l | grep -v -E '^total' | wc -l
~~~