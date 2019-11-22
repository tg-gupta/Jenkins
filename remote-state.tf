terraform {
  backend "s3" {
    bucket  = "pt-22112019-bucket"
    key     = "state-pink"
    region  = "ap-south-1"
    profile = "ShellPowerUser"
  }
}