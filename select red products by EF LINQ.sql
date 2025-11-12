SELECT 
    [Project1].[C1] AS [C1], 
    [Project1].[Name] AS [Name], 
    [Project1].[Color] AS [Color], 
    [Project1].[Name1] AS [Name1], 
    [Project1].[Name2] AS [Name2], 
    [Project1].[ListPrice] AS [ListPrice]
FROM ( SELECT 
    [Extent1].[Name] AS [Name], 
    [Extent1].[Color] AS [Color], 
    [Extent1].[ListPrice] AS [ListPrice], 
    [Extent2].[Name] AS [Name1], 
    [Extent3].[Name] AS [Name2], 
    1 AS [C1]
    FROM   [Production].[Product] AS [Extent1]
    LEFT OUTER JOIN [Production].[ProductSubcategory] AS [Extent2] ON [Extent1].[ProductSubcategoryID] = [Extent2].[ProductSubcategoryID]
    LEFT OUTER JOIN [Production].[ProductCategory] AS [Extent3] ON [Extent2].[ProductCategoryID] = [Extent3].[ProductCategoryID]
    WHERE N'Red' = [Extent1].[Color]
)  AS [Project1]
ORDER BY [Project1].[ListPrice] ASC


SELECT 
    [Extent1].[Name] AS [Name], 
    [Extent1].[Color] AS [Color], 
    [Extent1].[ListPrice] AS [ListPrice], 
    [Extent2].[Name] AS [Name1], 
    [Extent3].[Name] AS [Name2], 
    1 AS [C1]
    FROM   [Production].[Product] AS [Extent1]
    LEFT OUTER JOIN [Production].[ProductSubcategory] AS [Extent2] ON [Extent1].[ProductSubcategoryID] = [Extent2].[ProductSubcategoryID]
    LEFT OUTER JOIN [Production].[ProductCategory] AS [Extent3] ON [Extent2].[ProductCategoryID] = [Extent3].[ProductCategoryID]
    WHERE N'Red' = [Extent1].[Color]
ORDER BY [Extent1].[ListPrice]
