--
SOURCE /home/josha/Documents/metal_band/metal_bands.sql;
SELECT
	origin,
	SUM(fans) AS nb_fans
FROM
	metal_bands
GROUP BY
	metal_bands
ORDER BY
	nb_fans DESC;
	
