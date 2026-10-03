resource "yandex_vpc_security_group" "k8s_master_sg" {
  name        = "k8s-master-sg"
  description = "Security group для мастера Kubernetes"
  network_id  = yandex_vpc_network.diplom_network.id

  ingress {
    description    = "Kubernetes API"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "Kubernetes API 6443"
    protocol       = "TCP"
    port           = 6443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "Весь исходящий трафик"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

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
    public_ip          = true
    security_group_ids = [yandex_vpc_security_group.k8s_master_sg.id]
  }

  service_account_id      = var.sa_id
  node_service_account_id = var.sa_id
}
