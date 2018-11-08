job "run-powershell" {
  datacenters = ["dc1"]

  type = "batch"

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "windows"
  }

  group "uptime" {
    count = 1

    task "uptime" {
      driver = "raw_exec"

      config {
        command = "powershell"
        args    = ["get-host"]
      }
    }
  }
}
