#!/usr/bin/env bash

# This script will query all of the data science pipeline applications and patch with an updated artifact workaround

DSPA_LIST=$(oc get datasciencepipelinesapplications.datasciencepipelinesapplications.opendatahub.io -A -o json > /tmp/dspa.json)

# get dspa list:
for DSPA in ${DSPA_LIST};
do

  if [[ $? != 0 ]];   # if not annotated with "dspa-patch" then patch
  then
    echo "Unpatched DSPA  (${DSPA}) FOUND, patching"
  else
    echo "DSPA  (${DSPA}) already patched"
  fi
done

