# Azure App Service
Terraform module to create Azure App Service

# Usage
```
data "azurerm_resource_group" "rg" {
  name = "RG_Apps"

}


module "appservice" {
  source  = "github.com/iquzart/terraform-azurerm-appservice"
  #version = "0.x.y"


}

```

# Variables
```
# Azure App service Plan

variable "app_name" {
  description = "Web App name"
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
