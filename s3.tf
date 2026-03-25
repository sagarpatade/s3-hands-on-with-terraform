resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name


  tags = {
    Name = "${var.task_name}-s3-bucket"
  }
}

resource "aws_s3_bucket_versioning" "s3_versioning"{
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_object" "object_index" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "index.html"
  source = var.source_file
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "s3_confi" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_s3" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.my_bucket.id
  depends_on = [aws_s3_bucket_public_access_block.public_access_s3]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}