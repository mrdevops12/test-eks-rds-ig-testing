resource "aws_s3_bucket" "bucket" {
  count  = length(var.s3_buckets)
  bucket = element(var.s3_buckets, count.index)

  tags = {
    Name = element(var.s3_buckets, count.index)
  }
}
