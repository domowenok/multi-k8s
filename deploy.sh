docker build -t simkamax777/multi-client:latest -t simkamax777/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t simkamax777/multi-server:latest -t simkamax777/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t simkamax777/multi-worker:latest -t simkamax777/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push simkamax777/multi-client:latest
docker push simkamax777/multi-server:latest
docker push simkamax777/multi-worker:latest

docker push simkamax777/multi-client:$SHA
docker push simkamax777/multi-server:$SHA
docker push simkamax777/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployment/server-deployment server=simkamax777/multi-server:$SHA
kubectl set image deployment/client-deployment client=simkamax777/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=simkamax777/multi-worker:$SHA
