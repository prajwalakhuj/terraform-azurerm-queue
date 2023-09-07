locals {
  region      = "eastus"
  name        = "skaf"
  environment = "prod"
  additional_tags = {
    Owner      = "Organization_Name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "service_bus_queue" {
  source                                  = "sqaureops/azurerm/queue"
  name                                    = local.name
  environment                             = local.environment
  resource_group_location                 = local.region
  namespace_sku_tier                      = "Standard"
  lock_duration                           = "PT1M"
  max_delivery_count                      = 10
  duplicate_detection_enabled             = true
  duplicate_detection_history_time_window = "PT10M"
  capacity                                = 2 # Messaging units for "Premium" SKU
  session_enabled                         = true
  zone_redundant                          = true
  max_size_in_megabytes                   = 1024
  tags                                    = local.additional_tags
}