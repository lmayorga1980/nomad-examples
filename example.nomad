job "run-batch-job"{
  datacenters = ["dc1"]

  type = "batch"

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "linux"
  }

  group "uptime" {
    count = 1
    task "uptime"{
      driver = "exec"

      config {
        command = "/tmp/packer"
        args    = ["--version"]
      }

      artifact {
        source = "https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip"
        destination = "/tmp"

         options {
          checksum = "md5:a7d1ba188b5fcac5b0ed9f4f24b362ce"
        }
      }

    }
  }
}
