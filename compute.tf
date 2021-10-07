# Creating a compute instance
resource "oci_core_instance" "oracle_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaab3w3vzjenuyy3idksenczspj77wz74o7unpxid6xr7zmsyi7u47q" # OCID for Oracle Linux
        source_type = "image"
    }

    # Optional
    display_name = "terraform-instance"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("") #path to instance public key by whose private key you want to ssh it
    } 
    preserve_boot_volume = false
}