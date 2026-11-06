Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944616;
	b=ru9lkqMXbPRJ2v3Ou+HiN3UIuvyH2Yfup1KLuNcSF1wX7ZlSUeCwgOOKtGZdbVIAV13z
	 nr8IrgKs6BDgNrf1hXLh3A7A1hp1mimHqzRayoLU4ZZCmXhBKnIIjn9G4QmtjOUq8VBA0
	 BDxH2t7n8+UPO+77Ny1ZaNGmej8IJj5HHuBzj7y5kknrMpBKok+Fno9DhUBKVYaG/EIWv
	 E1uASY2ZLuriNvVXKB9mz9ZksgLvq6xBqZgurZYA7DOBPwDPE+FHF0Jeus0VDC/Ch25Gm
	 Zf2qRHrZwGeiedEczzvUk2AQa+zckTLnXU5YXwp2bEONSudnKM7MBf8/GHZlE6V556A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yi2qTdJXyLd3b2RG4dIfjLNRpH1if0sm6Lbt6BNdtQo=;
	b=mcW5JD4Q/G1Y2SH7RxsZlxX5mJxQaVdk3h8Ib7EsXvw0yIYeZ+N4Tw7reb5HpVwrv/Qs
	 XE0oXLewjYjgFjQqWqxC0HM2my508IVmwSYqaDiOPANbOnA6aRUKuhWchMdhgbJi7XVLC
	 v13A+SjwtmNLeyBQ6no/lDLIUu07xt2EJA10lNAR248EHAmKkauuqwgJsO178v7FG34E+
	 4XrA1Q3x9V8HfYIYzPalfRu/SdFDXXzF2A4wIoctIb3iYoUnYERmV6j5PMBmW7Ax9LS62
	 +SSbT2CTZIoeyoKnNDmpbWSuZeZbfE0raJPg0r4AHpJ992KVwKPvbdPzoWqj6Na6q7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9V4ra+0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D729606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D729606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9V4ra+0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso1242145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793944614; x=1794549414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi2qTdJXyLd3b2RG4dIfjLNRpH1if0sm6Lbt6BNdtQo=;
        b=C9V4ra+0aNUmgsLoBF+uKxnUwB4s3ugzltgRTTldTck5tRD2mnqo44sTkkvGfnvDNT
         PN1DW8+DiCEU/va5utuUagj02zm8omTqjOx5KI1ZihBuz6Ps8A8RMyvj5Da5UQ05qJX1
         UfeiwtTR4Z6n8J6vfXGYIxDPizwJj58Vm/1IL5OO2xH2V5CAyd9wKYmO8YL0qPIbQSo6
         9vKCfvIVMAdcEL42vh+S7sKZWCNL22Ae9Rdfezek6CKpsqMnyPvdbq5taccobDrxtZ2d
         gnQpfDH42gVfiZvx9DxJlmWyB7p6BTgJciwc4KhGGNk1rYWDz4OuJ+FNnNMfUyI8VAVt
         wZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793944614; x=1794549414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi2qTdJXyLd3b2RG4dIfjLNRpH1if0sm6Lbt6BNdtQo=;
        b=jJvDDzT7b0RBMo8RPzGza2Uyr/ymrmtwj5LFKD638gFgUqevrjuByN6bNSLydOV7g7
         Lcj/K8grw0KUnJJdAyGuN3OiK6jVsIWlK+ZKIYQYOb7psKKwmNotlcFXDkDOX/ytuc/y
         VlgRUhsIea9lVT6w7eCZnop6vKjVCNeki+cvXaamf8sy57PcLM8LYNU2VlaXIXgGj8N4
         Tt/iO7L2p+oE99jar3QqHqHAyzIwFNFi4r6O9M4tqUK2SOTS7fbfai0j8nY48sYdBb55
         puYg6m5wzomBeqgMdFx04t0b9XA/oxNCstchegK1DGIdV3dP0yVpRwtVdsYLa5SKtMEL
         IdjA==
X-Forwarded-Encrypted: i=1; AKwUvBzN5xMB8leBQRoqBK55GvmRzvJDVJI/03VodUY2J3qeWbmfo3mhutz5GakQqzf5b2VkJ9GxAz+7dgXr8dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VAyxjP+wz1/N+TdeCFKZNjMmR+bxIW9UGb9dCJVDF/Z0o04oK
	+909fNfWFVqYTqnb4y4XsDnVyhr2UccWXGdPCw9AAbdQ1tg9z5hquvQn
X-Gm-Gg: AYBFou04/OuvHA6q+DbJTIcSmq7jLJIm3DyHwuR7Ll8ucrbe3Q3naVfwC4iuJhopufz
	0qc5FbvNRxJbxHMQZ+gytbulbgYjzBgvncoaZW+LhsHDiAb8vleb2Pr6+YpLBiB99qWoIBlQDd8
	0Cb7kjyBXd7GH61TIDrEkUj29fcj+1/MO2sx5bpm49Mv6NtX1H8DDotOoGHI2ZgaJdTkB67Hncc
	uPhXhdeZamN9Be12hXl2AwN/WuRyom4oyGndG96yp7IIO1g5Hkh/ej46T/k4zmXf+R46TFIM5nI
	BetOKaMFbw98h71S3OJfCubu24z0HbVVLYzHG63uQkYkYSgHPmI9aCGpp1DX7BcvCkP0Stxx7It
	Gr39DbYPUe5LDIkNoN8C1ZuvbcciKumby6/MZy+hJpKxBHaA6PrRoucJ87Sa1vAm63UYynnmPHr
	TvUJvYNX8efabGkZA30nUkUevZaWva2T/xpcDBiWwp9EgQ4XzrEwwfdbFpRmqayTkN+g3s1YhM2
	PdIr7RVVsUg7s4jnf8uFDsfvlBA3ifQwIAmrAPMW6qp0qTkTKND/M08EVS4HxWBz+babA2gZvmc
	d2DrX+ttcfg0f6RfLjvRhzpi5pcrKx8KlK0ijjnhsliqjODuwpR4eP8RTe+ag2yFlx/tv6HFAj0
	=
X-Received: by 2002:a05:600c:a10c:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4b6dd82ab3cmr14697045e9.8.1793944614412;
        Thu, 05 Nov 2026 21:56:54 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:452b:db14:9bf:f8a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2029209sm35245025e9.11.2026.11.05.21.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:56:54 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alexander Graf <graf@amazon.com>,
	virtualization@lists.linux.dev,
	linux-um@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio_ring: return an error pointer from vring_create_virtqueue()
Date: Fri,  6 Nov 2026 06:56:33 +0100
Message-ID: <20261106055635.3019889-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
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

vring_create_virtqueue() and vring_create_virtqueue_map() return NULL
on any failure, so the error returned from vring_alloc_queue_split()
is lost and turned into -ENOMEM. This is especially misleading if
vring_alloc_queue_split() rejects a queue size with -EINVAL (i.e. if
queue size is not a power of two):

  virtio_blk virtio0: Bad virtqueue length 100
  virtio_blk virtio0: probe with driver virtio_blk failed with error -12

So the error points whoever debugs it at an allocation failure that
never happened.

Return an ERR_PTR() instead: the error from vring_alloc_queue_split()
or vring_alloc_queue_packed(), or -ENOMEM when allocating the
virtqueue itself fails. Make the callers, virtio_pci (modern and
legacy), virtio_mmio, virtio_vdpa, virtio_ccw and virtio_uml, check
with IS_ERR() and pass the error on. The error path in virtio_ccw
deletes a non-NULL vq, so clear vq there before taking it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
v2: use Assisted-by instead of Co-Authored-By (Michael)
v1: https://lore.kernel.org/r/20261105193426.2999631-1-stjepan.poljak@gmail.com

Tested on x86_64 with a virtio-mmio virtio-blk device offering a
100-entry queue: the probe now fails with -22 instead of -12, and a
128-entry queue probes as before. The other transports are only
compile-tested (x86_64, ARCH=um, s390 with clang, W=1).

No Fixes: tag, since the error has been -ENOMEM since 2010 and nothing
regressed.

This conflicts trivially with patch 07/12 of Alexander Graf's "virtio:
support devices that own their virtqueue memory" v2:
https://lore.kernel.org/virtualization/20260818211425.91009-1-graf@amazon.com/
---
 arch/um/drivers/virtio_uml.c       |  4 ++--
 drivers/s390/virtio/virtio_ccw.c   |  5 +++--
 drivers/virtio/virtio_mmio.c       |  4 ++--
 drivers/virtio/virtio_pci_legacy.c |  4 ++--
 drivers/virtio/virtio_pci_modern.c |  4 ++--
 drivers/virtio/virtio_ring.c       | 12 +++++++-----
 drivers/virtio/virtio_vdpa.c       |  4 ++--
 include/linux/virtio_ring.h        |  6 +++++-
 8 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
index 881c34098a74..8b645523277f 100644
--- a/arch/um/drivers/virtio_uml.c
+++ b/arch/um/drivers/virtio_uml.c
@@ -984,8 +984,8 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
 
 	vq = vring_create_virtqueue(index, num, PAGE_SIZE, vdev, true, true,
 				    ctx, vu_notify, callback, info->name);
-	if (!vq) {
-		rc = -ENOMEM;
+	if (IS_ERR(vq)) {
+		rc = PTR_ERR(vq);
 		goto error_create;
 	}
 	vq->priv = info;
diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 552d77998012..c5a30f0a2bc2 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -590,10 +590,11 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
 				    vdev, true, may_reduce, ctx,
 				    notify, callback, name);
 
-	if (!vq) {
+	if (IS_ERR(vq)) {
 		/* For now, we fail if we can't get the requested size. */
 		dev_warn(&vcdev->cdev->dev, "no vq\n");
-		err = -ENOMEM;
+		err = PTR_ERR(vq);
+		vq = NULL;
 		goto out_err;
 	}
 
diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index e2ec0ec01d67..c403a025006e 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -396,8 +396,8 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned int in
 	/* Create the vring */
 	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
 				 true, true, ctx, notify, callback, name);
-	if (!vq) {
-		err = -ENOMEM;
+	if (IS_ERR(vq)) {
+		err = PTR_ERR(vq);
 		goto error_new_virtqueue;
 	}
 
diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index 8115aa39e01e..9d94fffff344 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -130,8 +130,8 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 				    VIRTIO_PCI_VRING_ALIGN, &vp_dev->vdev,
 				    true, false, ctx,
 				    vp_notify, callback, name);
-	if (!vq)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(vq))
+		return vq;
 
 	vq->num_max = num;
 
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 922e2df027de..28ccb2130e27 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -720,8 +720,8 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
 				    SMP_CACHE_BYTES, &vp_dev->vdev,
 				    true, true, ctx,
 				    notify, callback, name);
-	if (!vq)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(vq))
+		return vq;
 
 	vq->num_max = num;
 
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f683a2d6a200..6dd4a7651bde 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1421,13 +1421,13 @@ static struct virtqueue *vring_create_virtqueue_split(
 	err = vring_alloc_queue_split(&vring_split, vdev, num, vring_align,
 				      may_reduce_num, map);
 	if (err)
-		return NULL;
+		return ERR_PTR(err);
 
 	vq = __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
 				   context, notify, callback, name, map);
 	if (!vq) {
 		vring_free_split(&vring_split, vdev, map);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	to_vvq(vq)->we_own_ring = true;
@@ -2671,15 +2671,17 @@ static struct virtqueue *vring_create_virtqueue_packed(
 {
 	struct vring_virtqueue_packed vring_packed = {};
 	struct virtqueue *vq;
+	int err;
 
-	if (vring_alloc_queue_packed(&vring_packed, vdev, num, map))
-		return NULL;
+	err = vring_alloc_queue_packed(&vring_packed, vdev, num, map);
+	if (err)
+		return ERR_PTR(err);
 
 	vq = __vring_new_virtqueue_packed(index, &vring_packed, vdev, weak_barriers,
 					context, notify, callback, name, map);
 	if (!vq) {
 		vring_free_packed(&vring_packed, vdev, map);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	to_vvq(vq)->we_own_ring = true;
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index f9559b6b2e0b..c1b6134b2267 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -208,8 +208,8 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
 	vq = vring_create_virtqueue_map(index, max_num, align, vdev,
 					true, may_reduce_num, ctx,
 					notify, callback, name, map);
-	if (!vq) {
-		err = -ENOMEM;
+	if (IS_ERR(vq)) {
+		err = PTR_ERR(vq);
 		goto error_new_virtqueue;
 	}
 
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index c97a12c1cda3..c808ca7e8d58 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -66,6 +66,9 @@ struct device;
  * may_reduce_num is set, then this may allocate a smaller ring than
  * expected.  The caller should query virtqueue_get_vring_size to learn
  * the actual size of the ring.
+ *
+ * Returns the virtqueue or an ERR_PTR() on failure: -EINVAL if num is
+ * not a valid ring size, -ENOMEM if the ring could not be allocated.
  */
 struct virtqueue *vring_create_virtqueue(unsigned int index,
 					 unsigned int num,
@@ -80,7 +83,8 @@ struct virtqueue *vring_create_virtqueue(unsigned int index,
 
 /*
  * Creates a virtqueue and allocates the descriptor ring with per
- * virtqueue mapping operations.
+ * virtqueue mapping operations.  Returns the virtqueue or an ERR_PTR()
+ * on failure, like vring_create_virtqueue().
  */
 struct virtqueue *vring_create_virtqueue_map(unsigned int index,
 					     unsigned int num,

base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
-- 
2.53.0

