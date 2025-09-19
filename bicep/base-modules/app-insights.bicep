param aiName string
param location string = resourceGroup().location

resource ai 'Microsoft.Insights/components@2020-02-02' = {
  name: aiName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output appInsightsKey string = ai.properties.InstrumentationKey
output appInsightsId string = ai.id
