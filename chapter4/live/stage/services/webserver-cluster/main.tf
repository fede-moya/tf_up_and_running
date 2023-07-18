terraform {
  backend "s3" {
    profile = "terraform_up_and_running"
    bucket         = "terraform-up-and-running-fmoya"
    key            = "stage/services/webserver-cluster/terraform.tfstate"
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
 source = "../../../modules/services/webserver-cluster"
 cluster_name = "webserver-stage"
 db_remote_state_bucket = "terraform-up-and-running-fmoya"
 db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
 instance_type = "t2.micro"
 min_size = 2
 max_size = 2
}


resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale_out_during_business_hours"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 2
  recurrence            = "0 9 * * *"
  autoscaling_group_name = module.webserver_cluster.asg_name
}
