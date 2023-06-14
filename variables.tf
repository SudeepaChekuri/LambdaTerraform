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

variable "lambda_s3_bucket" {
  description = "S3 bucket name for the Lambda function deployment package"
  type        = string
  default     = "lambda_s3_bucket"
}

variable "lambda_s3_key" {
  description = "Object key (file path) for the Lambda function deployment package in the S3 bucket"
  type        = string
  default     = "s3_key"
}
