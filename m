Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694224;
	b=wAxg3EwsaH1JkSWkweZ5FljzKzGpeT+cSJRFDeQ0oCaU6L0EPI2jir3b+rANJQGYmdWr
	 1o6uFTDV2sSglx3avvoxvvtNd1ocSqA5lR5VzJQsIw9P032+lnVNlMZ7p1hqt1uacKy7t
	 bif/rq32SnPeLmA+Ec4jcBuvvz3S4n8HER8wES0zz9/AXB1WD1Sd6B+TOim8EznE7MU/Z
	 mWLmpePckMBjAsAWiGJj7YaYTJuh5oDUF3stKceCGmZFZTKWMPlrotPjrQPorf/Xz3hH1
	 EJINSqDPezmgMp6b9cMYqvQVoimqE/Jqh3zcZeYFS+yF31rc2XPyo/WslLCIx1udv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694224;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=2ECwTwXiBe0gubcW3iPncm47rm9igRKhfLcbhsqfmic=;
	b=xeFyPBXx2LASbgrD+K+nQA8DPn83TZ+43c6NiOTyAwD+5emnuasHEXez5UQ16KSzW7te
	 /3JiBndhjnEKJEzSp1zDMn+ObEjFVGRJVgwv/n6+fNBn5PvReKOlgha+rZ70CVspK4pme
	 yiZoxqR+E8kOKc0rLKReJ3Lt/IlAgLEXAUa7hLErK0oLvTPlgUxRWOXXZzrCMhZclAlMW
	 Emlpe2wNSD+rMJb3P4kRX+V5x9XMeDXRqSbo/F1iEgsYwd9GEiSTAN2p4Ok1zBwiiF3T/
	 VvWEh+fNEvNAS+FGMIDZAsQXHZ6kyAdUr/0xWGfzbeqrp/ONSfi01BT9NSor/hQWXEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F19C606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F19C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8490253aeb6so4494566a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694222; x=1794299022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2ECwTwXiBe0gubcW3iPncm47rm9igRKhfLcbhsqfmic=;
        b=S28LB3IlohzSdp9daTtFi4tSuz7wRMl2xKkvpuS1P9eGOMES54ag1g5uPWXhcSoy4R
         RumTPr9t09WuSs7dQVrteEELw+n4FO1WyvHPrj6zACKwKx3vtkk0EfsqR9/tNUv8UKYt
         XrZgxw/7MLfmm1pSfoiDDV4tEKpFZcTPrzNtZTj/N5HNf1v6S2fJwXzuWN63oEH5YfBZ
         /egYhis5bpl0roFhjojTavVzQOJqajtHbIAe6enkIH9D5eG65c4WIZjyE44LcAAq2DR8
         0ZJpZ3fWuz/9zvT6ixKlqHxdQmnyNZmbN41r9pZ1rxFA2q0axX0GTYJnogDiAg6Z2lh1
         uh5A==
X-Gm-Message-State: APuU4Z+ulfGtYh+aVTpvwjpKF3UPoYnjvpZgcvUjH1osiQk5lQhEhkZ/
	B+mNF7DLWD3pwPOlkqNPs/7hfnx+1aoc/A9UVXXpmA2UWYCr26ywF7X0XIcUxeI9i8A0OtCvDLM
	oIkjciFctUpyNIj0Zn9Ur95i3xGxi55J54gdjt4BjoshL1NL7KTLBYX/xfjo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:60f:b0:6df:10cb:4a5f with SMTP id
 006d021491bc7-714f278f5f4mr6502431eaf.70.1793694222668; Tue, 03 Nov 2026
 00:23:42 -0800 (PST)
Date: Tue, 03 Nov 2026 00:23:42 -0800
In-Reply-To: <6a69609d.d9e86bb5.297b12.004a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae99a0e.e7ff570f.151473.00b0.GAE@google.com>
Subject: Forwarded: [PATCH v2] drm/virtio: Put GEM objects when dropping a
 vbuf without queueing it
From: syzbot <syzbot+d93b9064fe5f74af3aa3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v2] drm/virtio: Put GEM objects when dropping a vbuf without queueing it
Author: fei.yu@intel.com

From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

virtio_gpu_queue_ctrl_sgs() drops the command when drm_dev_enter()
fails or when vqs_released is set during device removal. It unlocks the
reservations and frees the vbuf, but never releases the GEM object
references that the caller transferred in vbuf->objs. Those references
are normally dropped by the dequeue worker once the host completes the
command, which never happens for a command that was not queued.

If a framebuffer flush or transfer (e.g. the fbdev damage worker) races
with device removal, the GEM object backing the buffer keeps a stale
reference and is never freed. GEM objects do not hold a reference on the
drm_device, so the device is still released, with the object's node left
in the vma offset manager:

  Memory manager not clean during takedown.
  WARNING: drivers/gpu/drm/drm_mm.c:965 at drm_mm_takedown+0x62/0x280
  Call Trace:
   drm_managed_release+0x1bb/0x540 drivers/gpu/drm/drm_managed.c:75
   drm_dev_release drivers/gpu/drm/drm_drv.c:924 [inline]
   drm_dev_put+0x1f/0x30 drivers/gpu/drm/drm_drv.c:957
   virtio_dev_remove+0xb8/0x170 drivers/virtio/virtio.c:375
   ...
   virtio_pci_remove+0x7c/0x110 drivers/virtio/virtio_pci_common.c:760
   ...
   remove_store+0x123/0x140 drivers/pci/pci-sysfs.c:524

The vmalloc_to_sgt() failure path in virtio_gpu_queue_fenced_ctrl_buffer()
has the same problem, and additionally leaks the vbuf itself.

Add a helper that releases a vbuf which was never added to the
virtqueue, including the object references it owns, and use it on all
three early-exit paths. None of the callers touches the object array
after handing it to the queue functions, so this cannot double-put.

Fixes: b1df3a2b24a9 ("drm/virtio: add drm_driver.release callback.")
Fixes: a46991b334f6 ("drm/virtio: abort virtqueue wait on device removal to avoid hung task")
Fixes: e1218b8c0cc1 ("drm/virtio: Use vmalloc for command buffer allocations.")
Reported-by: syzbot+d93b9064fe5f74af3aa3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d93b9064fe5f74af3aa3
Link: https://lore.kernel.org/all/20260927040655.14531-1-ngocthang2710.1999@gmail.com/
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
[fei.yu: also handle the vmalloc_to_sgt() failure path, pass the fence
 to the helper instead of a bool, fix the Fixes tags]
Signed-off-by: Fei Yu <fei.yu@intel.com>
---
Testing: syzbot C reproducer (PCI remove/rescan loop) for 120s in QEMU
with fbcon on virtio-gpu: v7.4-rc1 printed "Memory manager not clean
during takedown" in 377 of 441 cycles (kmemleak: 4040 objects); with
this patch, 487 cycles, no warning, no kmemleak report.

v2 (Fei Yu, Nguyen's v1 got no review for weeks):
 - also handle the vmalloc_to_sgt() failure path in
   virtio_gpu_queue_fenced_ctrl_buffer(), which leaked the vbuf as well
 - pass the fence to virtio_gpu_drop_vbuf() instead of a bool
 - replace the Fixes tag: b7170f9457f2 only changed the return type;
   point at the commits that added the three early-exit paths

v1: https://lore.kernel.org/all/20260927040655.14531-1-ngocthang2710.1999@gmail.com/

Note: Hui Peng's "drm/virtio: fix vbuf->objs double-free, fence NULL
deref, and sgt error path" [1] touches the same paths (by moving the put
into free_vbuf()) and conflicts with this patch.

[1] https://lore.kernel.org/all/20260919223440.3884176-1-benquike@gmail.com/

 drivers/gpu/drm/virtio/virtgpu_vq.c | 30 +++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index d99fb9e32..21271966b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -208,6 +208,25 @@ static void free_vbuf(struct virtio_gpu_device *vgdev,
 	kmem_cache_free(vgdev->vbufs, vbuf);
 }
 
+/*
+ * Free a vbuf that never made it into the virtqueue.  The caller handed
+ * over the references in vbuf->objs, which would otherwise have been
+ * dropped by the dequeue worker once the host completed the command, so
+ * release them here.  If a fence was passed, the reservations are still
+ * locked and must be unlocked first.
+ */
+static void virtio_gpu_drop_vbuf(struct virtio_gpu_device *vgdev,
+				 struct virtio_gpu_vbuffer *vbuf,
+				 struct virtio_gpu_fence *fence)
+{
+	if (vbuf->objs) {
+		if (fence)
+			virtio_gpu_array_unlock_resv(vbuf->objs);
+		virtio_gpu_array_put_free(vbuf->objs);
+	}
+	free_vbuf(vgdev, vbuf);
+}
+
 void virtio_gpu_reclaim_vbufs(struct virtio_gpu_device *vgdev)
 {
 	struct virtio_gpu_vbuffer *vbuf;
@@ -437,9 +456,7 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
 	int ret, idx;
 
 	if (!drm_dev_enter(vgdev->ddev, &idx)) {
-		if (fence && vbuf->objs)
-			virtio_gpu_array_unlock_resv(vbuf->objs);
-		free_vbuf(vgdev, vbuf);
+		virtio_gpu_drop_vbuf(vgdev, vbuf, fence);
 		return -ENODEV;
 	}
 
@@ -459,9 +476,7 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
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
@@ -542,8 +557,7 @@ static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
 					     &sg_ents);
 			if (!sgt) {
-				if (fence && vbuf->objs)
-					virtio_gpu_array_unlock_resv(vbuf->objs);
+				virtio_gpu_drop_vbuf(vgdev, vbuf, fence);
 				return -ENOMEM;
 			}
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aa41f7089456b709927a2d1d5480fdc2f0f2ec76
prerequisite-patch-id: 78c30e7ee8bc1e8d2c9e0626e8988a021d61b3bc
-- 
2.43.0

