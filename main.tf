resource "openstack_networking_network_v2" "network" {
    name = var.vnet_name
    admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
    count = length(var.subnet_prefixes)
    name = var.subnet_names[count.index]
    network_id = openstack_networking_network_v2.network.id
    cidr = var.subnet_prefixes[count.index]
    ip_version = 4
    dns_nameservers = lookup(var.dns_servers, var.subnet_names[count.index])
}

data "openstack_networking_network_v2" "external_network" {
  name = var.external_network_name
}

resource "openstack_networking_router_v2" "router" {
  name                = "${var.vnet_name}_router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.external_network.id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  count     = length(var.subnet_prefixes)
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet[count.index].id
}