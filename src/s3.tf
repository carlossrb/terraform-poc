resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.my_bucket.id

  queue {
    queue_arn = aws_sqs_queue.my_queue.arn
    events    = ["s3:ObjectCreated:*"]

    # filter {
    #   key {
    #     filter_rules {
    #       name  = "suffix"
    #       value = ".json"
    #     }
    #   }
    # }
  }
}
