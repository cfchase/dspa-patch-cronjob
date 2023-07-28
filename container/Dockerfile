# This image is just to allow the use of jq to parse the oc cli json output
FROM registry.redhat.io/openshift4/ose-cli:v4.12

RUN yum install -y --quiet \
    jq \
    && yum clean all

COPY patch-dspa.sh /usr/bin/patch-dspa.sh
COPY patch-all-dspas.sh /usr/bin/patch-all-dspas.sh
COPY patch-dspa.yaml /usr/bin/patch-dspa.yaml

USER 1001
