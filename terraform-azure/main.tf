terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "devops_challenge_rsg"
  location = "East US"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "devopschallengestg"
  resource_group_name      = "devops_challenge_rsg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.resource_group]

  static_website {
    index_document = "index.html"
  }
}

locals {
  mime_types = jsondecode(file("../mime.json"))
}

resource "azurerm_storage_blob" "storage_blob" {
  for_each = fileset("../calculator/build/", "*")

  name = "${each.value}"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  source = "../calculator/build/${each.value}"
  content_type =  lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}

resource "azurerm_storage_blob" "storage_blob_css" {
  for_each = fileset("../calculator/build/static/css", "*")

  name = "static/css/${each.value}"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  source = "../calculator/build/static/css/${each.value}"
  content_type =  lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}

resource "azurerm_storage_blob" "storage_blob_js" {
  for_each = fileset("../calculator/build/static/js", "*")

  name = "static/js/${each.value}"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  source = "../calculator/build/static/js/${each.value}"
  content_type =  lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}