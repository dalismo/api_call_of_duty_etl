game as game
-
game_id PK int
game_name VARCHAR
release_date date
genre VARCHAR 

platform as platform
-
platform_id pk VARCHAR


ratings
-
game_id int PK FK - game.game_id
metacritic VARCHAR
rating VARCHAR

esbr_rating
----
game_id int PK FK - game.game_id
esrb_rating VARCHAR

sales_platform
-
platform_id VARCHAR PK FK >- platform.platform_id
game_id int PK FK >- game.game_id
sales_units_in_millions DEC

game_platform
-
platform_id VARCHAR PK FK >- platform.platform_id
game_id int PK FK >- game.game_id
