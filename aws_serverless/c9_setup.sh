#!/bin/bash

# jq for parsing JSON
sudo yum install -y jq

sudo -i -u ec2-user sh -c 'source $HOME/.nvm/nvm.sh; nvm install 16'

echo "Installing AWS CLI v2..." &&
    cd /tmp &&
    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&
    unzip -q awscliv2.zip &&
    sudo ./aws/install

# Resize Volume from defualt 8GB to 16GB
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
REGION=$(curl -s http://169.254.169.254/latest/meta-data/placement/region)
VOLUME_ID=$(aws ec2 describe-instances \
    --instance-id $INSTANCE_ID \
    --query "Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId" \
    --output text --region $REGION)

aws ec2 modify-volume --volume-id $VOLUME_ID --size 16 --region $REGION

while [ \
    "$(aws ec2 describe-volumes-modifications \
        --volume-id $VOLUME_ID \
        --filters Name=modification-state,Values="optimizing","completed" \
        --query "length(VolumesModifications)" \
        --output text --region $REGION)" != "1" ]; do
    sleep 1
done

# Assume we are using default Amazon Linux and ebs type is gp2
sudo growpart /dev/nvme0n1 1
sudo xfs_growfs -d /
