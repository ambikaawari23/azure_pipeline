erraform {
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
  #source ="git::git@github.com/ambikaawari23/storage_account.git" 
  source = "github.com/ambikaawari23/storage_account//storage_account"
  #resource_group_name = azurerm_resource_group.rg.name
}

# module "key_vault" {
#   source = "git::https://github.com/ambikaawari23/key_vault.git"  
# }

# module "app_insight" {
#   source = "git::https://github.com/ambikaawari23/app_insight.git"  
# }

# module "app_service" {
#   source = "git::https://github.com/ambikaawari23/app_service.git" 
# }

# module "web_app" {
#   source = "git::https://github.com/ambikaawari23/web_app.git"
#}
