resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs20.x"
  filename      = "../lambda.zip"

  source_code_hash = filebase64sha256("../lambda.zip")
}

resource "aws_lambda_event_source_mapping" "lambda_sqs" {
  event_source_arn = aws_sqs_queue.my_queue.arn
  function_name    = aws_lambda_function.my_lambda.arn

  batch_size = 10
}
