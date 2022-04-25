resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  destination = "extended_s3"
  name = "kinesis-firehose-s3-stream"

  extended_s3_configuration {
    bucket_arn = aws_s3_bucket.stream.arn
    role_arn = aws_iam_role.firehose_role.arn
    prefix = "firehose/"
    buffer_size = 5
    buffer_interval = 60

    cloudwatch_logging_options {
      enabled = true
      log_group_name = aws_cloudwatch_log_group.firehose.name
      log_stream_name = aws_cloudwatch_log_stream.firehose.name
    }
  }
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "firehose.amazonaws.com"
        }
      },
    ]
  })


}
