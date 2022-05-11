**Welcome to the kpack workshop!**

[kpack](https://github.com/pivotal/kpack) is an open source, Kubernetes-native container build service that enables development teams to consistently build and update production-ready OCI images.

kpack makes it very easy to build and maintain images securely and repeatably, over time and at scale!

In this workshop, you will use kpack to:
- Build an image
- Rebuild the image
- Inspect image metadata and Bill of Materials
- Rebase the image (swap OS)

**Check environment**

kpack has already been installed into the workshop cluster.
However, some resources may take a moment to start up.
Please run this command to check if the environment is ready:
```terminal:execute
command: kubectl get clusterbuilder default
```

If the output looks like this, please wait a moment and re-run the command:
```shell
NAME      LATESTIMAGE   READY
default                 False
```

If the output looks like this (the "LATESTIMAGE" value will be different), then you're ready to get started!
```
NAME      LATESTIMAGE                                                                                                                          READY
default   registry-lab-kpack-kubecon-w01-s001.educates-local-dev.xyz/builder@sha256:db38b2ea5f11aa13d6c618ffea331038b718ca65d843826fa44734ddd2ed7afb   True
```