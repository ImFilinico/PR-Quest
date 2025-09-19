param namePrefix string
param location string = resourceGroup().location
param appInsightsKey string

module sa '../base-modules/storage-account.bicep' = {
  name: '${namePrefix}-storage'
  params: {
    storageAccountName: '${namePrefix}sa'
    location: location
  }
}

module plan '../base-modules/hosting-plan.bicep' = {
  name: '${namePrefix}-plan'
  params: {
    planName: '${namePrefix}-plan'
    location: location
  }
}

module func '../base-modules/function-app.bicep' = {
  name: '${namePrefix}-func'
  params: {
    functionAppName: '${namePrefix}-func'
    location: location
    storageAccountId: sa.outputs.storageAccountId
    hostingPlanId: plan.outputs.planId
    appInsightsKey: appInsightsKey
  }
}

output functionAppName string = func.outputs.functionAppName
output functionAppId string = func.outputs.functionAppId
