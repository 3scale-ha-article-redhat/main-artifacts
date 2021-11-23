#!/bin/sh

echo -n "redis01 ping..."
ssh [redis-master-host] 'redis-cli ping'
echo -n "redis02 ping..."
ssh [redis-replica-host] 'redis-cli ping'
echo -n "redis03 ping..."
ssh [redis-replica-host] 'redis-cli ping'

echo -n "sentinel01 ping..."
ssh [redis-sentinel-host] 'redis-cli -p 26379 ping'
echo -n "sentinel02 ping..."
ssh [redis-sentinel-host] 'redis-cli -p 26379 ping'
echo -n "sentinel03 ping..."
ssh [redis-sentinel-host] 'redis-cli -p 26379 ping'


