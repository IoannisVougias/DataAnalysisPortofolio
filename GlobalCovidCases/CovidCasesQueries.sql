
--Check if our tables are imported correctly,
--order them by location and date

select *
from PortofolioProject..CovidDeaths
--clean the not null continent rows so we have only countries
where continent is not null
order by 3,4

select *
from PortofolioProject..CovidVaccinations
order by 3,4

--Select the initial data that we are going to use
--order them by location and date
select location, date, total_cases, new_cases, total_deaths, population 
from PortofolioProject..CovidDeaths
where continent is not null
order by 1,2

--COUTNRY(GREECE) RELATED QUERIES

--Find the percentage of cases that ended in death
--Time: every day in Greece except dates we have 0 deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
from PortofolioProject..CovidDeaths
where total_deaths/total_cases is not null and location like 'Greece' and continent is not null
order by 1,2

--Find the percentage of population that was infected by covid-19
--Time: every day in Greece
select location, date, population, total_cases, (total_cases/population) * 100 as CovidPercentage
from PortofolioProject..CovidDeaths
where location like 'Greece' and continent is not null
order by 1,2

--COUTNRY(ALL) RELATED QUERIES

--Find countries with the highest infection count and rate per population
select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population)) * 100 as CovidPercentage
from PortofolioProject..CovidDeaths
where continent is not null
group by location,population
order by CovidPercentage desc

--Find countries with the highest death count per population
--convert varchar type to int so the count is correct
select location, population, max(cast(total_deaths as int)) as HighestDeathCount
from PortofolioProject..CovidDeaths
where continent is not null
group by location,population
order by HighestDeathCount desc

--CONTINENT RELATED QUERIES

--Find continents with the highest death count per population
select location, max(cast(total_deaths as int)) as HighestDeathCount
from PortofolioProject..CovidDeaths
where continent is null
group by location
order by HighestDeathCount desc


--GLOBAL RELATED QUERIES

--Find daily Death Percentage

--We sum the columns new_cases and new_deaths, 
--to get the total sum so we can group by
--convert new_deaths to int
select date, sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths,
sum(cast(new_deaths as int))/sum(new_cases) *100 as DeathPercentage
from PortofolioProject..CovidDeaths
where continent is not null
group by date
order by 1,2


--Percentage of vaccinated population
--We cast new_vaccinations to bigint so as the code won't chunk
Select d.continent, d.location, d.date, population, v.new_vaccinations,
sum(cast(v.new_vaccinations as bigint))	
OVER (Partition by d.location order by d.location, d.date) as CummulativeSumVac
from PortofolioProject..CovidDeaths as d
join PortofolioProject..CovidVaccinations as v 
	on d.location = v.location and d.date = v.date
where d.continent is not null
order by 2,3

--CREATE CTE TO USE CummulativeSumVac

With PercentageofVac (Continent, Location, Date, Population,New_Vaccinations, CummulativeSumVac)
as
(Select d.continent, d.location, d.date, population, v.new_vaccinations,
sum(cast(v.new_vaccinations as bigint))	
OVER (Partition by d.location order by d.location, d.date) as CummulativeSumVac
from PortofolioProject..CovidDeaths as d
join PortofolioProject..CovidVaccinations as v 
	on d.location = v.location and d.date = v.date
where d.continent is not null
)
select *, (CummulativeSumVac / Population) * 100 as VaccinatedPercentage
from PercentageofVac
where CummulativeSumVac is not null


--OR
--CREATE TEMP TABLE
DROP Table if exists #PercentageofVac
Create Table #PercentageofVac
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccination numeric,
CummulativeSumVac numeric,
)


Insert into #PercentageofVac
Select d.continent, d.location, d.date, population, v.new_vaccinations,
sum(cast(v.new_vaccinations as bigint))	
OVER (Partition by d.location order by d.location, d.date) as CummulativeSumVac
from PortofolioProject..CovidDeaths as d
join PortofolioProject..CovidVaccinations as v 
	on d.location = v.location and d.date = v.date
where d.continent is not null

select *, (CummulativeSumVac / Population) * 100 as VaccinatedPercentage
from #PercentageofVac
where CummulativeSumVac is not null


--CREATE VIEW TO STORE DATA FOR VISUALIZATIONS

Create view PercentageofVaccinated as 
Select d.continent, d.location, d.date, population, v.new_vaccinations,
sum(cast(v.new_vaccinations as bigint))	
OVER (Partition by d.location order by d.location, d.date) as CummulativeSumVac
from PortofolioProject..CovidDeaths as d
join PortofolioProject..CovidVaccinations as v 
	on d.location = v.location and d.date = v.date
where d.continent is not null

Select *
From PercentageofVaccinated
