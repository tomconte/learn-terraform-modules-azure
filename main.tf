terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.27"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "vnet" {
  source  = "Azure/network/azurerm"
  version = "3.2.1"

  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
  subnet_prefixes     = var.vnet_subnets
  subnet_names        = var.vnet_subnets_names

  depends_on = [azurerm_resource_group.rg]
}

module "linuxservers" {
  source  = "Azure/compute/azurerm"
  version = "3.6.0"

  resource_group_name = azurerm_resource_group.rg.name
  vm_os_simple        = "UbuntuServer"
  vnet_subnet_id      = module.vnet.vnet_subnets[0]
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  depends_on = [azurerm_resource_group.rg]
}

module "azure-storage-static-website" {
  source               = "./modules/azure-storage-static-website"
  storage_account_name = "tcostaticweb"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.location
  index_file           = "www/index.html"
  error_file           = "www/error.html"
}
