select
 tmp2.submission_date, 
 tmp2.hacker_cnt, 
 tmp4.hacker_id, 
 h.name
from
        (
        select 
         submission_date, 
         count(distinct hacker_id) as hacker_cnt
        from 
                (
                select 
                 s.*, 
                 dense_rank() over(order by submission_date) as date_rank, 
                dense_rank() over(partition by hacker_id order by submission_date) as hacker_rank 
                from submissions s
                ) tmp1
        where 
         date_rank = hacker_rank 
        group by 
         submission_date
        ) tmp2
INNER JOIN 
        (
        select 
         submission_date,
         hacker_id, 
         rank() over(partition by submission_date order by submission_count desc, hacker_id) as max_rank 
        from   
                (
                select 
                 submission_date, 
                 hacker_id, 
                 count(*) as submission_count 
                from        submissions 
                group by 
                 submission_date, 
                 hacker_id
                ) tmp3
        ) tmp4
on tmp2.submission_date = tmp4.submission_date 
and tmp4.max_rank = 1 
INNER JOIN  hackers         h 
on h.hacker_id = tmp4.hacker_id 
;