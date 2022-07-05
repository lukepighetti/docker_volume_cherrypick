# docker_volume_cherrypick

Testing if it's possible to cherrypick a file in a volume in Docker Compose.

### Example

In container
```
/
└── app
    └── data
        ├── file_a.txt
        └── file_b.txt
```

On host
```
.
├── data
│   └── file_a.txt
└── file_b.txt
```

In `docker-compose.yaml`

```yaml
services:
  dvt:
    container_name: dvt
    image: dvt:staging
    volumes:
      - ./data:/app/data
      - ./file_b.txt:/app/data/file_b.txt
```

### Environment

- Docker version 20.10.16, build aa7e414
- docker-compose version 1.29.2, build 5becea4c
- Dart SDK version: 2.17.5 (stable) (Tue Jun 21 11:05:10 2022 +0200) on "linux_x64"

### Result

Docker does allow us to 'cherrypick' files inside a volume if we first create the file and then build/run the image/container.
