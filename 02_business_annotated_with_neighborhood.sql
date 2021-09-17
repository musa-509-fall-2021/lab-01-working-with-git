/*
 Create a query that returns all of the business in Philadelphia along with
 the name of the neighborhood the business is in.
 
 Hint: You can use ST_Contains to determine whether one geometry lies within
 another:https://postgis.net/docs/ST_Contains.html
 */


SELECT nbh.name neighborhood_name, bns.*
FROM business_licenses bns
INNER JOIN neighborhoods_philadelphia nbh 
ON ST_Contains(nbh.the_geom, bns.the_geom)