Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263271;
	b=W7Ov0YKEMmK5MTGAWk18JEhe7mgp02EH3rAQa2SWPrNHOiPjI2jdEF1xplgQOwIsHvk0
	 Y/54qv3JN67GDJf99DGvkP16xPNXBspC/X7crAGWvVmpT+N15iz0uaRQEoLKDcMQv3qFf
	 +PV9XGhWUk8IHnBJfsXzo5Mrc/uIFiHEviV0OE0f1uot5rvJmVd90i+wGVHzcXNYGFil6
	 Uog4Y0lmK5x6rCajOhZTPoQI2DxW7x2RMxPv8YPVAYczhZKNJPgTX+uQQhfhJYnWmRrNd
	 Gf2uywkxNqs1yi6ZHvhoznnCcyskfLxBxy749cCfYhmCL+n/wzcrcAOrW7BGTDfH5TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263271;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SvpC/CqEqjBdZnQpgRe5OfHjCtNzXh6/qxDST/OshQQ=;
	b=OyZ8yittK4gs4VGKmRycHHhrpCJ6+k2IGuw8VlY2Pm1bOeE4EhzX5xV0ultEs6qH1oBw
	 wma8MYAJklfiKd02kKb25ZodmrDQvr1oN7gSUuJu+IYgJb/U2gNxnXOe4gskNgFgLAio4
	 UAyD0rhSWkkaqwOB5AYTqSlP+k6Yx3x/YZszdqVUySFOHSKCrPR78WmaglTNapDsat0E1
	 Q+RL4WOeriznvcH/rxLxD89gFCBxIswSTYx4R8Yn25uKGqGJAawS5vDWMBfWJKJz4KMXC
	 yO0pGCVC96wdnWUymkcbDxd+u4Bozt4fPO2CXyavCFfOMhHDGLOUzDFI++etkTAq63Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BCE606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BCE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TqpGNjKT+lD2Rel7GLiUVY2FqEfci48dH7mpDqNpEiM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793263263; v=1; x=1793868063;
 b=eCxxv78HnHRsoJXjGJujMm4vohreEDfMnvbQDLqOdXupFtHHAAaIu6Ry2bBttv4M+EViW7eD
 n2UDhJNOMVHFa5Od2UClwZQ+RF1/6ZYgCngOy5WBIgTBQ0iCkZ8vgbYgqET5N+zvYAxGpQA1suA
 NaufogNT8ZK9oJoNKoz+h0Pw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2945813667bcd118;
	Thu, 29 Oct 2026 08:41:02 +0000
X-Mizu-Trace-ID: 2945813667bcd118
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	nicolinc@nvidia.com,
	jgg@nvidia.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] virtio_pci: don't take the MSI mutex under cpu_hotplug_lock
Date: Thu, 29 Oct 2026 16:40:43 +0800
Message-ID: <20261029084043.19409-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Lockdep reports the following circular locking dependency when a virtio-net
device is probed with lockdep enabled on a system whose devices sit behind
an IOMMU:

    ======================================================
    WARNING: possible circular locking dependency detected
    7.3.0-rc1+ #84 Not tainted
    ------------------------------------------------------
    kworker/u34:0/57 is trying to acquire lock:
    ffff800104f83ee8 (&md->mutex){+.+.}-{4:4}, at: msi_domain_get_virq+0xf0/0x118

    but task is already holding lock:
    ffffc00081edd930 (cpu_hotplug_lock){++++}-{0:0}, at: cpus_read_lock+0x10/0x1c

    which lock already depends on the new lock.

    Chain exists of:
      &md->mutex --> &group->mutex --> cpu_hotplug_lock

The cycle is composed of three dependencies:

* cpu_hotplug_lock -> &md->mutex (which triggers the splat). virtio_net's
  init_vqs() calls cpus_read_lock() around virtnet_set_affinity(), which
  reaches vp_set_vq_affinity(). That calls pci_irq_vector(), which takes
  the per-device MSI mutex (&dev->msi.data->mutex) via
  msi_domain_get_virq().

* &md->mutex -> &domain->mutex -> &group->mutex.  MSI-X allocation of any
  device behind the IOMMU holds the MSI mutex while allocating interrupts
  through the IRQ domain hierarchy. The MSI parent domain (GICv2m, or ITS
  likewise) calls iommu_dma_prepare_msi() from its .alloc() to map the MSI
  doorbell, which takes the IOMMU group mutex.

* &group->mutex -> cpu_hotplug_lock. bus_iommu_probe() calls
  iommu_setup_dma_ops() under the group mutex; initializing the IOVA
  rcaches registers a cpuhp instance, which takes cpu_hotplug_lock.

The cycle only became complete since commit 288683c92b1a ("iommu: Make
iommu_dma_prepare_msi() into a generic operation"), where
iommu_dma_prepare_msi() switched to use the group mutex.

pci_irq_vector() is a pure lookup of a vector that is bound to the
queue for the whole lifetime of the queue, so there is no reason to
take the MSI mutex for it from cpu hotplug locked contexts.

Cache the IRQ number in virtio_pci_vq_info {} at vector binding time and
make vp_set_vq_affinity() use the cached value.

This also covers the CPU hotplug callbacks
(virtnet_cpu_online/virtnet_cpu_dead), which call virtnet_set_affinity()
with cpu_hotplug_lock already held.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 drivers/virtio/virtio_pci_common.c | 12 +++++++++++-
 drivers/virtio/virtio_pci_common.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index b90c174450b2..2f42300a8a84 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -224,6 +224,16 @@ static struct virtqueue *vp_setup_vq(struct virtio_device *vdev, unsigned int in
 		goto out_info;
 
 	info->vq = vq;
+
+	/*
+	 * Cache the Linux IRQ number so that later users (e.g.
+	 * vp_set_vq_affinity() from cpu hotplug locked contexts)
+	 * don't have to take the MSI mutex via pci_irq_vector().
+	 */
+	info->virq = 0;
+	if (msix_vec != VIRTIO_MSI_NO_VECTOR)
+		info->virq = pci_irq_vector(vp_dev->pci_dev, msix_vec);
+
 	if (callback) {
 		spin_lock_irqsave(&vp_dev->lock, flags);
 		if (!vp_is_slow_path_vector(msix_vec))
@@ -571,7 +581,7 @@ int vp_set_vq_affinity(struct virtqueue *vq, const struct cpumask *cpu_mask)
 
 	if (vp_dev->msix_enabled) {
 		mask = vp_dev->msix_affinity_masks[info->msix_vector];
-		irq = pci_irq_vector(vp_dev->pci_dev, info->msix_vector);
+		irq = info->virq;
 		if (!cpu_mask)
 			irq_update_affinity_hint(irq, NULL);
 		else {
diff --git a/drivers/virtio/virtio_pci_common.h b/drivers/virtio/virtio_pci_common.h
index 8cd01de27baf..18b15a5f84ae 100644
--- a/drivers/virtio/virtio_pci_common.h
+++ b/drivers/virtio/virtio_pci_common.h
@@ -40,6 +40,9 @@ struct virtio_pci_vq_info {
 
 	/* MSI-X vector (or none) */
 	unsigned int msix_vector;
+
+	/* Linux IRQ number of msix_vector, or 0 if not mapped */
+	unsigned int virq;
 };
 
 struct virtio_pci_admin_vq {
-- 
2.56.0

