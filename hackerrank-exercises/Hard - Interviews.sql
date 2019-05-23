select 
 con.contest_id,
 con.hacker_id, 
 con.name, 
 sum(tmp1.total_submissions) AS total_submissions, 
 sum(tmp1.total_accepted_submissions) AS total_accepted_submissions, 
 sum(tmp2.total_views) AS total_views, 
 sum(tmp2.total_unique_views) AS total_unique_views
from        contests                    con 
inner join  colleges                    col 
 on con.contest_id = col.contest_id 
inner join  challenges                  cha
 on  col.college_id = cha.college_id 
left 
outer join
            (
            select 
             challenge_id, 
             sum(total_submissions) as total_submissions,
             sum(total_accepted_submissions) as total_accepted_submissions
            from submission_stats 
            group by 
             challenge_id
            ) tmp1
 on cha.challenge_id = tmp1.challenge_id
left 
outer join
            (
            select 
             challenge_id, 
             sum(total_views) as total_views, 
             sum(total_unique_views) as total_unique_views
            from        view_stats 
            group by 
             challenge_id
            ) tmp2 
 on cha.challenge_id = tmp2.challenge_id 
group by 
 con.contest_id, con.hacker_id, con.name
having 
 sum(total_submissions)!=0 or 
 sum(total_accepted_submissions)!=0 or
 sum(total_views)!=0 or
 sum(total_unique_views)!=0
order by 
 contest_id
;