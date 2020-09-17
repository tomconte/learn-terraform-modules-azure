variable "storage_account_name" {
  description = "Name of the storage account. Must be unique."
  type        = string
}

variable "resource_group_name" {
  description = "Storage account name."
  type        = string
}

variable "location" {
  description = "Location where the storage account will be created."
  type        = string
}
