# Modify this code to update the DB schema diagram.
# To reset the sample schema, replace everything with
# two dots ('..' - without quotes).

Game as game
-
GameID PK int
GameName string
ReleaseDate string
Platform string FK -< platform.Platform
Genre string 

Platform as platform
---
GameID int PK FK - Game.GameID
Platform string FK 


Sales
---
GameID int PK FK - Game.GameID
Sales_units int

Ratings
-
GameID int PK FK - Game.GameID
Metacritic Int
Rating float

ESRB_Rating
----
GameID int PK FK - Game.GameID
ESRB_rating string
