output "vnet_network_id" {
    value = openstack_networking_network_v2.network.id
    description = "The ID of newly created network."
}

output "vnet_network_name" {
    value = openstack_networking_network_v2.network.name
    description = "The name of newly created network."
}

output "vnet_subnets" {
    value = openstack_networking_subnet_v2.subnet
    description = "Details of all created subnets."
}

output "vnet_router_id" {
    value = openstack_networking_router_v2.router.id
    description = "The ID of newly created router."
}

output "vnet_router_name" {
    value = openstack_networking_router_v2.router.name
    description = "The name of newly created router."
}