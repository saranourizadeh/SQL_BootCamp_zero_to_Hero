SELECT hacker_id, name, sum(m_score) as total_score
FROM (
    SELECT s.hacker_id ,h.name, s.challenge_id, MAX(s.score) as m_score
    FROM Submissions s
    JOIN Hackers as h on h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id ,h.name , s.challenge_id
    )AS max_scores
GROUP BY name , hacker_id
Having total_score > 0
ORDER BY total_score DESC , hacker_id ASC
