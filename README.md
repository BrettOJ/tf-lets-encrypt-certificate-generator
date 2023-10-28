# Introduction

This Terraform module is used to generate a Let-Encrypt SSL certificate and adds it the Azure Keyvault specified

# Getting Started

To get started there is a requirement to have the following in place

1. Registered Domain name for the web site URL
2. Public Azure DNS for the Domain name
3. Azure Key Vault deployed in the subscription specified in main.tf
4. AKV access to be able to add the certificate
5. Azure remote state for the AKV specified in the main.tf file

# Build and Test

1. When this terraform is applied, the code will add a DNS entry into the DNS zone to verify domain ownership
2. The code will then use letes encrypt to generate the certificate and save it as cert.pem file
3. The code will the add the certificate the Azure Key Vault in the certificates section

# Contribute

Feel free to contribute it there are any updates required or fixes.