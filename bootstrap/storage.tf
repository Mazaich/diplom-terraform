resource "yandex_storage_bucket" "tf_state" {
  bucket    = var.bucket_name
  
   anonymous_access_flags {
    read = false
    list = false
  }
}
