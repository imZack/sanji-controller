#!/bin/sh

source ../testcase_config

###################################################
# Test Items:
#	1.	routing wirte-like request (model listen multi-resources)
#
# Important things:
# 1. Model should not change the header when response.
#    Header should maintain exactly the same as request except 'code' and 'sign'.
# 2. When resource get multi-subscribed model,
#    response data will be merged.
###################################################

# register
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/register/request_create_model_ethernet.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/register/request_create_model_cellular.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/register/request_create_model_route.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/register/request_create_view_v-ethernet.json
sleep 1

# update
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_update_ethernet.json
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_update_succ_ethernet.json
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_update_succ_route1.json
sleep 1

${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_update_cellular.json
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_update_succ_route2.json
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_update_succ_cellular.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_update_route.json
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_update_succ_route3.json

