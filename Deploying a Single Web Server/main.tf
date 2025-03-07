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
  resource "aws_instance" "my_instance" {
    ami                    = "ami-0df8c184d5f6ae949"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my-instance.id]

       user_data = <<-EOF
              #!/bin/bash
              echo "HELLO WORLD" >> index.xhtml
              nohup busybox httpd -f -p 8080 &
              EOF

       user_data_replace_on_change = true
  tags = {
    Name = "terraform-example"
   }
  }
