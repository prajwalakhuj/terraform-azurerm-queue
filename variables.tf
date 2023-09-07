variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group."
  default     = ""
}

variable "resource_group_location" {
  type        = string
  description = "The location of the Azure Resource Group."
  default     = ""
}

variable "environment" {
  type        = string
  description = "The environment for the Service Bus components."
  default     = "dev"
}

variable "name" {
  type        = string
  description = "The name for the Service Bus components."
  default     = ""
}

variable "namespace_sku_tier" {
  type        = string
  description = "The SKU tier for the Service Bus namespace."
  default     = "standard"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags for the Service Bus resources."
  default     = {}
}

variable "lock_duration" {
  type        = string
  description = "Message lock duration (ISO-8601)"
  default     = "PT1M"
}

variable "max_delivery_count" {
  type        = number
  description = "Maximum number of attempts to deliver a message before it's sent to dead letter queue"
  default     = 10
}

variable "duplicate_detection_enabled" {
  type        = bool
  description = "Specifies whether the queue should detect duplicate messages (true/false)"
  default     = false
}

variable "duplicate_detection_history_time_window" {
  type        = string
  description = "Time window for duplicate detection history (ISO-8601)"
  default     = "PT10M"
}

variable "session_enabled" {
  type        = bool
  description = "A value that indicates whether the queue requires sessions"
  default     = false
}

variable "max_size_in_megabytes" {
  type        = number
  description = "The maximum size of the queue in megabytes, which is the size of memory allocated for the queue. Default is 1024."
  default     = 1024
}

variable "zone_redundant" {
  type        = bool
  description = "Zones spread for queue server. Only for `Premium` SKU's"
  default     = false
}

variable "capacity" {
  type        = number
  description = "Service Bus SKU `Premium` only supports `capacity` of 1, 2, 4, 8 or 16"
  default     = 1
}