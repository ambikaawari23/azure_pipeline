terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.18.0"
    }
  }
}

provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "rg" {
  name     = "aa_resource_group_23"
  location = "West Europe"
}

module "storage_account" {
  source ="git::https://github.com/ambikaawari23/storage_account.git"
  #resource_group_name = azurerm_resource_group.rg.name
}

module "key_vault" {
  source = "git::https://github.com/ambikaawari23/key_vault.git"
  resource_group_name = azurerm_resource_group.rg.name
}

module "app_insight" {
  source = "git::https://github.com/ambikaawari23/app_insight.git"
  resource_group_name = azurerm_resource_group.rg.name
}

module "app_service" {
  source = "git::https://github.com/ambikaawari23/app_service.git"
  resource_group_name = azurerm_resource_group.rg.name
}

module "web_app" {
  source = "git::https://github.com/ambikaawari23/web_app.git"
  resource_group_name = azurerm_resource_group.rg.name
}
