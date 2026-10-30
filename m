Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353283;
	b=a367q53BFZsa4mt/uAW3Tj5HISEQ6v5XQAPX68u+81kB0VXrI54LjaCa0a6zBCrughJM
	 xVy1J5luWaybQU0RNxQYSpCQa8HJzh7JeQaZJjRuRW/KR2s37JhhDWyOniDNGrekuzFB7
	 a0Q6yRRqcQ11H4LrIoUQCeKoyS6Coe4bai7LHa0kvddvUxXRNhRG6PPt0K+reNbFx625o
	 Bi420lKMRimSmVkCxBa5xbn0ItXRDQVCazbqtF7nVByTjdtymsH2CzPTygX+pEU9hvqmB
	 qAYMOVbdt+UeEHoByXTlvfzoJjiIspEAud6o7S3s4P9A/aGO9dFG/PdNlU0HWW50m6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353283;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Hr4h9G1hUeV4rDSzSox1jGks7F1bXsYZ0PH59ZWrH+I=;
	b=5j8xTXPe0Y+PCeZad/sqdI5mRUZTnmEW0cFUNqZwUgQBsHEDb7fgem9UBUblTbug+nrI
	 nrmU9D3bIgpYzmwqItVDk3sPwWdeyfjUl8pLz1LRxzvJyS5S+73kW3SlQVixYF1YMKhCR
	 pLqFVfelOTo4hgciQj2fhL4RgA85yey9xXX7GDCL4/yxm1vTUur8FJNZxr2G8HBHf/VqJ
	 Yzii2V93GerPpSGSK58GZnuZmKLvcU9lgpjEdikCeGCApSm7bDWSADYg4NUGpnxsyzZ5n
	 q6Kx/ibfgSdtI/Vv8y/jQR1fqdXMSq5fpXxbbN14BJQLHdXsGcA72x+RCv0+drgFjgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=le5tAoEz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19975606A31A;
	Fri, 30 Oct 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=le5tAoEz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793353282;
	b=FdZua2TweUP13BrG9JNqmYVfCWmNsYBLwksSGMsa7YPar3TR1AbVVTfaVtk+K/Uj0Ixv
	 o1QOtStB8vbOs1MZxs3Qc1xQFYmQ4prxq0Jq8AKG/UxafblzBSInGVYb0v4VnDS1TNE26
	 8KrASJTCjpkEr0yks3BJ9k4oEhy/+Z35BfluDf/NwtISVrHGxqdA0ipUWTA8uEEFUFHiT
	 dgYbGgTUH0fVDaL7dz737fdpTALP15EYkucGIEaTycpA0e0sb9zwPgKPszH0uh0aFQd8e
	 r8J25/5dSp3pWequO1AvqjJE2rvIvGeBQ4euFeTZakTH+mDzeGhvk/njJ8YHbtuKNEQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793353282;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Hr4h9G1hUeV4rDSzSox1jGks7F1bXsYZ0PH59ZWrH+I=;
	b=PoHJIUQgxwbiF+MCBEHv4vqMSvariNyOqF+3aSFHnjRqFydPjqlW6d4I+IhAD2F2KOvM
	 cdrZx4TJNDHj/oZ6go2lRvnrIcDAfWxfncfC9bD8dDkVrYtY6USRtJWtrg7wFAv2/ZGX4
	 CDhnJBnjvz+CiOcCLZ5Dlp9tA8L8dautrvWBNgs8lMRimi9xyRwoY4E9xubE0KTfEVbog
	 qHmmLXKHNtczLkTwSXFoUYmLPIB5BxNvL6k44cClD8Itvh+XGwbSuuaXMXxJohqIq7ux5
	 6swFrH8R31pDIPnLGz0Ec4N0WuGoyd2yZF1rW9rPdbPEI5D6MRJXAxrxqHguryW/BIA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA11A1F0093A;
	Fri, 30 Oct 2026 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793353282;
	bh=Hr4h9G1hUeV4rDSzSox1jGks7F1bXsYZ0PH59ZWrH+I=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=le5tAoEzbc0ls8h6/09tBrIN/Vw2I1323jE8IkSr+RPVKaHnX14UyusskirQBqn/U
	 03tIu7AhgrVJ/4M4wvpJAbz3x1wfWpEmjXAH7DbJ92QWgI9fh61od2qLRt/Xvl5kL3
	 gsgahzcq5uJC2UuN3SEM4xnpTJ3nvfGBo7PeLyQHoM7tzmIISdQCB8xdiqJ7GQ2UUY
	 u4NlwaUpvUArtpuWASOvFQFzsxRHxt1zk4KQMSvLed3Y0aQwR3WK/uW9YMXtqod7hA
	 T36xtDjMnIsgXjrJQmiwUdYLFyANIfnxjGMcVB7HCYInOsYgfyqmEYRWiO9sQdsPhs
	 J7vQ7mbxsQZQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5416F43707;
	Fri, 30 Oct 2026 09:41:21 +0000 (UTC)
From: Valerii Bokov via B4 Relay <devnull+vlry.bkv.gmail.com@kernel.org>
Date: Fri, 30 Oct 2026 10:40:43 +0100
Subject: [PATCH v3] media: rkvdec: vdpu383: configure the reference read
 cache
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
Message-Id: <20261030-rkvdec-vdpu383-cache-v3-1-ae188ccda977@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQ6CMBCG4auQWVvTdoAUV97DuOjPAI0ipNVGQ
 7i7hRUb4/L9knlmhkjBU4RTMUOg5KMfHznwUIDt9aMj5l1ukFzWgkvFwi05siy56YUKmdW2J6Z
 aY1qFAp1GyKdToNa/N/Zyzd37+BzDZ/uSxLr+AZNggjmsSuXQYKXqczdofz/acYAVTHKPND8Qm
 RFVNcaUJXHUfI8sy/IFbBPY3f0AAAA=
X-Change-ID: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerii Bokov <vlry.bkv@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353280; l=13314;
 i=vlry.bkv@gmail.com; s=20261028; h=from:subject:message-id;
 bh=5eZ4QT44xRMtAkb6T5sESJ96DERGplqGY0zj08cgGdw=;
 b=noGK/Wy+e1Ezk0yShtS09fpncwSQuqaOHLCwIYsXERDJ1ltN1xiBHBis7Qksg4lyqVwGTshHm
 X/l5NCNdJKaDqinwfmmAeNFtJsHmB38NFtQ2dhepB37oloosMDY3OQR
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

Map the "cache" region and configure it statically: enable cacheable
read-allocate accesses with 64-byte lines and set the read limit
(MAX_READS in the vendor driver) to 0x1c. The registers lose their
configuration whenever the decoder is powered down, so they are
programmed from runtime resume, which also covers the first use after
probe. As the vendor driver does (rkvdec_vdpu38x_run() in
mpp_rkvdec2.c), the cache is still cleared before every frame, because
reference buffers are rewritten between frames.

The region is optional: on a device tree that does not describe it, the
driver probes as before and leaves the cache unconfigured. It is mapped
for any variant whose device tree describes it and configured through a
new per-variant config_cache() callback, which only VDPU383 implements
for now, so other variants can add their own cache setup later.

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

The read limit is a 5-bit field whose meaning is not documented; 0x1c is
the vendor driver's default. With the cache configured, decode time per
frame of the same stream against the read limit:

  MAX_READS  1     2    4    8    12   16..28
  ms/frame   12.8  9.2  6.3  4.6  4.1  4.0

so the default sits where decoding stops getting faster.

The registers were identified with the help of an AI coding assistant
(Claude, model claude-opus-5-5), which diffed register dumps of fast
and slow power-ups and matched the result against the vendor driver.
It also drafted this patch and its changelog, which I reviewed. The
measurements and tests were run on an RK3576 board.

Link: https://lore.kernel.org/r/20260619111810.564384-1-laszlo.fiat@tuta.io
Signed-off-by: Valerii Bokov <vlry.bkv@gmail.com>
---
Testing on RK3576 (Smatek T10PE) with v2 of this patch applied, on top
of 6.18.34 with Simon's priming patch (v3 only restructures how the
region is mapped and configured, and renames a define):
- The cache registers are programmed on every runtime resume: zeroed
  by hand while powered, then suspended and resumed without decoding,
  they read back 0x1c/0x13 (4/4).
- 2688x1520 H.264: 4.0-4.2 ms/frame on a 257-frame clip across 8
  separate power-ups, no fast/slow lottery left.
- Output is bit-exact against FFmpeg's software decoder (per-frame md5,
  all 257 frames) for that H.264 clip and for an HEVC Main clip with
  B-frames encoded from it.
- 10 minutes of a live 2688x1520 H.264 RTSP stream at the camera's
  25 fps: 24.4 fps average (23-25 fps in every 30 s window), 14% of
  one CPU core, no kernel or decoder errors.

Open questions:
- I have not checked whether the decoder's soft reset (after a timeout
  or error) also resets the cache registers. If it does, they need to
  be reprogrammed after a reset as well.
- Simon's out-of-tree priming patch also modifies
  rkvdec_runtime_resume(), so the two will conflict textually there.

Possibly related, not part of this patch:
- VDPU381 (RK3588) may have the same problem. The vendor driver
  programs three caches there before every frame (CACHE0/1/2 in
  rkvdec2_run(): cacheable, read-allocate and 64-byte lines, plus a
  clear of each), and mainline programs none. I have no RK3588 board to
  check whether its decode speed also varies between power-ups.
---
Changes in v3:
- Rename the read-limit value to VDPU383_CACHE_MAX_READS_DEFAULT, set it
  apart from the register definitions and document it, with measured
  decode times for values 1-28 (the field is 5 bits wide).
- Map the "cache" region for any variant whose device tree describes it
  and configure it through a per-variant config_cache() callback,
  instead of checking for VDPU383 in probe.
- Link to v2: https://lore.kernel.org/r/20261029-rkvdec-vdpu383-cache-v2-1-859bb44e03a0@gmail.com

Changes in v2:
- Configure the cache statically from runtime resume instead of before
  every frame, as suggested in review. The values are constants, so
  "restore" is a plain rewrite; there is nothing to save.
- Keep clearing the cache before every frame, as the vendor driver
  does. Happy to drop it if that is preferred, but I have only shown
  bit-exactness with a single clear on one clip, which is not enough to
  rely on.
- Make the "cache" region optional. v1 returned an error from probe
  when it was missing, which would make the decoder disappear on any
  device tree that does not describe it.
- Map the region only for the VDPU383 variant, since the configured
  values are specific to it and are now applied from shared code.
- Link to v1: https://lore.kernel.org/r/20261028-rkvdec-vdpu383-cache-v1-1-d3548d3b3586@gmail.com
---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h | 16 ++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 47 +++++++++++++++++++++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  4 ++
 5 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 5ec755733..efb1f6975 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -441,6 +441,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 	timeout_threshold = h264_ctx->regs.common.reg013_core_timeout_threshold;
 	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
 
+	rkvdec_vdpu383_clear_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
 	writel(0, rkvdec->link + VDPU383_LINK_IP_ENABLE);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d..6223b89e2 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -568,6 +568,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 	timeout_threshold = hevc_ctx->regs.common.reg013_core_timeout_threshold;
 	rkvdec_schedule_watchdog(rkvdec, timeout_threshold);
 
+	rkvdec_vdpu383_clear_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD);
 	writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
index 04eb23297..da46f8601 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h
@@ -42,6 +42,22 @@
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
+/*
+ * Maximum outstanding reads, a 5-bit field. Its meaning is not documented;
+ * 0x1c is the vendor driver's default. On RK3576, H.264 decoding stops
+ * getting faster from 16 upwards, and is several times slower at 0, which
+ * is what the register holds after some power-ups.
+ */
+#define VDPU383_CACHE_MAX_READS_DEFAULT	0x1c
+
 struct vdpu383_regs_common {
 	u32 reg008_dec_mode;
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index fbcd0f175..65b84e34a 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1158,6 +1158,29 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold)
 	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog_time));
 }
 
+/*
+ * The reference read cache and the read limit lose their configuration at
+ * every power-down and come up with values that vary between power-ups,
+ * several times slower than the vendor driver's. Program them whenever the
+ * decoder is powered up.
+ */
+static void rkvdec_vdpu383_config_cache(struct rkvdec_dev *rkvdec)
+{
+	writel(VDPU383_CACHE_CFG_CACHEABLE | VDPU383_CACHE_CFG_READ_ALLOCATE |
+	       VDPU383_CACHE_CFG_LINE_64B, rkvdec->cache + VDPU383_CACHE_CACHE0_CFG);
+	writel(VDPU383_CACHE_MAX_READS_DEFAULT, rkvdec->cache + VDPU383_CACHE_MAX_READS);
+}
+
+/*
+ * Reference buffers are rewritten between frames, so the cache is cleared
+ * before every frame, as the vendor driver does.
+ */
+void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec)
+{
+	if (rkvdec->cache)
+		writel(1, rkvdec->cache + VDPU383_CACHE_CLR_CACHE0);
+}
+
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
@@ -1729,6 +1752,7 @@ static const struct rkvdec_variant_ops vdpu383_variant_ops = {
 	.irq_handler = vdpu383_irq_handler,
 	.colmv_size = vdpu383_colmv_size,
 	.flatten_matrices = vdpu383_flatten_matrices,
+	.config_cache = rkvdec_vdpu383_config_cache,
 };
 
 static const struct rkvdec_variant vdpu383_variant = {
@@ -1807,6 +1831,19 @@ static int rkvdec_probe(struct platform_device *pdev)
 		rkvdec->link = devm_platform_ioremap_resource_byname(pdev, "link");
 		if (IS_ERR(rkvdec->link))
 			return PTR_ERR(rkvdec->link);
+
+		/*
+		 * Optional: not every device tree describes the cache region. It
+		 * is configured by the variant's config_cache(), if it has one.
+		 */
+		if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "cache")) {
+			rkvdec->cache = devm_platform_ioremap_resource_byname(pdev, "cache");
+			if (IS_ERR(rkvdec->cache))
+				return PTR_ERR(rkvdec->cache);
+		} else if (rkvdec->variant->ops->config_cache) {
+			dev_info(&pdev->dev,
+				 "no \"cache\" region, reference read cache not configured\n");
+		}
 	}
 
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
@@ -1875,8 +1912,16 @@ static void rkvdec_remove(struct platform_device *pdev)
 static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
+	int ret;
 
-	return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
+	ret = clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
+	if (ret)
+		return ret;
+
+	if (rkvdec->cache && rkvdec->variant->ops->config_cache)
+		rkvdec->variant->ops->config_cache(rkvdec);
+
+	return 0;
 }
 
 static int rkvdec_runtime_suspend(struct device *dev)
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638..c4b9a2211 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -30,6 +30,7 @@
 #define RKVDEC_8K_PIXELS		(7680 * 4320)
 
 struct rkvdec_ctx;
+struct rkvdec_dev;
 struct rkvdec_rcb_config;
 
 struct rkvdec_ctrl_desc {
@@ -75,6 +76,7 @@ struct rkvdec_variant_ops {
 	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
 	u32 (*colmv_size)(u16 width, u16 height);
 	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int row_length);
+	void (*config_cache)(struct rkvdec_dev *rkvdec);
 };
 
 struct rkvdec_variant {
@@ -136,6 +138,7 @@ struct rkvdec_dev {
 	struct clk *axi_clk;
 	void __iomem *regs;
 	void __iomem *link;
+	void __iomem *cache;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct gen_pool *sram_pool;
@@ -180,6 +183,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
 void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold);
+void rkvdec_vdpu383_clear_cache(struct rkvdec_dev *rkvdec);
 
 void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
 

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261028-rkvdec-vdpu383-cache-8fbbf8313da3

Best regards,
-- 
Valerii Bokov <vlry.bkv@gmail.com>


