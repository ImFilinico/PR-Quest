param planName string
param location string = resourceGroup().location
param sku string = 'Y1' // Consumption by default

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: planName
  location: location
  sku: {
    name: sku
    tier: sku == 'Y1' ? 'Dynamic' : 'ElasticPremium'
  }
}

output planName string = plan.name
output planId string = plan.id
