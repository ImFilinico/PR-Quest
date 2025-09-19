using './main.bicep'

param location = 'westus2'
param env = 'prod'

param sqlAdminUser = 'prodadmin'
param sqlAdminPassword = 'temp password for now' //will use kv later

param sqlServerName = 'fitness-sql-prod'
param sqlDatabaseName = 'fitnessdb-prod'

param appInsightsName = 'fitness-ai-prod'
param functionNamePrefix = 'fitness-func-prod'
param staticWebAppName = 'fitness-swa-prod'
