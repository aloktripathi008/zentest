This directory is having a Kubernetes deployment using kustomize templates. 
For a deployment we are using a sample contenarised application written in node.js.


While Deploying the application, we need some prerequisites to be fulfilled or assumed to have in order tp run the app successfully.

Assumptions/PreRequisites: 
>>>> kubectl is installed on system, I have used version v1.21.1.
>>>> ingress-controller is deployed already on cluster in order to expose application with url & with dummy web security certificate, I have haproxy as ingress-controller in my setup.


Deployment:

-   kubectl apply -k kustomize/mongo/base
-   kubectl apply -k kustomize/minio/base
-   kubectl apply -k kustomize/app/base




