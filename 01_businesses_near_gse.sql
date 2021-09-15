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
SELECT st_distance(
  ST_Transform(st_setsrid(st_point(-75.19725, 39.95323), 4326), 3857),
  ST_Transform(the_geom, 3857)
) distance, *
FROM public.business_licenses
where opa_owner not like '%TRUSTEE%'
order by distance
limit 5