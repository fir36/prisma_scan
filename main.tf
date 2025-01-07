resource "aws_s3_bucket" "good_bucket" {
  bucket = "prisma-cloud-test-bucket"
  acl    = "private" # Fixed: ACL set to private for enhanced security

  tags = {
    Name        = "PrismaCloudTestBucket"
    Environment = "Test"
  }
}

resource "aws_security_group" "good_security_group" {
  name        = "prisma-cloud-test-sg"
  description = "Allow specific inbound traffic"

  ingress {
    from_port   = 22 # Allow SSH traffic only
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.0/24"] # Replace with your specific IP range
  }

  egress {
    from_port   = 0 # Allow all outbound traffic
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "PrismaCloudTestSG"
    Environment = "Test"
  }
}
