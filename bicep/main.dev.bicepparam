using './main.bicep'

param location = 'westus2'
param env = 'dev'

param sqlAdminUser = 'devadmin'
param sqlAdminPassword = 'YourDevSecurePasswordHere' //will use kv later

param sqlServerName = 'fitness-sql-dev'
param sqlDatabaseName = 'fitnessdb-dev'

param appInsightsName = 'fitness-ai-dev'
param functionNamePrefix = 'fitness-func-dev'
param staticWebAppName = 'fitness-swa-dev'
