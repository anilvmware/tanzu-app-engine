Run the following command to instruct kpack to build an image for a simple "Hello, world" application written in golang.

```terminal:execute
command: |-
    kp image create hello-go \
       --git {{ git_protocol }}://{{ git_host }}/hello-go.git \
       --git-revision main \
       --cluster-builder default \
       --tag {{ registry_host }}/hello-go \
       --wait
```

**Builder Image vs Dockerfile**

Notice that command above specifies a "builder" (`--cluster-builder default`).

Builders are CNB images that contain all the necessary resources and logic to turn source code into application images.
This includes build and run base images, and language-aware modules called buildpacks.

Hence, builders eliminate the need to create and maintain custom build scripts, such as Dockerfiles.

<br>

> If you're familiar with two-stage Dockerfiles, it may help to think of CNBs this way:
> - The build and run images are analogous to the base images in each stage
> - The buildpacks are analogous to the logic in the remaining instructions in the Dockerfile that process the application into layers

**Build Lifecycle**

As the image is building, take a look at the log output.

kpack utilizes [Cloud Native Buildpacks](https://buildpacks.io) (CNBs) to turn application source code into OCI images.
CNBs provide a structured way to build images.
You'll see the build happens in stages (Analyze, Detect, Restore, Build, Export).

1. **Analyze**: Validates proper registry access to complete the build.
2. **Detect**: Identifies the ordered group of buildpacks needed to process the application.
3. **Restore**: Restores any cached layers to speed up subsequent stages (none on the first build!).
4. **Build**: Executes buildpacks to produce the artifacts needed for runtime.
5. **Export**: Copies artifacts to a minimal runtime base image and pushes the image to the registry. Populates cache to make future builds faster.

**Published Image**

The build completes when the new image has been published to the registry.

Run the following command to verify that the image is in the registry.
```terminal:execute
command: skopeo list-tags docker://{{ registry_host }}/hello-go
```

The response should look something like this:
```shell
{
    "Repository": "registry-lab-kpack-w01-s001.educates-local-dev.xyz/hello-go",
    "Tags": [
        "b1.20220510.143656",
        "latest"
    ]
}
```
