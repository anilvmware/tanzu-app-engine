You have completed the kpack workshop!

In this workshop, you discovered how kpack uses Cloud Native Buildpacks to turn application source code into container images in a repeatable, secure, and scalable way, without the need for Dockerfiles.
You also learned how kpack alleviates Day 2 operational concerns by keeping images up-to-date as base images, buildpacks, and developer code change.

**Declarative Approach**

kpack is a Kubernetes-native platform.
Every command you've run as part of this workshop can be replaced with declarative configuration for a fully GitOps-driven approach.

**Platform Choice**

This lab showcased the use of kpack to automate image builds at scale.
However, you can use other CNB-compliant platforms tailored to different user experiences.
For example, you can build images using the pack CLI, the Spring Boot maven or gradle plugins, and more.

**Buildpack Choice**

In this lab, you used Paketo Buildpacks.
You also have a choice of other open source and commercial buildpack providers.

**Additional Resources**

If you are interested in more information, please visit the following websites:

- [kpack (OSS)](https://github.com/pivotal/kpack)
- [kp CLI (OSS)](https://github.com/vmware-tanzu/kpack-cli)
- [Cloud Native Buildpacks (OSS)](https://buildpacks.io)
- [Paketo Buildpacks (OSS)](https://paketo.io)
- [Tanzu Build Service (commercial version of kpack)](https://tanzu.vmware.com/build-service)

A few additional tools for using Cloud Native Buildpacks:

- [pack CLI (OSS)](https://buildpacks.io/docs/tools/pack/cli/pack)
- [Spring Boot Maven Plugin (OSS)](https://docs.spring.io/spring-boot/docs/current/maven-plugin/reference/htmlsingle/#build-image)
- [Spring Boot Gradle Plugin (OSS)](https://docs.spring.io/spring-boot/docs/current/gradle-plugin/reference/htmlsingle/#build-image)

Remember - kpack is an open source project that can be installed on any Kubernetes cluster!
It is also available as part of the [Tanzu Community Edition](https://tanzucommunityedition.io) package repository.

**Thank you for completing the workshop!**
