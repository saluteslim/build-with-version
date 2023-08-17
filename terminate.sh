#!/bin/bash
​
# Replace with your actual AMI ID
ami_id="ami-007ec828a062d87a5"
​
# Get a list of running EC2 instances with the specified AMI ID
instance_ids=$(aws ec2 describe-instances --filters "Name=image-id,Values=${ami_id}" "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].InstanceId' --output text)
​
# Terminate the EC2 instances
for instance_id in $instance_ids; do
    aws ec2 terminate-instances --instance-ids "$instance_id"
    echo "Terminating EC2 instance $instance_id with AMI ID $ami_id..."
done
