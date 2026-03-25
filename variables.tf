variable "s3_bucket_name" {
  type = string
  default = "my-bucket-sagar1900"
}

variable "task_name" {
  type = string
  default = "s3_bucket_terraform"
}

variable "source_file" {
  type = string
  default = "./index.html"
}

variable "versioning_status" {
  default = "Enabled"
}

