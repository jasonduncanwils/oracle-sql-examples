SELECT
 DISTINCT city
FROM        station
WHERE
     UPPER(SUBSTR(city,1,1)) NOT IN ('A','E','I','O','U')
 OR UPPER(SUBSTR(city,-1,1)) NOT IN ('A','E','I','O','U');