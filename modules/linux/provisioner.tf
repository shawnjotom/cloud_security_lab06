resource "null_resource" "linux_provisioner" {
  count     = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.linux_vm]
    provisioner "remote-exec" {
    inline = ["/usr/bin/hostname","echo 'Hello from Linux VM ${count.index + 1}'",
      "hostnamectl set-hostname ${var.linux_name}-${count.index}"]
  }
  connection {
    type        = "ssh"
    host        = element(azurerm_public_ip.linux_public_ip[*].fqdn,count.index+1)
    user        = var.linux_admin_username
    private_key = file(var.linux_private_key_path)
  }

}
