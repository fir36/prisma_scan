resource "aws_s3_bucket" "secure_bucket" {
  bucket = "prisma-cloud-secure-bucket"
  acl    = "private" # Secure configuration: private access only

  tags = {
    Name        = "PrismaCloudSecureBucket"
    Environment = "Production"
  }
}

resource "aws_security_group" "secure_security_group" {
  name        = "prisma-cloud-secure-sg"
  description = "Allow specific inbound traffic"

  ingress {
    from_port   = 22 # Allow SSH traffic only
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.0/24"] # Replace with your trusted IP range
  }

  egress {
    from_port   = 0 # Allow all outbound traffic
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "PrismaCloudSecureSG"
    Environment = "Production"
  }
}
