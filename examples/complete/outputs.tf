output "service_bus_namespace" {
  value       = module.service_bus_queue.service_bus_namespace
  description = "Name of the service bus queue"
}

output "resource_group_name" {
  value       = module.service_bus_queue.resource_group_name
  description = "Name of the resource group"
}

output "queue_name" {
  value       = module.service_bus_queue.queue_name
  description = "Name of the service bus queue"
}