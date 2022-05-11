You have completed the kpack workshop!

In this workshop, you discovered how kpack uses Cloud Native Buildpacks to turn application source code into container images in a repeatable, secure, and scalable way, without the need for Dockerfiles.
You also learned how kpack alleviates Day 2 operational concerns by keeping images up-to-date as base images, buildpacks, and developer code change.

**Platform Choice**

An additional benefit of Cloud Native Buildpacks is that builders can be used from different CNB-compliant "platforms," not just kpack.
For example, you can build images using the `pack` CLI, the Spring Boot maven or gradle plugins, and more.

**Buildpack Choice**

You also have a choice of open source and commercial buildpack providers, and you can use the same builder that kpack is using from any other platform tool.

**Declarative Approach**

Every command you've run as part of this workshop can be replaced with declarative configuration for a fully GitOps-driven approach.

**Additional Resources**

If you are interested in more information, please visit the following websites:

- [kpack (OSS)](https://github.com/pivotal/kpack)
- [kp CLI (OSS)]()
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
