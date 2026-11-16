Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798120;
	b=yfJEe96hqgPNNKkT/2tE7YwuQXkA+ip5OkjPBkwBPUKT0pZQmexFFnNgfbvGJOZHMLEB
	 L2iiW+l9U57aM5kd0V1VtHteR3ZCYNyL5AvtSmoTpQ3OFhdElcaPSPyzgrT0QDboQr7KJ
	 gatqUcVlatwnF16PtdprGm+HhTqMP0cj8dXDnWqaasYYhON1SQ/DD1/4PDe34TAeBVpKS
	 JPRcjM8hpcv3Q6R4pcMKAXZ4BRHXxwh7o2eVywZImVk72t+0DFGCeMDxlhDb7hqbTX7qx
	 7OC5Z732KAJ1hnzcQAipOLzLyriAJ+eKV6PwRkgSm1OsVWaSqX9k2NQgOkfUot/AqRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VMrRqMHzjHqGYxf2SI/6lKJFf2peQ7pwuCUbgZFOrI8=;
	b=4gcvJzTpwvmz3HexItgq7WCvNPHLy9HEMx6W+8mvUEGdSCFuRsyqrF10xyFVW+Kg2/LM
	 XLc6MKu3GCpLy/jjY9EaoPH6Ejhg4IVXub9SOgk18Dm8Aiy0LTWzs5y4d4VmGTLMoxtWj
	 cJnEK4egxMCv4u0AedCgt1y2W37hKgWdf9HyjpCn0jFCldnGuWGpFy+N1arb2+nYRNb1L
	 kma5E0wSMKktEsLa/+JY3KRP2M3PNU8WIWr+BLRimyQ7VLKs79eaRl7CJfpqyBeAuKouu
	 bajAfxp0RHWymmmEoGT8Ucd9Jy7KR8nkxssELbRli5kvMMuKn2y7APkSP1xevMpCuPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nx87/17J";
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA626606A88F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA626606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nx87/17J
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9497a167a6aso63817585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798119; x=1795402919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMrRqMHzjHqGYxf2SI/6lKJFf2peQ7pwuCUbgZFOrI8=;
        b=nx87/17J9VOodn6wTyx5xwYEU4EMFXdmu4jFIGn3hqEjY6uxZZ2TrPdn/s7oJTneog
         mXWTRLh1pzSfT1QzCK+1N3KHSxAOH27ZO4HtQxwhyB4M7otBvI8b7ORMyIPhF0FWQTOg
         YxhQJWsysRYVtWBAFsEv5VaPYz/dB19yWLvertvvAOAIhZccr1yNACaxV3I+DQTcaIzu
         70eikdTMbwpTGqHZL9fkTGq+htMOu7Ad0HybocBeFyVpkA3xawfkXN/p3XYqAVLn9KVl
         0ADZyPB0RcZDYOCvkzA9HNQwLm12FueNfOnOOjoyLwLhDGR30a1JOMMNpXLrOXfwPmWu
         uX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798119; x=1795402919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMrRqMHzjHqGYxf2SI/6lKJFf2peQ7pwuCUbgZFOrI8=;
        b=rI+VjoJAcSQ0FwqQdtoozBNHXZo6mV888IDWlyGFm1DMSSaAVC8X/JCp3gN3cMujzZ
         UV0RvK/UYMyy9/wx1kH8hb/PsBqDolMbJOpzi49cy8Gq72yQ9JZab+l7kLpuK+7gV2aP
         cbiolXOpI9wxiq//n7irfk3mKy1gkUD+ju45u+ICN648SyB32Pj/mgfBaUz8zk/I0FX/
         eLieQTio838CI51h5iuW2UTEnMaHFJNJaD8wImMshKS8yivB63iWsFSAEVmLVM24Ks6Z
         OGYgOO8XmWG/fOudyd2pDbSgwTQ/8eAbufK5GhyCiXqr2sT/a8j3rysSOw1JAseyY1QC
         gQcw==
X-Forwarded-Encrypted: i=1; AL+hErFLvYFv95LrYzKpa0pdqDC7HOJLirSu3DIP9eDGqHxcKvpfPGGxoPCJCxXfa46Djnszh/iTNyxpTHikDTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ei29W5vfI5I7706qwZBQRLZmOvyd9M2vSdIyNuL3GwRZFxR+l
	DoUUvKjstQ1dX10+tWAKGCmMSQIGBQYDCAbGWcmBEW2wxEN7906Pq9TS
X-Gm-Gg: AYBFou3FThCbw347Ep7gXBdgTmW0MZ5HQdHlu/i5nWwfpLmTZL93FduYsGgoSO6XBpr
	nffF4oORI3L2f0XTJXL3BUw55lpDCqELmeK/m5oQZQ865L3Anf89L1KB9cyZ5n28Ca029evKGB5
	F7M/6FSF12v4d3IJyddnbCL9RptRwB3tq9KLL0UVvlY/Ed/N9PVVC6D0SYT8059wiBlB3R3EPjN
	dEk89KzXELZIzhpT3hrnpMLUXGu4OEdLyN7BGZQgYz9LE8ldQNqx04SY0sIeoN/TZ6z4itN1Yjz
	ug7Yudl/+FL/ATVMLshybwZKl/5rWeKyU/btCNsXjK+UtFB2kbYhifgXP4qKyW3O79NUOxxVzbZ
	vFLENNKP66bl3GmDklmFzfHnQ0XszDYIlviPX1Hb49J9JCa0rqfi72hqo/GA6wpHckboMuTFfgg
	MphprvmpPs1b8iXftoJ93cDoRdraOIhb2LF64rjW54B0FGzSdGxCqE5ZSD4vgvVR8iLgcaAhVUe
	7cBoQfUKuFCI5Bq6U50hNqdDJk3T88ZEGQFsoIUE7qRyQtlVGH84bq6wFUikMJYRJB3SUhGM4LU
	xNAkoi60Zr0hP41pVD7Oos2iUvxM+ylpgA6B9JLPGZkgzhGdusnz
X-Received: by 2002:a05:620a:6019:b0:93e:95ce:5394 with SMTP id af79cd13be357-9494b9b63acmr1378102485a.2.1794798118524;
        Sun, 15 Nov 2026 19:01:58 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c831b7dsm746297085a.20.2026.11.15.19.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:01:58 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] vdpa/vp_vdpa: Wait for device reset to complete
Date: Sun, 15 Nov 2026 22:01:44 -0500
Message-ID: <20261116030152.1704527-2-oss.patchbox@gmail.com>
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

vp_vdpa_reset() writes 0 to device_status and returns success right
away. The virtio specification requires the driver to wait until a read
of device_status returns 0 before reinitializing the device, and
virtio_pci_modern's vp_reset() does exactly that: the read-back flushes
the posted status write and any in-flight device writes, including
MSI-X messages.

Without it, vhost-vdpa (or virtio-vdpa) can go on to tear down the
IOTLB/IOMMU mappings or reprogram the queues while the device has not
yet finished its reset, and may still be DMAing to the old virtqueue
addresses. The MSI-X vectors are also freed while an interrupt from
the old configuration may still be in flight.

Poll device_status after writing 0, in the same way as vp_reset(),
before freeing the IRQs and returning.

Fixes: 64b9f64f80a6 ("vdpa: introduce virtio pci driver")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
v2:
- Drop Cc: stable, as this has not been reproduced.
- Rebased on current mainline. No code change.

v1: https://lore.kernel.org/r/20260926211507.1330179-1-oss.patchbox@gmail.com

Like vp_reset(), the new loop has no bound, so a surprise-removed
device that reads back all ones would keep it spinning (the Sashiko
review of v1 pointed this out). I kept it the same as vp_reset()
rather than handling that case only here.

Compile-tested only (x86_64 defconfig + VP_VDPA, W=1).

 drivers/vdpa/virtio_pci/vp_vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index 646efd9384fb..eba82ff253ea 100644
--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
@@ -8,6 +8,7 @@
  * Based on virtio_pci_modern.c.
  */
 
+#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -236,6 +237,9 @@ static int vp_vdpa_reset(struct vdpa_device *vdpa)
 	u8 s = vp_vdpa_get_status(vdpa);
 
 	vp_modern_set_status(mdev, 0);
+	/* Wait for the reset to complete */
+	while (vp_modern_get_status(mdev))
+		fsleep(1000);
 
 	if (s & VIRTIO_CONFIG_S_DRIVER_OK)
 		vp_vdpa_free_irq(vp_vdpa);

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.43.0

