provider "aws" { 
  region = var.aws_region
}

resource "lambda_s3_bucket" "example_bucket" {
  bucket = "lambda_s3_bucket"
  # Add other configuration options for the bucket, if needed
}

#data "archive_file" "zip_the_python_code" {
 #type        = "zip"
 #source_dir  = "${path.module}/"
 #output_path = "${path.module}/lambda_function.zip"
#}

resource "aws_lambda_function" "example_lambda" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  #filename         = "${path.module}/lambda_function.zip" 
  #source_code_hash = filebase64sha256("lambda_function.py")

 # Use S3 bucket as the deployment package source
  s3_bucket        = lambda_s3_bucket.example_bucket.bucket
  s3_key           = "lambda_function.zip"
  
}

resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_policy" {
  name   = var.lambda_policy_name
  role   = aws_iam_role.lambda_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
EOF
}
