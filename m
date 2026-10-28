Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793186833;
	b=O0uvF2kL0gFPYQrEQl1PWUo56pohcceqciO6EICn8m0YE8h/eQ0cL0Gbxfx3dCKUwuW1
	 t2fZvx0azFqd8zNv0fBTTlBBrofbCUo8lYR5sFtNVYlmRAdr134MtCQzyL0MH8dOgKVRU
	 DuVxBHrln1R7/83rZDxv6luS9gebnZxcZLd4w23N5NNso6yemlvQyl3qmZiAcm0KkcTv9
	 cKbZb+wene9QQYQnw95fFczc+uUEX3dZUJGPmU0KJOksRQxvo8P5CBaSJqsdRwyJCM7rB
	 u00oEO2uFiEGO/6eoem4QQ/PX7aHsTwz46OONtMwBi8c8dynPgW1LMoXflw3GZVn5oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186833;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g3JYxGgGxyXFBBfZpaa3rLKc1gdKPZs7KJWlZCiq00g=;
	b=mMfH2f+qm4sOH2pzGNzRGKnTqtccfYmHPjJ9msUKHpIUqW66c/Bj6I7p76aaOTbgmGKs
	 o0IEYi/L/4gVt28UzMLzv9FlVjrEkAmnKccI1+jjPK3cg90D5PMVaILI4U+KeFWS7dhw5
	 ZOS4yZAkq/DKmVdb+lbogxtCAHTAsfv9i6gvi/eBODOGDXEvr3vl6zYjNVwsIxOXzgcie
	 RrAMYIWjIccFFhbNRoOcgTsrSAJnW2A/Ee9DGWPlbzSucSrbwPCpwX/X/wPlSKp6qwaOe
	 2s+rUfx7Hc8glvjjbnvQxf4lETrUKsM/hhBIkiw0atrbDT79aUfZtPqWgK5wyk3sjSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0NGwLYf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE4E606A31A;
	Wed, 28 Oct 2026 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0NGwLYf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793186832;
	b=2kqBomWrcPAB3y0z2NaTGyh1sr8ygez0WBK8wS+qGLWhGndWGOHfM7bfcssNu7gH05bx
	 pnAmEzN+r+ahK8CFLJaCLpCLEAcX+Q4GSGKUclu/3/aLf3G+3o6MQWqj1qbNCrY2/IeyP
	 SwYOsUAcb8mufDqOQarWccnFdMrTA0KUCaUqiZO2sMhptksZYSd5dvM4ewdpn/iW2oUzH
	 qV1Y8tVuIP3i9JdtcXoAUcaeb/DWqP7F5AjMVXeTFvAaqHpKVkkTQ7cPNDxIA6lqT3Gis
	 FUSz9D0FxroF2SqfN2pE3fRm0Zx9VFiqVICrrHPQfyoNbQnMSsGddEu0USbSi3YkJxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793186832;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g3JYxGgGxyXFBBfZpaa3rLKc1gdKPZs7KJWlZCiq00g=;
	b=JPbq4eJBgYOE0S8w5I+xZvy1GGgpPt7qiTvURsz6Xm8b4yVusJx7vPp4nT/L092qe1no
	 jQvlqtwQf4tGnwC8pEWPbxzLygi/znakZE8w8b0NgpGz3uJdmSgz43HIItMF8KIDvgDb4
	 fqAo03D+EP0aNU38cgv00XSd5D0jKqKyVbJVBMjFMBU1MZ5ZKKpbEDK6rSk+dXNdDmpZO
	 1h/7c08ECePWVTNZN4K8a/qaAf4ZRuMWfYRJws8qMXmlDUnQ01Nf+u788qpWnP6xEFR+9
	 Hxe8K+y4kNxklEiVb/PZn5NeoucpqZbDG+HxRCWnnBMi0fSs2drcideynjYjxGVvHyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 867901F01825;
	Wed, 28 Oct 2026 11:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186832;
	bh=g3JYxGgGxyXFBBfZpaa3rLKc1gdKPZs7KJWlZCiq00g=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=d0NGwLYfvxBzvYucQD78yBexCxiXEBPgvS1E6Ds0SCetEbQNOzkI8tmY0IaUTTs2a
	 MHsf62HY8vxu1Ukpi2n6zmjgvGcpIK/y0NYeC0ZQ7k7w+hMBlPm9tIGW1E1RhB8kBg
	 F+0Ydrqike2n1if1WRT0vcc/glnD95Qq4n6kMs3ovO9HSW4dl7/SzD+Jyt2hd05MI3
	 fwJRqMzqL+DHUCzpewVV2oWYxa3pFalqfmNuRY0A1TW0w5RXxA171bXJrSnv+HgykH
	 HnIQYcBRtqkJL0ewKv9d9+xiD5rfnlySjhlFwJ3gySfmI9JQnk+nG590w05o4uvrwe
	 YajThIB4DVAwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 127204540F;
	Wed, 28 Oct 2026 11:27:11 +0000 (UTC)
From: Valerii Bokov via B4 Relay <devnull+vlry.bkv.gmail.com@kernel.org>
Date: Wed, 28 Oct 2026 12:27:00 +0100
Subject: [PATCH] media: rkvdec: vdpu383: configure the reference read cache
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261028-rkvdec-vdpu383-cache-v1-1-d3548d3b3586@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtIB0K6SrQwHWsIKpQkEO+et
 HyL/wskjsIJpq5A5CxJrrNB9R243Z4bo/hm0IMe1aANxiN7dpj9/ZAhdNbtjCasazCkyFuClt6
 Rg7z/dl5q/QD4PiVxZgAAAA==
X-Change-ID: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerii Bokov <vlry.bkv@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793186830; l=7332;
 i=vlry.bkv@gmail.com; s=20261028; h=from:subject:message-id;
 bh=YrZCEEl+iz1Vm2vKE98hmEVblDsYTlb5LJykT0gy+hU=;
 b=j1Tr4qKXzrF23H++aNUmp8sTwItKHnW6PjU85/kuAMTyUxSLxzxUpzC/jTojEiGmCjY4yiwr/
 0qAIcK/pTnYCpo+U98LEJ4xjPfhCX9TnvtFsxlBmRUx53VuXMNa15xe
X-Developer-Key: i=vlry.bkv@gmail.com; a=ed25519;
 pk=u/rk2lx5DMp734XMF4ThLZD2H0AqvfYuikR7wu2iyNA=
X-Endpoint-Received: by B4 Relay for vlry.bkv@gmail.com/20261028 with
 auth_id=1342
X-Original-From: Valerii Bokov <vlry.bkv@gmail.com>
Reply-To: vlry.bkv@gmail.com
Content-Transfer-Encoding: 7bit

From: Valerii Bokov <vlry.bkv@gmail.com>

The VDPU383 has a reference read cache with its own register region,
"cache" in the device tree, which the driver does not map. Its
configuration and read limit are therefore left at their power-on
values, and those differ between power-ups. On RK3576 this makes H.264
decoding of a 2688x1520 stream take either 22.5 ms or 65.4 ms per
frame, depending on the power-up, while the values the vendor driver
programs bring it to 3.6 ms per frame.

Map the "cache" region and, as the vendor driver does before every
frame, enable cacheable read-allocate accesses with 64-byte lines,
clear the cache and set the read limit (MAX_READS in the vendor
driver) to 0x1c. The cache is cleared on every run because reference
buffers are rewritten between frames.

Decode time per frame for a 2688x1520 H.264 stream on RK3576, within
one decoder power-up, with the registers set between runs:

  MAX_READS  CACHE0_CFG  ms/frame
  0x0        power-on        65.4  (slow power-up)
  0x2        power-on        22.5  (fast power-up)
  0x1c       power-on         7.2
  0x2        0x13             8.6
  0x1c       0x13             3.6

The decoded output was bit-identical in all five cases. These numbers
were taken by setting the registers from user space through /dev/mem.

With this patch applied, a 2688x1520 recording from the same camera
decodes at 3.55-3.60 ms per frame on every decoder power-up (8 of 8
runs), and the decoded output is bit-identical to FFmpeg's software
decoder (751 frames).

The registers were identified with the help of an AI coding assistant
(Claude), by diffing register dumps of fast and slow power-ups and
comparing them with the vendor driver (rkvdec_vdpu38x_run() in
mpp_rkvdec2.c); the assistant also drafted this patch.

Link: https://lists.infradead.org/pipermail/linux-rockchip/2026-June/072308.html
Signed-off-by: Valerii Bokov <vlry.bkv@gmail.com>
---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c    |  2 ++
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c    |  2 ++
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h    |  8 ++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c       | 19 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h       |  2 ++
 5 files changed, 33 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 5ec755733..572ff404d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -441,6 +441,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 	timeout_threshold = h264_ctx->regs.common.reg013_core_timeout_threshold;
 	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
 
+	rkvdec_vdpu383_setup_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
 	writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d..f2f811b0f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -568,6 +568,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	timeout_threshold = hevc_ctx->regs.common.reg013_core_timeout_threshold;
 	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
 
+	rkvdec_vdpu383_setup_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
 	writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
index 04eb23297..e04b5ce1c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
@@ -42,6 +42,14 @@
 #define VDPU383_STA_INT_SOFTRESET_RDY	(BIT(10) | BIT(11))
 #define VDPU383_STA_INT_ALL		0x3ff
 
+/* Reference read cache, in the "cache" register region */
+#define VDPU383_CACHE_CLR_CACHE0	0x10
+#define VDPU383_CACHE_MAX_READS		0x18
+#define VDPU383_CACHE_CACHE0_CFG	0x1c
+#define VDPU383_CACHE_CFG_CACHEABLE	BIT(0)
+#define VDPU383_CACHE_CFG_READ_ALLOCATE	BIT(1)
+#define VDPU383_CACHE_CFG_LINE_64B	BIT(4)
+
 struct vdpu383_regs_common {
 	u32 reg008_dec_mode;
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index fbcd0f175..c609e8c69 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1158,6 +1158,21 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold)
 	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog_time));
 }
 
+/*
+ * The reference read cache and the read limit are left at their power-on
+ * values otherwise, which vary between power-ups and make decoding several
+ * times slower. Program them as the vendor driver does, before every frame:
+ * the cache is cleared each time because reference buffers are rewritten
+ * between frames.
+ */
+void rkvdec_vdpu383_setup_cache(struct rkvdec_dev *rkvdec)
+{
+	writel(VDPU383_CACHE_CFG_CACHEABLE | VDPU383_CACHE_CFG_READ_ALLOCATE |
+	       VDPU383_CACHE_CFG_LINE_64B, rkvdec->cache + VDPU383_CACHE_CACHE0_CFG);
+	writel(1, rkvdec->cache + VDPU383_CACHE_CLR_CACHE0);
+	writel(0x1c, rkvdec->cache + VDPU383_CACHE_MAX_READS);
+}
+
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
@@ -1807,6 +1822,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 		rkvdec->link = devm_platform_ioremap_resource_byname(pdev, "link");
 		if (IS_ERR(rkvdec->link))
 			return PTR_ERR(rkvdec->link);
+
+		rkvdec->cache = devm_platform_ioremap_resource_byname(pdev, "cache");
+		if (IS_ERR(rkvdec->cache))
+			return PTR_ERR(rkvdec->cache);
 	}
 
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638..f97eaef3a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -136,6 +136,7 @@ struct rkvdec_dev {
 	struct clk *axi_clk;
 	void __iomem *regs;
 	void __iomem *link;
+	void __iomem *cache;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct gen_pool *sram_pool;
@@ -180,6 +181,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
 void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold);
+void rkvdec_vdpu383_setup_cache(struct rkvdec_dev *rkvdec);
 
 void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
 

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3

Best regards,
-- 
Valerii Bokov <vlry.bkv@gmail.com>


