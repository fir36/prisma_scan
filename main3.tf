provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
  acl    = "private"

  tags = {
    "env"         = "production"    # Trigger tag rule: ensure this matches the required tag policy
    "cost_center" = "1234"          # Trigger tag rule: ensure this tag is also set
  }
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group"

 # tags = {
 #  "env"         = "production"    # Required tag for compliance
 #   "cost_center" = "1234"          # Required tag for compliance
 # }
}
