provider "aws" {
  region = "us-east-2"
  profile = "terraform_up_and_running"
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name = each.key
}
