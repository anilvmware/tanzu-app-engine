In the previous step, you configured the kpack Image resource to point to branch "main" of the source code repository (`--git-revision main`).

Any commit to this branch will trigger a rebuild. However, kpack polls the git repo every 5 minutes. In the interest of time, we are going to take another approach to trigger a rebuild.

In many real-world scenarios, you only want to trigger builds for code that has passed testing.
To accomplish this, you can set the revision of the Image resource to a specific git commit or tag to trigger only specific rebuilds.

> In reality, you would accomplish this using your Continuous Integration pipeline to update the value in the Image resource.

Update the image to build a specific commit id.
```terminal:execute
command: |-
    kp image patch hello-go \
      --git-revision 03ce0a044a036a74b40f0afcfaa0590cb10edecd
```

This time the build should be faster, as it is leveraging cache.
Check the logs to see the progress.
You should see `Build reason(s): COMMIT` near the beginning of the log.
```terminal:execute
command: kp build logs hello-go
```

When the build is complete, check the images on the registry. You should see a second image.
```terminal:execute
command: skopeo list-tags docker://{{ registry_host }}/hello-go
```

The response should look something like this:
```shell
{
    "Repository": "registry-{{session_namespace}}.{{ingress_domain}}/hello-go",
    "Tags": [
        "b1.20220510.143656",
        "latest"
        "b2.20220511.024535",
    ]
}
```
