# knative-hello-world

This repository serves as a demo of different ways a Knative developer may deploy their code, as well as a minimal code example to go with it.

The [app.js](app.js) code is a simple "Hello World" application that sets up a webserver, listens on port 8080 (by default), accepts HTTP POST requests and says hello.

01-prebuilt
---
This configuration leverages none of the Knative Build components, and relies on the developer prebuilding the container image and uploading it to a container registry. For example:

```
docker build . -t brianmmcclain/knative-hello-world:prebuilt
docker push brianmmcclain/knative-hello-world:prebuilt
kubectl apply -f 01-prebuilt.yaml
```

02-kaniko
---
This configuration begins to leverage the Knative Build components, specficially the [Kaniko Build Template], based on Google's [kaniko](https://github.com/GoogleContainerTools/kaniko) tool, which builds container images inside a container. This will still use our Dockerfile, but does not require the developer to build and upload the container image manually before deployment.

```
kubectl apply -f 02-kaniko.yaml
```

03-buildpack
---
Finally, this configuration uses another Build Template, the [Buildpack Build Template](https://github.com/knative/build-templates/tree/master/buildpack), which uses Cloud Foundry's buildpack build system. This no longer requires our Dockerfile to create the container image. Instead, it will investigate the codebase, recognize what sort of application it is (in this case, it will see that it's a Node.js application), and build a container from a managed base container image and bring in all the required dependencies and runtime.

```
kubectl apply -f 03-buildpack.yaml
```
