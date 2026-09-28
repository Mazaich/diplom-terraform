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

variable "network_name" {
  description = "Имя VPC-сети"
  type        = string
  default     = "diplom-network"
}

variable "sa_id" {
  description = "ID сервисного аккаунта для Kubernetes"
  type        = string
}

variable "k8s_version" {
  description = "Версия Kubernetes"
  type        = string
  default     = "1.35"
}
