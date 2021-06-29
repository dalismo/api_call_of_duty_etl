![image](https://user-images.githubusercontent.com/78628287/123713598-c20cec00-d842-11eb-8bc9-f5f12641ce5b.png)

## Table of Contents ##
* [Project Proposal](#project-proposal)
* [Data Source](#data-sources)
* [Technologies](#technologies)
* [ETL Step](#etl-step)
* [Example Queries](#example-queries)

## Project Proposal 
# A brief description of your final database
Video Games Genre, Sales, Metacritics and ESRB Ratings Database

# Why our final database will be useful to a Videogame Publisher?
1) Based on the ESRB rating and the genre of the videogame ad companies can place targeted advertisements in online multiplayer games such as Call of Duty to attract new customers. As a point of reference the ESRB(Entertainment Software Rating Board) is a self-regulatory organization that assigns age and content ratings to consumer video games in North America.
2) Predictions - use historical data on games to predict games that will be popular. If a videogame receive multiple positive critical reviews in metacritic it usually leads to significant unit sales.

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
* Libraries
  - json
  - requests 
  - pprint import pprint
  - time

## ETL Step 

### Extract
1) Import the Video Sales by Units Sold csv file from Kaggle.com through Jupyter Notebook.
2) Perform API call to RAWG API to get the following fields:
  a) game_id
  b) game_name
  c) release_date
  d) ratings
  e) metacritic
  f) esrb 
3) Create dataframe from the RAWG API 

### Transform
#### Exploratory Data Analysis
1) Sort data 
Combine the two files into a dataframe based on game names with INNER JOIN
3) Turn the dataframe into a database
7) Create Tables from the database
8) 


Detailed 
## 1.0 Extract <br>
 1.1 Extract via API call from RAWG Database <br>
 1.2 Perform API call on RAWG database <br>
 1.3 Create dictionary from json results/lists <br>
 1.4 Create dataframe from dictionary <br>
 1.5 Import Video Games Sales CSV file <br>
## 2.0 Transform <br>
 2.1 Exploratory Data Analysis <br>
  2.1.1 Sort the RAWG Videogame and Videogame Sales dataframes to check the years and games included <br>
  2.2 Data Cleaning<br>
   2.2.1 Retain only columns needed from the Video Games Sales dataframe<br>
   2.2.2 Rename columns in the videogames sales dataframe to lower case<br>
   2.2.3 Rename columns in the RAWG API games dataframe to lower case<br>
   2.2.4 Replace the NaN values in Metracritic to Not Rated<br>
   2.2.5 Save RAWG API cleaned dataframes as csv/ json files<br>
   2.2.6 Merge the two dataframes<br>
   2.2.7 Locate the Game with the same Platform being shown twice<br>
   2.2.8 Combine the sales unit for Game ID 4273 Platform PS3 by summing the two rows<br>
   2.2.9 Drop the extra row<br>
   2.2.10 Check each Game name has a Game ID<br>
   2.2.11 Save merged df to CSV<br>
  2.3 Get data into separate dataframes to match tables<br>
## 3.0 Load<br>
  3.1 Connect to local database <br>
  3.2 Check for tables<br>
  3.3 Export data from dataframes to tables<br>
  3.4 Confirm data has been added by querying tables<br

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
