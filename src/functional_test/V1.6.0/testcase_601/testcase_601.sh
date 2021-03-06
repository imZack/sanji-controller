#!/bin/sh

source ../testcase_config

###################################################
# Test Items:
#	1. Test basic CRUD method of resource dependency resource
###################################################

# register 'ethernet' model
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/register/request_create_model_ethernet.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/register/request_create_view_v-ethernet.json
sleep 1

# CRUD method
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_create_dependency.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_read_dependency.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_update_dependency.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_delete_dependency.json
sleep 1

