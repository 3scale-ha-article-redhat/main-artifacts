#!/bin/sh

cat servers | xargs -I'{}' redis-cli -h {} -p 26379 shutdown
cat servers | xargs -I'{}' redis-cli -h {} -p 6379 shutdown
