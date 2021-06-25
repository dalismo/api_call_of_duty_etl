-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Game" (
    "GameID" int   NOT NULL,
    "GameName" string   NOT NULL,
    "ReleaseDate" string   NOT NULL,
    "Genre" string   NOT NULL,
    CONSTRAINT "pk_Game" PRIMARY KEY (
        "GameID"
     )
);

CREATE TABLE "Genre" (
    "GameID" int   NOT NULL,
    "Genre" string   NOT NULL,
    CONSTRAINT "pk_Genre" PRIMARY KEY (
        "GameID"
     )
);

CREATE TABLE "Sales" (
    "GameID" int   NOT NULL,
    "Sales_units" int   NOT NULL,
    CONSTRAINT "pk_Sales" PRIMARY KEY (
        "GameID"
     )
);

CREATE TABLE "Ratings" (
    "GameID" int   NOT NULL,
    "Metacritic" Int   NOT NULL,
    "Rating" float   NOT NULL,
    CONSTRAINT "pk_Ratings" PRIMARY KEY (
        "GameID"
     )
);

CREATE TABLE "ESRB_Rating" (
    "GameID" int   NOT NULL,
    "ESRB_rating" string   NOT NULL,
    CONSTRAINT "pk_ESRB_Rating" PRIMARY KEY (
        "GameID"
     )
);

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_Genre" FOREIGN KEY("Genre")
REFERENCES "Genre" ("Genre");

ALTER TABLE "Genre" ADD CONSTRAINT "fk_Genre_GameID" FOREIGN KEY("GameID")
REFERENCES "Game" ("GameID");

ALTER TABLE "Sales" ADD CONSTRAINT "fk_Sales_GameID" FOREIGN KEY("GameID")
REFERENCES "Game" ("GameID");

ALTER TABLE "Ratings" ADD CONSTRAINT "fk_Ratings_GameID" FOREIGN KEY("GameID")
REFERENCES "Game" ("GameID");

