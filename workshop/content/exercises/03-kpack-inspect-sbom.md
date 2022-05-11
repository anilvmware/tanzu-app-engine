The consistency of the build process makes it easy to audit and control what is running on your platform at any given time.
You can assess your risk from a given CVE* quickly, and remediate a patch moments later.

**Build Process Metadata**

Let's say you learn that a certain run image or buildpack version contains a vulnerability.
How can you know if your image is affected?
Check the build metadata to find out!
```terminal:execute
command: pack inspect {{ registry_host }}/hello-go
```

The output should look something like this.
It includes the exact run image, buildpack versions, and application launch process.
You could easily determine if you need to provide updated base images or buildpacks and recreate the image to eliminate the vulnerability.

```shell
Inspecting image: registry-lab-kpack-w01-s001.educates-local-dev.xyz/hello-go

REMOTE:

Stack: io.buildpacks.stacks.bionic

Base Image:
  Reference: projects.registry.vmware.com/kpack/dependencies@sha256:38199b888e33bed03b98bfed20a091733f502c33ced1a6660ed5c92ed82308ea
  Top Layer: sha256:af9f6b0bf05c451f874ded1589defaae194e3c095508da8ae4aaa3683744d100

Run Images:
  projects.registry.vmware.com/kpack/dependencies@sha256:38199b888e33bed03b98bfed20a091733f502c33ced1a6660ed5c92ed82308ea

Buildpacks:
  ID                                       VERSION        HOMEPAGE
  paketo-buildpacks/ca-certificates        3.1.0          https://github.com/paketo-buildpacks/ca-certificates
  paketo-buildpacks/go-dist                1.1.1          https://github.com/paketo-buildpacks/go-dist
  paketo-buildpacks/git                    0.4.1          https://github.com/paketo-buildpacks/git
  paketo-buildpacks/go-mod-vendor          0.6.0          https://github.com/paketo-buildpacks/go-mod-vendor
  paketo-buildpacks/go-build               1.1.1          https://github.com/paketo-buildpacks/go-build

Processes:
  TYPE                          SHELL        COMMAND                                                            ARGS        WORK DIR
  hello-server (default)                     /layers/paketo-buildpacks_go-build/targets/bin/hello-server                    /workspace
```

**Software Bill of Materials**

Perhaps you learned a certain dependency was compromised—for example, Go Runtime version 1.17.
Export the Software Bill of Materials (SBOM) to see dependencies reported by buildpacks.
```terminal:execute
command: |-
    pack sbom download {{ registry_host }}/hello-go --remote \
         && tree layers/
```

The output should look something like this.
You can see the content is provided in different formats.
```shell
hello-go/layers/
└── sbom
    └── launch
        ├── paketo-buildpacks_ca-certificates
        │         └── helper
        │             └── sbom.syft.json
        └── paketo-buildpacks_go-build
            └── targets
                ├── sbom.cdx.json
                ├── sbom.spdx.json
                └── sbom.syft.json
```

Open the SYFT-formatted file in the editor and find the version of the Go binary used.
You would be able to verify if it is the same as the Go Runtime version with the known vulnerability.
```editor:select-matching-text
file: ~/layers/sbom/launch/paketo-buildpacks_go-build/targets/sbom.syft.json
text: "goCompiledVersion"
before: 0
after: 0
```

**Getting a Patch!**

If indeed you indentified a vulnerable component in the image, you would need to update your builder with a new stack (build and run base OS images) or store (collection of buildpacks).
You would obtain these from your buildpacks provider.
In this case, we are using [Paketo Buildpacks](paketio.io).

**Automated Updates at Scale**

Once you update the builder in your registry, kpack will automatically update all impacted images.

As you can see, kpack can patch any number of images in a safe, secure, and consistent way. You can then re-deploy the images to your productions clusters to eliminate the known vulnerabilities.

> Note: You will see this in action in the next exercise.

<br>
<hr/>
 * CVE: Common Vulnerabilities and Exposures
