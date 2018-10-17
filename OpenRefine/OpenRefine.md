# Hands-on Intro to Data Cleaning with OpenRefine
This workshop will teach the basics of working using OpenRefine for cleaning up messy data. This workshop is based on content from the book *Using OpenRefine*, listed in the resources at the bottom of this page. We will be supplying you with computers that already have the software installed and a smaller version of the original dataset files on the desktop. Instructions for installing the software on your own machine are included below. The original dataset files are available via the eBook through Stanford Libraries. See the [Resources](#resources) section for links.

## Contents

1. [Introduction](#intro)  
2. [Installing the software](#install)  
3. [Getting started](#start)  
    a. [Creating a new project](#new_project)  
    b. [Tour of your dataset](#tour)  
4. [Working with columns](#columns)  
	a. [Collapsing & expanding columns](#size)  
	b. [Modifying individual columns](#move)  
	c. [Bulk operations on columns](#bulk)  
5. [Project Management](#manage)  
	a. [Project history](#history)  
	b. [Exporting your project](#export)  
6. [Analyzing and fixing data](#analyze)  
	a. [Sorting data](#sort)    
	b. [Faceting data](#facet)  
	c. [Simple cell transformations](#transform)    
	d. [Removing rows](#remove)  
7. [Advanced data operations](#advanced)  
    a. [Handling multi-valued cells](#multi)  
    b. [Clustering](#cluster)  
    c. [Splitting data into multiple cells](#split)  
8. [Resources](#resources)  

## <a name="intro"></a> Introduction   
It's extremely difficult to keep all errors out of your datasets. It's even harder if multiple people have contributed to the compilation of that dataset. In addition, some software is picky about the precise format of data, the presence of spaces, etc.  

![OpenRefine Logo](http://amyehodge.github.io/OpenRefine/images/OpenRefineLogo.png "OpenRefine Logo")

OpenRefine is an Interactive Data Transformation tool (IDT) that allows you to easily perform data assessment and cleaning without having to write customized scripts to perform all of these tasks. OpenRefine offers many useful features, including:  

* all steps of your data processing are captured and can be shared with publishers and funders to more fully document your research
* all steps are easily reversed
* all work is saved to a new file -- your original dataset is never altered
* data cleaning is much easier and more efficient
* complex concepts like clustering algorithms are simplified and made easier to use
* data cleaning tasks are easy to repeat on multiple files

In this workshop we will review some of the features of OpenRefine.

The dataset used for this workshop comes from Powerhouse Museum in Sydney and is provided along with the *Using OpenRefine* book. See the [Resources](#resources) section for details on accessing the book through Stanford Libraries.

## <a name="install"></a> Installing the software  

OpenRefine is a stand-alone piece of software that you must download to your local machine in order to use. [Download](http://openrefine.org/download.html) the Mac, Windows, or Linux version of OpenRefine as appropriate for your operating system. Instructions are available at the linked URL above for each of the platforms.

For this workshop we will be using OpenRefine 2.6-rc2 Release Candidate 2. If you install one of the other versions, behaviors indicated below may not be identical. The version labeled Google Refine 2.5 is much slower at performing tasks and is not recommended.

Once installed, OpenRefine will open in a window in your default browser, even though you do not need a connection to the internet to use the software.

## <a name="start"></a> Getting started    

When you open the software you'll see a panel on the left with three options:

![OpenRefine start-up page](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR01.png "OpenRefine start-up page")  

* `Create project`: Use this option to load a dataset into OpenRefine for the first time. You can import data from a file in a variety of formats or from other sources, including URLs.  
* `Open project`: Use this option to open a project that you created and saved previously. If you click on this object you will see a list of available projects to choose from.  
* `Import project`: Use this option to import an existing OpenRefine project archive that someone else previously exported, including the complete history (discussed below).    

### <a name="new_project"></a> Creating a new project  

We're going to start by importing a dataset as a new project.

First, download the dataset file from [https://stanford.box.com/OpenRefineDataset](#https://stanford.box.com/OpenRefineDataset). I'll give you the password for accessing the file in class (or email me if you would like it).  

1.  Click on `Create project`.  
2.  Then click on `Choose files` and select the `phm-small.tsv` file from your computer.  
3.  Click `Next`.  

OpenRefine will then show you a preview of the dataset in the top half of the window:  

![OpenRefine dataset preview](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR02.png "OpenRefine dataset preview")

...and options for parsing the data on the bottom half of the window:  

![OpenRefine dataset parsing options](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR03b.png "OpenRefine dataset parsing options")

Note that for our dataset, quotation marks are used within cells to indicate object titles and inscriptions and not to enclose cells containing column separators (like commas or semicolons). Because of this, we will need to uncheck the check box on the right that indicates this (`Quotation marks are used to enclose cells containing column separators`).  

Once you've selected all the appropriate options for your file, click on `Create Project` at the top right of the window. It may take a short time for your dataset to complete the import process.  

### <a name="tour"></a> Tour of your dataset  

Once the dataset has finished importing you should see a screen that looks like this:  

![Imported dataset](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR04.png "Imported dataset")

Note that the first three columns -- labeled `All` -- do not contain data from the dataset. The first two columns allow you to star or flag records; these designations can also be used for faceting. The third column is an ID number for the row or record.

An important feature is the dropdown menu for each column that you can access via the down arrows next to each column header.

![Dropdown menu](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR05.png "Dropdown menu")

We will get intimately familiar with these menu options shortly.  

Before beginning any manipulations, it's a good idea to browse through the data to make sure that the data and column headers seem to have imported properly and that you have an understanding of the data contained within the dataset.

## <a name="columns"></a> Working with columns  

### <a name="size"></a> Collapsing & expanding columns  
The default display for OpenRefine is for all columns to be expanded and the content visible. However, you can manage this to your liking by choosing the dropdown menu for a column and choosing `View`, which gives you the following options:  

* `collapse this column`  
* `collapse all other columns`  
* `collapse columns to the left`  
* `collapse columns to the right`  

To expand a column again, just click on the header for that column.  

### <a name="move"></a> Modifying individual columns  

You might at times want to see two columns next to each other that are not next to each other in the original file. You can do this! Choose the dropdown menu for the column you would like to move and select `Edit column`. At the end of the new menu you will see the following options:  

* `Move column to beginning`  
* `Move column to end`  
* `Move column to left`  
* `Move column to right`  

You can also rename or remove columns using the following options under the same `Edit column` menu:

* `Rename this column`
* `Remove this column`


### <a name="bulk"></a> Bulk operations on columns  

If you want to perform operations on many or all the rows at one time, use the dropdown menu on on the `All` column, which gives you the following options:

* `View`: allows you to expand or collapse all columns
* `Edit columns`: allows you to re-order or remove multiple columns

Choose `Edit columns > Re-order / remove columns` to change the order in which the data columns are displayed. When you do this, you'll see the following pop-up window:

![Bulk reordering and deleting](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR06.png "Bulk reordering and deleting")

Drag column names up and down the panel on the left to reorder them, or drag them to the panel on the right to remove them.

## <a name="manage"></a> Project management  

### <a name="history"></a> Project history  

One very useful feature of OpenRefine is the project history. OpenRefine tracks every modification that affects the data since the project was started.  

To access the history, click on the `Undo/Redo` tab at the top of the panel on the left side of your screen:

![Project history](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR07b.jpg "Project history")

You should see listed all the transformations you have done on your data so far. Note that activities that only change your view of things -- like collapsing columns or changing the number of rows on a page -- are not recorded in the history. This means you may have to reset these options when you close a project and re-open it.

If you decide that you would like to undo your data transformations so that only the first step (in this case, renaming the registration number column) has been done, all you have to do is click on that step and all subsequent transformations will be undone.

![Reverting](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR08.png "Reverting")

You can go back and redo any of these "undone" transformations later as well by clicking on the appropriate greyed out step, **as long as you have not done any further new transformations of your data in the meantime.** OpenRefine can not store conflicting histories, so it opts to choose the most recent "branch" of your transformations. Once you undo steps and then create new steps, the previously undone steps are removed from the history.

It is also possible to extract the history in a JSON format using the `Extract` button and to apply an extracted history directly to a new dataset using the `Apply` button.

### <a name="export"></a> Exporting your project  

OpenRefine works on a copy of your data in memory -- NOT the original file. This means that you have a safe copy of your original data intact. It also means that once you are done transforming your data in OpenRefine, you'll need to export your project in order to be able to use the data. Click on the `Export` button on the top right of the window (between `Open...` and `Help`).

![Exporting](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR09.png "Exporting")

Many of the options here are likely to be the same as the original format(s) of the data you may have imported at the start of your project.

## <a name="analyze"></a> Analyzing and fixing data  

### <a name="sort"></a> Sorting data  

One thing you'll almost certainly want to do with your data at some point is to sort it. You can sort on any column by choosing the dropdown for the column you would like to sort and selecting `Sort...`.

![Sort menu](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR10.png "Sort menu")

There are several options for how to sort:  

* `As text`: with options for sorting case insensitive (default) or case sensitive, and options for sorting a-to-z or z-to-a    
* `As numbers`: with options for sorting smallest-to-largest or largest-to-smallest  
* `As dates`: with options for sorting earliest-to-latest dates or latest-to-earliest dates  
* `As boolean` (true/false): with options for sorting false-then-true or true-then false  

For all types of sorting you can also choose where in the list you would like valid values, blanks, and errors to be listed. Do this by dragging and dropping the three types of values to reorder them in the list.  

>**Task 1:** Sort the dataset by Record ID as numbers, with the smallest numbers first.
>
>How do the results of the sorting differ if you do the same thing but sort as text instead?
>    
>Is sorting stored in the history?    


### <a name="facet"></a> Faceting data  

Faceting allows you to see all the unique entries for a particular field and how many occurrences of each entry exist in your dataset. Faceting is a great way for you to get a quick overview of one feature of your dataset. Faceting only works well if the particular field on which you are faceting has a defined set of entries; if each cell has a unique entry, then faceting will not provide you with much more information than just browsing through the data.

#### <a name="text"></a> Text faceting  

In the Powerhouse Museum dataset we are using, the best field for faceting is the **Categories** field, because it contains terms from a controlled vocabulary.

To facet on the **Categories** field (or any field), choose the dropdown menu for that column and select `Facet > Text facet`.

![Text facet menu](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR11.png "Text facet menu")

Results for the faceting will appear in the panel on the left side of the screen under the `Facet/Filter` tab. In this case, even though this column uses a controlled vocabulary, there are still too many choices to see.   

![Too many facet choices](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR12.png "Too many facet choices")

Select `Facet by choice counts` in the bottom of the window, so that you can restrict the facet to a subset that you can view. Choose the most popular ones by dragging the handle on the left to 1000 so that you are only viewing those terms assigned to at least 1000 items.  

![Facet by choice counts](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR13.png "Facet by choice counts")

To view the list in order of popularity, choose `Sort by count` from the menu at the top of the facet window. Note that some of these contain multiple terms separated by a `|` (pipe). These are called multi-valued cells. We will learn how to handle these better later.

![Sort text facet by counts](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR14.png "Sort text facet by counts")

#### <a name="numeric"></a> Numeric faceting   

Let's try numeric faceting on the **RecordID** field. From the dropdown menu in the **RecordID** column, select `Facet > Numeric facet`. Initially, the facet tells us that there are no numeric values present. That's because the software has automatically set this column as text for some reason. To fix this, go to the dropdown menu for **RecordID** and choose `Edit cells > Common transforms > To number`. This will convert all the entries in this field to the numeric data type. We'll talk more about transforms later.

Once you've converted the **RecordIDs** to numbers, you should see a range of values in the `Facet/Filter` tab in the panel on the left, similar to what we saw when restricting values for the text faceting.

![Numeric facet](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR15b.png "Numeric facet")

Under the graph you will see that all the **RecordID**s have been classified as numeric, non-numeric, blank, or error. We would expect all of our **RecordID**s to be numeric, but one of them has been classified as blank. Let's have a look at that one to see what's going on with it.

Deselect the `Numeric` checkbox so that only the one item classified as `Blank' is displayed in the table on the right. The entire record appears to be blank, with the exception of an incomplete link and the standard license.

We don't need this record in our data set, so let's remove it. Go to the dropdown  menu for the **All** column and select `Edit rows > Remove all matching rows` to delete this row.

![Remove row](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR38.png "Remove row")

Once you do this, you'll notice that the facets in the panel on the left are updated.

#### <a name="star"></a> Star and flag faceting  

Another useful feature is the ability to facet by starred or flagged items, which can be designated in the `All` column. Stars and flags can be used for any purpose you wish, such as marking items of interest or indicating problematic rows.  

Let's say you are interested in identifying all the rows that have information about diameter or weight. If you select the **Diameter** column and choose `Facet > Customized facets > Facet by blank` and then select `false` (selecting all rows that have information on diameter), and then do the same for **Weight**, you will end up with those rows that contain information for both **Diameter** and **Weight**. These are only a subset of what you are interested in and is equivalent to doing an AND search on these two parameters. You want the OR version of this search, which would also include some rows that have only weight or only diameter information, as well as the rows that contain both.  

Your goal is easily achieved by using the star and flag facet option. Perform the first step the same as previously: `Edit cells > Customized facets > Facet by blank` for the **Diameter** column and choose `false`.

![Diameter facet](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR18.png "Diameter facet")

Then star these rows by selecting `All > Edit rows > Star rows`.

![Diameter star](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR19.png "Diameter star")

Clear the facet (click on the `x`) and then do the same faceting for the **Weight** column. Again, star all the results rows. Note that some of the rows are already starred because they also contain diameter information and so were starred in the first step.

![Weight star](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR20.png "Weight star")

Clear the facet again and then choose `All > Facet > Facet by star`. Now you have a list of those rows containing either diameter or weight information or both.

![Diameter-weight](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR21.png "Diameter-weight")

#### <a name="custom"></a> Custom faceting  

It is also possible to define your own custom faceting parameters using the `Facet > Customized facets` option from the dropdown menu of any column.

![Custom facet](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR22.png "Custom facet")

For many custom faceting options you will need to understand how to use regular expressions and the General Refine Expression Language (GREL), which are beyond the scope of this lesson.

### <a name="transform"></a> Simple cell transformations  

So far we have mostly been changing our view of the data. With cell transformations, we are able to make changes to our data and "clean" it for further analysis.  

Choose the dropdown menu for any column and choose `Edit cells > Common transforms`. Here you will see a number of basic types of cell transformation. We will discuss some, but not all, of these options.

![Transform menu](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR23.png "Transform menu")

#### <a name="trim"></a> Trimming whitespace  

One error that frequently creeps into data is the existence of extra whitespace at the beginning or end of an entry. This may not seem too onerous, but it can cause problems with analyses down the road, so it's better to remove them. Removing whitespace can also decrease the size of your data file; the difference can be significant if you have 1000s of extra white spaces.

In order to use this feature, select the dropdown menu from any column and choose `Edits cells > Common transforms > Trim leading and trailing whitespace`.  

![Whitespace menu](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR24.png "Whitespace menu")

#### <a name="case"></a> Case transformations  

By using case transformations, we can convert text strings into all capital letters, all lowercase letters, or title case (where the first letter of each word is capitalized). To use one of these options, choose `Edit cells > Common transforms` and then either `To titlecase`, `To uppercase`, or `To lowercase`.  

![Case transform menu](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR25.png "Case transform menu")

Note that this only works on text fields. In addition, the titlecase conversion defines a word as "text preceded by a whitespace."   

>**Task 2:** Convert the **Categories** column to titlecase. Were the results as you expected? Why are some of the categories not capitalized?  

#### <a name="blank"></a> Blank out cells  

The `Blank out cells` transform will convert all cells to blank cells, removing any content. This is probably not something that you want to do to an entire column in your dataset, but it can be useful in certain situations. To do this, choose `Edit cells > Common transforms > Blank out cells` from the dropdown menu of any column.  

![Blank out cells](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR26.png "Blank out cells")

### <a name="remove"></a> Removing rows  

You may run across entire rows of data that need to be removed from your dataset before you can begin your data analysis. You need to first have a filter or a facet in place before removing rows, otherwise you will remove all the rows in your dataset (don't worry, you can to the Undo/Redo tab to change it back!). Once your filter or facet is in place, select `All > Edit rows > Remove all matching rows`.

![Remove rows](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR27.png "Remove rows")

>**Task 3:** Remove all rows that lack a **RecordID** from your dataset. Note, you may have already done this earlier in the numeric faceting section.

## <a name="advanced"></a> Advanced data operations  

### <a name="multi"></a> Handling multi-valued cells  

We saw earlier in the lesson that the **Categories** field is a multi-valued field -- some cells contain more than one value. These values are separated by a `|` (pipe).  

If we are interested in seeing all the different categories there are in this field and how many times each was used, faceting presents us with some problems. As we saw earlier in the lesson, text faceting produces too many results to display, partly because of all the different combinations in which the terms are found.   

To allow us to examine the individual categories, use the `Text facet` option from the **Categories** dropdown menu like we did earlier. Then from the **Categories** dropdown menu select `Edit cells > Split multi-valued cells`.

![Split multi-valued](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR28.png "Split multi-valued")

Be sure to indicate the correct separator, which in this case is `|`.   

![Pipe separator](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR29.png "Pipe separator")

The facet on the left now shows all the individual categories instead of the combinations. The default sorting for this is alphabetical, but we can change that to sort by count so that we can see which categories are the most prevalent.  

![Separated categories](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR30.png "Separated categories")  

Now that we no longer have multi-valued fields, we have that ability to edit or update a category name across all records where it is used. If you hover over the name of a category in the panel on the left, the `Edit` button will appear. Clicking that will let you edit the name of the category across all instances.

![Editing categories](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR31.png "Editing categories")  

Note that when you split multi-valued cells, you create extra rows in your dataset that contain only the split-out data values. Change your view between rows and records to see the effect that now has.

![Multi-valued category rows](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR32.png "Multi-valued category rows")  

Once you are done editing you can revert back to the multi-valued cells by choosing `Edit cells > Join multi-valued cells` from the dropdown menu in the **Categories** column.

>**Task 4:** Identify at least three categories that need editing and correct them.

### <a name="cluster"></a> Clustering

Clustering helps you to find items that are the same but have slightly different spellings. Once you've identified all the variations of a particular item, you can standardize them so that they are all the same, making your data cleaner and easier to manage.  

In a previous example we split the multi-valued cells in the **Categories** column. Once you've done that, you can choose `Edit cells > Cluster and edit...` from the **Categories** column drop-down menu. (Or just click the `Cluster` button at the top right of the facet box in the left panel.) There are a number of clustering methods and keying functions that can be selected. We'll stick with the default method of `key collision` and the default keying function of `fingerprint`.  

![Default clustering](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR33.png "Default clustering")

Once OpenRefine has performed the clustering, it will list the clusters in rows along with the number of rows in the cluster, the spelling and number of each variation found, and a suggestion for what the value for the entire cluster should be.  

Scroll through the suggestions and decide which ones should be merged and what the final value should be. If all of the suggestions look correct, you can click `Select All` at the bottom left and then `Merge & Re-Cluster` on the bottom right. Or if you only want to merge some of the suggestions, tick the `Merge?` box next to the appropriate lines before choosing `Merge & Re-Cluster`. If, after merging, OpenRefine identifies more new clusters, these will automatically be displayed in the box.   

If no new clusters are identified, you can choose other clustering algorithms to see what else you might want to merge.  

>**Task 5:** From the `Method` menu choose `nearest neighbor` and evaluate these new clusters. Assess the new suggestions and decide which ones you would merge and which you wouldn't, and why not.  

Once you have finished evaluating all the clusters, check back on your category facets to see that the inconsistencies in the data have disappeared and that you now have a much cleaner list. It is difficult to predict which clustering algorithm will work best on your data, so you should try several to make sure you've found all the clusters that belong together.  

![Categories after clustering](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR34.png "Categories after clustering")  

Once you are done clustering, close the facet and change the `Categories` column back to multi-valued cells (see [Handling multi-valued cells](#multi))  

### <a name="split"></a> Splitting data into multiple cells

When we had multiple values in our **Categories** column, we split these into separate values across multiple rows. This might not always be what you want to do, particularly if the values are different types of information.

For example, the **Provenance (Production)** column contains information about designers, makers, and other things. It might be better if we could split this information into separate columns so that we can analyze it separately.

![Provenance (Production)](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR35.png "Provenance (Production)")

To do this, go to the dropdown menu for the **Provenance (Production)** column and choose `Edit column > Split into several columns...`. You can then choose what the separator to use for splitting the content (we will use a pipe) or whether to use fixed lengths. Fixed lengths can be useful if the content does not contain any separators. However, to use fixed lengths, each part of the content must be the same length, like multiple dates in a row. You can also choose to allow OpenRefine to guess what the cell types should be once they are split, and whether or not to retain the original row once the cells have been split or to remove it.

![Splitting options](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR36.png "Splitting options")

When you do this for the **Provenance (Production)** column you will see that multiple columns are created.

![Split data](https://amyehodge.github.io/amyehodge.github.io/OpenRefine/images/OR37.png "Split data")

These columns are titled **Provenance (Production) 1**, **Provenance (Production) 2**, etc. You can rename these columns if you wish. OpenRefine will create the number of columns needed to split up all the content, unless you supply a maximum number. Not all cells will contain a value.

## <a name="resources"></a> Resources
* [*Using OpenRefine*](http://searchworks.stanford.edu/view/10631707) via ebrary    
* [*Using OpenRefine*](http://searchworks.stanford.edu/view/10471426) via Safari Books Online
* [Introductory videos from OpenRefine](http://openrefine.org/)   
* [Complete Documentation at OpenRefine](https://github.com/OpenRefine/OpenRefine/wiki)
* [How clustering algorithms work](https://github.com/OpenRefine/OpenRefine/wiki/Clustering-In-Depth)
* OpenRefine has [curated a list of tutorials](https://github.com/OpenRefine/OpenRefine/wiki/External-Resources) developed outside of the OpenRefine wiki, including some in Spanish, French, German, and Japanese.  
* [Open Refine Google Plus community](https://plus.google.com/communities/117280693504889048168)
