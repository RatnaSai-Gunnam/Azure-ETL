USE gold_database
GO

CREATE or ALTER PROC CreateSQLServerlessView_gold @ViewName nvarchar(100)
AS
BEGIN

DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT *
        FROM 
            OPENROWSET(
               BULK ''https://project1datalake.dfs.core.windows.net/gold/SalesLT/' + @ViewName + '/'',
               FORMAT = ''DELTA''
            ) AS [result]
	'

EXEC (@statement)

END
GO