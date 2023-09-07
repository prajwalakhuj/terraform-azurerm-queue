# Azure Service Bus Queue
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This Terraform module provisions an **Azure Service Bus Queue** on Microsoft Azure. Azure Service Bus is a fully managed messaging service in Microsoft Azure that enables you to build distributed and scalable applications. It provides various features and capabilities for messaging and communication between different components of your applications. One of the primary messaging patterns in Azure Service Bus is the use of queues.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_bus_queue"></a> [service\_bus\_queue](#module\_service\_bus\_queue) | sqaureops/azurerm/queue | n/a |

## Resources

No resources.

## Inputs

No inputs.

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