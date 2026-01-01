provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "project_rg" {
  name     = "DataScience-Project-RG"
  location = "UK South"
}

resource "azurerm_storage_account" "storage" {
  name                     = "ayorindedatastorage" # must be globally unique
  resource_group_name      = azurerm_resource_group.project_rg.name
  location                 = azurerm_resource_group.project_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_blob_public_access = false
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "data_container" {
  name                  = "ingested-data"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}