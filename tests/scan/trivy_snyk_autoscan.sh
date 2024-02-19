#!/bin/bash

declare -a arr=("nginx:latest" "nginx:1.23.0" mongo:latest" "mongo:4.4.3" "wordpress:latest" "wordpress:6.0.0" "alpine:latest" "alpine:3.11" "node:latest" "node:16.0.0)

for i in "${arr[@]}"
do
   echo "Scanning $i with Trivy and Snyk"
   trivy image --platform linux/amd64 --no-progress $i > trivy_$i.txt
   echo "Scanning $i with Snyk"
   snyk container monitor --platform=linux/amd64 --docker $i
done
