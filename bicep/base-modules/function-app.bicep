param functionAppName string
param location string = resourceGroup().location
param storageAccountId string
param hostingPlanId string
param appInsightsKey string

resource func 'Microsoft.Web/sites@2022-03-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  properties: {
    serverFarmId: hostingPlanId
    siteConfig: {
      appSettings: [
        { name: 'AzureWebJobsStorage', value: reference(storageAccountId, '2022-09-01').primaryEndpoints.blob }
        { name: 'APPINSIGHTS_INSTRUMENTATIONKEY', value: appInsightsKey }
        { name: 'FUNCTIONS_EXTENSION_VERSION', value: '~4' }
        { name: 'FUNCTIONS_WORKER_RUNTIME', value: 'node' }
      ]
    }
  }
}

output functionAppName string = func.name
output functionAppId string = func.id
