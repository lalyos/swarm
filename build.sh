go install -v -tags netgo -ldflags "-w -X github.com/docker/swarm/version.GITCOMMIT `git rev-parse --short HEAD`"

GOOS=darwin bash -c 'go build -v -tags netgo && zip release/0.1.0_${GOOS}_amd64.zip ./swarm'
GOOS=linux bash -c 'go build -v -tags netgo && zip release/0.1.0_${GOOS}_amd64.zip ./swarm'
GITHUB_ACCESS_TOKEN=$GHT gh-release create lalyos/swarm 0.1.1
