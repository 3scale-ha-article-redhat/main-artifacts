#!/bin/sh

echo "starting redis01..."
ssh ec2-user@[redis-master-host] 'nohup redis-server ./sentinel/master/redis.conf > ./sentinel/master/redis.log 2> ./sentinel/master/redis.err < /dev/null &'
echo "starting redis02..."
ssh ec2-user@[redis-replica-host-1] 'nohup redis-server ./sentinel/replica/redis.conf > ./sentinel/replica/redis.log 2> ./sentinel/replica/redis.err < /dev/null &'
echo "starting redis03..."
ssh ec2-user@[redis-replica-host-2] 'nohup redis-server ./sentinel/replica/redis.conf > ./sentinel/replica/redis.log 2> ./sentinel/replica/redis.err < /dev/null &'


echo "starting sentinel01..."
ssh ec2-user@[redis-sentinel-host-1] 'nohup redis-sentinel ./sentinel/master/sentinel.conf > ./sentinel/master/sentinel.log 2> ./sentinel/master/sentinel.err < /dev/null &'
echo "starting sentinel02..."
ssh ec2-user@[redis-sentinel-host-2] 'nohup redis-sentinel ./sentinel/replica/sentinel.conf > ./sentinel/replica/sentinel.log 2> ./sentinel/replica/sentinel.err < /dev/null &'
echo "starting sentinel03..."
ssh ec2-user@[redis-sentinel-host-3] 'nohup redis-sentinel ./sentinel/replica/sentinel.conf > ./sentinel/replica/sentinel.log 2> ./sentinel/replica/sentinel.err < /dev/null &'


