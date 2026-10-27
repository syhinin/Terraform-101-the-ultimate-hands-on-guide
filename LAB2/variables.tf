terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>5.11.0"
    }
  }
}

# Configure the Microsoft Azure Provider it required
provider "azurerm" {
  features {}
}