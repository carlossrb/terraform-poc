variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  default     = "sa-east-1"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  default     = "s3-onboarding-carlos-terraform"
}

variable "queue_name" {
  description = "Nome da fila SQS"
  default     = "sqs-onboarding-carlos-terraform"
}

variable "lambda_function_name" {
  description = "Nome da função Lambda"
  default     = "lambda-onboarding-carlos-terraform"
}
