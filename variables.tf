variable "dns_servers" {
    type = map(any)
    description = "A list of DNS servers to be used with subnets."
}

variable "subnet_names" {
    type = list(string)
    default = ["subnet1", "subnet2", "subnet3"]
    description = "A list of subnets inside the network."
}

variable "subnet_prefixes" {
    type = list(string)
    default = ["10.0.1.0/24"]
    description = "The address prefix to use for the subnet."
}

variable "tags" {
    type = map(string)
    default = { "ENV" : "test"}
    description = "The tags to associate with your network and subnets."
}

variable "vnet_name" {
    type = string
    default = "acctvnet"
    description = "The name of the vnet module. This is also the name of the network."
}

variable "external_network_name" {
  type        = string
  description = "The name of the external network to be attached to the router."
}
