# go-layout

```bash
./create_project.sh -n <project_name> [-a <author>] [-o <organization>] [-s]
./createApi.sh -n myproject -a myname -o myorg
```
```bash
myapi
├── cmd
│   └── myapp
│       ├── main.go
│       └── router
│           ├── handler
│           │   ├── basehandler.go
│           │   └── eventhandler.go
│           └── router.go
├── go.mod
├── go.sum
├── internal
│   ├── myapp
│   │   └── event
│   │       └── event.go
│   └── pkg
│       ├── db
│       │   └── mysql.go
│       └── middleware
└── pkg
```
