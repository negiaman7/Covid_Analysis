# 📊 COVID-19 Data Analysis using SQL

##  About This Project
This project is my attempt to explore real-world COVID-19 data using SQL and understand how the pandemic impacted different countries.

Instead of just running queries, I focused on asking meaningful questions like:
- How deadly was COVID in different regions?
- What percentage of people were infected?
- Which countries were hit the hardest?
- How did vaccination progress over time?

The goal was to strengthen my SQL skills while thinking like a data analyst.

---

##  Dataset Used
I worked with two datasets:
- **CovidDeath** – contains cases, deaths, and population data  
- **CovidVaccination1** – contains vaccination records  

These datasets were joined using:
- `country`
- `date`

---

##  Tools & Skills Applied
- SQL Server  
- Joins  
- Aggregate Functions  
- Window Functions  
- CTEs (Common Table Expressions)  
- Temporary Tables  
- Views  

---

##  What I Explored

### 1. Understanding the Data
Started by filtering out incomplete records (like missing continents) and organizing the data by country and date.

---

### 2. Death Rate Analysis
I calculated the percentage of deaths compared to total cases to understand how severe COVID was in different countries.

This helped answer:
> “If someone got infected, what were their chances of survival?”

---

### 3. Infection vs Population
I compared total cases with population to see what percentage of people got infected.

This gave a much clearer picture than just looking at raw case numbers.

---

### 4. Countries with Highest Infection Rates
Using aggregation, I identified countries where the largest portion of the population was affected.

Some smaller countries actually showed higher percentages than expected.

---

### 5. Countries with Highest Death Count
I analyzed total deaths per country to identify the most impacted regions overall.

---

### 6. Continent-Level Insights
Grouping data by continent helped understand which regions were hit the hardest globally.

---

### 7. Global Trends Over Time
I tracked:
- Daily new cases  
- Daily deaths  
- Overall death percentage globally  

This showed how the pandemic evolved over time.

---

##  Vaccination Analysis

To understand vaccination progress, I joined both datasets and calculated a running total of vaccinations using window functions.

This allowed me to track:
- How vaccinations increased over time  
- What percentage of population got vaccinated  

---

##  SQL Concepts I Practiced

- **Window Functions** – Used to calculate running totals for vaccinations  
- **CTE (Common Table Expressions)** – Helped break complex queries into readable steps  
- **Temporary Tables** – Stored intermediate results for further calculations  
- **Views** – Created reusable datasets for future analysis or visualization  

---

##  Key Learnings

- Raw numbers can be misleading — percentages give better insights  
- Data type handling (`CAST`, `TRY_CONVERT`) is crucial in real datasets  
- Window functions are extremely powerful for trend analysis  
- Structuring queries properly makes a huge difference in readability  

---


## 🚀 Why This Project Matters
This project is not just about SQL queries—it’s about developing a data analyst mindset:
- Asking the right questions  
- Working with messy real-world data  
- Turning raw data into meaningful insights  

---
