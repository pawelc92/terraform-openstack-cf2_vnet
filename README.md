# CF2 vNet

This Terraform module deploys a network with a subnet or a set of subnets passed in as input parameters.

## Example Usage

### Basic network with multiple subnets

```hcl
module "vnet" {
    source = "pawelc92/cf2_vnet/openstack"

    vnet_name = "cf2_vnet"
    subnet_names = ["subnet-1", "subnet-2", "subnet-3"]
    subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    dns_servers = {
        subnet-1 = ["185.48.234.234", "185.48.234.238"]
        subnet-2 = ["8.8.8.8", "8.8.4.4"]
        subnet-3 = ["1.1.1.1", "1.0.0.1"]
    }
    external_network_name = "external3"
}
```