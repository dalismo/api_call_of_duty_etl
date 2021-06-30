![image](https://user-images.githubusercontent.com/78628287/123713598-c20cec00-d842-11eb-8bc9-f5f12641ce5b.png)

## Table of Contents ##
* [Project Proposal](#project-proposal)
* [Data Source](#data-sources)
* [Technologies](#technologies)
* [ETL Step](#etl-step)
* [Steps to Recreate Database](#steps-to-recreate-database)
* [Example Queries](#example-queries)
* [Team Roles](#team-roles)

## Project Proposal 
# A brief description of your final database
Video Games Genre, Sales, Metacritics and ESRB Ratings Database for the 5 years period (1/1/2012 - 12/31/2016).

# Why our final database will be useful to a Videogame Publisher?
1) Based on the ESRB rating and the genre of the videogame ad companies can place targeted advertisements in online multiplayer games such as Call of Duty to attract new customers. As a point of reference the ESRB(Entertainment Software Rating Board) is a self-regulatory organization that assigns age and content ratings to consumer video games in North America.
2) Predictions - use historical data on games to predict games that will be popular. If a videogame receives multiple positive critical reviews in metacritic it usually leads to significantly higher unit sales.

## Data sources
1) Videogame Sales by Units sold(CSV) [Source: Kaggle - Video Games Sales Dataset by SID_TWR](https://www.kaggle.com/sidtwr/videogames-sales-dataset?select=Video_Games_Sales_as_at_22_Dec_2016.csv)  <br>
2) RAWG is a video game database and game discovery service. (API/JSON) <br>
 [RAWG API Documention](https://api.rawg.io/docs/)<br>
 [Get RAWG API Key](https://rawg.io/apidocs)<br>
 [Get list of game](https://api.rawg.io/docs/#tag/games)
 
## Technologies
* SQL Alchemy
* Postgres
* [Quick DBD](https://app.quickdatabasediagrams.com/#/)
* Pandas
* Jupyter Notebook
* Libraries
  - json
  - requests 
  - pprint import pprint
  - time
  
## Entity Relational Database (ERD) design 
![](https://github.com/dalismo/api_call_of_duty_etl/blob/ba8ab844d93b084f2b44e170c624e30bd9c9cdf3/QuickDBD-export.png)

## ETL Step 

### Extract
1) Import the Video Sales by Units Sold csv file from Kaggle.com through Jupyter Notebook to get the following fields:<br>
  a) game_name<br>
  b) genre<br>
  c) global_sales<br>
  d) platform<br>
  
2) Save video games data as dataframe.<br>

3) Perform API call on RAWG to get the following fields:<br>
  a) game_id <br>
  b) game_name<br>
  c) release_date<br>
  d) ratings<br>
  e) metacritic<br>
  f) esrb <br>
  
4) Create games ratings dataframe from the RAWG API <br>

### Transform <br>
1) Exploratory Data Analysis - Sort data for analysis <br>
2) Data Cleaning - drop duplicates, rename columns, merge video sales and games ratings dataframes<br>
3) Get data into separate dataframes to match tables in database<br>
  a) game table<br>
  b) rating table<br>
  c) platform table<br>
  d) esrb table<br>
  e) sales table<br>
  f) game platform table<br>
  
### Load<br>
1) Create tables in Postgres
In Jupyter Notebook
2) Connect to local database in jupyter notebook <br>
3) Check that tables exists in the games database <br>
4) Export data from dataframes to tables<br>

## Steps to recreate database
### Option 1 - ETL method <br>
1) [Get RAWG API Key](https://rawg.io/apidocs)<br>
2) Create config.py file with RAWG api_key, Postgres username and password<br>
  a) api_key = ""<br>
  b) password = ""<br>
  c) username = ""<br>
3) Create "game_db" database in Postgres<br>
4) [Create tables using the schema file](https://github.com/dalismo/api_call_of_duty_etl/blob/e98b6ff3eb5c62ec5f9d987eb152214e639d84b4/QuickDBD-schema_export.sql)<br>
5) [Run the python file](https://github.com/dalismo/api_call_of_duty_etl/blob/e98b6ff3eb5c62ec5f9d987eb152214e639d84b4/Extract_Transform_Load.ipynb)<br>

### Option 2 - Manual data import to Postgres<br>
1) As an alternative to running the [ETL python file](https://github.com/dalismo/api_call_of_duty_etl/blob/e98b6ff3eb5c62ec5f9d987eb152214e639d84b4/Extract_Transform_Load.ipynb) 
users can access the game ratings and sales data from the [Resource folder](https://github.com/dalismo/api_call_of_duty_etl/resources):<br>
[Video Game Sales from 1980 to 2016](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/clean_vg_sales.csv)<br>
[Video Game Ratings data from 2012 to 2016](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/rawg_vg_data.csv)<br>
[Video Game Sales and Rating data from 2012 to 2016 (CSV)](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/rawg_vg_data.csv)<br>
[Video Game Sales and Rating data from 2012 to 2016 (JSON)](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/rawg_vg_data.json)<br>

2) [Create tables using the schema file](https://github.com/dalismo/api_call_of_duty_etl/blob/e98b6ff3eb5c62ec5f9d987eb152214e639d84b4/QuickDBD-schema_export.sql)<br>
3) Import the data into the table:<br>
[game data](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/games.csv) <br> 
[platform data](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/platforms.csv)<br>
[ratings data](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/ratings.csv)<br> 
[esrb rating data](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/esrb.csv)<br>
[sales data](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/sales.csv)<br>
[games platform data](https://github.com/dalismo/api_call_of_duty_etl/blob/d38a60b3556f7d29eea3b37c7c6be0505058c1e3/Resources/game_platforms.csv)<br>
4) [Perform queries from Queries file](https://github.com/dalismo/api_call_of_duty_etl/blob/e98b6ff3eb5c62ec5f9d987eb152214e639d84b4/Queries.sql)<br>

## Example Queries                                                        
## Tables:
```sql
SELECT * FROM esrb_rating
SELECT * FROM game
SELECT * FROM sales_platform
SELECT * FROM ratings
SELECT * FROM platform
```                                                        
                                                        
### To retrieve ESRB Ratings for each game with ESRB rating Mature:
```sql
SELECT e.esrb_rating, g.game_ID, g.game_name
FROM esrb_rating as e
INNER JOIN game as g
ON e.game_ID = g.game_id
WHERE e.esrb_rating = 'Mature'
```                                                          

### To retrieve the most popular games released between 2012 to 2016:
```sql
SELECT g.game_id, g.game_name, r.rating, r.metacritic
FROM game as g
INNER JOIN ratings as r
ON g.game_id = r.game_id
ORDER BY r.rating DESC
```                                                             

### To retrieve the most sold games by units:
```sql
SELECT g.genre, g.game_id, g.game_name, ROUND(CAST(float8 (SUM(s.sales_units_in_millions)) AS numeric),2) AS "Total units sold (in millions)"
FROM sales_platform as s
INNER JOIN game as g
ON s.game_id = g.game_id
GROUP BY g.genre, g.game_id, g.game_name 
ORDER BY ("Total units sold (in millions)") DESC
```                                                           

### To retrieve unit sales by platform:
```sql                                                        
SELECT platform_id, ROUND(CAST(float8 (SUM(sales_units_in_millions)) AS numeric),2) AS "Total units sold (millions)" 
FROM sales_platform
GROUP BY platform_id
ORDER BY "Total units sold (millions)" DESC
```  
                                                        
### To retrieve 'Grand Theft Auto V' PS4 sales vs XOne sales:
```sql  
SELECT g.game_id, g.game_name, s.platform_id, s.sales_units_in_millions
FROM sales_platform as s
INNER JOIN game as g
ON s.game_id = g.game_id
WHERE (s.game_id = 3498)
AND (platform_id = 'PS4' OR platform_id = 'XOne')
```                                                         
#### Team Roles

| Team Member           | Role                          | Github username |        
| -----------           | -----------                   | -----------
| Adriana Icasiano      | Postgres Ruler                | adriana-icasiano |
| Paul Feliciano        | El Rey de SQL                 | pfeliciano1      |
| Alberto Gonzalez      | Data Cleaner                  | dalismo          |
