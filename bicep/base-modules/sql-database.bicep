param sqlServerName string
param databaseName string
param skuName string = 'Basic'

resource sqlDb 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: '${sqlServerName}/${databaseName}'
  location: resourceGroup().location
  sku: {
    name: skuName
  }
}

output sqlDbName string = sqlDb.name
output sqlDbId string = sqlDb.id
