
module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.0.0"

  # Required
  compartment_id = var.compartment_id
  region = "us-ashburn-1"
  vcn_name = "dsl-labs-vcn"
  vcn_dns_label = "dsllabs"
  internet_gateway_route_rules = []
  nat_gateway_route_rules = []
  local_peering_gateways  = {}

  # Optional
  create_internet_gateway = true
  create_nat_gateway = true
  create_service_gateway = true
  vcn_cidrs = [ "10.0.0.0/16" ]
}