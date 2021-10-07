
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "compartment_id" {}
variable "private_key_path" {}
variable "fingerprint" {}
variable "region" {}
variable "hostname_1" {}
variable "sql_shape" {}
variable "instance_fault_domain_1" {}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid = var.user_ocid
  private_key_path = var.private_key_path
  fingerprint = var.fingerprint
  region = var.region
}