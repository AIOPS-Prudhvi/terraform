resource "aws_instance" "terraform_demo" {
    ami = "ami-0055977a6e828a4f4"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = merge(
      var.common_tags,
      {
        Name = "terraform"
        component = "demo"
      }
    )
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }  

  tags = merge(
    var.common_tags,
    {
      Name = "terraform"
      component = "demo"
    }
  )
}