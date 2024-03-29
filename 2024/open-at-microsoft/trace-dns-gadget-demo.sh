#!/bin/bash

# Workload to demo trace dns gadget
kubectl run dns-test --image=busybox -- /bin/sh -c "while true; do nslookup -querytype=a www.example.com && sleep 3; nslookup -querytype=a www.wrong-url.test && sleep 12; done"
