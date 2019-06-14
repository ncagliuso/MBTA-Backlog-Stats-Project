# MBTA-Backlog-Stats-Project

## Purpose

The purpose of this project is to produce data visualizations regarding two of the Buyers' backlogs, as well as for the backlog of the entire P&L Division's Buyers. This project is meant to test the hypothesis that any Buyer's backlog is primarily filled with requisitions that are relatively new (a week old or younger) and relatively old as well (more than one month old). In other words, we are trying to find out if a Buyer's backlog fills up because of pure volume and forgetfulness.

### Package Requirements

#### Software Packages

* `R 3.5.1`

#### R Packages

* `dplyr` for data manipulation 
* `lubridate` for date handling
* `tidyverse` for data tidying
* `openxlsx` for reading files from Excel
* `ggplot2` for data visualization 
* `ggExtra` extention for data visualization extras
* `ggthemes` extention for data visualization extras
* `egg` extention for data visualization extras

### Data Requirements

This project takes 1 excel file as input, pulled from silverback and emailed to onesself:

#### `BACKLOG-mmddyyyy-hhmmss.xlsx` 

This excel file should contain the following columns:

| Columns                      | Purpose/Use                               |
| ---------------------------- | ----------------------------------------- |
| Business_Unit                | Business Unit of that requisition         |
| Req_ID                       | Unique Identifier for each requisition    |
| Hold_From_Further_Processing | Not used                                  |
| Req_Date                     | Date of requisition's creation            |
| Origin                       | Not used                                  |
| Requester                    | Not used                                  |
| Approval_Date                | Date of requisition's approval            |
| Buyer                        | Buyer assigned to that specific req       |
| Last_Change_Date             | Timestamp of when the req was last touched|
| Buyer_Assignment             | Not used                                  |
| Hold_Req_Proces              | Not used                                  |
| Out-to-bid                   | Whether req has been requested to go OTB  |
| Req_Total                    | Dollar amount spent in each requisition   |

### Output file(s)

This project produces multiple data visualzation pieces and most can be considered a test run before deciding upon one to use/distribute.

1. Density plot for the buyer CFRANCIS
2. Density plot for the buyer JKIDD
3. Density plot for the entire set of Buyers
4. Histogram with density plot overlayed for the entire set of Buyers
5. Histogram with density plot overlayed for the buyer CFRANCIS
6. Histogram with density plot overlayed for the buyer JKIDD
7. Histogram for entire set of Buyers with corresponding box plot below

![Example: #7](https://github.com/ncagliuso/MBTA-Backlog-Stats-Project/blob/master/Total%20Buyers%20Double%20Plot.png)
![Example: #4]https://github.com/ncagliuso/MBTA-Backlog-Stats-Project/blob/master/Total%20Buyers%20Graph.png)
