# WebApp

Java Maven web application (JSP, Tomcat 10, MySQL) with Docker and GitHub Actions CI/CD.

## Local run (Tomcat on localhost)

**Easiest — Docker Compose (build + run automatically):**

```bash
docker compose up --build
```

Open: **http://localhost:8080/WebApp/**

**Or manual Docker:**

```bash
mvn clean package -DskipTests
docker build -t webapp .
docker run -p 8080:8080 webapp
```

If port 8080 is busy, use `-p 8081:8080` and open http://localhost:8081/WebApp/

## GitHub Actions workflows

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `github-actions-demo.yml` | push | Lab demo |
| `build.yml` | all branches | CI: validate files + Maven build |
| `ci.yml` | main, master | Maven + Docker build (+ optional Docker Hub push) |
| `deploy.yml` | main | Build WAR, run Tomcat in Docker, verify http://localhost:8080/WebApp/ |
| `deploy-staging.yml` | develop | Same on port 8081 (staging) |

## Docker Hub (optional)

Add repository secrets: `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`. The CI workflow will push `USERNAME/webapp:latest` on push to main.
