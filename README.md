

# A brief description of your final database
Video Games Genre, Sales, Metacritics and ESRB Ratings Database

# Why our final database will be useful to a hypothetical organization?
1) Ad companies can use the age information, rating, genre to make targeted ads placement decision<br>
2) Predictions - use historical data on games to predict games that will be popular

# Data sources
1) Videogame sales by Units sold (#https://www.kaggle.com/sidtwr/videogames-sales-dataset?select=Video_Games_Sales_as_at_22_Dec_2016.csv) (CSV) <br>
2) RAWG (API/JSON) 

# ETL Step Starts with the three files 
1) Import the csv file through Jupyter Notebook
2) Perform API call to RAWG API to get a list of games, save JSON file, drop irrelevant columns
3) Combine the two files into a dataframe based on game names with INNER JOIN
4) Turn the dataframe into a database
5) Create Tables from the database

