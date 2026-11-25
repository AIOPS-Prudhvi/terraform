resource "aws_instance" "roboshop" {
  for_each = var.instance
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.roboshop[each.key].id,
    aws_security_group.common.id
  ]

  tags = {
    Name = "${var.Project}-${var.env}-${each.key}"
  }  
}

resource "aws_security_group" "roboshop" {
  for_each = var.instance

  name        = "${var.Project}-${var.env}-${each.key}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = var.port_number
    to_port     = var.port_number
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.Project}-${var.env}-${each.key}"
  }
  lifecycle {
    create_before_destroy = true 
  }
}

resource "aws_security_group" "common" {
  name        = "${var.Project}-${var.env}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = var.port_number
    to_port     = var.port_number
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.Project}-${var.env}-common"
  }
}

