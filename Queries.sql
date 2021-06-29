SELECT * FROM esrb_rating
SELECT * FROM game
SELECT * FROM sales_platform
SELECT * FROM ratings
SELECT * FROM platform

--To retrieve ESRB Ratings for each game with ESRB rating Mature
SELECT e.esrb_rating, g.game_ID, g.game_name
FROM esrb_rating as e
INNER JOIN game as g
ON e.game_ID = g.game_id
WHERE e.esrb_rating = 'Mature'

--To retrieve the most popular games released between 2012 to 2016
SELECT g.game_id, g.game_name, r.rating, r.metacritic
FROM game as g
INNER JOIN ratings as r
ON g.game_id = r.game_id
ORDER BY r.rating DESC

--To retrieve the most sold games by units
SELECT g.genre, g.game_id, g.game_name, ROUND(CAST(float8 (SUM(s.sales_units_in_millions)) AS numeric),2) AS "Total units sold (in millions)"
FROM sales_platform as s
INNER JOIN game as g
ON s.game_id = g.game_id
GROUP BY g.genre, g.game_id, g.game_name 
ORDER BY ("Total units sold (in millions)") DESC

--To retrieve unit sales by platform
SELECT platform_id, ROUND(CAST(float8 (SUM(sales_units_in_millions)) AS numeric),2) AS "Total units sold (millions)" 
FROM sales_platform
GROUP BY platform_id
ORDER BY "Total units sold (millions)" DESC

--To retrieve 'Grand Theft Auto V' PS4 sales vs XBOX sales
SELECT 

