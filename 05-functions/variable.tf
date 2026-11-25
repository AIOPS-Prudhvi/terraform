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


variable "instance" {
  type = list
  default = ["mongodb", "redis", "mysql","rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "port_number" {
  type    = number
  default = 0
}

variable "env" {
  default = "dev"
  type = string

}

variable "Project" {
  type = string
  default = "Roboshop"
}

variable "zone_id" {
  default = "Z0970256W74FS2R5N49F"

}

variable "domain_name" {
  default = "prudhvi.store"
}

variable "common_tags" {
  type = map
  default = {
    Project = "roboshop"
    env = "dev"
  }
}
