resource "vultr_instance" "my_instance" {
  label = "sample-server"
  #plan = "vc2-1c-1gb"
  plan = "vhf-1c-1gb"
  region = "sea"
  #os_id = "387"  # Ubuntu 20.04
  os_id = "1743"  # Ubuntu 22.04
  ssh_key_ids = ["${vultr_ssh_key.ssh_key.id}"]
}

resource "vultr_ssh_key" "ssh_key" {
    name = "ssh_key"
    ssh_key = "${file("${var.ssh_key_path}/${var.public_key}")}"
}

resource "null_resource" "run_ansible_playbook" {
  #count = length(vultr_instance.my_instance)

  provisioner "local-exec" {
    command   = "until nc -zv ${vultr_instance.my_instance.main_ip} 22; do echo 'Waiting for SSH to be available...'; sleep 10; done"
    working_dir = path.module
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${vultr_instance.my_instance.main_ip},' -u root --private-key ${var.ssh_key_path}/${var.private_key} ./ansible/playbook.yml --extra-vars 'tf_ansible_username=${var.ansible_username}'" #-vvv for verbosity
    working_dir = path.module
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${vultr_instance.my_instance.main_ip},' -u ${var.ansible_username} --private-key ${var.ssh_key_path}/${var.private_key} ./ansible/playbook_ee.yml --extra-vars 'tf_ip=${vultr_instance.my_instance.main_ip} tf_ansible_username=${var.ansible_username} tf_frontend_repo=${var.frontend_repo} tf_repo_access_token=${var.repo_access_token} tf_domain=${var.domain} tf_mail=${var.mail} tf_cf_global_api=${var.CLOUDFLARE_GLOBAL_API_KEY}'" #-vvv for verbosity
    working_dir = path.module
  }

}