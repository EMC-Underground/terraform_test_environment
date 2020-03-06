variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "node_count" {}
variable "vm_name_prefix" {}
variable "root_password" {}
variable "datacenter_name" {}
variable "cluster_name" {}
variable "datastore" {}
variable "template_name_ubuntu18" {}
variable "template_name_centos7" {}
variable "template_name_centos8" {}
variable "network_0" {}
variable "network_1" {}
variable "network_2" {}
variable "mgmt_ip_prefix" {}
variable "mgmt_netmask" {}
variable "gateway" {}

variable "dns_servers" {
  type = "list"
}

variable "domain" {}
