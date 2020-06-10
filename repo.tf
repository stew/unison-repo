resource "digitalocean_ssh_key" "default" {
  name       = "public key"
  public_key = file(var.pub_key)
}


resource "digitalocean_droplet" "unisonqrepo" {
    image = "debian-10-x64" 
    name = "unisonrepo"
    region = "sfo2"
    size = "512mb"
    private_networking = true
    ssh_keys = [digitalocean_ssh_key.default.fingerprint]

    connection {
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }
}

