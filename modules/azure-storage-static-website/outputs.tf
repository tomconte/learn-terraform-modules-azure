output "website_endpoint" {
  description = "Domain name of the bucket"
  value       = azurerm_storage_account.static_website.primary_web_endpoint
}
