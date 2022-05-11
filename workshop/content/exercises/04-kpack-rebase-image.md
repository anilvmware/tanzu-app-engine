Upgrading the Operating System (OS) on all running machines has traditionally been an operational challenge that may take some organizations weeks or even months to complete.

This is one area where kpack shines.

Cloud Native Buildpacks allow you to swap out the OS layers of an image in seconds (or miliseconds).

Add kpack to the picture and you can swap out the operating system of all images in your registry within seconds.

This is a significant improvement in security posture for most organizations.

Let's give it a try now.

Swapping out the OS is called "rebasing."
kpack will automatically rebase images when a new stack (base and run images) is provided to the builder. (Otherwise, if application source code or buildpacks change, kpack executes a rebuild.)

Update the build and run images in the ClusterStack.
```terminal:execute
command: |-
    kp clusterstack save base \
       --build-image paketobuildpacks/build:1.1.59-base-cnb \
       --run-image paketobuildpacks/run:1.1.59-base-cnb
```

This automatically causes the ClusterBuilder to update.
Check the registry to verify that a second builder image was created.
```terminal:execute
command: skopeo list-tags docker://{{ registry_host }}/builder
```

The output should look like this:
```shell
{
    "Repository": "registry-{{session_namespace}}.{{ingress_domain}}/builder",
    "Tags": [
        "20220511024322",
        "latest",
        "20220511025201"
    ]
}
```

This triggers kpack to update the image.

Check the list of builds. You should see a new, third build.
```terminal:execute
command: kp build list
```

Check the build logs.
You can see they are different from the build logs—much shorter, with `Build reason(s): STACK`, and a single "rebase" phase.
```terminal:execute
command: kp build logs hello-go -b 3
```

Check the registry.
You should see a new image.
```terminal:execute
command: skopeo list-tags docker://{{ registry_host }}/hello-go
```

The new image uses the same layers as the previous one, with only the stack layers swapped out.
This means the image update was fast and safe, as no part of the image was changed unnecessarily.
It is ready to be re-deployed to your production cluster!
