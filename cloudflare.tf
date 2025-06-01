data "cloudflare_zone" "default" {
    filter = {
        name = var.domain  #mydomain.com
        #status = "active"
    }
}

resource "cloudflare_dns_record" "default_A" {
  zone_id = data.cloudflare_zone.default.zone_id
  name    = var.domain
  content   = vultr_instance.my_instance.main_ip
  type    = "A"
  proxied = false
  ttl     = 300
}

output "zone_id" {
  value = data.cloudflare_zone.default.id
}

output "var_domain" {
   value = var.domain
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
