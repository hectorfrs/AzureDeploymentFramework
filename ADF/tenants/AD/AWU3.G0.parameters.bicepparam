using '../../bicep/00-ALL-SUB.bicep'

param Global = {}

param Prefix = 'AWU3'

param Environment = 'G'

param DeploymentID = '0'

param Stage = {
  RoleDefinition: 0
  Security: 1
  RBAC: 0
  PIM: 0
  SP: 0
}

param Extensions = {}

param DeploymentInfo = {
  rolesInfo: [
    {
      Name: 'BenWilkinson'
      RBAC: [
        {
          Name: 'Reader'
        }
      ]
    }
  ]
  PIMInfo: [
    {
      Name: 'BenWilkinson-ADM'
      RBAC: [
        {
          Name: 'User Access Administrator'
        }
        {
          Name: 'Owner'
        }
        {
          Name: 'Key Vault Administrator'
        }
        {
          Name: 'Security Admin'
        }
      ]
    }
  ]
  SPInfo: []
  SecurityPricingInfo: {
    Standard: [
      'VirtualMachines'
      'SqlServers'
      'AppServices'
      'StorageAccounts'
      'SqlServerVirtualMachines'
      'KeyVaults'
      'Dns'
      'Arm'
      'Containers'
      'OpenSourceRelationalDatabases'
      'CosmosDbs'
      'CloudPosture'
      'Api'
    ]
    Free: []
  }
  RoleDefinitionsInfo: [
    {
      RoleName: 'PE_SF_App_Contributor'
      description: 'Manage Service Fabric Applications'
      notActions: []
      actions: [
        'Microsoft.Resources/subscriptions/resourceGroups/read'
        'Microsoft.Resources/deployments/*'
        'Microsoft.ServiceFabric/clusters/applications/*'
        'Microsoft.ServiceFabric/clusters/applicationTypes/*'
        'Microsoft.ServiceFabric/managedclusters/applications/*'
        'Microsoft.ServiceFabric/managedclusters/applicationTypes/*'
      ]
    }
  ]
}
