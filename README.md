# Azure App Service
Terraform module to create Azure App Service

# Usage
```
data "azurerm_resource_group" "rg" {
  name = "RG_Apps"

}


module "appservice" {
  source  = "github.com/iquzart/terraform-azurerm-appservice"

  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  app_service_plan_id      = module.appservice_plan.app_plan_id
  app_name                 = var.app_name     
  container_type           = var.container_type
  container_image          = var.container_image
  container_image_tag      = var.container_image_tag
  container_image_registry = var.container_image_registry
}

```

# Variables
```
variable "resource_group_name" {
  description = "App service resource group name"
  type        = string
  default     = ""
}

variable "location" {
  description = "App service location"
  type        = string
  default     = ""
}

variable "app_name" {
  description = "App service name"
  type        = string
  default     = ""
}

variable "app_service_plan_id" {
  description = "App service plan id"
  type        = string
  default     = ""
}

variable "container_type" {
  description = "Type of container. The options are: `docker`, `compose` or `kube`."
  type        = string
  default     = ""
}

variable "container_image" {
  description = "Container image name. Example: diquzart/flaskapp"
  type        = string
  default     = ""
}

variable "container_image_tag" {
  description = "Container image tag"
  type        = string
  default     = ""
}

variable "container_image_registry" {
  description = "Container image registry"
  type        = string
  default     = "https://index.docker.io"
}

```

# License
MIT
