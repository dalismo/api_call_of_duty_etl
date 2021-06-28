SELECT * FROM Game

--To retrieve ESRB Ratings for each game with ESRB rating mature

SELECT e.ESRB_rating, g.Game_ID, g.Game_Name
FROM ESRB_Rating as e
INNER JOIN Game as g
ON e.Game_ID = g.Game_ID
WHERE e.ESRB_rating = 'Mature'

--To retrieve the most popular games released in the year of 2016

SELECT Game_ID, Game_Name, 
FROM Game as g
INNER JOIN 