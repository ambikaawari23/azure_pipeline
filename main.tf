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
  name     = "aa-rg-23-${var.location}"
  location = "West Europe"
}

module "storage_account" {
  source ="./storage_account"
  url = "git@github.com/ambikaawari23/storage_account.git"
  resource_group_name = azurerm_resource_group.rg.name
}

# module "key_vault" {
#   source = "./modules/key_vault"
#   resource_group_name = azurerm_resource_group.rg.name
# }

# module "app_insight" {
#   source = "./modules/app_insight"
#   resource_group_name = azurerm_resource_group.rg.name
# }

# module "app_service" {
#   source = "./modules/app_service"
#   resource_group_name = azurerm_resource_group.rg.name
# }

# module "web_app" {
#   source = "./modules/web_app"
#   resource_group_name = azurerm_resource_group.rg.name
# }
