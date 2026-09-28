resource "yandex_kubernetes_cluster" "diplom_cluster" {
  name        = "diplom-cluster"
  description = "Kubernetes кластер для диплома"
  network_id  = yandex_vpc_network.diplom_network.id

  master {
    version = var.k8s_version
    regional {
      region = "ru-central1"
      location {
        zone      = "ru-central1-a"
        subnet_id = yandex_vpc_subnet.subnet_a.id
      }
      location {
        zone      = "ru-central1-b"
        subnet_id = yandex_vpc_subnet.subnet_b.id
      }
      location {
        zone      = "ru-central1-d"
        subnet_id = yandex_vpc_subnet.subnet_d.id
      }
    }
    public_ip = true
  }

  service_account_id      = var.sa_id
  node_service_account_id = var.sa_id
}
