# Building

`docker build -t web .`
`docker run -p 9292:9292 web`

# Pushing to Docker Hub

`docker login --username=yourhubusername --email=youremail@company.com`
`docker build -t dockleafdigital/gke-pgk-app:v1.0.0 .`
`docker push dockleafdigital/gke-pgk-app:v1.0.0`

# Google Cloud

Install the Google Cloud SDK

`curl https://sdk.cloud.google.com | bash`
`exec -l $SHELL`
`gcloud init`


# Kubernetes Deployment