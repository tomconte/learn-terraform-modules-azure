output "vnet_subnets" {
  description = "IDs of the VNet's subnets"
  value       = module.vnet.vnet_subnets
}

output "nic_ids" {
  description = "IDs of the VM's NICs"
  value       = module.linuxservers.network_interface_ids
}

output "public_ip_address" {
  description = "Public IP address of the first VM"
  value       = module.linuxservers.public_ip_address
}

output "website_endpoint" {
  description = "Domain name of the website"
  value       = module.azure-storage-static-website.website_endpoint
}
