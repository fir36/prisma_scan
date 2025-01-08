resource "aws_s3_bucket" "secure_bucket" {
  bucket = "prisma-cloud-secure-bucket"
  acl    = "private" # Secure configuration: private access only

  tags = {
    Name        = "PrismaCloudSecureBucket"
    Environment = "Production"
    git_org     = "fir36"
    git_repo    = "prisma_scan"
    yor_trace   = "7266d380-b9ba-4690-bc8c-4fbbdf7161e5"
  }
}


resource "aws_s3_bucket" "secure_bucket_log_bucket" {
  bucket = "secure_bucket-log-bucket"
  tags = {
    git_org   = "fir36"
    git_repo  = "prisma_scan"
    yor_trace = "5af8f7ed-2de8-4936-9353-2024cc313499"
  }
}

resource "aws_s3_bucket_logging" "secure_bucket" {
  bucket = aws_s3_bucket.secure_bucket.id

  target_bucket = aws_s3_bucket.secure_bucket_log_bucket.id
  target_prefix = "log/"
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
    git_org     = "fir36"
    git_repo    = "prisma_scan"
    yor_trace   = "fc4345f3-a055-4756-b7a8-c34bf2193f1f"
  }
}
