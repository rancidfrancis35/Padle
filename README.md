# PadleR
**Package for summarising GEO query & output to summary data frame**

Dependencies: stringr, officer, tidyverse, GEOquery, openxlsx, janitor

How to use:
```
#store GSE accession numbers from GEO search
accession_numbers <- parseGSE_txt("../test_search.txt")

#Gathers information and outptus as GSE "Objects" in global environment
process_GEO_data(accession_numbers)

#store as data.frame for output into excel file
df <- gse_as_df()
```

**Note: Ensure global variable only contains vector of GSE accession numbers before moving on with process_GEO_data(xxxxxxx)
