
module "lets_encrypt_certificate" {
  source                = "../"
  algorithm             = var.algorithm
  email                 = var.email
  password_len          = var.password_len
  common_name           = var.common_name
  dns_names             = var.dns_names 
  dnszone_name          = var.dnszone_name
  dnszone_rg_name       = var.dnszone_rg_name
  arm_tenant_id         = var.arm_tenant_id
  arm_subsription_id    = var.arm_subsription_id
  arm_client_id         = var.arm_client_id
  arm_client_secret     = var.arm_client_secret
}