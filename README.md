# Diplom Terraform

Terraform-конфигурация облачной инфраструктуры в Yandex Cloud для дипломного практикума.

## Что это

Репозиторий содержит конфигурацию для создания:
- Сервисного аккаунта для Terraform.
- S3-бакета для хранения состояния (backend).
- VPC-сети и трёх подсетей в разных зонах доступности.
- Managed Kubernetes кластера (региональный мастер).
- Node group с прерываемыми worker-нодами.
- Container Registry для Docker-образов.

## Структура

**bootstrap/** — создаёт сервисный аккаунт, статический ключ и S3-бакет. Применяется один раз.

Файлы внутри: providers.tf, variables.tf, service_account.tf, storage.tf, outputs.tf, terraform.tfvars.

**main/** — основная инфраструктура.

Файлы внутри: providers.tf, variables.tf, vpc.tf, kubernetes.tf, node_group.tf, registry.tf, outputs.tf, terraform.tfvars.

**atlantis.yaml** — конфиг для Atlantis. Лежит в корне репозитория.

## Как развернуть

### 1. Bootstrap (один раз)

```bash
cd bootstrap
terraform init
terraform apply
```

Создаст: сервисный аккаунт `terraform-sa`, статический ключ, S3-бакет `diplom-tfstate-mazaich`.

### 2. Основная инфраструктура

```bash
cd main
terraform init
terraform apply
```

Создаст: VPC, подсети, Kubernetes кластер, node group, Container Registry.

### 3. Удаление

```bash
cd main
terraform destroy
```

## Состояние (state)

State хранится в S3-бакете `diplom-tfstate-mazaich` в Yandex Object Storage. Backend настроен в `main/providers.tf`.

Bootstrap использует локальный state — он создаёт бакет для остального.

## Atlantis (автоматизация через PR)

Репозиторий подключён к Atlantis — сервису для автоматизации Terraform через Pull Request'ы.

**Как работает:**
1. Создаёшь ветку и PR с изменениями в `main/`.
2. Atlantis автоматически запускает `terraform plan` и комментирует результат в PR.
3. Для применения пишешь `atlantis apply -p main`.
4. Atlantis применяет изменения и комментирует результат.

**Конфиг:** `atlantis.yaml` в корне репозитория.

## Переменные

Основные переменные в `main/terraform.tfvars`:
- `cloud_id` — ID облака Yandex Cloud.
- `folder_id` — ID каталога.
- `zone` — зона по умолчанию (`ru-central1-a`).
- `sa_id` — ID сервисного аккаунта.
- `k8s_version` — версия Kubernetes (1.35).

Секреты (S3-ключи, SA-ключ) — в переменных окружения, не в коде.

## Ссылки

- Приложение: [diplom-app](https://github.com/Mazaich/diplom-app)
- Kubernetes-манифесты: [diplom-k8s](https://github.com/Mazaich/diplom-k8s)
- Заметки и скриншоты: [diplom-notes](https://github.com/Mazaich/diplom-notes)
