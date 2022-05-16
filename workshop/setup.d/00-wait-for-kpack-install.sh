#!/bin/bash

# Wait for CRDs for kpack-controller to have been created.

STATUS=1
ATTEMPTS=0
ROLLOUT_STATUS_CMD="kubectl get crd/clusterbuilders.kpack.io"

until [ $STATUS -eq 0 ] || $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -eq 12 ]; do
    sleep 5
    $ROLLOUT_STATUS_CMD
    STATUS=$?
    ATTEMPTS=$((attempts + 1))
done

# Now wait for deployment of kpack-controller. We don't care about the
# kpack-webhook component at this point.

STATUS=1
ATTEMPTS=0
ROLLOUT_STATUS_CMD="kubectl rollout status deployment/kpack-controller -n kpack"

until [ $STATUS -eq 0 ] || $ROLLOUT_STATUS_CMD || [ $ATTEMPTS -eq 12 ]; do
    sleep 5
    $ROLLOUT_STATUS_CMD
    STATUS=$?
    ATTEMPTS=$((attempts + 1))
done
