Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91FB37EFF1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482024; cv=none; b=pvS/K7EvU6MKjZeW4hEQa3IOnrQupSI2pN5u9CfX4zEn54RDr2cW6CbalZJTOyJVshYNBk5WwBCG6IHbGNpsmfmCahuy7EBJrrtYbB7lhuAcUOgqbvQxSDdfKlgmf/ELQVmpzYXBVmaz+ofF9dPwN/MLcCXEZyXSQX/eKrPYwoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482024; c=relaxed/simple;
	bh=088gMiMMdfhBakYerlGjzfvUzuNsGRYEXZYzg3JNdDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PyZJ1mg9eSOfaBN23Zh1WbBESzErd/CLKNEXLhCfCgdCYpUqq8kpGmpqPRXPIoC2D+1TD14k9LVD/KHVNEuqlQ35BdsOnWjbcIpuuE/CsSyubq5uBZmZsINnCEORSQ8qZy8AbdCQvIJbb5s/Qcpt9zhyBJAf1mTSVbbe9G/nbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LriTKH0/; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LriTKH0/"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so210648a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790482022; x=1791086822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7z9jyGFvSNyPE4j90ojKfCFxGEKOnKcOHIMpedzYh5o=;
        b=LriTKH0/FwfR3TY2yz5BvcjoNEmrFikO/1IdRMEIMqcWcvL+cYqhr03NNJiJolo7fi
         62qXNZjdEX0Aya55OOsJgtdLEsF76Msgbi5MiW+j+7WvwmWDPqedl7mwuyf4qOXBjAOv
         hd/vEn9Fwji1PSr0xY/M/NlEMinjifHw+zpxu5larfvVV9MzUp/KMPoTknuqnTE9YAxz
         GzxSLloHrS/qX8zRc8Z90SD0ihVaYZohUb9lQ5TeNwDyy2oGryvwvT2q5ibNER1UjXHQ
         jkdQyvS4adpkHf9kUlcfbn6rZLwPG8voy3LT/IFfE8DeQXanQnE24Twwv2gUawb+Qs4+
         Ze3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790482022; x=1791086822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7z9jyGFvSNyPE4j90ojKfCFxGEKOnKcOHIMpedzYh5o=;
        b=BAEPgP38viJo2XhBTP2yDWxKEv04fo14v4TKFIaH/FqqdaFbZUGEflDQCoTeBwuX3y
         jRhtiKGw3fXb1MbHAAo6UEX52g9Bnu1kFdNEm0sfcAGCMY3l2xG/ACSHy5JkNhfCXmjN
         Q06WYab1aE53lQmoJrzCEKzftLK4F1OKVDdbYL2Hun27UyaHyBkyaZXn5i0BtreAZTxM
         iWWEAETf92qfNzjcM3k2iwX9W84DBnqP8iKrdDYrVnT/AYdeiWEKy+8Uffrno6LfZQSK
         RUdqCYbL3pArlqIAEdEjjIJgzQjVWjriLZmbJy9MaQZi/1OYqjgwv5JujMRvhuD/ZD6n
         T/5Q==
X-Forwarded-Encrypted: i=1; AKwUvByWmMZuzG2uCk8TpqdoYS5pgcYrkU5oZMT1FNaXhphI+UN8r7IJ7c9WzOuoLHiyLw+F1SqLEnTTpMo5Zpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0MZkMOvtv/GRHJDs0URLqq+H2h3FokJauvNascx6X1lSMKgUC
	74eiI4/dwESOxsSHg+3vf6PGYbBOiF4dveBBNSpYPcnMTvWx9fPTUOHn
X-Gm-Gg: AYBFou2kaqlMqgEX4VTga4lYr77fWmojqeUUe7swAObgwezIcM5C9YWOT1z6vPIe1tD
	qUH644mzCjn6Q3XLb/U/iX7cjC67yDZALVEalz1pZ6tIbUBRsNxofljOBmvHH0DMZfSy+ecoOxo
	7qAnEBlVSSnxfKUzweS/NCfjvmVJx9s7w7mGl/oT95POmvzr36PJIF37tV4uA8ObuuBjqVZltap
	4q6S2sbtESMe8yaDpLXrWJjLXRjfcfTKL2V/0FJLjvmetq6hZjJSoHnCXILtbsLvm9LcZ9IQq+C
	csPe4X2nW74Pk6iGajaCqab9lm643w89fngcLd5JpC1cWIlZTM4HhI4dv1cJjWFl/prqakCPrVc
	7mVz6Ncarf+tBqyJaB2Ef+5te8P+fL1yf19pvlE+qEPE2UMEwk5RZMkpkqDzmvp+QSuCxEo/yFh
	jED4aBzPyhtjOY+IkycjBnGdCmQ4ydIlc2Fqk/uf43O8pKUDkV/W7sdcHmtUIoqjQ/oeSPHcgU6
	3Nn+k7Qzpo4b8x8
X-Received: by 2002:a17:90b:57e8:b0:39e:6c6a:6578 with SMTP id 98e67ed59e1d1-3a0bb6537admr5254135a91.59.1790482022096;
        Sat, 26 Sep 2026 21:07:02 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm5833191a91.13.2026.09.26.21.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:07:01 -0700 (PDT)
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
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+d93b9064fe5f74af3aa3@syzkaller.appspotmail.com
Subject: [PATCH] drm/virtio: put GEM objects when dropping a vbuf on unplug
Date: Sun, 27 Sep 2026 11:06:55 +0700
Message-ID: <20260927040655.14531-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_gpu_queue_ctrl_sgs() drops the command when drm_dev_enter() fails
or when vqs_released is set. It unlocks the reservation and frees the
vbuf, but never releases the references that the caller handed over in
vbuf->objs. Those references are normally dropped from the dequeue path,
which never sees a command that was not queued.

If a framebuffer flush races with device removal, the GEM object backing
the fbdev buffer keeps a stale reference, is never freed, and its node is
still in the vma offset manager when the drm_device is released:

  Memory manager not clean during takedown.
  WARNING: drivers/gpu/drm/drm_mm.c:965 at drm_mm_takedown
  Call Trace:
   drm_managed_release
   drm_dev_put
   virtio_dev_remove
   virtio_pci_remove
   pci_device_remove
   remove_store

Drop the object references together with the vbuf on both early-exit
paths.

Reported-by: syzbot+d93b9064fe5f74af3aa3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d93b9064fe5f74af3aa3
Fixes: b7170f9457f2 ("drm/virtio: return virtio_gpu_queue errors")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index c02c03c10d92..b36c4da04b18 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -208,6 +208,17 @@ static void free_vbuf(struct virtio_gpu_device *vgdev,
 	kmem_cache_free(vgdev->vbufs, vbuf);
 }
 
+static void virtio_gpu_drop_vbuf(struct virtio_gpu_device *vgdev,
+				 struct virtio_gpu_vbuffer *vbuf, bool locked)
+{
+	if (vbuf->objs) {
+		if (locked)
+			virtio_gpu_array_unlock_resv(vbuf->objs);
+		virtio_gpu_array_put_free(vbuf->objs);
+	}
+	free_vbuf(vgdev, vbuf);
+}
+
 void virtio_gpu_reclaim_vbufs(struct virtio_gpu_device *vgdev)
 {
 	struct virtio_gpu_vbuffer *vbuf;
@@ -410,9 +421,7 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	int ret, idx;
 
 	if (!drm_dev_enter(vgdev->ddev, &idx)) {
-		if (fence && vbuf->objs)
-			virtio_gpu_array_unlock_resv(vbuf->objs);
-		free_vbuf(vgdev, vbuf);
+		virtio_gpu_drop_vbuf(vgdev, vbuf, fence);
 		return -ENODEV;
 	}
 
@@ -432,9 +441,7 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 		 * synchronize_srcu() wait in drm_dev_unplug().
 		 */
 		if (vgdev->vqs_released) {
-			if (fence && vbuf->objs)
-				virtio_gpu_array_unlock_resv(vbuf->objs);
-			free_vbuf(vgdev, vbuf);
+			virtio_gpu_drop_vbuf(vgdev, vbuf, fence);
 			drm_dev_exit(idx);
 			return -ENODEV;
 		}
-- 
2.43.0

