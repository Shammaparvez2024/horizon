
#!/bin/bash
# AWS EC2 instance details
AMI_ID="ami-083eed19fc801d7a4"
INSTANCE_TYPE="t2.micro"
KEY_NAME="umar"
SECURITY_GROUP_ID="sg-0f01866b6b44b976f"
SUBNET_ID="subnet-00f5846c7a2a270e5"
# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SECURITY_GROUP_ID" \
  --subnet-id "$SUBNET_ID" \
  --output text --query 'Instances[0].InstanceId'
)
# Wait until the instance is running
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
echo "EC2 instance $INSTANCE_ID is now running!"
