variable "azure_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource in Azure (default: 'eastus', less expensive location)"
}

variable "application_full_name" {
  type        = string
  description = "Name of your project, application, product or service."
}

variable "application_short_name" {
  type        = string
  description = "Short name of your application using abbreviations or acronyms."
  validation {
    condition     = can(regex("^\\w+$", var.application_short_name))
    error_message = "Application short name can only consist of letters and numbers."
  }
}

variable "application_environment" {
  type        = string
  default     = "prod"
  description = "Name of the environment (example: dev, test, prod, ...)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Ressource Group in which the storage will be"
}

variable "storage_account_purpose" {
  type        = string
  description = "Usage of this storage (example: terraform, frontend, file, ...)."
  default     = ""
  validation {
    condition     = length(var.storage_account_purpose) == 0 || can(regex("^\\w+$", var.storage_account_purpose))
    error_message = "Storage account purpose can only consist of letters and numbers."
  }
}

variable "storage_account_tier" {
  type        = string
  description = "Princing tier of the storage account"
  default     = "Standard"

  validation {
    condition     = contains(["Standard","Premium"],var.storage_account_tier)
    error_message = "Valid options for account tier are Standard or Premium."
  }
}

variable "storage_account_replication_kind" {
  type        = string
  description = "Define storage account kind."
  default     = "StorageV2"
  validation {
    condition     = contains(["BlobStorage","BlockBlobStorage","FileStorage","Storage","StorageV2"],var.storage_account_replication_kind)
    error_message = "Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  }
}

variable "storage_account_replication_type" {
  type        = string
  description = "Define the type of replication to use for this storage account."
  default     = "LRS"

  validation {
    condition     = contains(["LRS","GRS","RAGRS","ZRS","GZRS","RAGZRS"],var.storage_account_replication_type)
    error_message = "Valid replication options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  }
}

variable "storage_container_name" {
  type        = set(string)
  description = "Names of the storage container"
  default     = []
}