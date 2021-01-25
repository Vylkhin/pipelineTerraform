output "ip_address"{
  value = aws_instance.instance_terraform_lespagnol.*.public_ip
}
