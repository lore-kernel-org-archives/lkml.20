Received: from outbound.mr.icloud.com (mr-2004e-snip4-11.eps.apple.com [57.103.69.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D63D4F6473
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737386; cv=none; b=Tg+fHjhIDpUh+EOr57ly60uTCRyzYqNLGAqh5kk/WlXkZ41sXXBHzaLm7quS0qhcrSSXxcurecox+aaX9/msFDT6vlbXjRO2qq266Vbb+EwKSYHck/sctNVS6lG9oTPY+k5G1E8QC4di4yyeQEJIITJHeaHQFUzJl7KD9uGD/Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737386; c=relaxed/simple;
	bh=SK6s7KMD4Jl95cfCwPbPxtO5NbFYUyQnL6+IayhVHcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQhHrQMvcvzif/j12NAhjllpeU7gv64O46ToqcegdiG0vZ0zfUEzsSE+FtK5Y1eiDhfzIo9XVNr6AUqsq0Bkn3Lbc61LOAPa61wOTNzHaeSv5Drvwr6wFS9sQLDJTIJuhhInNB14tqejaPwdb8VpQu5U1qQ4Z9rIDg36TovUKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=bvjinllW; arc=none smtp.client-ip=57.103.69.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="bvjinllW"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id 0F08B1801853;
	Fri, 18 Sep 2026 13:16:14 +0000 (UTC)
X-ICL-RepId: 01a0b4a9-14cf-713b-a9fb-1165a4106375
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGA0AUTApUAFwLQwgeB1gCK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737380; x=1792329380; bh=h/ulgrp0eamLzgJbxhdpBetYThRbXMJU9M0DHtbFjys=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=bvjinllWkcr3SfGKMMR7GRZfXMMyMMRJc7E05pWNGHusWCtvvGAH1iLRUfatLzeXNYcGhY7pWltLoYsDKg1UPJaHXn73Jk2kp/Zvo9I9rh/04XDFnkWgDJ6joPCrhJZTCVPktaTDazn60WAW6x86IZIclO4VQpcxxQH4LL5N9mWnoL84wOLO1hSIQ8Nz89peIQhpc59yWw+YgQTull4SsQsqaK0t9aZwRWnBxWSx7Vm/wGgAY+psiqkZLu6GTqIj6nPOj43Je28BFCHh7vjS3AYQ7qu89RYQZBcxbbHK/YAmNM/dyBJhvUXNWlGMquPvXfeD/xEHNxhV5y7+0AKPwA==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id C9833180184F;
	Fri, 18 Sep 2026 13:16:10 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:15 +0200
Subject: [PATCH 10/14] media: apple: add avd driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-10-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
In-Reply-To: <20260918-avd-v1-0-49977931f455@icloud.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX3k0w6T2UqZfz
 +ugbspYx0hzQwECwSNFESeMbHMfBxsOtMYfn6HecPEVBQLvKYK0b0bKLH5xid0nDisS7EWFg061
 KeM039N6htAX4vpklbDHdSP7Lm+aIgF5C4O+/1QXcGz3ESZqS2XqOInje2NgHsPdrhKcvxZNg+W
 nIaZOoW8niUurKiAAKJh9W/hS+A77rIZNN4SwKi3Ej8QtzFEA41pxsmZakXyGGIMzUgktwYqRc2
 W5vypOfZFPopInOXMk4AIA4ANBnvt1OohH8jTGRX74xBMuJaHGPaj1FTKZ1wL9m44ytbY3xVfPG
 KYAzkQKtBVBp71TuHytWqMS/sydaRIh290HnjRZ+S67cuuDpU0Qtx3DGNVU/7s=
X-Proofpoint-ORIG-GUID: Bi8ipOqASb0ViF8r5bMO7zvvJCv2XX_5
X-Proofpoint-GUID: Bi8ipOqASb0ViF8r5bMO7zvvJCv2XX_5
X-Authority-Info-Out: v=2.4 cv=D8VK6/Rj c=1 sm=1 tr=0 ts=6aad39a1
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=a4NEJbfMAAAA:8 a=cANso0OxAAAA:8 a=v3ZZPjhaAAAA:8 a=cm27Pg_UAAAA:8
 a=7YfXLusrAAAA:8 a=dpTjxrn7gldKvdbQPh0A:9 a=QEXdDO2ut3YA:10
 a=C1Acd3J0lQIyQdj7UkMi:22 a=SLz71HocmBbuEhFRYD3r:22
X-JNJ: AAAAAAABvb4jsoVEy6UkEmVPBEDjBK/G/deENuSq3q4tKpCdapH9NTSskvPjMeN+wbmbAGxWv7+jo1y6T5RkVfsO+If1sVvkj7EcFDmHMaxjb5kEI6ZysyKI7nWvfMTIHnQ4SJycoTuazdHgUyLOIziBxabO5Upe26Vsj7jG9fOSBzImHUhrILknEC5JoIBabqf/+oiUVMCm2mRwiQsqQvrSnbS2YK0IW3PAW6+3laYR9d7dcESqNP/WiT/k6HDEwSdbYVPxaLqxqdm5Ys3oHSmDMuvj2uKz217qsrabAO2KOiWT9NuJq6A2wOzP3KJyPlIfZd4dhTb4brZv0C3iNMfcJoDJkvQm6fx1h6m39UFsX/3U+w8eYv14wWHFNszTy5BYqgXLnfQcVTFZSqjGtZPoA7NWh4djBX1mg35kK1pXO4flFbiKLBMBxVVb54DUTLYCz4UaZGj5yzVs4FbJ4adKVf3WCN26wt0VlI8xAqidJFiJ3jO4FfJeNjhyE05wxrgAIhngRotBUadzM5WoXMKhubn9dDugClDf6+PsZatR3DbrGPaeLg8PLgpCVQNPyPoGPjcD1Gx3iMxTb7fh8kU2y/OjTaOHvjhfFVE410y3XmWrRxbQAOLd6smgwm2sBQ0Ajw99zNtgoTe66tMICI/zHPhklKW4LTbcFS5yEv7Ye5huc7/MoQFmqSWkSJpgb/RDJdANvoJI9tN4FLYOGbalypmjewOg62iiaOqHhWS8Do2vnmZILwzMiLz+mObgEdGu3g14h4K/N7KdJ9sO1HKhVgrEzmRrJt6QkP8kYbIzKn0kaepYvoTS6ZM5SofCuja1s3+AZriBHGTKetKRqhsJeyaENFSfoTRWJdjtrHOi9CIwJ0T2+WKZqx9IdBtD

Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
support based largely on rockchips implementation.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 MAINTAINERS                                 |   1 +
 drivers/media/platform/Kconfig              |   1 +
 drivers/media/platform/Makefile             |   1 +
 drivers/media/platform/apple/Kconfig        |   5 +
 drivers/media/platform/apple/Makefile       |   3 +
 drivers/media/platform/apple/avd/Kconfig    |  16 +
 drivers/media/platform/apple/avd/Makefile   |   4 +
 drivers/media/platform/apple/avd/avd-drv.c  | 817 ++++++++++++++++++++++++++++
 drivers/media/platform/apple/avd/avd-hw.c   | 127 +++++
 drivers/media/platform/apple/avd/avd-inst.h | 218 ++++++++
 drivers/media/platform/apple/avd/avd-v4l2.c | 752 +++++++++++++++++++++++++
 drivers/media/platform/apple/avd/avd.h      | 273 ++++++++++
 12 files changed, 2218 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c7c5fe3f0bc..6903baa15955 100644
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
index 000000000000..3c41006f3a02
--- /dev/null
+++ b/drivers/media/platform/apple/avd/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_APPLE_AVD
+	tristate "Apple Silicon Video Decoding driver"
+	depends on VIDEO_DEV
+	depends on MEDIA_CONTROLLER
+	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
+	depends on OF_ADDRESS
+	depends on V4L_PLATFORM_DRIVERS
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Support for hardware video decoding on Apple Silicon devices using
+	  the Apple Video Decoder (AVD).
+          To compile this driver as a module, choose M here: the module will
+          be called apple-avd.
diff --git a/drivers/media/platform/apple/avd/Makefile b/drivers/media/platform/apple/avd/Makefile
new file mode 100644
index 000000000000..bcf912cfea3d
--- /dev/null
+++ b/drivers/media/platform/apple/avd/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+apple-avd-y := avd-drv.o avd-v4l2.o avd-hw.o
+obj-$(CONFIG_VIDEO_APPLE_AVD) += apple-avd.o
diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/platform/apple/avd/avd-drv.c
new file mode 100644
index 000000000000..f6a5145c7038
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-drv.c
@@ -0,0 +1,817 @@
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
+#include <linux/delay.h>
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
+	tile_bytes = tile_dim * tile_dim * DIV_ROUND_UP(bpb, 8);
+	*tile = ALIGN(tiles_width * tiles_height * tile_bytes, 16);
+
+	meta_tile_w = roundup_pow_of_two(tiles_width);
+	meta_tile_h = roundup_pow_of_two(tiles_height);
+
+	*meta = ALIGN(meta_tile_w * meta_tile_h * meta_hdr_bytes, 16);
+}
+
+void fill_comp(struct avd_comp *comp, enum avd_image_fmt image_fmt, u32 width,
+	       u32 height)
+{
+	u32 y_meta, y, uv_meta, uv;
+	int bit_depth, vdiv, hdiv = 2;
+
+	switch (image_fmt) {
+	case AVD_IMG_FMT_420_10BIT:
+	case AVD_IMG_FMT_422_10BIT:
+		bit_depth = 10;
+		break;
+	default:
+		bit_depth = 8;
+		break;
+	}
+
+	switch (image_fmt) {
+	case AVD_IMG_FMT_420_10BIT:
+	case AVD_IMG_FMT_420_8BIT:
+		vdiv = 2;
+		break;
+	default:
+		vdiv = 1;
+		break;
+	}
+
+	/* y has 32x32 tiles and 32 bytes of metadata per tile */
+	calc_tile_meta(width, height, bit_depth, 32, 32, &y, &y_meta);
+	/* uv has 16x16 tiles and 8 bytes of metadata per tile */
+	calc_tile_meta(width / vdiv, height / hdiv, bit_depth * 2, 16, 8, &uv,
+		       &uv_meta);
+
+	/* output like DCP driver expects */
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
+	if (!buf->cpu && size < buf->size)
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
+static int avd_wait_submission_queue(struct avd_ctx *ctx, int vp)
+{
+	struct avd_dev *avd = ctx->dev;
+	u32 max = readl_relaxed(avd->ctrl +
+				avd->variant->submit_queue_max_offset + vp * 4);
+	u32 cur = readl_relaxed(avd->ctrl +
+				avd->variant->submit_queue_status_offset + vp * 4);
+
+	if (cur == max) {
+		dev_err(avd->dev, "instruction que full! %d/%d", cur, max);
+		return 1;
+	}
+
+	if (cur >= max / 2) {
+		/* TODO: to high? low? Has weird side effects??? */
+		usleep_range(500, 650);
+	}
+	return 0;
+}
+
+int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segments)
+{
+	int ret = 0;
+	struct avd_job *job = &ctx->job;
+
+	job->codec = codec;
+	job->num = 0;
+	job->segments = kzalloc_objs(*job->segments, segments, GFP_KERNEL);
+	if (!job->segments)
+		ret = -ENOMEM;
+	return ret;
+}
+
+int avd_submit_job(struct avd_ctx *ctx)
+{
+	struct avd_dev *avd = ctx->dev;
+	struct avd_job *sub = &ctx->job;
+	struct avd_segment *seg;
+	int i, idx = 0, vp = 0;
+	void __iomem *reg;
+	u32 exec_mask = sub->codec == AVD_CODEC_VP9 &&
+					avd->variant->revision == 3 ?
+				AVD_OP_EXEC_REV3_VP9_MASK :
+				0;
+	u32 exec_rev_flag =
+		AVD_OP_EXEC_FLAG_START_REV4(avd->variant->revision == 4) |
+		AVD_OP_EXEC_FLAG_START_REV3(avd->variant->revision == 3);
+
+	ctx->fifo_idx = 0;
+	for (i = 0; i < sub->codec; i++)
+		vp += avd->variant->vp_slots[i];
+
+	schedule_delayed_work(&ctx->watchdog_work, msecs_to_jiffies(2000));
+	avd->variant->configure_stream(avd, ctx->inst.addr, ctx->fifo_idx, vp);
+	reg = avd->ctrl + avd->variant->vp_slot_offset + vp * 4;
+
+	/* the first segment is always the header (needs special handling) */
+
+	writel(AVD_OP_EXEC | exec_mask | exec_rev_flag |
+		       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx),
+	       reg);
+	seg = &sub->segments[idx++];
+	for (i = 0; i < seg->num; i++)
+		writel(seg->instructions[i], reg);
+	for (; idx <= sub->num; idx++) {
+		seg = &sub->segments[idx];
+		for (i = 0; i < seg->num; i++)
+			writel(seg->instructions[i], reg);
+		if (avd_wait_submission_queue(ctx, vp))
+			break;
+		writel(AVD_OP_EXEC | exec_mask |
+			       AVD_OP_EXEC_FLAG_END(idx == sub->num),
+		       reg);
+	}
+
+	kfree(sub->segments);
+	sub->segments = NULL;
+	return 0;
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
+	if (avd->empty_domain) {
+		iommu_attach_device(avd->empty_domain, avd->dev);
+		iommu_detach_device(avd->empty_domain, avd->dev);
+	}
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
+	if (!ctx)
+		return IRQ_HANDLED;
+
+	status = readl(avd->mbox + AVD_REG_MBOX1_RETRIEVE);
+
+	writel(AVD_MBOX1_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
+
+	if (status & 0x10000) { /* dbg */
+		dev_warn(avd->dev, "no handler for IRQ: %3d",
+			 status & ~0x10000);
+		writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
+		return IRQ_HANDLED;
+	}
+
+	if (status & 0x1000) {
+		/* pp is done ! we are done */
+		state = VB2_BUF_STATE_DONE;
+	} else if (status & 0x100) {
+		/* a vp is done, kick the pp and hope for the best */
+		if (ctx->coded_fmt_desc->ops->submit)
+			ctx->coded_fmt_desc->ops->submit(ctx);
+		goto done;
+	} else {
+		dev_err(avd->dev, "H%d error", status);
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
+	v4l2_fh_del(&ctx->fh, filp);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+	v4l2_fh_exit(&ctx->fh);
+	avd_buf_free(ctx->dev, &ctx->inst);
+	avd_buf_free(ctx->dev, &ctx->pipe_state);
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
+	.vp_slots = {
+		[AVD_CODEC_HEVC] = 2, /* no sure */
+		[AVD_CODEC_H264] = 1,
+		[AVD_CODEC_VP9] = 1,
+	},
+	.fifo_slots = 7,
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.configure_stream = t8103_configure_stream,
+	.fw_name = "apple/avd-fw-v2-t0.bin",
+	.revision = 3,
+	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
+	.vp_slot_offset = 0x4004,
+	.submit_offset = 0x4014,
+	.submit_queue_max_offset = 0x4018,
+	.submit_queue_status_offset = 0x402c, /* (vp slots + 1) * 4 */
+};
+
+static const struct avd_variant avd_t6000_variant = {
+	.vp_slots = {
+		[AVD_CODEC_HEVC] = 4,
+		[AVD_CODEC_H264] = 4,
+		[AVD_CODEC_VP9] = 1,
+	},
+	.fifo_slots = 15,
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.configure_stream = t8112_configure_stream,
+	.fw_name = "apple/avd-fw-v3-t0.bin",
+	.revision = 4,
+	.quirks = AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
+	.vp_slot_offset = 0xc,
+	.submit_offset = 0x30,
+	.submit_queue_max_offset = 0x34,
+	.submit_queue_status_offset = 0x5c,
+};
+
+static const struct avd_variant avd_t8112_variant = {
+	.vp_slots = {
+		[AVD_CODEC_HEVC] = 4,
+		[AVD_CODEC_H264] = 4,
+		[AVD_CODEC_VP9] = 1,
+	},
+	.fifo_slots = 15,
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.configure_stream = t8112_configure_stream,
+	.fw_name = "apple/avd-fw-v3-t1.bin",
+	.revision = 4,
+	.quirks = AVD_QUIRK_LSR,
+	.vp_slot_offset = 0xc,
+	.submit_offset = 0x30,
+	.submit_queue_max_offset = 0x34,
+	.submit_queue_status_offset = 0x5c,
+};
+
+static const struct avd_variant avd_t6020_variant = {
+	.vp_slots = {
+		[AVD_CODEC_HEVC] = 4,
+		[AVD_CODEC_H264] = 4,
+		[AVD_CODEC_VP9] = 1,
+	},
+	.fifo_slots = 15,
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9,
+	.configure_stream = t8112_configure_stream,
+	.fw_name = "apple/avd-fw-v3-t1.bin",
+	.revision = 4,
+	.vp_slot_offset = 0xc,
+	.submit_offset = 0x30,
+	.submit_queue_max_offset = 0x34,
+	.submit_queue_status_offset = 0x5c,
+};
+
+static const struct avd_variant avd_t8122_variant = {
+	.vp_slots = {
+		[AVD_CODEC_HEVC] = 4,
+		[AVD_CODEC_H264] = 4,
+		[AVD_CODEC_VP9] = 1,
+		[AVD_CODEC_AV1] = 2,
+	},
+	.fifo_slots = 15,
+	.configure_stream = t8122_configure_stream,
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9 |
+			AVD_CAPABILITY_AV1,
+	.fw_name = "apple/avd-fw-v4-t0.bin",
+	.revision = 4,
+	.vp_slot_offset = 0xc,
+	.submit_offset = 0x40,
+	.submit_queue_max_offset = 0x44,
+	.submit_queue_status_offset = 0x7c,
+};
+
+static const struct avd_variant avd_t8140_variant = {
+	/* This is filled in using the tunables, what vp/pp to use? */
+	.vp_slots = {
+		[AVD_CODEC_HEVC] = 2,
+		[AVD_CODEC_H264] = 1,
+		[AVD_CODEC_VP9] = 1,
+		[AVD_CODEC_AV1] = 1,
+	},
+	.fifo_slots = 7,
+	.configure_stream = t8122_configure_stream,
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9 |
+			AVD_CAPABILITY_AV1,
+	.fw_name = "apple/avd-fw-v5-t0.bin",
+	.revision = 4,
+	.vp_slot_offset = 0xc,
+	.submit_offset = 0x40,
+	.submit_queue_max_offset = 0x44,
+	.submit_queue_status_offset = 0x7c,
+};
+
+static const struct avd_variant avd_t8132_variant = {
+	.vp_slots = {
+		[AVD_CODEC_HEVC] = 4,
+		[AVD_CODEC_H264] = 4,
+		[AVD_CODEC_VP9] = 1,
+		[AVD_CODEC_AV1] = 3,
+	},
+	.fifo_slots = 15,
+	.configure_stream = t8122_configure_stream,
+	.capabilities = AVD_CAPABILITY_HEVC |
+			AVD_CAPABILITY_H264 |
+			AVD_CAPABILITY_VP9 |
+			AVD_CAPABILITY_AV1,
+	.fw_name = "apple/avd-fw-v5-t1.bin",
+	.revision = 4,
+	.vp_slot_offset = 0xc,
+	.submit_offset = 0x40,
+	.submit_queue_max_offset = 0x44,
+	.submit_queue_status_offset = 0x7c,
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
+	const struct of_device_id *match;
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
+	match = of_match_node(avd_of_match, pdev->dev.of_node);
+	avd->variant = match->data;
+
+	avd->rstc = devm_reset_control_get_exclusive(avd->dev, NULL);
+
+	avd->code = devm_platform_ioremap_resource_byname(pdev, "code");
+	if (IS_ERR(avd->code))
+		return PTR_ERR(avd->code);
+	avd->mbox = devm_platform_ioremap_resource_byname(pdev, "mbox");
+	if (IS_ERR(avd->mbox))
+		return PTR_ERR(avd->mbox);
+	avd->ctrl = devm_platform_ioremap_resource_byname(pdev, "ctrl");
+	if (IS_ERR(avd->ctrl))
+		return PTR_ERR(avd->ctrl);
+
+	avd->domain = iommu_get_domain_for_dev(avd->dev);
+	if (avd->domain) {
+		avd->empty_domain = iommu_paging_domain_alloc(avd->dev);
+		if (IS_ERR(avd->empty_domain)) {
+			avd->empty_domain = NULL;
+			dev_warn(avd->dev, "cannot alloc new empty domain");
+		}
+	}
+
+	ret = request_firmware(&avd->fw, avd->variant->fw_name, avd->dev);
+
+	if (ret) {
+		dev_err(avd->dev, "failed to load firmware: %d", ret);
+		return ret;
+	}
+
+	ret = dma_set_mask_and_coherent(avd->dev,
+					DMA_BIT_MASK((avd->variant->quirks &
+						     AVD_QUIRK_LSR) ? 38 : 64));
+	if (ret) {
+		dev_err(avd->dev, "Failed to set DMA mask");
+		return ret;
+	}
+
+	irq = platform_get_irq(pdev, 1);
+	if (irq < 0)
+		return irq;
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, avd_irq_handler,
+					IRQF_ONESHOT, dev_name(&pdev->dev),
+					avd);
+	if (ret) {
+		dev_err(avd->dev, "Could not request IRQ 1");
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
+	return ret;
+}
+
+static void avd_remove(struct platform_device *pdev)
+{
+	struct avd_dev *avd = platform_get_drvdata(pdev);
+
+	release_firmware(avd->fw);
+
+	avd_v4l2_cleanup(avd);
+
+	if (avd->empty_domain)
+		iommu_domain_free(avd->empty_domain);
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
+		.pm = &avd_pm_ops,
+	},
+};
+module_platform_driver(avd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Apple Video Decoder driver");
+MODULE_FIRMWARE("apple/avd-fw-v2-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v3-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v3-t1.bin");
+MODULE_FIRMWARE("apple/avd-fw-v4-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v5-t0.bin");
+MODULE_FIRMWARE("apple/avd-fw-v5-t1.bin");
diff --git a/drivers/media/platform/apple/avd/avd-hw.c b/drivers/media/platform/apple/avd/avd-hw.c
new file mode 100644
index 000000000000..c14d2094e8e2
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-hw.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Video Decoder hardware configuration
+ *
+ * Copyright (C) 2026 The Asahi Linux Contributors
+ * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
+ * Copyright (C) 2023 Eileen Yoon <eyn@gmx.com>
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/iopoll.h>
+
+#include "avd.h"
+
+#define AVD_V3_VP_INSN_FIFO_IOVA	0x4068
+#define AVD_V3_VP_INSN_FIFO_MASK	0x4084
+#define AVD_V3_VP_INSN_FIFO_CACH	0x40a0
+#define AVD_V3_VP_INSN_FIFO_XFER	0x40bc
+#define AVD_V3_VP_CTRL_UNK		0x4040
+#define AVD_V3_CTRL_CM3_IRQ_MASK	0x405c
+
+#define AVD_V4_VP_INSN_FIFO_IOVA_HI	0x30c
+#define AVD_V4_VP_INSN_FIFO_IOVA_LO	0x150
+#define AVD_V4_VP_INSN_FIFO_MASK	0x18c
+#define AVD_V4_VP_INSN_FIFO_CACH	0x1c8
+#define AVD_V4_VP_INSN_FIFO_XFER	0x204
+#define AVD_V4_VP_CTRL_CM3_IRQ_MASK	0x0fc
+#define AVD_V4_PP_CTRL_CM3_IRQ_MASK	0x120
+
+#define AVD_V5_VP_INSN_FIFO_IOVA_HI	0x20c
+#define AVD_V5_VP_INSN_FIFO_IOVA_LO	0x1d0
+#define AVD_V5_VP_INSN_FIFO_MASK	0x248
+#define AVD_V5_VP_INSN_FIFO_CACH	0x284
+#define AVD_V5_VP_INSN_FIFO_XFER	0x2c0
+#define AVD_V5_VP_CTRL_CM3_IRQ_MASK	0x15c
+#define AVD_V5_PP_CTRL_CM3_IRQ_MASK	0x190
+
+#define AVD_CM3_UNK	BIT(0)
+#define AVD_CM3_ERROR	BIT(1)
+#define AVD_CM3_DONE	BIT(2)
+#define AVD_CM3_FULL	BIT(3)
+
+#define AVD_VP_CM3_MASK	(AVD_CM3_UNK | AVD_CM3_ERROR | AVD_CM3_DONE)
+#define AVD_PP_CM3_MASK	(AVD_CM3_UNK | AVD_CM3_DONE)
+
+int avd_boot(struct avd_dev *avd)
+{
+	u32 val;
+	int ret;
+
+	if (avd->variant->revision != 3)
+		dev_info_once(avd->dev, "booting hw version: %04x",
+			      readl_relaxed(avd->ctrl));
+
+	memcpy_toio(avd->code, avd->fw->data, avd->fw->size);
+
+	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX1_STATUS);
+	writel_relaxed(AVD_MBOX1_NOT_EMPTY,
+		       avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
+	writel_relaxed(AVD_RUN_CTRL_UNK_RUN, avd->mbox + AVD_REG_RUN_CTRL);
+
+	/* wait for cm3 to boot */
+	ret = readl_poll_timeout(avd->mbox + AVD_REG_FLAG0_SET, val, val == 1,
+				 10, 10000);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void avd_shutdown(struct avd_dev *avd)
+{
+	writel_relaxed(AVD_RUN_CTRL_UNK_STOP, avd->mbox + AVD_REG_RUN_CTRL);
+	writel_relaxed(1, avd->mbox + AVD_REG_FLAG0_CLR);
+	writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
+}
+
+#define w32(reg, val) (writel_relaxed(val, avd->ctrl + (reg)))
+#define m32(reg, val) (w32(reg, (val) | readl_relaxed(avd->ctrl + (reg))))
+
+void t8103_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
+			    u32 vp_slot)
+{
+	w32(AVD_V3_VP_INSN_FIFO_IOVA + (fifo_idx * 4), addr >> 8);
+	w32(AVD_V3_VP_INSN_FIFO_MASK + (fifo_idx * 4), 0);
+	w32(AVD_V3_VP_INSN_FIFO_CACH + (fifo_idx * 4), 0);
+	w32(AVD_V3_VP_INSN_FIFO_XFER + (fifo_idx * 4), 0);
+
+	w32(AVD_V3_VP_CTRL_UNK + (vp_slot * 4), 0);
+	m32(AVD_V3_CTRL_CM3_IRQ_MASK,
+	    AVD_VP_CM3_MASK << (vp_slot * 5) | (AVD_PP_CM3_MASK << 20));
+}
+
+void t8112_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
+			    u32 vp_slot)
+{
+	if (avd->variant->quirks & AVD_QUIRK_LSR) {
+		w32(AVD_V4_VP_INSN_FIFO_IOVA_LO + (fifo_idx * 4), addr >> 8);
+	} else {
+		w32(AVD_V4_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
+		w32(AVD_V4_VP_INSN_FIFO_IOVA_LO + (fifo_idx * 4),
+		    addr & 0xffffffff);
+	}
+	w32(AVD_V4_VP_INSN_FIFO_MASK + (fifo_idx * 4), 0);
+	w32(AVD_V4_VP_INSN_FIFO_CACH + (fifo_idx * 4), 0);
+	w32(AVD_V4_VP_INSN_FIFO_XFER + (fifo_idx * 4), 0);
+
+	m32(AVD_V4_VP_CTRL_CM3_IRQ_MASK + (vp_slot * 4), AVD_VP_CM3_MASK);
+	m32(AVD_V4_PP_CTRL_CM3_IRQ_MASK, AVD_PP_CM3_MASK);
+}
+
+void t8122_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
+			    u32 vp_slot)
+{
+	w32(AVD_V5_VP_INSN_FIFO_IOVA_HI + (fifo_idx * 4), addr >> 32);
+	w32(AVD_V5_VP_INSN_FIFO_IOVA_LO + (fifo_idx * 4), addr & 0xffffffff);
+	w32(AVD_V5_VP_INSN_FIFO_MASK + (fifo_idx * 4), 0);
+	w32(AVD_V5_VP_INSN_FIFO_CACH + (fifo_idx * 4), 0);
+	w32(AVD_V5_VP_INSN_FIFO_XFER + (fifo_idx * 4), 0);
+
+	m32(AVD_V5_VP_CTRL_CM3_IRQ_MASK + (vp_slot * 4), AVD_VP_CM3_MASK);
+	m32(AVD_V5_PP_CTRL_CM3_IRQ_MASK, AVD_PP_CM3_MASK);
+}
+
+#undef w32
+#undef r32
+#undef m32
diff --git a/drivers/media/platform/apple/avd/avd-inst.h b/drivers/media/platform/apple/avd/avd-inst.h
new file mode 100644
index 000000000000..d8e7ede37eb5
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-inst.h
@@ -0,0 +1,218 @@
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
+#define AVD_OP_EXEC			FIELD_PREP(GENMASK(31, 24), 0x2b)
+#define AVD_OP_EXEC_FIFO_MASK(v)	FIELD_PREP(GENMASK(3, 0), v)
+#define AVD_OP_EXEC_FIFO_IDX(v)		FIELD_PREP(GENMASK(7, 4), v)
+#define AVD_OP_EXEC_FLAG_START_REV3(v)	FIELD_PREP(BIT(8), !!(v))
+#define AVD_OP_EXEC_FLAG_START_REV4(v)	FIELD_PREP(BIT(9), !!(v))
+#define AVD_OP_EXEC_FLAG_END(v)		FIELD_PREP(BIT(10), !!(v))
+#define AVD_OP_EXEC_REV3_VP9_MASK	FIELD_PREP(GENMASK(23, 12), 0xfff)
+
+#define AVD_OP_HDR			FIELD_PREP(GENMASK(31, 20), 0x2db)
+#define AVD_OP_HDR_CONST		FIELD_PREP(GENMASK(10, 0), 0x2e0)
+
+/*
+ * only for 10 bit.
+ * output in packed p010 / nv15 kinda format
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
+#define AVD_OP_CODED_DATA_ADDR(v)	FIELD_PREP(GENMASK(12, 0), v)
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
+#define AVD_OP_SL_REF_NUM_L0(v)		FIELD_PREP(GENMASK(15, 11), v)
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
+#define AVD_OP_QP_VAL(v)		FIELD_PREP(GENMASK(17, 10), v)
+
+#define AVD_OP_DBLK			FIELD_PREP(GENMASK(31, 20), 0x2da)
+#define AVD_OP_DBLK_FLAG_SAO_CHROMA(v)	FIELD_PREP(BIT(6), !!(v))
+#define AVD_OP_DBLK_FLAG_SAO_LUMA(v)	FIELD_PREP(BIT(7), !!(v))
+#define AVD_OP_DBLK_OFF0(v)		FIELD_PREP(GENMASK(11, 8), v)
+#define AVD_OP_DBLK_OFF1(v)		FIELD_PREP(GENMASK(16, 12), v)
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
+		push(ctx, (addr >> 8));
+	} else {
+		push(ctx, (u32)(addr & 0xffffffff));
+		push(ctx, (u32)(addr >> 32));
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
index 000000000000..874e46d22c45
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-v4l2.c
@@ -0,0 +1,752 @@
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
+};
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
+	ctx->comp.start_offset = pix_mp->plane_fmt[0].sizeimage;
+	fill_comp(&ctx->comp, ctx->image_fmt, pix_mp->width, pix_mp->height);
+	pix_mp->plane_fmt[0].sizeimage += ctx->comp.size;
+	if (ctx->coded_fmt_desc->ops->adjust_decoded_fmt)
+		ctx->coded_fmt_desc->ops->adjust_decoded_fmt(ctx, pix_mp);
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
+	ctx->decomp = true;
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
index 000000000000..771cf430f284
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd.h
@@ -0,0 +1,273 @@
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
+#define AVD_MBOX1_EMPTY		BIT(2)
+#define AVD_MBOX1_NOT_EMPTY	BIT(3)
+
+#define AVD_REG_MBOX1_STATUS	0x5c
+#define AVD_REG_MBOX1_RETRIEVE	0x64
+#define AVD_MBOX_ENABLE		BIT(0)
+
+#define AVD_REG_FLAG0_SET	0x90
+#define AVD_REG_FLAG0_CLR	0x98
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
+	void (*submit)(struct avd_ctx *ctx);
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
+	unsigned int vp_slots[4];
+	unsigned int fifo_slots;
+	unsigned int capabilities;
+	void (*configure_stream)(struct avd_dev *avd, dma_addr_t addr,
+				 u8 fifo_idx, u32 vp_slot);
+	const char *fw_name;
+	unsigned char revision; /* the same as the device tree */
+	/* just for convenience */
+	u32 vp_slot_offset;
+	u32 submit_offset;
+	u32 submit_queue_max_offset;
+	u32 submit_queue_status_offset;
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
+	void __iomem *code;
+	void __iomem *mbox;
+	void __iomem *ctrl;
+	struct iommu_domain *domain;
+	struct iommu_domain *empty_domain;
+	struct mutex vdev_lock; /* serializes ioctls */
+	struct reset_control *rstc;
+	const struct avd_variant *variant;
+};
+
+struct avd_segment {
+	size_t num;
+	u32 instructions[AVD_MAX_INST];
+};
+
+struct avd_job {
+	enum avd_codec codec;
+	size_t num;
+	struct avd_segment *segments;
+};
+
+struct avd_buf {
+	void *cpu;
+	dma_addr_t addr;
+	size_t size;
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
+	int fifo_idx;
+	struct avd_job job;
+	struct avd_buf inst;
+	struct avd_buf pipe_state;
+};
+
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
+/* hw stuff */
+int avd_boot(struct avd_dev *avd);
+void avd_shutdown(struct avd_dev *avd);
+
+void t8103_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
+			    u32 vp_slot);
+void t8112_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
+			    u32 vp_slot);
+void t8122_configure_stream(struct avd_dev *avd, dma_addr_t addr, u8 fifo_idx,
+			    u32 vp_slot);
+
+#endif /* AVD_H_ */

-- 
2.55.0

