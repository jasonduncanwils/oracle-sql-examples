SELECT
 name || '(' || UPPER(SUBSTR(occupation,1,1)) || ')'
FROM OCCUPATIONS
ORDER BY
 name;

SELECT
 'There are a total of '|| COUNT(name) || ' ' || LOWER(occupation) ||'s.'
FROM OCCUPATIONS
GROUP BY
 occupation
ORDER BY
 COUNT(name),
 occupation
;