resource "yandex_container_registry" "diplom_registry" {
  name      = "diplom-registry"
  folder_id = var.folder_id
}
