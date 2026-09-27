terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.228.0"
    }
  }
  required_version = ">= 1.0"
}

provider "yandex" {
  service_account_key_file = "/home/roman/diplom-secrets/terraform-sa-key.json"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
  storage_endpoint         = "storage.yandexcloud.net"
  storage_access_key       = var.storage_access_key
  storage_secret_key       = var.storage_secret_key
}
