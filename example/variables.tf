variable "algorithm" {
  type =  string
  default = "RSA"
}

 variable "email" {
   type = string
 }

 variable "password_len" {
   type = number
   default = 24
 }

 variable "common_name" {
     type = string
 }

variable "dns_names" {
  type    = list(string)
  default = null
}

variable "dns_provider" {
    type = string
  default = "azure"
}


  variable "dnszone_rg_name" {
   type = string
 }

 variable "dnszone_name" {
     type = string
 }

 variable "arm_tenant_id" {
   type = string
 }

  variable "arm_subsription_id" {
   type = string
 }

  variable "arm_client_id" {
   type = string
 }

  variable "arm_client_secret" {
   type = string
 }