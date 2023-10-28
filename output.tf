
  output "cert_output" {
  value = resource.acme_certificate.cert
  sensitive = true
}

  output "password_output" {
  value = resource.random_password.cert
  sensitive = true
}