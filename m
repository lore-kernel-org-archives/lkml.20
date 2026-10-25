Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956342;
	b=tAvudZSYZz1hFm8MxjNRTG4PzQefybwz14qp4UWO9T1K1TM8HfrPgjFjZ7v0ApKaW7D4
	 UNotd3t2iFGFMRFm1J2NqLTXmJOZSXrVWtrWodbi5okiyC5Bo+ZcxaYPDMowXmaFvaWmC
	 O8SBQks60Qx4WXrjban2Oey1nX5J7y6oOpjIxpxsCOFeeGEN0cVeczxycDBgZwQpkRXyq
	 iMNxVlqM8+qogE+vT6JtmtqS2LKTsXrxrqNrpplvukd3tzQ/bQ+ksmJl+ygCBD36XA97I
	 znxq5Ps4TN2m6rUU4jmydR8lalASbfQiw5HN58d3XbkWb0JiOASNb0mqgkAjijtJaFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956342;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=Y8UghWgYVdNhG40mlJ6KFnxgmME4eiz27ttt/lwgBlY=;
	b=e7L6e3dVRjEbK7BWDGrPnZw6qtFFEOegpOPpJISTypzceHe8dlz5GHw3YL54FQLz9C78
	 I58Pln00Qz4Z2c6YrEE591LzMYYpEGwhETCzjyUN8O23U7WSyw9D6+MCGBaLU660f7N9g
	 tudKjRKwM7DLKFoB0w94do+gzbd8tM+SdW8UvDJDCQt8TKMcmGXvs7zNaDkhA8fhn6McY
	 qKfGYQ3PSfIgSCLFZBQewhsiyOGFY85nnmCy66nsefNdW3DNdXfwYO/UscZQSbcONhQoM
	 rMdqymEXkTIHdnIikxOOE5TUxuTreowQTiwHMUyjy0R+4UmUCJi/YZfl5/iVevzzPWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=GORA3qRe;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB960A6F41;
	Sun, 25 Oct 2026 19:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBB960A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=GORA3qRe
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Eq519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:27 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Eq519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956330;
	bh=Y8UghWgYVdNhG40mlJ6KFnxgmME4eiz27ttt/lwgBlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GORA3qRezUXFiMCBIJqODauqyXVL/v2gpBOr9R7BNxbwErtFI2K45ieX+ScpStJ+3
	 S2ScFcjCZsEDAJ6AZCYJc5G2DLO00zUYY0rsmBj+GpChbY/Vj2d/UoIhW6jatIFg0u
	 loFhsI9I3IxcffbCU4WZFyhjTnTqbzQajfRJHxqA=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 08/11] media: amlogic: vdec: add VP9 decoding on the HEVC core
Date: Sun, 25 Oct 2026 20:25:04 +0100
Message-ID: <20261025192507.210058-9-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Decode VP9 profile 0 and profile 2 (10-bit 4:2:0, output as rounded
8-bit NV12) up to 4K on the HEVC core. The microcode parses the
uncompressed and compressed headers itself; the host places each frame
behind the 16-byte AMLV prefix, owns the reference slots, and writes
the four frame contexts into the probability buffer before every frame
because the microcode only ever reads them.

The microcode hands backward adaptation to the host and then wedges
the core on this platform, so streams that need it (refresh_frame_context
without frame-parallel or error-resilient mode) are refused and left to
a software decoder. Frame-parallel and error-resilient streams, which is
what players mostly meet, decode bit-exact including alt-ref frames.

After a timeout or a 10-bit session the core memories are power-cycled
and the microcode reloaded before the next frame.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/Kconfig   |    1 +
 drivers/media/platform/amlogic/vdec/Makefile  |    2 +-
 .../media/platform/amlogic/vdec/aml_vdec.c    |   13 +
 .../platform/amlogic/vdec/aml_vdec_platform.c |   17 +
 drivers/media/platform/amlogic/vdec/vp9.c     | 2004 +++++++++++++++++
 drivers/media/platform/amlogic/vdec/vp9.h     |  149 ++
 .../media/platform/amlogic/vdec/vp9_prob.c    |  213 ++
 .../media/platform/amlogic/vdec/vp9_prob.h    |   32 +
 8 files changed, 2430 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9.c
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9.h
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9_prob.c
 create mode 100644 drivers/media/platform/amlogic/vdec/vp9_prob.h

diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/platform/amlogic/vdec/Kconfig
index d392967c7743..5e5dd892b15e 100644
--- a/drivers/media/platform/amlogic/vdec/Kconfig
+++ b/drivers/media/platform/amlogic/vdec/Kconfig
@@ -8,6 +8,7 @@ config VIDEO_AMLOGIC_VDEC
     depends on TEE
     select VIDEOBUF2_DMA_CONTIG
     select V4L2_H264
+    select V4L2_VP9
     select V4L2_MEM2MEM_DEV
     select MESON_CANVAS
     select MESON_SM
diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
index 4eb7601f61a3..e32cac07a4a7 100644
--- a/drivers/media/platform/amlogic/vdec/Makefile
+++ b/drivers/media/platform/amlogic/vdec/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o av1.o mpeg12.o mjpeg.o aml_vdec_tee_fw.o
+aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o av1.o vp9.o vp9_prob.o mpeg12.o mjpeg.o aml_vdec_tee_fw.o
 
 obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
index 6892430c9569..f1696aa2fac5 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
@@ -87,6 +87,16 @@ static const struct aml_vdec_v4l2_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_AV1_FILM_GRAIN,
 		},
+	}, {
+		.codec_type = CODEC_TYPE_VP9,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_VP9_FRAME,
+		},
+	}, {
+		.codec_type = CODEC_TYPE_VP9,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
+		},
 	}, {
 		.codec_type = CODEC_TYPE_MPEG2,
 		.cfg = {
@@ -111,6 +121,9 @@ static const struct aml_dec_type dec_type_name[] = {
 	}, {
 		.codec_type = CODEC_TYPE_AV1,
 		.name = "AV1",
+	}, {
+		.codec_type = CODEC_TYPE_VP9,
+		.name = "VP9",
 	}, {
 		.codec_type = CODEC_TYPE_MPEG2,
 		.name = "MPEG2",
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
index 1e8193821aaf..1620e2764f47 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
@@ -7,6 +7,7 @@
 #include "aml_vdec_hw.h"
 #include "h264.h"
 #include "av1.h"
+#include "vp9.h"
 #include "mpeg12.h"
 #include "mjpeg.h"
 
@@ -33,6 +34,17 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
 			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
 	},
+	{
+		.name = "VP9",
+		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
+		.type = AML_FMT_DEC,
+		.align = 64,
+		.is_10_bit_support = 0,
+		.codec_type = CODEC_TYPE_VP9,
+		.num_planes = 1,
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
+	},
 	{
 		.name = "MPEG-2",
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
@@ -120,6 +132,11 @@ const struct aml_codec_ops aml_S4_dec_ops[] = {
 		.exit = aml_av1_exit,
 		.run = aml_av1_dec_run,
 	},
+	[CODEC_TYPE_VP9] = {
+		.init = aml_vp9_init,
+		.exit = aml_vp9_exit,
+		.run = aml_vp9_dec_run,
+	},
 	[CODEC_TYPE_MPEG2] = {
 		.init = aml_mpeg12_init,
 		.exit = aml_mpeg12_exit,
diff --git a/drivers/media/platform/amlogic/vdec/vp9.c b/drivers/media/platform/amlogic/vdec/vp9.c
new file mode 100644
index 000000000000..b67d503b9351
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/vp9.c
@@ -0,0 +1,2004 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * VP9 decoding on the Amlogic S4 HEVC core.
+ *
+ * This is the same hardware the AV1 path drives, running different microcode,
+ * and the two agree on almost everything structurally: one mailbox register
+ * carries the status and the next command, the picture is written compressed
+ * through an MMU page table plus a per-picture header buffer, and a
+ * double-write unit lays down a plain NV12 copy alongside it.
+ *
+ * What VP9 does differently, and what this file therefore has to get right:
+ *
+ *   - No sequence header and no AMLV reframing.  A VP9 frame is fed to the
+ *     shifter as it stands; the microcode's own start-code search finds it.
+ *   - The workspace has a different shape - short_term_rps/vps/sps/pps and a
+ *     second stream swap buffer, none of which AV1 uses, and no CDF, GMC,
+ *     CDEF, upscale or film-grain areas, which it does.
+ *   - Entropy state is a probability buffer plus a count buffer that the host
+ *     adapts between frames, where AV1 keeps CDFs per slot.
+ *
+ * Sizes are taken from the reference's amvvp9_workbuff_spec[1], the 4096x2304
+ * entry, for the same reason the AV1 path takes spec[1]: several of these
+ * buffers are written from the size the hardware parsed rather than anything
+ * the host tells it, so sizing them for 1080p and then meeting a 4K stream
+ * writes past the end.  It is one allocation for the decoder, not per picture.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/fs.h>
+#include <linux/unaligned.h>
+#include <linux/module.h>
+#include "aml_vdec_drv.h"
+#include "aml_vdec_hw.h"
+#include "vp9.h"
+#include "vp9_prob.h"
+
+#define VP9_IPP_SIZE		0x4000
+#define VP9_SHORT_TERM_RPS_SIZE	0x0800
+#define VP9_VPS_SIZE		0x0800
+#define VP9_SPS_SIZE		0x0800
+#define VP9_PPS_SIZE		0x2000
+#define VP9_SWAP_BUF_SIZE	0x0800
+#define VP9_SWAP_BUF2_SIZE	0x0800
+/*
+ * Deblocking parameter and data storage, and the motion-prediction "above"
+ * context.  These were all smaller than the reference driver's smallest
+ * (1920x1088) work-buffer spec.  Undersized, the picture keeps its structure
+ * but goes soft part way down the frame - the deblocking filter runs off the
+ * end of its parameters - and only at resolutions large enough to reach it,
+ * which is why 320x240 and 640x480 were bit-exact while 1080p was not.
+ */
+#define VP9_DBLK_PARA_SIZE	0x80000
+#define VP9_DBLK_DATA_SIZE	0x80000
+#define VP9_SEG_MAP_SIZE	0xd800
+#define VP9_MMU_VBH_SIZE	0x5000
+#define VP9_MPRED_ABOVE_SIZE	0x10000
+
+/* Small buffers the microcode DMAs to and from, same shapes as AV1. */
+#define VP9_RPM_SIZE		(0x80 * 2)
+#define VP9_LMEM_SIZE		(0x600 * 2)	/* LMEM_BUF_SIZE in the reference */
+#define VP9_PROB_SIZE		0x5000
+#define VP9_COUNT_SIZE		(0x300 * 4 * 4)
+/* One 32-bit page entry per 4 KiB page, MAX_FRAME_4K_NUM of them. */
+#define VP9_MMU_MAP_SIZE	(0x1200 * 4)
+
+#define VP9_PADDING_SIZE	(1024 * 16)
+#define VP9_AMLV_HEADER_SIZE	16
+
+/* Same fixed parser skip configuration the AV1 path uses. */
+#define PARSER_CMD_SKIP_CFG_0   0x0000090b
+#define PARSER_CMD_SKIP_CFG_1   0x1b14140f
+#define PARSER_CMD_SKIP_CFG_2   0x001b1910
+
+struct vp9_workspace {
+	void *vaddr;
+	dma_addr_t paddr;
+	size_t size;
+
+	dma_addr_t ipp, short_term_rps, vps, sps, pps;
+	dma_addr_t swap_buf, swap_buf2;
+	dma_addr_t dblk_para, dblk_data, seg_map, mmu_vbh, mpred_above;
+
+	/* Separately allocated, because the host reads these back. */
+	void *side_vaddr;
+	dma_addr_t side_paddr;
+	size_t side_size;
+	dma_addr_t rpm, lmem, prob, count, mmu_map;
+
+	void *stream_vaddr;
+	dma_addr_t stream_paddr;
+	size_t stream_size;
+	size_t payload;
+};
+
+static struct vp9_workspace vp9_ws;
+static u32 vp9_decode_count;
+
+/*
+ * Secure-world VP9 entropy helpers exist in the reference driver
+ * (tee_vp9_prob_malloc / tee_vp9_prob_process, SMC 0xb200e070..72): on G12A
+ * and later it can hand the whole backward update to the secure OS, which
+ * would explain a microcode that writes its symbol counts somewhere the host
+ * cannot see.  This board's secure OS does not implement them - the allocate
+ * call returns 0xffffffff, "unknown function" - so that route is closed here.
+ */
+
+/* DOS_SW_RESET3 bits aml_vp9_reset_core() pulses between frames. */
+#define VP9_RESET_MASK	(BIT(3) | BIT(4) | BIT(8) | BIT(10) | BIT(11) | \
+			 BIT(12) | BIT(14) | BIT(15) | BIT(17) | BIT(18) | \
+			 BIT(19))
+
+/* Defined with the picture-configuration code further down. */
+static void vp9_free_slots(struct aml_vdec_hw *hw);
+static void vp9_reset_refs(void);
+
+static void wr(struct aml_vdec_hw *hw, u32 reg, u32 val)
+{
+	regmap_write(hw->map[DOS_BUS], reg, val);
+}
+
+void aml_vp9_teardown(struct aml_vdec_hw *hw)
+{
+	vp9_free_slots(hw);
+	wr(hw, HEVC_ASSIST_MBOX0_MASK, 0);
+	if (vp9_ws.stream_vaddr) {
+		dma_free_coherent(hw->dev, vp9_ws.stream_size,
+				  vp9_ws.stream_vaddr, vp9_ws.stream_paddr);
+		vp9_ws.stream_vaddr = NULL;
+	}
+	if (vp9_ws.side_vaddr) {
+		dma_free_coherent(hw->dev, vp9_ws.side_size,
+				  vp9_ws.side_vaddr, vp9_ws.side_paddr);
+		vp9_ws.side_vaddr = NULL;
+	}
+	if (vp9_ws.vaddr) {
+		dma_free_coherent(hw->dev, vp9_ws.size, vp9_ws.vaddr,
+				  vp9_ws.paddr);
+		vp9_ws.vaddr = NULL;
+	}
+}
+
+static int vp9_alloc(struct aml_vdec_hw *hw)
+{
+	dma_addr_t p;
+
+	if (vp9_ws.vaddr)
+		return 0;
+
+	vp9_ws.size = VP9_IPP_SIZE + VP9_SHORT_TERM_RPS_SIZE + VP9_VPS_SIZE +
+		      VP9_SPS_SIZE + VP9_PPS_SIZE + VP9_SWAP_BUF_SIZE +
+		      VP9_SWAP_BUF2_SIZE + VP9_DBLK_PARA_SIZE +
+		      VP9_DBLK_DATA_SIZE + VP9_SEG_MAP_SIZE + VP9_MMU_VBH_SIZE +
+		      VP9_MPRED_ABOVE_SIZE;
+	vp9_ws.size = ALIGN(vp9_ws.size, SZ_64K);
+
+	vp9_ws.vaddr = dma_alloc_coherent(hw->dev, vp9_ws.size, &vp9_ws.paddr,
+					  GFP_KERNEL);
+	if (!vp9_ws.vaddr)
+		return -ENOMEM;
+
+	/* Carve in the order the reference's init_buff_spec() lays them out. */
+	p = vp9_ws.paddr;
+#define CARVE(field, sz)	do { vp9_ws.field = p; p += (sz); } while (0)
+	CARVE(ipp, VP9_IPP_SIZE);
+	CARVE(short_term_rps, VP9_SHORT_TERM_RPS_SIZE);
+	CARVE(vps, VP9_VPS_SIZE);
+	CARVE(sps, VP9_SPS_SIZE);
+	CARVE(pps, VP9_PPS_SIZE);
+	CARVE(swap_buf, VP9_SWAP_BUF_SIZE);
+	CARVE(swap_buf2, VP9_SWAP_BUF2_SIZE);
+	CARVE(dblk_para, VP9_DBLK_PARA_SIZE);
+	CARVE(dblk_data, VP9_DBLK_DATA_SIZE);
+	CARVE(seg_map, VP9_SEG_MAP_SIZE);
+	CARVE(mmu_vbh, VP9_MMU_VBH_SIZE);
+	CARVE(mpred_above, VP9_MPRED_ABOVE_SIZE);
+#undef CARVE
+
+	vp9_ws.side_size = ALIGN(SZ_4K + VP9_PROB_SIZE + SZ_4K +
+				 VP9_COUNT_SIZE + SZ_4K + VP9_MMU_MAP_SIZE,
+				 SZ_64K);
+	vp9_ws.side_vaddr = dma_alloc_coherent(hw->dev, vp9_ws.side_size,
+					       &vp9_ws.side_paddr, GFP_KERNEL);
+	if (!vp9_ws.side_vaddr) {
+		aml_vp9_teardown(hw);
+		return -ENOMEM;
+	}
+	p = vp9_ws.side_paddr;
+#define CARVE(field, sz)	do { vp9_ws.field = p; p += (sz); } while (0)
+	CARVE(rpm, VP9_RPM_SIZE);
+	CARVE(lmem, VP9_LMEM_SIZE);
+	/*
+	 * The probability buffer holds four frame contexts at a 0x1000 stride
+	 * and the microcode addresses them by that stride, so it has to start
+	 * on a 0x1000 boundary; the count buffer it DMAs the symbol counts to
+	 * gets the same treatment.  Carved out of the side buffer behind the
+	 * RPM and LMEM areas they landed at +0x900, and the microcode then
+	 * wrote neither of them - the whole entropy exchange was silently
+	 * dead, which is what left every non-error-resilient stream decoding
+	 * garbage from its second frame on.
+	 */
+	p = ALIGN(p, SZ_4K);
+	CARVE(prob, VP9_PROB_SIZE);
+	p = ALIGN(p, SZ_4K);
+	CARVE(count, VP9_COUNT_SIZE);
+	p = ALIGN(p, SZ_4K);
+	CARVE(mmu_map, VP9_MMU_MAP_SIZE);
+#undef CARVE
+
+	dev_info(hw->dev,
+		 "vp9: workspace %zu KiB at %pad, side %zu KiB at %pad\n",
+		 vp9_ws.size / 1024, &vp9_ws.paddr,
+		 vp9_ws.side_size / 1024, &vp9_ws.side_paddr);
+	return 0;
+}
+
+/* vp9_config_work_space_hw(), front and back together. */
+static void vp9_config_workspace(struct aml_vdec_hw *hw)
+{
+	wr(hw, HEVC_RPM_BUFFER, vp9_ws.rpm);
+	wr(hw, HEVC_SHORT_TERM_RPS, vp9_ws.short_term_rps);
+	wr(hw, HEVC_PPS_BUFFER, vp9_ws.pps);
+	wr(hw, HEVC_STREAM_SWAP_BUFFER, vp9_ws.swap_buf);
+	wr(hw, HEVC_STREAM_SWAP_BUFFER2, vp9_ws.swap_buf2);
+	wr(hw, VP9_PROB_SWAP_BUFFER, vp9_ws.prob);
+	wr(hw, VP9_COUNT_SWAP_BUFFER, vp9_ws.count);
+	wr(hw, VP9_SEG_MAP_BUFFER, vp9_ws.seg_map);
+	wr(hw, VP9_LMEM_DUMP_ADR, vp9_ws.lmem);
+
+	wr(hw, HEVCD_IPP_LINEBUFF_BASE, vp9_ws.ipp);
+	wr(hw, HEVC_DBLK_CFGE, vp9_ws.dblk_para);
+	wr(hw, HEVC_DBLK_CFG4, vp9_ws.dblk_para);
+	wr(hw, HEVC_DBLK_CFG5, vp9_ws.dblk_data);
+	/* 4096x2304 and below take the default left-storage split. */
+	wr(hw, HEVC_DBLK_CFG3, 0x404010);
+
+	/* paged_mem_mode: the picture goes through the MMU. */
+	wr(hw, HEVCD_MPP_DECOMP_CTL1, BIT(4));
+
+	wr(hw, HEVC_SAO_MMU_VH0_ADDR, vp9_ws.mmu_vbh);
+	wr(hw, HEVC_SAO_MMU_VH1_ADDR, vp9_ws.mmu_vbh + VP9_MMU_VBH_SIZE / 2);
+	/*
+	 * From G12A onwards the page table address lives in
+	 * HEVC_ASSIST_MMU_MAP_ADDR, not in the scratch register the older
+	 * microcode read; S4 is well past that.  HEVC_SAO_MMU_DMA_CTRL is what
+	 * the SAO block itself follows, and the AV1 path programs it, so
+	 * program both rather than guess which one this microcode honours.
+	 */
+	wr(hw, HEVC_ASSIST_MMU_MAP_ADDR, vp9_ws.mmu_map);
+	wr(hw, HEVC_SAO_MMU_DMA_CTRL, vp9_ws.mmu_map);
+}
+
+/*
+ * vp9_init_decoder_hw().  Identical in shape to the AV1 one - the parser
+ * command table is the difference that matters, and VP9 enables the IPP in
+ * plain mode rather than AV1 mode.
+ */
+#define VP9_PARSER_CMD_NUMBER	37
+static const u16 vp9_parser_cmd[VP9_PARSER_CMD_NUMBER] = {
+	0x0401, 0x8401, 0x0800, 0x0402, 0x9002, 0x1423,
+	0x8CC3, 0x1423, 0x8804, 0x9825, 0x0800, 0x04FE,
+	0x8406, 0x8411, 0x1800, 0x8408, 0x8409, 0x8C2A,
+	0x9C2B, 0x1C00, 0x840F, 0x8407, 0x8000, 0x8408,
+	0x2000, 0xA800, 0x8410, 0x04DE, 0x840C, 0x840D,
+	0xAC00, 0xA000, 0x08C0, 0x08E0, 0xA40E, 0xFC00,
+	0x7C00
+};
+
+static void vp9_init_decoder(struct aml_vdec_hw *hw)
+{
+	u32 v;
+	int i;
+
+	v = read_dos_reg(hw, HEVC_PARSER_INT_CONTROL);
+	v &= ~(7 << 29);
+	v |= (3 << 29) |
+	     (1 << 24) |	/* stream_buffer_empty_int_amrisc_enable */
+	     (1 << 22) |	/* stream_fifo_empty_int_amrisc_enable */
+	     (1 << 7)  |	/* dec_done_int_cpu_enable */
+	     (1 << 4)  |	/* startcode_found_int_cpu_enable */
+	     (1 << 0);		/* parser_int_enable */
+	wr(hw, HEVC_PARSER_INT_CONTROL, v);
+
+	/* VP9 has no emulation prevention, so only the startcode check is on. */
+	v = read_dos_reg(hw, HEVC_SHIFT_STATUS);
+	v |= BIT(0);
+	wr(hw, HEVC_SHIFT_STATUS, v);
+
+	wr(hw, HEVC_SHIFT_CONTROL,
+	   (0 << 14) |	/* disable_start_code_protect */
+	   (1 << 10) |	/* length_zero_startcode_en, VP9 */
+	   (1 << 9)  |	/* length_valid_startcode_en, VP9 */
+	   (3 << 6)  |	/* sft_valid_wr_position */
+	   (2 << 4)  |	/* emulate_code_length_sub_1 */
+	   (3 << 1)  |	/* start_code_length_sub_1, 4-byte code */
+	   (1 << 0));	/* stream_shift_enable */
+
+	wr(hw, HEVC_CABAC_CONTROL, BIT(0));
+	wr(hw, HEVC_PARSER_CORE_CONTROL, BIT(0));
+	wr(hw, HEVC_DEC_STATUS_REG, 0);
+
+	wr(hw, HEVC_IQIT_SCALELUT_WR_ADDR, 0);
+	for (i = 0; i < 1024; i++)
+		wr(hw, HEVC_IQIT_SCALELUT_DATA, 0);
+
+	wr(hw, HEVC_STREAM_SWAP_TEST, 0);
+	wr(hw, DECODE_MODE, (0x80 << 24) | 2);
+	wr(hw, HEVC_DECODE_SIZE, 0);
+	wr(hw, HEVC_DECODE_COUNT, 0);
+
+	wr(hw, HEVC_PARSER_CMD_WRITE, BIT(16));
+	for (i = 0; i < VP9_PARSER_CMD_NUMBER; i++)
+		wr(hw, HEVC_PARSER_CMD_WRITE, vp9_parser_cmd[i]);
+	wr(hw, HEVC_PARSER_CMD_SKIP_0, PARSER_CMD_SKIP_CFG_0);
+	wr(hw, HEVC_PARSER_CMD_SKIP_1, PARSER_CMD_SKIP_CFG_1);
+	wr(hw, HEVC_PARSER_CMD_SKIP_2, PARSER_CMD_SKIP_CFG_2);
+
+	wr(hw, HEVC_PARSER_IF_CONTROL,
+	   (1 << 5) |	/* parser_sao_if_en */
+	   (1 << 2) |	/* parser_mpred_if_en */
+	   (1 << 0));	/* parser_scaler_if_en */
+
+	wr(hw, HEVCD_IPP_TOP_CNTL, BIT(0));	/* reset ipp/mpp */
+	wr(hw, HEVCD_IPP_TOP_CNTL, BIT(1));	/* enable ipp */
+}
+
+static void vp9_prot_init(struct aml_vdec_hw *hw)
+{
+	/*
+	 * Stream fetch stays off here for the same reason as AV1: turning it
+	 * on before the FIFO pointers are programmed lets the shifter run
+	 * against stale pointers, and the microcode then reports the packet
+	 * finished without having found a frame.  aml_vp9_feed() enables it.
+	 */
+	wr(hw, HEVC_SHIFT_STARTCODE, 0x00000001);
+	wr(hw, HEVC_SHIFT_EMULATECODE, 0x00000300);
+	wr(hw, HEVC_WAIT_FLAG, 1);
+
+	wr(hw, HEVC_ASSIST_MBOX0_CLR_REG, 1);
+	wr(hw, HEVC_ASSIST_MBOX0_MASK, 1);
+
+	wr(hw, HEVC_PSCALE_CTRL, 0);
+	wr(hw, DEBUG_REG1, 0);
+	wr(hw, NAL_SEARCH_CTL, 0x8);
+	wr(hw, DECODE_STOP_POS, 0);
+}
+
+/*
+ * hevc_reset_core() from the reference's vdec.c, which is what runs between
+ * chunks - and is a great deal more than the two CPU resets the AV1 path gets
+ * away with.  It also resets the parser (3), the parser state machine (4), the
+ * deblocker (8), lmem write response (10), ddr (13), iqit (14), ipp (15),
+ * qdct (17), mpred (18), sao (19), the HEVC async FIFO (24) and the MMU (26).
+ *
+ * The reason this matters here: after frame 0 the stream shifter would not
+ * fetch again.  HEVC_STREAM_RD_PTR stayed exactly where the host put it while
+ * the FIFO held a full frame, so the microcode had nothing to parse and never
+ * posted a status.  Resetting only the two CPUs leaves the parser and the
+ * async FIFO holding state from the finished frame.
+ */
+void aml_vp9_reset_core(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	wr(hw, HEVC_STREAM_CONTROL, 0);
+
+	/*
+	 * Deliberately NOT the reference's full mask.  Adding its bus-facing
+	 * bits - 13 (ddr), 24 (hevc_afifo) and 26 (rst_mmu_n) - to this,
+	 * together with the HEVC_SAO_MMU_RESET_CTRL pulse around it, hung the
+	 * whole SoC instantly: no console output, no ping, serial alive but
+	 * silent, recoverable only by pulling power.  The reference can do it
+	 * because vdec.c gates the DMC ports off first (dec_dmc_port_ctrl());
+	 * nothing here does, so resetting the memory path underneath
+	 * outstanding DMA wedges the bus and takes the CPUs with it.
+	 *
+	 * What is left is the parser (3), its state machine (4), and the
+	 * per-block resets: dblk (8), lmem write response (10), the two CPUs
+	 * (11, 12), iqit (14), ipp (15), qdct (17), mpred (18), sao (19).
+	 */
+	wr(hw, DOS_SW_RESET3, VP9_RESET_MASK);
+	wr(hw, DOS_SW_RESET3, 0);
+
+	/* Wait for outstanding lmem writes to retire, bounded. */
+	for (i = 0; i < 10000; i++) {
+		if (!(read_dos_reg(hw, HEVC_WRRSP_LMEM) & 0xfff))
+			break;
+		udelay(1);
+	}
+	if (i == 10000)
+		dev_warn(hw->dev, "vp9: lmem write response never drained\n");
+}
+
+/*
+ * Put the hardware back the way it was without touching anything that has to
+ * survive between frames.  The reference does exactly this before every chunk
+ * - vp9_hw_ctx_restore() calls vvp9_prot_init() again - because it stops the
+ * core between frames and a stopped core forgets its register state.  What it
+ * must not forget is the side buffer: the probability and count buffers carry
+ * the entropy context from one frame to the next, and the segment map carries
+ * segment ids.
+ */
+void aml_vp9_prot_reinit(struct aml_vdec_hw *hw)
+{
+	vp9_prot_init(hw);
+}
+
+void aml_vp9_restart(struct aml_vdec_hw *hw)
+{
+	vp9_config_workspace(hw);
+	vp9_init_decoder(hw);
+	vp9_prot_init(hw);
+}
+
+/*
+ * Fill all four frame contexts with the VP9 defaults.  This is what a key
+ * frame's setup_past_independence() leaves behind, and the microcode reloads
+ * its contexts from here every time it is started - which is once per frame.
+ */
+static void vp9_seed_default_probs(struct aml_vdec_hw *hw)
+{
+	u8 *prob;
+	int i;
+
+	if (!vp9_ws.side_vaddr)
+		return;
+	prob = vp9_ws.side_vaddr + (vp9_ws.prob - vp9_ws.side_paddr);
+	for (i = 0; i < 4; i++)
+		aml_vp9_pack_probs(prob + i * 0x1000, &v4l2_vp9_default_probs);
+	dev_dbg(hw->dev, "vp9: seeded four frame contexts with the defaults\n");
+}
+
+int aml_vp9_bringup(struct aml_vdec_hw *hw, u32 width, u32 height)
+{
+	int ret;
+	int i;
+
+	/*
+	 * Clear the scratch registers the other microcode on this core may
+	 * have left pointing at its own buffers - see the note on
+	 * hevc_clear_scratch() in av1.c.  SCRATCH_0 and _1 are programmed
+	 * immediately afterwards.
+	 */
+	for (i = 2; i <= 0xf; i++)
+		wr(hw, REG_ALIGN(0x30c0 + i), 0);
+
+	ret = vp9_alloc(hw);
+	if (ret)
+		return ret;
+
+	memset(vp9_ws.side_vaddr, 0, vp9_ws.side_size);
+	vp9_seed_default_probs(hw);
+	vp9_reset_refs();
+	aml_vp9_restart(hw);
+	return 0;
+}
+
+/*
+ * Put one VP9 frame in front of the shifter.  Unlike AV1 there is no
+ * reframing: the microcode's start-code search works on the frame as it
+ * stands, so this only has to place it and point the FIFO at it.
+ */
+int aml_vp9_feed(struct aml_vdec_hw *hw, const void *data, size_t size)
+{
+	size_t want = ALIGN(size + VP9_PADDING_SIZE, SZ_64K);
+	u32 end;
+
+	if (!data || !size)
+		return -EINVAL;
+
+	if (vp9_ws.stream_vaddr && vp9_ws.stream_size < want) {
+		dma_free_coherent(hw->dev, vp9_ws.stream_size,
+				  vp9_ws.stream_vaddr, vp9_ws.stream_paddr);
+		vp9_ws.stream_vaddr = NULL;
+	}
+	if (!vp9_ws.stream_vaddr) {
+		vp9_ws.stream_vaddr = dma_alloc_coherent(hw->dev, want,
+							 &vp9_ws.stream_paddr,
+							 GFP_KERNEL);
+		if (!vp9_ws.stream_vaddr)
+			return -ENOMEM;
+		vp9_ws.stream_size = want;
+	}
+
+	/*
+	 * Two ways to put a frame in front of the shifter.
+	 *
+	 * The plain one rewinds the FIFO for every frame, which is only safe
+	 * when the core is restarted with it.  The ring one appends after the
+	 * previous frame and only advances the write pointer, the way the
+	 * reference's parser feeds a running decoder - that is what lets the
+	 * microcode keep running, and keep its entropy contexts, between
+	 * frames.
+	 */
+
+	memset(vp9_ws.stream_vaddr, 0, vp9_ws.stream_size);
+	/*
+	 * Frame-base *with* a head, which is what the vendor's V4L2
+	 * path asks for (`no_head:0` in vdec_vp9_if.c) and what the
+	 * AV1 microcode on this same core also wants.  VP9's prefix is
+	 * 16 bytes and is built by add_prefix_data() there:
+	 *
+	 *   [0..3]   big endian (frame_size + 16)
+	 *   [4..7]   ones complement of [0..3]
+	 *   [8..11]  00 00 00 01   <- the start code the shifter hunts
+	 *   [12..15] 'A' 'M' 'L' 'V'
+	 *
+	 * Note this is *not* AV1's 20-byte header: no LEB128 tail, and
+	 * the length counts the prefix rather than adding four.
+	 */
+	u32 psize = size + VP9_AMLV_HEADER_SIZE;
+	u8 *h = vp9_ws.stream_vaddr;
+
+	memset(h, 0, VP9_AMLV_HEADER_SIZE);
+	h[0] = psize >> 24;
+	h[1] = psize >> 16;
+	h[2] = psize >> 8;
+	h[3] = psize;
+	h[4] = h[0] ^ 0xff;
+	h[5] = h[1] ^ 0xff;
+	h[6] = h[2] ^ 0xff;
+	h[7] = h[3] ^ 0xff;
+	h[11] = 1;
+	h[12] = 'A';
+	h[13] = 'M';
+	h[14] = 'L';
+	h[15] = 'V';
+	memcpy(vp9_ws.stream_vaddr + VP9_AMLV_HEADER_SIZE, data, size);
+	size += VP9_AMLV_HEADER_SIZE;
+	vp9_ws.payload = size;
+
+	/*
+	 * The end pointer bounds the FIFO, not the payload - ending it at the
+	 * payload puts the write pointer outside the ring and the microcode
+	 * waits for data that can never arrive.  This is the bug that cost the
+	 * AV1 path a long time; keep the whole buffer in the ring.
+	 */
+	end = vp9_ws.stream_paddr + vp9_ws.stream_size - 1;
+
+	wr(hw, HEVC_STREAM_START_ADDR, vp9_ws.stream_paddr);
+	wr(hw, HEVC_STREAM_END_ADDR, end);
+	wr(hw, HEVC_STREAM_RD_PTR, vp9_ws.stream_paddr);
+	wr(hw, HEVC_STREAM_WR_PTR,
+	   vp9_ws.stream_paddr + vp9_ws.payload + VP9_PADDING_SIZE);
+
+	/*
+	 * Reset the shift byte count.  The microcode compares it against
+	 * HEVC_DECODE_SIZE to know where the frame ends, so leaving the
+	 * previous frame's count in place makes the second frame look already
+	 * finished before it starts - which is exactly how frame 1 came back
+	 * with no answer at all while frame 0 decoded perfectly.  The
+	 * reference writes it for every frame-based chunk.
+	 */
+	wr(hw, HEVC_SHIFT_BYTE_COUNT, 0);
+	wr(hw, HEVC_DECODE_SIZE, vp9_ws.payload);
+	wr(hw, HEVC_DECODE_COUNT, vp9_decode_count++);
+	wr(hw, VP9_LMEM_DUMP_ADR, vp9_ws.lmem);
+
+	/* Enable stream fetch now that the pointers are right. */
+	wr(hw, HEVC_STREAM_CONTROL,
+	   (read_dos_reg(hw, HEVC_STREAM_CONTROL) & ~0xfff0) |
+	   (7 << 4) | BIT(0));
+	/* stream_fifo_hole, G12A and later. */
+	wr(hw, HEVC_STREAM_FIFO_CTL,
+	   read_dos_reg(hw, HEVC_STREAM_FIFO_CTL) | BIT(29));
+
+	/*
+	 * Deliberately not writing the status register or starting the core
+	 * here.  Doing either from feed() lets the microcode run against a
+	 * half-configured decoder: the first attempt did exactly that, the
+	 * shifter drained the whole FIFO before the caller had reset the core,
+	 * and the only answer left in the mailbox was HEVC_ACTION_DONE.  The
+	 * caller kicks it once everything is in place.
+	 */
+	dev_dbg(hw->dev, "vp9: fed %zu bytes at %pad, fifo %zu KiB\n",
+		vp9_ws.payload, &vp9_ws.stream_paddr,
+		 vp9_ws.stream_size / 1024);
+	return 0;
+}
+
+/* Load a test frame from /lib/firmware, the way the AV1 probe does. */
+int aml_vp9_feed_file(struct aml_vdec_hw *hw, const char *name)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = request_firmware(&fw, name, hw->dev);
+	if (ret) {
+		dev_err(hw->dev, "vp9: test stream %s not found (%d)\n",
+			name, ret);
+		return ret;
+	}
+	ret = aml_vp9_feed(hw, fw->data, fw->size);
+	release_firmware(fw);
+	return ret;
+}
+
+void aml_vp9_dump_state(struct aml_vdec_hw *hw)
+{
+	dev_info(hw->dev,
+		 "vp9: fifo start %08x end %08x rd %08x wr %08x level %08x\n",
+		 read_dos_reg(hw, HEVC_STREAM_START_ADDR),
+		 read_dos_reg(hw, HEVC_STREAM_END_ADDR),
+		 read_dos_reg(hw, HEVC_STREAM_RD_PTR),
+		 read_dos_reg(hw, HEVC_STREAM_WR_PTR),
+		 read_dos_reg(hw, HEVC_STREAM_LEVEL));
+	dev_info(hw->dev, "vp9: status %08x mpc %08x mpsr %08x\n",
+		 read_dos_reg(hw, HEVC_DEC_STATUS_REG),
+		 read_dos_reg(hw, HEVC_MPC_E),
+		 read_dos_reg(hw, HEVC_MPSR));
+}
+
+/*
+ * Read back what the microcode parsed.  The RPM comes over scrambled the same
+ * way AV1's does - entries reversed within groups of four - so unscramble it
+ * here rather than making every caller remember.
+ */
+void aml_vp9_dump_params(struct aml_vdec_hw *hw)
+{
+	const u16 *raw;
+	u16 pr[0x80];
+	int i, j;
+
+	if (!vp9_ws.side_vaddr)
+		return;
+	raw = vp9_ws.side_vaddr + (vp9_ws.rpm - vp9_ws.side_paddr);
+	for (i = 0; i < 0x80; i += 4)
+		for (j = 0; j < 4; j++)
+			pr[i + j] = raw[i + 3 - j];
+
+	dev_info(hw->dev, "vp9: rpm[0..15] %*ph\n", 32, pr);
+	dev_info(hw->dev, "vp9: rpm[16..31] %*ph\n", 32, pr + 16);
+}
+
+/* ------------------------------------------------------------------------
+ * Picture configuration
+ *
+ * Everything above this line gets the microcode as far as parsing a frame
+ * header.  From here the host has to give it somewhere to put a picture: a
+ * compressed body reached through the MMU page table, a compressed header,
+ * a collocated-MV buffer, and - for the plain NV12 copy the display wants -
+ * a double-write target.  The reference splits this across config_pic_size(),
+ * config_mc_buffer(), config_mpred_hw(), config_sao_hw() and
+ * vp9_loop_filter_frame_init(); it is one function here because the order
+ * between them matters and splitting it only hides that.
+ * ------------------------------------------------------------------------
+ */
+
+/*
+ * VP9 keeps eight reference slots and the picture being decoded needs one no
+ * reference names, so eight is one too few.  Ten, for the same reason the AV1
+ * path uses ten.
+ */
+#define VP9_SLOTS		10
+#define VP9_REF_FRAMES		8
+#define VP9_REFS_PER_FRAME	3
+#define VP9_MV_MEM_UNIT		0x240
+
+struct vp9_slot {
+	void *body_v;
+	dma_addr_t body_p;
+	void *hdr_v;
+	dma_addr_t hdr_p;
+	void *mv_v;
+	dma_addr_t mv_p;
+	void *dw_v;
+	dma_addr_t dw_p;
+	u32 width, height;
+	bool intra;
+	bool show;
+};
+
+static struct vp9_slot vp9_slots[VP9_SLOTS];
+static size_t vp9_slot_body_size, vp9_slot_hdr_size, vp9_slot_mv_size;
+static size_t vp9_slot_dw_size;
+static int vp9_cur_slot;
+static int vp9_prev_slot;
+static int vp9_out_slot = -1;
+static bool vp9_cur_show;
+static u32 vp9_pending_refresh;
+static int vp9_ref_slot[VP9_REF_FRAMES];
+/* The picture slot each of LAST/GOLDEN/ALTREF resolves to. */
+static int vp9_frame_slot[VP9_REFS_PER_FRAME];
+static u32 vp9_last_width, vp9_last_height;
+static bool vp9_have_key;
+/*
+ * Entropy adaptation needs to know whether this frame and the one before it
+ * were key frames - the update factors differ - and the reference keeps a
+ * picture counter purely for its own tracing.
+ */
+static bool vp9_cur_kf;
+
+/* Start a stream from nothing: no key frame seen, no slot referenced. */
+static void vp9_reset_refs(void)
+{
+	vp9_have_key = false;
+	vp9_out_slot = -1;
+	vp9_cur_slot = 0;
+	vp9_prev_slot = 0;
+	vp9_cur_show = false;
+	vp9_pending_refresh = 0;
+	vp9_decode_count = 0;
+	vp9_cur_kf = false;
+	memset(vp9_ref_slot, 0, sizeof(vp9_ref_slot));
+	memset(vp9_frame_slot, 0, sizeof(vp9_frame_slot));
+}
+
+/* Where the double-write unit should lay the NV12 picture down, when the
+ * caller owns the buffer.  Zero means "this picture's own slot buffer".
+ */
+static dma_addr_t vp9_dw_target_y, vp9_dw_target_c;
+static size_t vp9_dw_target_size;
+
+/* Profile 2: 10-bit.  The double write still lays down rounded NV12. */
+static bool vp9_ten_bit;
+
+/*
+ * Per 64x32 block: 3200 bytes at 8 bit (memory saving), 4096 at 10 bit,
+ * which cannot use it.  Same formula as AV1 and HEVC.
+ */
+static u32 vp9_comp_body_size(u32 width, u32 height)
+{
+	return (vp9_ten_bit ? 4096 : 3200) * ((width + 63) >> 6) * ((height + 31) >> 5);
+}
+
+static u32 vp9_comp_header_size(u32 width, u32 height)
+{
+	return 32 * ((width + 127) >> 7) * ((height + 63) >> 6);
+}
+
+/*
+ * As with AV1 the compressed-header *allocation* is a fixed size per picture
+ * and has nothing to do with the length written to HEVC_CM_HEADER_LENGTH.
+ * Allocating the computed length lets the hardware write off the end.
+ */
+static size_t vp9_hdr_alloc_size(u32 width, u32 height)
+{
+	if (width * height > 4096 * 2304)
+		return 0x120000;
+	if (width * height > 1920 * 1088)
+		return 0x48000;
+	return 0x10000;
+}
+
+/* cal_mv_buf_size() in the reference. */
+static size_t vp9_mv_buf_size(u32 width, u32 height)
+{
+	u32 w_lcu = DIV_ROUND_UP(ALIGN(width, 64), 64);
+	u32 h_lcu = DIV_ROUND_UP(ALIGN(height, 32), 64);
+	u32 size_a = w_lcu * h_lcu * 36 * 16;
+	u32 size_b = w_lcu * 16 * ((h_lcu >> 3) + (h_lcu & 7));
+
+	return ALIGN(size_a + size_b, SZ_64K);
+}
+
+static void vp9_free_slots(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	for (i = 0; i < VP9_SLOTS; i++) {
+		if (vp9_slots[i].body_v)
+			dma_free_coherent(hw->dev, vp9_slot_body_size,
+					  vp9_slots[i].body_v,
+					  vp9_slots[i].body_p);
+		if (vp9_slots[i].hdr_v)
+			dma_free_coherent(hw->dev, vp9_slot_hdr_size,
+					  vp9_slots[i].hdr_v,
+					  vp9_slots[i].hdr_p);
+		if (vp9_slots[i].mv_v)
+			dma_free_coherent(hw->dev, vp9_slot_mv_size,
+					  vp9_slots[i].mv_v, vp9_slots[i].mv_p);
+		if (vp9_slots[i].dw_v)
+			dma_free_noncoherent(hw->dev, vp9_slot_dw_size,
+					     vp9_slots[i].dw_v,
+					     vp9_slots[i].dw_p,
+					     DMA_FROM_DEVICE);
+		memset(&vp9_slots[i], 0, sizeof(vp9_slots[i]));
+	}
+	vp9_slot_body_size = 0;
+	vp9_slot_hdr_size = 0;
+	vp9_slot_mv_size = 0;
+	vp9_slot_dw_size = 0;
+}
+
+static int vp9_alloc_slots(struct aml_vdec_hw *hw, u32 width, u32 height)
+{
+	size_t body = ALIGN(vp9_comp_body_size(width, height), PAGE_SIZE);
+	size_t hdr = vp9_hdr_alloc_size(width, height);
+	size_t mv = vp9_mv_buf_size(width, height);
+	size_t dw = vp9_dw_target_y ? 0 : ALIGN(width * height * 3 / 2, SZ_64K);
+	int i;
+
+	if (vp9_slots[0].body_v && body == vp9_slot_body_size &&
+	    hdr == vp9_slot_hdr_size && mv == vp9_slot_mv_size &&
+	    dw == vp9_slot_dw_size)
+		return 0;
+
+	vp9_free_slots(hw);
+	vp9_slot_body_size = body;
+	vp9_slot_hdr_size = hdr;
+	vp9_slot_mv_size = mv;
+	vp9_slot_dw_size = dw;
+
+	for (i = 0; i < VP9_SLOTS; i++) {
+		vp9_slots[i].body_v = dma_alloc_coherent(hw->dev, body,
+							 &vp9_slots[i].body_p,
+							 GFP_KERNEL);
+		vp9_slots[i].hdr_v = dma_alloc_coherent(hw->dev, hdr,
+							&vp9_slots[i].hdr_p,
+							GFP_KERNEL);
+		vp9_slots[i].mv_v = dma_alloc_coherent(hw->dev, mv,
+						       &vp9_slots[i].mv_p,
+						       GFP_KERNEL);
+		/*
+		 * The picture the CPU reads in bulk once per frame.  Coherent
+		 * memory is uncached on arm64 and a 3 MB uncached read costs
+		 * more than the decode, so take cached memory and invalidate
+		 * it by hand - the same trade the AV1 path makes.
+		 */
+		if (dw)
+			vp9_slots[i].dw_v =
+				dma_alloc_noncoherent(hw->dev, dw,
+						      &vp9_slots[i].dw_p,
+						      DMA_FROM_DEVICE,
+						      GFP_KERNEL);
+		if (!vp9_slots[i].body_v || !vp9_slots[i].hdr_v ||
+		    !vp9_slots[i].mv_v || (dw && !vp9_slots[i].dw_v)) {
+			vp9_free_slots(hw);
+			return -ENOMEM;
+		}
+	}
+
+	dev_info(hw->dev,
+		 "vp9: %d slots, body %zu KiB, hdr %zu KiB, mv %zu KiB, dw %zu KiB each\n",
+		 VP9_SLOTS, body / 1024, hdr / 1024, mv / 1024, dw / 1024);
+	return 0;
+}
+
+/*
+ * The MMU page table: one page frame number per 4 KiB of compressed body.
+ * The hardware pulls pages from this list while writing the picture and
+ * records which it took in that picture's compressed header, so the order is
+ * free but every entry has to name a page this picture owns.
+ */
+static int vp9_fill_mmu_map(struct aml_vdec_hw *hw)
+{
+	struct vp9_slot *slot = &vp9_slots[vp9_cur_slot];
+	u32 *map, pages, first, i;
+
+	pages = vp9_slot_body_size / PAGE_SIZE;
+	if (!pages || pages * sizeof(u32) > VP9_MMU_MAP_SIZE)
+		return -EINVAL;
+
+	map = vp9_ws.side_vaddr + (vp9_ws.mmu_map - vp9_ws.side_paddr);
+	first = slot->body_p >> PAGE_SHIFT;
+	for (i = 0; i < pages; i++)
+		map[i] = first + i;
+
+	dev_dbg(hw->dev, "vp9: mmu map %u pages from pfn %08x\n", pages, first);
+	return 0;
+}
+
+/* init_pic_list_hw().  In MMU mode the table holds each picture's
+ * compressed-header address shifted right by 5.
+ */
+static void vp9_config_pic_list(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	wr(hw, HEVCD_MPP_ANC2AXI_TBL_CONF_ADDR, BIT(1) | BIT(2));
+	for (i = 0; i < VP9_SLOTS; i++)
+		wr(hw, HEVCD_MPP_ANC2AXI_TBL_DATA, vp9_slots[i].hdr_p >> 5);
+	wr(hw, HEVCD_MPP_ANC2AXI_TBL_CONF_ADDR, BIT(0));
+
+	wr(hw, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, (0 << 8) | BIT(0));
+	for (i = 0; i < 32; i++)
+		wr(hw, HEVCD_MPP_ANC_CANVAS_DATA_ADDR, 0);
+}
+
+/*
+ * config_mc_buffer().  Names the three reference pictures twice - once for
+ * each of the two canvas tables the motion compensation block reads - and then
+ * hands over their sizes so it can scale a reference coded at a different
+ * resolution.  In MMU mode the "canvas" is just the picture index.
+ */
+static void vp9_config_mc_buffer(struct aml_vdec_hw *hw, u32 width, u32 height)
+{
+	u8 scale_enable = 0;
+	int i;
+
+	wr(hw, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, (0 << 8) | BIT(0));
+	for (i = 0; i < VP9_REFS_PER_FRAME; i++) {
+		u32 idx = vp9_frame_slot[i];
+
+		wr(hw, HEVCD_MPP_ANC_CANVAS_DATA_ADDR,
+		   (idx << 16) | (idx << 8) | idx);
+	}
+	wr(hw, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, (16 << 8) | BIT(0));
+	for (i = 0; i < VP9_REFS_PER_FRAME; i++) {
+		u32 idx = vp9_frame_slot[i];
+
+		wr(hw, HEVCD_MPP_ANC_CANVAS_DATA_ADDR,
+		   (idx << 16) | (idx << 8) | idx);
+	}
+
+	wr(hw, VP9D_MPP_REFINFO_TBL_ACCCONFIG, BIT(2));	/* auto increment */
+	for (i = 0; i < VP9_REFS_PER_FRAME; i++) {
+		struct vp9_slot *ref = &vp9_slots[vp9_frame_slot[i]];
+		u32 rw = ref->width ? ref->width : width;
+		u32 rh = ref->height ? ref->height : height;
+
+		wr(hw, VP9D_MPP_REFINFO_DATA, rw);
+		wr(hw, VP9D_MPP_REFINFO_DATA, rh);
+		if (rw != width || rh != height)
+			scale_enable |= 1 << i;
+		wr(hw, VP9D_MPP_REFINFO_DATA, (rw << 14) / width);
+		wr(hw, VP9D_MPP_REFINFO_DATA, (rh << 14) / height);
+		/* MMU mode: the body offset is carried by the page table. */
+		wr(hw, VP9D_MPP_REFINFO_DATA, 0);
+	}
+	wr(hw, VP9D_MPP_REF_SCALE_ENBL, scale_enable);
+}
+
+/*
+ * vp9_loop_filter_frame_init().  VP9's filter table is 16 words, packing the
+ * four reference classes for one (segment, mode) pair per word - a great deal
+ * simpler than AV1's 192.
+ */
+#define VP9_MAX_LOOP_FILTER	63
+#define VP9_MAX_SEGMENTS	8
+
+static int vp9_clamp_lvl(int v)
+{
+	return clamp(v, 0, VP9_MAX_LOOP_FILTER);
+}
+
+static void vp9_config_loop_filter(struct aml_vdec_hw *hw, const u16 *pr)
+{
+	u8 lvl[VP9_MAX_SEGMENTS][4][2];
+	int filt = pr[VP9_RPM_FILTER_LEVEL] & 0x3f;
+	int scale = 1 << (filt >> 5);
+	bool delta_en = pr[VP9_RPM_MODE_REF_DELTA_ENABLED] & 1;
+	bool seg_en = pr[VP9_RPM_SEG_ENABLED] & 1;
+	bool seg_abs = pr[VP9_RPM_SEG_ABS_DELTA] & 1;
+	s8 ref_deltas[4], mode_deltas[2];
+	int seg, ref, mode, i;
+
+	for (i = 0; i < 4; i++)
+		ref_deltas[i] = (s8)(u8)pr[VP9_RPM_REF_DELTAS + i];
+	for (i = 0; i < 2; i++)
+		mode_deltas[i] = (s8)(u8)pr[VP9_RPM_MODE_DELTAS + i];
+
+	for (seg = 0; seg < VP9_MAX_SEGMENTS; seg++) {
+		int lvl_seg = filt;
+		u16 info = pr[VP9_RPM_SEG_LF_INFO + seg];
+
+		/* bit 15 feature enabled, bit 8 sign, bits 5:0 magnitude */
+		if (seg_en && (info & 0x8000)) {
+			int data = (info & 0x100) ? -(int)(info & 0x3f)
+						  : (int)(info & 0x3f);
+
+			lvl_seg = vp9_clamp_lvl(seg_abs ? data : filt + data);
+		}
+
+		if (!delta_en) {
+			memset(lvl[seg], lvl_seg, sizeof(lvl[seg]));
+			continue;
+		}
+		/* INTRA_FRAME has no mode delta. */
+		lvl[seg][0][0] = vp9_clamp_lvl(lvl_seg + ref_deltas[0] * scale);
+		lvl[seg][0][1] = lvl[seg][0][0];
+		for (ref = 1; ref < 4; ref++)
+			for (mode = 0; mode < 2; mode++)
+				lvl[seg][ref][mode] =
+					vp9_clamp_lvl(lvl_seg +
+						      ref_deltas[ref] * scale +
+						      mode_deltas[mode] * scale);
+	}
+
+	for (i = 0; i < 16; i++) {
+		u32 level;
+		int s = i >> 1, m = i & 1;
+
+		level = ((lvl[s][3][m] & 0x3f) << 24) |
+			((lvl[s][2][m] & 0x3f) << 16) |
+			((lvl[s][1][m] & 0x3f) << 8) |
+			 (lvl[s][0][m] & 0x3f);
+		if (!filt)
+			level = 0;
+		wr(hw, HEVC_DBLK_CFGA, level);
+	}
+}
+
+/* vp9_loop_filter_init(): the sharpness-derived threshold table, written once
+ * per stream unless sharpness changes.  Kept per frame here because it is 32
+ * register writes and the sharpness is only known after the parse.
+ */
+static void vp9_config_lf_thresholds(struct aml_vdec_hw *hw, u32 sharpness)
+{
+	u8 mblim[VP9_MAX_LOOP_FILTER + 1], lim[VP9_MAX_LOOP_FILTER + 1];
+	int lvl, i;
+
+	for (lvl = 0; lvl <= VP9_MAX_LOOP_FILTER; lvl++) {
+		int inside = lvl >> ((sharpness > 0) + (sharpness > 4));
+
+		if (sharpness > 0 && inside > 9 - (int)sharpness)
+			inside = 9 - sharpness;
+		if (inside < 1)
+			inside = 1;
+		lim[lvl] = inside;
+		mblim[lvl] = 2 * (lvl + 2) + inside;
+	}
+
+	for (i = 0; i < 32; i++) {
+		u32 thr = ((lim[i * 2 + 1] & 0x3f) << 8) | mblim[i * 2 + 1];
+
+		thr = (thr << 16) | ((lim[i * 2] & 0x3f) << 8) | mblim[i * 2];
+		wr(hw, HEVC_DBLK_CFG9, thr);
+	}
+}
+
+int aml_vp9_config_picture(struct aml_vdec_hw *hw)
+{
+	const u16 *raw;
+	u16 pr[VP9_RPM_COUNT];
+	u32 width, height, lcu_total, uv_size, uv_h;
+	u32 data32, body, header;
+	dma_addr_t dw_y, dw_c;
+	bool inter, intra_only, use_prev_mvs;
+	int i, j, ret;
+
+	if (!vp9_ws.side_vaddr)
+		return -EINVAL;
+
+	raw = vp9_ws.side_vaddr + (vp9_ws.rpm - vp9_ws.side_paddr);
+	for (i = 0; i < VP9_RPM_COUNT; i += 4)
+		for (j = 0; j < 4; j++)
+			pr[i + j] = raw[i + 3 - j];
+
+	width = pr[VP9_RPM_WIDTH];
+	height = pr[VP9_RPM_HEIGHT];
+
+	/*
+	 * The MMU page table, the compressed body and the picture slots are
+	 * all sized from these.  If the microcode never actually parsed a
+	 * header they hold whatever was left in the RPM, and building a page
+	 * table from that points the hardware at memory it does not own -
+	 * which resets the board outright with no oops to read afterwards.
+	 */
+	if (width < VP9_MIN_DIM || height < VP9_MIN_DIM ||
+	    width > VP9_MAX_DIM || height > VP9_MAX_DIM) {
+		dev_err(hw->dev, "vp9: implausible picture size %ux%u, refusing\n",
+			width, height);
+		return -EINVAL;
+	}
+	/*
+	 * Profiles 0 and 1 code no bit depth - they are 8 bit - and the
+	 * microcode leaves the RPM word alone for them, so it still says 10
+	 * after a profile 2 stream.  Only trust it for profiles 2 and 3.
+	 */
+	vp9_ten_bit = false;
+	if (pr[VP9_RPM_PROFILE] >= 2) {
+		if (pr[VP9_RPM_BIT_DEPTH] != 10) {
+			dev_err(hw->dev, "vp9: bit depth %u not supported\n",
+				pr[VP9_RPM_BIT_DEPTH]);
+			return -EINVAL;
+		}
+		vp9_ten_bit = true;
+	}
+	/*
+	 * Only profiles 0 and 2 - 4:2:0, 8 or 10 bit.  Anything else parses far enough to
+	 * look plausible and then decodes to nothing, which reads like a
+	 * driver bug; say so instead.  ffmpeg picks profile 1 for a source
+	 * that is not already 4:2:0, so this is easy to hit by leaving
+	 * -pix_fmt yuv420p off an encode.
+	 */
+	if (pr[VP9_RPM_PROFILE] != 0 && pr[VP9_RPM_PROFILE] != 2) {
+		dev_err_once(hw->dev,
+			     "vp9: profile %u is not supported, only 0 and 2 (4:2:0)\n",
+			     pr[VP9_RPM_PROFILE]);
+		return -EINVAL;
+	}
+
+	/*
+	 * show_existing_frame carries no picture data: it asks for a reference
+	 * slot to be output again.  Decoding it as a real frame would write
+	 * over a live slot.
+	 */
+	if (pr[VP9_RPM_SHOW_EXISTING_FRAME] & 1) {
+		u32 idx = pr[VP9_RPM_FRAME_TO_SHOW_IDX] & 7;
+
+		vp9_out_slot = vp9_ref_slot[idx];
+		vp9_pending_refresh = 0;
+		dev_dbg(hw->dev, "vp9: show existing frame, slot %d\n",
+			vp9_out_slot);
+		return -EAGAIN;
+	}
+
+	intra_only = (pr[VP9_RPM_SHOW_FRAME] & 1) ? false :
+		     (pr[VP9_RPM_INTRA_ONLY] & 1);
+	inter = pr[VP9_RPM_FRAME_TYPE] != VP9_KEY_FRAME && !intra_only;
+
+	/*
+	 * A stream that starts on an inter frame has nothing to reference.
+	 * The reference refuses those outright rather than decoding against
+	 * uninitialised slots, and so does this.
+	 */
+	vp9_cur_kf = pr[VP9_RPM_FRAME_TYPE] == VP9_KEY_FRAME;
+	if (vp9_cur_kf) {
+		vp9_have_key = true;
+	} else if (!vp9_have_key) {
+		dev_dbg(hw->dev, "vp9: no key frame yet, skipping\n");
+		return -EAGAIN;
+	}
+
+	lcu_total = DIV_ROUND_UP(width, 64) * DIV_ROUND_UP(height, 64);
+	uv_size = lcu_total * 64 * 64 / 2;
+	uv_h = (uv_size + 0xffff) >> 16;
+
+	vp9_last_width = width;
+	vp9_last_height = height;
+	vp9_cur_show = pr[VP9_RPM_SHOW_FRAME] & 1;
+	vp9_pending_refresh = pr[VP9_RPM_REFRESH_FRAME_FLAGS] & 0xff;
+	if (!inter && pr[VP9_RPM_FRAME_TYPE] == VP9_KEY_FRAME)
+		vp9_pending_refresh = 0xff;
+
+	ret = vp9_alloc_slots(hw, width, height);
+	if (ret)
+		return ret;
+
+	/*
+	 * The picture address table has to be written after the slots exist:
+	 * filled during bring-up it would name physical address 0 for every
+	 * entry, which a key frame never notices and an inter frame reads its
+	 * references from.
+	 */
+	vp9_config_pic_list(hw);
+
+	/* A key frame resets the reference state; otherwise take a slot no
+	 * reference names, so decoding cannot destroy a picture still needed.
+	 */
+	if (!inter) {
+		vp9_cur_slot = 0;
+		for (i = 0; i < VP9_REF_FRAMES; i++)
+			vp9_ref_slot[i] = 0;
+	} else {
+		for (i = 0; i < VP9_SLOTS; i++) {
+			int cand = (vp9_cur_slot + 1 + i) % VP9_SLOTS;
+
+			for (j = 0; j < VP9_REF_FRAMES; j++)
+				if (vp9_ref_slot[j] == cand)
+					break;
+			if (j == VP9_REF_FRAMES) {
+				vp9_prev_slot = vp9_cur_slot;
+				vp9_cur_slot = cand;
+				break;
+			}
+		}
+		if (i == VP9_SLOTS) {
+			dev_err(hw->dev, "vp9: no free picture slot\n");
+			return -ENOBUFS;
+		}
+	}
+
+	/*
+	 * ref_info packs the three references most-significant first, four
+	 * bits each: the top three are the reference-map index, the bottom one
+	 * is that reference's sign bias.
+	 */
+	for (i = 0; i < VP9_REFS_PER_FRAME; i++) {
+		u32 shift = (VP9_REFS_PER_FRAME - i - 1) * 4;
+		u32 ref = (pr[VP9_RPM_REF_INFO] >> (shift + 1)) & 7;
+
+		vp9_frame_slot[i] = inter ? vp9_ref_slot[ref] : vp9_cur_slot;
+	}
+
+	vp9_slots[vp9_cur_slot].width = width;
+	vp9_slots[vp9_cur_slot].height = height;
+	vp9_slots[vp9_cur_slot].intra = !inter;
+	vp9_slots[vp9_cur_slot].show = vp9_cur_show;
+
+	ret = vp9_fill_mmu_map(hw);
+	if (ret)
+		return ret;
+	wr(hw, HEVC_ASSIST_MMU_MAP_ADDR, vp9_ws.mmu_map);
+	wr(hw, HEVC_SAO_MMU_DMA_CTRL, vp9_ws.mmu_map);
+
+	wr(hw, HEVC_PARSER_PICTURE_SIZE, (height << 16) | width);
+
+	/* ---- config_pic_size() ---- */
+	body = vp9_comp_body_size(width, height);
+	header = vp9_comp_header_size(width, height);
+	data32 = read_dos_reg(hw, HEVC_SAO_CTRL5);
+	if (vp9_ten_bit)
+		data32 &= ~BIT(9);
+	else
+		data32 |= BIT(9);	/* 8 bit, memory saving */
+	data32 |= BIT(10);		/* use HEVC_CM_HEADER_START_ADDR */
+	data32 &= ~(0xff << 16);	/* no down-scale on the double write */
+	wr(hw, HEVC_SAO_CTRL5, data32);
+	wr(hw, HEVCD_MPP_DECOMP_CTL1, BIT(4));	/* paged_mem_mode */
+	wr(hw, HEVC_CM_BODY_LENGTH, body);
+	wr(hw, HEVC_CM_HEADER_OFFSET, body);
+	wr(hw, HEVC_CM_HEADER_LENGTH, header);
+	wr(hw, HEVC_CM_BODY_START_ADDR, vp9_slots[vp9_cur_slot].body_p);
+	wr(hw, HEVC_CM_HEADER_START_ADDR, vp9_slots[vp9_cur_slot].hdr_p);
+
+	/* ---- motion compensation and prediction ---- */
+	wr(hw, HEVCD_MCRCC_CTL1, 0x2);		/* reset mcrcc */
+	if (inter) {
+		vp9_config_mc_buffer(hw, width, height);
+		wr(hw, HEVCD_MCRCC_CTL1, 0xff0);	/* progressive mode */
+	} else {
+		wr(hw, HEVCD_MCRCC_CTL1, 0x0);
+	}
+
+	wr(hw, HEVC_MPRED_CTRL3, 0x24122412);
+	wr(hw, HEVC_MPRED_ABV_START_ADDR, vp9_ws.mpred_above);
+	/*
+	 * The reference only programs the MV write address for an inter
+	 * frame, leaving whatever the previous stream left there for a key
+	 * frame.  Program it always: a key frame writes no motion vectors, but
+	 * naming a buffer it owns is strictly safer than naming a stale one.
+	 */
+	wr(hw, HEVC_MPRED_MV_WR_START_ADDR, vp9_slots[vp9_cur_slot].mv_p);
+	wr(hw, HEVC_MPRED_MV_WPTR, vp9_slots[vp9_cur_slot].mv_p);
+
+	data32 = read_dos_reg(hw, HEVC_MPRED_CTRL4);
+	data32 &= ~BIT(6);			/* use_prev_frame_mvs */
+	use_prev_mvs = inter && vp9_slots[vp9_prev_slot].width == width &&
+		       vp9_slots[vp9_prev_slot].height == height &&
+		       !vp9_slots[vp9_prev_slot].intra &&
+		       vp9_slots[vp9_prev_slot].show &&
+		       !(pr[VP9_RPM_ERROR_RESILIENT] & 1);
+	if (use_prev_mvs) {
+		data32 |= BIT(6);
+		wr(hw, HEVC_MPRED_MV_RD_START_ADDR,
+		   vp9_slots[vp9_prev_slot].mv_p);
+		wr(hw, HEVC_MPRED_MV_RPTR, vp9_slots[vp9_prev_slot].mv_p);
+		wr(hw, HEVC_MPRED_MV_RD_END_ADDR,
+		   vp9_slots[vp9_prev_slot].mv_p + vp9_slot_mv_size);
+	}
+	wr(hw, HEVC_MPRED_CTRL4, data32);
+
+	/* ---- config_sao_hw() ---- */
+	if (vp9_dw_target_y) {
+		if ((size_t)width * height * 3 / 2 > vp9_dw_target_size) {
+			dev_err(hw->dev,
+				"vp9: %ux%u does not fit the %zu byte capture buffer\n",
+				width, height, vp9_dw_target_size);
+			return -EINVAL;
+		}
+		dw_y = vp9_dw_target_y;
+		dw_c = vp9_dw_target_c;
+	} else {
+		dw_y = vp9_slots[vp9_cur_slot].dw_p;
+		dw_c = dw_y + width * height;
+	}
+	wr(hw, HEVC_SAO_Y_START_ADDR, dw_y);
+	wr(hw, HEVC_SAO_Y_WPTR, dw_y);
+	wr(hw, HEVC_SAO_C_START_ADDR, dw_c);
+	wr(hw, HEVC_SAO_C_WPTR, dw_c);
+	wr(hw, HEVC_SAO_Y_LENGTH, (uv_h << 16) << 1);
+	wr(hw, HEVC_SAO_C_LENGTH, uv_h << 16);
+
+	data32 = read_dos_reg(hw, HEVC_SAO_CTRL1);
+	data32 &= ~(3 << 14);
+	data32 |= (2 << 14);		/* line align 64 */
+	data32 &= ~(3 << 12);		/* linear memory map */
+	data32 &= ~0xff0;
+	data32 |= (HEVC_CONFIG_LITTLE_ENDIAN >> 8) & 0xfff;
+	/* bit0 disables compression, bit1 disables double write; want both. */
+	data32 &= ~0x3;
+	data32 |= BIT(8);		/* NV12 */
+	wr(hw, HEVC_SAO_CTRL1, data32);
+
+	data32 = read_dos_reg(hw, HEVCD_IPP_AXIIF_CONFIG);
+	data32 &= ~0x30;		/* linear */
+	data32 &= ~0xf;
+	data32 |= HEVC_CONFIG_LITTLE_ENDIAN & 0xf;
+	data32 &= ~BIT(12);		/* NV12 */
+	data32 &= ~(3 << 8);
+	data32 |= (2 << 8);		/* line align 64 */
+	wr(hw, HEVCD_IPP_AXIIF_CONFIG, data32);
+
+	/* ---- loop filter ---- */
+	vp9_config_lf_thresholds(hw, pr[VP9_RPM_SHARPNESS_LEVEL] & 7);
+	/* 1st and 2nd write both enabled, VP9 video format. */
+	data32 = (0x3 << 14) | (0x3 << 12) | (0x3 << 10) | (0x3 << 8) | BIT(0);
+	wr(hw, HEVC_DBLK_CFGB, data32);
+	vp9_config_loop_filter(hw, pr);
+	data32 = read_dos_reg(hw, HEVC_DBLK_CFGB);
+	if (width >= 1280)
+		data32 |= BIT(4);	/* dblk pipeline mode */
+	else
+		data32 &= ~(3 << 4);
+	wr(hw, HEVC_DBLK_CFGB, data32);
+
+	dev_dbg(hw->dev,
+		"vp9: pic %ux%u %s show %u slot %d refresh %02x refs %d/%d/%d filt %u sharp %u\n",
+		width, height, inter ? "inter" : (intra_only ? "intra" : "key"),
+		vp9_cur_show, vp9_cur_slot, vp9_pending_refresh,
+		vp9_frame_slot[0], vp9_frame_slot[1], vp9_frame_slot[2],
+		pr[VP9_RPM_FILTER_LEVEL], pr[VP9_RPM_SHARPNESS_LEVEL]);
+	return 0;
+}
+
+/* The picture is finished: rotate the reference slots the way
+ * refresh_frame_flags asks and hand the picture to the display.
+ */
+void aml_vp9_frame_done(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	for (i = 0; i < VP9_REF_FRAMES; i++)
+		if (vp9_pending_refresh & (1 << i))
+			vp9_ref_slot[i] = vp9_cur_slot;
+
+	if (vp9_cur_show)
+		vp9_out_slot = vp9_cur_slot;
+	vp9_prev_slot = vp9_cur_slot;
+	/* The next frame's adaptation needs this frame's type. */
+}
+
+void aml_vp9_dump_output(struct aml_vdec_hw *hw)
+{
+	const u8 *body = vp9_slots[vp9_cur_slot].body_v;
+	const u8 *hdr = vp9_slots[vp9_cur_slot].hdr_v;
+	size_t i, nz = 0, hdr_nz = 0;
+
+	if (!body || !hdr)
+		return;
+	for (i = 0; i < vp9_slot_body_size; i++)
+		if (body[i])
+			nz++;
+	for (i = 0; i < vp9_slot_hdr_size; i++)
+		if (hdr[i])
+			hdr_nz++;
+
+	dev_info(hw->dev,
+		 "vp9: body %zu/%zu bytes non-zero, header %zu/%zu non-zero\n",
+		 nz, vp9_slot_body_size, hdr_nz, vp9_slot_hdr_size);
+	dev_info(hw->dev, "vp9: body[0..15] %*ph\n", 16, body);
+	dev_info(hw->dev, "vp9: hdr [0..15] %*ph\n", 16, hdr);
+}
+
+int aml_vp9_save_nv12(struct aml_vdec_hw *hw, const char *path, bool append)
+{
+	const u8 *y;
+	size_t i, nz = 0, len;
+	struct file *f;
+	loff_t pos = 0;
+	int slot = vp9_out_slot;
+
+	if (slot < 0)
+		return -EAGAIN;
+	vp9_out_slot = -1;
+	y = vp9_slots[slot].dw_v;
+	if (!y)
+		return -ENODEV;
+	dma_sync_single_for_cpu(hw->dev, vp9_slots[slot].dw_p,
+				vp9_slot_dw_size, DMA_FROM_DEVICE);
+
+	len = (size_t)vp9_slots[slot].width * vp9_slots[slot].height * 3 / 2;
+	for (i = 0; i < len; i++)
+		if (y[i])
+			nz++;
+	dev_info(hw->dev, "vp9: nv12 %zu/%zu non-zero, Y[0..15] %*ph\n",
+		 nz, len, 16, y);
+
+	f = filp_open(path, O_WRONLY | O_CREAT |
+		      (append ? O_APPEND : O_TRUNC), 0644);
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+	if (append)
+		pos = i_size_read(file_inode(f));
+	kernel_write(f, y, len, &pos);
+	filp_close(f, NULL);
+	dev_info(hw->dev, "vp9: wrote %zu bytes of NV12 to %s\n", len, path);
+	return 0;
+}
+
+/* ------------------------------------------------------------------------
+ * IVF test harness
+ *
+ * The decoder is frame based and start-code free, so it wants exactly one
+ * frame in front of the shifter at a time.  An IVF file is the easiest way to
+ * carry a sequence of them: a 32-byte file header, then a 12-byte length and
+ * timestamp in front of each frame.
+ * ------------------------------------------------------------------------
+ */
+
+static u8 *vp9_ivf;
+static size_t vp9_ivf_size;
+static size_t vp9_ivf_pos;
+
+void aml_vp9_ivf_release(void)
+{
+	kfree(vp9_ivf);
+	vp9_ivf = NULL;
+	vp9_ivf_size = 0;
+	vp9_ivf_pos = 0;
+}
+
+int aml_vp9_ivf_load(struct aml_vdec_hw *hw, const char *name)
+{
+	const struct firmware *fw;
+	int ret;
+
+	aml_vp9_ivf_release();
+	ret = request_firmware(&fw, name, hw->dev);
+	if (ret) {
+		dev_err(hw->dev, "vp9: %s not found (%d)\n", name, ret);
+		return ret;
+	}
+	vp9_ivf = kmemdup(fw->data, fw->size, GFP_KERNEL);
+	vp9_ivf_size = fw->size;
+	release_firmware(fw);
+	if (!vp9_ivf)
+		return -ENOMEM;
+
+	if (vp9_ivf_size > 32 && !memcmp(vp9_ivf, "DKIF", 4)) {
+		vp9_ivf_pos = get_unaligned_le16(vp9_ivf + 6);
+		if (vp9_ivf_pos < 32 || vp9_ivf_pos > vp9_ivf_size)
+			vp9_ivf_pos = 32;
+	} else {
+		/* A bare frame, which is what the first bring-up used. */
+		vp9_ivf_pos = 0;
+	}
+	dev_info(hw->dev, "vp9: loaded %s, %zu bytes, first frame at %zu\n",
+		 name, vp9_ivf_size, vp9_ivf_pos);
+	return 0;
+}
+
+/* Feed the next frame.  -ENODATA once the file is exhausted. */
+int aml_vp9_ivf_feed_next(struct aml_vdec_hw *hw)
+{
+	u32 len;
+
+	if (!vp9_ivf)
+		return -ENODEV;
+	if (!vp9_ivf_pos && vp9_ivf_size) {
+		/* Bare frame: the whole file is one frame. */
+		vp9_ivf_pos = vp9_ivf_size;
+		return aml_vp9_feed(hw, vp9_ivf, vp9_ivf_size);
+	}
+	if (vp9_ivf_pos + 12 > vp9_ivf_size)
+		return -ENODATA;
+	len = get_unaligned_le32(vp9_ivf + vp9_ivf_pos);
+	vp9_ivf_pos += 12;
+	if (!len || vp9_ivf_pos + len > vp9_ivf_size)
+		return -ENODATA;
+	vp9_ivf_pos += len;
+	return aml_vp9_feed(hw, vp9_ivf + vp9_ivf_pos - len, len);
+}
+
+/*
+ * The microcode asks the host to adapt the entropy context by putting 0xfd in
+ * the low byte of VP9_ADAPT_PROB_REG, with the frame context it used in the
+ * next byte up.  Fold the counts it collected into that context, leave the
+ * result where the microcode will read it, and clear the request.
+ *
+ * Skipping this is not cosmetic: the entropy context then diverges from the
+ * encoder's after the first adapting frame and every later picture decodes
+ * wrong.  A stream encoded -error-resilient 1 -frame-parallel 1 never asks.
+ */
+bool aml_vp9_check_adapt(struct aml_vdec_hw *hw)
+{
+	u32 v = read_dos_reg(hw, VP9_ADAPT_PROB_REG);
+
+	if ((v & 0xff) != 0xfd)
+		return false;
+
+	/*
+	 * Backward adaptation is refused at request time, so the microcode
+	 * should never ask.  Release it rather than letting it time out.
+	 */
+	dev_warn_once(hw->dev, "vp9: unexpected probability adaptation request\n");
+	wr(hw, VP9_ADAPT_PROB_REG, 0);
+	return true;
+}
+
+/* ------------------------------------------------------------------------
+ * V4L2 stateless decoder
+ *
+ * The microcode parses the frame header itself, so the frame control is only
+ * consulted for the things the *host* has to own: which frame context the
+ * microcode is about to load, and whether it has to be saved afterwards.
+ *
+ * That ownership is the whole reason this glue is more than a copy of the AV1
+ * one.  The microcode never writes the probability buffer - it only reads it,
+ * once per frame, because it halts itself when a frame is done - so the driver
+ * keeps the four frame contexts, applies the forward updates userspace parsed
+ * out of the compressed header, and writes the result back where the microcode
+ * will look.
+ * ------------------------------------------------------------------------
+ */
+
+struct aml_vp9_ctx {
+	struct aml_vdec_ctx *v4l2_ctx;
+	struct aml_vdec_hw *hw;
+	bool ucode_loaded;
+	bool started;
+	bool have_picture;
+	u32 rounds;
+
+	struct v4l2_vp9_frame_context fctx[4];
+	struct v4l2_vp9_frame_context cur_probs;
+	u8 fctx_idx;
+	bool refresh_ctx;
+};
+
+static void *vp9_get_ctrl(struct aml_vdec_ctx *ctx, u32 id)
+{
+	struct v4l2_ctrl *c = v4l2_ctrl_find(&ctx->ctrl_handler, id);
+
+	return c ? c->p_cur.p : NULL;
+}
+
+/*
+ * Put the context the microcode is about to load where it will look, and
+ * remember what it will be afterwards.  The microcode applies the compressed
+ * header's forward updates itself, so the buffer must hold the context as it
+ * was *before* them; the updated copy is only needed if this frame refreshes
+ * its slot.
+ */
+static void vp9_prepare_frame_ctx(struct aml_vp9_ctx *vp9,
+				  const struct v4l2_ctrl_vp9_frame *dec,
+				  const struct v4l2_ctrl_vp9_compressed_hdr *hdr)
+{
+	u8 *prob;
+	int i;
+
+	if (!vp9_ws.side_vaddr)
+		return;
+	prob = vp9_ws.side_vaddr + (vp9_ws.prob - vp9_ws.side_paddr);
+
+	vp9->fctx_idx = v4l2_vp9_reset_frame_ctx(dec, vp9->fctx);
+	vp9->refresh_ctx = !!(dec->flags & V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX);
+
+	/*
+	 * The reference driver zeroes this buffer once and then never writes
+	 * it except during adaptation - the microcode loads and maintains the
+	 * four frame contexts itself.  We repack them from our own copies on
+	 * every frame, which would clobber whatever it keeps there.
+	 */
+	for (i = 0; i < 4; i++)
+		aml_vp9_pack_probs(prob + i * 0x1000, &vp9->fctx[i]);
+
+	vp9->cur_probs = vp9->fctx[vp9->fctx_idx];
+	if (hdr)
+		v4l2_vp9_fw_update_probs(&vp9->cur_probs, hdr, dec);
+}
+
+static void vp9_finish_frame_ctx(struct aml_vp9_ctx *vp9)
+{
+	if (vp9->refresh_ctx)
+		vp9->fctx[vp9->fctx_idx] = vp9->cur_probs;
+}
+
+/* Where the double-write unit should put this picture: straight into the
+ * CAPTURE buffer when its geometry allows it.
+ */
+static void vp9_set_dw_target(struct aml_vdec_ctx *ctx)
+{
+	struct v4l2_pix_format_mplane *pf = &ctx->pix_fmt[AML_FMT_DST];
+	struct vb2_v4l2_buffer *dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	struct vb2_buffer *vb;
+
+	vp9_dw_target_y = 0;
+	vp9_dw_target_c = 0;
+	vp9_dw_target_size = 0;
+	if (!dst)
+		return;
+	vb = &dst->vb2_buf;
+	if (pf->plane_fmt[0].bytesperline != pf->width)
+		return;
+
+	vp9_dw_target_y = vb2_dma_contig_plane_dma_addr(vb, 0);
+	if (!vp9_dw_target_y)
+		return;
+	if (vb->num_planes >= 2) {
+		vp9_dw_target_c = vb2_dma_contig_plane_dma_addr(vb, 1);
+		vp9_dw_target_size = vb2_plane_size(vb, 0) +
+				     vb2_plane_size(vb, 1);
+		if (!vp9_dw_target_c) {
+			vp9_dw_target_y = 0;
+			return;
+		}
+	} else {
+		vp9_dw_target_c = vp9_dw_target_y +
+				  (dma_addr_t)pf->width * pf->height;
+		vp9_dw_target_size = vb2_plane_size(vb, 0);
+	}
+}
+
+static void vp9_copy_out(struct aml_vp9_ctx *vp9, struct vb2_v4l2_buffer *dst)
+{
+	struct v4l2_pix_format_mplane *pf =
+		&vp9->v4l2_ctx->pix_fmt[AML_FMT_DST];
+	struct vb2_buffer *vb = &dst->vb2_buf;
+	u32 dst_stride = pf->plane_fmt[0].bytesperline ? : vp9_last_width;
+	u32 dst_h = pf->height ? : vp9_last_height;
+	int slot = vp9_out_slot;
+	const u8 *src;
+	u8 *y, *c;
+	u32 row, w, h;
+
+	if (slot < 0)
+		return;
+	vp9_out_slot = -1;
+
+	if (vp9_dw_target_y) {
+		if (vb->num_planes >= 2) {
+			vb2_set_plane_payload(vb, 0, dst_stride * dst_h);
+			vb2_set_plane_payload(vb, 1, dst_stride * dst_h / 2);
+		} else {
+			vb2_set_plane_payload(vb, 0,
+					      dst_stride * dst_h * 3 / 2);
+		}
+		vp9->have_picture = true;
+		return;
+	}
+
+	src = vp9_slots[slot].dw_v;
+	if (!src)
+		return;
+	dma_sync_single_for_cpu(vp9->hw->dev, vp9_slots[slot].dw_p,
+				vp9_slot_dw_size, DMA_FROM_DEVICE);
+
+	w = vp9_slots[slot].width;
+	h = vp9_slots[slot].height;
+	y = vb2_plane_vaddr(vb, 0);
+	if (!y)
+		return;
+	c = vb->num_planes >= 2 ? vb2_plane_vaddr(vb, 1) :
+				  y + (size_t)dst_stride * dst_h;
+	if (!c)
+		return;
+
+	for (row = 0; row < h; row++)
+		memcpy(y + (size_t)row * dst_stride, src + (size_t)row * w, w);
+	for (row = 0; row < h / 2; row++)
+		memcpy(c + (size_t)row * dst_stride,
+		       src + (size_t)(h + row) * w, w);
+	aml_vdec_dst_cpu_written(vp9->hw->dev, vb);
+
+	if (vb->num_planes >= 2) {
+		vb2_set_plane_payload(vb, 0, dst_stride * dst_h);
+		vb2_set_plane_payload(vb, 1, dst_stride * dst_h / 2);
+	} else {
+		vb2_set_plane_payload(vb, 0, dst_stride * dst_h * 3 / 2);
+	}
+	vp9->have_picture = true;
+}
+
+static void vp9_finish(struct aml_vp9_ctx *vp9, enum vb2_buffer_state state)
+{
+	struct aml_vdec_ctx *ctx = vp9->v4l2_ctx;
+	struct vb2_v4l2_buffer *buf;
+	unsigned int i;
+
+	if (!vp9->have_picture) {
+		buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+		if (buf)
+			for (i = 0; i < buf->vb2_buf.num_planes; i++)
+				vb2_set_plane_payload(&buf->vb2_buf, i, 0);
+	}
+
+	buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (buf && buf->vb2_buf.req_obj.req)
+		v4l2_ctrl_request_complete(buf->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
+
+	vp9_finish_frame_ctx(vp9);
+
+	ctx->int_cond = 1;
+	ctx->job_finished = true;
+	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev_dec, ctx->m2m_ctx,
+					 state);
+	wake_up(&ctx->queue);
+}
+
+static irqreturn_t vp9_irq_thread(int irq, void *priv)
+{
+	struct aml_vp9_ctx *vp9 = priv;
+	struct aml_vdec_ctx *ctx = vp9->v4l2_ctx;
+	struct aml_vdec_hw *hw = vp9->hw;
+	u32 st = hw->hevc_irq_status & 0xff;
+	u32 next = VP9_10B_DECODE_SLICE;
+
+	if (++vp9->rounds > 256) {
+		dev_err(hw->dev, "vp9: runaway decode, giving up\n");
+		vp9_finish(vp9, VB2_BUF_STATE_ERROR);
+		return IRQ_HANDLED;
+	}
+
+	aml_vp9_check_adapt(hw);
+
+	switch (st) {
+	case VP9_HEAD_PARSER_DONE: {
+		int cfg = aml_vp9_config_picture(hw);
+
+		if (cfg == -EAGAIN) {
+			/* show_existing_frame, or nothing to decode yet. */
+			struct vb2_v4l2_buffer *dst =
+				v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+
+			if (dst)
+				vp9_copy_out(vp9, dst);
+			next = VP9_10B_DISCARD_NAL;
+		} else if (cfg) {
+			dev_err(hw->dev, "vp9: picture config failed (%d)\n",
+				cfg);
+			/* As in av1.c: never leave the core pointed at freed slots */
+			regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
+			regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
+			aml_vp9_teardown(hw);
+			vp9->started = false;
+			vp9_finish(vp9, VB2_BUF_STATE_ERROR);
+			return IRQ_HANDLED;
+		}
+		break;
+	}
+	case VP9_DECPIC_DATA_DONE: {
+		struct vb2_v4l2_buffer *dst =
+			v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+
+		aml_vp9_frame_done(hw);
+		if (dst)
+			vp9_copy_out(vp9, dst);
+		vp9_finish(vp9, VB2_BUF_STATE_DONE);
+		return IRQ_HANDLED;
+	}
+	case VP9_NAL_DECODE_DONE:
+	case HEVC_ACTION_DONE:
+	case VP9_DECODE_BUFEMPTY:
+	case VP9_SEARCH_BUFEMPTY:
+	case VP9_EOS:
+		vp9_finish(vp9, VB2_BUF_STATE_DONE);
+		return IRQ_HANDLED;
+	default:
+		dev_dbg(hw->dev, "vp9: unhandled status %02x\n", st);
+		break;
+	}
+
+	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
+	regmap_write(hw->map[DOS_BUS], HEVC_DEC_STATUS_REG, next);
+	return IRQ_HANDLED;
+}
+
+/*
+ * Backward adaptation (refresh_frame_context set, frame_parallel_decoding_mode
+ * and error_resilient_mode clear) needs a secure-world call this TEE does not
+ * have.  Such a stream does not just decode wrong: the core stops answering
+ * after the first adapted frame and stays that way until a reboot.  Refuse it
+ * up front so the client falls back to software instead.
+ */
+
+int aml_vp9_init(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_vp9_ctx *vp9;
+	int i;
+
+	if (!hw)
+		return -ENODEV;
+
+	vp9 = kzalloc_obj(*vp9);
+	if (!vp9)
+		return -ENOMEM;
+
+	vp9->v4l2_ctx = ctx;
+	vp9->hw = hw;
+	for (i = 0; i < 4; i++)
+		vp9->fctx[i] = v4l2_vp9_default_probs;
+
+	/*
+	 * The HEVC core takes one client at a time.  Both this codec and AV1
+	 * keep their whole decode state in file-scope variables (workspace,
+	 * slot table, current-slot index) and hang their interrupt handler off
+	 * the single hw->hevc_priv / hevc_irq_thread_fn pair, so a second
+	 * context does not just fail - it silently overwrites the first one's
+	 * handler and scribbles on its slots.  What that looked like from
+	 * userspace was a page with two VP9 videos wedging the decoder, every
+	 * context (H.264 included) going flat green, tasks stuck in
+	 * v4l2_release and finally a module unload that never returned.
+	 *
+	 * Refuse the second one instead; the client falls back to software.
+	 */
+	if (cmpxchg(&hw->hevc_priv, NULL, vp9)) {
+		dev_info(&ctx->dev->plat_dev->dev,
+			 "vp9: HEVC core already in use, refusing second instance\n");
+		kfree(vp9);
+		return -EBUSY;
+	}
+
+	ctx->codec_priv = vp9;
+	hw->hevc_irq_thread_fn = vp9_irq_thread;
+	return 0;
+}
+
+void aml_vp9_exit(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_vp9_ctx *vp9 = ctx->codec_priv;
+
+	if (!vp9)
+		return;
+
+	vp9->hw->hevc_irq_thread_fn = NULL;
+	vp9->hw->hevc_priv = NULL;
+	if (vp9->started) {
+		regmap_write(vp9->hw->map[DOS_BUS], HEVC_MPSR, 0);
+		aml_vp9_teardown(vp9->hw);
+		/*
+		 * Deliberately not hvdec_disable(): powering the HEVC core
+		 * down here leaves it in a state the next context's bring-up
+		 * does not recover from, and every frame of the *second*
+		 * decode session on this core then times out - whichever
+		 * codec it is.  The domain is left up until the module is
+		 * unloaded.
+		 */
+	}
+	kfree(vp9);
+	ctx->codec_priv = NULL;
+}
+
+int aml_vp9_dec_run(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_vp9_ctx *vp9 = ctx->codec_priv;
+	struct aml_vdec_hw *hw = vp9->hw;
+	const struct v4l2_ctrl_vp9_frame *dec;
+	const struct v4l2_ctrl_vp9_compressed_hdr *hdr;
+	struct vb2_v4l2_buffer *src;
+	struct vb2_buffer *vb;
+	int ret;
+
+	src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (!src)
+		return -EINVAL;
+	vb = &src->vb2_buf;
+
+	dec = vp9_get_ctrl(ctx, V4L2_CID_STATELESS_VP9_FRAME);
+	if (!dec) {
+		dev_err_once(hw->dev, "vp9: no frame control\n");
+		return -EINVAL;
+	}
+	hdr = vp9_get_ctrl(ctx, V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
+
+	if ((dec->flags & V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX) &&
+	    !(dec->flags & (V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE |
+			    V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT))) {
+		dev_warn_once(hw->dev,
+			      "vp9: stream needs backward adaptation, not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = hvdec_enable(hw);
+	if (ret)
+		return ret;
+	dos_enable_hevc(hw);
+
+	if (!vp9->ucode_loaded) {
+		/*
+		 * A 10-bit stream leaves the core decoding the next 8-bit one
+		 * to garbage, every frame, until something cycles its memories
+		 * - the same thing a VP9/AV1 switch needs.  vp9_ten_bit still
+		 * holds the last stream's depth here.
+		 */
+		if (vp9_ten_bit)
+			hw->hevc_dirty = true;
+		vp9_ten_bit = false;
+		hvdec_switch_codec(hw, CODEC_TYPE_VP9);
+
+		/*
+		 * Halts the AMRISC first: the other codec on this core may
+		 * still be running - VP9 and AV1 share it - and loading over a
+		 * running microcode leaves the core timing out every frame.
+		 */
+		ret = hevc_load_fw(hw, CODEC_TYPE_VP9, VP9_FW_FORMAT_MMU, VP9_FW_CORE_HEVC, "vp9");
+		if (ret) {
+			hvdec_disable(hw);
+			return ret;
+		}
+		vp9->ucode_loaded = true;
+	}
+
+	if (!vp9->started) {
+		ret = aml_vp9_bringup(hw, ctx->pix_fmt[AML_FMT_SRC].width,
+				      ctx->pix_fmt[AML_FMT_SRC].height);
+		if (ret) {
+			hvdec_disable(hw);
+			return ret;
+		}
+	}
+
+	vp9_prepare_frame_ctx(vp9, dec, hdr);
+	vp9_set_dw_target(ctx);
+
+	ret = aml_vp9_feed(hw, vb2_plane_vaddr(vb, 0),
+			   vb2_get_plane_payload(vb, 0));
+	if (ret)
+		return ret;
+
+	vp9->rounds = 0;
+	vp9->have_picture = false;
+	ctx->int_cond = 0;
+	atomic_set(&hw->hevc_irq_count, 0);
+
+	/*
+	 * The microcode halts itself at the end of a frame, so every buffer
+	 * starts it again.  Resetting the two AMRISC CPUs first is what the
+	 * vendor's amhevc_start() does; nothing wider is needed once the
+	 * frames carry their AMLV prefix.
+	 */
+	if (vp9->started) {
+		regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
+		regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
+	}
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, BIT(12) | BIT(11));
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0);
+	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
+	regmap_write(hw->map[DOS_BUS], HEVC_DEC_STATUS_REG, HEVC_ACTION_DONE);
+	regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
+	regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 1);
+	vp9->started = true;
+
+	/*
+	 * Side buffer only: snapshotting the whole 832 KiB workspace out of
+	 * uncached coherent memory takes long enough to blow the decode
+	 * timeout, and prob/count/rpm/lmem all live here anyway.
+	 */
+
+	/*
+	 * The current slot's header and motion-vector buffers are the last
+	 * memory we own that has never been checked for the symbol counts.
+	 */
+
+	/*
+	 * Wait in short steps and poll for the entropy-adaptation request
+	 * between them.  The wait is deliberately *uninterruptible*: a signal
+	 * to the client must not abandon a decode that the hardware is still
+	 * running, because cancelling the m2m job here races the interrupt
+	 * thread finishing the same job - two completions, a
+	 * v4l2_m2m_buf_done_and_job_finish() warning, and surfaces left
+	 * undecoded (they come out flat green).  The 500 ms timeout is what
+	 * bounds this, not the signal.
+	 *
+	 * When a frame does not set frame_parallel_decoding_mode the microcode
+	 * hands the backward update back to the host: it writes 0xfd to
+	 * VP9_ADAPT_PROB_REG and spins until the host clears it.  It raises no
+	 * interrupt for that, so servicing the request only from the interrupt
+	 * thread means never seeing it - the core sits there until the decode
+	 * times out, and every such frame is lost.  Streams encoded
+	 * -frame-parallel 1 never ask, which is why they decoded fine.
+	 */
+	{
+		unsigned long deadline = jiffies + msecs_to_jiffies(VP9_TIMEOUT_MS);
+
+		do {
+			ret = wait_event_timeout(ctx->queue,
+						 ctx->int_cond,
+						 msecs_to_jiffies(1));
+			if (ret)
+				break;
+			aml_vp9_check_adapt(hw);
+		} while (time_before(jiffies, deadline));
+	}
+
+	if (!ret) {
+		int k;
+
+		dev_err(hw->dev, "vp9: decode timeout, status %02x pc %08x\n",
+			hw->hevc_irq_status, read_dos_reg(hw, HEVC_MPC_E));
+		dev_err(hw->dev,
+			"vp9: dec_status %08x adapt %08x parser_ctl %08x shift %08x\n",
+			read_dos_reg(hw, HEVC_DEC_STATUS_REG),
+			read_dos_reg(hw, VP9_ADAPT_PROB_REG),
+			read_dos_reg(hw, REG_ALIGN(0x3050)),
+			read_dos_reg(hw, HEVC_SHIFT_BYTE_COUNT));
+		for (k = 0; k < 16; k++)
+			dev_err(hw->dev, "vp9: scratch[%x] %08x\n", k,
+				read_dos_reg(hw, REG_ALIGN(0x30c0 + k)));
+		/*
+		 * After a timeout the core decodes every later frame to garbage
+		 * - in this session and the next ones - until its memories are
+		 * cycled.  Have the next frame cycle them, reload the microcode
+		 * and bring the decoder up again; the stream picks up at its
+		 * next key frame.
+		 */
+		hw->hevc_dirty = true;
+		vp9->ucode_loaded = false;
+		vp9->started = false;
+		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
+	}
+	ctx->int_cond = 0;
+	return ret;
+}
diff --git a/drivers/media/platform/amlogic/vdec/vp9.h b/drivers/media/platform/amlogic/vdec/vp9.h
new file mode 100644
index 000000000000..5e4118315e0a
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/vp9.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * VP9 decoding on the S4 HEVC core.
+ *
+ * The VP9 microcode runs on the same core as AV1 and talks the same mailbox
+ * protocol, so most of the register set comes from av1.h and reg_defines.h.
+ * What differs is collected here: the scratch-register aliases the VP9
+ * microcode uses, its status codes, and its workspace sizes.
+ */
+
+#ifndef _AML_VP9_H_
+#define _AML_VP9_H_
+
+#include "av1.h"
+
+/*
+ * Scratch aliases.  Same registers as AV1, different meanings - the alias
+ * belongs to whichever microcode is loaded, so these deliberately shadow
+ * nothing and are only used from vp9.c.
+ */
+#define HEVC_ASSIST_SCRATCH_3		REG_ALIGN(0x30c3)
+#define HEVC_ASSIST_SCRATCH_F		REG_ALIGN(0x30cf)
+#define HEVC_ASSIST_SCRATCH_4		REG_ALIGN(0x30c4)
+#define HEVC_ASSIST_SCRATCH_A		REG_ALIGN(0x30ca)
+#define HEVC_ASSIST_SCRATCH_B		REG_ALIGN(0x30cb)
+
+#define HEVC_SHORT_TERM_RPS		HEVC_ASSIST_SCRATCH_2
+#define VP9_ADAPT_PROB_REG		HEVC_ASSIST_SCRATCH_3
+#define VP9_MMU_MAP_BUFFER		HEVC_ASSIST_SCRATCH_4
+#define HEVC_PPS_BUFFER			HEVC_ASSIST_SCRATCH_5
+#define HEVC_STREAM_SWAP_BUFFER		HEVC_ASSIST_SCRATCH_7
+#define HEVC_STREAM_SWAP_BUFFER2	HEVC_ASSIST_SCRATCH_8
+#define VP9_PROB_SWAP_BUFFER		HEVC_ASSIST_SCRATCH_9
+#define VP9_COUNT_SWAP_BUFFER		HEVC_ASSIST_SCRATCH_A
+#define VP9_SEG_MAP_BUFFER		HEVC_ASSIST_SCRATCH_B
+#define HEVC_STREAM_SWAP_TEST		HEVC_ASSIST_SCRATCH_L
+
+/*
+ * The VP9 microcode dumps its local memory to SCRATCH_F, not to the register
+ * av1.h aliases as LMEM_DUMP_ADR - av1.h points that at SCRATCH_I, which for
+ * this microcode is NAL_SEARCH_CTL.  Writing the AV1 alias here therefore both
+ * left the real dump address unset and overwrote the parser's search control
+ * with a physical address.
+ */
+#define VP9_LMEM_DUMP_ADR		HEVC_ASSIST_SCRATCH_F
+
+#define HEVC_DBLK_CFGE			REG_ALIGN(0x350e)
+
+/* Not needed by the AV1 path, so they are not in av1.h. */
+#define HEVC_PARSER_PICTURE_SIZE	REG_ALIGN(0x3123)
+#define HEVC_MPRED_MV_RD_END_ADDR	REG_ALIGN(0x3262)
+#define VP9D_MPP_REF_SCALE_ENBL		REG_ALIGN(0x3441)
+#define VP9D_MPP_REFINFO_TBL_ACCCONFIG	REG_ALIGN(0x3442)
+#define VP9D_MPP_REFINFO_DATA		REG_ALIGN(0x3443)
+#define HEVC_SAO_MMU_RESET_CTRL		REG_ALIGN(0x3641)
+#define HEVC_WRRSP_LMEM			REG_ALIGN(0x3353)
+
+/*
+ * RPM layout, union param_u in the reference.  The microcode DMAs this out
+ * after it has parsed a frame header; the entries arrive reversed within
+ * groups of four u16s, which aml_vp9_read_rpm() undoes.
+ */
+#define VP9_RPM_PROFILE			0
+#define VP9_RPM_SHOW_EXISTING_FRAME	1
+#define VP9_RPM_FRAME_TO_SHOW_IDX	2
+#define VP9_RPM_FRAME_TYPE		3
+#define VP9_RPM_SHOW_FRAME		4
+#define VP9_RPM_ERROR_RESILIENT		5
+#define VP9_RPM_INTRA_ONLY		6
+#define VP9_RPM_DISPLAY_SIZE_PRESENT	7
+#define VP9_RPM_RESET_FRAME_CONTEXT	8
+#define VP9_RPM_REFRESH_FRAME_FLAGS	9
+#define VP9_RPM_WIDTH			10
+#define VP9_RPM_HEIGHT			11
+#define VP9_RPM_DISPLAY_WIDTH		12
+#define VP9_RPM_DISPLAY_HEIGHT		13
+#define VP9_RPM_REF_INFO		14
+#define VP9_RPM_SAME_FRAME_SIZE		15
+#define VP9_RPM_MODE_REF_DELTA_ENABLED	16
+#define VP9_RPM_REF_DELTAS		17	/* 4 entries */
+#define VP9_RPM_MODE_DELTAS		21	/* 2 entries */
+#define VP9_RPM_FILTER_LEVEL		23
+#define VP9_RPM_SHARPNESS_LEVEL		24
+#define VP9_RPM_BIT_DEPTH		25
+#define VP9_RPM_SEG_QUANT_INFO		26	/* 8 entries */
+#define VP9_RPM_SEG_ENABLED		34
+#define VP9_RPM_SEG_ABS_DELTA		35
+#define VP9_RPM_SEG_LF_INFO		36	/* 8 entries */
+#define VP9_RPM_COUNT			0x80
+
+#define VP9_KEY_FRAME			0
+#define VP9_MIN_DIM			16
+#define VP9_MAX_DIM			4096
+
+/*
+ * A bare VP9 frame carries no start code, so the microcode must not be asked
+ * to search for one: "no head" frame-based mode decodes HEVC_DECODE_SIZE bytes
+ * from the read pointer as they stand.
+ */
+#define DECODE_MODE_MULTI_FRAMEBASE_NOHEAD	((0x80 << 24) | 4)
+
+/* Microcode status codes, HEVC_DEC_STATUS_REG. */
+#define VP9_10B_DEC_IDLE		0x00
+#define VP9_10B_DEC_FRAME_HEADER	0x01
+#define VP9_10B_DEC_SLICE_SEGMENT	0x02
+#define VP9_10B_DECODE_SLICE		0x05
+#define VP9_10B_DISCARD_NAL		0x06
+#define VP9_DUMP_LMEM			0x07
+#define VP9_DECPIC_DATA_DONE		0x0a
+#define VP9_DECPIC_DATA_ERROR		0x0b
+#define VP9_NAL_DECODE_DONE		0x0e
+#define VP9_DECODE_BUFEMPTY		0x20
+#define VP9_DECODE_TIMEOUT		0x21
+#define VP9_SEARCH_BUFEMPTY		0x22
+#define VP9_DECODE_OVER_SIZE		0x23
+#define VP9_HEAD_PARSER_DONE		0xf0
+#define VP9_HEAD_SEARCH_DONE		0xf1
+#define VP9_EOS				0xf2
+
+/* Firmware id, VIDEO_DEC_VP9_MMU, on the HEVC core. */
+#define VP9_FW_FORMAT_MMU		19
+#define VP9_FW_CORE_HEVC		2
+
+int aml_vp9_bringup(struct aml_vdec_hw *hw, u32 width, u32 height);
+int aml_vp9_feed(struct aml_vdec_hw *hw, const void *data, size_t size);
+void aml_vp9_teardown(struct aml_vdec_hw *hw);
+int aml_vp9_config_picture(struct aml_vdec_hw *hw);
+int aml_vp9_feed_file(struct aml_vdec_hw *hw, const char *name);
+void aml_vp9_dump_state(struct aml_vdec_hw *hw);
+void aml_vp9_dump_params(struct aml_vdec_hw *hw);
+void aml_vp9_frame_done(struct aml_vdec_hw *hw);
+int aml_vp9_save_nv12(struct aml_vdec_hw *hw, const char *path, bool append);
+void aml_vp9_dump_output(struct aml_vdec_hw *hw);
+void aml_vp9_restart(struct aml_vdec_hw *hw);
+void aml_vp9_prot_reinit(struct aml_vdec_hw *hw);
+void aml_vp9_reset_core(struct aml_vdec_hw *hw);
+int aml_vp9_ivf_load(struct aml_vdec_hw *hw, const char *name);
+int aml_vp9_ivf_feed_next(struct aml_vdec_hw *hw);
+void aml_vp9_ivf_release(void);
+bool aml_vp9_check_adapt(struct aml_vdec_hw *hw);
+
+/* Milliseconds to wait for a frame before giving up on the microcode. */
+#define VP9_TIMEOUT_MS			500
+
+int aml_vp9_init(void *priv);
+void aml_vp9_exit(void *priv);
+int aml_vp9_dec_run(void *priv);
+
+#endif
diff --git a/drivers/media/platform/amlogic/vdec/vp9_prob.c b/drivers/media/platform/amlogic/vdec/vp9_prob.c
new file mode 100644
index 000000000000..762340b647c0
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/vp9_prob.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * VP9 frame contexts in the packed layout the HEVC core's microcode reads.
+ */
+
+#include <linux/kernel.h>
+
+#include <media/v4l2-vp9.h>
+#include "vp9_prob.h"
+
+/*====================================================
+ *========================================================================
+ *vp9_prob define
+ *========================================================================
+ */
+#define VP9_PARTITION_START      0
+#define VP9_PARTITION_SIZE_STEP  (3 * 4)
+#define VP9_PARTITION_ONE_SIZE   (4 * VP9_PARTITION_SIZE_STEP)
+#define VP9_PARTITION_KEY_START  0
+#define VP9_PARTITION_P_START    VP9_PARTITION_ONE_SIZE
+#define VP9_PARTITION_SIZE       (2 * VP9_PARTITION_ONE_SIZE)
+#define VP9_SKIP_START           (VP9_PARTITION_START + VP9_PARTITION_SIZE)
+#define VP9_SKIP_SIZE            4 /* only use 3*/
+#define VP9_TX_MODE_START        (VP9_SKIP_START + VP9_SKIP_SIZE)
+#define VP9_TX_MODE_8_0_OFFSET   0
+#define VP9_TX_MODE_8_1_OFFSET   1
+#define VP9_TX_MODE_16_0_OFFSET  2
+#define VP9_TX_MODE_16_1_OFFSET  4
+#define VP9_TX_MODE_32_0_OFFSET  6
+#define VP9_TX_MODE_32_1_OFFSET  9
+#define VP9_TX_MODE_SIZE         12
+#define VP9_COEF_START           (VP9_TX_MODE_START + VP9_TX_MODE_SIZE)
+#define VP9_COEF_BAND_0_OFFSET   0
+#define VP9_COEF_BAND_1_OFFSET   (VP9_COEF_BAND_0_OFFSET + 3 * 3 + 1)
+#define VP9_COEF_BAND_2_OFFSET   (VP9_COEF_BAND_1_OFFSET + 6 * 3)
+#define VP9_COEF_BAND_3_OFFSET   (VP9_COEF_BAND_2_OFFSET + 6 * 3)
+#define VP9_COEF_BAND_4_OFFSET   (VP9_COEF_BAND_3_OFFSET + 6 * 3)
+#define VP9_COEF_BAND_5_OFFSET   (VP9_COEF_BAND_4_OFFSET + 6 * 3)
+#define VP9_COEF_SIZE_ONE_SET    100 /* ((3 +5*6)*3 + 1 padding)*/
+#define VP9_COEF_4X4_START       (VP9_COEF_START + 0 * VP9_COEF_SIZE_ONE_SET)
+#define VP9_COEF_8X8_START       (VP9_COEF_START + 4 * VP9_COEF_SIZE_ONE_SET)
+#define VP9_COEF_16X16_START     (VP9_COEF_START + 8 * VP9_COEF_SIZE_ONE_SET)
+#define VP9_COEF_32X32_START     (VP9_COEF_START + 12 * VP9_COEF_SIZE_ONE_SET)
+#define VP9_COEF_SIZE_PLANE      (2 * VP9_COEF_SIZE_ONE_SET)
+#define VP9_COEF_SIZE            (4 * 2 * 2 * VP9_COEF_SIZE_ONE_SET)
+#define VP9_INTER_MODE_START     (VP9_COEF_START + VP9_COEF_SIZE)
+#define VP9_INTER_MODE_SIZE      24 /* only use 21 ( #*7)*/
+#define VP9_INTERP_START         (VP9_INTER_MODE_START + VP9_INTER_MODE_SIZE)
+#define VP9_INTERP_SIZE          8
+#define VP9_INTRA_INTER_START    (VP9_INTERP_START + VP9_INTERP_SIZE)
+#define VP9_INTRA_INTER_SIZE     4
+#define VP9_INTERP_INTRA_INTER_START  VP9_INTERP_START
+#define VP9_INTERP_INTRA_INTER_SIZE   (VP9_INTERP_SIZE + VP9_INTRA_INTER_SIZE)
+#define VP9_COMP_INTER_START     \
+		(VP9_INTERP_INTRA_INTER_START + VP9_INTERP_INTRA_INTER_SIZE)
+#define VP9_COMP_INTER_SIZE      5
+#define VP9_COMP_REF_START       (VP9_COMP_INTER_START + VP9_COMP_INTER_SIZE)
+#define VP9_COMP_REF_SIZE        5
+#define VP9_SINGLE_REF_START     (VP9_COMP_REF_START + VP9_COMP_REF_SIZE)
+#define VP9_SINGLE_REF_SIZE      10
+#define VP9_REF_MODE_START       VP9_COMP_INTER_START
+#define VP9_REF_MODE_SIZE        \
+		(VP9_COMP_INTER_SIZE + VP9_COMP_REF_SIZE + VP9_SINGLE_REF_SIZE)
+#define VP9_IF_Y_MODE_START      (VP9_REF_MODE_START + VP9_REF_MODE_SIZE)
+#define VP9_IF_Y_MODE_SIZE       36
+#define VP9_IF_UV_MODE_START     (VP9_IF_Y_MODE_START + VP9_IF_Y_MODE_SIZE)
+#define VP9_IF_UV_MODE_SIZE      92 /* only use 90*/
+#define VP9_MV_JOINTS_START      (VP9_IF_UV_MODE_START + VP9_IF_UV_MODE_SIZE)
+#define VP9_MV_JOINTS_SIZE       3
+#define VP9_MV_SIGN_0_START      (VP9_MV_JOINTS_START + VP9_MV_JOINTS_SIZE)
+#define VP9_MV_SIGN_0_SIZE       1
+#define VP9_MV_CLASSES_0_START   (VP9_MV_SIGN_0_START + VP9_MV_SIGN_0_SIZE)
+#define VP9_MV_CLASSES_0_SIZE    10
+#define VP9_MV_CLASS0_0_START    (VP9_MV_CLASSES_0_START + VP9_MV_CLASSES_0_SIZE)
+#define VP9_MV_CLASS0_0_SIZE     1
+#define VP9_MV_BITS_0_START      (VP9_MV_CLASS0_0_START + VP9_MV_CLASS0_0_SIZE)
+#define VP9_MV_BITS_0_SIZE       10
+#define VP9_MV_SIGN_1_START      (VP9_MV_BITS_0_START + VP9_MV_BITS_0_SIZE)
+#define VP9_MV_SIGN_1_SIZE       1
+#define VP9_MV_CLASSES_1_START   \
+			(VP9_MV_SIGN_1_START + VP9_MV_SIGN_1_SIZE)
+#define VP9_MV_CLASSES_1_SIZE    10
+#define VP9_MV_CLASS0_1_START    \
+			(VP9_MV_CLASSES_1_START + VP9_MV_CLASSES_1_SIZE)
+#define VP9_MV_CLASS0_1_SIZE     1
+#define VP9_MV_BITS_1_START      \
+			(VP9_MV_CLASS0_1_START + VP9_MV_CLASS0_1_SIZE)
+#define VP9_MV_BITS_1_SIZE       10
+#define VP9_MV_CLASS0_FP_0_START \
+			(VP9_MV_BITS_1_START + VP9_MV_BITS_1_SIZE)
+#define VP9_MV_CLASS0_FP_0_SIZE  9
+#define VP9_MV_CLASS0_FP_1_START \
+			(VP9_MV_CLASS0_FP_0_START + VP9_MV_CLASS0_FP_0_SIZE)
+#define VP9_MV_CLASS0_FP_1_SIZE  9
+#define VP9_MV_CLASS0_HP_0_START \
+			(VP9_MV_CLASS0_FP_1_START + VP9_MV_CLASS0_FP_1_SIZE)
+#define VP9_MV_CLASS0_HP_0_SIZE  2
+#define VP9_MV_CLASS0_HP_1_START \
+			(VP9_MV_CLASS0_HP_0_START + VP9_MV_CLASS0_HP_0_SIZE)
+#define VP9_MV_CLASS0_HP_1_SIZE  2
+#define VP9_MV_START             VP9_MV_JOINTS_START
+#define VP9_MV_SIZE              72 /*only use 69*/
+
+#define VP9_TOTAL_SIZE           (VP9_MV_START + VP9_MV_SIZE)
+
+/*
+ * Pack a frame context into the layout the microcode reads.
+ *
+ * Two things make this necessary.  The microcode **only ever reads** the
+ * probability buffer - measured: not one byte of it, of the two stream swap
+ * buffers or of the segment map is ever written back, while changing its
+ * contents demonstrably changes the picture.  And it reloads its contexts from
+ * there every time it is started, which is once per frame, because it halts
+ * itself when a frame is done.  So the host owns that buffer, and a stream
+ * whose contexts are the defaults - anything encoded frame-parallel or
+ * error-resilient, which is most of what players meet - needs the defaults
+ * written into it or every frame after the first decodes against zeroes.
+ *
+ * The physical layout is not dense: adapt_coef_probs() addresses it as
+ * `prob[offset / 4 * 2]` over u32s, so each group of four bytes sits at an
+ * eight-byte stride.  Everything below indexes logically and pack() applies
+ * that.
+ */
+
+static void pack(u8 *dst, int off, u8 v)
+{
+	dst[(off / 4) * 8 + (off & 3)] = v;
+}
+
+static void pack_n(u8 *dst, int off, const u8 *src, int n)
+{
+	int i;
+
+	for (i = 0; i < n; i++)
+		pack(dst, off + i, src[i]);
+}
+
+void aml_vp9_pack_probs(u8 *dst, const struct v4l2_vp9_frame_context *p)
+{
+	int off, tx, plane, type, band, cxt, cxt_num, i;
+
+	memset(dst, 0, VP9_PROB_CONTEXT_SIZE);
+
+	/* Inter partition probabilities; the key-frame set is the microcode's. */
+	pack_n(dst, VP9_PARTITION_P_START, &p->partition[0][0], 16 * 3);
+
+	pack_n(dst, VP9_SKIP_START, p->skip, 3);
+
+	pack(dst, VP9_TX_MODE_START + VP9_TX_MODE_8_0_OFFSET, p->tx8[0][0]);
+	pack(dst, VP9_TX_MODE_START + VP9_TX_MODE_8_1_OFFSET, p->tx8[1][0]);
+	pack_n(dst, VP9_TX_MODE_START + VP9_TX_MODE_16_0_OFFSET, p->tx16[0], 2);
+	pack_n(dst, VP9_TX_MODE_START + VP9_TX_MODE_16_1_OFFSET, p->tx16[1], 2);
+	pack_n(dst, VP9_TX_MODE_START + VP9_TX_MODE_32_0_OFFSET, p->tx32[0], 3);
+	pack_n(dst, VP9_TX_MODE_START + VP9_TX_MODE_32_1_OFFSET, p->tx32[1], 3);
+
+	/*
+	 * Coefficients.  Band 0 has three contexts and a byte of padding after
+	 * them, the other five have six; three nodes each.
+	 */
+	for (tx = 0; tx < 4; tx++) {
+		int tx_start = VP9_COEF_START + tx * 4 * VP9_COEF_SIZE_ONE_SET;
+
+		for (plane = 0; plane < 2; plane++) {
+			int plane_start = tx_start +
+					  plane * 2 * VP9_COEF_SIZE_ONE_SET;
+
+			for (type = 0; type < 2; type++) {
+				int band_start = plane_start +
+						 type * VP9_COEF_SIZE_ONE_SET;
+
+				for (band = 0; band < 6; band++) {
+					cxt_num = band ? 6 : 3;
+					for (cxt = 0; cxt < cxt_num; cxt++)
+						pack_n(dst,
+						       band_start + cxt * 3,
+						       p->coef[tx][plane][type][band][cxt],
+						       3);
+					band_start += band ? 18 : 10;
+				}
+			}
+		}
+	}
+
+	pack_n(dst, VP9_INTER_MODE_START, &p->inter_mode[0][0], 7 * 3);
+	pack_n(dst, VP9_INTERP_START, &p->interp_filter[0][0], 4 * 2);
+	pack_n(dst, VP9_INTRA_INTER_START, p->is_inter, 4);
+	pack_n(dst, VP9_COMP_INTER_START, p->comp_mode, 5);
+	pack_n(dst, VP9_COMP_REF_START, p->comp_ref, 5);
+	pack_n(dst, VP9_SINGLE_REF_START, &p->single_ref[0][0], 5 * 2);
+	pack_n(dst, VP9_IF_Y_MODE_START, &p->y_mode[0][0], 4 * 9);
+	pack_n(dst, VP9_IF_UV_MODE_START, &p->uv_mode[0][0], 10 * 9);
+
+	pack_n(dst, VP9_MV_JOINTS_START, p->mv.joint, 3);
+	pack(dst, VP9_MV_SIGN_0_START, p->mv.sign[0]);
+	pack_n(dst, VP9_MV_CLASSES_0_START, p->mv.classes[0], 10);
+	pack(dst, VP9_MV_CLASS0_0_START, p->mv.class0_bit[0]);
+	pack_n(dst, VP9_MV_BITS_0_START, p->mv.bits[0], 10);
+	pack(dst, VP9_MV_SIGN_1_START, p->mv.sign[1]);
+	pack_n(dst, VP9_MV_CLASSES_1_START, p->mv.classes[1], 10);
+	pack(dst, VP9_MV_CLASS0_1_START, p->mv.class0_bit[1]);
+	pack_n(dst, VP9_MV_BITS_1_START, p->mv.bits[1], 10);
+
+	for (i = 0; i < 2; i++) {
+		off = i ? VP9_MV_CLASS0_FP_1_START : VP9_MV_CLASS0_FP_0_START;
+		pack_n(dst, off, p->mv.class0_fr[i][0], 3);
+		pack_n(dst, off + 3, p->mv.class0_fr[i][1], 3);
+		pack_n(dst, off + 6, p->mv.fr[i], 3);
+
+		off = i ? VP9_MV_CLASS0_HP_1_START : VP9_MV_CLASS0_HP_0_START;
+		pack(dst, off, p->mv.class0_hp[i]);
+		pack(dst, off + 1, p->mv.hp[i]);
+	}
+}
diff --git a/drivers/media/platform/amlogic/vdec/vp9_prob.h b/drivers/media/platform/amlogic/vdec/vp9_prob.h
new file mode 100644
index 000000000000..22176ec1a4eb
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/vp9_prob.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * VP9 backward probability adaptation - see vp9_prob.c.
+ */
+
+#ifndef _AML_VP9_PROB_H_
+#define _AML_VP9_PROB_H_
+
+#include <media/v4l2-vp9.h>
+
+/* Bytes of probability state the microcode keeps per frame context. */
+#define VP9_PROB_CONTEXT_SIZE	(496 * 2 * 4)
+
+/*
+ * Fold the symbol counts the microcode collected for the frame just decoded
+ * into the entropy context it will use for the next one.
+ *
+ * @pic_count: pictures decoded so far, for tracing only
+ * @prev_kf:   the previous frame was a key frame
+ * @cur_kf:    the frame just decoded was a key frame
+ * @pre_fc:    the frame-context slot the microcode used, 0..3
+ * @prev_prob: that slot's context, the input probabilities
+ * @cur_prob:  where the adapted context is written
+ * @count:     the count buffer the microcode DMA'd out
+ */
+/*
+ * Write the VP9 default probabilities, or any frame context, into the packed
+ * layout the microcode reads.  See vp9_prob.c for why the host has to.
+ */
+void aml_vp9_pack_probs(u8 *dst, const struct v4l2_vp9_frame_context *p);
+
+#endif
-- 
2.56.0

