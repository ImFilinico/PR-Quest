targetScope = 'resourceGroup'

@description('Deployment location (e.g., westus2)')
param location string

@description('Environment name (dev/prod)')
param env string

@description('SQL admin username')
param sqlAdminUser string

@secure()
@description('SQL admin password')
param sqlAdminPassword string

// Resource names
param sqlServerName string
param sqlDatabaseName string
param appInsightsName string
param functionNamePrefix string
param staticWebAppName string

// --- Application Insights ---
module appInsightsModule './base-modules/app-insights.bicep' = {
  name: 'deploy-appinsights-${env}'
  params: {
    aiName: appInsightsName
    location: location
  }
}

// --- SQL Server + Database ---
module sqlModule './combo-modules/sql-with-db.bicep' = {
  name: 'deploy-sql-${env}'
  params: {
    sqlServerName: sqlServerName
    adminUser: sqlAdminUser
    adminPassword: sqlAdminPassword
    databaseName: sqlDatabaseName
    location: location
  }
}

// --- Function App with Plan + Storage ---
module functionModule './combo-modules/function-with-plan-and-storage.bicep' = {
  name: 'deploy-function-${env}'
  params: {
    namePrefix: functionNamePrefix
    location: location
    appInsightsKey: appInsightsModule.outputs.appInsightsKey
  }
}

// --- Static Web App + Function Integration ---
module swaModule './combo-modules/static-web-app-with-functions.bicep' = {
  name: 'deploy-swa-${env}'
  params: {
    namePrefix: staticWebAppName
    location: location
    appInsightsKey: appInsightsModule.outputs.appInsightsKey
  }
}
