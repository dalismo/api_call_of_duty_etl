SELECT * FROM esrb_rating
SELECT * FROM game
SELECT * FROM sales_platform
SELECT * FROM ratings
SELECT * FROM platform

--To retrieve ESRB Ratings for each game with ESRB rating mature
SELECT e.esrb_rating, g.game_ID, g.game_name
FROM esrb_rating as e
INNER JOIN game as g
ON e.game_ID = g.game_id
WHERE e.esrb_rating = 'Mature'

--To retrieve the most popular games released between 2012 to 2016
SELECT g.game_id", g.game_name", sp.platform_id, r.rating, r.metacritic, sp.platform_id
FROM game as g
INNER JOIN ratings as r
ON g.game_id = r.game_id
INNER JOIN sales_platform as sp
ON g.game_id = sp.game_id
ORDER BY r.rating DESC
