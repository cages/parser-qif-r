
NAME
----
parseqif - basic QIF parser in R

SYNOPSIS
--------

`parseqif -f` *.qif

DESCRIPTION
-----------
Caution: This is very beta software!

'parseqif` currently reads in a basic qif formatted file.  It parses the
account type.  Then it parses each of the records and adds them to a `df`
dataframe.  Finally it displays the summary stats for the amounts column.

Parsed data example is included in qif_data_with_headers.csv

OPTIONS
-------

`-f` [qif file to parse]

COMPILE AND RUN
---------------

`cd parse-qif-r/src`  
`make clean`
`make`  
`./parse-qif-r -f example-02.qif`  

`r`
`r>new_df <- load("qif_data_with_headers.csv")

BUGS
----

- Functionality is very basic.


AUTHOR
------

dCage 

COPYRIGHT
------

Copyright (c) 2019 dCage
