#
# Cookbook Name:: tl
# Recipe:: alb_attach
# Author:: Thilina Munasinghe
# Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#


chef_gem "aws-sdk-core" do
  version "~> 2.6"
  action :install
end

ruby_block "attach to ALB" do
  block do
    require "aws-sdk-core"

    raise "alb_helper block not specified in layer JSON" if node[:alb_helper].nil?
    raise "Target group ARN not specified in layer JSON" if node[:alb_helper][:target_group_arn].nil?

    stack = search("aws_opsworks_stack").first
    instance = search("aws_opsworks_instance", "self:true").first

    stack_region = stack[:region]
    ec2_instance_id = instance[:ec2_instance_id]
    target_group_arn = node[:alb_helper][:target_group_arn]

    Chef::Log.info("Creating ELB client in region #{stack_region}")
    client = Aws::ElasticLoadBalancingV2::Client.new(region: stack_region)

    Chef::Log.info("Registering EC2 instance #{ec2_instance_id} with target group #{target_group_arn}")

    target_to_attach = {
        target_group_arn: target_group_arn,
        targets: [{ id: ec2_instance_id }]
    }

    client.register_targets(target_to_attach)
  end
  action :run
end