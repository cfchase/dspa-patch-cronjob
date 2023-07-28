#!/usr/bin/env bash

DSPA_NAME="${1:-sample}"
DSPA_NAMESPACE="${2:-default}"

if [ "$#" -ne 2 ]; then
    echo "Usage: apply_custom_script.sh <dspa_name> <dspa_namespace>"
    exit 1
fi


patch='{"spec":{"apiServer":{"artifactScriptConfigMap":{"name":"custom-script","key":"artifact_script"}}}}'
artifact_script="https://gist.githubusercontent.com/HumairAK/47fc1aceb3933b0647e3a9c7753edd0d/raw/356d43e29eda133b30a09409a19d478e0f384ee2/custom_artifact_script.yaml"

oc apply -n ${DSPA_NAMESPACE} -f ${artifact_script}
oc patch dspa ${DSPA_NAME} -n ${DSPA_NAMESPACE}  --type=merge -p ${patch}
