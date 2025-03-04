SELECT
   sj.name JobName
  ,sj.enabled
  ,sjs.step_id
  ,sjs.step_name
  ,sjs.subsystem
  ,sjs.command
 
FROM msdb.dbo.sysjobs sj
INNER JOIN msdb.dbo.sysjobsteps sjs ON sj.job_id = sjs.job_id
WHERE
  sj.name like '%nome_job%' /* Filtrar por nome do Job */
  --sjs.step_name like '%TESTE%' /* Filtrar por nome do passo (step) do job */
  --sjs.command LIKE '%tabela_serie_historica%' /* Buscar pelo texto da query */