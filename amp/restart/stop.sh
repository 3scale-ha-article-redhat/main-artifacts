#!/bin/sh

CRD_NAME=my-apimanager
SCALE_SPEC=$(oc get APIManager ${CRD_NAME} -o json|jq ".spec"|sed s/'"replicas": 1'/'"replicas": 0'/g)
oc patch APIManager ${CRD_NAME} --type merge -p "{\"spec\": ${SCALE_SPEC}}"

oc scale dc/system-sphinx --replicas=0
#oc scale dc/backend-redis --replicas=0
oc scale dc/system-memcache --replicas=0
#oc scale dc/system-mysql --replicas=0
#oc scale dc/system-redis --replicas=0
oc scale dc/zync-database --replicas=0
