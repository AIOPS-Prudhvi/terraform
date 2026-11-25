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
  type = map
  default = {
    mongodb = {
      instance_type = "t3.micro"
    },
    redis = {
      instance_type = "t2.micro"
    },    
    mysql = {
      instance_type = "t2.small"
    },
    rabbitmq = {
      instance_type = "t3.micro"
    },
    catalogue = {
      instance_type = "t2.small"
    },
    user = {
      instance_type = "t3.micro"
    },  

    cart = {
      instance_type = "t3.micro"
    },
    shipping = {
      instance_type = "t3.micro"
    },   
    frontend = {
      instance_type = "t3.micro"
    },                   

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

