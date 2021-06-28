# Modify this code to update the DB schema diagram.
# To reset the sample schema, replace everything with
# two dots ('..' - without quotes).


Game as game
-
Game_ID PK int
Game_Name VARCHAR
Release_Date date
Genre VARCHAR 

Platform as platform
-
platform_id pk VARCHAR


Ratings
-
Game_ID int PK FK - Game.Game_ID
Metacritic VARCHAR
Rating VARCHAR

ESRB_Rating
----
Game_ID int PK FK - Game.Game_ID
ESRB_rating VARCHAR

Sales_Platform
-
platform_id VARCHAR PK FK >- platform.platform_id
Game_ID int PK FK >- game.Game_ID
Sales_Units_in_millions DEC
