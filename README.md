![image](https://user-images.githubusercontent.com/78628287/123713598-c20cec00-d842-11eb-8bc9-f5f12641ce5b.png)

## Table of Contents ##
* [Project Proposal](#project-proposal)
* [Data Source](#data-sources)
* [Technologies](#technologies)
* [ETL Step](#etl-step)

## Project Proposal 
# A brief description of your final database
Video Games Genre, Sales, Metacritics and ESRB Ratings Database

# Why our final database will be useful to a hypothetical organization?
1) Ad companies can use the age information, rating and genre to place targeted ads for example during online games with Call of Duty as an example.<br>
2) Predictions - use historical data on games to predict games that will be popular

## Data sources
1) Videogame sales by Units sold(CSV) [Source: Kaggle - Video Games Sales Dataset by SID_TWR](https://www.kaggle.com/sidtwr/videogames-sales-dataset?select=Video_Games_Sales_as_at_22_Dec_2016.csv)  <br>
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
High-level
1) Import the csv file through Jupyter Notebook
2) Perform API call to RAWG API to get a list of games, save JSON file, drop irrelevant columns
3) Combine the two files into a dataframe based on game names with INNER JOIN
4) Turn the dataframe into a database
5) Create Tables from the database

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
  3.4 Confirm data has been added by querying tables<br>

