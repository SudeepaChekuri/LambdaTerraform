variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "Lambda-Terraform"
}

variable "lambda_role_name" {
  description = "IAM role name for the Lambda function"
  type        = string
  default     = "lambda-role"
}

variable "lambda_policy_name" {
  description = "IAM policy name for the Lambda function"
  type        = string
  default     = "lambda-policy"
}

variable "lambda_handler" {
  description = "Lambda function handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  description = "Lambda function runtime"
  type        = string
  default     = "python3.8"
}
