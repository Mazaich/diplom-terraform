output "network_id" {
  value = yandex_vpc_network.diplom_network.id
}

output "subnet_ids" {
  value = [
    yandex_vpc_subnet.subnet_a.id,
    yandex_vpc_subnet.subnet_b.id,
    yandex_vpc_subnet.subnet_d.id,
  ]
}

output "cluster_id" {
  value = yandex_kubernetes_cluster.diplom_cluster.id
}

output "cluster_endpoint" {
  value = yandex_kubernetes_cluster.diplom_cluster.master[0].external_v4_endpoint
}

output "registry_id" {
  value = yandex_container_registry.diplom_registry.id
}
