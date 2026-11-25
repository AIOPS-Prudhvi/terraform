resource "aws_instance" "terraform_demo" {
  ami                    = var.ami
  instance_type          = var.env == "dev" ? "t3.micro" : "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = var.port_number
    to_port     = var.port_number
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.ec2_tags
}