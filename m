Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226307;
	b=gS4cidmlz3b2cxwuNngF98+PYdDX4BaNWJMRQk+rCwES+t+4nKf9weM3TjOA0vbzpCGX
	 CNnk3vVCTv3fcMnbIoEoGW3potHi9Eri+vvU4mdqHNVDlsKb1e5V3d8hB19U4r5UOLxgZ
	 6UzWtLHNK+XQwwtsrBUhh81q8qvyyL4cf4b1PhsfifJ0Rt4EF1y8OrLSKKzCzsOzgAOdF
	 CzMoauoqlCQqhWa4q71Z/gbjiNtJA8su5dXzw3Koq9VOWnxCzDcX3XebxJMvzXf7rJmnv
	 e1dNe1dBD3nAoX6Blgm3lV77VvbtZgHyqeeembA6KnFjGIuIyZ5NZnCz+1eFkhwxZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aAFBHqSFELXCigxcRHp1sfmuof9NM3vLwNWTQKlbcIc=;
	b=HiEYvsy5Lr+pM0NMvE0AOKEDWFz/UuVaf3CI46+nepxfQ3XnrZQ9es/jL/Dm5su8vjEk
	 CsvjWIqYk0h2suzV76tlC57/cccIk8BPbg8aWWe6/UnTC/yswMxMLIg6xsWziM1Y3OczG
	 EFbRHgCfIX9S5t85vyq3dbmruqrL8bYACwgZawAjYhxFnQpPAG1xSb3o1SCsqM8/buGtt
	 3Njj+y6KIuezy/NQ7lBXlchN1MG4inHQ1GAnhBy5GdMjps92RnA99pCAZNLhsW0nwcWBi
	 21EDzEax0osePibmWtUMjXBBXZm7Emn+OLq4LrR9ol4Knc9EHVWbpaDw2SxvPw0aDKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CeYYqGA2;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0095606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0095606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CeYYqGA2
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-930c0f9c1b1so150437185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793226306; x=1793831106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAFBHqSFELXCigxcRHp1sfmuof9NM3vLwNWTQKlbcIc=;
        b=CeYYqGA23MHsM+60h39JcabSrjxNmz7QY3G+7XpKcrpxBEH9/+aDBUfzJHX9BhG8gZ
         ab8EpW/AjakHPQB0uuBtX5gxUIEumUaCOZwL0zXTmFEid3mfVxeuDaQJ2uUzSHsF6sxW
         xRQN0uqLrAqdzUuJtLIW10kACHplZSG01Pgw0MlT6ECaH5dW+XdZO5R/QiYze5NqHk42
         k2gVQ05PQtf6Evi8vNUdESisnk84SH15LRxhNjV1R9oXFKldPpPtrsBFxHpZBqIOBssp
         WFmEawxpfHzQA809CRDXAiVUGHU1GeJJe5I8dcYFrCjAYyixu6J/m5Rh1afCfOFzdg6L
         Gpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793226306; x=1793831106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAFBHqSFELXCigxcRHp1sfmuof9NM3vLwNWTQKlbcIc=;
        b=bzJmPQFE5DeVNKP3/6IAXPaxCvo210g/zZK1ijOeSx0lmYCqdYOc2BCwVhQJ8+8GUT
         I0YAqDUG1pIBtXbF3g4NR+34AZJFjgMT0tEH/1Z6waL8D6D+9pp1CEHydBHV13dAydnj
         DlnnYnROyU6EePCKcUiFFMheJcMgXO1TCLiRHVkogT9OM1VD7iKNjHZ3FOtcHfvHvmfC
         ShFctH0WfzBzuWJHIYLq5+B2Ym/epiBDpJvgtt7LgfialAkykVMhjspLvTNDX7tx1U0d
         JHcdwmNKsOuPcY8cy1D3GpBUnxnjsX9V0vJcc539vbR42K/Untdh4RXccm/8L4kqUvh9
         +ByQ==
X-Forwarded-Encrypted: i=1; AKwUvByD6lZmJmuWMpzWTFlnEahNt8jjVOctCC4LlSyGGIrCsUAUr5v0x6EiGt9h/sIANSVUwMEwmldq4aMcqEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDF28N/f2a3xanY7aaEuMt/osy1qXD6WXWEyhSpMZhNrJAHm8J
	B91ylnsavVUBPhFgfl7ZKtpjaLIrZiPS3qowlkdtf4JPLBK2JlL11gzb
X-Gm-Gg: AYBFou2ebgF+T4Rh//JjSx9/ZiLh4AmnDNoBOFguAseYmQe0lH20Ebl5nbX11rRourg
	UuKOQnLc4yUfH4qg0Euc/WSYbheI4sW1Dv0qsAabX92mbYLxmduXVGWHkGz/5mw1gNFcS8ptfqj
	5dehCPvTFN8EmYQaa8EuoukZI/KWOov3LjpuK4WDONte0oGkndMYEgQeue3q81b+WgHds2+QyGr
	SKHm1v0o39kA1/RsTLd8p3SZmlFLVVH5uIvlbD0nKqrDxWC1DpV0R51pHoj6JkW1dvnKtmQli0C
	kTup2+jE7CcqWUmh5ncWlYPHZJScSIevodZGeYDyR0nNbZyCSe+/r8Y/qjZvVJvRhkiHjNKlDWV
	DGURQjLJTvSbYhTmrXfF7AMQZ+zADftOViXXiBrqapbXg2rGSrMSKs6iJ/scrdKhL5yf/m0Af8m
	xW+yE+A395cR0TrCMLoknEJkU0BuLYmuMM1ysxkKaYgr378fFTO5ld+a/i35aSbv0Fnjb24t+fd
	jxOnFcfnYEpqdSwXVzVHT04gnmYdm1MQL6ETGm5BZ0hwybSYu9vsbdqOkTX3pT+JAVLYcR4SADq
	tvwxWbYUn5oT5cdCsg==
X-Received: by 2002:a05:620a:17ab:b0:93a:f9:614a with SMTP id af79cd13be357-94408c91a29mr596917085a.34.1793226305765;
        Wed, 28 Oct 2026 15:25:05 -0700 (PDT)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd2110sm142981306d6.13.2026.10.28.15.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:25:05 -0700 (PDT)
From: Changyul Lee <lcy8047@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/virtio: Propagate errors from deferred blob mapping
Date: Wed, 28 Oct 2026 18:25:00 -0400
Message-ID: <20261028222500.2575769-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

virtio_gpu_vram_map_deferred() ignores errors from
virtio_gpu_vram_map(). If mapping fails before RESOURCE_MAP_BLOB
is queued, virtio_gpu_vram_mmap() still waits for a response
that will never arrive.

This can happen when drm_mm_insert_node() finds no room in
host_visible_mm. Since no command is sent, map_state remains
STATE_INITIALIZING. The task then waits indefinitely while holding
mmap_lock, and SIGKILL cannot terminate it. Any user with render
node access can trigger this by mmapping a deferred-mapping blob
larger than the host visible region.

Propagate the error so mmap() returns instead of waiting.

Tested on Linux v7.3 with QEMU (virtio-gpu-gl, blob=true,
hostmem=256M).

Fixes: 4c26e162947f ("drm/virtio: Extend blob UAPI with deferred-mapping hinting")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h  |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f3bbbe4468bf..a3c52aa17ed8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -561,7 +561,7 @@ struct sg_table *virtio_gpu_vram_map_dma_buf(struct virtio_gpu_object *bo,
 void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir);
-void virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram);
+int virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram);
 
 /* virtgpu_submit.c */
 int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 01241ce4d07c..7e0fab7fb2eb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -45,7 +45,9 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
 	if (!(bo->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE))
 		return -EINVAL;
 
-	virtio_gpu_vram_map_deferred(vram);
+	ret = virtio_gpu_vram_map_deferred(vram);
+	if (ret)
+		return ret;
 
 	if (vram->map_state == STATE_INITIALIZING)
 		virtio_gpu_notify(vgdev);
@@ -243,13 +245,17 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
 	return ret;
 }
 
-void virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram)
+int virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram)
 {
+	int ret = 0;
+
 	if (!(vram->base.blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE))
-		return;
+		return 0;
 
 	mutex_lock(&map_lock);
 	if (!drm_mm_node_allocated(&vram->vram_node))
-		virtio_gpu_vram_map(&vram->base);
+		ret = virtio_gpu_vram_map(&vram->base);
 	mutex_unlock(&map_lock);
+
+	return ret;
 }

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

