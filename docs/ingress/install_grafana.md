# Install Grafana via Argo CD

In this step, you will use GitOps to install Grafana leveraging Argo CD.

## Update Argo CD Application Manifest

You will need to update the Grafana Argo CD manifest to match your environment.  

1. Open the `manifests/grafana-subchart.yaml` file in your forked version of the **infra** repository.

1. Find the following variables and replace them with your information:

    | Variable        | Value           |
    |-----------------|-----------------|
    | \<GITHUB_USER\>   | github username |

    Your file should look similar to the example below:

    ```yaml
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: grafana
      namespace: argocd
      finalizers:
        - resources-finalizer.argocd.argoproj.io
    spec:
      project: default
      source:
        path: charts/grafana
        repoURL: https://github.com/codygreen/modern_app_jumpstart_workshop.git
        targetRevision: HEAD
      destination:
        namespace: monitoring
        server: https://kubernetes.default.svc
      syncPolicy:
        automated:
          selfHeal: true
          prune: true
        syncOptions:
          - CreateNamespace=true
          - ApplyOutOfSyncOnly=true
    ```

1. Save the file. Stage the changes, and commit to your local **infra** repository. Push the changes to your remote **infra** repository.

## Deploy the manifest

To deploy the Grafana Argo CD application, run the following command:

```bash
kubectl apply -f manifests/grafana-subchart.yaml
```

## Verify Install

You should now see a new Grafana application in your Argo CD dashboard. Click on the Grafana application and verify there are no errors.

**Note:** A Prometheus datasource and a Dashboard for NGINX Ingress Controller have been pre-configured in Grafana. These can be seen in your `charts/grafana/values.yaml` file. We will utilize these in an upcoming exercise.

## Next Steps

Next, you will [install the Brewz Application](brewz.md)
