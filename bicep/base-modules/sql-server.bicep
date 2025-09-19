param sqlServerName string
param location string = resourceGroup().location
param adminUser string
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: adminUser
    administratorLoginPassword: adminPassword
    version: '12.0'
  }
}

output sqlServerName string = sqlServer.name
output sqlServerId string = sqlServer.id
