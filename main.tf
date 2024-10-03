
module "network" {

  source = "./modules/network"


}

module "instances" {

  source = "./modules/instances"
  public_subnet_id = module.network.pub_subnet_id
  security_group_id_sec_tools_linux = module.network.sec_group_sec_tools
  security_tools_key = var.security_tools_key
  security_tools_ami = var.security_tools_ami

}