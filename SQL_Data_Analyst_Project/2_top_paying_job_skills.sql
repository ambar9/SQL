/*
Question: What skills are required for the top-paying data analyst jobs in India?
- Use the top 20 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_job AS(
    SELECT
    *
    FROM 
        job_postings_fact
        INNER JOIN company_dim ON
        company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'India' AND 
        salary_year_avg IS NOT NULL

)
SELECT 
    top_paying_job.name as company_name,
    skills,
    top_paying_job.salary_year_avg,
    top_paying_job.job_title_short,
    top_paying_job.job_schedule_type  
FROM
    top_paying_job INNER JOIN
    skills_job_dim ON skills_job_dim.job_id = top_paying_job.job_id INNER JOIN
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    top_paying_job.salary_year_avg DESC
LIMIT 20;






/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings in India:
SQL And Python are leading with a bold count of 4 and 4.
Excel is also highly sought after, with a bold count of 6.
Other skills like R, sheets, Power bi, and Azure show varying degrees of demand.



[
  {
    "company_name": "Deutsche Bank",
    "skills": "sql",
    "salary_year_avg": "119250.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Deutsche Bank",
    "skills": "excel",
    "salary_year_avg": "119250.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Deutsche Bank",
    "skills": "visio",
    "salary_year_avg": "119250.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Deutsche Bank",
    "skills": "jira",
    "salary_year_avg": "119250.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Deutsche Bank",
    "skills": "confluence",
    "salary_year_avg": "119250.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "ACA Group",
    "skills": "excel",
    "salary_year_avg": "118140.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "ACA Group",
    "skills": "flow",
    "salary_year_avg": "118140.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "ACA Group",
    "skills": "power bi",
    "salary_year_avg": "118140.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "ACA Group",
    "skills": "sql",
    "salary_year_avg": "118140.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "ACA Group",
    "skills": "azure",
    "salary_year_avg": "118140.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Clarivate",
    "skills": "word",
    "salary_year_avg": "104550.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Clarivate",
    "skills": "powerpoint",
    "salary_year_avg": "104550.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Clarivate",
    "skills": "excel",
    "salary_year_avg": "104550.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Loop Health",
    "skills": "sql",
    "salary_year_avg": "93600.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Loop Health",
    "skills": "python",
    "salary_year_avg": "93600.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Loop Health",
    "skills": "r",
    "salary_year_avg": "93600.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Loop Health",
    "skills": "sheets",
    "salary_year_avg": "93600.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Clarivate",
    "skills": "sql",
    "salary_year_avg": "89118.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Clarivate",
    "skills": "python",
    "salary_year_avg": "89118.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  },
  {
    "company_name": "Clarivate",
    "skills": "excel",
    "salary_year_avg": "89118.0",
    "job_title_short": "Data Analyst",
    "job_schedule_type": "Full-time"
  }
]

*/

