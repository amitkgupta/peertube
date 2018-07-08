# PeerTube

Federated (ActivityPub) video streaming platform using P2P (BitTorrent) directly in the web browser with WebTorrent.

## Introduction

This chart bootstraps a [PeerTube](https://joinpeertube.org/) deployment on a [Kubernetes](https://kubernetes.io/) cluster using the [Helm](https://www.helm.sh/) package manager.

## Configuration

The following table lists the configurable parameters of the PeerTube chart and their default values.

| Parameter                    | Description                                                                                              | Default               |
| ---------------------------- | -------------------------------------------------------------------------------------------------------- | --------------------- |
| `image.repository`           | repository containing main PeerTube webserver image                                                      | `chocobuzzz/peertube` |
| `image.tag`                  | tag of PeerTube webserver image within repository                                                        | `production-stretch`  |
| `image.pullPolicy`           | PeerTube webserver image pull policy                                                                     | `IfNotPresent`        |
| `adminEmail`                 | email of PeerTube admin user                                                                             | `nil `                |
| `webserver.hostname`         | hostname by which users will access PeerTube deployment; used in HTML pages for asset URLs               | `nil`                 |
| `webserver.https.enabled`    | if `true`, users should access PeerTube deployment over HTTPS; used in HTML pages for asset URLs         | `true`                |
| `pvc.enabled`                | if `true`, uploaded video content will be persisted			                                          | `true`                |
| `pvc.existingClaim`          | name of existing PVC to use, must allow R/W access; if `nil` and PVC enabled, new PVC created            | `nil`                 |
| `pvc.accessMode`             | access mode for PVC when created by this chart; ignored if existing claim used                           | `ReadWriteOnce`       |
| `pvc.size`                   | size for PVC when created by this chart; ignored if existing claim used                                  | `100Gi`               |
| `pvc.storageClass`           | storage class for PVC when created by this chart; ignored if existing claim used                         | `nil`                 |
| `deps.pg.managed`            | if `true`, `postgresql` dependency deployed as Helm chart                                                | `true`                |
| `deps.pg.hostname`           | hostname for external PostgreSQL dependency; ignored if PostgreSQL is managed                            | `nil`                 |
| `deps.pg.username`           | username for external PostgreSQL dependency; ignored if PostgreSQL is managed                            | `nil`                 |
| `deps.pg.password`           | password for external PostgreSQL dependency; ignored if PostgreSQL is managed                            | `nil`                 |
| `deps.redis.managed`         | if `true`, `redis` dependency deployed as Helm chart                                                     | `true`                |
| `deps.smtp.existingSecret`   | name of existing secret with `un` and `pw` data to use for PeerTube emails; if `nil`, new secret created | `nil`                 |
| `deps.smtp.username`         | username for SMTP server to use for PeerTube emails; ignored if existing secret used                     | `nil`                 |
| `deps.smtp.password`         | password for SMTP server to use for PeerTube emails; ignored if existing secret used                     | `nil`                 |
| `deps.smtp.hostname`         | hostname of SMTP server to use for PeerTube emails                                                       | `nil`                 |
| `deps.smtp.port`             | port of SMTP server to use for PeerTube emails                                                           | `nil`                 |
| `deps.smtp.from`             | "from" address to use with SMTP server used for PeerTube emails                                          | `nil`                 |
| `deps.smtp.tls.enabled`      | if `true`, PeerTube connections to SMTP server use TLS                                                   | `true`                |
| `ingress.tls.enabled`        | if `true` and ingress enabled, TLS enabled for ingress                                                   | `true`                |
| `ingress.tls.existingSecret` | name of existing Secret to use for ingress TLS; if `nil` and ingress TLS enabled, new secret created     | `nil`                 |
| `ingress.tls.cert`           | cert PEM for ingress TLS; must match `hostname`; ignored if existing secret used or ingress TLS disabled | `nil`                 |
| `ingress.tls.key`            | private key PEM for ingress TLS; ignored if existing secret used or ingress TLS disabled                 | `nil`                 |
| `service.type`               | type of service used to expose PeerTube                                                                  | `NodePort`            |
| `service.port`               | port for service used to expose PeerTube                                                                 | `8084`                |
| `service.nodePort`           | optional if service type is `NodePort`; ignored if service type is not `NodePort`                        | `nil`                 |
