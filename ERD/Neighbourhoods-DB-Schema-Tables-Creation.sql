-- Data Engineering
DROP TABLE IF EXISTS neighbourhood CASCADE;
DROP TABLE IF EXISTS income CASCADE;
DROP TABLE IF EXISTS crime CASCADE;
DROP TABLE IF EXISTS ethnicity CASCADE;
DROP TABLE IF EXISTS restaurant CASCADE;
DROP TABLE IF EXISTS neighbourhood_restaurant CASCADE;
DROP TABLE IF EXISTS yelp_ratings CASCADE;

CREATE TABLE "neighbourhood" (
    "neighbourhood_id" INT   NOT NULL,
    "neighbourhood_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_neighbourhood" PRIMARY KEY (
        "neighbourhood_id"
     )
);
CREATE TABLE "income" (
    "neighbourhood_id" INT   NOT NULL,
    "neighbourhood_name" VARCHAR   NOT NULL,
    "median_income" INT   NOT NULL,
    "average_income" INT   NOT NULL,
    CONSTRAINT "pk_income" PRIMARY KEY (
        "neighbourhood_id"
     )
);
CREATE TABLE "crime" (
    "neighbourhood_id" INT   NOT NULL,
    "neighbourhood_name" VARCHAR   NOT NULL,
    "total_average_crime_rate" Float   NOT NULL,
    CONSTRAINT "pk_crime" PRIMARY KEY (
        "neighbourhood_id"
     )
);
CREATE TABLE "ethnicity" (
    "neighbourhood_id" INT   NOT NULL,
    "neighbourhood_name" VARCHAR   NOT NULL,
	"oceania_origins" INT,
	"asian_origins" INT,
	"north_american_aboriginal_origins" INT,
	"other_north_american_origins" INT,
	"latin_origins" INT,
	"european_origins" INT,
	"african_origins" INT,
	"caribbean_origins" INT,
    CONSTRAINT "pk_ethnicity" PRIMARY KEY (
        "neighbourhood_id"
     )
);

CREATE TABLE "restaurant" (
    "restaurant_id" INT   NOT NULL,
    "category" VARCHAR   NOT NULL,
    "restaurant_name" VARCHAR   NOT NULL,
    "price_range" VARCHAR   NOT NULL,
    "latitude" Float4   NOT NULL,
    "longitude" Float4  NOT NULL,
    "neighbourhood_id" INT   NOT NULL,
    "neighbourhood_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_restaurant" PRIMARY KEY (
        "restaurant_id"
     )
);

CREATE TABLE "neighbourhood_restaurant" (
    "neighbourhood_id" INT   NOT NULL,
    "neighbourhood_name" VARCHAR   NOT NULL,
    "number_of_restaurants" INT   NOT NULL,
    CONSTRAINT "pk_neighbourhood_restaurant" PRIMARY KEY (
        "neighbourhood_id"
     )
);
CREATE TABLE "yelp_ratings" (
    "restaurant_id" VARCHAR   NOT NULL,
    "restaurant_name" VARCHAR   NOT NULL,
	"category" VARCHAR,
    "ratings" Float,
    "review_counts" INT,
	"zip_code" VARCHAR,
    CONSTRAINT "pk_yelp_ratings" PRIMARY KEY (
        "restaurant_id"
     )
);
--Adding Foreign Key Constraint
ALTER TABLE "income" ADD CONSTRAINT "fk_income_neighbourhood_id" FOREIGN KEY("neighbourhood_id")
REFERENCES "neighbourhood" ("neighbourhood_id");
ALTER TABLE "crime" ADD CONSTRAINT "fk_crime_neighbourhood_id" FOREIGN KEY("neighbourhood_id")
REFERENCES "neighbourhood" ("neighbourhood_id");
ALTER TABLE "ethnicity" ADD CONSTRAINT "fk_ethnicity_neighbourhood_id" FOREIGN KEY("neighbourhood_id")
REFERENCES "neighbourhood" ("neighbourhood_id");

-- Viewing the tables 
Select * from neighbourhood;
Select * from income;
Select * from crime;
Select * from ethnicity;
Select * from restaurant;
Select * from neighbourhood_restaurant;
Select * from yelp_ratings;