/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available in India.
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

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











/*
Breakdown of the top data analyst jobs in India in 2023:

Wide Salary Range: The top 10 paying data analyst roles in India span from ₹1,11,175 to ₹6,50,000 per year, 
indicating significant salary potential in the field.

Diverse Employers: Companies like Mantys, ServiceNow, Srijan Technologies, Bosch Group, Eagle Genomics Ltd, 
Deutsche Bank, ACA Group, and Razorpay are among those offering high salaries, 
showcasing a broad interest across different industries.

Job Title Variety: There's a diverse range of job titles, from Full-time positions at Mantys and 
ServiceNow to Contractor roles at Razorpay, reflecting varied roles and 
specializations within the data analytics field.


[
  {
    "company_name": "Mantys",
    "job_location": "Anywhere",
    "job_via": "via Y Combinator",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0"
  },
  {
    "company_name": "ServiceNow",
    "job_location": "Hyderabad, Telangana, India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0"
  },
  {
    "company_name": "Srijan Technologies",
    "job_location": "Gurugram, Haryana, India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0"
  },
  {
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0"
  },
  {
    "company_name": "Bosch Group",
    "job_location": "Bengaluru, Karnataka, India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0"
  },
  {
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0"
  },
  {
    "company_name": "Eagle Genomics Ltd",
    "job_location": "Hyderabad, Telangana, India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0"
  },
  {
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0"
  },
  {
    "company_name": "ACA Group",
    "job_location": "India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0"
  },
  {
    "company_name": "Razorpay",
    "job_location": "Bengaluru, Karnataka, India",
    "job_via": "via Ai-Jobs.net",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "111175.0"
  }
]

*/