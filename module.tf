
terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.12.0"
    }
  }
}

 provider "acme" {
   server_url = "https://acme-v02.api.letsencrypt.org/directory"
 }

#  Generate a private key for registration in PEM format
 resource "tls_private_key" "reg_private_key" {
   algorithm = var.algorithm
 }

 #Generate a private key for certificate registration in PEM format
 resource "tls_private_key" "cert_private_key" {
   algorithm = var.algorithm
 }

 # Creates an account on the ACME server using the private key and an email
 resource "acme_registration" "reg" {
   account_key_pem = tls_private_key.reg_private_key.private_key_pem
   email_address   = var.email
 }

 # As the certificate will be generated in PFX a password is required
 resource "random_password" "cert" {
   length  = 24
   special = true
 }

# resource "tls_cert_request" "req" {
#   key_algorithm   = var.algorithm
#   private_key_pem = tls_private_key.cert_private_key.private_key_pem
#   dns_names       = var.dns_names

#   subject {
#     common_name = var.common_name
#   }
# }


 # Gets a certificate from the ACME server
 resource "acme_certificate" "cert" {
   account_key_pem          = acme_registration.reg.account_key_pem
  common_name               = var.common_name
  subject_alternative_names = [var.dns_names]

   dns_challenge {
   #   Many providers are supported for the DNS challenge, we are using Azure DNS here
     provider = var.dns_provider

     config = {
   #     Some arguments are passed here but it's not enough to let the provider access the zone in Azure DNS.
   #    Other arguments (tenant id, subscription id, and cient id/secret) must be set through environment variables.
       AZURE_RESOURCE_GROUP = var.dnszone_rg_name
       AZURE_ZONE_NAME      = var.dnszone_name
       AZURE_TTL            = 300
       ARM_TENANT_ID        = var.arm_tenant_id
       ARM_SUBSCRIPTION_ID  = var.arm_subsription_id
       ARM_CLIENT_ID        = var.arm_client_id
       ARM_CLIENT_SECRET    = var.arm_client_secret
     }
   }
 }

