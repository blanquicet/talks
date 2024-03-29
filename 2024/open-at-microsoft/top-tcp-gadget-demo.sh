#!/bin/bash

# Workload to demo top tcp gadget
kubectl run pod-1 --image=python:3.7-alpine -- /bin/sh -c "truncate -s 50G testfile && python -m http.server 8080 --bind pod-1"
kubectl run pod-2 --image=busybox -- /bin/sh -c "while true; do wget `kubectl get pod pod-1 -o jsonpath={.status.podIP}`:8080/testfile -O /dev/null; sleep 1; done"
