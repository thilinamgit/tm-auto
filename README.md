## Setup Fizzbuzz application hosted infrastructure architecture.

- Install berks version ~7.0.8.
- Install chefdk. Chef version preferred ~12.7.
- Open a terminal and go to project folder path.
- Run 'berks install' and 'berks vendor cookbooks'.
- Run cloudformation scripts vpc, rds, app respectively..
    - Either install AWS CLI to run via terminal or
    - Log into AWS cloudformation management console and run.
- Above step will create all required AWS resources.
    - A VPC with Internet gateway, 3 NAT Gateways, 6 Subnets (3 public & 3 private), 3 Elastic IPs for NGWs.
    - RDS database and a read replica and related security group.
    - IAM roles, Opsworks stack, layer, app, load instances.
- 2 cookbooks are available.
    - tl - General cookbook where these recipes create users, permissions, installations.
    - tl-app - Application code deployment, ALB attachments and detachments.

## Deployment Procedure

- Login to AWS Management Console.
- Navigate to Opsworks Web Console.
- In the deployment section, we can do a deployment whenever necessary.

## To Do

- 100% deployment automation can be done via setting up a CI/CD pipeline in jenkins. A Jenkinsfile and other required automation code need to be implemented.
   