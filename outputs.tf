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