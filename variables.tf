variable "admin_username" {
  description = "Admin user name"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password"
  type        = string
}

variable "rg_name" {
  description = "Name of Resource Group"
  type        = string
  default     = "tf-example"
}

variable "location" {
  description = "Location of deployment"
  type        = string
  default     = "westeurope"
}

variable "address_space" {
  description = "CIDR block for VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vnet_subnets" {
  description = "Subnets for VNet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vnet_subnets_names" {
  description = "Subnet names for VNet"
  type        = list(string)
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}
