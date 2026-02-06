<!-- Step : Install Docker -->
sudo apt-get install docker.io

<!-- step-2: Install kubectl -->
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client

<!-- Step-3 : Install kind -->
curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/
kind --version

<!-- Step-4 : Setup yaml for Multi node cluster -->

$ vi kind-config.yaml
# Multi-node KIND cluster
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    extraPortMappings:
      - containerPort: 80
        hostPort: 80
        protocol: TCP
      - containerPort: 443
        hostPort: 443
        protocol: TCP
  - role: worker
  - role: worker

% Step 5: Create Cluster
kind create cluster --name mycluster --config kind-config.yaml

% Step 6: Verify Cluster
kubectl get nodes
kubectl cluster-info
kubectl get pods -A




