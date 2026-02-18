```mermaid
flowchart LR
  U[User] --> N[Nginx Service]
  N -->|/| F[Frontend Deployment]
  N -->|/api| B[Backend Deployment]
  B --> M[(Mongo StatefulSet + PVC)]

Lägg även in:
- Hur man deployar: `./deploy.sh`
- Hur man testar: port-forward och curl
- Vilka services och portar som gäller

### 4) Probes och resurser (för Gold plus, ofta för Diamond också)
Du kan lägga till:
- readiness och liveness på minst backend eller frontend.
- requests och limits.

Exempel för backend container:

```yaml
resources:
  requests:
    cpu: "100m"
    memory: "128Mi"
  limits:
    cpu: "500m"
    memory: "256Mi"
readinessProbe:
  httpGet:
    path: /
    port: 3000
  initialDelaySeconds: 5
  periodSeconds: 10
livenessProbe:
  httpGet:
    path: /
    port: 3000
  initialDelaySeconds: 15
  periodSeconds: 20
