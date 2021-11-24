#!/bin/sh

CUR_DIR=$(dirname $0)/..

echo "Creating necessary folders on master..."
ssh ec2-user@[redis-master-host] 'mkdir -p ~/sentinel/master/'
echo "Copying configuration files to master..."
scp -r $CUR_DIR/redis/config/master/* ec2-user@[redis-master-host]:'~/sentinel/master/'
echo "Creating data folders on master..."
ssh ec2-user@[redis-master-host] "sudo mkdir -p /var/lib/redis; sudo mkdir -p /var/lib/sentinel; sudo chown -R ec2-user:ec2-user /var/lib/redis; sudo chown -R ec2-user:ec2-user /var/lib/sentinel"
echo "Creating necessary folders on replica-1"
ssh ec2-user@[redis-replica-host-1] 'mkdir -p ~/sentinel/replica/'
echo "Creating data folders on replica-1..."
ssh ec2-user@[redis-replica-host-1] "sudo mkdir -p /var/lib/redis; sudo mkdir -p /var/lib/sentinel; sudo chown -R ec2-user:ec2-user /var/lib/redis; sudo chown -R ec2-user:ec2-user /var/lib/sentinel"
echo "Copying configuration files to replica-1..."
scp -r $CUR_DIR/redis/config/replica1/* ec2-user@[redis-replica-host-1]:'~/sentinel/replica/'
echo "Creating necessary folders on replica-2"
ssh ec2-user@[redis-replica-host-2] 'mkdir -p ~/sentinel/replica/'
echo "Copying configuration files to replica2..."
scp -r $CUR_DIR/redis/config/replica2/* ec2-user@[redis-replica-host-2]:'~/sentinel/replica/'
echo "Creating data folders on replica-2..."
ssh ec2-user@[redis-replica-host-2] "sudo mkdir -p /var/lib/redis; sudo mkdir -p /var/lib/sentinel; sudo chown -R ec2-user:ec2-user /var/lib/redis; sudo chown -R ec2-user:ec2-user /var/lib/sentinel"