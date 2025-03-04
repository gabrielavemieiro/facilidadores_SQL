SELECT  
OBJECT_SCHEMA_NAME(m.object_id) as 'Schema'
,OBJECT_NAME(m.object_id) as 'Nome View'
,SUBSTRING(m.definition,CHARINDEX(CHAR(13),SUBSTRING(m.definition,10,LEN(m.definition)))+15,LEN(m.definition)-CHARINDEX(CHAR(13) ,SUBSTRING(m.definition,10,LEN(m.definition)))-16) as query
FROM sys.views v
INNER JOIN sys.sql_modules m ON m.object_id = v.object_id
WHERE name like '%teste_views%'
