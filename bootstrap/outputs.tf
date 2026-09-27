output "sa_id" {
  value = yandex_iam_service_account.terraform_sa.id
}

output "bucket_name" {
  value = yandex_storage_bucket.tf_state.bucket
}
