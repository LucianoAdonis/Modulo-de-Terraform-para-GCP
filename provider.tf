# Google Cloud Platform

provider "google" {  
    credentials = "${var.ID_JSON}"
    project = "${var.ID_PROJECT}"
    region = "${var.REGION}"
}