provider "aws" {
  region = "us-east-1"
}

  resource "aws_security_group" "my-instance" {
    name = "terraform-example-instance"

    ingress {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
 }
