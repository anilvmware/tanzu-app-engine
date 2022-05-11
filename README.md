# lab-kpack
=====================

Originally created for KubeCon 2022

### Run locally

1. Create a cluster:
```shell
git clone https://github.com/vmware-tanzu-labs/educates-local-dev
cd educates-local-dev
./create-cluster.sh
cd ..
```

2. Set up DNS.

3. Deploy the workshop:
```shell
git clone https://github.com/vmware-tanzu-labs/lab-kpack
cd lab-kpack
make
```

4. Open the workshop in a browser:
```shell
make open-workshop
```

### Deploy to an existing cluster

If you already have the Educates operator installed and configured, to
deploy and view this sample workshop, run:

```
git clone https://github.com/vmware-tanzu-labs/lab-kpack
cd lab-kpack
kubectl apply -f ./resources/workshop.yaml
kubectl apply -f ./resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/lab-kpack
```
