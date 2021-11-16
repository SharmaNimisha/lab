provider "google" {
        project = var.project
        region = "us-central1"
}

resource "aws_iam_user" "example" {
  count = 3
  name  = "neo.${count.index}"
}
