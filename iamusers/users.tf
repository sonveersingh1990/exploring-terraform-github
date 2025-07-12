resource "aws_iam_user" "github2" {
  name = github2
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "github2" {
  user = aws_iam_user.github2.name
}

data "aws_iam_policy_document" "github2_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "github2_ro" {
  name   = "test"
  user   = aws_iam_user.lb.name
  policy = data.aws_iam_policy_document.github2_ro.json
}