# PTC_EV_news

Project that automates the extraction of news content on electrification from Canadian Private Transportation Networks (Uber and Lyft) websites

### Content

Content is retrieved from:

https://www.uber.com/ca/en/drive/services/electric/zero-emissions-incentive/

https://www.uber.com/ca/en/drive/services/electric/

https://www.uber.com/ca/en/drive/services/comfort-electric/

https://help.lyft.com/hc/en-ca/all/articles/3014412085

https://help.lyft.com/hc/en-ca/all/articles/2803727495

https://help.lyft.com/hc/en-ca/all/articles/360001943867

> *This project does not claim ownership of the original content.\
> All rights belong to the original publisher*

### What it does

-   Scrapes news headlines or summaries
-   Detects changes by comparing hash values
-   Publishes updated content as GitHub Releases

## Folder Structure

-   `R/`: Contains all R scripts for scraping and processing.
-   `data/`: Stores hash codes used to detect changes.
-   `data-raw/`: Contains raw HTML content from scrapes.
-   `.github/workflows/`: Automation via GitHub Actions.
