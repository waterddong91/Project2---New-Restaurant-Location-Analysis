# Toronto New Restaurant Location Analysis

**Submitted By:** Dong Yi Kim | Saif Gorges | Saloni Gupta | Sooyeon Kim </br>
_Date_: December, 17th, 2020\
ETL Project- **Toronto New Restaurant Location Analysis** <br/>

![Toronto image](./Resources/toronto.jpg)

## Table of Contents
  * [Introduction](#introduction)
  * [Data Extraction](#data-extraction)
  * [Data Modeling](#data-modeling)
  * [Data Engineering](#data-engineering)
  * [Data Transformation](#data-transformation)
  * [Load](#load)
  * [Sample Analysis and Insights](#sample-analysis)
  * [Technologies](#technologies)

## <a name="introduction"></a>Introduction
Where to open a new restaurant? Choosing a new restaurant location is the most important, at the same time, the most difficult decision throughout the whole process. 
This project gives an insight at restaurant data in Toronto as well as ethnicity demographics, neighbourhood average income/crime. 
The goal of this new layer of analysis will be to help new restaurant owners decide as to where the best placement of a new restaurant could be. 
Our analysis will consider ethnicity, local competition, income and crime per neighborhood to help determine whether a restaurant could potentially be profitable or not for each neighborhood.

## <a name="data-extraction"></a>Data Extraction
In this project we extracted, transformed, and loaded these datasets: Toronto Neighbourhood, Income, Crime, Toronto Restaurants Data, Restaurants Ratings. 

* Datasets Sources:
  * Toronto Neighbourhood Data - Toronto City Open Data
  * Toronto Neighbourhood Income - Toronto City Open Data
  * Toronto Crime Data - Toronto City Open Data
  * Toronto Ethnicity Data - Toronto City Open Data Json API
  * Toronto Restaurant Data - Kaggle
  * Restaurant Ratings & number of reviews - Yelp API

## <a name="data-modeling"></a>Data Modeling </br>
ERD (Entity Relationship Diagram) of the tables was sketched out using a tool called 'Quick DBD.'</br></br>
![ERD](./ERD/ERD.png) </br>

## <a name="data-engineering"></a>Data Engineering </br>
* Created a table schema for each of the six CSV files using the information and specified data types, primary keys, foreign keys, and other constraints.
* Tables are to be created in the correct order to handle foreign keys.
* Loaded the final tables transformed in jupyter notebook into the corresponding SQL table.
* You can find the table schema sql file here: [table_schema](./ERD/Neighbourhoods-DB-Schema-Tables-Creation.sql)

## <a name="data-transformation"></a>Data Transformation
- The CSV files were transfomred by using Pandas in Jupyter Notebook
- Yelp API request for Restaurant rating and Toronto Data json API call for ethnicity data were made in Jupyter Notebook
- Datasets were transformed based on ERD of the tables by using Pandas:
    * Datasets were filtered to have only data needed
    * Unwated columns were removed
    * Some columns were renamed
    * Merged tables if required
    * Duplicated rows and NAN rows were removed when needed
    * Created new columns and assign neighbourhoods using Toronto geometry information and GeoPandas package.

## <a name="load"></a>Load
- The final tables were loaded into a PostgreSQL server by creating Database connection in Jupyter Notebook.</br>
- Import the module sqlalchemy and create an engine with the parameters user, password, and database name to connect and log in to the PostgreSQL database. </br>
![Connection image](./Resources/Images/loading_connection_query.png)

- Load Final Transformed data into the tables using the to_sql() function with the parameters table name, engine name, if_exists, and index. </br>
This approach accomplishes data loading in a more direct way, and allows us to add a whole dataframe to a PostgreSQL database all at once. </br>
![Load image](./Resources/Images/load_query.png)

- Checked if the tables are successfully populated with data in postgres - Neighbourhoods_DB using the SELECT command. It also shows the number of rows affected successfully.
![DB image](./Resources/Images/db_data.png)

The final tables are the following: 
- neighbourhood table
- income table
- crime table
- ethnicity table
- restaurant table
- neighbourhood_restaurant table
- yelp_ratings table

- Wrote queries to view the data after joining few tables
  - [Query-joining-Income Crime Ethnicity and number of Restaurants](./ERD/Query-joining-Income-Crime-Ethnicity_Restaurant_number.sql)
  - [Query-joining-Restaurants and Yelp Ratings](./ERD/restaurant_yelp_join_query.sql)

## <a name="sample-analysis"></a>Sample Analysis
![5stars_restaurants_categories](./sample_analysis/rating_5_category.png)


## Technologies
Project was created with:

* Python 3.8
* Jupyter Notebook
* Pandas
* Yelp API
* Toronto City Open Data API
* PostgreSQL
* QucikDBD
* GeoPandas
