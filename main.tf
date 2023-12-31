locals {
  send_auth_rule_name   = "SendSharedAccessKey"
  listen_auth_rule_name = "ListenSharedAccessKey"
}

resource "azurerm_resource_group" "queue" {
  name     = format("%s-%s-%s", var.environment, var.name, "rg")
  location = var.region
}

resource "azurerm_servicebus_namespace" "queue" {
  name                = format("%s-%s-%s", var.environment, var.name, var.namespace_name)
  location            = azurerm_resource_group.queue.location
  resource_group_name = azurerm_resource_group.queue.name
  sku                 = var.sku_queue_tier
  capacity            = var.sku_queue_tier != "Premium" ? 0 : var.queue_capacity
  local_auth_enabled  = true
  zone_redundant      = var.sku_queue_tier != "Premium" ? false : var.multi_zone_enabled
  tags                = var.tags
}

resource "azurerm_servicebus_queue" "servicebus_queue" {
  depends_on                              = [azurerm_servicebus_namespace.queue]
  name                                    = format("%s-%s-%s", var.environment, var.name, "queue")
  namespace_id                            = azurerm_servicebus_namespace.queue.id
  lock_duration                           = var.lock_duration
  max_delivery_count                      = var.max_delivery_count
  requires_duplicate_detection            = var.duplicate_detection_enabled
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  requires_session                        = var.session_enabled
  max_size_in_megabytes                   = var.max_storage_size
  default_message_ttl                     = "P10675199DT2H48M5.4775807S"
  dead_lettering_on_message_expiration    = true
  auto_delete_on_idle                     = "P10675199DT2H48M5.4775807S"
  enable_partitioning                     = false
  enable_express                          = false
}

resource "azurerm_servicebus_queue_authorization_rule" "send_auth_rule" {
  name     = local.send_auth_rule_name
  queue_id = azurerm_servicebus_queue.servicebus_queue.id
  send     = true
}

resource "azurerm_servicebus_queue_authorization_rule" "listen_auth_rule" {
  name     = local.listen_auth_rule_name
  queue_id = azurerm_servicebus_queue.servicebus_queue.id
  listen   = true
}