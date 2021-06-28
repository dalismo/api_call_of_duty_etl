CREATE TABLE "game" (
    "game_id" int   NOT NULL,
    "game_name" VARCHAR   NOT NULL,
    "release_date" date   NOT NULL,
    "genre" VARCHAR   NOT NULL,
    CONSTRAINT "pk_game" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "platform" (
    "platform_id" VARCHAR   NOT NULL,
    CONSTRAINT "pk_platform" PRIMARY KEY (
        "platform_id"
     )
);

CREATE TABLE "ratings" (
    "game_id" int   NOT NULL,
    "metacritic" VARCHAR   NOT NULL,
    "rating" VARCHAR   NOT NULL,
    CONSTRAINT "pk_ratings" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "esbr_rating" (
    "game_id" int   NOT NULL,
    "esrb_rating" VARCHAR   NOT NULL,
    CONSTRAINT "pk_esbr_rating" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "sales_platform" (
    "platform_id" VARCHAR   NOT NULL,
    "game_id" int   NOT NULL,
    "sales_units_in_millions" DEC   NOT NULL,
    CONSTRAINT "pk_sales_platform" PRIMARY KEY (
        "platform_id","game_id"
     )
);

CREATE TABLE "game_platform" (
    "platform_id" VARCHAR   NOT NULL,
    "game_id" int   NOT NULL,
    CONSTRAINT "pk_game_platform" PRIMARY KEY (
        "platform_id","game_id"
     )
);

ALTER TABLE "ratings" ADD CONSTRAINT "fk_ratings_game_id" FOREIGN KEY("game_id")
REFERENCES "game" ("game_id");

ALTER TABLE "esbr_rating" ADD CONSTRAINT "fk_esbr_rating_game_id" FOREIGN KEY("game_id")
REFERENCES "game" ("game_id");

ALTER TABLE "sales_platform" ADD CONSTRAINT "fk_sales_platform_platform_id" FOREIGN KEY("platform_id")
REFERENCES "platform" ("platform_id");

ALTER TABLE "sales_platform" ADD CONSTRAINT "fk_sales_platform_game_id" FOREIGN KEY("game_id")
REFERENCES "game" ("game_id");

ALTER TABLE "game_platform" ADD CONSTRAINT "fk_game_platform_platform_id" FOREIGN KEY("platform_id")
REFERENCES "platform" ("platform_id");

ALTER TABLE "game_platform" ADD CONSTRAINT "fk_game_platform_game_id" FOREIGN KEY("game_id")
REFERENCES "game" ("game_id");