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
  source                                  = "squareops/azurerm/queue"
  name                                    = local.name
  environment                             = local.environment
  namespace_name                          = "ns" # Service bus queue namespace.
  region                                  = local.region
  sku_queue_tier                          = "Standard" # There are three types of tiers "Basic", "Standard" & "Premium"
  lock_duration                           = "PT1M"
  max_delivery_count                      = 10
  duplicate_detection_enabled             = true
  duplicate_detection_history_time_window = "PT10M"
  queue_capacity                          = 2 # Messaging units for "Premium" SKU
  session_enabled                         = true
  multi_zone_enabled                      = true
  max_storage_size                        = 1024 # in megabytes
  tags                                    = local.additional_tags
}