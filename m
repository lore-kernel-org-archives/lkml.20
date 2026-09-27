Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10EB269D18
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482845; cv=none; b=FKgAsrbacNwCXlwt8/DUWuG3KT4MEnxV2qJwaXM6bH15d2eFAV59dEOtineXp2uVJWMOr7dGqEMS37uSI/Xo/ya+zQ1eYTyRDovo0hSYmKSzUb2XSAFUIybrCLINCR28TCLladUM1Zp02je+JEeq8jbtsYGBO1uBm1lKD0yHNMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482845; c=relaxed/simple;
	bh=8dqQXg3QV+LIvbqmAhbrfa3IV7zf9uH2hdEdQDihmPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=maKq5ULBK+P62dhqxDVhHF614KJxHsxQp3Kw6YS6taxDdPigYQ9ijJ8P2XF69issf/5FyWNlrIc807c7OojaExyAY94I+WTFXvfKLaH75rYxAUWV/D5cllffDJxHR9peNUpExirXA5vWzmKCSKMNfXXFTbkPheHQB/yFjw3yejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcrBSGOb; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcrBSGOb"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so786311a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790482842; x=1791087642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDCmetS7q26pDTAMQ+r7lMzCxwM1hYCU7lPFcoUtvfY=;
        b=YcrBSGObuff8p7Rw/gB+AXWJ3yC0Madcjlv5OlKVlC2Tio0hHkfmNaQavh0b0Lp4Pk
         a7ahVfvozey7aoCMksKc2/l95EwRS0LEXcSLwUMp1vqX5ysdl/aqLxq3XO6m94/bM4pm
         EwYXKzU0dau61rKFganGhBlDB1uQO/aFUAVkinK1uEhoD39lGaeXCCmXHMalf75o0KVe
         4PMrTmT3oCMT0TjmsEWCUTiBYKPTUKuOk928H5/+VwOr8oxc29Halaj5IOdgCrjHfC9A
         ICdaDpov707J7+VP1phyM5E1DV353fHyXFIsbDifhOSoGmSIleGygN4CbWtOyiZqfJi5
         O4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790482842; x=1791087642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDCmetS7q26pDTAMQ+r7lMzCxwM1hYCU7lPFcoUtvfY=;
        b=OQpxnWd/OI0a9cnLT/Od6e3nfYvZX+8hL5AkXGMxhNlAauD6I3MgYMARbSXOr5Ydqf
         tGYNKTOE3NyOD3Tp/B4iOQ3sXvGDk7jP5e+WHwZJlhUDNdo7KOYzgAZDiGoC8+ciFV9p
         4ls/oqLN6SuuCgQYwx8280UqEh58DZWe2B6KuzgSjGz5OC5QxQhGd1oG1yD64R5tljOn
         la+PGvtYgN62gw6+QD7DGqoNfehIFAqHRuUmMCb/8T2m+w6O19sHdWs+Qy35ekH14I1q
         gnE6k4nDIFkvG7qEueoJz7pe7VhKzbNJqRd9Q0aG/8EeDNtH/sFHX+2Q1GgKp2Geish6
         +nTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4UwZPcwsuJVPB2I8btTp4bbRwZkev+hYZ8Mn/ZjK46bLSurLMwCxclr0L7J6HZD0OXzgd16R6DE8waUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMOklByGpJZDKjuaE9eKDmE58pBGk/7irnfTvwPHvjZE9rbQGo
	3jEN1TEnnWWJ8rYUF/xJx0viG4LkZ2RQLCYzSzSFwHjQQdwOFWD6K0m4
X-Gm-Gg: AYBFou00daGdlHtv5KNIDW9XibCi/8emvE3M22GGwnFF72/3FpvH642pvigOo+IQVIk
	wmk0+n6B2B22mreC1URZRWDVulKEdOPKV9NHJkYxhQ56+nYJuY7NaimnRV3zEp/daiQfjmWXxS/
	/QczgshMI890ceQgOEIIwPvqArRIPLmJ9CW2zC1eo6DwhBdkiiecSnw02341Z3msj2Wdrxia+Bk
	dsh7BFU82tpOVPK02Gr2Fg2tvhYRCdi5sxUdOhyZ/8jwqhjU41MSGDgO/VFKxS30mTvLBHrplb6
	iJ1v6TL8dip6u3dfNQ78gqAkxefG4Qdpn9OBBPGV92mavYnD40AsFClmFOnZ+HyC7kBPVVgEWrb
	ich/hnamuT4VhDGWWXYH73H9wwx5kMo3Gy5mHw4hlhEV5/lKHLAq7xtmE4AMGX1P0udqGVeu6rj
	SNNHHwEojkG38TMA6W7KaxjJ+p2tMBIKk1mqUGudnWkfMQffiYGwVlPTXyPN6ToESgQ/0xWfPXE
	QhWxhVo5rvp3Jek
X-Received: by 2002:a17:90a:dfcc:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a0cca04bf4mr2596078a91.7.1790482841989;
        Sat, 26 Sep 2026 21:20:41 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b4f6345fsm5558223a91.1.2026.09.26.21.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:20:41 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Hillf Danton <hdanton@sina.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+1b129b44597a126d2d79@syzkaller.appspotmail.com
Subject: [PATCH v2] drm/virtio: drop the dedicated vbuf kmem_cache
Date: Sun, 27 Sep 2026 11:20:35 +0700
Message-ID: <20260927042035.19956-1-ngocthang2710.1999@gmail.com>
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

A vbuf is 216 bytes and lands in kmalloc-256 anyway, so the dedicated
cache buys nothing. Use kzalloc()/kfree() and drop the per-device cache.

Reported-by: syzbot+1b129b44597a126d2d79@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1b129b44597a126d2d79
Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2: (Hillf Danton) drop the dedicated cache and use kzalloc()/kfree()
    instead of sharing one cache across devices.
    v1: https://lore.kernel.org/r/20260926162452.136863-1-ngocthang2710.1999@gmail.com

 drivers/gpu/drm/virtio/virtgpu_drv.h |  3 ---
 drivers/gpu/drm/virtio/virtgpu_kms.c |  8 --------
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 23 +++--------------------
 3 files changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9df4c7117341..2639d9ec0470 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -261,7 +261,6 @@ struct virtio_gpu_device {
 	struct virtio_gpu_queue ctrlq;
 	struct virtio_gpu_queue cursorq;
 	bool vqs_released;
-	struct kmem_cache *vbufs;
 
 	atomic_t pending_commands;
 
@@ -361,8 +360,6 @@ void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 void virtio_gpu_array_put_free_work(struct work_struct *work);
 
 /* virtgpu_vq.c */
-int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
-void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
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
index c02c03c10d92..5eb78d69f561 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -70,30 +70,13 @@ void virtio_gpu_cursor_ack(struct virtqueue *vq)
 	schedule_work(&vgdev->cursorq.dequeue_work);
 }
 
-int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev)
-{
-	vgdev->vbufs = kmem_cache_create("virtio-gpu-vbufs",
-					 VBUFFER_SIZE,
-					 __alignof__(struct virtio_gpu_vbuffer),
-					 0, NULL);
-	if (!vgdev->vbufs)
-		return -ENOMEM;
-	return 0;
-}
-
-void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev)
-{
-	kmem_cache_destroy(vgdev->vbufs);
-	vgdev->vbufs = NULL;
-}
-
 /* For drm_panic */
 static struct virtio_gpu_vbuffer*
 virtio_gpu_panic_get_vbuf(struct virtio_gpu_device *vgdev, int size)
 {
 	struct virtio_gpu_vbuffer *vbuf;
 
-	vbuf = kmem_cache_zalloc(vgdev->vbufs, GFP_ATOMIC);
+	vbuf = kzalloc(VBUFFER_SIZE, GFP_ATOMIC);
 
 	vbuf->buf = (void *)vbuf + sizeof(*vbuf);
 	vbuf->size = size;
@@ -110,7 +93,7 @@ virtio_gpu_get_vbuf(struct virtio_gpu_device *vgdev,
 {
 	struct virtio_gpu_vbuffer *vbuf;
 
-	vbuf = kmem_cache_zalloc(vgdev->vbufs, GFP_KERNEL | __GFP_NOFAIL);
+	vbuf = kzalloc(VBUFFER_SIZE, GFP_KERNEL | __GFP_NOFAIL);
 
 	BUG_ON(size > MAX_INLINE_CMD_SIZE ||
 	       size < sizeof(struct virtio_gpu_ctrl_hdr));
@@ -205,7 +188,7 @@ static void free_vbuf(struct virtio_gpu_device *vgdev,
 	if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
 		kfree(vbuf->resp_buf);
 	kvfree(vbuf->data_buf);
-	kmem_cache_free(vgdev->vbufs, vbuf);
+	kfree(vbuf);
 }
 
 void virtio_gpu_reclaim_vbufs(struct virtio_gpu_device *vgdev)
-- 
2.43.0

