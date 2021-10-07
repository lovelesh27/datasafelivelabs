
resource "oci_data_safe_on_prem_connector" "datasafe-livelabs-prem-connector" {
    #Required
    compartment_id = var.compartment_id

    #Optional
    description = "Created through Terraform for DataSafe LiveLabs"
    display_name = "datasafe-livelabs"
    freeform_tags = {"CreatedBy"= "Automation"}
}