variable "lb_config" {
  type = map(object({
    lb_name            = string
    vpc_id             = string
    lb_subnets         = list(string)
    internal           = bool
    load_balancer_type = string
    lb_tags            = map(string)
    lst_port           = string
    lst_protocol       = string
    lst_type           = string
    lb_tg_grp_name     = string
    lb_tg_grp_port     = string
    lb_tg_grp_protocol = string
    })
  )
}

variable "dns_conf" {
  type = map(string)
}

variable "route53_records" {
  type = list(string)
}

variable "instance_details" {
  type = map(object({
    instance_type            = string
    iam_instance_profile     = string
    disable_api_termination  = bool
    ebs_optimized            = bool
    get_password_data        = bool
    hibernation              = bool
    monitoring               = bool
    user_data                = string
    ec2_tag                  = map(string)
    ec2_ami                  = string
    ec2_network_interface_id = string
    })
  )
}


variable "sec_group" {
  type = map(object({
    name        = string
    description = string
    tags        = map(string)
    vpc_id      = string
    sec_ingress_rule = list(object({
      description      = string
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids  = list(string)
      security_groups  = list(string)
      self             = string
    }))
    sec_egress_rule = list(object({
      description      = string
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids  = list(string)
      security_groups  = list(string)
      self             = string
    }))
  }))
}

variable "coinrs_cred_name" {}