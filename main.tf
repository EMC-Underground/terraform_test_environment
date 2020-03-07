provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

provider "vault" {
  address = "http://vault.10.237.198.110.xip.io"
  token   = "s.nwvmAKgBxHqbv7CxYAPLhFIQ"
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
  path = "terraform/test"
}

output "the_secret" {
  value = "${data.vault_generic_secret.vsphere_password.data["test"]}"
}

module "ubuntu18" {
  source = "./services/ubuntu18"

  node_count = var.node_count

  vm_name_prefix = var.vm_name_prefix

  root_password = var.root_password

  datacenter_name = var.datacenter_name

  cluster_name = var.cluster_name

  datastore = var.datastore

  template_name = var.template_name_ubuntu18

  network_0 = var.network_0

  network_1 = var.network_1

  network_2 = var.network_2

  mgmt_ip_prefix = var.mgmt_ip_prefix

  mgmt_netmask = var.mgmt_netmask

  gateway = var.gateway

  dns_servers = var.dns_servers

  domain = var.domain
}

module "centos7" {
  source = "./services/centos7"

  node_count = var.node_count

  vm_name_prefix = var.vm_name_prefix

  root_password = var.root_password

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

module "centos8" {
  source = "./services/centos8"

  node_count = var.node_count

  vm_name_prefix = var.vm_name_prefix

  root_password = var.root_password

  datacenter_name = var.datacenter_name

  cluster_name = var.cluster_name

  datastore = var.datastore

  template_name = var.template_name_centos8

  network_0 = var.network_0

  network_1 = var.network_1

  network_2 = var.network_2

  mgmt_ip_prefix = var.mgmt_ip_prefix

  mgmt_netmask = var.mgmt_netmask

  gateway = var.gateway

  dns_servers = var.dns_servers

  domain = var.domain
}
