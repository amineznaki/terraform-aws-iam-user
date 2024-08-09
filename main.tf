resource "aws_iam_user" "Developer" {
    name = "developer"
}

resource "aws_iam_user_policy_attachment" "S3ReadOnly" {
    user = aws_iam_user.Developer.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_access_key" "developerAccessKey" {
    user = aws_iam_user.Developer.name
}

output "DeveloperAccessKeyID" {
    value = aws_iam_access_key.developerAccessKey.id
}

output "DeveloperSecretKeyID" {
    value = aws_iam_access_key.developerAccessKey.secret
    sensitive = true
}