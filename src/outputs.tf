output "bucket_name" {
  description = "Nome do bucket S3"
  value       = aws_s3_bucket.my_bucket.id
}

output "sqs_queue_url" {
  description = "URL da fila SQS"
  value       = aws_sqs_queue.my_queue.id
}

output "lambda_function_name" {
  description = "Nome da função Lambda"
  value       = aws_lambda_function.my_lambda.function_name
}
