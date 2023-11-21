SELECT ST_MakeLine(
           ST_MakePoint(-74.0759, -90),
           ST_MakePoint(-74.0759, 90)
       )::geography AS meridiano;

-- Crear una línea que representa el meridiano en SRID 4326
SELECT ST_SetSRID(ST_MakeLine(ST_MakePoint(-74.0759, -90), ST_MakePoint(-74.0759, 90)), 4326) AS meridiano;

-- Contar las calles que intersectan con el meridiano
SELECT COUNT(*) AS numero_calles
FROM malla_vial_integral_bogota_d_c
WHERE ST_Intersects(geom, ST_SetSRID(ST_MakeLine(ST_MakePoint(-74.0759, -90), ST_MakePoint(-74.0759, 90)), 4326));
