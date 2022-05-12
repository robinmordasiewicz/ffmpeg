#!/bin/bash
#

echo "deploy ffmpeg container"

kubectl apply -f deployment.yaml --namespace r-mordasiewicz

echo "kubectl exec --namespace r-mordasiewicz -it ffmpeg -c ffmpeg -- /bin/bash"
