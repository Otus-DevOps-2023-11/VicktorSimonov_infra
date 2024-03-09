#terraform {
#  required_providers {
#    yandex = {
#      source = "yandex-cloud/yandex"
#    }
#  }
#  required_version = ">= 0.13"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "simonov-terraform-states"
    region = "ru-central1"
    key    = "terraform/stage/terraform.tfstate"

#   access_key = ""
#   secret_key = ""


    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

    #dynamodb_endpoint = "###"
    #dynamodb_table    = "###"
  }
}
