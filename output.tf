# Azure App service

output "app_service_name" {
  description = "Name of the App Service"
  value       = azurerm_app_service.app.name
}

output "app_service_default_site_hostname" {
  description = "The Default Hostname associated with the App Service"
  value       = azurerm_app_service.app.default_site_hostname
}


