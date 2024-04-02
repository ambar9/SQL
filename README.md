# Introduction
📊 Dive into the data job market! Focusing on data analyst roles in India, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/SQL_Data_Analyst_Project/)

# Background
Driven by a quest to navigate the data analyst job market in India more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location. This query highlights the high paying opportunities in the field.

```sql
SELECT 
    company_dim.name AS company_name,
    job_location,
    job_via,
    job_schedule_type,
    salary_year_avg
FROM 
    job_postings_fact LEFT JOIN
    company_dim ON company_dim.company_id = job_postings_fact.company_id

WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_country = 'India'
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** The data shows an average annual salary range of ₹111,175 (Razorpay) to ₹650,000 (Mantys) for data analyst positions in India.
- **Diverse Employers:** While the data doesn't reveal specific companies, it highlights that opportunities exist in various sectors (e.g., IT, Manufacturing, Financial Services) based on the listed companies (Bosch Group, Deutsche Bank).
- **Job Title Variety:** Similar to the national trend, there's a variety of job titles present (Data Analyst), indicating diverse specializations within data analysis.

![Top Paying Roles](assets\Query1_Bar_chart.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts in India.*

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql
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
```
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:
- **SQL** Leads the Pack: Four out of the twenty data analyst positions require SQL proficiency.
- **Python** in High Demand: Two listings mention Python as a required skill.
- **Excel** Remains Relevant: While not as prevalent as SQL and Python, four data analyst positions still require Excel knowledge.
- Other Skills Emerge: Skills like **visio**, **jira**, **confluence**, **flow**, **power bi**, **azure**,**word**, **powerpoint**,**r**, **sheets** appear in the data, highlighting a demand for broader technical abilities beyond the core three.

![Top Paying Skills](assets\Query2_Bar_chart.png)
*Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts.

### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```
Here's the breakdown of the most demanded skills for data analysts in 2023
- **SQL & Excel Top Skills:** Holding the highest demand **(1016, 717)**, **SQL & Excel remain** crucial for data processing and manipulation.

- **Python Leads Programming:** **Python (687)** emerges as the key programming skill, highlighting the rise of technical expertise.

- **Data Viz Tools Gain Traction: Tableau (545) & Power BI (402)** showcase the growing focus on data visualization for clear communication.

![Top Paying Skills Job Count](assets\Query3_Bar_chart.png)
*Bar graph visualizing of the demand for the top 5 skills in data analyst job postings.

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.
```sql
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
```
Here's a breakdown of the results for Average Salary by Skills for Data Analysts:

- **Big Data & Python Top Earners: PySpark** leads the pack, reflecting high demand for Big Data processing. **Python's** presence with **Pandas** reinforces the value of data processing skills.

- **Automation & Cloud Gain Traction: Airflow** highlights a growing focus on data pipeline automation, while **Databricks** suggests the rise of cloud-based analytics. Cloud skills remain valuable.

![Average Salary by Skills.](assets\Query4_Bar_chart.png)
*Bar graph visualizing of the Average Salary by Skills in data analyst job postings.

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
```

| Skill ID | Skills     | Demand Count | Average Salary ($) |
|----------|------------|--------------|-------------------:|
| 0        | SQL        | 9            |             92,984 |
| 181      | Excel      | 8            |             88,519 |
| 1        | Python     | 6            |             95,933 |
| 182      | Tableau    | 3            |             95,103 |
| 234      | Confluence | 1            |            119,250 |
| 196      | PowerPoint | 1            |            102,678 |
| 215      | Flow       | 2            |            104,751 |
| 79       | Oracle     | 1            |            104,751 |
| 168      | Unix       | 1            |            105,400 |

*Table of the most optimal skills for data analyst sorted by salary*

Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
- **Python Remains King:** While not included in your specific data set, Python's established dominance is worth mentioning. Its high demand and average salary across various sources solidify its position as a leading data science language.

- **SQL Still Essential:**  SQL, with a demand count of 9 and an average salary of $92,984, underscores the enduring need for database expertise in data  management and retrieval.

- **Cloud Adoption on the Rise:** Skills in cloud platforms like Azure (demand count: 1, average salary: $98,570) showcase the growing importance of cloud-based data analytics.

- **Data Visualization in Focus:**  While not appearing at the very top, Power BI (demand count: 1, average salary: $109,832) highlights the value of data visualization tools for generating actionable insights.

- **Limited Data Consideration:** It's important to remember that this is a limited data set, and the most in-demand skills can vary depending on the specific job market and industry.

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.