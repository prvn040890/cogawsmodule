/*terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraformstorage"
    storage_account_name = "terraformstategd"
    container_name       = "terraformtfstate"
    key                  = "project"
  }
}


#configure the azure provider
provider "azurerm" {
  features {}
}*/