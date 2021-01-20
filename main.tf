# # Azure App service

resource "azurerm_app_service" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  
  site_config {
    linux_fx_version = "${var.container_type}|${var.container_image}:${var.container_image_tag}"
    always_on        = true
    http2_enabled    = true
  }


  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"  = var.container_image_registry
    "PORT"                        = "8080"
  }

  tags = var.tags

}
