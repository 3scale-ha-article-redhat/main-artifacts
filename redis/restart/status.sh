#!/bin/sh

echo -n "redis01 ping..."
ssh [redis-master] 'redis-cli ping'
echo -n "redis02 ping..."
ssh 107.23.187.38 'redis-cli ping'
echo -n "redis03 ping..."
ssh 54.227.102.185 'redis-cli ping'

echo -n "sentinel01 ping..."
ssh [redis-master] 'redis-cli -p 26379 ping'
echo -n "sentinel02 ping..."
ssh 107.23.187.38 'redis-cli -p 26379 ping'
echo -n "sentinel03 ping..."
ssh 54.227.102.185 'redis-cli -p 26379 ping'
