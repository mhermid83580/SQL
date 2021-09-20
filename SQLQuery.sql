select TerritoryID, sum(TotalDue) as Ventas_territorio from Sales.SalesOrderHeader 
where TerritoryID = 1 or TerritoryID = 4 or TerritoryID = 6 or TerritoryID = 9
group by TerritoryID order by TerritoryID asc

select  Sales.SalesTerritory.Name, sum(Sales.SalesOrderHeader.TotalDue) as Ventas_territorio from Sales.SalesOrderHeader
inner join Sales.SalesTerritory
on Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
where Sales.SalesOrderHeader.TerritoryID = 1 or Sales.SalesOrderHeader.TerritoryID = 4 or Sales.SalesOrderHeader.TerritoryID = 6 or Sales.SalesOrderHeader.TerritoryID = 9
group by Sales.SalesOrderHeader.TerritoryID, Sales.SalesTerritory.Name
order by Sales.SalesOrderHeader.TerritoryID asc

select * from HumanResources.vEmployeeDepartment
where Department = 'Executive' or Department = 'Engineering' or Department = 'Tool Design'
order by BusinessEntityID asc

select * from HumanResources.vEmployeeDepartment 
where StartDate between '2000-07-01' and '2002-06-30'

select * from HumanResources.vEmployeeDepartment 
where StartDate > '2000-07-01' and  StartDate <'2002-06-30'

select * from Sales.SalesOrderHeader
where SalesPersonID is not null

select count(*) as Middlename from Person.Person 
where MiddleName is not null

select SalesPersonID, TotalDue from Sales.SalesOrderHeader
where SalesPersonID is not null and TotalDue >= 70000
order by SalesPersonID asc

select * from Sales.vIndividualCustomer 
where LastName like '[R]%'

select * from Sales.vIndividualCustomer 
where LastName like '%[R]'


select Color, count(*) from Production.Product
where color is not null and Color = 'Black' or Color = 'Blue'
or Color = 'Red' or Color = 'Silver' or Color = 'Yellow'
group by Color

SELECT SUM(pp.ListPrice) as 'Dinero que ganaria' FROM Production.Product pp  inner join Production.ProductInventory PIN on pp.ProductID= PIN.ProductID where pp.ListPrice>0

SELECT LastName, FirstName, CASE WHEN EmailPromotion=0 then 'Promo 1' WHEN EmailPromotion=1 then 'Promo 2' WHEN EmailPromotion=2 then 'Promo 3' End as 'PROMO' FROM Person.Person

select SSP.TerritoryID,SSP.BusinessEntityID,SSP.SalesYTD,SST.Name from Sales.SalesPerson SSP 
INNER JOIN Sales.SalesTerritory SST ON SSP.TerritoryID=SST.TerritoryID OR SSP.TerritoryID IS NULL

select SSP.TerritoryID,SSP.BusinessEntityID,SSP.SalesYTD,SST.Name, PP.FirstName, pp.LastName from Sales.SalesPerson SSP 
INNER JOIN Sales.SalesTerritory SST ON SSP.TerritoryID=SST.TerritoryID OR SSP.TerritoryID IS NULL
INNER JOIN Person.Person PP ON PP.BusinessEntityID=SSP.BusinessEntityID WHERE SST.Name='Northwest' or SST.NAME='
Central'

SELECT PPE.FirstName, PPE.LastName, PPA.PasswordHash FROM Person.Person PPE INNER JOIN Person.Password PPA ON PPE.BusinessEntityID=PPA.BusinessEntityID

SELECT CASE WHEN Title IS NULL	THEN 'NO HAY TITULO' WHEN Title IS NOT NULL THEN Title END AS 'TITULO' FROM Person.Person


SELECT CASE WHEN MiddleName IS NULL THEN CONCAT(FirstName,' ', LastName) WHEN MiddleName IS NOT NULL THEN CONCAT(FirstName,'  ',LastName) END FROM Person.Person

select CASE WHEN PP.MakeFlag=pp.FinishedGoodsFlag THEN 'NULL' END from Production.Product PP

select CASE WHEN PP.Color iS NOT NULL THEN 'SIN COLOR' END from Production.Product pp
select CASE WHEN PP.Color IS NOT NULL THEN PP.Color END from Production.Product pp

select PP.FirstName,PP.LastName,PPA.PasswordHash from Person.Person PP
INNER JOIN Person.Password PPA ON PP.BusinessEntityID=PPA.BusinessEntityID
