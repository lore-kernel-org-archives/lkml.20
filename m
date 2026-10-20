Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489164;
	b=LXnJdiB2H4BLuMomHk5LoRN9/+oHJIKOqOXTKCyo51NDyLF5r4hB1Pyk9jiC20mjvyHQ
	 HYySDmrgzlOg0/y52dEugIH5MDjqjYyN9ck2XXOkQ2YZ+lfrb9r1jcnWhUbt4iqTbXpWC
	 3uWopnwldfO3SWKHjxszisRCTGcSHv3um1uJfDH61uzl1cUYzBR0aQxF47QHInT8sLXx/
	 2pXJ3mVpx/pZy1FOgJv2+aQT7t+x6e6AM+HAHBH5TSajX5Fvzq4VtgyeKBsLH4zb7QKvW
	 Mu1iwQIkM/7naiCOaBOzrW1x1ZbcVISXVAN1bYl8i/F7jOnIg02WScbDQGy0ON4UoEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489164;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Authority-Info-Out:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=WKKEPRBVSW7uWwt7Bhk5O7DoSERJDLDM2+damhcJuG8=;
	b=StGETl4RZF21ffg3tIZbRrQaPkQu41rRv822ReUCnFRXkPO+Y0dJYJr/x0ofNFnf+/CB
	 3G2F2NHb9CXoldXum7jvDzPS1uTwmea/QY8si/Wh8IJUqilh9923RCQiU8jvyoH3Q2uTz
	 9ngxDMEdy4RynAVYfwLvq6iIrCn+O4Okwe13VKpx9NGH+1dneKWaCPuXKbk7r+UiTjWhv
	 uGBF1KytnfI66o1GM4KuzSeA/H6piSFSPLdUExNtu7Y006s68phoc9B5VYo50w0nSwWxp
	 4387LOwPvWq1ecg7JGiHqdDqd/KjhOOKfkn16aj1GhtX7QQgCP16vbieUe9igODTKyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=NSsYcq1L;
	arc=none smtp.remote-ip=57.103.79.79
Received: from outbound.st.icloud.com (st-2005l-snip4-6.eps.apple.com [57.103.79.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3468D606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3468D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=NSsYcq1L
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 9ECB31800106;
	Tue, 20 Oct 2026 09:39:17 +0000 (UTC)
X-ICL-RepId: 01a158ad-f39b-7e9f-93fc-19ec99df008f
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGBF0BTVAPVgoAQQtNV1V3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489162; x=1824025162; bh=WKKEPRBVSW7uWwt7Bhk5O7DoSERJDLDM2+damhcJuG8=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=NSsYcq1L42wggBLx3Ra2IZoXmZSAHcCZtYwOzfs7WA1nM8wrQ6P25ETONQ53lyyW7pxdd/t9phYmVYviJ9uosHGrCfh4kdTWyKaP8aTGn1dzf0L2gqwi2K8m2h1qUudABNrANTj7+UC/H4dHdhDX6FEK2Ef+r1zYgBSnUV0duW0YFbwrMskWLzS4f/hh7v5E4MVtwYF0hS9lt7K5hDlFoYEEo3JPmZjOOMgavZXuzdOgMGQdVGp3ZzrNSsGFp0YyQwYQHNzfwbGJgcfy691BdVFpntS3Ac5EfY8DU9SMTUUXSrPgIRLCIKVBCoN61yBJEHNTLtKw6ReuwkmoLZmwVQ==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 930B71800231;
	Tue, 20 Oct 2026 09:39:14 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:47 +0200
Subject: [PATCH v3 06/17] media: apple: add avd driver
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-6-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 2ZCQX7ABI_Zrcj5BSg_DG7OT5tDHucal
X-Authority-Info-Out: v=2.4 cv=Hrh72kTS c=1 sm=1 tr=0 ts=6ad736c7
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=a4NEJbfMAAAA:8 a=cANso0OxAAAA:8 a=v3ZZPjhaAAAA:8 a=cm27Pg_UAAAA:8
 a=7YfXLusrAAAA:8 a=jryBQc8UI22l7NDH2pYA:9 a=QEXdDO2ut3YA:10
 a=C1Acd3J0lQIyQdj7UkMi:22 a=SLz71HocmBbuEhFRYD3r:22
X-Proofpoint-ORIG-GUID: 2ZCQX7ABI_Zrcj5BSg_DG7OT5tDHucal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX/xp9UnTEsNPa
 Jz3QevRn1lfc69fp0/JEqnuw37WKYhDAO1uupgUHQt/jN6CK1hYdtDy8aTlWRkN8gglik4MeDYb
 nN5ssaaxlte0/VZYNRrRldNmNldywffegRzIIo0+jmF96URWlTsBKUu8oG8FIZwf4MUSEX8X37i
 YAPqyHxAC4fLS/AyG5Ttb8ifgd7FCRHsu/KUWqwFAMpdXpcsBxkhYWyElne0rH+TQ3rQQB3HAK8
 pO2vTEXX1ar06JAU857ntklScCR0xlvQ1qloS8n4E4w0rBEp5YDtOUZZI4YxZe9bBmSwz39O0qF
 sGPWyKJ3fjcuQJaH5v8W/4BpfI7h+XuiPa9qDozFuszGgUmn/JsSesSik7DqGw=
X-JNJ: AAAAAAABI9bV+42JEXEVDeK2d66uDkPhLnDDSh/w47FfponJ5JsY3bqb2Fw6B9pXij7vtgx0P5KCqgvCHYCaThkNzoLNFb5C+HOlDpoYA6TTY8o8wNYCL8PY58B2dlCCqelXV7aaNRx6zmxE05+InX5b2bpD8RT/Du0WKgTa2+pp76zOq3JsX5E8jyTWm2A/dUWfqMv8dmk+7F2+Ga/Py9vXk3+je+YInwL8b99p5Q1dcgXK/+IYNAG0v7Z4jc7pbaz8GZCn1q2QHEbzvPIj0CRGGf/0cwS39N5H4CyO7pMJDwHX0Q5KLVStkXBhIPtyJNzmUc6Siw/cV3tl/HbABTkHzftxjJe4PrwZeRsni7dRfx4Nw5FI0hY/rsSbJtIV2MbN4pNLuw0Lzz0RveG1zU7q9t0e6zuXhThiaNEKmPJzm26NUD1Z5wjS5r1KUzmIDTEhWm39d3w9Jcy1P8V9P53dN+82VHIS2qUKmZ2M7Amb2qMpYp40wLNKAza0/RLhgYylK6w1NLuo6liM+f8WYWFFvxV/Q+O4nPEmfeanAfbRnBl8PLpd8axcwRapBBjVEpUzk4+i6i0OQmcV7kfrvq+NT5JbQmv7hFKnPwQHHOo49/K0Z1EAwa9jTuK1DOBmIMRldfywrtSRVXFRuCV94ioknIIUXfzJ/gZD3+Q9cWSQbCv0vnvC9umr8gaaDaRIYb3LyZA+SAQ3GbIz9G+EGKGb+tMik3iBq88EZdwVxxMpCwHqT777sBHxU1kALJJzK4Qss9xKlrlSOxC9F8gA5KXsiMWw8EIOjmGSRV0Kk/5UshfVX7SXN00wxvxdgMSrdfys87SH/bKTB6ezyYwGm8WEtUDi5iEMNQkJQFQqA6jb3HblEvUSZZqp/PmAEHPdhFA2FsPT9ZCgT5LRZe2g

Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
support based largely on rockchips implementation.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 MAINTAINERS                                 |   1 +
 drivers/media/platform/Kconfig              |   1 +
 drivers/media/platform/Makefile             |   1 +
 drivers/media/platform/apple/Kconfig        |   5 +
 drivers/media/platform/apple/Makefile       |   3 +
 drivers/media/platform/apple/avd/Kconfig    |  16 +
 drivers/media/platform/apple/avd/Makefile   |   4 +
 drivers/media/platform/apple/avd/avd-drv.c  | 782 +++++++++++++++++++++++++++
 drivers/media/platform/apple/avd/avd-inst.h | 210 ++++++++
 drivers/media/platform/apple/avd/avd-v4l2.c | 783 ++++++++++++++++++++++++++++
 drivers/media/platform/apple/avd/avd.h      | 267 ++++++++++
 11 files changed, 2073 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4fabca992fd4..3c919f7986bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2676,6 +2676,7 @@ F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c
+F:	drivers/media/platform/apple/*
 F:	drivers/mfd/macsmc.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 2c7699b6610b..280a9db25935 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -66,6 +66,7 @@ source "drivers/media/platform/allegro-dvt/Kconfig"
 source "drivers/media/platform/amd/Kconfig"
 source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
+source "drivers/media/platform/apple/Kconfig"
 source "drivers/media/platform/arm/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index d47c47d817da..aa82e189936b 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -9,6 +9,7 @@ obj-y += allegro-dvt/
 obj-y += amd/
 obj-y += amlogic/
 obj-y += amphion/
+obj-y += apple/
 obj-y += arm/
 obj-y += aspeed/
 obj-y += atmel/
diff --git a/drivers/media/platform/apple/Kconfig b/drivers/media/platform/apple/Kconfig
new file mode 100644
index 000000000000..43c0a56c36a8
--- /dev/null
+++ b/drivers/media/platform/apple/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+comment "Apple media platform drivers"
+
+source "drivers/media/platform/apple/avd/Kconfig"
diff --git a/drivers/media/platform/apple/Makefile b/drivers/media/platform/apple/Makefile
new file mode 100644
index 000000000000..d502cab93970
--- /dev/null
+++ b/drivers/media/platform/apple/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-y += avd/
diff --git a/drivers/media/platform/apple/avd/Kconfig b/drivers/media/platform/apple/avd/Kconfig
new file mode 100644
index 000000000000..68efa2df368a
--- /dev/null
+++ b/drivers/media/platform/apple/avd/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_APPLE_AVD
+	tristate "Apple Silicon Video Decoding driver"
+	depends on VIDEO_DEV
+	depends on MEDIA_CONTROLLER
+	depends on ARCH_APPLE || COMPILE_TEST
+	depends on OF_ADDRESS
+	depends on V4L_PLATFORM_DRIVERS
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Support for hardware video decoding on Apple Silicon devices using
+	  the Apple Video Decoder (AVD).
+	  To compile this driver as a module, choose M here: the module will
+	  be called apple-avd.
diff --git a/drivers/media/platform/apple/avd/Makefile b/drivers/media/platform/apple/avd/Makefile
new file mode 100644
index 000000000000..b2f6736a790e
--- /dev/null
+++ b/drivers/media/platform/apple/avd/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+apple-avd-y := avd-drv.o avd-v4l2.o
+obj-$(CONFIG_VIDEO_APPLE_AVD) += apple-avd.o
diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/platform/apple/avd/avd-drv.c
new file mode 100644
index 000000000000..ddbf18cd3329
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-drv.c
@@ -0,0 +1,782 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Video Decoder driver
+ *
+ * Copyright (C) 2026 The Asahi Linux Contributors
+ * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
+ *
+ * Based on rkvdec driver by Collabora, Ltd.
+ * Copyright (C) 2019 Collabora, Ltd.
+ * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
+ * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd.
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/iommu.h>
+#include <linux/reset.h>
+#include <linux/dev_printk.h>
+#include <linux/iopoll.h>
+
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "avd.h"
+#include "avd-inst.h"
+
+static void calc_tile_meta(u32 w, u32 h, u32 bpb, u32 tile_dim,
+			   u32 meta_hdr_bytes, u32 *tile, u32 *meta)
+{
+	u32 tiles_width, tiles_height, meta_tile_w, meta_tile_h, tile_bytes;
+
+	tiles_width = DIV_ROUND_UP(w, tile_dim);
+	tiles_height = DIV_ROUND_UP(h, tile_dim);
+	tile_bytes = DIV_ROUND_UP(tile_dim * tile_dim * bpb, 8);
+	*tile = ALIGN(tiles_width * tiles_height * tile_bytes, 16);
+
+	meta_tile_w = roundup_pow_of_two(tiles_width);
+	meta_tile_h = roundup_pow_of_two(tiles_height);
+
+	*meta = ALIGN(meta_tile_w * meta_tile_h * meta_hdr_bytes, 16);
+}
+
+static inline u8 v4l2_format_info_bpp(const struct v4l2_format_info *info,
+				      int plane)
+{
+	return 8 * info->bpp[plane] / info->bpp_div[plane];
+}
+
+void fill_comp(struct avd_comp *comp, enum avd_image_fmt fmt, u32 width,
+	       u32 height)
+{
+	u32 y_meta, y, uv_meta, uv, fourcc;
+	const struct v4l2_format_info *info;
+
+	switch (fmt) {
+	case AVD_IMG_FMT_420_8BIT:
+		fourcc = V4L2_PIX_FMT_APPLE_AX12;
+		break;
+	case AVD_IMG_FMT_420_10BIT:
+		fourcc = V4L2_PIX_FMT_APPLE_AX03;
+		break;
+	case AVD_IMG_FMT_422_8BIT:
+		fourcc = V4L2_PIX_FMT_APPLE_AX16;
+		break;
+	case AVD_IMG_FMT_ANY: /* use the largest one */
+	case AVD_IMG_FMT_422_10BIT:
+		fourcc = V4L2_PIX_FMT_APPLE_AX23;
+		break;
+	}
+	info = v4l2_format_info(fourcc);
+
+	/* y has 32x32 tiles and 32 bytes of metadata per tile */
+	calc_tile_meta(width, height, v4l2_format_info_bpp(info, 0), 32, 32,
+		       &y, &y_meta);
+	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
+	calc_tile_meta(width / info->vdiv, height / info->hdiv,
+		       v4l2_format_info_bpp(info, 1), 16, 8, &uv,
+		       &uv_meta);
+
+	/* output like DCP/AGX expect */
+	comp->offsets[0] = y;
+	comp->offsets[1] = 0;
+	comp->offsets[2] = y + y_meta + uv;
+	comp->offsets[3] = y + y_meta;
+
+	comp->size = y_meta + y + uv_meta + uv;
+}
+
+int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size)
+{
+	if (buf->cpu && size < buf->size)
+		return 0;
+	else if (buf->cpu)
+		avd_buf_free(avd, buf);
+
+	if (size <= 0)
+		return -ENOMEM;
+
+	buf->size = size;
+	buf->cpu =
+		dma_alloc_coherent(avd->dev, buf->size, &buf->addr, GFP_KERNEL);
+	return buf->cpu ? 0 : -ENOMEM;
+}
+
+void avd_buf_free(struct avd_dev *avd, struct avd_buf *buf)
+{
+	if (buf->cpu)
+		dma_free_coherent(avd->dev, buf->size, buf->cpu, buf->addr);
+	memset(buf, 0, sizeof(*buf));
+}
+
+struct avd_decoded_buffer *
+avd_get_ref_buf(struct avd_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
+	struct vb2_buffer *buf;
+
+	/*
+	 * If a ref is unused or invalid, address of current destination
+	 * buffer is returned.
+	 */
+	buf = vb2_find_buffer(cap_q, timestamp);
+	if (!buf)
+		buf = &dst->vb2_buf;
+
+	return vb2_to_avd_decoded_buf(buf);
+}
+
+int avd_end_segment(struct avd_ctx *ctx, bool update_submit)
+{
+	struct avd_job *job = &ctx->job;
+	struct avd_segment *seg = &job->segments[job->num];
+
+	/* avd_segment includes piodma_cmd which is not transferred */
+	seg->piodma_cmd =
+		AVD_PIODMA_CMD_SIZE((sizeof(struct avd_segment) - 8) / 4);
+	seg->piodma_cmd |= AVD_PIODMA_CMD_DEST(job->dest);
+	seg->piodma_cmd |= AVD_PIODMA_CMD_CONST;
+
+	job->num++;
+	if (update_submit)
+		job->num_submit++;
+	return job->num >= job->num_alloc;
+}
+
+int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segments)
+{
+	int ret = 0;
+	struct avd_job *job = &ctx->job;
+
+	job->codec = codec;
+	job->dest = 0x1000;
+	job->num = 0;
+	job->num_submit = 0;
+	job->num_alloc = segments;
+	ret = avd_buf_alloc(ctx->dev, &job->buf,
+			    job->num_alloc * sizeof(*job->segments));
+	if (ret)
+		return ret;
+
+	job->segments = job->buf.cpu;
+	memset(job->buf.cpu, 0, job->buf.size);
+	return 0;
+}
+
+struct avd_cm3_job {
+	enum avd_codec codec;
+	u32 dest;
+	u32 num;
+	u32 num_submit;
+	u64 iova;
+	u64 insn;
+};
+
+int avd_submit_job(struct avd_ctx *ctx)
+{
+	struct avd_dev *avd = ctx->dev;
+	struct avd_job *job = &ctx->job;
+	int submit_off = 0x100;
+	struct avd_cm3_job submit = (struct avd_cm3_job) {
+		.codec = job->codec,
+		.dest = job->dest,
+		.num = job->num,
+		.num_submit = job->num_submit,
+		.iova = job->buf.addr,
+		.insn = ctx->inst.addr,
+	};
+
+	schedule_delayed_work(&ctx->watchdog_work, msecs_to_jiffies(2000));
+	memcpy_toio(avd->sram + submit_off, &submit, sizeof(submit));
+	writel(submit_off, avd->mbox + AVD_REG_MBOX1_SUBMIT);
+
+	return 0;
+}
+
+static int avd_boot(struct avd_dev *avd)
+{
+	u32 val;
+	int ret;
+	char version[64];
+
+	if (avd->variant->revision != 3)
+		dev_info_once(avd->dev, "booting hw version: %04x",
+			      readl_relaxed(avd->ctrl));
+
+	writel(avd->sram_start, avd->piodma + 0x24);
+	dev_info_once(avd->dev, "piodma version: %04x base: %08x",
+		      readl_relaxed(avd->piodma + 0xb4),
+		      readl_relaxed(avd->piodma + 0x24));
+
+	memcpy_toio(avd->code, avd->fw->data, avd->fw->size);
+
+	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX1_STATUS);
+	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX0_STATUS);
+	writel_relaxed(AVD_MBOX0_NOT_EMPTY,
+		       avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
+	writel_relaxed(AVD_RUN_CTRL_UNK_RUN, avd->mbox + AVD_REG_RUN_CTRL);
+
+	/* wait for cm3 to boot */
+	ret = readl_poll_timeout(avd->mbox + AVD_REG_FLAG0_SET, val, val == 1,
+				 10, 10000);
+	if (ret)
+		return ret;
+
+	memcpy_fromio(version, avd->sram, sizeof(version));
+	dev_info_once(avd->dev, "fw version: %s\n", version);
+
+	return 0;
+}
+
+static void avd_shutdown(struct avd_dev *avd)
+{
+	writel_relaxed(AVD_RUN_CTRL_UNK_STOP, avd->mbox + AVD_REG_RUN_CTRL);
+	writel_relaxed(1, avd->mbox + AVD_REG_FLAG0_CLR);
+	writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
+}
+
+static int avd_reset(struct avd_dev *avd)
+{
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(avd->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = reset_control_reset(avd->rstc);
+	if (ret)
+		dev_err(avd->dev, "reset: failed: %d", ret);
+
+	iommu_attach_device(avd->empty_domain, avd->dev);
+	iommu_detach_device(avd->empty_domain, avd->dev);
+
+	ret = avd_boot(avd);
+	if (ret)
+		dev_err(avd->dev, "reset: failed to boot");
+
+	pm_runtime_put_autosuspend(avd->dev);
+
+	return ret;
+}
+
+static void avd_watchdog_func(struct work_struct *work)
+{
+	struct avd_dev *avd;
+	struct avd_ctx *ctx;
+	int ret;
+
+	ctx = container_of(to_delayed_work(work), struct avd_ctx,
+			   watchdog_work);
+	if (!ctx)
+		return;
+
+	avd = ctx->dev;
+
+	dev_err(avd->dev, "Frame processing timed out!");
+
+	writel(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
+	ret = avd_reset(avd);
+	if (ret)
+		dev_err(avd->dev, "failed to reset: %d", ret);
+
+	avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
+}
+
+static irqreturn_t avd_irq_handler(int irq, void *data)
+{
+	struct avd_dev *avd = data;
+	struct avd_ctx *ctx = v4l2_m2m_get_curr_priv(avd->m2m_dev);
+	enum vb2_buffer_state state;
+	u32 status;
+
+	status = readl(avd->mbox + AVD_REG_MBOX0_RETRIEVE);
+	writel(AVD_MBOX0_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
+
+	if (status & 0x10000) { /* dbg */
+		dev_warn(avd->dev, "no handler for IRQ: %3d",
+			 status & ~0x10000);
+		writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
+		return IRQ_HANDLED;
+	}
+
+	if (!ctx)
+		return IRQ_HANDLED;
+
+	if (status & 0x1000) {
+		state = VB2_BUF_STATE_DONE;
+	} else {
+		dev_err(avd->dev, "error: fw says: %x", status);
+		/* let watchdog handle */
+		goto done;
+	}
+
+	/* if the watchdog_work has run the work has already been submitted */
+	if (cancel_delayed_work(&ctx->watchdog_work))
+		avd_job_finish(ctx, state);
+
+done:
+	return IRQ_HANDLED;
+}
+
+static void avd_device_run(void *priv)
+{
+	struct avd_ctx *ctx = priv;
+	struct avd_dev *avd = ctx->dev;
+	const struct avd_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	int ret;
+
+	if (WARN_ON(!desc))
+		return;
+
+	ret = pm_runtime_resume_and_get(avd->dev);
+	if (ret < 0) {
+		avd_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	ret = desc->ops->run(ctx);
+	if (ret)
+		avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
+}
+
+static int avd_queue_init(void *priv, struct vb2_queue *src_vq,
+			  struct vb2_queue *dst_vq)
+{
+	struct avd_ctx *ctx = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->ops = &avd_queue_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+
+	src_vq->dma_attrs = 0;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &ctx->dev->vdev_lock;
+	src_vq->dev = ctx->dev->v4l2_dev.dev;
+	src_vq->supports_requests = true;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->bidirectional = true;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->dma_attrs = 0;
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->ops = &avd_queue_ops;
+	dst_vq->buf_struct_size = sizeof(struct avd_decoded_buffer);
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &ctx->dev->vdev_lock;
+	dst_vq->dev = ctx->dev->v4l2_dev.dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int avd_open(struct file *filp)
+{
+	struct avd_dev *avd = video_drvdata(filp);
+	struct avd_ctx *ctx;
+	int ret;
+
+	ctx = kzalloc_obj(*ctx, GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = avd;
+
+	ret = avd_buf_alloc(avd, &ctx->inst, AVD_FIFO_SIZE);
+	if (ret)
+		goto err_free_ctx;
+
+	ret = avd_buf_alloc(avd, &ctx->pipe_state, 512);
+	if (ret)
+		goto err_free_ctx;
+
+	INIT_DELAYED_WORK(&ctx->watchdog_work, avd_watchdog_func);
+
+	avd_reset_coded_fmt(ctx);
+	avd_reset_decoded_fmt(ctx);
+
+	v4l2_fh_init(&ctx->fh, video_devdata(filp));
+
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(avd->m2m_dev, ctx, avd_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		goto err_free_ctx;
+	}
+
+	ret = avd_init_ctrls(ctx);
+	if (ret)
+		goto err_cleanup_m2m_ctx;
+
+	v4l2_fh_add(&ctx->fh, filp);
+
+	return 0;
+
+err_cleanup_m2m_ctx:
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+
+err_free_ctx:
+	avd_buf_free(avd, &ctx->pipe_state);
+	avd_buf_free(avd, &ctx->inst);
+	kfree(ctx);
+	return ret;
+}
+
+static int avd_release(struct file *filp)
+{
+	struct avd_ctx *ctx = file_to_ctx(filp);
+
+
+	v4l2_fh_del(&ctx->fh, filp);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	cancel_delayed_work_sync(&ctx->watchdog_work);
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+	v4l2_fh_exit(&ctx->fh);
+	avd_buf_free(ctx->dev, &ctx->inst);
+	avd_buf_free(ctx->dev, &ctx->pipe_state);
+	avd_buf_free(ctx->dev, &ctx->job.buf);
+	kfree(ctx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations avd_fops = {
+	.owner = THIS_MODULE,
+	.open = avd_open,
+	.release = avd_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static const struct v4l2_m2m_ops avd_m2m_ops = {
+	.device_run = avd_device_run,
+};
+
+static const struct media_device_ops avd_media_ops = {
+	.req_validate = vb2_request_validate,
+	.req_queue = v4l2_m2m_request_queue,
+};
+
+static int avd_v4l2_init(struct avd_dev *avd)
+{
+	int ret;
+
+	ret = v4l2_device_register(avd->dev, &avd->v4l2_dev);
+	if (ret) {
+		dev_err(avd->dev, "Failed to register V4L2 device\n");
+		return ret;
+	}
+
+	avd->m2m_dev = v4l2_m2m_init(&avd_m2m_ops);
+	if (IS_ERR(avd->m2m_dev)) {
+		v4l2_err(&avd->v4l2_dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(avd->m2m_dev);
+		goto err_unregister_v4l2;
+	}
+
+	avd->mdev.dev = avd->dev;
+	strscpy(avd->mdev.model, "avd", sizeof(avd->mdev.model));
+	strscpy(avd->mdev.bus_info, "platform:avd", sizeof(avd->mdev.bus_info));
+	media_device_init(&avd->mdev);
+	avd->mdev.ops = &avd_media_ops;
+	avd->v4l2_dev.mdev = &avd->mdev;
+
+	avd->vdev.lock = &avd->vdev_lock;
+	avd->vdev.v4l2_dev = &avd->v4l2_dev;
+	avd->vdev.fops = &avd_fops;
+	avd->vdev.release = video_device_release_empty;
+	avd->vdev.vfl_dir = VFL_DIR_M2M;
+	avd->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
+	avd->vdev.ioctl_ops = &avd_ioctl_ops;
+	video_set_drvdata(&avd->vdev, avd);
+	strscpy(avd->vdev.name, "avd", sizeof(avd->vdev.name));
+
+	ret = video_register_device(&avd->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		v4l2_err(&avd->v4l2_dev, "Failed to register video device\n");
+		goto err_cleanup_mc;
+	}
+
+	ret = v4l2_m2m_register_media_controller(avd->m2m_dev, &avd->vdev,
+						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
+	if (ret) {
+		v4l2_err(&avd->v4l2_dev,
+			 "Failed to initialize V4L2 M2M media controller\n");
+		goto err_unregister_vdev;
+	}
+
+	ret = media_device_register(&avd->mdev);
+	if (ret) {
+		v4l2_err(&avd->v4l2_dev, "Failed to register media device\n");
+		goto err_unregister_mc;
+	}
+
+	return 0;
+
+err_unregister_mc:
+	v4l2_m2m_unregister_media_controller(avd->m2m_dev);
+
+err_unregister_vdev:
+	video_unregister_device(&avd->vdev);
+
+err_cleanup_mc:
+	media_device_cleanup(&avd->mdev);
+	v4l2_m2m_release(avd->m2m_dev);
+
+err_unregister_v4l2:
+	v4l2_device_unregister(&avd->v4l2_dev);
+	return ret;
+}
+
+static void avd_v4l2_cleanup(struct avd_dev *avd)
+{
+	media_device_unregister(&avd->mdev);
+	v4l2_m2m_unregister_media_controller(avd->m2m_dev);
+	video_unregister_device(&avd->vdev);
+	media_device_cleanup(&avd->mdev);
+	v4l2_m2m_release(avd->m2m_dev);
+	v4l2_device_unregister(&avd->v4l2_dev);
+}
+
+static const struct avd_variant avd_t8103_variant = {
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.fw_name = "apple/avd-fw-v2-t0.bin",
+	.revision = 3,
+	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
+};
+
+static const struct avd_variant avd_t6000_variant = {
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.fw_name = "apple/avd-fw-v3-t0.bin",
+	.revision = 4,
+	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
+};
+
+static const struct avd_variant avd_t8112_variant = {
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.fw_name = "apple/avd-fw-v3-t1.bin",
+	.revision = 4,
+	.quirks = AVD_QUIRK_LSR,
+};
+
+static const struct avd_variant avd_t6020_variant = {
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.fw_name = "apple/avd-fw-v3-t2.bin",
+	.revision = 4,
+};
+
+static const struct avd_variant avd_t8122_variant = {
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9 |
+			AVD_CAPABILITY_AV1,
+	.fw_name = "apple/avd-fw-v4-t0.bin",
+	.revision = 4,
+};
+
+static const struct avd_variant avd_t8140_variant = {
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9 |
+			AVD_CAPABILITY_AV1,
+	.fw_name = "apple/avd-fw-v5-t0.bin",
+	.revision = 4,
+};
+
+static const struct avd_variant avd_t8132_variant = {
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9 |
+			AVD_CAPABILITY_AV1,
+	.fw_name = "apple/avd-fw-v5-t1.bin",
+	.revision = 4,
+};
+
+/* can also be derived from a version register */
+static const struct of_device_id avd_of_match[] = {
+	{ .compatible = "apple,t8103-avd", .data = &avd_t8103_variant },
+	{ .compatible = "apple,t6000-avd", .data = &avd_t6000_variant },
+	{ .compatible = "apple,t8112-avd", .data = &avd_t8112_variant },
+	{ .compatible = "apple,t6020-avd", .data = &avd_t6020_variant },
+	{ .compatible = "apple,t8122-avd", .data = &avd_t8122_variant },
+	{ .compatible = "apple,t8132-avd", .data = &avd_t8132_variant },
+	{ .compatible = "apple,t8140-avd", .data = &avd_t8140_variant },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, avd_of_match);
+
+static int avd_probe(struct platform_device *pdev)
+{
+	struct avd_dev *avd;
+	int ret, irq;
+
+	avd = devm_kzalloc(&pdev->dev, sizeof(*avd), GFP_KERNEL);
+	if (!avd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, avd);
+	avd->dev = &pdev->dev;
+	avd->pdev = pdev;
+
+	mutex_init(&avd->vdev_lock);
+
+	avd->variant = of_device_get_match_data(&pdev->dev);
+
+	avd->rstc = devm_reset_control_get_exclusive(avd->dev, NULL);
+
+	if (IS_ERR(avd->rstc))
+		return PTR_ERR(avd->rstc);
+
+	avd->piodma = devm_platform_ioremap_resource_byname(pdev, "piodma");
+	if (IS_ERR(avd->piodma))
+		return PTR_ERR(avd->piodma);
+
+	avd->code = devm_platform_ioremap_resource_byname(pdev, "code");
+	if (IS_ERR(avd->code))
+		return PTR_ERR(avd->code);
+
+	avd->sram = devm_platform_ioremap_resource_byname(pdev, "sram");
+	if (IS_ERR(avd->sram))
+		return PTR_ERR(avd->sram);
+
+	avd->mbox = devm_platform_ioremap_resource_byname(pdev, "mbox");
+	if (IS_ERR(avd->mbox))
+		return PTR_ERR(avd->mbox);
+
+	avd->ctrl = devm_platform_ioremap_resource_byname(pdev, "ctrl");
+	if (IS_ERR(avd->ctrl))
+		return PTR_ERR(avd->ctrl);
+
+	avd->sram_start = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						       "sram")->start >> 4;
+
+	ret = dma_set_mask_and_coherent(avd->dev,
+					DMA_BIT_MASK((avd->variant->quirks &
+						     AVD_QUIRK_LSR) ? 38 : 64));
+	if (ret) {
+		dev_err(avd->dev, "Failed to set DMA mask");
+		return ret;
+	}
+
+	irq = platform_get_irq_byname(pdev, "mbox0");
+	if (irq < 0)
+		return irq;
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, avd_irq_handler,
+					IRQF_ONESHOT, dev_name(&pdev->dev),
+					avd);
+	if (ret) {
+		dev_err(avd->dev, "Could not request IRQ 0");
+		return ret;
+	}
+
+	avd->domain = iommu_get_domain_for_dev(avd->dev);
+	if (!avd->domain)
+		return -EINVAL;
+
+	avd->empty_domain = iommu_paging_domain_alloc(avd->dev);
+	if (IS_ERR(avd->empty_domain)) {
+		dev_err(avd->dev, "cannot alloc new empty domain");
+		return PTR_ERR(avd->empty_domain);
+	}
+
+	ret = request_firmware(&avd->fw, avd->variant->fw_name, avd->dev);
+	if (ret) {
+		dev_err(avd->dev, "failed to load firmware: %d", ret);
+		iommu_domain_free(avd->empty_domain);
+		return ret;
+	}
+
+	pm_runtime_set_autosuspend_delay(avd->dev, 100);
+	pm_runtime_use_autosuspend(avd->dev);
+	pm_runtime_enable(avd->dev);
+
+	ret = avd_v4l2_init(avd);
+	if (ret)
+		goto err_disable_runtime_pm;
+
+	return 0;
+
+err_disable_runtime_pm:
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	release_firmware(avd->fw);
+	iommu_domain_free(avd->empty_domain);
+	return ret;
+}
+
+static void avd_remove(struct platform_device *pdev)
+{
+	struct avd_dev *avd = platform_get_drvdata(pdev);
+
+	avd_v4l2_cleanup(avd);
+
+	iommu_domain_free(avd->empty_domain);
+
+	release_firmware(avd->fw);
+
+	pm_runtime_disable(avd->dev);
+	pm_runtime_dont_use_autosuspend(avd->dev);
+}
+
+static __maybe_unused int avd_runtime_resume(struct device *dev)
+{
+	int ret;
+	struct avd_dev *avd = platform_get_drvdata(to_platform_device(dev));
+
+	ret = avd_boot(avd);
+	if (ret)
+		dev_err(dev, "failed to boot");
+	return ret;
+}
+
+static __maybe_unused int avd_runtime_suspend(struct device *dev)
+{
+	struct avd_dev *avd = platform_get_drvdata(to_platform_device(dev));
+
+	avd_shutdown(avd);
+	return 0;
+}
+
+static const struct dev_pm_ops avd_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(avd_runtime_suspend, avd_runtime_resume, NULL)
+};
+
+static struct platform_driver avd_driver = {
+	.probe = avd_probe,
+	.remove = avd_remove,
+	.driver = {
+		.name = "avd",
+		.of_match_table = avd_of_match,
+		.pm = pm_ptr(&avd_pm_ops),
+	},
+};
+module_platform_driver(avd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Apple Video Decoder driver");
+MODULE_FIRMWARE("apple/avd-fw-v2-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v3-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v3-t1.bin");
+MODULE_FIRMWARE("apple/avd-fw-v3-t2.bin");
+MODULE_FIRMWARE("apple/avd-fw-v4-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v5-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v5-t1.bin");
diff --git a/drivers/media/platform/apple/avd/avd-inst.h b/drivers/media/platform/apple/avd/avd-inst.h
new file mode 100644
index 000000000000..baa783d00f18
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-inst.h
@@ -0,0 +1,210 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Apple Video Decoder instruction stream definitions
+ *
+ * Copyright (C) 2026 The Asahi Linux Contributors
+ * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
+ * Copyright (C) 2023 Eileen Yoon <eyn@gmx.com>
+ *
+ * The AVD block consists of one to four processors for each codecs
+ * called "VP". Its the VP's job to prepare codecs specifik syntax into
+ * something the shared processor(s?) (called PP, Pipeline?) understands. PP
+ * implements different DSP routines: QT, IPMC, LF, MV, TP, PC, SW, LR.
+ *
+ * When VP processes a u32, if the value has the two upper bits set and unset
+ * respectively, it will execute the opcode function stored in the next 8
+ * bits.
+ *
+ * Please refer to
+ * https://web.archive.org/web/20240105073842/https://eiln.net/avd-notes2.html
+ * for an excellent write-up by Eileen.
+ */
+
+#ifndef AVD_INST_H_
+#define AVD_INST_H_
+
+#include <linux/types.h>
+#include <linux/bitfield.h>
+
+#include "avd.h"
+
+#define AVD_OP_HDR			FIELD_PREP(GENMASK(31, 20), 0x2db)
+#define AVD_OP_HDR_CONST		FIELD_PREP(GENMASK(10, 0), 0x2e0)
+
+/*
+ * output in packed PX30
+ * 10 bits per component. With groups of tree packed into 4 bytes (little
+ * endian order)
+ *  P  3  2  1
+ * [2:10:10:10]
+ *
+ * additionally, av1 and vp9 need an extra scratch buffer if this is set
+ */
+#define AVD_OP_HDR_FLAG_PACKED(v)	FIELD_PREP(BIT(10), !!(v))
+/* decompress pixel data */
+#define AVD_OP_HDR_FLAG_DECOMP(v)	FIELD_PREP(BIT(12), !!(v))
+#define AVD_OP_HDR_FLAG_INTRA(v)	FIELD_PREP(BIT(13), !!(v))
+#define AVD_OP_HDR_FLAG_PIPE_STATE(v)	FIELD_PREP(BIT(19), !!(v))
+
+#define AVD_OP_WEIGHTS_HDR		FIELD_PREP(GENMASK(31, 20), 0x2dd)
+#define AVD_OP_WEIGHTS_HDR_CHROMA(v)	FIELD_PREP(GENMASK(2, 0), v)
+#define AVD_OP_WEIGHTS_HDR_LUMA(v)	FIELD_PREP(GENMASK(5, 3), v)
+#define AVD_OP_WEIGHTS_HDR_FLAG0(v)	FIELD_PREP(BIT(6), !!(v))
+#define AVD_OP_WEIGHTS_HDR_FLAG1(v)	FIELD_PREP(BIT(7), !!(v))
+
+#define AVD_OP_WEIGHTS			FIELD_PREP(GENMASK(31, 20), 0x2de)
+#define AVD_OP_WEIGHTS_WEIGHT(v)	FIELD_PREP(GENMASK(8, 0), v)
+#define AVD_OP_WEIGHTS_INDEX(v)		FIELD_PREP(GENMASK(12, 9), v)
+#define AVD_OP_WEIGHTS_LIST_IDX(v)	FIELD_PREP(BIT(13), v)
+/* 1 = luma, 2,3 = chroma[{0,1}] */
+#define AVD_OP_WEIGHTS_IDENT(v)		FIELD_PREP(GENMASK(16, 14), v)
+
+#define AVD_OP_OFFSETS			FIELD_PREP(GENMASK(31, 20), 0x2df)
+#define AVD_OP_OFFSETS_OFFSET(v)	FIELD_PREP(GENMASK(15, 0), v)
+
+#define AVD_OP_CODED_DATA		FIELD_PREP(GENMASK(31, 20), 0x2d8)
+#define AVD_OP_CODED_IN_HI(v)		FIELD_PREP(GENMASK(12, 0), (u64)(v) >> 32)
+#define AVD_OP_CODED_IN_LO(v)		((u32)(v) & 0xffffffff)
+#define AVD_OP_CODED_DATA_FLAG0(v)	FIELD_PREP(BIT(13), !!(v))
+#define AVD_OP_CODED_DATA_FLAG1(v)	FIELD_PREP(BIT(14), !!(v))
+#define AVD_OP_CODED_DATA_BIT_OFF(v)	FIELD_PREP(GENMASK(18, 15), v)
+
+#define AVD_OP_SL_LOC			FIELD_PREP(GENMASK(31, 24), 0x2c)
+#define AVD_OP_SL_LOC_X(v)		FIELD_PREP(GENMASK(11, 0), v)
+#define AVD_OP_SL_LOC_Y(v)		FIELD_PREP(GENMASK(23, 12), v)
+
+#define AVD_OP_SL_DIM_START		FIELD_PREP(GENMASK(31, 24), 0x2a)
+#define AVD_OP_SL_DIM_START_X(v)	FIELD_PREP(GENMASK(11, 0), v)
+#define AVD_OP_SL_DIM_START_Y(v)	FIELD_PREP(GENMASK(23, 12), v)
+
+/* end is not an op */
+#define AVD_SL_DIM_END_X(v)		FIELD_PREP(GENMASK(11, 0), v)
+#define AVD_SL_DIM_END_Y(v)		FIELD_PREP(GENMASK(23, 12), v)
+#define AVD_SL_DIM_END_COL(v)		FIELD_PREP(GENMASK(27, 24), v)
+#define AVD_SL_DIM_END_ROW(v)		FIELD_PREP(GENMASK(31, 28), v)
+
+#define AVD_OP_SL_REF			FIELD_PREP(GENMASK(31, 24), 0x2d)
+#define AVD_OP_SL_REF_MAX_MERGE(v)	FIELD_PREP(GENMASK(3, 1), v)
+
+#define AVD_OP_SL_REF_FLAG0(v)		FIELD_PREP(BIT(4), !!(v))
+#define AVD_OP_SL_REF_FLAG_CABAC(v)	FIELD_PREP(BIT(5), !!(v))
+#define AVD_OP_SL_REF_FLAG1(v)		FIELD_PREP(BIT(6), !!(v))
+#define AVD_OP_SL_REF_NUM_L0(v)		FIELD_PREP(GENMASK(14, 11), v)
+#define AVD_OP_SL_REF_NUM_L1(v)		FIELD_PREP(GENMASK(10, 7), v)
+#define AVD_OP_SL_REF_FLAG2(v)		FIELD_PREP(BIT(15), !!(v))
+#define AVD_OP_SL_REF_SLICE_P(v)	FIELD_PREP(BIT(16), !!(v))
+#define AVD_OP_SL_REF_SLICE_I(v)	FIELD_PREP(BIT(17), !!(v))
+/* not really kinda more like has_ref_and_ref_is_valid_ref */
+#define AVD_OP_SL_REF_SLICE_B(v)	FIELD_PREP(BIT(18), !!(v))
+
+#define AVD_OP_QP			FIELD_PREP(GENMASK(31, 20), 0x2d9)
+#define AVD_OP_QP_CR_OFF(v)		FIELD_PREP(GENMASK(4, 0), v)
+#define AVD_OP_QP_CB_OFF(v)		FIELD_PREP(GENMASK(9, 5), v)
+#define AVD_OP_QP_VAL(v)		FIELD_PREP(GENMASK(16, 10), v)
+
+#define AVD_OP_DBLK			FIELD_PREP(GENMASK(31, 20), 0x2da)
+#define AVD_OP_DBLK_FLAG_SAO_CHROMA(v)	FIELD_PREP(BIT(6), !!(v))
+#define AVD_OP_DBLK_FLAG_SAO_LUMA(v)	FIELD_PREP(BIT(7), !!(v))
+#define AVD_OP_DBLK_OFF0(v)		FIELD_PREP(GENMASK(11, 8), v)
+#define AVD_OP_DBLK_OFF1(v)		FIELD_PREP(GENMASK(15, 12), v)
+#define AVD_OP_DBLK_FLAG_EN(v)		FIELD_PREP(BIT(16), !!(v))
+#define AVD_OP_DBLK_FLAG_FULL_EN(v)	FIELD_PREP(BIT(17), !!(v))
+#define AVD_OP_DBLK_FLAG_TILES_EN(v)	FIELD_PREP(BIT(18), !!(v))
+#define AVD_OP_DBLK_FLAG_PCM_EN(v)	FIELD_PREP(BIT(19), !!(v))
+
+#define AVD_OP_REF			FIELD_PREP(GENMASK(31, 20), 0x2dc)
+/* same order as they where submitted */
+#define AVD_OP_REF_DBP_IDX(v)		FIELD_PREP(GENMASK(3, 0), v)
+#define AVD_OP_REF_LOOP_IDX(v)		FIELD_PREP(GENMASK(7, 4), v)
+#define AVD_OP_REF_LIST_IDX(v)		FIELD_PREP(GENMASK(11, 8), v)
+
+#define AVD_HDR_CODEC_MODE(v)		FIELD_PREP(GENMASK(28, 24), v)
+#define AVD_HDR_WIDTH(v)		FIELD_PREP(GENMASK(15, 0), v)
+#define AVD_HDR_HEIGHT(v)		FIELD_PREP(GENMASK(31, 16), v)
+
+#define AVD_HDR_FEAT_H264		FIELD_PREP(GENMASK(3, 0), 10)
+#define AVD_HDR_FEAT_PIPE_STATE_EN(v)	FIELD_PREP(GENMASK(7, 4), (v) ? 3 : 0)
+#define AVD_HDR_FEAT_H26X		FIELD_PREP(BIT(20), 1)
+#define AVD_HDR_FEAT_COMMON		FIELD_PREP(BIT(21), 1)
+#define AVD_HDR_FEAT_VP9		FIELD_PREP(BIT(17), 1)
+
+#define AVD_HDR_COMMON_FLAG0(v)		FIELD_PREP(BIT(0), !!(v))
+#define AVD_HDR_COMMON_LUMA_TBS(v)	FIELD_PREP(GENMASK(8, 7), v)
+#define AVD_HDR_COMMON_MIN_LUMA_TBS(v)	FIELD_PREP(GENMASK(10, 9), v)
+#define AVD_HDR_COMMON_LUMA_CBS(v)	FIELD_PREP(GENMASK(12, 11), v)
+#define AVD_HDR_COMMON_MIN_LUMA_CBS(v)	FIELD_PREP(GENMASK(14, 13), v)
+#define AVD_HDR_COMMON_BIT_DEPTH_L(v)	FIELD_PREP(GENMASK(18, 15), v)
+#define AVD_HDR_COMMON_BIT_DEPTH_C(v)	FIELD_PREP(GENMASK(23, 19), v)
+#define AVD_HDR_COMMON_CHROMA_FORMAT(v)	FIELD_PREP(GENMASK(26, 24), v)
+
+#define AVD_HDR_H26X_QP_OFFSET_CR(v)	FIELD_PREP(GENMASK(4, 0), v)
+#define AVD_HDR_H26X_QP_OFFSET_CB(v)	FIELD_PREP(GENMASK(9, 5), v)
+
+#define AVD_SCALING_I0(v)		FIELD_PREP(GENMASK(7, 0), v)
+#define AVD_SCALING_I1(v)		FIELD_PREP(GENMASK(15, 8), v)
+#define AVD_SCALING_I2(v)		FIELD_PREP(GENMASK(23, 16), v)
+#define AVD_SCALING_I3(v)		FIELD_PREP(GENMASK(31, 24), v)
+
+#define AVD_REF_NUM(v)			FIELD_PREP(GENMASK(31, 28), v)
+#define AVD_REF_FLAG_CONST		FIELD_PREP(BIT(24), 1)
+#define AVD_REF_FLAG_LONG(v)		FIELD_PREP(BIT(17), !!(v))
+#define AVD_REF_DELTA_POC(v)		FIELD_PREP(GENMASK(16, 0), v)
+
+#define AVD_FIFO_SIZE			(0x100000 * 12)
+
+static inline void push(struct avd_ctx *ctx, u32 inst)
+{
+	struct avd_job *job = &ctx->job;
+	struct avd_segment *seg = &job->segments[job->num];
+
+	seg->instructions[seg->num++] = inst;
+}
+
+static inline void push_address(struct avd_ctx *ctx, dma_addr_t addr)
+{
+	if (ctx->dev->variant->quirks & AVD_QUIRK_LSR) {
+		push(ctx, addr >> 8);
+	} else {
+		push(ctx, (u32)(addr & 0xffffffff));
+		push(ctx, (u32)((u64)addr >> 32));
+	}
+}
+
+static inline void push_comp(struct avd_ctx *ctx, dma_addr_t addr,
+			     u32 offsets[4])
+{
+	if (ctx->dev->variant->quirks & AVD_QUIRK_LSR) {
+		for (int i = 0; i < 4; i++)
+			push(ctx, (addr + offsets[i]) >> 7);
+	} else {
+		for (int i = 0; i < 4; i++)
+			push_address(ctx, (addr + offsets[i]));
+	}
+}
+
+#ifdef DEBUG_INST
+#define push(inst, name)                                           \
+	do {                                                       \
+		dev_info(ctx->dev->dev, "%8x | %s", (inst), name); \
+		push(ctx, inst);                                   \
+	} while (0)
+
+#else
+#define push(inst, name) push(ctx, inst)
+#endif
+
+#ifdef DEBUG_INST_ADDR
+#define pusha(inst, name, i)                                                   \
+	do {                                                                   \
+		dev_info(ctx->dev->dev, "%8llx | %s[%d]", (inst) & 0xffffffff, \
+			 name, i);                                             \
+		dev_info(ctx->dev->dev, "%8llx | %s[%d] (high)", (inst) >> 32, \
+			 name, i);                                             \
+		push_address(ctx, inst);                                       \
+	} while (0)
+
+#else
+#define pusha(inst, name, i) push_address(ctx, inst)
+#endif
+
+#endif /* AVD_INST_H_ */
diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/platform/apple/avd/avd-v4l2.c
new file mode 100644
index 000000000000..838f6e348a49
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-v4l2.c
@@ -0,0 +1,783 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Video Decoder V4L2 M2M api functions
+ *
+ * Copyright (C) 2026 The Asahi Linux Contributors
+ * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
+ *
+ * Based on rkvdec driver by Collabora, Ltd.
+ * Copyright (C) 2019 Collabora, Ltd.
+ * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
+ * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd.
+ */
+
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "avd.h"
+
+static const struct avd_decoded_fmt_desc avd_decoded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.image_fmt = AVD_IMG_FMT_420_8BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_P010,
+		.image_fmt = AVD_IMG_FMT_420_10BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.image_fmt = AVD_IMG_FMT_422_8BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_P210,
+		.image_fmt = AVD_IMG_FMT_422_10BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_APPLE_AX12,
+		.image_fmt = AVD_IMG_FMT_420_8BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_APPLE_AX03,
+		.image_fmt = AVD_IMG_FMT_420_10BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_APPLE_AX16,
+		.image_fmt = AVD_IMG_FMT_422_8BIT,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_APPLE_AX23,
+		.image_fmt = AVD_IMG_FMT_422_10BIT,
+	},
+};
+
+static bool is_interchange(u32 fourcc)
+{
+	return fourcc == V4L2_PIX_FMT_APPLE_AX12 ||
+		fourcc == V4L2_PIX_FMT_APPLE_AX16 ||
+		fourcc == V4L2_PIX_FMT_APPLE_AX03 ||
+		fourcc == V4L2_PIX_FMT_APPLE_AX23;
+}
+
+static bool avd_image_fmt_match(enum avd_image_fmt fmt1,
+				enum avd_image_fmt fmt2)
+{
+	return fmt1 == fmt2 || fmt2 == AVD_IMG_FMT_ANY ||
+	       fmt1 == AVD_IMG_FMT_ANY;
+}
+
+static bool avd_image_fmt_changed(struct avd_ctx *ctx,
+				  enum avd_image_fmt image_fmt)
+{
+	if (image_fmt == AVD_IMG_FMT_ANY)
+		return false;
+
+	return ctx->image_fmt != image_fmt;
+}
+
+static u32 avd_enum_decoded_fmt(struct avd_ctx *ctx, int index,
+				enum avd_image_fmt image_fmt)
+{
+	const struct avd_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	int fmt_idx = -1;
+	unsigned int i;
+
+	if (WARN_ON(!desc))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(avd_decoded_fmts); i++) {
+		if (!avd_image_fmt_match(avd_decoded_fmts[i].image_fmt,
+					 image_fmt))
+			continue;
+		fmt_idx++;
+		if (index == fmt_idx)
+			return avd_decoded_fmts[i].fourcc;
+	}
+
+	return 0;
+}
+
+static bool avd_is_valid_fmt(struct avd_ctx *ctx, u32 fourcc,
+			     enum avd_image_fmt image_fmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(avd_decoded_fmts); i++) {
+		if (avd_image_fmt_match(avd_decoded_fmts[i].image_fmt,
+					image_fmt) &&
+		    avd_decoded_fmts[i].fourcc == fourcc)
+			return true;
+	}
+
+	return false;
+}
+
+static void avd_fill_decoded_pixfmt(struct avd_ctx *ctx,
+				    struct v4l2_pix_format_mplane *pix_mp)
+{
+	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
+			    pix_mp->height);
+
+	if (is_interchange(pix_mp->pixelformat))
+		pix_mp->plane_fmt[0].sizeimage = 0;
+	ctx->comp.start_offset = pix_mp->plane_fmt[0].sizeimage;
+
+	fill_comp(&ctx->comp, ctx->image_fmt, pix_mp->width, pix_mp->height);
+	pix_mp->plane_fmt[0].sizeimage += ctx->comp.size;
+
+	if (ctx->coded_fmt_desc->ops->adjust_decoded_fmt)
+		ctx->coded_fmt_desc->ops->adjust_decoded_fmt(ctx, pix_mp);
+
+	pix_mp->plane_fmt[0].sizeimage = ALIGN(pix_mp->plane_fmt[0].sizeimage,
+					       AVD_ALIGN);
+}
+
+static void avd_reset_fmt(struct avd_ctx *ctx, struct v4l2_format *f,
+			  u32 fourcc)
+{
+	memset(f, 0, sizeof(*f));
+	f->fmt.pix_mp.pixelformat = fourcc;
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+void avd_reset_decoded_fmt(struct avd_ctx *ctx)
+{
+	struct v4l2_format *f = &ctx->decoded_fmt;
+	u32 fourcc;
+
+	fourcc = avd_enum_decoded_fmt(ctx, 0, ctx->image_fmt);
+	avd_reset_fmt(ctx, f, fourcc);
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
+	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
+	avd_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
+}
+
+static int avd_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct avd_ctx *ctx =
+		container_of(ctrl->handler, struct avd_ctx, ctrl_hdl);
+	const struct avd_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+
+	if (desc->ops->try_ctrl)
+		return desc->ops->try_ctrl(ctx, ctrl);
+
+	return 0;
+}
+
+static int avd_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct avd_ctx *ctx =
+		container_of(ctrl->handler, struct avd_ctx, ctrl_hdl);
+	const struct avd_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	enum avd_image_fmt image_fmt;
+	struct vb2_queue *vq;
+
+	/* Check if this change requires a capture format reset */
+	if (!desc->ops->get_image_fmt)
+		return 0;
+
+	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
+	if (avd_image_fmt_changed(ctx, image_fmt)) {
+		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (vb2_is_busy(vq))
+			return -EBUSY;
+
+		ctx->image_fmt = image_fmt;
+		avd_reset_decoded_fmt(ctx);
+	}
+
+	return 0;
+}
+
+const struct v4l2_ctrl_ops avd_ctrl_ops = {
+	.try_ctrl = avd_try_ctrl,
+	.s_ctrl = avd_s_ctrl,
+};
+
+static const struct avd_coded_fmt_desc avd_coded_fmts[] = {};
+
+static bool avd_is_capable(struct avd_ctx *ctx, unsigned int capability)
+{
+	return (ctx->dev->variant->capabilities & capability) == capability;
+}
+
+static const struct avd_coded_fmt_desc *
+avd_enum_coded_fmt_desc(struct avd_ctx *ctx, int index)
+{
+	int fmt_idx = -1;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(avd_coded_fmts); i++) {
+		if (!avd_is_capable(ctx, avd_coded_fmts[i].capability))
+			continue;
+		fmt_idx++;
+		if (index == fmt_idx)
+			return &avd_coded_fmts[i];
+	}
+
+	return NULL;
+}
+
+static const struct avd_coded_fmt_desc *
+avd_find_coded_fmt_desc(struct avd_ctx *ctx, u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(avd_coded_fmts); i++) {
+		if (avd_is_capable(ctx, avd_coded_fmts[i].capability) &&
+		    avd_coded_fmts[i].fourcc == fourcc)
+			return &avd_coded_fmts[i];
+	}
+
+	return NULL;
+}
+
+void avd_reset_coded_fmt(struct avd_ctx *ctx)
+{
+	struct v4l2_format *f = &ctx->coded_fmt;
+
+	ctx->coded_fmt_desc = avd_enum_coded_fmt_desc(ctx, 0);
+	avd_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
+
+	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	f->fmt.pix_mp.width = ctx->coded_fmt_desc->frmsize.min_width;
+	f->fmt.pix_mp.height = ctx->coded_fmt_desc->frmsize.min_height;
+
+	f->fmt.pix_mp.num_planes = 1;
+	if (!f->fmt.pix_mp.plane_fmt[0].sizeimage)
+		f->fmt.pix_mp.plane_fmt[0].sizeimage =
+			f->fmt.pix_mp.width * f->fmt.pix_mp.height;
+}
+
+static int avd_enum_framesizes(struct file *file, void *priv,
+			       struct v4l2_frmsizeenum *fsize)
+{
+	struct avd_ctx *ctx = file_to_ctx(file);
+	const struct avd_coded_fmt_desc *desc;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	desc = avd_find_coded_fmt_desc(ctx, fsize->pixel_format);
+	if (!desc)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = desc->frmsize.max_width;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.min_height = 1;
+	fsize->stepwise.max_height = desc->frmsize.max_height;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
+static int avd_querycap(struct file *file, void *priv,
+			struct v4l2_capability *cap)
+{
+	struct avd_dev *avd = video_drvdata(file);
+	struct video_device *vdev = video_devdata(file);
+
+	strscpy(cap->driver, avd->dev->driver->name, sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 avd->dev->driver->name);
+	return 0;
+}
+
+static int avd_try_capture_fmt(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct avd_ctx *ctx = file_to_ctx(file);
+	const struct avd_coded_fmt_desc *coded_desc;
+
+	/*
+	 * The codec context should point to a coded format desc, if the format
+	 * on the coded end has not been set yet, it should point to the
+	 * default value.
+	 */
+	coded_desc = ctx->coded_fmt_desc;
+	if (WARN_ON(!coded_desc)) {
+		dev_err(ctx->dev->dev, "no coded desc!");
+		return -EINVAL;
+	}
+
+	if (!avd_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
+		pix_mp->pixelformat =
+			avd_enum_decoded_fmt(ctx, 0, ctx->image_fmt);
+
+	/* Always apply the frmsize constraint of the coded end. */
+	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
+	pix_mp->height = max(pix_mp->height, ctx->coded_fmt.fmt.pix_mp.height);
+	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
+				       &coded_desc->frmsize);
+
+	avd_fill_decoded_pixfmt(ctx, pix_mp);
+	pix_mp->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int avd_try_output_fmt(struct file *file, void *priv,
+			      struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct avd_ctx *ctx = file_to_ctx(file);
+	const struct avd_coded_fmt_desc *desc;
+
+	desc = avd_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
+	if (!desc) {
+		desc = avd_enum_coded_fmt_desc(ctx, 0);
+		pix_mp->pixelformat = desc->fourcc;
+	}
+
+	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
+				       &desc->frmsize);
+
+	pix_mp->field = V4L2_FIELD_NONE;
+	/* All coded formats are considered single planar for now. */
+	pix_mp->num_planes = 1;
+
+	if (!pix_mp->plane_fmt[0].sizeimage)
+		pix_mp->plane_fmt[0].sizeimage =
+			pix_mp->width * f->fmt.pix_mp.height;
+
+	return 0;
+}
+
+static int avd_s_capture_fmt(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct avd_ctx *ctx = file_to_ctx(file);
+	struct vb2_queue *vq;
+	int ret;
+
+	/* Change not allowed if queue is busy */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	ret = avd_try_capture_fmt(file, priv, f);
+	if (ret)
+		return ret;
+
+	ctx->decoded_fmt = *f;
+	return 0;
+}
+
+static int avd_s_output_fmt(struct file *file, void *priv,
+			    struct v4l2_format *f)
+{
+	struct avd_ctx *ctx = file_to_ctx(file);
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	const struct avd_coded_fmt_desc *desc;
+	struct v4l2_format *cap_fmt;
+	struct vb2_queue *peer_vq, *vq;
+	int ret;
+
+	/*
+	 * In order to support dynamic resolution change, the decoder admits
+	 * a resolution change, as long as the pixelformat remains. Can't be
+	 * done if streaming.
+	 */
+	vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (vb2_is_streaming(vq) ||
+	    (vb2_is_busy(vq) && f->fmt.pix_mp.pixelformat !=
+					ctx->coded_fmt.fmt.pix_mp.pixelformat))
+		return -EBUSY;
+
+	/*
+	 * Since format change on the OUTPUT queue will reset the CAPTURE
+	 * queue, we can't allow doing so when the CAPTURE queue has buffers
+	 * allocated.
+	 */
+	peer_vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (vb2_is_busy(peer_vq))
+		return -EBUSY;
+
+	ret = avd_try_output_fmt(file, priv, f);
+	if (ret)
+		return ret;
+
+	desc = avd_find_coded_fmt_desc(ctx, f->fmt.pix_mp.pixelformat);
+	if (!desc)
+		return -EINVAL;
+	ctx->coded_fmt_desc = desc;
+	ctx->coded_fmt = *f;
+
+	/*
+	 * Current decoded format might have become invalid with newly
+	 * selected codec, so reset it to default just to be safe and
+	 * keep internal driver state sane. User is mandated to set
+	 * the decoded format again after we return, so we don't need
+	 * anything smarter.
+	 *
+	 * Note that this will propagates any size changes to the decoded
+	 * format.
+	 */
+	ctx->image_fmt = AVD_IMG_FMT_ANY;
+	avd_reset_decoded_fmt(ctx);
+
+	/* Propagate colorspace information to capture. */
+	cap_fmt = &ctx->decoded_fmt;
+	cap_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
+	cap_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
+	cap_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+	cap_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
+
+	/* Enable format specific queue features */
+	vq->subsystem_flags |= desc->subsystem_flags;
+
+	return 0;
+}
+
+static int avd_g_output_fmt(struct file *file, void *priv,
+			    struct v4l2_format *f)
+{
+	struct avd_ctx *ctx = file_to_ctx(file);
+
+	*f = ctx->coded_fmt;
+	return 0;
+}
+
+static int avd_g_capture_fmt(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct avd_ctx *ctx = file_to_ctx(file);
+
+	*f = ctx->decoded_fmt;
+	return 0;
+}
+
+static int avd_enum_output_fmt(struct file *file, void *priv,
+			       struct v4l2_fmtdesc *f)
+{
+	struct avd_ctx *ctx = file_to_ctx(file);
+	const struct avd_coded_fmt_desc *desc;
+
+	desc = avd_enum_coded_fmt_desc(ctx, f->index);
+	if (!desc)
+		return -EINVAL;
+
+	f->pixelformat = desc->fourcc;
+	return 0;
+}
+
+static int avd_enum_capture_fmt(struct file *file, void *priv,
+				struct v4l2_fmtdesc *f)
+{
+	struct avd_ctx *ctx = file_to_ctx(file);
+	u32 fourcc;
+
+	fourcc = avd_enum_decoded_fmt(ctx, f->index, ctx->image_fmt);
+	if (!fourcc)
+		return -EINVAL;
+
+	f->pixelformat = fourcc;
+	return 0;
+}
+
+const struct v4l2_ioctl_ops avd_ioctl_ops = {
+	.vidioc_querycap = avd_querycap,
+	.vidioc_enum_framesizes = avd_enum_framesizes,
+
+	.vidioc_try_fmt_vid_cap_mplane = avd_try_capture_fmt,
+	.vidioc_try_fmt_vid_out_mplane = avd_try_output_fmt,
+	.vidioc_s_fmt_vid_out_mplane = avd_s_output_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = avd_s_capture_fmt,
+	.vidioc_g_fmt_vid_out_mplane = avd_g_output_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = avd_g_capture_fmt,
+	.vidioc_enum_fmt_vid_out = avd_enum_output_fmt,
+	.vidioc_enum_fmt_vid_cap = avd_enum_capture_fmt,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_decoder_cmd = v4l2_m2m_ioctl_stateless_decoder_cmd,
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_stateless_try_decoder_cmd,
+};
+
+static int avd_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
+			   unsigned int *num_planes, unsigned int sizes[],
+			   struct device *alloc_devs[])
+{
+	struct avd_ctx *ctx = vb2_get_drv_priv(vq);
+	struct v4l2_format *f;
+	unsigned int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		f = &ctx->coded_fmt;
+	else
+		f = &ctx->decoded_fmt;
+
+	if (*num_planes) {
+		if (*num_planes != f->fmt.pix_mp.num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < f->fmt.pix_mp.num_planes; i++) {
+			if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes = f->fmt.pix_mp.num_planes;
+		for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
+			sizes[i] = f->fmt.pix_mp.plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static int avd_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct avd_ctx *ctx = vb2_get_drv_priv(vq);
+	struct v4l2_format *f;
+	unsigned int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		f = &ctx->coded_fmt;
+	else
+		f = &ctx->decoded_fmt;
+
+	for (i = 0; i < f->fmt.pix_mp.num_planes; ++i) {
+		u32 sizeimage = f->fmt.pix_mp.plane_fmt[i].sizeimage;
+
+		if (vb2_plane_size(vb, i) < sizeimage)
+			return -EINVAL;
+	}
+
+	/*
+	 * Buffer's bytesused must be written by driver for CAPTURE buffers.
+	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
+	 * it to buffer length).
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(vq->type))
+		vb2_set_plane_payload(vb, 0,
+				      f->fmt.pix_mp.plane_fmt[0].sizeimage);
+
+	return 0;
+}
+
+static void avd_buf_queue(struct vb2_buffer *vb)
+{
+	struct avd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int avd_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
+static void avd_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct avd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+}
+
+static int avd_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct avd_ctx *ctx = vb2_get_drv_priv(q);
+	const struct avd_coded_fmt_desc *desc;
+	int ret;
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type))
+		return 0;
+
+	desc = ctx->coded_fmt_desc;
+	if (WARN_ON(!desc))
+		return -EINVAL;
+
+	if (desc->ops->start) {
+		ret = desc->ops->start(ctx);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void avd_queue_cleanup(struct vb2_queue *vq, u32 state)
+{
+	struct avd_ctx *ctx = vb2_get_drv_priv(vq);
+
+	while (true) {
+		struct vb2_v4l2_buffer *vbuf;
+
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+		if (!vbuf)
+			break;
+
+		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
+					   &ctx->ctrl_hdl);
+		v4l2_m2m_buf_done(vbuf, state);
+	}
+}
+
+static void avd_stop_streaming(struct vb2_queue *q)
+{
+	struct avd_ctx *ctx = vb2_get_drv_priv(q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		const struct avd_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+
+		if (WARN_ON(!desc))
+			return;
+
+		if (desc->ops->stop)
+			desc->ops->stop(ctx);
+	}
+
+	avd_queue_cleanup(q, VB2_BUF_STATE_ERROR);
+}
+
+const struct vb2_ops avd_queue_ops = {
+	.queue_setup = avd_queue_setup,
+	.buf_prepare = avd_buf_prepare,
+	.buf_queue = avd_buf_queue,
+	.buf_out_validate = avd_buf_out_validate,
+	.buf_request_complete = avd_buf_request_complete,
+	.start_streaming = avd_start_streaming,
+	.stop_streaming = avd_stop_streaming,
+};
+
+void avd_job_finish_no_pm(struct avd_ctx *ctx, enum vb2_buffer_state result)
+{
+	if (ctx->coded_fmt_desc->ops->done) {
+		struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+		dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+		ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
+	}
+
+	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
+					 result);
+}
+
+void avd_job_finish(struct avd_ctx *ctx, enum vb2_buffer_state result)
+{
+	struct avd_dev *avd = ctx->dev;
+
+	pm_runtime_put_autosuspend(avd->dev);
+	avd_job_finish_no_pm(ctx, result);
+}
+
+void avd_run_preamble(struct avd_ctx *ctx, struct avd_run *run)
+{
+	struct media_request *src_req;
+	struct avd_decoded_buffer *dst;
+
+	memset(run, 0, sizeof(*run));
+
+	run->bufs.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	run->bufs.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	run->coded_in =
+		vb2_dma_contig_plane_dma_addr(&run->bufs.src->vb2_buf, 0);
+	run->y_out = vb2_dma_contig_plane_dma_addr(&run->bufs.dst->vb2_buf, 0);
+	run->uv_out = run->y_out +
+		      ctx->decoded_fmt.fmt.pix_mp.plane_fmt[0].bytesperline *
+			      ctx->decoded_fmt.fmt.pix_mp.height;
+
+	run->comp_out = run->y_out + ctx->comp.start_offset;
+	ctx->decomp = !is_interchange(ctx->decoded_fmt.fmt.pix_mp.pixelformat);
+
+	dst = vb2_to_avd_decoded_buf(&run->bufs.dst->vb2_buf);
+	memcpy(&dst->comp, &ctx->comp, sizeof(ctx->comp));
+
+	/* Apply request(s) controls if needed. */
+	src_req = run->bufs.src->vb2_buf.req_obj.req;
+	if (src_req)
+		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_hdl);
+
+	v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst);
+}
+
+void avd_run_postamble(struct avd_ctx *ctx, struct avd_run *run)
+{
+	struct media_request *src_req = run->bufs.src->vb2_buf.req_obj.req;
+
+	if (src_req)
+		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
+}
+
+static int avd_add_ctrls(struct avd_ctx *ctx, const struct avd_ctrls *ctrls)
+{
+	unsigned int i;
+
+	for (i = 0; i < ctrls->num_ctrls; i++) {
+		const struct v4l2_ctrl_config *cfg = &ctrls->ctrls[i].cfg;
+
+		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, cfg, ctx);
+		if (ctx->ctrl_hdl.error)
+			return ctx->ctrl_hdl.error;
+	}
+
+	return 0;
+}
+
+int avd_init_ctrls(struct avd_ctx *ctx)
+{
+	unsigned int i, nctrls = 0;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(avd_coded_fmts); i++)
+		if (avd_is_capable(ctx, avd_coded_fmts[i].capability))
+			nctrls += avd_coded_fmts[i].ctrls->num_ctrls;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
+
+	for (i = 0; i < ARRAY_SIZE(avd_coded_fmts); i++) {
+		if (avd_is_capable(ctx, avd_coded_fmts[i].capability)) {
+			ret = avd_add_ctrls(ctx, avd_coded_fmts[i].ctrls);
+			if (ret)
+				goto err_free_handler;
+		}
+	}
+
+	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
+	if (ret)
+		goto err_free_handler;
+
+	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+	return ret;
+}
diff --git a/drivers/media/platform/apple/avd/avd.h b/drivers/media/platform/apple/avd/avd.h
new file mode 100644
index 000000000000..980ecce4f3df
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd.h
@@ -0,0 +1,267 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Apple Video Decoder driver
+ *
+ * Copyright (C) 2026 The Asahi Linux Contributors
+ * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
+ *
+ * Based on rkvdec driver by Collabora, Ltd.
+ * Copyright (C) 2019 Collabora, Ltd.
+ * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.org>)
+ * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd.
+ */
+
+#ifndef AVD_H_
+#define AVD_H_
+
+#include <linux/platform_device.h>
+#include <linux/firmware.h>
+#include <linux/iommu.h>
+#include <linux/slab.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ioctl.h>
+
+#define AVD_CAPABILITY_HEVC	BIT(0)
+#define AVD_CAPABILITY_H264	BIT(1)
+#define AVD_CAPABILITY_VP9	BIT(2)
+#define AVD_CAPABILITY_AV1	BIT(3)
+
+/* Shifts addresses right and bytesperline?? */
+#define AVD_QUIRK_LSR		BIT(0)
+#define AVD_QUIRK_NO_PIPE_STATE	BIT(1)
+
+#define AVD_REG_RUN_CTRL	0x08
+#define AVD_RUN_CTRL_UNK_RUN	BIT(0)
+#define AVD_RUN_CTRL_UNK_STOP	(BIT(1) | BIT(2) | BIT(3))
+
+#define AVD_REG_MBOX_IRQ_ENABLE	0x48
+#define AVD_REG_MBOX_IRQ_CLR	0x4c
+#define AVD_MBOX0_EMPTY		BIT(0)
+#define AVD_MBOX0_NOT_EMPTY	BIT(1)
+
+#define AVD_REG_MBOX0_STATUS	0x50
+#define AVD_REG_MBOX0_RETRIEVE	0x58
+#define AVD_REG_MBOX1_STATUS	0x5c
+#define AVD_REG_MBOX1_SUBMIT	0x60
+#define AVD_MBOX_ENABLE		BIT(0)
+
+#define AVD_REG_FLAG0_SET	0x90
+#define AVD_REG_FLAG0_CLR	0x98
+
+/* size in number of words (u32) minus one */
+#define AVD_PIODMA_CMD_SIZE(v)	FIELD_PREP(GENMASK(31, 18), v)
+#define AVD_PIODMA_CMD_DEST(v)	(GENMASK(17, 2) & (v))
+#define AVD_PIODMA_CMD_CONST	BIT(0)
+
+/*
+ * AVD needs most addresses to be aligned to 256
+ * the only exception are the compressed buffers, they are aligned to 128
+ * instead
+ */
+#define AVD_ALIGN	256
+/* hevc, with a b slice where all references are active and weights are sent */
+#define AVD_MAX_INST	512
+
+struct avd_ctx;
+struct avd_dev;
+
+/* Matches hdr mode (inst stream) and register layout */
+enum avd_codec {
+	AVD_CODEC_HEVC = 0,
+	AVD_CODEC_H264 = 1,
+	AVD_CODEC_VP9 = 2,
+	AVD_CODEC_AV1 = 3
+};
+
+struct avd_run {
+	struct {
+		struct vb2_v4l2_buffer *src; /* OUTPUT coded */
+		struct vb2_v4l2_buffer *dst; /* CAPTURE decoded */
+	} bufs;
+
+	dma_addr_t coded_in;
+	dma_addr_t y_out;
+	dma_addr_t uv_out;
+	dma_addr_t comp_out;
+};
+
+struct avd_ctrl_desc {
+	struct v4l2_ctrl_config cfg;
+};
+
+struct avd_ctrls {
+	const struct avd_ctrl_desc *ctrls;
+	unsigned int num_ctrls;
+};
+
+struct avd_comp {
+	u32 size;
+	/* offset to start of compressed data */
+	size_t start_offset;
+	/* relative offsets to start */
+	u32 offsets[4];
+};
+
+struct avd_decoded_buffer {
+	/* Must be the first field in this struct. */
+	struct v4l2_m2m_buffer base;
+	struct avd_comp comp;
+};
+
+static inline struct avd_decoded_buffer *
+vb2_to_avd_decoded_buf(struct vb2_buffer *buf)
+{
+	return container_of(buf, struct avd_decoded_buffer, base.vb.vb2_buf);
+}
+
+struct avd_decoded_buffer *avd_get_ref_buf(struct avd_ctx *ctx,
+					   struct vb2_v4l2_buffer *dst,
+					   u64 timestamp);
+
+struct avd_coded_fmt_ops {
+	void (*adjust_decoded_fmt)(struct avd_ctx *ctx,
+				   struct v4l2_pix_format_mplane *pix_mp);
+	int (*start)(struct avd_ctx *ctx);
+	void (*stop)(struct avd_ctx *ctx);
+	int (*run)(struct avd_ctx *ctx);
+	void (*done)(struct avd_ctx *ctx, struct vb2_v4l2_buffer *src_buf,
+		     struct vb2_v4l2_buffer *dst_buf,
+		     enum vb2_buffer_state result);
+	int (*try_ctrl)(struct avd_ctx *ctx, struct v4l2_ctrl *ctrl);
+	enum avd_image_fmt (*get_image_fmt)(struct avd_ctx *ctx,
+					    struct v4l2_ctrl *ctrl);
+};
+
+enum avd_image_fmt {
+	AVD_IMG_FMT_ANY = 0,
+	AVD_IMG_FMT_420_8BIT,
+	AVD_IMG_FMT_420_10BIT,
+	AVD_IMG_FMT_422_8BIT,
+	AVD_IMG_FMT_422_10BIT,
+};
+
+struct avd_decoded_fmt_desc {
+	u32 fourcc;
+	enum avd_image_fmt image_fmt;
+};
+
+struct avd_coded_fmt_desc {
+	u32 fourcc;
+	struct v4l2_frmsize_stepwise frmsize;
+	const struct avd_ctrls *ctrls;
+	const struct avd_coded_fmt_ops *ops;
+	u32 subsystem_flags;
+	unsigned int capability;
+};
+
+struct avd_variant {
+	unsigned int capabilities;
+	const char *fw_name;
+	unsigned char revision; /* the same as the device tree */
+	unsigned int quirks;
+};
+
+struct avd_dev {
+	struct device *dev;
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+	struct video_device vdev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct platform_device *pdev;
+	const struct firmware *fw; /* fw is lost on suspend */
+	void __iomem *piodma;
+	void __iomem *code;
+	void __iomem *sram;
+	void __iomem *mbox;
+	void __iomem *ctrl;
+	u32 sram_start;
+	struct iommu_domain *domain;
+	struct iommu_domain *empty_domain;
+	struct mutex vdev_lock; /* serializes ioctls */
+	struct reset_control *rstc;
+	const struct avd_variant *variant;
+};
+
+struct avd_segment {
+	u32 piodma_cmd;
+	u32 num;
+	u32 instructions[AVD_MAX_INST];
+};
+
+struct avd_buf {
+	void *cpu;
+	dma_addr_t addr;
+	size_t size;
+};
+
+struct avd_job {
+	enum avd_codec codec;
+	int dest;
+	size_t num;
+	size_t num_alloc;
+	size_t num_submit;
+	struct avd_segment *segments;
+	struct avd_buf buf;
+};
+
+struct avd_ctx {
+	struct v4l2_fh fh;
+	struct avd_dev *dev;
+	struct v4l2_format coded_fmt;
+	struct v4l2_format decoded_fmt;
+	const struct avd_coded_fmt_desc *coded_fmt_desc;
+	struct v4l2_ctrl_handler ctrl_hdl;
+	enum avd_image_fmt image_fmt;
+	bool decomp;
+	struct delayed_work watchdog_work;
+	void *priv;
+	struct avd_comp comp;
+	struct avd_job job;
+	struct avd_buf inst;
+	struct avd_buf pipe_state;
+};
+
+int avd_end_segment(struct avd_ctx *ctx, bool update_submit);
+int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segments);
+int avd_submit_job(struct avd_ctx *ctx);
+
+int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size);
+void avd_buf_free(struct avd_dev *avd, struct avd_buf *buf);
+
+void avd_reset_coded_fmt(struct avd_ctx *ctx);
+void avd_reset_decoded_fmt(struct avd_ctx *ctx);
+int avd_init_ctrls(struct avd_ctx *ctx);
+
+void avd_job_finish_no_pm(struct avd_ctx *ctx, enum vb2_buffer_state result);
+void avd_job_finish(struct avd_ctx *ctx, enum vb2_buffer_state result);
+
+void avd_run_preamble(struct avd_ctx *ctx, struct avd_run *run);
+void avd_run_postamble(struct avd_ctx *ctx, struct avd_run *run);
+
+extern const struct v4l2_ctrl_ops avd_ctrl_ops;
+extern const struct v4l2_ioctl_ops avd_ioctl_ops;
+extern const struct vb2_ops avd_queue_ops;
+
+static inline u32 fmt_height(struct avd_ctx *ctx)
+{
+	return ctx->coded_fmt.fmt.pix_mp.height;
+}
+
+static inline u32 fmt_width(struct avd_ctx *ctx)
+{
+	return ctx->coded_fmt.fmt.pix_mp.width;
+}
+
+void fill_comp(struct avd_comp *comp, enum avd_image_fmt image_fmt, u32 width,
+	       u32 height);
+
+static inline struct avd_ctx *file_to_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct avd_ctx, fh);
+}
+
+#endif /* AVD_H_ */

-- 
2.55.0

