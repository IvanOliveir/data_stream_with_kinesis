resource "aws_cloudwatch_log_group" "firehose" {
  name = "kinesis-firehose-delivery-stream-log-group"
  retention_in_days = 1
}


resource "aws_cloudwatch_log_stream" "firehose" {
  log_group_name = aws_cloudwatch_log_group.firehose.name
  name = "kinesis-firehose-delivery-stream-log-stream"
}