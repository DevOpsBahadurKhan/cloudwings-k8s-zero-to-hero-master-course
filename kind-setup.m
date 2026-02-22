<!-- 🐳 Step-1: Install Docker -->
$ sudo apt update
$ sudo apt install docker.io -y
$ sudo systemctl start docker
$ sudo systemctl enable docker
$ sudo usermod -aG docker $USER
$ newgrp docker


<!-- ☸️ Step-2: Install kubectl (Stable & Updated)-->
$ curl -LO https://dl.k8s.io/release/v1.29.4/bin/linux/amd64/kubectl
$ chmod +x kubectl
$ sudo mv kubectl /usr/local/bin/
$ kubectl version --client


<!--🧩 Step-3: Install KIND -->
$ curl -Lo kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
$ chmod +x kind
$ sudo mv kind /usr/local/bin/
$ kind --version

##Skip for Beginner##
<!-- Step-4: Create KIND config (Multi-Node)  --> 
$ vi kind-config.yaml

kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
  - role: worker
  - role: worker

$ kind create cluster \
  --name mycluster \
  --image kindest/node:v1.29.4 \
  --config kind-config.yaml


 
<-- Step-5: Create KIND Cluster (Stable Kubernetes) -->
$ kind create cluster \
  --name mycluster \
  --image kindest/node:v1.29.4 \
  --config kind-config.yaml



<-- Step 6: Verify Cluster -->
kubectl get nodes
kubectl cluster-info
kubectl get pods -A

<-- Step 7: additional fixes --> note required

sudo ls -l /root/.kube/config

mkdir -p $HOME/.kube
sudo cp /root/.kube/config $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config







