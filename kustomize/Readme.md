This directory is having a Kubernetes deployment using kustomize templates. 
For a deployment we are using a sample contenarised application written in node.js.


While Deploying the application, we need some prerequisites to be fulfilled or assumed to have in order tp run the app successfully.

**Assumptions/PreRequisites: **
>>>> kubectl is installed on system, I have used version v1.21.1.
>>>> ingress-controller is deployed already on cluster in order to expose application with url & with dummy web security certificate, I have haproxy as ingress-controller in my setup.


**Deployment:**

-   kubectl apply -k kustomize/mongo/base
-   kubectl apply -k kustomize/minio/base
-   kubectl apply -k kustomize/app/base

url for accessing the application:

https://foo.bar.com/

The asked requirements are handled below:


**a. An application that returns some data to https requests:**
you can use curl -ki https://foo.bar.com/ to see the return data

b. **Is highly available:**
The app is deployed using two replicas, update strategy is rolling update & pod antiaffinity is deployed to make it highly available in various conditions.

c. **Is able to persist data beyond the life of the application:**
The app is using Persistent volume in order to persist the data even beyond the life of application.

d. **Securely stores and accesses its web security certificate (this cert can be any
dummy file)**
Dummy files `ca.crt` & `ca.key` is used to create a self signed dummy certificate for the application.

**Bonus:**

a. **Only receives requests once the application is started**
`liveness` & `readiness` probe is deployed

b. **Automatically restarts if the application is unresponsive**
`restartPolicy` is deployed 

c. **Only one replica can be unavailable at any time**
`maxUnavailable: 1` is set under updatestrategy

d. **Organize Kubernetes resource manifests using Kustomize and/or Helm**
Resources are organized using Kustomize (Helm one will be updated soon)

e. **Deploy the application into a service mesh**
`Servicemesh Istio` is used in the application at basic level, Deployement files are present in the repo.





