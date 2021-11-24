#!/bin/sh -v

OCP_CLUSTER_WILDCARD=apps.cluster-bqnx2.bqnx2.sandbox1697.opentlc.com
ORACLE_IMAGE_URL='default-route-openshift-image-registry.apps.cluster-bqnx2.bqnx2.sandbox1697.opentlc.com\/amp\/system-oracle:2.11.0-1'
CURRENT_DIR=$(dirname $0)/..
ORACLE_USER=admin
ORACLE_PASS=oracle123
ORACLE_SID=apis
ORACLE_HOST=18.209.65.179
ORACLE_SYS_PASS=oracle123
REDIS_MASTER=54.242.215.50
REDIS_REPLICA_1=107.23.187.38
REDIS_REPLICA_2=54.227.102.185
REDIS_SENTINEL_1=54.242.215.50
REDIS_SENTINEL_2=107.23.187.38
REDIS_SENTINEL_3=54.227.102.185
REDIS_SENTINEL_GROUP_NAME=my-master

egrep -lR "\[redis-master-host\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[redis-master-host\]/$REDIS_MASTER/g"
egrep -lR "\[redis-replica-host-1\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[redis-replica-host-1\]/$REDIS_REPLICA_1/g"
egrep -lR "\[redis-replica-host-2\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[redis-replica-host-2\]/$REDIS_REPLICA_2/g"
egrep -lR "\[redis-sentinel-group-name\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[redis-sentinel-group-name\]/$REDIS_SENTINEL_GROUP_NAME/g"
egrep -lR "\[redis-sentinel-host-1\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[redis-sentinel-host-1\]/$REDIS_SENTINEL_1/g"
egrep -lR "\[redis-sentinel-host-2\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[redis-sentinel-host-2\]/$REDIS_SENTINEL_2/g"
egrep -lR "\[redis-sentinel-host-3\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[redis-sentinel-host-3\]/$REDIS_SENTINEL_3/g"
egrep -lR "\[oracle-user\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[oracle-user\]/$ORACLE_USER/g"
egrep -lR "\[oracle-password\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[oracle-password\]/$ORACLE_PASS/g"
egrep -lR "\[oracle-host\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[oracle-host\]/$ORACLE_HOST/g"
egrep -lR "\[oracle-sid\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[oracle-sid\]/$ORACLE_SID/g"
egrep -lR "\[oracle-system-password\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[oracle-system-password\]/$ORACLE_SYS_PASS/g"
egrep -lR "\[oracle-system-image-url\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[oracle-system-image-url\]/$ORACLE_IMAGE_URL/g"
egrep -lR "\[openshift-cluster-wildcard\]" $CURRENT_DIR | xargs -L1 sed -i -e "s/\[openshift-cluster-wildcard\]/$OCP_CLUSTER_WILDCARD/g"