param namePrefix string
param location string = resourceGroup().location
param appInsightsKey string

module swa '../base-modules/static-web-app.bicep' = {
  name: '${namePrefix}-swa'
  params: {
    staticName: '${namePrefix}-swa'
    location: location
  }
}

module func '../combo-modules/function-with-plan-and-storage.bicep' = {
  name: '${namePrefix}-func-stack'
  params: {
    namePrefix: namePrefix
    location: location
    appInsightsKey: appInsightsKey
  }
}

output swaName string = swa.outputs.staticWebAppName
output functionAppName string = func.outputs.functionAppName
