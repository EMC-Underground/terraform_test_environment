provider "vsphere" {
  user                 = data.vault_generic_secret.vsphere_user.data["value"]
  password             = data.vault_generic_secret.vsphere_password.data["value"]
  vsphere_server       = data.vault_generic_secret.vsphere_server.data["value"]
  allow_unverified_ssl = true
}

provider "vault" {
}
# Stores the terraform state file in S3 bucket.
#terraform {
#  backend "s3" {
#    bucket = "brad.bucket"
#    key    = "dockerswarm/terraform.tfstate"
#    region = "us-east-1"
#  }
#}

data "vault_generic_secret" "vsphere_password" {
  path = "terraform/vsphere_password"
}

data "vault_generic_secret" "vsphere_user" {
  path = "terraform/vsphere_user"
}

data "vault_generic_secret" "vsphere_server" {
  path = "terraform/vsphere_server"
}

data "vault_generic_secret" "root_password" {
  path = "terraform/root_password"
}

module "centos7" {
  source = "./services/centos7"

  node_count = var.node_count

  vm_name_prefix = var.vm_name_prefix

  root_password = data.vault_generic_secret.root_password.data["value"]

  datacenter_name = var.datacenter_name

  cluster_name = var.cluster_name

  datastore = var.datastore

  template_name = var.template_name_centos7

  network_0 = var.network_0

  network_1 = var.network_1

  network_2 = var.network_2

  mgmt_ip_prefix = var.mgmt_ip_prefix

  mgmt_netmask = var.mgmt_netmask

  gateway = var.gateway

  dns_servers = var.dns_servers

  domain = var.domain
}



output "ip_address" {
  value = module.centos7.ip
}
