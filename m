Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860139060B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665644; cv=none; b=Nq7ajZ6R7cWIwbic2HCcgUPr1cFDufYhRaTfJ93Kdxgb2mYLGyGDd0CgVDTJwznXY9LZKhHV3JFrKCC9ITjwm5RVy7ySTWTMpSlbhosXfpMV5ArEsEKzTI2QMr7yJVmlm1QBCVSon+jfXW/tGnlekdaKSUrxNNbbQ/IVD4c7HCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665644; c=relaxed/simple;
	bh=n2TenuQfS30jIvUa7/T0s//KY/39k2s4/cvb+SfW5ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2PdIP4PuEfYCJOz0MnzC1tZ+um57R81/UQyO10i91eJzq/OlwSlee3cMc1kfXZGFBAUhqT1YpKNypbfaA0kf53n5OP/64E8c70xXW/+16+WsOyPLBqAH42FTG6rfa1Tj9nwvTcj8bDTIavCT+NuaJU44mak8v971COLPny6IWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gr6lwTSi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gr6lwTSi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso22723255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790665641; x=1791270441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kjavUluxIdj8vslb6mPPnH9lKklEmbuVjVAK6jlaIw=;
        b=gr6lwTSi8HAgYQsODLsGe74Lj7tQgJWYBFFbvRGO++3sBw+TpvIFxluuMxVHBaUbaw
         5kqc/A7o0WUw47/FNFM69Ejbb0qEOy+VZRfru4N2R3elYNTj570t0Cj1n8w0N4Wm8wAc
         mbQjCGEhtO/Gxbra6Xm3c0tTtgyiNvfS1mKI+CNEaj1jUBgcezF1gFYzUX5BOKe3l3fj
         4CXCEH2eRKg6qkAYojSH0WbkYvDBqTihH/fuOD7B4t3YDwRjo1Cd2QksZEhd16JXz9dW
         OEnmnQNDMwT9Y+BTvmifV42hymoOgCS9mshXjEvHdRlAtxeqSsvX7XqL6bJJHkMx1+Yu
         LHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665641; x=1791270441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kjavUluxIdj8vslb6mPPnH9lKklEmbuVjVAK6jlaIw=;
        b=LCB4V3x0tD60X13dDA1UmPBXH6UFttKi+2jkrttJRkvHnNDfe8appjfULomBBkYI1n
         xB1Ym6rbxYR22mZapt/0b3Nt4VJdI9P5Oal/FTA/QlnQHfZerjNo1PEcAwkoot8C+ulp
         +zk4/XORQ5eXKLRG25BJbOL4S1eC5qFShKqw7WiQuSSEYi7v71A2U3cQV2qnWNB7fSig
         j81ltBRQWnYz51pL8n8flh2Fk371IkqLOxrVuhwFPaMwwlv/V1DSZ2Ddk77OdGOMNwvK
         VpvCiebp2CysDXUsToIiUny9FbWO9AM1Jbj8nv/uB3qllXDscWuIVpJgiesFOSDJTc/B
         v2Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxxZ9EzW7k7Pq615oV9itHhuG5k3EmOK4yNByof1thS5Ynip5gPo/D3obr05XyhxSOdMPH9N6pbjWBKwcE=@vger.kernel.org
X-Gm-Message-State: AFuF++n64G122mgXjkp6r41GdK9+7w6iHPt5zfoahx6m/6dKoBr5Z+Gy
	nfvutzsK6WJo3grrbUWphzav5H8CjmEgohsrMqnxaNsaLtM6YKjI6RNeskbK/g==
X-Gm-Gg: AYBFou3L3O1RZJrn0MPNDKaZOf6eToC6CzbxWwxp331brqaKJEWkpCD26lcmyJP9VaQ
	mBxPe+iTxuMOvMVDI9TYeGLX4MSxz625sH13FNugNPcP9+SDDmVdcYthLs5BYvMTDZXr64Iwg+R
	4yyLvqkteJN3oJS4L8NN65ufqjomPvlfxpSCj/fBdZpHbNsxdgeihbrPbqASkdKKcFFPf3ijofP
	KR7ZwkOps02KVqzDZdrypWCZ3pC6UgjcB9KktpYZMXGK4jUCW84iGQUwx8wuRUkIp3G+oTLLfiA
	UOvvWjCfD6EvQhWLfp8YqlpX+9tACsNYVms6hCPOgsn1hJ1CXa80g/0CnURWNfVtthJwEFnrDXx
	yfCvw2r71y80g8Wta4FhvFGfyqmG74iJO1Y6Ks3JNYDPPgOyOVBt9Wqdtj74KkHD0iAE4pFKWUQ
	bDAYmd9iLS+BrqE4LOc7HvqVzFqGUzYx0WZJlEC70Kxx8WMfxVLcFeZnHLzCU5BvHOqWatdHeE9
	QZ5MeJEY39bvb06qBuaZij7Iru/HVK/4wPyYAvmK4ROzQewNpreFYPTpW4r4Wx5XtI=
X-Received: by 2002:a05:600c:3556:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-49fe6708a46mr262115795e9.31.1790665640767;
        Tue, 29 Sep 2026 00:07:20 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-017-137.2.214.pool.telefonica.de. [2.214.17.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm57919625e9.8.2026.09.29.00.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:07:20 -0700 (PDT)
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+3590d97d8a586fa955c2@syzkaller.appspotmail.com,
	Abhin Parekadan Jose <abhinjoses@gmail.com>
Subject: [PATCH] drm/virtio: Destroy obj_restore_lock on the final drm_dev_put()
Date: Tue, 29 Sep 2026 07:07:14 +0000
Message-ID: <20260929070714.169412-1-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_gpu_deinit() calls mutex_destroy() on obj_restore_lock, but
deinit runs from virtio_gpu_remove() at unbind or PCI remove, and GEM
objects can outlive that. An open /dev/fb0 keeps the fbdev buffer
alive, and the fbdev DRM client holds a drm_device reference. When the
fd is finally closed, the buffer is freed and takes the destroyed lock:

  fb_release()
    drm_fbdev_shmem_fb_destroy()
      drm_client_buffer_delete()
        virtio_gpu_free_object()
          virtio_gpu_remove_from_restore_list()
            mutex_lock(&vgdev->obj_restore_lock)

  DEBUG_LOCKS_WARN_ON(lock->magic != lock)
  WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0xf2c/0x12ec

virtio_gpu_deinit() should only do hardware teardown in this case
related virtio, its queues and others. Software state that GEM callbacks
still use belongs in virtio_gpu_release(), which runs on the final
drm_dev_put().

There are two equivalent ways to tie the mutex lifetime to the
drm_device:

 1) Move mutex_destroy() from virtio_gpu_deinit() to the end of
    virtio_gpu_release(). This is what this patch does. It is the
    smallest change and keeps the teardown next to the rest of the
    final-put software cleanup.

 2) Initialise the lock with drmm_mutex_init() (checking its return
    value) and drop mutex_destroy() from virtio_gpu_deinit(), so DRM's
    managed release destroys it. This also covers the virtio_gpu_init()
    error path, where release returns early because dev_private is
    NULL. Skipping mutex_destroy() there is harmless, since it only
    matters for mutex debugging.

Either fix removes the WARN. Option 1 is sent as the smaller change,
and option 2 can be done instead if preferred.

Reproduced on arm64 QEMU (-device virtio-gpu-pci) with DEBUG_MUTEXES
and PROVE_LOCKING: open /dev/fb0, write 1 to
/sys/bus/pci/devices/0000:00:01.0/remove, then close the fd. With this
patch the WARN is gone, and rebinding brings back /dev/fb0 and
/dev/dri/card0.

Fixes: 54a970048296 ("drm/virtio: Add support for saving and restoring virtio_gpu_objects")
Reported-by: syzbot+3590d97d8a586fa955c2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3590d97d8a586fa955c2
Assisted-by: LLM
Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 1d4d3bf46a20..0ec755c35050 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -354,7 +354,6 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	virtio_reset_device(vgdev->vdev);
 	virtio_gpu_reclaim_vbufs(vgdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
-	mutex_destroy(&vgdev->obj_restore_lock);
 }
 
 void virtio_gpu_release(struct drm_device *dev)
@@ -370,6 +369,8 @@ void virtio_gpu_release(struct drm_device *dev)
 
 	if (vgdev->has_host_visible)
 		drm_mm_takedown(&vgdev->host_visible_mm);
+
+	mutex_destroy(&vgdev->obj_restore_lock);
 }
 
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.51.1

