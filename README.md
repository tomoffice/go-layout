# go-layout
Usage: ./CreateBackend.sh -n <project_name> [-a <author>] [-o <organization>] [-s] [-c]
  -n: Project name
  -a: Author name
  -o: Organization name
  -s: Include Swagger support
  -c: Include CI/CD support (GitHub Actions and GitLab CI)
```bash
./CreateBackend.sh -n <project_name> [-a <author>] [-o <organization>] [-s] [-c]
./CreateBackend.sh -n myproject -a myname -o myorg
```
```bash
myproject
├── .git
│   ├── COMMIT_EDITMSG
│   ├── FETCH_HEAD
│   ├── HEAD
│   ├── config
│   ├── description
│   ├── hooks
│   ├── index
│   ├── info
│   ├── logs
│   ├── objects
│   └── refs
├── .github
│   └── workflows
├── .gitignore
├── .gitlab-ci.yml
├── cmd
│   └── main.go
├── configs
├── go.mod
├── go.sum
├── internal
│   ├── handlers
│   ├── interfaces
│   ├── middleware
│   ├── models
│   └── utils
├── pkg
│   ├── handlers
│   ├── middleware
│   ├── models
│   └── utils
├── scripts
└── vendor
```
note: "-s" is enable swagger "-c" is ci/cd for gitlab and github
