/*
  What are the 5 neighborhoods with the most restaurants?

  Let's assume that a business is a resaurant if it has a licensetype that
  starts with 'Food Preparing and Serving'.

  Hint: It may help to use the business_annotated_with_neighborhood query as a
  CTE.
*/

with business_annotated_with_neighborhood as (
    select n.name as neighborhood_name, b.*
	from phl_business_licenses as b
	join phl_neighborhoods as n
		on st_contains(n.the_geom, b.the_geom)
)

select neighborhood_name, count(*) as num_restaurants
from business_annotated_with_neighborhood
where licensetype like 'Food Preparing and Serving%'
group by 1
order by 2 desc
limit 5
