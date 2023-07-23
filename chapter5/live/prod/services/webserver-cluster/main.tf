terraform {
  backend "s3" {
    profile = "terraform_up_and_running"
    bucket         = "terraform-up-and-running-fmoya"
    key            = "prod/services/webserver-cluster/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
  profile = "terraform_up_and_running"
}

module "webserver_cluster" {
 source = "../../../../modules/services/webserver-cluster"
 cluster_name = "webservers-prod"
 db_remote_state_bucket = "terraform-up-and-running-fmoya"
 db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
 instance_type = "t2.micro"
 min_size = 2
 max_size = 2
 enable_autoscaling = true
 custom_tags = {
   Owner = "team-foo"
   ManagedBy = "terraform"
 }
}
