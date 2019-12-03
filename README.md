
NAME
----
parseqif - basic QIF parser in R

SYNOPSIS
--------

`parse_qif(qif_file)`

DESCRIPTION
-----------
Caution: This is beta software!

`parse_qif()` currently reads in a basic qif formatted file.  It parses the
account type.  Then it parses each of the records and adds them to a `df`
dataframe.  Finally it displays the summary stats for the amounts column
and returns the dataframe.

Parsed data example is included in extdata/qif_data_with_headers.csv

COMPILE, INSTALL AND RUN
------------------------

```bash
git clone https://github.com/dcslagel/parser-qif-r    
cd parse-qif-r    
    
r    
[r-prompt]>library(devtools)    
    
[r-prompt]>devtools::build()    
[r-prompt]>devtools::install()    
[r-prompt]>library(parser.qif.r)    
[r-prompt]>myfile = system.file("extdata", "example-01.qif", package="parser.qif.r")    
[r-prompt]>x = parse_qif(myfile)    
[r-prompt]>x
```

UNINSTALL
---------

```bash
cd parse-qif-r    

r    
[r-prompt]>library(devtools)    
[r-prompt]>devtools::uninstall()    
```

BUGS
----

- Functionality is very basic.   
- Report bugs at:    
  https://github.com/dcslagel/parser-qif-r/issues


COPYRIGHT
------

Copyright (c) 2019 DC Slagel
