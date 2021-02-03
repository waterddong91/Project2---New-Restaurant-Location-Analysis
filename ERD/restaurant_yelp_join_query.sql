-- Join restaurant and yelp_ratings tables on restaruant_name
SELECT r.restaurant_name, r.category, r.price_range, y.ratings, y.review_counts, r.neighbourhood_id, r.neighbourhood_name
FROM restaurant AS r
INNER JOIN yelp_ratings AS y
ON r.restaurant_name = y.restaurant_name
ORDER BY y.ratings DESC, y.review_counts DESC;