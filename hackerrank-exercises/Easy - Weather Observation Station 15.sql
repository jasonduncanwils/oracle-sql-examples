WITH TMP1 AS
(
SELECT
 MAX(LAT_N) AS MAX_LAT_N
FROM    STATION
WHERE
 LAT_N < 137.2345
)
SELECT
 ROUND(LONG_W,4)
FROM        TMP1
INNER JOIN  STATION   S
 ON S.LAT_N = MAX_LAT_N
;