/*
What are the top skills based on salary in India?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_country = 'India' AND
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;





/*
Here are some quick insights from the top paying skills for data analysts in India in 2023:

Specialized Technologies: Skills like PySpark, GitLab, PostgreSQL, Linux, and MySQL command high salaries, 
indicating a demand for expertise in specialized data processing and management technologies.

Data Management Platforms: Technologies such as Neo4j, MongoDB, Databricks, Kafka, and Snowflake are associated with above-average salaries, 
highlighting the importance of data management and analytics platforms in the industry.

Visualization and Collaboration Tools: Skills like Pandas, Matplotlib, Confluence, Visio, 
and Jira also command competitive salaries, emphasizing the significance of visualization and collaboration tools in the data analysis ecosystem.




[
  {
    "skills": "pyspark",
    "avg_salary": "165000"
  },
  {
    "skills": "gitlab",
    "avg_salary": "165000"
  },
  {
    "skills": "postgresql",
    "avg_salary": "165000"
  },
  {
    "skills": "linux",
    "avg_salary": "165000"
  },
  {
    "skills": "mysql",
    "avg_salary": "165000"
  },
  {
    "skills": "neo4j",
    "avg_salary": "163782"
  },
  {
    "skills": "gdpr",
    "avg_salary": "163782"
  },
  {
    "skills": "airflow",
    "avg_salary": "138088"
  },
  {
    "skills": "mongodb",
    "avg_salary": "135994"
  },
  {
    "skills": "scala",
    "avg_salary": "135994"
  },
  {
    "skills": "databricks",
    "avg_salary": "135994"
  },
  {
    "skills": "pandas",
    "avg_salary": "122463"
  },
  {
    "skills": "kafka",
    "avg_salary": "122100"
  },
  {
    "skills": "confluence",
    "avg_salary": "119250"
  },
  {
    "skills": "visio",
    "avg_salary": "119250"
  },
  {
    "skills": "shell",
    "avg_salary": "118500"
  },
  {
    "skills": "spark",
    "avg_salary": "118332"
  },
  {
    "skills": "jira",
    "avg_salary": "115213"
  },
  {
    "skills": "no-sql",
    "avg_salary": "114291"
  },
  {
    "skills": "hadoop",
    "avg_salary": "113276"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111213"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "111175"
  },
  {
    "skills": "dax",
    "avg_salary": "111175"
  },
  {
    "skills": "bash",
    "avg_salary": "111175"
  },
  {
    "skills": "electron",
    "avg_salary": "111175"
  }
]


*/