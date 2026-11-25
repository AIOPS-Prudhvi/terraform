resource "aws_instance" "roboshop" {
  count = 10
  ami                    = var.ami
  instance_type          = var.env == "dev" ? "t3.micro" : "t2.small"
  vpc_security_group_ids = [
    aws_security_group.roboshop[count.index].id,
    aws_security_group.common.id
  ]

  tags = {
    Name = "${var.Project}-${var.env}-${var.instance[count.index]}"
  }  
}

resource "aws_security_group" "roboshop" {
  count = 10
  name        = "${var.Project}-${var.env}-${var.instance[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = var.port_number
    to_port     = var.port_number
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.Project}-${var.env}-${var.instance[count.index]}"
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

