# go-layout

```bash
./CreateBackend.sh -n <project_name> [-a <author>] [-o <organization>] [-s]
./CreateBackend.sh -n myproject -a myname -o myorg
```
```bash
myproject
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
note: -s is enable swagger
