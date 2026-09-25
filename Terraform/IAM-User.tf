resource "aws_iam_user" "DevOps-User" {
  name = "DevOps-User"
}



resource "aws_iam_access_key" "DevOps-User" {
  user = aws_iam_user.DevOps-User.name
}


resource "aws_iam_user_policy" "DevOps-User-Inline-Policy" {
  name = "test"
  user = aws_iam_user.DevOps-User.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Statement1",
        "Effect" : "Allow",
        "Action" : "eks:*",
        "Resource" : "*"
      }
    ]
  })
}