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

module "resource_group"{
  source ="git::https://github.com/ambikaawari23/resource_group.git"
}

module "storage_account" {
  source ="git::https://github.com/ambikaawari23/storage_account.git" 
}

module "key_vault" {
  source = "git::https://github.com/ambikaawari23/key_vault.git"  
}

module "app_insight" {
  source = "git::https://github.com/ambikaawari23/app_insight.git"  
}

module "app_service" {
  source = "git::https://github.com/ambikaawari23/app_service.git" 
}

module "web_app" {
  source = "git::https://github.com/ambikaawari23/web_app.git"
}
