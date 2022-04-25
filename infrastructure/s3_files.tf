
resource "aws_s3_bucket_object" "etl_script_spark" {
  bucket = "${aws_s3_bucket.dl.id}"
  key    = "emr-code/pyspark/lambda_function.py"
  source = "../etl/lambda_function.py"
  #etag = filemd5("../etl/glue_job_read_write.py")
}

resource "aws_s3_bucket_object" "delta_insert" {
  bucket = "${aws_s3_bucket.dl.id}"
  key = "emr-code/pyspark/01_delta_spark_insert.py"
  source = "../etl/01_delta_spark_insert.py"
  #etag = filemd5("../etl/01_delta_spark_insert.py")
}

resource "aws_s3_bucket_object" "delta_upsert" {
  bucket = "${aws_s3_bucket.dl.id}"
  key = "emr-code/pyspark/02_delta_spark_upsert.py"
  source = "../etl/02_delta_spark_upsert.py"
  #etag = filemd5("../etl/02_delta_spark_upsert.py")
}

