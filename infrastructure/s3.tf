resource "aws_s3_bucket" "dl" {

  bucket = "lakehouse-test-tf"

  tags = {
    job = "lakehouse_deltalake"
  }
}

resource "aws_s3_bucket" "stream" {
  bucket = "stream-test-bucket"

  tags = {
    job = "stream_bucket"
  }
}