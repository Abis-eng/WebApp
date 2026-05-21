# WebApp

Java Maven web application (JSP, Tomcat 10, MySQL) with Docker and GitHub Actions CI/CD.

## Local run

```bash
mvn clean package -DskipTests
docker build -t webapp .
docker run -p 8081:8080 webapp
```

Open: http://localhost:8081/WebApp/

## GitHub Actions workflows

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `github-actions-demo.yml` | push | Lab demo |
| `build.yml` | all branches | CI: validate files + Maven build |
| `ci.yml` | main, master | Maven + Docker build (+ optional Docker Hub push) |
| `deploy.yml` | main | GitHub Pages (production) |
| `deploy-staging.yml` | develop | GitHub Pages (staging folder) |

## Docker Hub (optional)

Add repository secrets: `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`. The CI workflow will push `USERNAME/webapp:latest` on push to main.

## GitHub Pages

Settings → Pages → Source: **GitHub Actions**.
