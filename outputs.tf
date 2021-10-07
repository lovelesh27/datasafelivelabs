# Outputs for the vcn module

output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}
output "id-for-route-table-that-includes-the-internet-gateway" {
  description = "OCID of the internet-route table. This route table has an internet gateway to be used for public subnets"
  value = module.vcn.ig_route_id
}
output "nat-gateway-id" {
  description = "OCID for NAT gateway"
  value = module.vcn.nat_gateway_id
}
output "id-for-for-route-table-that-includes-the-nat-gateway" {
  description = "OCID of the nat-route table - This route table has a nat gateway to be used for private subnets. This route table also has a service gateway."
  value = module.vcn.nat_route_id
}

# Outputs for private security list

output "private-security-list-name" {
  value = oci_core_security_list.private-security-list.display_name
}
output "private-security-list-OCID" {
  value = oci_core_security_list.private-security-list.id
}

# Outputs for public security list

output "public-security-list-name" {
  value = oci_core_security_list.public-security-list.display_name
}
output "public-security-list-OCID" {
  value = oci_core_security_list.public-security-list.id
}


# Outputs for private subnet

output "private-subnet-name" {
  value = oci_core_subnet.vcn-private-subnet.display_name
}
output "private-subnet-OCID" {
  value = oci_core_subnet.vcn-private-subnet.id
}


# Outputs for public subnet

output "public-subnet-name" {
  value = oci_core_subnet.vcn-public-subnet.display_name
}
output "public-subnet-OCID" {
  value = oci_core_subnet.vcn-public-subnet.id
}


# Outputs for DHCP Options

output "dhcp-options-name" {
  value = oci_core_dhcp_options.dhcp-options.display_name
}
output "dhcp-options-OCID" {
  value = oci_core_dhcp_options.dhcp-options.id
}



output "instance-name" {
  value = oci_core_instance.oracle_instance.display_name
}

output "instance-OCID" {
  value = oci_core_instance.oracle_instance.id
}

output "instance-region" {
  value = oci_core_instance.oracle_instance.region
}

output "instance-shape" {
  value = oci_core_instance.oracle_instance.shape
}

output "instance-state" {
  value = oci_core_instance.oracle_instance.state
}

output "instance-OCPUs" {
  value = oci_core_instance.oracle_instance.shape_config[0].ocpus
}

output "instance-memory-in-GBs" {
  value = oci_core_instance.oracle_instance.shape_config[0].memory_in_gbs
}

output "time-created" {
  value = oci_core_instance.oracle_instance.time_created
}

# Output for connector

output "connector-ocid" {
  value = oci_data_safe_on_prem_connector.datasafe-livelabs-prem-connector.id
}