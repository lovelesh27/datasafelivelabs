# datasafelivelabs
Code for OCI Datasafe LiveLabs.
Clone this repo and update the variables in terraform.tfvars file to point to your OCI tenancy. Also setup paths for public keys by whose private key you want to access the created instances, update the code in files dbinstance-marketplace.tf and compute.tf. This code will setup all the required OCI resources and database. After this, you need to configure the database and datasafe connector.
