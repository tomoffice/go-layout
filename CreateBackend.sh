#!/bin/bash

PROJECT_NAME=""
AUTHOR=""
ORGANIZATION=""
USE_SWAGGER=0  
USE_CI=0
USE_WORK=0

while getopts ":n:a:o:scw" opt; do
  case $opt in
    n) PROJECT_NAME="$OPTARG" ;;
    a) AUTHOR="$OPTARG" ;;
    o) ORGANIZATION="$OPTARG" ;;
    s) USE_SWAGGER=1 ;;
    c) USE_CI=1 ;;  
    w) USE_WORK=1 ;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
  esac
done

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: ./CreateBackend.sh -n <project_name> [-a <author>] [-o <organization>] [-s] [-c]"
  echo "  -n: Project name"
  echo "  -a: Author name"
  echo "  -o: Organization name"
  echo "  -s: Include Swagger support"
  echo "  -c: Include CI/CD support (GitHub Actions and GitLab CI)"
  echo "  -w: If used workspace"
  exit 1
fi

mkdir -p ${PROJECT_NAME}/cmd
mkdir -p ${PROJECT_NAME}/internal
mkdir -p ${PROJECT_NAME}/internal/models
mkdir -p ${PROJECT_NAME}/internal/handlers
mkdir -p ${PROJECT_NAME}/internal/utils
mkdir -p ${PROJECT_NAME}/internal/interfaces
mkdir -p ${PROJECT_NAME}/internal/middleware
mkdir -p ${PROJECT_NAME}/pkg/handlers
mkdir -p ${PROJECT_NAME}/pkg/models
mkdir -p ${PROJECT_NAME}/pkg/middleware
mkdir -p ${PROJECT_NAME}/pkg/utils
mkdir -p ${PROJECT_NAME}/scripts
mkdir -p ${PROJECT_NAME}/configs

touch ${PROJECT_NAME}/cmd/main.go
echo -e "package main\n\nfunc main() {\n\t\n}" > ${PROJECT_NAME}/cmd/main.go

if [ "$USE_CI" -eq 1 ]; then
  touch ${PROJECT_NAME}/.gitlab-ci.yml
  mkdir -p ${PROJECT_NAME}/.github/workflows
  touch ${PROJECT_NAME}/.github/workflows/go.yml
fi

cd ${PROJECT_NAME}

if [ -z "$ORGANIZATION" ]; then
  if [ -z "$AUTHOR" ]; then
    go mod init ${PROJECT_NAME}
  else
    go mod init ${AUTHOR}/${PROJECT_NAME}
  fi
else
  if [ -z "$AUTHOR" ]; then
    go mod init ${ORGANIZATION}/${PROJECT_NAME}
  else
    go mod init ${ORGANIZATION}/${AUTHOR}/${PROJECT_NAME}
  fi
fi

go mod tidy
if [ "$USE_WORK" -eq 1 ]; then
  go work use .
fi

go get -u github.com/gin-gonic/gin
if [ "$USE_SWAGGER" -eq 1 ]; then
  go install github.com/swaggo/swag/cmd/swag@latest
  go get -u github.com/swaggo/gin-swagger
  go get -u github.com/swaggo/files
fi

git init .
touch .gitignore
git add .
git commit -m "first commit"
