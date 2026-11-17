variable "image_tag" {
    type = string
    description = "GHCR image tag to deploy"
    default = "latest"
}

variable "image_repository" {
    type = string
    description = "GHCR image repository, without tag"
    default = "ghcr.io/Adeife79/REPOSITORY"
}

job "nginx-app" {
    datacenters = ["dc1"]
    type        = "service"

    group "nginx" {
        count = 1

        network {
            port "http" {
                to = 8089
            }
        }

        update {
            max_parallel = 1
            min_healthy_time = "10s"
            healthy_deadline = "2m"
            health_check     = "checks"
            auto_revert      = true
        }

        restart {
            attempts = 3
            interval = "5m"
            delay    = "10s"
            mode     = "fail"
        }

        reschedule {
            attempts = 5
            interval = "30m"
            delay    = "15s"
            unlimited = false
        }

        task "nginx" {
            driver = "docker"

            config {
                image  = "${var.image_repository}:${var.image_tag}"
                ports  = ["http"]
                show_logs = true
            }

            resources {
                cpu = 100 # MHz
                memory = 64 # MB
            }

            service {
                name    = "ngixn-app"
                provider = "consul"
                port     = "http"

                check {
                    name  = "nginx-health"
                    type  = "http"
                    path  = "/healthz"
                    interval = "10s"
                    timeout  = "2s"
                    method   = "GET"
                }
            }
        }
    }
}