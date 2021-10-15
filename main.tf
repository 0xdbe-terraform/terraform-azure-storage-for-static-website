resource "random_integer" "main" {
  min     = 1
  max     = 999
}

# Azure Storage account
resource azurerm_storage_account main {
  name                      = "st${substr("${lower(var.application_short_name)}${lower(var.storage_account_purpose)}",0,20)}${format("%000d",random_integer.main.result)}"
  resource_group_name       = var.resource_group_name
  location                  = var.azure_location
  account_tier              = var.storage_account_tier
  account_kind              = "StorageV2"
  account_replication_type  = var.storage_account_replication_type
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"

  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }

}