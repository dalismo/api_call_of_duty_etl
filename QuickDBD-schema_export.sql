-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).


CREATE TABLE "Game" (
    "Game_ID" int   NOT NULL,
    "Game_Name" VARCHAR   NOT NULL,
    "Release_Date" date   NOT NULL,
    "Genre" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Game" PRIMARY KEY (
        "Game_ID"
     )
);

CREATE TABLE "Platform" (
    "platform_id" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Platform" PRIMARY KEY (
        "platform_id"
     )
);

CREATE TABLE "Ratings" (
    "Game_ID" int   NOT NULL,
    "Metacritic" VARCHAR   NOT NULL,
    "Rating" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Ratings" PRIMARY KEY (
        "Game_ID"
     )
);

CREATE TABLE "ESRB_Rating" (
    "Game_ID" int   NOT NULL,
    "ESRB_rating" VARCHAR   NOT NULL,
    CONSTRAINT "pk_ESRB_Rating" PRIMARY KEY (
        "Game_ID"
     )
);

CREATE TABLE "Sales_Platform" (
    "platform_id" VARCHAR   NOT NULL,
    "Game_ID" int   NOT NULL,
    "Sales_Units_in_millions" DEC   NOT NULL,
    CONSTRAINT "pk_Sales_Platform" PRIMARY KEY (
        "platform_id","Game_ID"
     )
);

ALTER TABLE "Ratings" ADD CONSTRAINT "fk_Ratings_Game_ID" FOREIGN KEY("Game_ID")
REFERENCES "Game" ("Game_ID");

ALTER TABLE "ESRB_Rating" ADD CONSTRAINT "fk_ESRB_Rating_Game_ID" FOREIGN KEY("Game_ID")
REFERENCES "Game" ("Game_ID");

ALTER TABLE "Sales_Platform" ADD CONSTRAINT "fk_Sales_Platform_platform_id" FOREIGN KEY("platform_id")
REFERENCES "Platform" ("platform_id");

ALTER TABLE "Sales_Platform" ADD CONSTRAINT "fk_Sales_Platform_Game_ID" FOREIGN KEY("Game_ID")
REFERENCES "Game" ("Game_ID");

