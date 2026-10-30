terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>5.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.9.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-my101app-prod"
    storage_account_name = "st3d1tvatl16"  # storage account name for rg-my101app-prod
    container_name       = "tfstate"
    key                  = "observability-prod"      # Have to be unique for each environment and application
  }
}

# Configure the Microsoft Azure Provider it required
provider "azurerm" {
  features {}
}
