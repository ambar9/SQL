/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill in India)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/


WITH skill_demand AS(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact INNER JOIN
        skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id INNER JOIN
        skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_location = 'India' AND
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
),

average_salary AS (     
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        round(AVG(salary_year_avg),0) AS avg_salary
    FROM
        job_postings_fact
        INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
        INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_country = 'India' AND
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
)

SELECT
    skill_demand.skill_id,
    skill_demand.skills,
    demand_count,
    avg_salary
FROM 
    skill_demand INNER JOIN
    average_salary ON average_salary.skill_id = skill_demand.skill_id
ORDER BY
    demand_count DESC;






/*


Top Demanded Skills for Data Analysts in 2023 in India:

SQL and Excel: Fundamental with demand counts of 9 and 8 respectively. SQL averages $92,984, Excel at $88,519.

Python and R: Essential programming languages. Python: 6 demands, $95,933. R: 3 demands, $86,609.

Tableau and Power BI: Vital for visualization. Tableau: 3 demands, $95,103. Power BI: 1 demand, $109,832.

Looker, Confluence, Visio, PowerPoint: Emerging with 1 demand each.

Oracle, SQL Server, T-SQL: Key database technologies, each with 1 demand.



[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "9",
    "avg_salary": "92984"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "8",
    "avg_salary": "88519"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "6",
    "avg_salary": "95933"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "3",
    "avg_salary": "95103"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "3",
    "avg_salary": "86609"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "3",
    "avg_salary": "83266"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "2",
    "avg_salary": "104751"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "1",
    "avg_salary": "104260"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "1",
    "avg_salary": "79200"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "1",
    "avg_salary": "79200"
  },
  {
    "skill_id": 168,
    "skills": "unix",
    "demand_count": "1",
    "avg_salary": "105400"
  },
  {
    "skill_id": 170,
    "skills": "windows",
    "demand_count": "1",
    "avg_salary": "79200"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "1",
    "avg_salary": "71900"
  },
  {
    "skill_id": 16,
    "skills": "t-sql",
    "demand_count": "1",
    "avg_salary": "64600"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "1",
    "avg_salary": "109832"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "1",
    "avg_salary": "98815"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "1",
    "avg_salary": "119250"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "1",
    "avg_salary": "85367"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "1",
    "avg_salary": "102678"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demand_count": "1",
    "avg_salary": "93121"
  },
  {
    "skill_id": 202,
    "skills": "ms access",
    "demand_count": "1",
    "avg_salary": "64600"
  },
  {
    "skill_id": 204,
    "skills": "visio",
    "demand_count": "1",
    "avg_salary": "119250"
  },
  {
    "skill_id": 226,
    "skills": "terminal",
    "demand_count": "1",
    "avg_salary": "32400"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "1",
    "avg_salary": "115213"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "1",
    "avg_salary": "98570"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "1",
    "avg_salary": "89120"
  }
]
*/



