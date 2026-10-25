Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956346;
	b=K4kClwbFnI5RZC1uJ5FMbuDkXjAaBTjPHl2fz0aanpBjk5TRPAf3sJ7NLgxyIdCNPJlJ
	 BCGmJ461hC5nzNfEGmOuSQ0y4MA4dR04cJ3wmSJmQn0aAsdHqt7uB+hPf4QyntQnc7046
	 0CW8ScVGmHHv2eCOsR/MAs0HwCPytpRJOE2670W5Gj1/VgxJu/QR+vicJxkNQqywPhkJ3
	 x/he9sz8qO1D1mNdYD44fk1FbuCkp3IkQMEf1NMvmdJHpCtriwT+uWS9jDvWRu01KDWUI
	 Ir8GZqeQsGaWYeB5b58uSylWfzTyuXwySfgtQHQHflXzsCrCYKj8CmN+iKCMFfKZK+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956346;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=a1VKPg2wnjQ+EjDmU3RPd5vwazwJq6tRzFO6MB3kygY=;
	b=AVqiCf1lLJ/eUqt8lf7NUw8Mw/krQWr+eDTGSr2IG/Xj3fSpQTQTQ45fFjm7rey1uIK+
	 2nV08e4Xtf7iTJ8chBMOxDkEMwMcbhmsUwHLWvds28bDV352SLILuYkJ/hESNKWf5YU6a
	 6+wFker09pZcUtdj+V1xzsIM8DFRzlO/4t8wLMVSIblEQ4amT08dQmiaDrPwm5EVbtSFI
	 sf1SZb9UMJ5c42ahbmveyWLnhSgmQfbeu1D6jT2Nk9wz0DkQ688/sW0CCieWLyYUv4Obd
	 e9EnxVWhoT0s4LQcw0p9+UdbEg93LInF8LOIMyLosCZyczU6OdWOU70CKhXprp9DOIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Rv3R6aEj;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D7B60A5BD5;
	Sun, 25 Oct 2026 19:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D7B60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Rv3R6aEj
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Es519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:33 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Es519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956335;
	bh=a1VKPg2wnjQ+EjDmU3RPd5vwazwJq6tRzFO6MB3kygY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rv3R6aEjSk1yIq5WfZSkRcQW7EioVH5WZqeP+m7MIPH5IsDMxFGm7bmReOXUNSe5c
	 bZOCaY5mNkrhQb4e/lD86msXhffEyRVkj/DP5EI/Zt+3NBo1UDDrUsoHoDqwuQ+pyi
	 g7gdTFVaGT8/jrREH1Q9Fix8byiqB24+1tIykZKM=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 10/11] media: amlogic: vdec: add MPEG-4 Part 2 decoding
Date: Sun, 25 Oct 2026 20:25:06 +0100
Message-ID: <20261025192507.210058-11-christian.koever-draxl@student.uibk.ac.at>
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

Decode MPEG-4 Part 2 Simple and Advanced Simple profile, including
B-VOPs, on the VDEC core with the M45M microcode. Each buffer carries a
VOL and a VOP; B-VOPs need the microcode's saved context restored.
Quarter-pel and GMC are decoded wrongly by the microcode and have to be
refused by the client.

RFC: V4L2 has no stateless MPEG-4 Part 2 interface. This uses the
V4L2_PIX_FMT_MPEG4 fourcc on a request-based queue and passes the
reference timestamps in the driver-private control
V4L2_CID_AML_MPEG4_REFS. It needs a proper stateless uAPI before it
can be merged.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/Makefile  |   2 +-
 .../media/platform/amlogic/vdec/aml_vdec.c    |  15 +
 .../platform/amlogic/vdec/aml_vdec_platform.c |  17 +
 .../platform/amlogic/vdec/aml_vdec_tee_fw.c   |   5 +
 drivers/media/platform/amlogic/vdec/mpeg4.c   | 480 ++++++++++++++++++
 drivers/media/platform/amlogic/vdec/mpeg4.h   |  52 ++
 6 files changed, 570 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg4.c
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg4.h

diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
index ce2db477a103..80c75ae75d56 100644
--- a/drivers/media/platform/amlogic/vdec/Makefile
+++ b/drivers/media/platform/amlogic/vdec/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o av1.o vp9.o vp9_prob.o hevc.o mpeg12.o mjpeg.o aml_vdec_tee_fw.o
+aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o av1.o vp9.o vp9_prob.o hevc.o mpeg12.o mjpeg.o mpeg4.o aml_vdec_tee_fw.o
 
 obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
index ee020a62836f..117f0d4345ed 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
@@ -13,6 +13,7 @@
 #include "aml_vdec_hw.h"
 #include "aml_vdec_platform.h"
 #include "aml_vdec_tee_fw.h"
+#include "mpeg4.h"
 #include "hevc.h"
 
 #define VCODEC_DRV_NAME "aml-vdec-drv"
@@ -113,6 +114,17 @@ static const struct aml_vdec_v4l2_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION,
 		},
+	}, {
+		.codec_type = CODEC_TYPE_MPEG4,
+		.cfg = {
+			.id = V4L2_CID_AML_MPEG4_REFS,
+			.name = "MPEG-4 Reference Timestamps",
+			.type = V4L2_CTRL_TYPE_INTEGER64,
+			.min = 0,
+			.max = S64_MAX,
+			.step = 1,
+			.dims = { 2 },
+		},
 	}, {
 		.codec_type = CODEC_TYPE_HEVC,
 		.cfg = {
@@ -146,6 +158,9 @@ static const struct aml_dec_type dec_type_name[] = {
 	}, {
 		.codec_type = CODEC_TYPE_MJPEG,
 		.name = "MJPEG",
+	}, {
+		.codec_type = CODEC_TYPE_MPEG4,
+		.name = "MPEG4",
 	},
 };
 
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
index 36ae12e6cdd8..f8e2d0bef3fe 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
@@ -11,6 +11,7 @@
 #include "hevc.h"
 #include "mpeg12.h"
 #include "mjpeg.h"
+#include "mpeg4.h"
 
 static struct aml_video_fmt aml_s4_video_formats[] = {
 	{
@@ -68,6 +69,17 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
 			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
 	},
+	{
+		.name = "MPEG-4",
+		.fourcc = V4L2_PIX_FMT_MPEG4,
+		.type = AML_FMT_DEC,
+		.align = 64,
+		.is_10_bit_support = 0,
+		.codec_type = CODEC_TYPE_MPEG4,
+		.num_planes = 1,
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
+	},
 	{
 		.name = "JPEG",
 		.fourcc = V4L2_PIX_FMT_JPEG,
@@ -164,6 +176,11 @@ const struct aml_codec_ops aml_S4_dec_ops[] = {
 		.exit = aml_mjpeg_exit,
 		.run = aml_mjpeg_dec_run,
 	},
+	[CODEC_TYPE_MPEG4] = {
+		.init = aml_mpeg4_init,
+		.exit = aml_mpeg4_exit,
+		.run = aml_mpeg4_dec_run,
+	},
 };
 
 const struct aml_dev_platform_data aml_vdec_s4_pdata = {
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
index a92405047c6e..25928612326b 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
@@ -92,6 +92,11 @@ static struct aml_tee_fw firmware[] = {
 		.core = CORE_VDEC_LEGENCY,
 		.is_swap = 0,
 	},
+	[CODEC_TYPE_MPEG4] = {
+		.fw_format = VIDEO_DEC_MPEG4_5_MULTI,
+		.core = CORE_VDEC_LEGENCY,
+		.is_swap = 0,
+	},
 };
 
 static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
diff --git a/drivers/media/platform/amlogic/vdec/mpeg4.c b/drivers/media/platform/amlogic/vdec/mpeg4.c
new file mode 100644
index 000000000000..9cc97fa46209
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/mpeg4.c
@@ -0,0 +1,480 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * MPEG-4 Part 2 (Simple / Advanced Simple) decoding on the Amlogic legacy
+ * VDEC core.
+ *
+ * Ported from the reference's frame-based vmpeg4_multi.c.  Like the MPEG-2
+ * one, this microcode parses the elementary stream itself - VOL and VOP
+ * headers included - so there is no parsed-header uAPI: every OUTPUT buffer
+ * holds a VOL header followed by one VOP, exactly as it appears in the
+ * stream.
+ *
+ * Unlike MPEG-2 the picture cannot be decoded from its own headers alone: a
+ * B-VOP needs the time distances to its anchors (TRD/TRB), which the
+ * microcode remembers from the anchors' VOP headers in its local memory.
+ * So, like the reference, the decoder context is saved after every picture
+ * - a few VLD/VCOP registers here, the microcode's local memory in the
+ * workspace - and restored before the next one (ctx_valid).
+ *
+ * The references are the one thing the microcode cannot find by itself; the
+ * client names them in a driver control holding the capture timestamps of
+ * the forward and backward reference, as every stateless codec does.
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "aml_vdec_drv.h"
+#include "aml_vdec_hw.h"
+#include "mpeg4.h"
+
+#define MPEG4_TIMEOUT_MS	500
+#define MPEG4_TAIL		4
+
+struct mpeg4_canvas {
+	int y;
+	int uv;
+};
+
+struct aml_mpeg4_ctx {
+	struct aml_vdec_ctx *v4l2_ctx;
+
+	void *wks_vaddr;
+	dma_addr_t wks_paddr;
+
+	void *stage_vaddr;
+	dma_addr_t stage_paddr;
+	u32 stage_size;
+
+	/* rec, ref0, ref1 */
+	struct mpeg4_canvas canvas[3];
+
+	u32 status;
+	u32 decoded;
+
+	/* decoder context carried between pictures, see the top of the file */
+	bool ctx_valid;
+	u32 reg_mpeg1_2;
+	u32 reg_vcop_ctrl;
+	u32 reg_pic_head_info;
+	u32 reg_slice_qp;
+	u32 reg_pic_wh;
+	u32 reg_mb_info;
+	u32 reg_dc_ac_ctrl;
+	u32 reg_iqidct_control;
+	u32 reg_resync_marker_length;
+	u32 reg_rv_ai_mb_count;
+};
+
+static void mpeg4_save_hw_context(struct aml_vdec_hw *hw, struct aml_mpeg4_ctx *m)
+{
+	m->reg_mpeg1_2 = read_dos_reg(hw, MPEG1_2_REG);
+	m->reg_vcop_ctrl = read_dos_reg(hw, VCOP_CTRL_REG);
+	m->reg_pic_head_info = read_dos_reg(hw, PIC_HEAD_INFO);
+	m->reg_slice_qp = read_dos_reg(hw, SLICE_QP);
+	m->reg_pic_wh = read_dos_reg(hw, MP4_PIC_WH);
+	m->reg_mb_info = read_dos_reg(hw, MB_INFO);
+	m->reg_dc_ac_ctrl = read_dos_reg(hw, DC_AC_CTRL);
+	m->reg_iqidct_control = read_dos_reg(hw, IQIDCT_CONTROL);
+	m->reg_resync_marker_length = read_dos_reg(hw, RESYNC_MARKER_LENGTH);
+	m->reg_rv_ai_mb_count = read_dos_reg(hw, RV_AI_MB_COUNT);
+	m->ctx_valid = true;
+}
+
+static void mpeg4_canvas_free(struct aml_vdec_hw *hw, struct aml_mpeg4_ctx *m)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(m->canvas); i++) {
+		if (m->canvas[i].y >= 0)
+			meson_canvas_free(hw->canvas, m->canvas[i].y);
+		if (m->canvas[i].uv >= 0)
+			meson_canvas_free(hw->canvas, m->canvas[i].uv);
+		m->canvas[i].y = -1;
+		m->canvas[i].uv = -1;
+	}
+}
+
+/* Returns the canvas spec (y | uv << 8 | uv << 16) for the buffer, or ~0. */
+static u32 mpeg4_canvas_setup(struct aml_vdec_ctx *ctx,
+			      struct mpeg4_canvas *c, struct vb2_buffer *vb)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	u32 w = ctx->pic_info.coded_width;
+	u32 h = ctx->pic_info.coded_height;
+	dma_addr_t y, uv;
+	u8 yi, ci;
+
+	y = vb2_dma_contig_plane_dma_addr(vb, 0);
+	if (ctx->pic_info.plane_num > 1)
+		uv = vb2_dma_contig_plane_dma_addr(vb, 1);
+	else
+		uv = y + ctx->pic_info.fb_size[0];
+
+	/* a slot reused within one job must not leak its old canvases */
+	if (c->y >= 0)
+		meson_canvas_free(hw->canvas, c->y);
+	if (c->uv >= 0)
+		meson_canvas_free(hw->canvas, c->uv);
+	c->y = -1;
+	c->uv = -1;
+
+	if (meson_canvas_alloc(hw->canvas, &yi))
+		return ~0u;
+	if (meson_canvas_alloc(hw->canvas, &ci)) {
+		meson_canvas_free(hw->canvas, yi);
+		return ~0u;
+	}
+	c->y = yi;
+	c->uv = ci;
+
+	meson_canvas_config(hw->canvas, yi, y, w, h, MESON_CANVAS_WRAP_NONE,
+			    MESON_CANVAS_BLKMODE_LINEAR, MESON_CANVAS_ENDIAN_SWAP64);
+	regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_CANVAS_BLK32,
+		     (1 << 11) | (1 << 8) | yi);
+	meson_canvas_config(hw->canvas, ci, uv, w, h / 2, MESON_CANVAS_WRAP_NONE,
+			    MESON_CANVAS_BLKMODE_LINEAR, MESON_CANVAS_ENDIAN_SWAP64);
+	regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_CANVAS_BLK32,
+		     (1 << 11) | (1 << 8) | ci);
+
+	return yi | (ci << 8) | (ci << 16);
+}
+
+static u32 mpeg4_ref_spec(struct aml_vdec_ctx *ctx, struct mpeg4_canvas *c,
+			  u64 ts)
+{
+	struct vb2_queue *vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+	struct vb2_buffer *vb = vb2_find_buffer(vq, ts);
+
+	if (!vb)
+		return 0xffffffff;
+	return mpeg4_canvas_setup(ctx, c, vb);
+}
+
+static int mpeg4_prepare_input(struct aml_vdec_ctx *ctx,
+			       struct vb2_v4l2_buffer *src)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mpeg4_ctx *m = ctx->codec_priv;
+	struct vb2_buffer *vb = &src->vb2_buf;
+	u32 len = vb2_get_plane_payload(vb, 0);
+	u32 need = len + MPEG4_TAIL + VLD_PADDING_SIZE + 64;
+	u8 *p;
+
+	if (need > m->stage_size) {
+		if (m->stage_vaddr)
+			dma_free_coherent(hw->dev, m->stage_size,
+					  m->stage_vaddr, m->stage_paddr);
+		m->stage_size = PAGE_ALIGN(need + SZ_64K);
+		m->stage_vaddr = dma_alloc_coherent(hw->dev, m->stage_size,
+						    &m->stage_paddr, GFP_KERNEL);
+		if (!m->stage_vaddr) {
+			m->stage_size = 0;
+			return -ENOMEM;
+		}
+	}
+
+	p = m->stage_vaddr;
+	memcpy(p, vb2_plane_vaddr(vb, 0), len);
+	/* The microcode only ends the VOP on the next start code. */
+	p[len] = 0;
+	p[len + 1] = 0;
+	p[len + 2] = 1;
+	p[len + 3] = 0xb6;
+	memset(p + len + MPEG4_TAIL, 0, VLD_PADDING_SIZE);
+
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0);
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0,
+		     (1 << 5) | (1 << 4) | (1 << 3));
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0, 0);
+	regmap_write(hw->map[DOS_BUS], POWER_CTL_VLD, 1 << 4);
+
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_START_PTR, m->stage_paddr);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_END_PTR,
+		     m->stage_paddr + m->stage_size - VDEC_FIFO_ALIGN);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CURR_PTR, m->stage_paddr);
+
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 1);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 2);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_RP, m->stage_paddr);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_WP,
+		     round_down(m->stage_paddr + len + MPEG4_TAIL +
+				VLD_PADDING_SIZE, VDEC_FIFO_ALIGN));
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 3);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_BUF_CNTL, 2);
+	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL,
+		     (0x11 << 16) | (1 << 10) | (7 << 3));
+
+	regmap_write(hw->map[DOS_BUS], VIFF_BIT_CNT, len * 8);
+
+	return 0;
+}
+
+static void mpeg4_job_done(struct aml_vdec_ctx *ctx, enum vb2_buffer_state st)
+{
+	struct aml_vdec_dev *dev = ctx->dev;
+
+	mpeg4_canvas_free(dev->dec_hw, ctx->codec_priv);
+	ctx->int_cond = 1;
+	ctx->job_finished = true;
+	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, st);
+	wake_up(&ctx->queue);
+}
+
+static irqreturn_t mpeg4_isr(int irq, void *priv)
+{
+	struct aml_vdec_dev *dev = priv;
+
+	regmap_write(dev->dec_hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_CLR_REG, 1);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mpeg4_threaded_isr(int irq, void *priv)
+{
+	struct aml_vdec_dev *dev = priv;
+	struct aml_vdec_hw *hw = dev->dec_hw;
+	struct aml_mpeg4_ctx *m = hw->curr_ctx;
+	struct aml_vdec_ctx *ctx;
+	u32 reg;
+
+	if (!m)
+		return IRQ_HANDLED;
+	ctx = m->v4l2_ctx;
+	if (ctx->job_finished)
+		return IRQ_HANDLED;
+
+	/* Picture size report: the buffers are already set up, go on. */
+	if (read_dos_reg(hw, MP4_PIC_INFO) == 1) {
+		dev_dbg(hw->dev, "mpeg4 size %ux%u\n",
+			read_dos_reg(hw, MP4_PIC_WH) >> 16,
+			 read_dos_reg(hw, MP4_PIC_WH) & 0xffff);
+		regmap_write(hw->map[DOS_BUS], MP4_PIC_INFO, 0);
+		return IRQ_HANDLED;
+	}
+
+	if (read_dos_reg(hw, MP4_DEBUG)) {
+		regmap_write(hw->map[DOS_BUS], MP4_DEBUG, 0);
+		return IRQ_HANDLED;
+	}
+
+	reg = read_dos_reg(hw, MP4_BUFFEROUT);
+	m->status = reg;
+	dev_dbg(hw->dev,
+		"mpeg4 irq out %x type %u rec %06x wh %08x err %u notcoded %u\n",
+		 reg, (reg >> 3) & 7, read_dos_reg(hw, REC_CANVAS_ADDR),
+		 read_dos_reg(hw, MP4_PIC_WH),
+		 read_dos_reg(hw, MP4_ERR_COUNT),
+		 read_dos_reg(hw, MP4_NOT_CODED_CNT));
+
+	if (reg == MP4_BUFFEROUT_IDLE)
+		return IRQ_HANDLED;	/* not ours */
+	if (reg == MP4_BUFFEROUT_NEED_DATA) {
+		mpeg4_job_done(ctx, VB2_BUF_STATE_ERROR);
+		return IRQ_HANDLED;
+	}
+
+	m->decoded++;
+	mpeg4_save_hw_context(hw, m);
+	mpeg4_job_done(ctx, VB2_BUF_STATE_DONE);
+	regmap_write(hw->map[DOS_BUS], MP4_BUFFEROUT, 0);
+
+	return IRQ_HANDLED;
+}
+
+static void mpeg4_restore_hw(struct aml_vdec_ctx *ctx)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mpeg4_ctx *m = ctx->codec_priv;
+	struct regmap *map = hw->map[DOS_BUS];
+
+	regmap_write(map, MP4_MEM_OFFSET, m->wks_paddr);
+
+	/* disable PSCALE for hardware sharing */
+	regmap_write(map, PSCALE_CTRL, 0);
+	regmap_write(map, MP4_BUFFEROUT, MP4_BUFFEROUT_IDLE);
+	regmap_write(map, VDEC_ASSIST_MBOX1_CLR_REG, 1);
+	regmap_write(map, VDEC_ASSIST_MBOX1_MASK, 1);
+	regmap_write(map, MP4_NOT_CODED_CNT, 0);
+	regmap_write(map, MP4_PIC_INFO, 0);
+	regmap_write(map, MP4_DEBUG, 0);
+	regmap_write(map, MP4_STOP_POS, 0);
+
+	regmap_update_bits(map, MDEC_PIC_DC_CTRL, 1 << 17, 1 << 17);
+	if (ctx->dec_fmt[AML_FMT_DST].fourcc == V4L2_PIX_FMT_NV21 ||
+	    ctx->dec_fmt[AML_FMT_DST].fourcc == V4L2_PIX_FMT_NV21M)
+		regmap_update_bits(map, MDEC_PIC_DC_CTRL, 1 << 16, 1 << 16);
+	else
+		regmap_update_bits(map, MDEC_PIC_DC_CTRL, 1 << 16, 0);
+	regmap_write(map, MDEC_PIC_DC_THRESH, 0x404038aa);
+
+	/* size from the VOL until a picture has reported it */
+	regmap_write(map, MP4_PIC_WH, m->ctx_valid ? m->reg_pic_wh : 0);
+	regmap_write(map, MP4_SYS_RATE, 0);
+
+	if (m->ctx_valid) {
+		regmap_write(map, DC_AC_CTRL, m->reg_dc_ac_ctrl);
+		regmap_write(map, IQIDCT_CONTROL, m->reg_iqidct_control);
+		regmap_write(map, RESYNC_MARKER_LENGTH,
+			     m->reg_resync_marker_length);
+		regmap_write(map, RV_AI_MB_COUNT, m->reg_rv_ai_mb_count);
+	}
+	regmap_write(map, MPEG1_2_REG, m->ctx_valid ? m->reg_mpeg1_2 : 1);
+	regmap_write(map, VCOP_CTRL_REG, m->reg_vcop_ctrl);
+	regmap_write(map, PIC_HEAD_INFO, m->reg_pic_head_info);
+	regmap_write(map, SLICE_QP, m->reg_slice_qp);
+	regmap_write(map, MB_INFO, m->reg_mb_info);
+
+	/* frame based input, offset 0 */
+	regmap_write(map, MP4_INPUT, (1 << 7) | (m->ctx_valid << 6));
+}
+
+int aml_mpeg4_init(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mpeg4_ctx *m;
+	int i;
+
+	if (!hw)
+		return -ENODEV;
+
+	m = kzalloc_obj(*m);
+	if (!m)
+		return -ENOMEM;
+	m->v4l2_ctx = ctx;
+	for (i = 0; i < ARRAY_SIZE(m->canvas); i++) {
+		m->canvas[i].y = -1;
+		m->canvas[i].uv = -1;
+	}
+
+	m->wks_vaddr = dma_alloc_coherent(hw->dev, MPEG4_WORKSPACE_SIZE,
+					  &m->wks_paddr, GFP_KERNEL);
+	if (!m->wks_vaddr) {
+		kfree(m);
+		return -ENOMEM;
+	}
+
+	ctx->codec_priv = m;
+	return 0;
+}
+
+void aml_mpeg4_exit(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_mpeg4_ctx *m = ctx->codec_priv;
+	struct aml_vdec_hw *hw;
+
+	if (!m)
+		return;
+	hw = vdec_get_hw(ctx->dev);
+
+	if (ctx->dos_clk_en)
+		aml_stop_vdec_hw(hw);
+	mpeg4_canvas_free(hw, m);
+
+	if (m->stage_vaddr)
+		dma_free_coherent(hw->dev, m->stage_size,
+				  m->stage_vaddr, m->stage_paddr);
+	dma_free_coherent(hw->dev, MPEG4_WORKSPACE_SIZE,
+			  m->wks_vaddr, m->wks_paddr);
+
+	if (hw->curr_ctx == m)
+		hw->curr_ctx = NULL;
+	kfree(m);
+	ctx->codec_priv = NULL;
+}
+
+int aml_mpeg4_dec_run(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_mpeg4_ctx *m = ctx->codec_priv;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct v4l2_ctrl *refs_ctrl;
+	struct vb2_v4l2_buffer *src, *dst;
+	u32 rec, ref0 = 0xffffffff, ref1 = 0xffffffff;
+	u64 fwd = 0, bwd = 0;
+	long ret;
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	if (!src || !dst)
+		return -EINVAL;
+
+	refs_ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_AML_MPEG4_REFS);
+	if (refs_ctrl) {
+		fwd = refs_ctrl->p_cur.p_s64[0];
+		bwd = refs_ctrl->p_cur.p_s64[1];
+	}
+
+	hw->curr_ctx = m;
+	hw->hw_ops.irq_handler = mpeg4_isr;
+	hw->hw_ops.irq_threaded_func = mpeg4_threaded_isr;
+
+	if (mpeg4_prepare_input(ctx, src) < 0)
+		return -ENOMEM;
+
+	mpeg4_restore_hw(ctx);
+
+	rec = mpeg4_canvas_setup(ctx, &m->canvas[0], &dst->vb2_buf);
+	if (rec == ~0u)
+		goto fail;
+
+	/*
+	 * REF0 is the older anchor, REF1 the newer one; a P-VOP predicts from
+	 * REF1, a B-VOP from both.  0 means "none" in the control.
+	 */
+	if (fwd && bwd) {
+		ref0 = mpeg4_ref_spec(ctx, &m->canvas[1], fwd);
+		ref1 = mpeg4_ref_spec(ctx, &m->canvas[2], bwd);
+	} else if (fwd) {
+		ref1 = mpeg4_ref_spec(ctx, &m->canvas[2], fwd);
+		ref0 = ref1;
+	}
+	regmap_write(hw->map[DOS_BUS], MP4_REF0, ref0);
+	regmap_write(hw->map[DOS_BUS], MP4_REF1, ref1);
+	regmap_write(hw->map[DOS_BUS], REC_CANVAS_ADDR, rec);
+	regmap_write(hw->map[DOS_BUS], ANC2_CANVAS_ADDR, rec);
+
+	dev_dbg(hw->dev,
+		"mpeg4 run %lu bytes ts %llu rec %06x ref0 %08x (%llu) ref1 %08x (%llu)\n",
+		 vb2_get_plane_payload(&src->vb2_buf, 0),
+		 src->vb2_buf.timestamp, rec, ref0, fwd, ref1, bwd);
+
+	ctx->int_cond = 0;
+	regmap_update_bits(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0x6, 0x6);
+	aml_start_vdec_hw(hw);
+
+	ret = wait_event_timeout(ctx->queue, ctx->int_cond,
+				 msecs_to_jiffies(MPEG4_TIMEOUT_MS));
+	ctx->int_cond = 0;
+	if (!ret) {
+		dev_err(hw->dev,
+			"mpeg4 timeout: out %x info %x pc %x lvl %x rp %x wp %x bitcnt %x err %x\n",
+			read_dos_reg(hw, MP4_BUFFEROUT),
+			read_dos_reg(hw, MP4_PIC_INFO),
+			read_dos_reg(hw, MPC_E),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_LEVEL),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_RP),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_WP),
+			read_dos_reg(hw, VIFF_BIT_CNT),
+			read_dos_reg(hw, MP4_ERR_COUNT));
+		aml_stop_vdec_hw(hw);
+		mpeg4_canvas_free(hw, m);
+		return -ETIMEDOUT;
+	}
+
+	aml_stop_vdec_hw(hw);
+	return 0;
+
+fail:
+	mpeg4_canvas_free(hw, m);
+	return -ENOMEM;
+}
diff --git a/drivers/media/platform/amlogic/vdec/mpeg4.h b/drivers/media/platform/amlogic/vdec/mpeg4.h
new file mode 100644
index 000000000000..213e8d390ebb
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/mpeg4.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * MPEG-4 Part 2 decoding on the Amlogic legacy VDEC core.
+ */
+
+#ifndef _AML_MPEG4_H_
+#define _AML_MPEG4_H_
+
+/* Scratch register meanings for the mpeg4 microcode (vmpeg4_multi.c). */
+#define MP4_REF0		AV_SCRATCH_1
+#define MP4_REF1		AV_SCRATCH_2
+#define MP4_RATE		AV_SCRATCH_3
+#define MP4_PIC_RATIO		AV_SCRATCH_5
+#define MP4_ERR_COUNT		AV_SCRATCH_6
+#define MP4_PIC_WH		AV_SCRATCH_7
+#define MP4_INPUT		AV_SCRATCH_8
+#define MP4_BUFFEROUT		AV_SCRATCH_9
+#define MP4_NOT_CODED_CNT	AV_SCRATCH_A
+#define MP4_VOP_TIME_INC	AV_SCRATCH_B
+#define MP4_OFFSET_REG		AV_SCRATCH_C
+#define MP4_VOS_INFO		AV_SCRATCH_D
+#define MP4_SYS_RATE		AV_SCRATCH_E
+#define MP4_MEM_OFFSET		AV_SCRATCH_F
+#define MP4_PIC_INFO		AV_SCRATCH_H	/* 1: size report */
+#define MP4_STOP_POS		AV_SCRATCH_K
+#define MP4_DEBUG		AV_SCRATCH_M
+
+#define MP4_BUFFEROUT_IDLE	0x10000
+#define MP4_BUFFEROUT_NEED_DATA	2
+
+#define MPEG1_2_REG		REG_ALIGN(0x0c01)
+#define PIC_HEAD_INFO		REG_ALIGN(0x0c03)
+/* from the vendor kernel's dos_regs.h */
+#define SLICE_QP		REG_ALIGN(0x0c0a)
+#define RESYNC_MARKER_LENGTH	REG_ALIGN(0x0c0e)
+#define DC_AC_CTRL		REG_ALIGN(0x0e05)
+#define RV_AI_MB_COUNT		REG_ALIGN(0x0e0c)
+#define IQIDCT_CONTROL		REG_ALIGN(0x0e0e)
+
+#define MPEG4_WORKSPACE_SIZE	(12 * SZ_64K)
+
+/*
+ * Driver control: the capture timestamps of the forward and backward
+ * reference (s64[2], 0 = none).  There is no MPEG-4 Part 2 stateless uAPI.
+ */
+#define V4L2_CID_AML_MPEG4_REFS	(V4L2_CID_USER_BASE + 0x1f00)
+
+int aml_mpeg4_init(void *priv);
+void aml_mpeg4_exit(void *priv);
+int aml_mpeg4_dec_run(void *priv);
+
+#endif
-- 
2.56.0

