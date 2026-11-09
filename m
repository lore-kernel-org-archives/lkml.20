Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249782;
	b=qsfgMk1Lrv2J0hiLeKggw3Dyu8LYKx0T7yQA33hnnQts/2foUgKC/gnSrM6eYR1M1ABK
	 8tyJU0ZdSOKBwsDnDQa1Zn6Yp/BpzARkJxQfnCDf27biq6pWn8+LsXdeFOWTp6efVOcG6
	 /XwWH3m4Dvw+Fbjy235jH9zbhWvVp/KTGpjLf2mw1XQ3YcIrYtJPahnUQ7GERmgthC5Bh
	 H/Tz9Q2lQn5nmyXHexFF6VKd8gSCT3UHoj67k+d9JcK/w7XFbFHO85PYFzhk7fjdy+m9i
	 4zoIpYCnaNnKhAN/FGSxgyzdEYA5FhC4p3nDA6NhqmgAQAlTr8AVeFvQSKA3EiSqVhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hCv4A4/fOHsrQBoTCNAexOwPwKPV45Fgld4XHthQZuI=;
	b=sqJ/XcInEFMCeLJNDnE6xLL5uK14J1XxZj3f7NyHBawEbMNpS3DYxNzqIPTH35Ay8xI6
	 LvYEqGJrIXK0VzYL+sHph5C3U+BWNfZ5XryGAAMYR8eEgRcPtLK3bGzP+v0pGdSX2kwGo
	 fsa6s3DwQuXyjKVuuSfEq104Dbpk5u+EpcMFkR3LG13CAw20+wUhlK2dUtHc1pzRnSuFc
	 nzB3FCkbLYHfl8J2e+P8+FuQsJpJax4Ek+Kdj2HutXVvGnp4cxQnJZRDy4sCp3xVYr3cB
	 CVY5ghQULTWdx307JL08mxqwNbtTiBUUOKU4/DPMKHPmAUkxC+g2skXovXd8MQsiW9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtLXkgwx;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC593606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC593606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtLXkgwx
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b308fca7c3so11085127b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794249781; x=1794854581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCv4A4/fOHsrQBoTCNAexOwPwKPV45Fgld4XHthQZuI=;
        b=TtLXkgwxEPz0z8fneHxMiAg7Hmzz6JBs49ZXD2SYIDg9bKwIWSet86cI8DSPTU8sQh
         hXyW4zo5k3Hg1aMngkhng5JGY8+KRymjLOGAbHvbGlzv6N8rmmzUjiL01wEyKv+vCCcr
         OhFqj2WwJli7USde1EsLYucpDD/2mQ0cVPPg7DjRWb/0GAbQj9lejjIwYqhBdkU2pI0l
         59iwDKinKLL53Fs2NOZpB+O5wAapCp+pxDpPYLlEJ9BV3hxyYq5XeaPAPFiHaY7GNHSe
         c1ruN46S+Xg5hMRWrHW6KRU81EhD42T2m775xGM5vnOuePC39NPDyxG2s2yJx9VzFMOt
         AcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794249781; x=1794854581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCv4A4/fOHsrQBoTCNAexOwPwKPV45Fgld4XHthQZuI=;
        b=oZRWD0VaRHNDK64qcqpC7psQyohBZniAjTE/x5X8WcD8f6pAI49AqYnPYZUYmF6zGq
         M0AhWMZ2IZVFUxTw6t6C9cg2XyFgT8GKChlVKXHii+o2Pn0eb++l9Q5cj5hh+9VikSv8
         KsQd9V5Ap53bbvPff6QTU/mSWDhs4yq4gpAHpDxlSBWHL/I1Y7Fr7/NAsoXyOiJQZq8x
         Em/xcj5j67e1xKr3b0NGOJg5n0ZwlYsr/atNofCB9aacAX2agZVIngvzL8w8jUWrPmkf
         ICSm+WU0XRjYrOqkFN2HYPz40d/wgnd+hj04hFdSJW3oi0lchMsmLnjUdslhnSeSUBsh
         0Mnw==
X-Forwarded-Encrypted: i=1; AL+hErEhMnCZswpJSDHsOMnQ75nEGzg8ez2IaZwWofGXw3krDE/8KVMg2e0gx06y5cpUaI7uUpDxl+HTSfwKQYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z89/DajKzle4RA5W/YKGRn9xVLk7sfPBC8STo+EQ6NelNMx1x5A
	P+1Bh5r/dOiTTUABkLjVbLDIPAtWAJ97TJvvtUqNKWN3yGxhsI+tZU0Z
X-Gm-Gg: AYBFou33g20x8zff+rVe5wiwtGhqyUt6EWYqbQU7mf73i4+sMH9ePRf536imPRPGVzL
	dc0SKxbwbrHRNpdqLtYfNh585I0SzGlX4kRCzNrQNqoVljb9Qsu5mKFLqCZsvAolDm+YF7qNfGu
	BlxKLTCoQnX277bp88uyliBc1ihfhcjPOOHm67M9c+LBdOGYDTf7tGfprLdX4bSzpuWF0iW873q
	jWPxpY6JU6poRQI18a1YmsTFFGczQz/aOlSRfRo5nsGXEa2WVTPxUrTsLf6ZrNX/NBF/bjgwoLx
	jJBLxV4Z0/Js/OKyKtXQhfeoSLD5lK7sj7tjfpGPFzKodjS7CaOLvwEF0nvyBR1qRt+cimEdWop
	jlKRuj/uaY/jiM0B0lRC9TtSY4d2Io4AfokK91b36ItzFcmf1vXc8eXPaXU8aBc76prQ3YcpYYe
	5HFXR1UPjKPbREUvVIMeX1bFZeBMMHX5Lk/oYv1qrAZzF73pvNKGeuY5TO+nsBP8j19Q3pkm+5s
	pcuc6eB9mQd3NhZkljv9qfyrz8r9aea/ouXOPYkuj4XYsgfYJQn0jlzUj9anMuPxmV3GTCH7IKe
	xSVNhv5x9w9GKX4Ztkgi1Ew=
X-Received: by 2002:a05:690c:e204:10b0:8ae:a9c6:2740 with SMTP id 00721157ae682-8b392b6884dmr1303547b3.48.1794249780855;
        Mon, 09 Nov 2026 10:43:00 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:10::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324bbf5sm961007b3.1.2026.11.09.10.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:43:00 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Kyle McMartin <jkkm@meta.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] virtio_pci: limit Oracle DSC2-200 virtio-net to 48-bit DMA
Date: Mon,  9 Nov 2026 10:42:52 -0800
Message-ID: <20261109184253.531677-1-vlad.wing@gmail.com>
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

The virtio-net function of the AMD Pensando DSC2-200 (Elba) DPU, as
shipped by Oracle (1af4:1041, subsystem 108e:1200), cannot DMA to
arbitrary 64-bit bus addresses, and Oracle advises limiting it to 48
bits. virtio_pci gives it a 64-bit mask, so its virtqueues stop
completing requests once the IOMMU starts handing it IOVAs above 2^48.
The card is used in OCI bare-metal shapes such as BM.Standard.E6.288.

On those AMD EPYC 9005 hosts the AMD IOMMU supports a 6-level v1 page
table (EFR[HATS] = 2), so the aperture spans all 64 bits and the IOVA
allocator, which works down from min(mask, aperture), returns addresses
just below 2^64:

 - With iommu.forcedac=1, the first control virtqueue command never
   completes and virtio_net hangs in probe.

 - Without it, iommu_dma_alloc_iova() prefers 32-bit IOVAs until that
   space runs out once, logs "Using 64-bit DMA addresses", and stops
   preferring them for the device. Across several thousand of these
   hosts, 21 logged that for the virtio-net function within 0.2 to 7.3
   days of boot. On 14 of them, TX queues then stopped completing
   descriptors within hours ("NETDEV WATCHDOG: ... transmit queue N
   timed out"). No host without the fallback reported a TX timeout.

virtio gives a device no way to advertise a DMA address limit, and the
platform describes none for this device, so the driver has to apply
one. Cap the device at 48 bits through the dma_mask override that
vp_modern_probe() already provides for devices with address limits.
The device still gets 32-bit IOVAs first, and then IOVAs below 2^48
instead of 2^64. pds_vdpa uses 52 bits for the same ASIC; this uses
Oracle's narrower 48-bit limit, which still leaves 256 TiB of IOVA
space.

Only the virtio-net function is matched, since it is the one that was
tested. force_legacy does not bypass the quirk: the legacy probe
refuses device IDs above 0x103f, so the device always goes through the
modern probe.

Tested on a BM.Standard.E6.288 with 6-hour iperf3 --bidir soaks, at up
to 57 Gbit/s each way with iommu.forcedac=1 and at about 26 Gbit/s each
way without it. Neither run saw a TX timeout or an AMD-Vi
IO_PAGE_FAULT. With forcedac, every traced IOVA for the device fell
between 2^32 and 2^48; without it, every IOVA stayed below 2^32, as
before.

Cc: stable@vger.kernel.org # 6.5+
Co-developed-by: Kyle McMartin <jkkm@meta.com>
Signed-off-by: Kyle McMartin <jkkm@meta.com>
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
 drivers/virtio/virtio_pci_common.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index 79d3395f37050..0a7c97cd80509 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -667,8 +667,18 @@ static const struct dev_pm_ops virtio_pci_pm_ops = {
 #endif
 
 
+/*
+ * The virtio-net function of the AMD Pensando DSC2-200 (Elba) DPU, as
+ * shipped by Oracle (subsystem 108e:1200), cannot DMA to arbitrary 64-bit
+ * bus addresses. Oracle advises limiting it to 48 bits.
+ */
+#define VIRTIO_PCI_QUIRK_DMA_48BIT	BIT(0)
+
 /* Qumranet donated their vendor ID for devices 0x1000 thru 0x10FF. */
 static const struct pci_device_id virtio_pci_id_table[] = {
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_REDHAT_QUMRANET, 0x1041,
+			 PCI_VENDOR_ID_SUN, 0x1200),
+	  .driver_data = VIRTIO_PCI_QUIRK_DMA_48BIT },
 	{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, PCI_ANY_ID) },
 	{ 0 }
 };
@@ -710,6 +720,9 @@ static int virtio_pci_probe(struct pci_dev *pci_dev,
 	if (rc)
 		goto err_enable_device;
 
+	if (id->driver_data & VIRTIO_PCI_QUIRK_DMA_48BIT)
+		vp_dev->mdev.dma_mask = DMA_BIT_MASK(48);
+
 	if (force_legacy) {
 		rc = virtio_pci_legacy_probe(vp_dev);
 		/* Also try modern mode if we can't map BAR0 (no IO space). */
-- 
2.53.0-Meta

