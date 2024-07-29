data "cloudflare_zone" "default" {
    name = var.domain  #mydomain.com
    account_id = var.CLOUDFLARE_ACCOUNT_ID
}

resource "cloudflare_record" "default_A" {
  zone_id = data.cloudflare_zone.default.id
  name    = var.domain
  value   = vultr_instance.my_instance.main_ip
  type    = "A"
  proxied = false
}



# resource "cloudflare_record" "default_certvalidation1" {
#     zone_id = data.cloudflare_zone.default.id
#     name    =  "_acme-challenge.${var.domain}"
#     value   = data.external.run_ansible_playbook.result.var1
#     type    = "TXT"
#     #ttl     = "auto"
#     proxied = false
#     depends_on = [ data.external.run_ansible_playbook ]
# }

# resource "cloudflare_record" "default_certvalidation2" {
#     zone_id = data.cloudflare_zone.default.id
#     name    =  "_acme-challenge.${var.domain}"
#     value   = data.external.run_ansible_playbook.result.var2
#     type    = "TXT"
#     #ttl     = "auto"
#     proxied = false
#     depends_on = [ data.external.run_ansible_playbook ]
# }
