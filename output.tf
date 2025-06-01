output "server_main_ip" {
  value = vultr_instance.my_instance.main_ip
}

output "server_id" {
  value = vultr_instance.my_instance.id
}
