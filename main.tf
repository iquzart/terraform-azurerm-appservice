# # Azure App service

resource "azurerm_app_service" "app" {
  name                = var.app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "${var.container_type}|${var.container_image}:${var.container_image_tag}"
    always_on        = true
  }


  app_settings = {
    "PORT" = "8080"
    "DOCKER_REGISTRY_SERVER_URL"  = var.container_image_registry
  }

}
