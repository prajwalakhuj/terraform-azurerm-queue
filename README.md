# Azure Service Bus Queue
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This Terraform module provisions an **Azure Service Bus Queue** on Microsoft Azure. Azure Service Bus is a fully managed messaging service in Microsoft Azure that enables you to build distributed and scalable applications. It provides various features and capabilities for messaging and communication between different components of your applications. One of the primary messaging patterns in Azure Service Bus is the use of queues.

### Features:
1. **Asynchronous Messaging:** Azure Service Bus queues allow you to decouple the components of your application by enabling asynchronous communication. Senders and receivers can work independently, and messages are stored in the queue until they are processed.

2. **Reliable Message Delivery:** Service Bus queues ensure reliable message delivery. Messages are stored in the queue until they are explicitly acknowledged by the receiver. If a receiver fails to process a message, it can be retried until it is successfully processed.

3. **At-Least-Once Delivery:** By default, Service Bus queues provide at-least-once message delivery semantics. This means that a message is guaranteed to be delivered to the receiver at least once, but it may be delivered multiple times in case of failures or retries.

4. **Duplicate Detection:** Azure Service Bus includes built-in support for detecting and eliminating duplicate messages. This ensures that even if a message is inadvertently sent multiple times, it will be deduplicated on the receiving end.

5. **Message TTL (Time-to-Live):** You can set a time-to-live (TTL) for messages in the queue. This determines how long a message is retained in the queue before it expires and is removed automatically.

6. **Scheduled Delivery:** Service Bus queues allow you to schedule messages for future delivery. You can specify a specific time when a message should become available for processing.

7. **Batching:** You can send and receive messages in batches to improve efficiency and reduce the number of network round trips. This is particularly useful when dealing with a large volume of messages.

8. **Dead-Letter Queue:** Messages that cannot be successfully processed (e.g., due to errors in processing) are moved to a dead-letter queue (DLQ) for further analysis and troubleshooting.

9. **Partitioning:** Service Bus allows you to partition queues for improved scalability. This helps distribute the workload across multiple message brokers, enabling high-throughput scenarios.

10. **Authorization and Authentication:** Service Bus provides robust security features, including Shared Access Signatures (SAS) and Azure Active Directory (Azure AD) integration, to control access to queues and protect your messages.

11. **Message Properties:** You can attach custom properties and metadata to messages, which can be used for routing, filtering, and other processing logic.

12. **Message Prioritization:** You can set message priority to ensure that certain messages are processed before others, helping to manage the order of message processing.

13. **Auto-Forwarding:** You can configure queues to automatically forward messages to another queue or topic, allowing you to build complex messaging workflows.

14. **Message Sessions:** Service Bus supports message sessions, which allow you to group related messages together and process them sequentially within a session.

15. **Geo-Disaster Recovery:** Azure Service Bus offers geo-disaster recovery capabilities, allowing you to replicate your queues across different Azure regions for high availability and disaster recovery scenarios.

16. **Monitoring and Diagnostics:** Service Bus provides monitoring and diagnostic capabilities through Azure Monitor, allowing you to track the health and performance of your queues and messages.

## Usage Example

```hcl
module "service_bus_queue" {
  source                                  = "squareops/azurerm/queue"
  name                                    = "skaf"
  environment                             = "prod"
  resource_group_location                 = "eastus"
  namespace_sku_tier                      = "Standard"
  lock_duration                           = "PT1M"
  max_delivery_count                      = 10
  duplicate_detection_enabled             = true
  duplicate_detection_history_time_window = "PT10M"
  capacity                                = 2 # Messaging units for "Premium" SKU
  session_enabled                         = true
  zone_redundant                          = true
  max_size_in_megabytes                   = 1024
  tags                                    = { Department = Engineering }
}
```
Refer [examples](https://github.com/squareops/terraform-azurerm-queue/tree/main/examples/complete) for more details

## Permissions

Required permissions to create resources from this module are mentioned [here](https://github.com/squareops/terraform-azurerm-queue/tree/main/roles.md)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_servicebus_namespace.queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_queue.servicebus_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue_authorization_rule.listen_auth_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue_authorization_rule) | resource |
| [azurerm_servicebus_queue_authorization_rule.send_auth_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue_authorization_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Service Bus SKU `Premium` only supports `capacity` of 1, 2, 4, 8 or 16 | `number` | `1` | no |
| <a name="input_duplicate_detection_enabled"></a> [duplicate\_detection\_enabled](#input\_duplicate\_detection\_enabled) | Specifies whether the queue should detect duplicate messages (true/false) | `bool` | `false` | no |
| <a name="input_duplicate_detection_history_time_window"></a> [duplicate\_detection\_history\_time\_window](#input\_duplicate\_detection\_history\_time\_window) | Time window for duplicate detection history (ISO-8601) | `string` | `"PT10M"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment for the Service Bus components. | `string` | `"dev"` | no |
| <a name="input_lock_duration"></a> [lock\_duration](#input\_lock\_duration) | Message lock duration (ISO-8601) | `string` | `"PT1M"` | no |
| <a name="input_max_delivery_count"></a> [max\_delivery\_count](#input\_max\_delivery\_count) | Maximum number of attempts to deliver a message before it's sent to dead letter queue | `number` | `10` | no |
| <a name="input_max_size_in_megabytes"></a> [max\_size\_in\_megabytes](#input\_max\_size\_in\_megabytes) | The maximum size of the queue in megabytes, which is the size of memory allocated for the queue. Default is 1024. | `number` | `1024` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the Service Bus components. | `string` | `""` | no |
| <a name="input_namespace_sku_tier"></a> [namespace\_sku\_tier](#input\_namespace\_sku\_tier) | The SKU tier for the Service Bus namespace. | `string` | `"standard"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the Azure Resource Group. | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Azure Resource Group. | `string` | `""` | no |
| <a name="input_session_enabled"></a> [session\_enabled](#input\_session\_enabled) | A value that indicates whether the queue requires sessions | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for the Service Bus resources. | `map(string)` | `{}` | no |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Zones spread for queue server. Only for `Premium` SKU's | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_primary_listen_connection_string"></a> [primary\_listen\_connection\_string](#output\_primary\_listen\_connection\_string) | Primary connection string for listen operations |
| <a name="output_primary_listen_shared_access_key"></a> [primary\_listen\_shared\_access\_key](#output\_primary\_listen\_shared\_access\_key) | Primary shared access key with listen rights |
| <a name="output_primary_send_connection_string"></a> [primary\_send\_connection\_string](#output\_primary\_send\_connection\_string) | Primary connection string for send operations |
| <a name="output_primary_send_shared_access_key"></a> [primary\_send\_shared\_access\_key](#output\_primary\_send\_shared\_access\_key) | Primary shared access key with send rights |
| <a name="output_queue_name"></a> [queue\_name](#output\_queue\_name) | Name of the service bus queue |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of the resource group |
| <a name="output_secondary_listen_connection_string"></a> [secondary\_listen\_connection\_string](#output\_secondary\_listen\_connection\_string) | Secondary connection string for listen operations |
| <a name="output_secondary_listen_shared_access_key"></a> [secondary\_listen\_shared\_access\_key](#output\_secondary\_listen\_shared\_access\_key) | Secondary shared access key with listen rights |
| <a name="output_secondary_send_connection_string"></a> [secondary\_send\_connection\_string](#output\_secondary\_send\_connection\_string) | Secondary connection string for send operations |
| <a name="output_secondary_send_shared_access_key"></a> [secondary\_send\_shared\_access\_key](#output\_secondary\_send\_shared\_access\_key) | Secondary shared access key with send rights |
| <a name="output_service_bus_namespace"></a> [service\_bus\_namespace](#output\_service\_bus\_namespace) | Name of the service bus queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribute & Issue Report

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/squareops/terraform-azurerm-queue/issues) on GitHub
  2. Search to check if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Make sure to provide enough context and details.

## License

Apache License, Version 2.0, January 2004 (https://www.apache.org/licenses/LICENSE-2.0)

## Support Us

To support our GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository](https://github.com/squareops/terraform-azurerm-servicebus)

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Staring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).