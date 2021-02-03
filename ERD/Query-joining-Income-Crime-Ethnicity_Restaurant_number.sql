--Query to check successful load

Select * from income;
Select * from crime;
Select * from ethnicity;
Select * from neighbourhood_restaurant;

--Join the income table and the crime table and create a view which can be further used in querying --140 records

Create View income_crime_data 
AS
SELECT i.neighbourhood_id ,i.neighbourhood_name, i.average_income, c.total_average_crime_rate
from income AS i inner join crime AS c on i.neighbourhood_id  = c.neighbourhood_id
and i.neighbourhood_name = c.neighbourhood_name 
ORDER BY i.neighbourhood_id;

--Join the income crime view and the ethnicity table -- 136 records

Create View income_crime_ethnicity_data
AS
SELECT ic.neighbourhood_id, ic.neighbourhood_name, e.oceania_origins, e.asian_origins,
e.north_american_aboriginal_origins,e.other_north_american_origins, e.latin_origins,
e.european_origins,e.african_origins,e.caribbean_origins from income_crime_data AS ic inner join
ethnicity AS e on ic.neighbourhood_id  = e.neighbourhood_id
and ic.neighbourhood_name = e.neighbourhood_name order by ic.neighbourhood_id ;

--Join the income crime ethnicity view and the neighbourhood_restaurant table -- 133 records

SELECT ice.neighbourhood_id, ice.neighbourhood_name, r.number_of_restaurants, ice.oceania_origins, ice.asian_origins,
ice.north_american_aboriginal_origins,ice.other_north_american_origins, ice.latin_origins,
ice.european_origins,ice.african_origins,ice.caribbean_origins
from income_crime_ethnicity_data AS ice inner join
neighbourhood_restaurant AS r on ice.neighbourhood_id = r.neighbourhood_id
ORDER BY r.number_of_restaurants DESC
