provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-123456"
  acl    = "private"

  tags = {
    "Name"        = "ExampleBucket"
    "Environment" = "Production"
    # Tags like 'git_org', 'git_repo', and 'yor_trace' will be added automatically by the Tagging Bot
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    "Name"        = "ExampleInstance"
    "Environment" = "Production"
    # Tags like 'git_org', 'git_repo', and 'yor_trace' will be added automatically by the Tagging Bot
  }
}
