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

output "primary_send_connection_string" {
  value       = module.service_bus_queue.primary_send_connection_string
  description = "Primary connection string for send operations"
  sensitive   = true
}

output "secondary_send_connection_string" {
  value       = module.service_bus_queue.secondary_send_connection_string
  description = "Secondary connection string for send operations"
  sensitive   = true
}

output "primary_send_shared_access_key" {
  value       = module.service_bus_queue.primary_send_shared_access_key
  description = "Primary shared access key with send rights"
  sensitive   = true
}

output "secondary_send_shared_access_key" {
  value       = module.service_bus_queue.secondary_send_shared_access_key
  description = "Secondary shared access key with send rights"
  sensitive   = true
}

output "primary_listen_connection_string" {
  value       = module.service_bus_queue.primary_listen_connection_string
  description = "Primary connection string for listen operations"
  sensitive   = true
}

output "secondary_listen_connection_string" {
  value       = module.service_bus_queue.secondary_listen_connection_string
  description = "Secondary connection string for listen operations"
  sensitive   = true
}

output "primary_listen_shared_access_key" {
  value       = module.service_bus_queue.primary_listen_shared_access_key
  description = "Primary shared access key with listen rights"
  sensitive   = true
}

output "secondary_listen_shared_access_key" {
  value       = module.service_bus_queue.secondary_listen_shared_access_key
  description = "Secondary shared access key with listen rights"
  sensitive   = true
}