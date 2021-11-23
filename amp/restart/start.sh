#!/bin/sh

#oc scale dc/backend-redis --replicas=1
oc scale dc/system-memcache --replicas=1
#oc scale dc/system-mysql --replicas=1
#oc scale dc/system-redis --replicas=1
oc scale dc/zync-database --replicas=1
oc scale dc/system-sphinx --replicas=1

CRD_NAME=my-apimanager
SCALE_SPEC=$(oc get APIManager ${CRD_NAME} -o json|jq ".spec"|sed s/'"replicas": 0'/'"replicas": 1'/g)
oc patch APIManager ${CRD_NAME} --type merge -p "{\"spec\": ${SCALE_SPEC}}"
