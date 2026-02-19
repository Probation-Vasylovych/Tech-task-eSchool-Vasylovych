resource "aws_iam_user" "admin" {
  name = var.name
}

resource "aws_iam_access_key" "admin_key" {
  user = aws_iam_user.admin.name
}


resource "aws_iam_user_policy_attachment" "admin_policy" {
  user = aws_iam_user.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}