#S3 bucket
resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket-lakshmi"
  acl    = "private"
}

# IAM user
resource "aws_iam_user" "s3_user" {
  name = "s3-read-only"
}

# IAM policy 
data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions   = ["s3:GetObject", "s3:ListBucket"]
    resources = [
      aws_s3_bucket.test_bucket.arn,
      "${aws_s3_bucket.test_bucket.arn}/*",
    ]
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3-read-only-policy"
  description = "Policy for read-only access to the test-bucket-lakshmi"
  
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

# Attach the IAM policy to the IAM user
resource "aws_iam_user_policy_attachment" "attach_policy" {
  policy_arn = aws_iam_policy.s3_policy.arn
  user       = aws_iam_user.s3_user.name
}
