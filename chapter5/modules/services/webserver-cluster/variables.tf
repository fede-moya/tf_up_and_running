variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type        = string
  # default = "terraform-up-and-running-fmoya"
}

variable "db_remote_state_key" {
  description = "The name of the key in the S3 bucket used for the database's remote state storage"
  type        = string
  # default = "stage/data-stores/mysql/terraform.tfstate"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 instances in the ASG"
  type        = number
}

variable "custom_tags" {
  description = "Custom tags to apply to all resources"
  type = map(string)
  default = {}
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type = bool
}
