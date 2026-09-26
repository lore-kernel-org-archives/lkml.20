Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1E3376A08
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439904; cv=none; b=PAiETizQ3Du++TL12K2K80ZzOO52rqi0kiX9gYkhPEcnDVqwcHpKEM2zrTmqMQrIoZ1FfPw6IbkdyLE2P5+X7mb4dYI/WEeVn5tqyRXR8FxwL7pHvcxif9Nq54i2Y+HCoyHg72CJKrLUq5Ju9bVNjadYLfCnfP5bPWIBxV1Pb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439904; c=relaxed/simple;
	bh=ixeaZErFclci1n8yNGa8V3opsxlJMTYP3hAcmBz8kF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RkevD61pZMBKxpdxo3K3XivvwEm2axO0f47UphvyjzNNF2Ds6zb/hbtQzvL4GYUOGbFe0VOub0TeUezGfiTvTd1+7dbMxwdM+KyfXTbx2rrs626ANVZ1T9LMTlB2rkLU2hNcRzMkPTb8TTneEy31cqqPSKaovY58TlDPn3uN7lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXW2zUOg; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXW2zUOg"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso950908b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439899; x=1791044699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxTb4rTnxrDZeiosOy7T/2r+lQDYr7z98o9aA1mZOX8=;
        b=JXW2zUOgGq3WY/3MNo0KgKWXnDXttc5E7LOmx38RVg8drAXIvGAdfl/5trHkSQPDb0
         ThcIYTTCQBkbYh79OFzBm3LAadbn0jtZV2GJfKIh9lqICJcPjeVEOLO1GumyGGzHy14M
         ykVPayL/e9qZ0wY4ZyP57DCAyP5LsT4xag42Czm7ihhq6C56IsFtnGn0Hi7UswsyL67v
         RmmX0SCNo6nHYJwCXEJ/mgzNOsU8LXW/e0FoCsz/RrRVe2kYJ786ii9DBf5F8jUO1FSt
         tLfOxq+7nZEPSys4X4lCe0gQr6U4NRmbDhoBReoMlRGtiNG3DUMdlwR1PH5TSre7otnl
         i23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439899; x=1791044699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxTb4rTnxrDZeiosOy7T/2r+lQDYr7z98o9aA1mZOX8=;
        b=n30s09hA6IkleroVLzsOO4KFUGq0wXgBN8iK5ArsP8Q1ewQcotQTNh/pMXc5UPCXJS
         ZC6eGPe1JKvnHkR5neIjptwuyCj9l54gyD6Vw56mfXx49hTTidKD2hWuPQ/EVfJ1x5TT
         q1tQ1Q1iI0IGpDGnu4ePXcDCIO/04w86e09XRR0j46n8ejiXf9+Bn3IjE4lhDUvCss8X
         10PRHtAoNkIL1LvDztuF3NVdX7lB0bVp+83SuLZZtrXTJLl4qVdYGqai/LfkS4efugYp
         7BvjiVSxhwN+zlLA1oZ1GdEP1wJDAYN9YEguJfziNmPNSWXoy9v7Q45hsJTALuPHpmf1
         sJmg==
X-Forwarded-Encrypted: i=1; AKwUvBwg1O8PduBzGU+TSPGfsY69mQGtaZL40M7BtSKt8oyVKnvTW9Kg0yhTpCRUD5vIeO32kJpXWM9KF7ybKC0=@vger.kernel.org
X-Gm-Message-State: AFuF++mLJxP7t3m5WHVWkCo7x0ZDz96QHlFbA8UIe081OBlFFP+o8Lp7
	1CkIfevfU8Ngj6gJmb5hPbB4sPeKwfAYurhcHlBaA5Y2L16B1WbkIsu0
X-Gm-Gg: AYBFou3qbbEJcHKzoLzjmuEYN+8z3MTi+iki45yoEy4Y4EADRS3op7H8BNYCMhGQ9W2
	eHSD+4J4tXICUlQBV9ObouH9vKx9simx4QpyOgXSvQX7AHUvQzGhqe0JfVtt53a8Pe4HCWTX3xO
	m2VeM3j97uRT0aMVqQiHXJUMy/J2oLCkuJv8KhSwQIlRS2lH+T+xcxWyUb4RiLdOWveaP7Kq2pu
	DdsgFrX42ubaHVYB654v8+jcbCJPrs3L1d7k4xgT8nudWQ0GzR80TdsEtx66myXwlRO3Wkdec1Q
	L7tEMC1T19D4x9oL8ZQ4qZnO5aWaOWqSeZBHIziIpJJK7voC87PTitANN0Kg4nc1p1+PH2z1dW5
	6lQLSJzVI+q+zI6klVDSymw/KyGLdoxbCZSm3rHeNRJMhP51hUkaSn4gg6HTKbFSwcXXMZ3ATgD
	dzchBpCRNxNUw26GqdYIce2dwaDi4Ut7nCHbvuKAIumflzphwirr2iTWP2MbyO0zMXUEZeyIhzx
	QQXAGS7+V0VOXTC9egEmxCLQJs=
X-Received: by 2002:a05:6a00:4099:b0:87c:3660:fa76 with SMTP id d2e1a72fcca58-87e9b69f43fmr6347352b3a.34.1790439898653;
        Sat, 26 Sep 2026 09:24:58 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:a00e:c90a:972a:c5a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea19800esm2323249b3a.10.2026.09.26.09.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:24:58 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+1b129b44597a126d2d79@syzkaller.appspotmail.com
Subject: [PATCH] drm/virtio: share one vbuf cache across all devices
Date: Sat, 26 Sep 2026 23:24:52 +0700
Message-ID: <20260926162452.136863-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_gpu_alloc_vbufs() creates a kmem_cache with the fixed name
"virtio-gpu-vbufs" for every device and destroys it from
virtio_gpu_release(), which only runs once the last drm_device
reference is dropped. If a reference outlives the PCI removal (for
instance an open /dev/fbN), a rescan probes the device again while the
old cache still exists:

  kmem_cache of name 'virtio-gpu-vbufs' already exists
  WARNING: mm/slab_common.c:111 at __kmem_cache_create_args
  Call Trace:
   virtio_gpu_alloc_vbufs
   virtio_gpu_init
   virtio_gpu_probe
   ...
   pci_rescan_bus
   rescan_store

kmem_cache_create() then fails and the new device does not probe.

The vbuf size is the same for every device, so create the cache once
at module init and destroy it at module exit instead of per device.

Reported-by: syzbot+1b129b44597a126d2d79@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1b129b44597a126d2d79
Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 13 ++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h |  5 ++---
 drivers/gpu/drm/virtio/virtgpu_kms.c |  8 --------
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 26 ++++++++++++++------------
 4 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 2aaa7cb08085..eec6f73a4c15 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -283,6 +283,10 @@ static int __init virtio_gpu_driver_init(void)
 	struct pci_dev *pdev;
 	int ret;
 
+	ret = virtio_gpu_vbufs_init();
+	if (ret)
+		return ret;
+
 	pdev = pci_get_device(PCI_VENDOR_ID_REDHAT_QUMRANET,
 			      PCI_DEVICE_ID_VIRTIO_GPU,
 			      NULL);
@@ -291,7 +295,7 @@ static int __init virtio_gpu_driver_init(void)
 			VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM);
 		if (ret) {
 			pci_dev_put(pdev);
-			return ret;
+			goto err_vbufs;
 		}
 	}
 
@@ -305,12 +309,19 @@ static int __init virtio_gpu_driver_init(void)
 		pci_dev_put(pdev);
 	}
 
+	if (ret)
+		goto err_vbufs;
+	return 0;
+
+err_vbufs:
+	virtio_gpu_vbufs_exit();
 	return ret;
 }
 
 static void __exit virtio_gpu_driver_exit(void)
 {
 	unregister_virtio_driver(&virtio_gpu_driver);
+	virtio_gpu_vbufs_exit();
 }
 
 module_init(virtio_gpu_driver_init);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9df4c7117341..f6009fc8472f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -261,7 +261,6 @@ struct virtio_gpu_device {
 	struct virtio_gpu_queue ctrlq;
 	struct virtio_gpu_queue cursorq;
 	bool vqs_released;
-	struct kmem_cache *vbufs;
 
 	atomic_t pending_commands;
 
@@ -361,8 +360,8 @@ void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 void virtio_gpu_array_put_free_work(struct work_struct *work);
 
 /* virtgpu_vq.c */
-int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
-void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
+int virtio_gpu_vbufs_init(void);
+void virtio_gpu_vbufs_exit(void);
 void virtio_gpu_reclaim_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 1d4d3bf46a20..047b591b5da2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -264,11 +264,6 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		DRM_ERROR("failed to find virt queues\n");
 		goto err_vqs;
 	}
-	ret = virtio_gpu_alloc_vbufs(vgdev);
-	if (ret) {
-		DRM_ERROR("failed to alloc vbufs\n");
-		goto err_vbufs;
-	}
 
 	/* get display info */
 	virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
@@ -324,8 +319,6 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	virtio_reset_device(vgdev->vdev);
 	virtio_gpu_modeset_fini(vgdev);
 err_scanouts:
-	virtio_gpu_free_vbufs(vgdev);
-err_vbufs:
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 err_vqs:
 	dev->dev_private = NULL;
@@ -365,7 +358,6 @@ void virtio_gpu_release(struct drm_device *dev)
 		return;
 
 	virtio_gpu_modeset_fini(vgdev);
-	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
 
 	if (vgdev->has_host_visible)
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index c02c03c10d92..769b6e70feda 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -70,21 +70,23 @@ void virtio_gpu_cursor_ack(struct virtqueue *vq)
 	schedule_work(&vgdev->cursorq.dequeue_work);
 }
 
-int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev)
+/* Shared by all devices: a per-device cache would collide by name. */
+static struct kmem_cache *virtio_gpu_vbufs;
+
+int virtio_gpu_vbufs_init(void)
 {
-	vgdev->vbufs = kmem_cache_create("virtio-gpu-vbufs",
-					 VBUFFER_SIZE,
-					 __alignof__(struct virtio_gpu_vbuffer),
-					 0, NULL);
-	if (!vgdev->vbufs)
+	virtio_gpu_vbufs = kmem_cache_create("virtio-gpu-vbufs",
+					     VBUFFER_SIZE,
+					     __alignof__(struct virtio_gpu_vbuffer),
+					     0, NULL);
+	if (!virtio_gpu_vbufs)
 		return -ENOMEM;
 	return 0;
 }
 
-void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev)
+void virtio_gpu_vbufs_exit(void)
 {
-	kmem_cache_destroy(vgdev->vbufs);
-	vgdev->vbufs = NULL;
+	kmem_cache_destroy(virtio_gpu_vbufs);
 }
 
 /* For drm_panic */
@@ -93,7 +95,7 @@ virtio_gpu_panic_get_vbuf(struct virtio_gpu_device *vgdev, int size)
 {
 	struct virtio_gpu_vbuffer *vbuf;
 
-	vbuf = kmem_cache_zalloc(vgdev->vbufs, GFP_ATOMIC);
+	vbuf = kmem_cache_zalloc(virtio_gpu_vbufs, GFP_ATOMIC);
 
 	vbuf->buf = (void *)vbuf + sizeof(*vbuf);
 	vbuf->size = size;
@@ -110,7 +112,7 @@ virtio_gpu_get_vbuf(struct virtio_gpu_device *vgdev,
 {
 	struct virtio_gpu_vbuffer *vbuf;
 
-	vbuf = kmem_cache_zalloc(vgdev->vbufs, GFP_KERNEL | __GFP_NOFAIL);
+	vbuf = kmem_cache_zalloc(virtio_gpu_vbufs, GFP_KERNEL | __GFP_NOFAIL);
 
 	BUG_ON(size > MAX_INLINE_CMD_SIZE ||
 	       size < sizeof(struct virtio_gpu_ctrl_hdr));
@@ -205,7 +207,7 @@ static void free_vbuf(struct virtio_gpu_device *vgdev,
 	if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
 		kfree(vbuf->resp_buf);
 	kvfree(vbuf->data_buf);
-	kmem_cache_free(vgdev->vbufs, vbuf);
+	kmem_cache_free(virtio_gpu_vbufs, vbuf);
 }
 
 void virtio_gpu_reclaim_vbufs(struct virtio_gpu_device *vgdev)
-- 
2.43.0

