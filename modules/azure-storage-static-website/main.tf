resource "azurerm_storage_account" "static_website" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document     = "index.html"
    error_404_document = "error.html"
  }
}

resource "azurerm_storage_blob" "index_file" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.static_website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = var.index_file
  content_type           = "text/html"
}

resource "azurerm_storage_blob" "error_file" {
  name                   = "error.html"
  storage_account_name   = azurerm_storage_account.static_website.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = var.error_file
  content_type           = "text/html"
}
