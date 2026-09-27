resource "yandex_iam_service_account" "terraform_sa" {
  name        = var.sa_name
  description = "Сервисный аккаунт для Terraform"
  folder_id   = var.folder_id
}

resource "yandex_resourcemanager_folder_iam_member" "terraform_sa_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.terraform_sa.id}"
}

