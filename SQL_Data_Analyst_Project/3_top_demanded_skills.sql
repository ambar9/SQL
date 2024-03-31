/*
Question: What are the most in-demand skills for data analysts in India?
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/



SELECT
    skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM
    job_postings_fact INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_location = 'India' AND
    job_title_short = 'Data Analyst' 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;








/*
skills for data analysts in India in 2023:

SQL and Excel: Fundamental skills with high demand counts, emphasizing the need for strong foundational skills in data processing and
spreadsheet manipulation.
Python, Tableau, and Power BI: Essential tools with significant demand, 
highlighting the increasing importance of technical skills in data analysis and visualization.




[
  {
    "skills": "sql",
    "demand_count": "1016"
  },
  {
    "skills": "excel",
    "demand_count": "717"
  },
  {
    "skills": "python",
    "demand_count": "687"
  },
  {
    "skills": "tableau",
    "demand_count": "545"
  },
  {
    "skills": "power bi",
    "demand_count": "402"
  }
]
*/