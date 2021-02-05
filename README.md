### REST API using spring boot

This is a sample rest API for test tasks of Telestax SRE, build using Spring-boot framework. The deployment is done using kubernetes.
Deployment is created with a single replica and a nodeport service, Ingress resource has been used to provide an external IP address which provides public access to the API.

CI/CD implementation is made using Github actions. On pushing to the development branch jobs are executed automatically which are responsible for bulding a docker image and pushing into the ECR repository, it follows with a job which updates helm chart with the newly pushed docker image.

The docker image uses github sha as a unique tag for each build.

The infrastructure has been setup using terraform, the source code of which can be accessed from here.

Requirements:

* Maven
* JDK

For executing this API on local using maven:

```
mvn spring-boot:run
```

For executing the API on kubernetes
```
cd k8s/rest-api/
helm install rest-api-chart ./rest-api-chart --values ./rest-api-chart/values.yaml
```

For upgrading the helm chart:
```
cd k8s/rest-api/
helm upgrade --install rest-api-chart ./rest-api-chart --values ./rest-api-chart/values.yaml
```
