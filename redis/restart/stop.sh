#!/bin/sh

CUR_DIR=$(dirname $0)

cat $CUR_DIR/servers-sentinels | xargs -I'{}' redis-cli -h {} -p 26379 shutdown
cat $CUR_DIR/servers | xargs -I'{}' redis-cli -h {} -p 6379 shutdown
