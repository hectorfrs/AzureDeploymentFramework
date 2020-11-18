# Helper script for VSTS Releases

param (
    [String]$Env,
    [string]$Prefix = 'AZC1',
    [String]$stage = 'ALL',
    [ValidateSet('ADF', 'PSO', 'ABC', 'HUB')]
    [String]$APP = 'ADF',
    [switch]$SubscriptionDeploy,
    [switch]$FullUpload,
    [switch]$LogAzDebug
)

. $PSScriptRoot\Start-AzDeploy.ps1
$ArtifactStagingDirectory = get-item -path "$PSScriptRoot\.."

$templatefile = "$ArtifactStagingDirectory\templates-deploy\0-azuredeploy-$stage.json"

$Params = @{
    Deployment               = $Env 
    Prefix                   = $Prefix
    App                      = $APP
    ArtifactStagingDirectory = $ArtifactStagingDirectory
    TemplateFile             = $templatefile
    #TemplateParametersFile   = "$PSScriptRoot\..\azuredeploy.1.$Prefix.$Env.parameters.json"
}

Start-AzDeploy @Params -FullUpload:$FullUpload -VSTS -SubscriptionDeploy:$SubscriptionDeploy # -LogAzDebug:$LogAzDebug