SELECT MIN(Doctor),MIN(Professor),MIN(Singer),MIN(Actor)
FROM(
SELECT CASE WHEN Occupation='Doctor' THEN Name END AS Doctor,
       CASE WHEN Occupation='Actor' THEN Name END AS Actor,
       CASE WHEN Occupation='Singer' THEN Name END AS Singer,
       CASE WHEN Occupation='Professor' THEN Name END AS Professor,
       RANK() OVER(PARTITION BY Occupation ORDER BY Name ASC) AS row_number
       FROM OCCUPATIONS) 
GROUP BY row_number
ORDER BY row_number;