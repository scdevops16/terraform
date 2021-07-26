variable "storage_account_name" {
    type = string
    default="terappstore160011"
}
variable "resource_group_name" {
    type = string
    default="terraform_rg_group3"
}
provider "azurerm" {
    version = "~> 2.0"
    subscription_id ="dc1f8bc4-0d4f-4420-a0b7-66d364ab623e"
    tenant_id ="3f0a80e7-60a5-480b-bcb5-0e160cf77612"
    features {}
}
resource "azurerm_resource_group" "grp" {
    name = var.resource_group_name
    location = "North Europe"
}
resource "azurerm_storage_account" "store10" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.grp.name
  location                 = azurerm_resource_group.grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
    
}
