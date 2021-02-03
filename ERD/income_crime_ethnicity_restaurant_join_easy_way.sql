Create View income_crime_ethnicity_restaurant_data 
AS
SELECT i.neighbourhood_id ,i.neighbourhood_name, i.average_income, c.total_average_crime_rate,r.number_of_restaurants,
e.oceania_origins, e.asian_origins,e.north_american_aboriginal_origins,e.other_north_american_origins, 
e.latin_origins,e.european_origins,e.african_origins,e.caribbean_origins 
from income AS i 
inner join crime AS c on i.neighbourhood_id  = c.neighbourhood_id
and i.neighbourhood_name = c.neighbourhood_name 
inner join ethnicity AS e on i.neighbourhood_id  = e.neighbourhood_id
and i.neighbourhood_name = e.neighbourhood_name
inner join neighbourhood_restaurant AS r on i.neighbourhood_id = r.neighbourhood_id
ORDER BY i.neighbourhood_id 