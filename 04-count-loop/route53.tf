# resource "aws_route53_record" "roboshop" {
#   zone_id = "Z0970256W74FS2R5N49F"
#   name    = "prudhvi.store"
#   type    = "A"
#   ttl     = "1"
#   records = aws_route53_zone.dev.name_servers
# }

resource "aws_route53_record" "roboshop" {
  count = 10  
  zone_id = var.zone_id
  name    = "${var.instance[count.index]}.${var.env}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.roboshop[count.index].private_ip]
}

resource "aws_route53_record" "frontend" {
  count = contains(var.instance, "frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.Project}.${var.env}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.roboshop[index(var.instance, "frontend")].public_ip] 
}


