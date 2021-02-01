# Azure App service

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the App Service"
  type        = string
  default     = ""
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists"
  type        = string
  default     = ""
}

variable "app_name" {
  description = "(Required) Specifies the name of the App Service"
  type        = string
  default     = ""
}

variable "app_service_plan_id" {
  description = "(Required) Specifies the name of the App Service plan"
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) A mapping of default tags to assign to the resource"
  type        = map(string)
}

variable "app_settings" {
  description = "(Optional) A key-value pair of App Settings"
  type        = map(string)
  default     = {}
}

variable "site_config" {
  description = "(Optional) A site_config block."
  type        = any
  default     = {}
}

variable "connection_string" {
  description = "(Optional) One or more connection_string"
  type        = list(map(string))
  default     = []
}