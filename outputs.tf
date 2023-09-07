output "service_bus_namespace" {
  value       = azurerm_servicebus_namespace.queue.name
  description = "Name of the service bus queue"
  sensitive   = false
}

output "resource_group_name" {
  value       = azurerm_resource_group.queue.name
  description = "Name of the resource group"
  sensitive   = false
}

output "queue_name" {
  value       = azurerm_servicebus_queue.servicebus_queue.name
  description = "Name of the service bus queue"
  sensitive   = false
}

output "primary_send_connection_string" {
  value       = azurerm_servicebus_queue_authorization_rule.send_auth_rule.primary_connection_string
  description = "Primary connection string for send operations"
  sensitive   = false
}

output "secondary_send_connection_string" {
  value       = azurerm_servicebus_queue_authorization_rule.send_auth_rule.secondary_connection_string
  description = "Secondary connection string for send operations"
  sensitive   = false
}

output "primary_send_shared_access_key" {
  value       = azurerm_servicebus_queue_authorization_rule.send_auth_rule.primary_key
  description = "Primary shared access key with send rights"
  sensitive   = false
}

output "secondary_send_shared_access_key" {
  value       = azurerm_servicebus_queue_authorization_rule.send_auth_rule.secondary_key
  description = "Secondary shared access key with send rights"
  sensitive   = false
}

output "primary_listen_connection_string" {
  value       = azurerm_servicebus_queue_authorization_rule.listen_auth_rule.primary_connection_string
  description = "Primary connection string for listen operations"
  sensitive   = false
}

output "secondary_listen_connection_string" {
  value       = azurerm_servicebus_queue_authorization_rule.listen_auth_rule.secondary_connection_string
  description = "Secondary connection string for listen operations"
  sensitive   = false
}

output "primary_listen_shared_access_key" {
  value       = azurerm_servicebus_queue_authorization_rule.listen_auth_rule.primary_key
  description = "Primary shared access key with listen rights"
  sensitive   = false
}

output "secondary_listen_shared_access_key" {
  value       = azurerm_servicebus_queue_authorization_rule.listen_auth_rule.secondary_key
  description = "Secondary shared access key with listen rights"
  sensitive   = false
}