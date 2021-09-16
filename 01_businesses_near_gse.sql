/*
  What are the 5 closest business to the Graduate School of Education building
  (3700 Walnut St) that aren't owned by the Trustees of UPenn? Try using
  https://geojson.io/ to get the coordinates of GSE.

  Hint: There are two ways to get the distance from one geometry to another in
  PostgresSQL:
  1. ST_Distance (https://postgis.net/docs/ST_Distance.html)
  2. The distance operator (https://postgis.net/docs/geometry_distance_knn.html)

  The latter should be used if getting distances for ORDER BY.
*/

SELECT *  FROM public.business_licenses
where opa_owner not like 'THE TRUSTEES %'
Order by the_geom <-> 'SRID=4326;POINT(-75.19723 39.9556)'::geometry
limit 5

SELECT *  FROM public.business_licenses
where opa_owner not like 'THE TRUSTEES %'
Order by the_geom <-> ST_setsrid(ST_MAKEPOINT(-75.19723, 39.9556), 4326)
limit 5