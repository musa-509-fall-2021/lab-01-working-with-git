/*
  Create a query that returns all of the business in Philadelphia along with
  the name of the neighborhood the business is in.

  Hint: You can use ST_Contains to determine whether one geometry lies within
  another:https://postgis.net/docs/ST_Contains.html
*/

select n.name, b.*
from phl_business_licenses as b
join phl_neighborhoods as n
    on st_contains(n.the_geom, b.the_geom)
