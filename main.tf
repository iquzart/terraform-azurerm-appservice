# Azure App service

terraform {
  required_version = "> 0.12.0"
}

resource "azurerm_app_service" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  dynamic "site_config" {
    for_each = [var.site_config]

    content {
      always_on                   = lookup(site_config.value, "always_on", null)
      app_command_line            = lookup(site_config.value, "app_command_line", null)
      default_documents           = lookup(site_config.value, "default_documents", null)
      dotnet_framework_version    = lookup(site_config.value, "dotnet_framework_version", null)
      ftps_state                  = lookup(site_config.value, "ftps_state", null)
      health_check_path           = lookup(site_config.value, "health_check_path", null)
      http2_enabled               = lookup(site_config.value, "http2_enabled", null)
      java_container              = lookup(site_config.value, "java_container", null)
      java_container_version      = lookup(site_config.value, "java_container_version", null)
      java_version                = lookup(site_config.value, "java_version", null)
      linux_fx_version            = lookup(site_config.value, "linux_fx_version", null)
      min_tls_version             = lookup(site_config.value, "min_tls_version", null)
      php_version                 = lookup(site_config.value, "php_version", null)
      python_version              = lookup(site_config.value, "python_version", null)
      windows_fx_version          = lookup(site_config.value, "windows_fx_version", null)
    }
  }
  
  app_settings = var.app_settings

  dynamic "connection_string" {
    for_each = var.connection_string
    content {
      name  = lookup(connection_string.value, "name", null)
      type  = lookup(connection_string.value, "type", null)
      value = lookup(connection_string.value, "value", null)
    }
  }

  tags = var.tags

}
