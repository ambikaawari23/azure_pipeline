terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.18.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "storage001"
    storage_account_name = "stg22111"
    container_name       = "stss"
    key                  = "azure_terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "rg" {
  name     = "aa-resouce_name"
  location = "West Europe"
}

module "storage_account" { 
  source = "github.com/ambikaawari23/storage_account//storage_account"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

module "key_vault" {
  source = "github.com/ambikaawari23/key_vault//key_vault" 
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

module "app_insight" {
  source = "github.com/ambikaawari23/app_insight//app_insight" 
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

module "app_service" {
  source = "github.com/ambikaawari23/app_service//app_service"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

module "web_app" {
  source = "github.com/ambikaawari23/web_app//web_app"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}
