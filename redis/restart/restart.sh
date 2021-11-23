#!/bin/sh

DIR=$(dirname $0)

echo "stoping servers..."
$DIR/stop.sh
$DIR/start.sh
