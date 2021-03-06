resource "null_resource" "kubeadm_edge_join" {

  count = "${var.edge_count}"

  connection {
    host        = "${element(var.edge_nodes,count.index)}"

    type        = "ssh"
    user        = "core"
    private_key = "${var.private_key}"

    bastion_host        = "${var.bastion_host}"
    bastion_port        = "22"
    bastion_user        = "core"
    bastion_private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${join(",",var.worker_dependencies)}",
      "docker run -it -e LOCAL_VOLUMES_DIR=/mnt -e PROXY=${var.proxy_ip}:${var.proxy_port} -e NO_PROXY=${var.proxy_ip},.local -e K8S_VERSION=${var.kube_version} -v /etc:/rootfs/etc -v /opt:/rootfs/opt -v /usr/bin:/rootfs/usr/bin vgkowski/kubeadm-installer-coreos:${var.kubeadm_installer_version}",
      "sudo systemctl daemon-reload",
      "sudo systemctl enable kubelet",
      "sudo kubeadm reset",
      "sudo systemctl restart kubelet",
      "sudo kubeadm join --discovery-token-unsafe-skip-ca-verification --ignore-preflight-errors=all --token=${var.token} ${element(var.master_nodes,0)}:${var.apiserver_port}"
    ]
  }

  depends_on = ["null_resource.kubeadm_init"]
}