variable "openstack_neutron_config_version" {
  description = <<EOF
(internal) This declares the version of the OpenStack Neutron configuration variables.
It has no impact on generated assets but declares the version contract of the configuration.
EOF

  default = "1.0"
}

variable "openstack_master_flavor_name" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor name for master instances as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_master_flavor_name or openstack_master_flavor_id.
EOF
}

variable "openstack_worker_flavor_name" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor name for worker instances as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_worker_flavor_name or openstack_worker_flavor_id.
EOF
}

variable "openstack_bastion_flavor_name" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor name for the bastion instance as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_bastion_flavor_name or openstack_bastion_flavor_id.
EOF
}

variable "openstack_edge_flavor_name" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor name for the edge instance as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_edge_flavor_name or openstack_edge_flavor_id.
EOF
}

variable "openstack_master_flavor_id" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor id for master instances as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_master_flavor_name or openstack_master_flavor_id.
EOF
}

variable "openstack_worker_flavor_id" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor id for worker instances as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_worker_flavor_name or openstack_worker_flavor_id.
EOF
}

variable "openstack_bastion_flavor_id" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor id for bastion instances as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_bastion_flavor_name or openstack_bastion_flavor_id.
EOF
}

variable "openstack_edge_flavor_id" {
  type    = "string"
  default = ""

  description = <<EOF
The flavor id for edge instances as given in `openstack flavor list`. Specifies the size (CPU/Memory/Drive) of the VM.

Note: Set either openstack_edge_flavor_name or openstack_edge_flavor_id.
EOF
}

variable "openstack_image_name" {
  type    = "string"
  default = ""

  description = <<EOF
The image ID as given in `openstack image list`. Specifies the OS image of the VM.

Note: Set either openstack_image_name or openstack_image_id.
EOF
}

variable "openstack_image_id" {
  type    = "string"
  default = ""

  description = <<EOF
The image ID as given in `openstack image list`. Specifies the OS image of the VM.

Note: Set either openstack_image_name or openstack_image_id.
EOF
}

variable "openstack_external_gateway_id" {
  type = "string"

  description = <<EOF
The ID of the network to be used as the external internet gateway as given in `openstack network list`.
EOF
}

variable "openstack_floatingip_pool" {
  type    = "string"
  default = "public"

  description = <<EOF
The name name of the floating IP pool
as given in `openstack floating ip list`.
This pool will be used to assign floating IPs to worker and master nodes.
EOF
}

variable "openstack_subnet_cidr" {
  type    = "string"
  default = "192.168.1.0/24"

  description = <<EOF
The subnet CIDR for the master/worker/etcd compute nodes.
This CIDR will also be assigned to the created the OpenStack subnet resource.
EOF
}

variable "openstack_dns_nameservers" {
  type    = "list"
  default = []

  description = <<EOF
The DNS servers assigned to the generated OpenStack subnet resource.
EOF
}

variable "openstack_availabilityzone" {
  type    = "string"
  default = ""

  description = <<EOF
The AZ assigned to the generated OpenStack resource.
EOF
}



