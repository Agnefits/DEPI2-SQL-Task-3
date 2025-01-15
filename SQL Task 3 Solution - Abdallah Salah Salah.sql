---Using “World” database
USE [World];

--1
SELECT CountryCode FROM CountryLanguage GROUP BY CountryCode HAVING Count(Language) > 2 

--2
SELECT SUM(CAST(Population AS BIGINT)) AS "People on Earth" FROM Country

--3
SELECT Continent, COUNT(*) AS "Countries", SUM(CAST(Population AS BIGINT)) AS "Total Population" FROM Country GROUP BY Continent

--4
INSERT Country ([Code], [Name], [Continent], [Region], [SurfaceArea], [Population], [LifeExpectancy], [LocalName], [GovernmentForm], [HeadOfState], [Capital], [Code2])
		VALUES('YTP', 'Youtopia', 'Oceania', 'Micronesia', 5000, 1000, 64, 'Dream', 'Freedom', 'Yourself', 4081,'YT')
INSERT City ([ID], [Name], [CountryCode], [District], [Population]) VALUES (4080,'FreeCity', 'YTP', 'Free',2000)
INSERT City ([ID], [Name], [CountryCode], [District], [Population]) VALUES (4081,'CapitalCity', 'YTP', 'Capital', 3000)
INSERT CountryLanguage ([CountryCode], [Language], [IsOfficial], [Percentage]) VALUES ('YTP', 'Arabic', 1, 90)
INSERT CountryLanguage ([CountryCode], [Language], [IsOfficial], [Percentage]) VALUES ('YTP', 'English', 0, 10)

--5
UPDATE Country SET [LifeExpectancy] += 5 WHERE [Code] = 'YTP'

--6
DELETE Country WHERE [Code] = 'YTP'
--The DELETE statement conflicted with the REFERENCE constraint "FK_City_Country1". The conflict occurred in database "World", table "dbo.City", column 'CountryCode'.
--Because I used it in City and CoutryLanguage, [CountryCode] is FK REFERENCES [Code] in Country
--To delete it right
DELETE City WHERE [CountryCode] = 'YTP'
DELETE CountryLanguage WHERE [CountryCode] = 'YTP'
DELETE Country WHERE [Code] = 'YTP'


---Using “Company” database
USE [CompanyDB];

--7
CREATE FUNCTION dbo.CalcSalary (@Salary FLOAT, @ExperienceYears INT)
RETURNS FLOAT
AS
BEGIN
	RETURN @Salary + IIF(@ExperienceYears < 7, @Salary * @ExperienceYears * 0.1, @Salary * 0.7)
END

GO
-- Using CalcSalary
SELECT dbo.CalcSalary(1000.0, 3) AS SALARY;

--8
CREATE FUNCTION dbo.TopDept 
(@DeptID INT)
RETURNS TABLE
AS RETURN SELECT TOP (10) [FName] + ' ' + [LName] AS [Name], [Salary] FROM Employee WHERE DNo = @DeptID ORDER BY Salary DESC

GO
--Using TopDept
SELECT * FROM dbo.TopDept(10) 