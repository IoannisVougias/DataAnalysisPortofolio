# About the Project

This is a Data Analysis project to demonstrate my skills in Python programming language. This project includes five (5) .csv files, two (2) .dta files containg the datasets i used and one (1) .ipynb file containing the final code.

This analysis contains several visual replications of figures in Python based on the the following papers.

Chetty, R., Jackson, M.O., Kuchler, T. et al. Social capital I: measurement and associations with economic mobility. Nature 608, 108–121 (2022). https://doi.org/10.1038/s41586-022-04996-4.

Chetty, R., Jackson, M.O., Kuchler, T. et al. Social capital II: determinants of economic connectedness. Nature 608, 122–134 (2022). https://doi.org/10.1038/s41586-022-04997-3.

The .ipynb contains full detailed information on the datasets, the procedure and the analysis done.

The topic of the analysis is Social Capital, Economic Connectedness, Friending Bias and Upward Mobility in the U.S.A.

The share of high-SES friends among individuals with low SES — which we term economic connectedness — is among the strongest predictors of upward income mobility identified to date.

## About the Dataset

#### Below is the list of all the unique files used in this notebook:
For the **first** plot
* 'social_capital_county.csv'
* 'https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json'

For the **second** plot
* 'county_outcomes_simple.csv'

For the **third** plot
* 'zip_covariates.csv', converted file from original 'zip_covariates.dta'
* 'social_capital_zip.csv'

For the **fourth** plot
* 'social_capital_high_school.csv'

For the **fifth** plot
* 'college_characteristics.csv', converted file from original 'college_characteristics.dta'
* 'social_capital_college.csv'

In some plots files from previous ones were used.

## Tools Used

To conduct the analysis i used Jupyter Notebook and Python.

## Visualization

* First Plot

This is a replication of Figure 2a of the first paper, making it look like the interactive one we can find available online at https://www.socialcapital.org/.
It shows economic connectedness per county.

![alt text](https://github.com/IoannisVougias/DataAnalysisPortofolio/blob/main/Economic%20Connectedness/Graphs/ec_county.png)

* Second Plot

This is a replication on the Figure 4 of the first paper. The figure is a scatter plot of upward income mobility against economic connectedness (EC) for the 200 most populous US counties.

![alt text](https://github.com/IoannisVougias/DataAnalysisPortofolio/blob/main/Economic%20Connectedness/Graphs/household_income_ec.png)

* Third Plot

This is a replication of the Figure 6 of the first paper. The figure is a scatter plot of economic connectedness (EC) against median household income. The color of the dots corresponds to the child's income rank in adulthood given that the parents' income is in the 25th percentile. The colors correspond to five intervals, which are the quintiles dividing our data.

![alt text](https://github.com/IoannisVougias/DataAnalysisPortofolio/blob/main/Economic%20Connectedness/Graphs/upward_mobility_ec.png)

* Fourth Plot

This is a replication of Figure 5a of the second paper. The figure depicts the Socio-Economic Status (SES) of parents against the friending bias of students of low SES, with data from the Social Capital Atlas Datasets.

Both  𝑥  and  𝑦  axis are percentages and the  𝑦  axis are reversed.

![alt text](https://github.com/IoannisVougias/DataAnalysisPortofolio/blob/main/Economic%20Connectedness/Graphs/friending_bias_hs.png)

* Fifth Plot

This is a replication of Extended Data Figure 3 of the second paper. The figure depicts friending bias against racial diversity. Racial diversity is defined by the Herfindahl-Hirschman Index (HHI), borrowed from investing. Translated here, it is  1−∑𝑖𝑠𝑖2 , where  𝑠𝑖  is the fraction of race/ethnicity  𝑖  (Black, White, Asian, Hispanic, Native American).

As you can see, the figure contains two scatter plots with their respective regression lines, one for college data and the other for neighborhood data. Each of the two plots displays binned data (that's why you don't see loads of dots and diamonds). The bins are produced by dividing the  𝑥 -axis into ventiles (i.e., 5 percentile point bins); then we plot the mean of the  𝑦 -axis variable against the appropriate mean of the  𝑥 -axis variable in each ventile.

The mean of the  𝑥 -axis variable, the HHI index, is the weighted mean of HHI:

* For the college plot, the weights are given by the mean number of students per cohort.

* For the neighborhood plot, the weights are given by the number of children with below-national-median parental household income.

The  𝑦 -axis variable:

* For the college plot, it is the mean of the college friending bias.

* For the neighborhood plot, it is the mean of the neighborhood friending bias.

![alt text](https://github.com/IoannisVougias/DataAnalysisPortofolio/blob/main/Economic%20Connectedness/Graphs/hhi_friending_bias.png)

## Credits to 
<a href="https://github.com/louridas" target="_blank">Panos (Panagiotis) Louridas</a> , Associate Professor at the Athens University of Economics and Business for the initial idea and guidance he provided.


