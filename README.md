# Azure App Service

Terraform module to create Azure App Service

## Usage
```
data "azurerm_resource_group" "rg" {
  name = "RG_Apps"

}

module "appservice_plan" {
  source  = "github.com/iquzart/terraform-azurerm-appservice-plan"

  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  name                = var.appservice_plan_name
  kind                = var.kind
  tier                = var.tier
  size                = var.size
  tags                = var.tags
}

module "appservice" {
  source  = "github.com/iquzart/terraform-azurerm-appservice"

  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  app_service_plan_id      = module.appservice_plan.app_plan_id
  app_name                 = var.app_name     

  site_config = {
    linux_fx_version = "docker|diquzart/go-app:latest"
    always_on        = true
    http2_enabled    = true
    min_tls_version  = 1.2  
  }


  app_settings = { 
    "BANNER"   = var.appbanner, 
    "PORT"     = var.app_port 
    }
  
  connection_string = [{
    name            =  "database"
    type            =  "MySQL"
    value           =  "xxxxxxx.xxxxxxxx.xx"
  }]
  
  tags              = var.tags
}


```

## Input Variables
| Name |	Description |	Type |	Default |	Required |
|---|---|---|---|---|
| resource_group_name  | The name of the resource group in which to create the App Service Plan component. | string  | na | yes |
| location | Specifies the supported Azure location where the resource exists.  | string | na | yes |
| app_name | (Required) Specifies the name of the App Service | string | na | yes |
| app_service_plan_id | (Required) Specifies the name of the App Service plan | string | na | yes |
| app_settings | (Optional) A key-value pair of App Settings | map(string) | na | no |
| site_config | (Optional) A site_config block. | any | {} | yes |
| connection_string | (Optional) One or more connection_string | list(map(string)) | [] | no |
| tags | (Optional) A mapping of default tags to assign to the resource | map(string) | na | no |



## License
MIT

## Author Information
Muhammed Iqbal <iquzart@hotmail.com>
