variable "name" {
	type = "string"
	default = "default"
}


variable "machine_type" {
        type = "string"
        default = "f1-micro"
}

variable "image" {
        type = "string"
        default = "centos-7"
}

variable "zone" {
        type = "string"
        default = "europe-west2-c"
}


