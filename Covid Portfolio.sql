SELECT TOP (1000) [code]
      ,[continent]
      ,[country]
      ,[date]
      ,[population]
      ,[total_cases]
      ,[new_cases]
      ,[new_cases_smoothed]
      ,[total_cases_per_million]
      ,[new_cases_per_million]
      ,[new_cases_smoothed_per_million]
      ,[total_deaths]
      ,[new_deaths]
      ,[new_deaths_smoothed]
      ,[total_deaths_per_million]
      ,[new_deaths_per_million]
      ,[new_deaths_smoothed_per_million]
      ,[excess_mortality]
      ,[excess_mortality_cumulative]
      ,[excess_mortality_cumulative_absolute]
      ,[excess_mortality_cumulative_per_million]
      ,[hosp_patients]
      ,[hosp_patients_per_million]
      ,[weekly_hosp_admissions]
      ,[weekly_hosp_admissions_per_million]
      ,[icu_patients]
      ,[F27]
      ,[F28]
      ,[F29]
      ,[F30]
      ,[F31]
      ,[F32]
      ,[F33]
      ,[F34]
      ,[F35]
      ,[F36]
      ,[F37]
      ,[F38]
      ,[F39]
      ,[F40]
      ,[F41]
      ,[F42]
      ,[F43]
      ,[F44]
      ,[F45]
      ,[F46]
      ,[F47]
      ,[F48]
      ,[F49]
      ,[F50]
      ,[F51]
      ,[F52]
      ,[F53]
      ,[F54]
      ,[population_density]
      ,[median_age]
      ,[life_expectancy]
      ,[gdp_per_capita]
      ,[extreme_poverty]
      ,[diabetes_prevalence]
      ,[handwashing_facilities]
      ,[hospital_beds_per_thousand]
      ,[human_development_index]
  FROM [Covid_Analysis].[dbo].[Working$]

  Select *
  From Covid_Analysis..CovidDeath
  Order by 3,4;

  Select *
  From Covid_Analysis..CovidDeath
  where continent is not null
  Order by 3,4;

  --Select *
  --From Covid_Analysis..CovidVaccination1
  --Order by 3,4;

  --Select Data that we are going to be using

  Select Country, date, total_cases, new_cases, total_deaths, population
  From Covid_Analysis..CovidDeath
  where continent is not null
  Order by 1,2;

-- Loooking at the Total Cases vs Total Deaths

Select country, date, total_cases, total_deaths, (total_deaths * 1.0 / NULLIF(total_cases, 0)) * 100 AS Death_Percentage
  From Covid_Analysis..CovidDeath
  where continent is not null
  Order by 1,2;
  
  -- Shows likelihood of dying if you contact covid in your country

  Select country, date, total_cases, total_deaths, (total_deaths * 1.0 / NULLIF(total_cases, 0)) * 100 AS Death_Percentage
  From Covid_Analysis..CovidDeath
  Where country like '%States%'
  and continent is not null
  Order by 1,2;

  -- Looking at the total Cases vs Population
  -- Show what percentage og population got covid
   Select country, date, total_cases, population, (total_cases * 1.0 / NULLIF(population, 0)) * 100 AS PercentPopulationInfected
  From Covid_Analysis..CovidDeath
  --Where country like '%India%'
  where continent is not null
  Order by 1,2;

    Select country, date, total_cases, population, (total_cases * 1.0 / NULLIF(population, 0)) * 100 AS PercentPopulationInfected
  From Covid_Analysis..CovidDeath
  Where country like '%States%'
  and continent is not null
  Order by 1,2;

  -- Looking at the countries with the heighest infection rate compared to population

  Select country, population, Max(total_cases) as HighestInfectionRate, 
  Max((total_cases  * 1.0 / NULLIF(population, 0))) * 100 
  AS PercentagePopulationInfected
  From Covid_Analysis..CovidDeath
 -- Where country like '%India%'
  where continent is not null
  Group by country, population
  Order by 1,2;

   Select country, population, Max(total_cases) as HighestInfectionRate, 
   Max((total_cases / population)) * 100 
  AS PercentagePopulationInfected
  From Covid_Analysis..CovidDeath
 -- Where country like '%India%'
 where continent is not null
  Group by country, population
  Order by PercentagePopulationInfected desc;

   Select country, population, Max(total_cases) as HighestInfectionRate, 
  Max((total_cases  * 1.0 / NULLIF(population, 0))) * 100 
  AS PercentagePopulationInfected
  From Covid_Analysis..CovidDeath
 -- Where country like '%India%'
 where continent is not null
  Group by country, population
  Order by PercentagePopulationInfected desc;

  -- Showing countries with highest death count per population
   Select country, Max(Total_Deaths) as TotalDeathCount
  From Covid_Analysis..CovidDeath
 -- Where country like '%India%'
 where continent is not null
  Group by country
  Order by TotalDeathCount desc;

   Select country, Max(Cast(Total_Deaths as Int)) as TotalDeathCount
  From Covid_Analysis..CovidDeath
 -- Where country like '%India%'
 where continent is not null
  Group by country
  Order by TotalDeathCount desc;

    -- Let break things down by continent

   

   Select country, Max(Cast(Total_Deaths as Int)) as TotalDeathCount
  From Covid_Analysis..CovidDeath
 -- Where country like '%India%'
 where country is not null
  Group by country
  Order by TotalDeathCount desc;

-- Showing the continent with the highest count per population
Select continent, Max(Cast(Total_Deaths as Int)) as TotalDeathCount
  From Covid_Analysis..CovidDeath
 -- Where country like '%India%'
 where continent is not null
  Group by continent
  Order by TotalDeathCount desc;

  -- Global Number

  Select date, SUM(new_cases)--, total_deaths, (total_deaths * 1.0 / NULLIF(total_cases, 0)) * 100 AS Death_Percentage
  From Covid_Analysis..CovidDeath
  -- Where country like '%States%'
  where continent is not null
  Group by Date
  Order by 1,2;

  Select date, SUM(new_cases), SUM(new_deaths)--, (total_deaths * 1.0 / NULLIF(total_cases, 0)) * 100 AS Death_Percentage
  From Covid_Analysis..CovidDeath
  -- Where country like '%States%'
  where continent is not null
  Group by Date
  Order by 1,2;

   Select date, SUM(new_cases) as Total_Cases, SUM(new_deaths) as Total_Deaths, (SUM(new_deaths) * 1.0 / NULLIF(SUM(new_cases), 0)) * 100 
   AS Death_Percentage
  From Covid_Analysis..CovidDeath
  -- Where country like '%States%'
  where continent is not null
  Group by Date
  Order by 1,2;

    Select SUM(new_cases) as Total_Cases, SUM(new_deaths) as Total_Deaths, (SUM(new_deaths) * 1.0 / NULLIF(SUM(new_cases), 0)) * 100 
   AS Death_Percentage
  From Covid_Analysis..CovidDeath
  -- Where country like '%States%'
  where continent is not null
  -- Group by Date
  Order by 1,2;


  Select *
  From Covid_Analysis..CovidVaccination1;

  -- Looking at total population vs vaccination

  Select *
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date;
 
  Select DEA.continent, DEA.country, DEA.date, DEA.population, VAC.new_vaccinations
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date
     Where DEA.continent is not null
     order by 1,2,3;

     Select DEA.continent, DEA.country, DEA.date, DEA.population, VAC.new_vaccinations
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date
     Where DEA.continent is not null
     order by 2,3;

 Select DEA.continent, DEA.country, DEA.date, DEA.population, VAC.new_vaccinations,
 SUM(Convert(float,VAC.new_vaccinations)) Over (Partition by DEA.Country)
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date
     Where DEA.continent is not null
     order by 2,3;

 Select DEA.continent, DEA.country, DEA.date, DEA.population, VAC.new_vaccinations,
 SUM(Convert(float,VAC.new_vaccinations)) Over (Partition by DEA.Country Order by DEA.Country, DEA.Date) as RollingPeopleVaccinated
--  , (RollingPeopleVaccinated/population)*100
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date
     Where DEA.continent is not null
     order by 2,3;

     -- Use CTE

     With PopVSVac(Continent, Country, Date, Population,New_Vaccinations, RollingPeopleVaccinated)
     as
     (Select DEA.continent, DEA.country, DEA.date, DEA.population, VAC.new_vaccinations,
 SUM(Convert(float,VAC.new_vaccinations)) Over (Partition by DEA.Country Order by DEA.Country, DEA.Date) as RollingPeopleVaccinated
--  , (RollingPeopleVaccinated/population)*100
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date
     Where DEA.continent is not null
     -- order by 2,3)
     )
     Select * , (RollingPeopleVaccinated/population)*100
     From PopVSVac;

     -- Temp Table

Drop table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Country nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select DEA.continent, DEA.country, DEA.date, DEA.population, TRY_CONVERT(FLOAT, VAC.new_vaccinations),
     SUM(TRY_CONVERT(FLOAT, VAC.new_vaccinations))  Over (Partition by DEA.Country 
     Order by DEA.Country, DEA.Date) as RollingPeopleVaccinated
--  , (RollingPeopleVaccinated/population)*100
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date
     Where DEA.continent is not null
     -- order by 2,3)

     Select *, (RollingPeopleVaccinated/population)*100
     From #PercentPopulationVaccinated

     -- Creating View to store data for later visulaization

Create View PercentPopulationVaccinated as
  Select DEA.continent, DEA.country, DEA.date, DEA.population, 
  TRY_CONVERT(DECIMAL(18,0), VAC.new_vaccinations) AS New_vaccinations,
  SUM(TRY_CONVERT(DECIMAL(18,0), VAC.new_vaccinations))   Over (Partition by DEA.Country 
     Order by DEA.Country, DEA.Date) as RollingPeopleVaccinated
--  , (RollingPeopleVaccinated/population)*100
  From Covid_Analysis..CovidDeath DEA
  Join Covid_Analysis..CovidVaccination1 VAC
     On DEA.country = VAC.country
     and DEA.date = VAC.date
     Where DEA.continent is not null
     -- order by 2,3)

     Select * 
     From PercentPopulationVaccinated;