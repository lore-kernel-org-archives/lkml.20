Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D1721A447
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457315; cv=none; b=TPn8QlXHbYP9POAR6hiDulUe7y6UFYaC/ODorysojrEJn4v0hfn7nkCgHMOtkK2hqe5B48O2PmofQbIa6kwT4vUyyt++y40eTfwoIbVyFT69ZgakBR+AJKhbdgMRpvjfRRH+Ofc0QK4mljobLCjtrtSXL4jG0pr5OpKsO+NgwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457315; c=relaxed/simple;
	bh=BEKnQcWR1iKPrgl176vsQ44f+WBOQr4meQx+EM3enr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rOvuyW3y65nLNEl3LQKLlIaCPYoxcZ/HwdYEVEaZShX7528ojKrsRJrHiDGZ02G8N1rgP72MXSz8+SlAPeXVGjDdJ1k7yxPO3Fl0WEXU0jo7TwKhP4p1f+fmihK04n0bShhXDJ9lD01J9j6wOpve8N3qgdnz/SnwVtUAq/eGA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA/D4K3q; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA/D4K3q"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332de6f6d4so1774631cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457312; x=1791062112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/dPF6IGoI8atwdjHAe3xl51teTDZCZxaac38N/HPbA=;
        b=CA/D4K3qzO+0/hdpLTfbOJWkAFMmMDGrvY8p5Ux8W2uWwRBwdllpY2XD9bw4rSJtef
         ooPuq97raSxbh2YZDCKtlFu3OCzhHGfBf9VAkSxQ2nSNT1t8fxd2S1Bj5e/i2iwlfMhW
         jJB9qtXBkBIXvCfIy5CVJ7LkKOtDl3xBt5txPBsUoIm83Jt6JO472gdyTsoHcnaSSZxl
         5+jFTpF7aiE7QB3r5wT+xml1B6JFN+xzEmo4KFdUI+8Ty7aeyfVHReTHyg0751gFlCXV
         pwDac2t/DJMUP2kMWy+kBkD8hXCBa3BnyXSxeKkwfUnOdW2y0Zl6TBK6f7JflS7HxREt
         eZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457312; x=1791062112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/dPF6IGoI8atwdjHAe3xl51teTDZCZxaac38N/HPbA=;
        b=PmulOlAc0HdXzDg76eVtIG8hP5KJ3HNpLH52NZItM9Qr1jGlye8jE7Nc5vN6S8r9g8
         nVvS1BExn2i1cSpUA7kPqAEGURHWaGw37NkjYvuDtUtIUJFBVJ8Br1z7Mjoj0wql0+DG
         Z+jDLDrKf6HurHnXrNH0b+iOyFc72LWM4lakqRrooHsER37LDv07eICkFInAIjNCaw0i
         c4ZMi151KXHZNqKUEb6FbMr0RihU2/v/cXbQTJjtw1lBrhnTTai+mIt+RKka0KKgCMWo
         NyM8pgWfBTPmQKbk1IR5p8O2tP7hKEj8+b2I+crsDMcOTxjK6Cpb8/je/0n7rV5OD2dQ
         Q6Lw==
X-Forwarded-Encrypted: i=1; AKwUvBy5mIR3eJog0kAR8/K70bt7Q9aXT91oS1eGi834RWLlfGBTPiAFV5hN1QQ0FIx4oGIiVe3GKkzWUP1cJmE=@vger.kernel.org
X-Gm-Message-State: AFuF++m/wgHy58hZazXEDatVmhvPj873UJmEKjy0cgjquBhAr13yszCd
	5iho0o2ceajM3AMrkcfAkf8PO+IRJtEsW/g41l17MP68icfdZT1THXzI
X-Gm-Gg: AYBFou1eC5y3vLJj0jAp8fAKu8gawN3og/NQjpgHNabA044gJtqLaUphCHHOy1JcDrH
	5OeMf9qI1Ki0gGDX7GWqTxNmle8aMgmIX+pteDfTMtQoxC+2dY4KwoEoFcuyIuhgruNO0OHFV+n
	F7Vz/fzK5g9LGgi7eQloyui8WJU/He8AzHivRQYQnGK13qT0P9owK01nsDnET1MuEwhIstUxtvB
	EV+tHN1Q/nhcroyj4NWrNdTADX93j5e1FMQE3QRNA0yifYSf3UpZ43GdOt+ktoPJFWWjRDFDByz
	zh4AQbYwBHt928m9A7ZERqm+Q5CaMbFSKPektsIkRy+FhMm+bQPdDlhnO5wBU4EtoFF0ozGj0TH
	0yqSJCwYtVcXmaMhLqE9oDN8elv/C3azkVeQCF6OqfrQXrAIFkRcM85fLBdydLCea5h62HGP5vR
	Lmc3zZ/toT86us0RdZQZ7rQaKLsjBhyXR8y7Uv86aNc2fmfTF41y79ASgd4mrVcVryrRcAXjd6I
	jRq5VhRsBZ+NbxlPuWPPYI=
X-Received: by 2002:a05:622a:1341:b0:533:36d3:1c81 with SMTP id d75a77b69052e-53336d31efcmr4682591cf.2.1790457311626;
        Sat, 26 Sep 2026 14:15:11 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322020e91sm26060701cf.1.2026.09.26.14.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:15:11 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] vdpa/vp_vdpa: Wait for device reset to complete
Date: Sat, 26 Sep 2026 17:14:52 -0400
Message-ID: <20260926211507.1330179-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 defconfig + VP_VDPA, W=1).

 drivers/vdpa/virtio_pci/vp_vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index f2eb654b1665..4285cb968479 100644
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

base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
-- 
2.43.0

