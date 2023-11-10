Write-Host -ForegroundColor DarkYellow -Object @"
________________________________________________

     ######## ##     ## ######## ########  ######## ########  ######  
     ##       ##     ## ##       ##     ##    ##    ##       ##    ## 
     ##       ##     ## ##       ##     ##    ##    ##       ##       
     ######   ##     ## ######   ########     ##    ######   ##       
     ##        ##   ##  ##       ##   ##      ##    ##       ##       
     ##         ## ##   ##       ##    ##     ##    ##       ##    ## 
     ########    ###    ######## ##     ##    ##    ########  ######  

"@
Write-Host -ForegroundColor DarkBlue -Object @'
    WELCOME TO EVERTEC - AZURE DEPLOYMENT FRAMEWORK!
'@
Write-Host -ForegroundColor DarkBlue -Object @'
________________________________________________
'@
Write-Host -ForegroundColor DarkMagenta -Object @'

Read Docs: https://brwilkinson.github.io/AzureDeploymentFramework/
'@
Write-Host -ForegroundColor DarkBlue -Object @'

# Deploy your first HUB:

- Update the OrgName in to your own unique OrgName
  - Select which region is your primary region and update that and the secondary
'@
Write-Host -ForegroundColor DarkYellow -Object @'
    ADF/tenants/HUB/Global-Global.json
'@
Write-Host -ForegroundColor DarkBlue -Object @'
- Check what resources are enabled in the Parameter file for the primary region
'@
Write-Host -ForegroundColor DarkYellow -Object @'
    ADF/tenants/HUB/ACU1.P0.parameters.json
'@
Write-Host -ForegroundColor DarkBlue -Object @'
- Set your stamp to the P0 in HUB
'@
Write-Host -ForegroundColor DarkYellow -Object @'
    > AzSet -App HUB -Enviro P0
'@
Write-Host -ForegroundColor DarkBlue -Object @'
- Create the Resource Group - use your primary prefix
'@
Write-Host -ForegroundColor DarkYellow -Object @'
    > AzDeploy @Current -Prefix ACU1 -TF ADF:\bicep\00-ALL-SUB.bicep
'@
Write-Host -ForegroundColor DarkBlue -Object @'
- Deploy the Resources - use your primary prefix
'@
Write-Host -ForegroundColor DarkYellow -Object @'
    > AzDeploy @Current -Prefix AEU1 -TF ADF:\bicep\01-ALL-RG.bicep
'@
Write-Host -ForegroundColor DarkBlue -Object @'
________________________________________________
'@

# install-ohmyposh.ps1

# Verificar si Oh-My-Posh ya está instalado
if (-Not (Test-Path $PROFILE)) {
    # Instalar Oh-My-Posh
    Write-Host "Instalando Oh-My-Posh..."
    Install-Module -Name oh-my-posh -Force -Scope CurrentUser
    Install-Module -Name posh-git -Scope CurrentUser

    # Configurar Oh-My-Posh en los perfiles de PowerShell
    Write-Host "Configurando Oh-My-Posh en el perfil del usuario..."
    New-Item -Path $PROFILE -Type File -Force
    Add-Content -Path $PROFILE -Value 'Import-Module oh-my-posh; oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\cloud-context.omp.json" | Invoke-Expression'
    oh-my-posh font install --user Meslo

    Write-Host "Oh-My-Posh ha sido instalado y configurado."
} else {
    Write-Host "Oh-My-Posh ya está instalado."
}

# Puedes agregar cualquier otra configuración o comandos que necesites aquí
