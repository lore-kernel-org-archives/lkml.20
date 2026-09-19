Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED313921DE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857283; cv=none; b=LrhEkzCeNaBOPtC/eU2keLIQYNRy8tZrYlM6rqNFWo7vJu5uKYBsRz6dlbQC7l6RDet7a00y9hCsJ93TjuX8MbhKYUBjb4yDQq67xSuR/cZ7aSBd0/z2NcnHtACcvZPv7fJIbyYaY+kJSOLly6lknbLfYhCpLOhpQzajSacAGAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857283; c=relaxed/simple;
	bh=gg/aLO8FXGl291zcXQuVqVPtSfhfSZO1lvSMmXb4L20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kAXwXjh2GjdRSuTHfCE7E1iRGpjmOHW/XEB8giCI23BoR5SGMjaRTHzwHEVtroxy53u61qDGF6AcUDtpiO3QzuNtmSz0XZrI1CTPBuxVw1cpMmbmcxD+MKqs20CA9mjzrpikhp7bVKDAanLfxPL96rbowqItfaZmBL5dHZieUkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuzzOXmU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuzzOXmU"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398cb5615deso2175540a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857281; x=1790462081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwQ10vDhFAWwDcYIO9V2fABJxs02GOextq4IhPQqc6k=;
        b=UuzzOXmUFuEYu6emw0s9l2i7LbML7dTDtRcNuCHA+8YzsVV0GK8Av/f2MDawrCk5DL
         WmFF+tN94JP6Ji+N6hN+OgQHfSFCGmtLGzpiibIK9NkUYi7l3BzLkPf6Db7kf6PdNzl9
         fNe5IWHb6yXu8XuAyf2xRsyQd02tmEsK6yeDamqhk7Z9Wn8ZC3r7DE8+t5wfTy/rKc4H
         f1e/ynNQELfXykQHDxcl+jAhw3EYByfHXtR/1jsM2Zh+4H7L6a8V1oB/z2h63lBil2Bf
         CBltsTwPUXF2EvFv6wf9RvuwltXA+1FXrItCiA5bMLrb5JxDHLY1+N7+ktl3JYf28fCh
         3aMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857281; x=1790462081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwQ10vDhFAWwDcYIO9V2fABJxs02GOextq4IhPQqc6k=;
        b=w3p5UJs3W2gYLiiOMFpJNB77b5IHMeE47N5If6zGbns2ULq/8174OxCWtgqkxY3rZh
         4DijQEfkzDaok+ngEJZp23ujsSFSPGO4Jrz+Q3EL8br6YNw5BmAD49jlrCN8ZFLWd5lQ
         cw4nb3k851NXnyKSf2xJ7CfWsUNlaZEL93vK7f49iYN2TIVbESa2mt5PTJ+e3xkUj6Q9
         UG1tqsLP8PtSWyMTq8eI2lx9kKlWljHjaeWujH2+M62uCdCKtWVxywq3oKK6ISAxQX3w
         MhWahYtDw1QtOhq1+wwC38kXB2rIpwunz2gD0ise4ADIi5x8PNHry2fYUZeOVPbomvEU
         nxow==
X-Forwarded-Encrypted: i=1; AKwUvBywgVX4uYTh2E1RAxSIqoXKAqjlvV68Ym3MPuwh3e32oNQwU5JZOn46FMDnssrW8oidoMwxoUpZSXvcpsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nj2rG9uhOxhSLjWYcur/uuxjf7QaGEJ47Bf3hixUVKyyObBPWX
	ub6WfGbJ8tXuDXmbd51F8mLmkVf49YJd1RT6kQNg1N9XgdwPtBTi7ufW
X-Gm-Gg: AYBFou1uoSIGCL6oT2y0aUSNvCTI8sht2f8CCcPQfYCibaqVJ0+i50NlvlqB5lXDbaN
	SYuQQvi0Pm9GdoS2U9RIpwNh9+oxBPEtKK8EO1nI1HQ4FO6dAUcfLRdMYLejEoCpC6VnYl3veuW
	3RsdIUpsWwvwyu0bGqRLF88YNjufdqCgJLgBskTqJj3WMG63Hg0pvptEtd44G0sKnr/LwqzLTzs
	5x34L1rkfxMCOSISrixBtfZiI7TVh36Yy/rZq+P8FlT9S/rldaXJEEIPI9zYjqrIV3kaVbc6pbQ
	xf5kAuOpn4W+wDvK2WPpRa2TkQqrb0/b8FG+yHYvrz1FYqyagUWmuFqfw5YLCXJUqxNV9sHvuNw
	FKmQqM0tam+Z1e5Uv1k4JTUJTUbM/8MfhvDAehJlzjO+fPzddKtVDTvoALgBLZw+QD65HFiBQ0x
	WQ34wvneciVEMk2w+DwgKUjZYu73ZoyXdF7si1wlBTHg5cnXvTLjIS7b4xjRUkusKS6xkeXJce/
	gu+AykTPqT/8oqFNY416SDbjJytWtqqEJ1w6lu2SRe4hkO4BZVLeJtjjC7j7l1fXJwXnVuqptQw
	W7E0P86WKw==
X-Received: by 2002:a17:90b:39ad:b0:39e:6c69:9b95 with SMTP id 98e67ed59e1d1-39e6c69b29dmr4693412a91.58.1789857281154;
        Sat, 19 Sep 2026 15:34:41 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02526e27dsm1943501a91.0.2026.09.19.15.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:40 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	gurchetansingh@chromium.org,
	olvaffe@gmail.com,
	tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: fix vbuf->objs double-free, fence NULL deref, and sgt error path
Date: Sat, 19 Sep 2026 22:34:39 +0000
Message-ID: <20260919223440.3884176-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three error-handling bugs in drivers/gpu/drm/virtio/:

1. In virtio_gpu_dequeue_ctrl_func() and vbuf cleanup (virtgpu_vq.c),
   clear entry->objs after freeing so objects are not double-released,
   and fix the vmalloc_to_sgt() error path.
2. In virtio_gpu_cleanup_submit() (virtgpu_submit.c), cancel and free
   out_fence->e when submit fails before drm_event_reserve_init()
   completes.

Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 32cb1e4aa425..84aeea58c700 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -343,8 +343,14 @@ static void virtio_gpu_cleanup_submit(struct virtio_gpu_submit *submit)
 	if (submit->out_fence_fd >= 0)
 		put_unused_fd(submit->out_fence_fd);
 
-	if (submit->out_fence)
+	if (submit->out_fence) {
+		if (submit->out_fence->e && !submit->out_fence->f.seqno) {
+			drm_event_cancel_free(submit->vgdev->ddev,
+					      &submit->out_fence->e->base);
+			submit->out_fence->e = NULL;
+		}
 		dma_fence_put(&submit->out_fence->f);
+	}
 
 	if (submit->sync_file)
 		fput(submit->sync_file->file);
@@ -415,6 +421,9 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
 	if (err)
 		return err;
 
+	if (!exbuf->size)
+		return -EINVAL;
+
 	submit->buf = vmemdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
 	if (IS_ERR(submit->buf))
 		return PTR_ERR(submit->buf);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index c02c03c10d92..115156a680bc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -202,6 +202,10 @@ static void *virtio_gpu_alloc_cmd_cb(struct virtio_gpu_device *vgdev,
 static void free_vbuf(struct virtio_gpu_device *vgdev,
 		      struct virtio_gpu_vbuffer *vbuf)
 {
+	if (vbuf->objs) {
+		virtio_gpu_array_put_free_delayed(vgdev, vbuf->objs);
+		vbuf->objs = NULL;
+	}
 	if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
 		kfree(vbuf->resp_buf);
 	kvfree(vbuf->data_buf);
@@ -282,8 +286,6 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 	wake_up(&vgdev->ctrlq.ack_queue);
 
 	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
-		if (entry->objs)
-			virtio_gpu_array_put_free_delayed(vgdev, entry->objs);
 		list_del(&entry->list);
 		free_vbuf(vgdev, entry);
 	}
@@ -517,6 +519,7 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			if (!sgt) {
 				if (fence && vbuf->objs)
 					virtio_gpu_array_unlock_resv(vbuf->objs);
+				free_vbuf(vgdev, vbuf);
 				return -ENOMEM;
 			}
 
@@ -1409,8 +1412,7 @@ virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
 
 	vbuf->objs = objs;
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	return 0;
+	return virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
 
 static void virtio_gpu_cmd_resource_map_cb(struct virtio_gpu_device *vgdev,
