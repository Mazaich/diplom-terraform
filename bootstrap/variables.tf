variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога"
  type        = string
}

variable "zone" {
  description = "Зона по умолчанию"
  type        = string
  default     = "ru-central1-a"
}

variable "bucket_name" {
  description = "Имя S3-бакета для хранения terraform state"
  type        = string
}

variable "sa_name" {
  description = "Имя сервисного аккаунта"
  type        = string
  default     = "terraform-sa"
}

variable "storage_access_key" {
  description = "S3 access key"
  type        = string
  sensitive   = true
}

variable "storage_secret_key" {
  description = "S3 secret key"
  type        = string
  sensitive   = true
}
