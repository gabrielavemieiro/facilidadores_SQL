declare @command varchar(1000)
set @command = '
use ?
SELECT Distinct
''?''
,s.name
,t.name AS ''TableName''
,c.name  AS ''ColumnName''
FROM        sys.columns c  with(nolock)
JOIN        sys.tables  t  with(nolock)  ON c.object_id = t.object_id
JOIN        sys.schemas  s  with(nolock)  ON t.schema_id = s.schema_id
WHERE       t.name LIKE ''%RES%''
;'

DECLARE @UniaoResultados TABLE
(DatabaseName VARCHAR(200),SchemaName VARCHAR(200), TableName VARCHAR(200), ColumnName VARCHAR(200))

INSERT  INTO @UniaoResultados
EXEC sp_MSforeachdb @command

select * from @UniaoResultados
order by DatabaseName, SchemaName, TableName, ColumnName