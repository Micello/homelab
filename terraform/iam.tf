resource "aws_iam_user" "raspberry_pi" {
  name = "raspberry-pi"
}

resource "aws_iam_policy" "homelab_backup" {
  name = "homelab-backup"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = aws_s3_bucket.backup.arn
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.backup.arn}/*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "raspberry_pi_backup" {
  user       = aws_iam_user.raspberry_pi.name
  policy_arn = aws_iam_policy.homelab_backup.arn
}
