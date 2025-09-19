param sqlServerName string
param adminUser string
param adminPassword string
param databaseName string
param skuName string = 'Basic'
param location string = resourceGroup().location

module sqlServer '../base-modules/sql-server.bicep' = {
  name: 'sqlServer'
  params: {
    sqlServerName: sqlServerName
    adminUser: adminUser
    adminPassword: adminPassword
    location: location
  }
}

module sqlDb '../base-modules/sql-database.bicep' = {
  name: 'sqlDb'
  params: {
    sqlServerName: sqlServerName
    databaseName: databaseName
    skuName: skuName
  }
}

output sqlServerId string = sqlServer.outputs.sqlServerId
output sqlDbId string = sqlDb.outputs.sqlDbId
