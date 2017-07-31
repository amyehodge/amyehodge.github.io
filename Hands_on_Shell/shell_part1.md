[Proceed to Part 2 >>](https://amyehodge.github.io/Hands_on_Shell/shell_part2)  

# Hands-on Introduction to the Shell, Part 1

## Introduction

In this session we will introduce programming by looking at how data can be manipulated, counted, and mined using the shell,
a command line interface to your computer and the files to which it has access.

A shell is a command-line interpreter that provides a user interface for the Linux
operating system and for Unix-like systems (such as Mac OS).

For Windows users, popular shells such as Cygwin (https://www.cygwin.com/) or Git Bash (https://git-for-windows.github.io/) provide a Unix-like
interface. This session will cover a small number of basic commands using Git Bash for Windows users,
Terminal for Mac OS. These commands constitute building blocks upon which more
complex commands can be constructed to fit your data or project.

Even if you do not do your own programming or your work currently does not involve the command line, knowing some basics about the shell can still be useful.

What you can quickly learn is how to query lots of data for the information you want super fast. Using Bash or any other shell sometimes feels more like programming than like using a mouse. Commands are terse (often only a couple of characters long), their names are frequently cryptic, and their output is lines of text rather than something visual like a graph. On the other hand, with only a few keystrokes, the shell allows us to combine existing tools into powerful pipelines and handle large volumes of data automatically. This automation not only makes us more productive, but also improves the reproducibility of our workflows by allowing us to repeat them with few simple commands.

Understanding the basics of the shell provides a useful foundation for learning to program, since most programming languages necessitate working with the shell.

## Navigating the shell

We will begin with the basics of navigating the shell.

Let's start by opening the shell. This likely results in seeing a black window with a cursor flashing next to a dollar sign.
This is our command line, and the `$` is the command **prompt** to show the system is ready for our input.
The prompt can look somewhat different from system to system, but it usually ends with a `$`.

When working in the shell, you are always *somewhere* in the computer's
file system, in some folder (directory). We will therefore start by finding out
where we are by using the `pwd` command, which you can use whenever you are unsure
about where you are. It stands for "print working directory" and the result of the
command is printed to your standard output, which is the terminal, not your office
printer.

Let's type `pwd` and hit enter to execute the command:
(The `$` sign is used to indicate a command to be typed on the command prompt,
 but we never type the `$` sign itself, just what follows after it.)

~~~
$ pwd
~~~
Output:
~~~
/Users/amyhodge
~~~

The output will be a path to your home directory. Let's check if we recognize it
by listing the contents of the directory. To do that, we use the `ls` command:

~~~
$ ls
~~~
Output:
~~~
Desktop     Downloads     Movies      Pictures   
Documents   Library       Music       Public
~~~

We may want more information than just a list of files and directories.
We can get this by specifying various **flags** (also known as options or switches) to go with our basic commands.
These are additions to a command that provide the computer with a bit more guidance
of what sort of output or manipulation you want.

If we type `ls -l` and hit enter, the computer returns a list of files that contains
information similar to what we would find in our Finder (Mac) or Explorer (Windows):
the size of the files in bytes, the date it was created or last modified, and the file name.

~~~
$ ls -l
~~~
Output:
~~~
total 34
drwx------+  6 amyhodge  staff   204 Jul 16 11:50 Desktop
drwx------+  3 amyhodge  staff   102 Jul 16 11:30 Documents
drwx------+  3 amyhodge  staff   102 Jul 16 11:30 Downloads
drwx------@ 46 amyhodge  staff  1564 Jul 16 11:38 Library
drwx------+  3 amyhodge  staff   102 Jul 16 11:30 Movies
drwx------+  3 amyhodge  staff   102 Jul 16 11:30 Music
drwx------+  3 amyhodge  staff   102 Jul 16 11:30 Pictures
drwxr-xr-x+  5 amyhodge  staff   170 Jul 16 11:30 Public
~~~

Let's say you are interested in having the contents of your directory sorted by size. Luckily, there's another flag `-S` that can do this for you.

~~~
$ ls -S
~~~
Output:
~~~
Library     Public        Downloads     Music
Desktop     Documents     Movies        Pictures           
~~~

This would be better if we could still see the actual sizes, so let's combine the -l and -S flags. When we want to combine two flags,
we can just run them together. So, by typing `ls -lS` and hitting
enter we receive an output in a human-readable format (note: the order of the flags here doesn't matter).

~~~
$ ls -lS
~~~
Output:
~~~
total 34
drwx------@ 46 amyhodge  staff   1.5K Jul 16 11:38 Library
drwx------+  6 amyhodge  staff   204B Jul 16 11:50 Desktop
drwxr-xr-x+  5 amyhodge  staff   170B Jul 16 11:30 Public
drwx------+  3 amyhodge  staff   102B Jul 16 11:30 Documents
drwx------+  3 amyhodge  staff   102B Jul 16 11:30 Downloads
drwx------+  3 amyhodge  staff   102B Jul 16 11:30 Movies
drwx------+  3 amyhodge  staff   102B Jul 16 11:30 Music
drwx------+  3 amyhodge  staff   102B Jul 16 11:30 Pictures
~~~

We've now spent a great deal of time in our home directory.
Let's go somewhere else. We can do that through the `cd` or Change Directory command:
(Note: On some systems the case of the file/directory name doesn't matter. On some systems it does.)

~~~
$ cd Desktop
~~~

Notice that the command didn't output anything. This means that it was carried
out successfully. Let's check by using `pwd`:

~~~
$ pwd
~~~
Output:
~~~
/Users/amyhodge/Desktop
~~~

If something had gone wrong, however, the command would have told you. Let's
see by trying to move into a (hopefully) non-existing directory:

~~~
$ cd "big trouble"
~~~
Output:
~~~
-bash: cd: big trouble: No such file or directory
~~~

Notice that we surrounded the name by quotation marks. The *arguments* given
to any shell command are separated by spaces, so a way to let them know that
we mean 'one single thing called "Evil plan to destroy the world"', not
'six different things', is to use (single or double) quotation marks.

We've now seen how we can go 'down' through our directory structure
(as in into more nested directories). If we want to go back, we can type `cd ..`.
This moves us 'up' one directory, putting us back where we started.
**If we ever get completely lost, the command `cd` without any arguments will bring
us right back to the home directory, right where we started.**

> #### TIP: Previous Directory
> To switch back and forth between two directories use `cd -`.

> ### Exercise 1: Explore
>
> Explore your file directories. The point of this exercise is to get used to moving in and out of directories and to see how different file types appear in the shell. Be sure to use the `pwd` and `cd` commands, and the different flags for the `ls` command you learned so far.
>
> If you run Windows, also try typing `explorer .` to open Explorer for the current directory (the single dot means "current directory"). If you're on Mac or Linux, try `open .` instead.


Being able to navigate the file system is very important for using the shell effectively.
As we become more comfortable, we can get very quickly to the directory that we want.   

Use the `man` command to invoke the manual page (documentation) for a shell command. For example, `man ls` displays all the flags/options available to you - which saves you remembering them all!

> ### Exercise 2: Getting help
>
> Open the manual page for each command you've learned so far.
> Use the spacebar to navigate the manual pages, and `q` to quit.
>
> **Note: this command is for Mac and Linux users only.** It does not work directly for Windows users.
> If you use Windows, you can search for the Shell command on [http://man.he.net/](http://man.he.net/), and view the associated manual page.
>

> ### Exercise 3: Find out about advanced `ls` commands
>
> Using the manual page, find out how to list the files in a
> directory ordered by their file size. Try this out in different directories. Can you combine it
> with the `-l` *flag* you learned before?
>
> After you've done that, figure out how you can order a list of files based on their last modification date.
> Try ordering files in different directories.

#### [Exercise 3 Solution](https://amyehodge.github.io/Hands_on_Shell/answers.html#exercise-3-answer)


## Working with files and folders

As well as navigating directories, we can interact with files on the command line:
we can read them, open them, run them, and even edit them. In fact, there's really
no limit to what we *can* do in the shell, but even experienced shell users still switch to
graphical user interfaces (GUIs) for many tasks, such as editing formatted text
documents (Word or OpenOffice), browsing the web, editing images, etc. But if we
wanted to make the same crop on hundreds of images, then we could automate the cropping using shell commands.

We will try a few basic ways to interact with files. Let's first move into the
shell-lesson directory on your desktop (if you don't have this directory,
please use a red sticky note to attract help).

~~~
$ cd
$ cd Desktop/shell-lesson
$ pwd
~~~
Output:
~~~
/Users/amyhodge/Desktop/shell-lesson
~~~

Here, we will create a new directory and move into it:

~~~
$ mkdir firstdir
$ cd firstdir
~~~

Here we used the `mkdir` command (meaning 'make directories') to create a directory
named 'firstdir'. Then we moved into that directory using the `cd` command.

But wait! There's a trick to make things a bit quicker. Let's go up one directory.

~~~
$ cd ..
~~~

Instead of typing `cd firstdir`, let's try to type `cd f` and then hit the Tab key.
We notice that the shell completes the line to `cd firstdir/`.

> #### Tip: Tab for Auto-complete
> Hitting tab at any time within the shell will prompt it to attempt to auto-complete
> the line based on the files or sub-directories in the current directory.
> Where two or more files have the same characters, the auto-complete will only fill up to the first point of difference, after which we can add more characters, and
> try using tab again. We would encourage using this method throughout
> today to see how it behaves (as it saves loads of time and effort!).

### Reading files

If you are in `firstdir`, use `cd ..` to get back to the shell-lesson directory.

Here there are copies of two public domain books downloaded from
[Project Gutenberg](https://www.gutenberg.org/) along with other files we will
cover later.

~~~
$ ls -lh
~~~
Output:
~~~
total 139M
-rw-r--r-- 1 amyhodge staff 3.6M Jan 31 18:47 2014-01-31_JA-africa.tsv
-rw-r--r-- 1 amyhodge staff 7.4M Jan 31 18:47 2014-01-31_JA-america.tsv
-rw-rw-r-- 1 amyhodge staff 126M Jun 10  2015 2014-01_JA.tsv
-rw-r--r-- 1 amyhodge staff 1.4M Jan 31 18:47 2014-02-02_JA-britain.tsv
-rw-r--r-- 1 amyhodge staff 583K Feb  1 22:53 33504-0.txt
-rw-r--r-- 1 amyhodge staff 598K Jan 31 18:47 829-0.txt
~~~

The files 829-0.txt and 33504-0.txt hold the content of book #829
and #33504 on Project Gutenberg. But we've forgot *which* books, so
we try the `cat` command to read the text of the first file:

~~~
$ cat 829-0.txt
~~~

The terminal window erupts and the whole book cascades by (it is printed to
your terminal). Great, but we can't really make any sense of that amount of text.

> #### Tip: Canceling Commands
> To cancel this print of 829-0.txt, or indeed any ongoing processes in the shell, hit `Ctrl+C`

Often we just want a quick glimpse of the first or the last part of a file to
get an idea about what the file is about. To let us do that, the shell
provides us with the commands `head` and `tail`.

~~~
$ head 829-0.txt
~~~
Output:
~~~
The Project Gutenberg eBook, Gulliver's Travels, by Jonathan Swift


This eBook is for the use of anyone anywhere at no cost and with
almost no restrictions whatsoever.  You may copy it, give it away or
re-use it under the terms of the Project Gutenberg License included
with this eBook or online at www.gutenberg.org
~~~

This provides a view of the first ten lines,
whereas `tail 829-0.txt` provides a perspective on the last ten lines:

~~~
$ tail 829-0.txt
~~~
Output:
~~~
Most people start at our Web site which has the main PG search facility:

    http://www.gutenberg.org

This Web site includes information about Project Gutenberg-tm,
including how to make donations to the Project Gutenberg Literary
Archive Foundation, how to help produce our new eBooks, and how to
subscribe to our email newsletter to hear about new eBooks.
~~~

If ten lines is not enough (or too much), we would check `man head`
to see if there exists an option to specify the number of lines to get
(there is: `head -n 20` will print 20 lines).

Another way to navigate files is to view the contents one screen at a time.
Type `less 829-0.txt` to see the first screen, spacebar to see the
next screen and so on, then `q` to quit (return to the command prompt).

~~~
$ less 829-0.txt
~~~

Like many other shell commands, the commands `cat`, `head`, `tail` and `less`
can take any number of arguments (they can work with any number of files).
We will see how we can get the first lines of several files at once.
To save some typing, we introduce a very useful trick first.

> #### Tip: Re-using commands
> On a blank command prompt, hit the up arrow key and notice that the previous
> command you typed appears before your cursor. We can continue pressing the
> up arrow to cycle through your previous commands. The down arrow cycles back
> toward your most recent command. This is another important labour-saving
> function and something we'll use a lot.

Hit the up arrow until you get to the `head 829-0.txt` command. Add a space
and then `33504-0.txt` (Remember your friend Tab? Type `3` followed by Tab to
get `33504-0.txt`), to produce the following command:

~~~
$ head 829-0.txt 33504-0.txt
~~~
Output:
~~~
==> 829-0.txt <==
The Project Gutenberg eBook, Gulliver's Travels, by Jonathan Swift

This eBook is for the use of anyone anywhere at no cost and with
almost no restrictions whatsoever.  You may copy it, give it away or
re-use it under the terms of the Project Gutenberg License included
with this eBook or online at www.gutenberg.org

==> 33504-0.txt <==
The Project Gutenberg EBook of Opticks, by Isaac Newton

This eBook is for the use of anyone anywhere at no cost and with
almost no restrictions whatsoever.  You may copy it, give it away or
re-use it under the terms of the Project Gutenberg License included
with this eBook or online at www.gutenberg.org

Title: Opticks
       or, a Treatise of the Reflections, Refractions, Inflections,
~~~

All good so far, but if we had *lots* of books, it would be tedious to enter
all the filenames. Luckily the shell supports wildcards! The `?` (matches exactly
one character) and `*` (matches zero or more characters) are probably familiar
from library search systems. We can use the `*` wildcard to write the above `head`
command in a more compact way:

~~~
$ head *.txt
~~~

> #### Tip: More on wildcards
> Wildcards are a feature of the shell and will therefore work with *any* command.
> The shell will expand wildcards to a list of files and/or directories before
> the command is executed, and the command will never see the wildcards.
> As an exception, if a wildcard expression does not match any file, Bash
> will pass the expression as a parameter to the command as it is. For example
> typing `ls *.pdf` results in an error message that there is no file called "\*.pdf"

### Moving, copying and deleting files

We may also want to change the file name to something more descriptive.
We can **move** it to a new name by using the `mv` or move command,
giving it the old name as the first argument and the new name as the second
argument:

~~~
$ mv 829-0.txt gulliver.txt
~~~

This is equivalent to the 'rename file' function.

Afterwards, when we perform a `ls` command, we will see that it is now `gulliver.txt`:

~~~
$ ls
~~~
Output:
~~~
2014-01-31_JA-africa.tsv   2014-02-02_JA-britain.tsv  gulliver.txt
2014-01-31_JA-america.tsv  33504-0.txt
2014-01_JA.tsv
~~~

> ## Exercise 4: Copying a file
>
> Instead of *moving* a file, you might want to *copy* a file (make a duplicate),
> for instance to make a backup before modifying a file using some script you're
> not quite sure how it works.
> Just like the `mv` command, the `cp` command takes two arguments: the old name
> and the new name. How would you make a copy of the file `gulliver.txt` called
> `gulliver-backup.txt`? Try it!

#### [Exercise 4 Solution](https://amyehodge.github.io/Hands_on_Shell/answers.html#exercise-4-answer)

> ## Exercise 5: Renaming a directory
>
> Renaming a directory works in the same way as renaming a file. Try using the
> `mv` command to rename the `firstdir` directory to `backup`.

#### [Exercise 5 Solution](https://amyehodge.github.io/Hands_on_Shell/answers.html#exercise-5-answer)

> ## Exercise 6: Moving a file into a directory
>
> If the last argument you give to the `mv` command is a directory, not a file,
> the file given in the first argument will be moved to that directory. Try
> using the `mv` command to move the file `gulliver-backup.txt` into the
> `backup` folder.

#### [Exercise 6 Solution](https://amyehodge.github.io/Hands_on_Shell/answers.html#exercise-6-answer)

> ## Exercise 7: Using `history`
> Use the `history` command to see a list of all the commands
> you've entered during the current session. You can also use `Ctrl + r` to do
> a reverse lookup. Hit `Ctrl + r`, then start typing any part of the command you're
> looking for. The past command will autocomplete. Hit `enter` to run the command again,
> or press the arrow keys to start editing the command. If you can't find what you're
> looking for in the reverse lookup, use `Ctrl + c` to return to the prompt.

> ## Exercise 8: Using the `echo` command
> The `echo` command simply prints out a text you specify. Try it out: `echo "Fear the Tree"`.
> Interesting, isn't it?
>
> You can also specify a variable, for instance `NAME=` followed by the name of some other university.
> Then type `echo "$NAME fears the Tree"`. What happens?
>
> You can combine both text and normal shell commands using `echo`, for example the
> `pwd` command you have learned earlier today. You do this by enclosing a shell
> command in `$(` and `)`, for instance `$(pwd)`. Now, try out the following:
> `echo "Finally, it is nice and sunny on" $(date)`.
> Note that the output of the `date` command is printed together with the text
> you specified. You can try the same with some of the other commands you have learned so far.
>
> **Why do you think the echo command is actually quite important in the shell environment?**

#### [Exercise 8 Solution](https://amyehodge.github.io/Hands_on_Shell/answers.html#exercise-8-answer)

Finally, on to deleting. We won't use it now, but if you do want to delete a file,
for whatever reason, the command is `rm`, or remove.

Using wildcards, we can even delete lots of files. And adding the `-r` flag we
can delete folders with all their content.

**Unlike deleting from within our graphical user interface, there is *no* warning,
*no* recycling bin from which you can get the files back and no other undo options!**
For that reason, please be very careful with `rm` and extremely careful with `rm -r`.

[Proceed to Part 2 >>](https://amyehodge.github.io/Hands_on_Shell/shell_part2)  
