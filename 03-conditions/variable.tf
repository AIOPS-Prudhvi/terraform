variable "ami" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "description"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t2.small"], var.instance_type)
    error_message = "instance type should be t3.micro or t2.small"
  }
}


variable "ec2_tags" {
  type = map(any)
  default = {
    Name    = "Terraform-demo"
    Project = "Roboshop"
    env     = "dev"
  }
}

variable "port_number" {
  type    = number
  default = 0
}

variable "env" {
  default = "dev"
  type = string

}