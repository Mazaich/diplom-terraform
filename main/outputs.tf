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

