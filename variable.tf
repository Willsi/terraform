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

variable "scripts" {
	 
	default = []
	
}

variable "network" {

	type = "string"
	default = "default"
}

variable "allowed_ports" {

	default = ["22", "9000", "8080", "8000"]



}
 
variable "tags" {
    default = [
	"defaulttag"
    ]
}

