job "run-powershell" {
  datacenters = ["dc1"]

  type = "batch"

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "windows"
  }

  group "windows" {
    count = 10

    task "1-gethostinfo" {
      driver = "raw_exec"

      config {
        command = "powershell"
        args    = ["get-host"]
      }
    }

    task "2-sleepbecauseisnice" {
      driver = "raw_exec"

      config {
        command = "powershell"
        args    = ["start-sleep -seconds 10"]
      }
    }

    task "3-copyfile" {
      driver = "raw_exec"

      config {
        command = "C:\\Windows\\System32\\cmd.exe"
        args    = ["/c", "copy", "c:\\myfiles\\myfile.txt", "c:\\target", "/Y"]
      }
    }
  }
}
