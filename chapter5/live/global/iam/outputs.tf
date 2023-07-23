# output "first_arn" {
#   value = aws_iam_user.example[0].arn
#   description = "The ARN of the first IAM user"
# }
# 
# output "all_arns" {
#   value = aws_iam_user.example[*].arn
#   description = "The ARNs of all the IAM users"
# }

output "all_arns" {
  value = values(aws_iam_user.example)[*].arn

  description = "The ARNs of all the IAM users"
}
