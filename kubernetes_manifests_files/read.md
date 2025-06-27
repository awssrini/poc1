# Deployment steps for in kubernetes cluster

kubectl create namespace confluent
kubectl config set-context --current --namespace confluent

kubectl apply -f confluent-scc.yaml
kubectl adm policy add-scc-to-user confluent-scc -z confluent-for-kubernetes -n confluent


### Install Helm on WSL

	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3

	chmod 700 get_helm.sh

	./get_helm.sh

	helm version
### Deploy confluent Operator 
#### dowlnoad the confluent operator from confluent website 

curl -O https://packages.confluent.io/bundle/cfk/confluent-for-kubernetes-2.9.3.tar.gz

tar -xvzf confluent-for-kubernetes-2.9.3.tar.gz

cd /home/confluent/confluent-for-kubernetes-2.9.3-20240911/helm
helm upgrade --install confluent-operator --namespace confluent confluent-for-kubernetes --set kRaftEnabled=true -f /home/confluent/kube-manifests/cfk-helm-values.yaml 

### Deploy Confluent Kafka Pods

kubectl apply -f 00-kraft.yaml
kubectl apply -f 01-kafka.yaml

sh load_c3_basic_users.sh

kubectl apply -f 02-controlcenter_basic.yaml
