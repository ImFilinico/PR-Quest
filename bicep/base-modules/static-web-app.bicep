param staticName string
param location string = resourceGroup().location

resource swa 'Microsoft.Web/staticSites@2022-03-01' = {
  name: staticName
  location: location
  properties: {
    repositoryUrl: 'https://github.com/yourOrg/yourRepo'
    branch: 'main'
  }
}

output staticWebAppName string = swa.name
output staticWebAppId string = swa.id
