
# Kubernetes Flask App – First Project

This project demonstrates how to **containerize a Flask web application using Docker** and  **deploy it on a Kubernetes cluster using Minikube** .

It is designed as a  **beginner-friendly, end-to-end Kubernetes learning project** .

---
## Here is the [DockerHub Repo Link](https://hub.docker.com/repository/docker/jeet047/kubernetes-first-app)

## Project Overview

* Build a simple Flask web application
* Containerize the application using Docker
* Deploy the containerized app on Kubernetes
* Run and test everything locally using Minikube
* Understand core Kubernetes concepts such as Pods, Deployments, and Services

---

## Tech Stack

* **Backend** : Flask (Python)
* **Containerization** : Docker
* **Orchestration** : Kubernetes
* **Local Cluster** : Minikube
* **Container Registry** : Docker Hub (optional)

---

## Application Features

* Simple Flask web UI
* User input form with dynamic response
* Clean and responsive frontend
* Runs inside a Kubernetes Pod
* Exposed via Kubernetes Service

---

## Project Structure

<pre class="overflow-visible! px-0!" data-start="1227" data-end="1641"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-text"><span><span>kubernetes-flask-app/
│
├── app.py                  # Flask application
├── requirements.txt        # Python dependencies
├── Dockerfile              # Docker image definition
├── deployment.yaml         # Kubernetes deployment & service
├── templates/
│   └── index.html          # HTML template
├── static/
│   └── style.css           # CSS styling
└── README.md               # Project documentation
</span></span></code></div></div></pre>

---

## Prerequisites

Make sure the following tools are installed and running:

* Docker Desktop
* Docker Hub account (optional)
* Minikube
* kubectl
* Python 3.8+

Verify installations:

<pre class="overflow-visible! px-0!" data-start="1832" data-end="1902"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>docker --version
kubectl version --client
minikube version
</span></span></code></div></div></pre>

---

## Step 1: Run the Flask App Locally (Optional)

<pre class="overflow-visible! px-0!" data-start="1958" data-end="2015"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>pip install -r requirements.txt
python app.py
</span></span></code></div></div></pre>

Access the app at:

<pre class="overflow-visible! px-0!" data-start="2037" data-end="2070"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-text"><span><span>http://localhost:5000
</span></span></code></div></div></pre>

---

## Step 2: Build Docker Image

Create the Docker image:

<pre class="overflow-visible! px-0!" data-start="2134" data-end="2190"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>docker build -t kubernetes-test-app:latest .
</span></span></code></div></div></pre>

Verify the image:

<pre class="overflow-visible! px-0!" data-start="2211" data-end="2236"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>docker images
</span></span></code></div></div></pre>

Run the container locally to test:

<pre class="overflow-visible! px-0!" data-start="2274" data-end="2336"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>docker run -p 5000:5000 kubernetes-test-app:latest
</span></span></code></div></div></pre>

---

## Step 3: Start Minikube

Start the local Kubernetes cluster:

<pre class="overflow-visible! px-0!" data-start="2407" data-end="2433"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>minikube start
</span></span></code></div></div></pre>

Check cluster status:

<pre class="overflow-visible! px-0!" data-start="2458" data-end="2503"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>minikube status
kubectl get nodes
</span></span></code></div></div></pre>

---

## Step 4: Load Docker Image into Minikube

For local Minikube usage:

<pre class="overflow-visible! px-0!" data-start="2581" data-end="2639"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>minikube image load kubernetes-test-app:latest
</span></span></code></div></div></pre>

Verify image availability:

<pre class="overflow-visible! px-0!" data-start="2669" data-end="2700"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>minikube image list
</span></span></code></div></div></pre>

---

## Step 5: Deploy Application to Kubernetes

Apply the deployment configuration:

<pre class="overflow-visible! px-0!" data-start="2789" data-end="2833"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>kubectl apply -f deployment.yaml
</span></span></code></div></div></pre>

Check deployment and pods:

<pre class="overflow-visible! px-0!" data-start="2863" data-end="2915"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>kubectl get deployments
kubectl get pods
</span></span></code></div></div></pre>

---

## Step 6: Expose and Access the Application

Expose the service and open it in the browser:

<pre class="overflow-visible! px-0!" data-start="3016" data-end="3064"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>minikube service kubernetes-test-app
</span></span></code></div></div></pre>

You should now see the Flask application running on Kubernetes.

---

## Step 7: Verify and Monitor

Check Kubernetes resources:

<pre class="overflow-visible! px-0!" data-start="3196" data-end="3223"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>kubectl get all
</span></span></code></div></div></pre>

View logs:

<pre class="overflow-visible! px-0!" data-start="3237" data-end="3272"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>kubectl logs <pod-name>
</span></span></code></div></div></pre>

Open Kubernetes dashboard (optional):

<pre class="overflow-visible! px-0!" data-start="3313" data-end="3343"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>minikube dashboard
</span></span></code></div></div></pre>

---

## Step 8: Test Fault Tolerance (Optional)

Delete a pod manually:

<pre class="overflow-visible! px-0!" data-start="3418" data-end="3459"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>kubectl delete pod <pod-name>
</span></span></code></div></div></pre>

Kubernetes will automatically create a new pod, demonstrating  **self-healing** .

---

## Step 9: Stop the Cluster

When finished:

<pre class="overflow-visible! px-0!" data-start="3592" data-end="3617"><div class="contain-inline-size rounded-2xl corner-superellipse/1.1 relative bg-token-sidebar-surface-primary"><div class="@w-xl/main:top-9 sticky top-[calc(--spacing(9)+var(--header-height))]"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-bash"><span><span>minikube stop
</span></span></code></div></div></pre>

---

## Key Learnings

* How Docker and Kubernetes work together
* How to deploy a containerized application
* Understanding Pods, Deployments, and Services
* Local Kubernetes development using Minikube
* Basic debugging and monitoring of Kubernetes apps

---

## Future Improvements

* Add ConfigMaps and Secrets
* Add horizontal pod autoscaling
* Deploy on cloud Kubernetes (EKS / GKE / AKS)
* Add CI/CD pipeline

---

## Conclusion

This project serves as a **solid foundation for Kubernetes fundamentals** and real-world deployment workflows.

It is ideal for beginners who want hands-on experience with container orchestration.
