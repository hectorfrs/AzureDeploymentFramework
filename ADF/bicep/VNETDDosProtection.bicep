param Prefix string

@allowed([
  'POC'
  'DEV'
  'TST'
  'CRT'
  'PRP'
  'PRD'
  'DOP'
  'UAT'
  'INT'
  'DRS'
])
param Environment string = 'DEV'

@allowed([
  '0'
  '1'
  '2'
  '3'
  '4'
  '5'
  '6'
  '7'
  '8'
  '9'
  '10'
  '11'
  '12'
  '13'
  '14'
  '15'
  '16'
])
param DeploymentID string
param Stage object
#disable-next-line no-unused-params
param Extensions object
param Global object
param DeploymentInfo object

var subscriptionId = subscription().subscriptionId
var resourceGroupName = resourceGroup().name
var Deployment = '${Prefix}-${Global.OrgName}-${Global.Appname}-${Environment}${DeploymentID}'
var DeploymentURI = toLower('${Prefix}${Global.OrgName}${Global.Appname}${Environment}${DeploymentID}')

resource ddosProtectionPlan 'Microsoft.Network/ddosProtectionPlans@2022-01-01' = {
  name: 'ddosProtection01'
  location: Global.PrimaryLocation
}
