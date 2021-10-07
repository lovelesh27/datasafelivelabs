
/*
    Resource Elements
*/
resource "oci_marketplace_accepted_agreement" "test_accepted_agreement" {
  #Required
  agreement_id    = oci_marketplace_listing_package_agreement.test_listing_package_agreement.agreement_id
  compartment_id  = var.compartment_id
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version
  signature       = oci_marketplace_listing_package_agreement.test_listing_package_agreement.signature
}
resource "oci_marketplace_listing_package_agreement" "test_listing_package_agreement" {
  #Required
  agreement_id    = data.oci_marketplace_listing_package_agreements.test_listing_package_agreements.agreements[0].id
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version
}
/*
    Data Elements
*/
data "oci_marketplace_listing_package_agreements" "test_listing_package_agreements" {
  #Required
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version

  #Optional
  compartment_id = var.compartment_id
}
data "oci_marketplace_listing_package" "test_listing_package" {
  #Required
  listing_id      = data.oci_marketplace_listing.test_listing.id
  package_version = data.oci_marketplace_listing.test_listing.default_package_version

  #Optional
  compartment_id = var.compartment_id
}
data "oci_marketplace_listing_packages" "test_listing_packages" {
  #Required
  listing_id = data.oci_marketplace_listing.test_listing.id

  #Optional
  compartment_id = var.compartment_id
}
data "oci_marketplace_listing" "test_listing" {
  listing_id     = data.oci_marketplace_listings.test_listings.listings[1].id
  compartment_id = var.compartment_id
}
data "oci_marketplace_listings" "test_listings" {
  name = ["Oracle Database"]
  compartment_id = var.compartment_id
}
data "oci_core_app_catalog_listing_resource_version" "test_catalog_listing" {
  listing_id = data.oci_marketplace_listing_package.test_listing_package.app_catalog_listing_id
  resource_version = data.oci_marketplace_listing_package.test_listing_package.app_catalog_listing_resource_version
}
/*
    Compute Resources
*/
resource "oci_core_instance" "SQLA" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  fault_domain        = var.instance_fault_domain_1
  compartment_id      = var.compartment_id
  display_name        = var.hostname_1
  shape               = var.sql_shape
  create_vnic_details {
        assign_public_ip = false
        subnet_id = oci_core_subnet.vcn-private-subnet.id
  }
  metadata = {
    ssh_authorized_keys = file("") #path to instance public key by whose private key you want to ssh it
  }
  source_details {
    source_id   = data.oci_core_app_catalog_listing_resource_version.test_catalog_listing.listing_resource_id
    source_type = "image"
  }
  lifecycle {
    ignore_changes = [
      source_details[0].source_id,
    ]
  }
}