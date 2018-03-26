# Production Grade Kubernetes on GKE

## Building

`docker build -t web .`
`docker run -p 9292:9292 web`

## Pushing to Docker Hub

`docker login --username=[DOCKERHUB-USER] --email=[DOCKERHUB-EMAIL]`
`docker build -t [DOCKERHUB-USERNAME]/gke-pgk-app:v1.0.0 .`
`docker push [DOCKERHUB-USERNAME]/gke-pgk-app:v1.0.0`

## Google Cloud

Install the Google Cloud SDK

`curl https://sdk.cloud.google.com | bash`
`exec -l $SHELL`
`gcloud init`

# Kubernetes Deployment