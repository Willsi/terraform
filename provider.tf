provider "google" {
	credentials = "${file("~/key.json")}"
	project = "qa-training-214108"
	region = "europe-west2"
}
