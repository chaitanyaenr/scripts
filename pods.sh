#!/bin/bash

pod_count=0
for node in $(oc get nodes -l="nodevertical=true" | awk 'NR > 1 {print $1}'); do
	pods_running=$(oc describe node $node | grep -w "Non-terminated \Pods:" | awk  '{print $3}' | sed "s/(//g")
	pod_count=$(( pod_count+pods_running ))
done

echo $pod_count
