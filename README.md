# Production Grade Kubernetes on GKE

## Build a Docker Image

`docker build -t web .`
`docker run -p 9292:9292 web`

## Push to Docker Hub

`docker login --username=[DOCKERHUB-USER] --email=[DOCKERHUB-EMAIL]`
`docker build -t dockleafdigital/gke-pgk-app:v1.0.1 .`
`docker push dockleafdigital/gke-pgk-app:v1.0.0`

## Setup Google Cloud

Install the Google Cloud SDK

`curl https://sdk.cloud.google.com | bash`
`exec -l $SHELL`
`gcloud init`
`gcloud config set project [PROJECT-ID]`
`gcloud config set compute/zone europe-west2-a`
`gcloud services enable compute.googleapis.com; gcloud services enable container.googleapis.com`


## Create a Kubernetes Cluster

`gcloud container clusters create pgk-russ-cl1`
`gcloud container clusters list`
`gcloud container clusters describe pgk-russ-cl1`

## Configure Cluster access

`gcloud config set container/cluster pgk-russ-cl1`
`gcloud container clusters get-credentials pgk-russ-cl1 --zone europe-west2-a --project production-grade-k8s-russ`
`gcloud auth application-default login`

## Connect to the Cluster from local machine

`gcloud components install kubectl`

## Creating a Deployment (Manually)

`kubectl run web --image dockleafdigital/gke-pgk-app:v1.0.0 --port 9292`
`kubectl get pods`
`kubectl expose deployment web --type=LoadBalancer --port 80 --target-port 9292`
`kubectl get services`

## Creating a Deployment (From Files)

`kubectl apply -f kubectl apply -f manifests/web-deployment.yaml`

## Scaling

`kubectl scale deployment gke-pgk-app --replicas=3`

## Deploying a new version of the App

`docker build -t dockleafdigital/gke-pgk-app:v1.0.1 .`
`docker push dockleafdigital/gke-pgk-app:v1.0.1`
`kubectl set image deployment/gke-pgk-app gke-pgk-app=dockleafdigital/gke-pgk-app:v1.0.2`
