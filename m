Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956334;
	b=WYKWuxC8/jweccM0rmgSitg4yDOVNFBsTFsoaZamjK6YZ0Upt4HUE4/buIesIUoTjaQ2
	 XOzm8eYQnjxYIogcUxwsoh5MIy9IIYb0R6l2RIvL/zhflYjDLZ3+feJxbuK8e77IQDUSs
	 rOngVlN7mWMy8CCB2+4XS2+nx/Op960S/RAqpqe1xch+GAcQ4qPB/mnhiHXLlHweMNuzW
	 S741A7NTCDuch54QtNhNKf4WHZumbzZHDbt2kFnbkaW1rW4aHyRrcM16pqD5MCNkiO+qX
	 u3Sot6TGnK6qV6Lgw4azhWhP0l+ushpUQxnj9uoo8NCURvuAxcnzbGvY5nGuQbWeM0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956334;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=4yZ5jqUzAanQzW6zUJzYlkxUy0hiQbsP7VxZZbbo+mE=;
	b=KzCSn3v5zn6tekVOMy8lUwn4M8xWdkjjMQjOoZ/yEjl2RQvdHOM31z7zp7yt1LNwI9wy
	 g+9/0m1eeu51rzXANDv2QlW+Bgfnn6Np4eZvIY04CEOzLmgNWbOofh14Qdqvjnme3lpu+
	 tHP1iZwBsmcsTRePKhs3ngIyAAggTi+kLsSyaGwJ+4ECEvhhsuPpGrTyzS47+UzRoZ8gx
	 qMLVWQZQK1qYSNGSEHJOiadV0p8qVYNmWJ83eVIk8KgmEldy7UVE2fCXv91LdNeKMJigx
	 wyR3rgW51zC/emxAdlz5DpsqgOI1K+HWr4npyU+IxtpSn7khtWtQN2gpIozvcK/v4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=sw6CurYb;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F560A381D;
	Sun, 25 Oct 2026 19:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6F560A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=sw6CurYb
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Eo519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:23 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Eo519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956324;
	bh=4yZ5jqUzAanQzW6zUJzYlkxUy0hiQbsP7VxZZbbo+mE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sw6CurYbmJVnb1BSPDqeC2rWbtsORy5zM/6qYruLq0jYp8murzniIJxAAA7Izqs8h
	 9HBaVo+s8F3ds6k+wLWhVCvZtcE3vnK6yreHjOITM6roJkfk9HDR41CgZFAzT7GEhW
	 JpteY50ZNb8yeR84DRiOFVv/QHVVRHGJhdqfKeg0=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 06/11] media: amlogic: vdec: add MJPEG decoding
Date: Sun, 25 Oct 2026 20:25:02 +0100
Message-ID: <20261025192507.210058-7-christian.koever-draxl@student.uibk.ac.at>
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

Decode baseline 4:2:0 JPEG frames (V4L2_PIX_FMT_MJPEG) on the VDEC
core. The microcode skips the first marker segment after SOI, so the
frame is fed with that in mind, and the planar 4:2:0 picture it writes
is exposed as a CAPTURE format of its own.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/Makefile  |   2 +-
 .../media/platform/amlogic/vdec/aml_vdec.c    |   3 +
 .../platform/amlogic/vdec/aml_vdec_platform.c |  17 +
 .../platform/amlogic/vdec/aml_vdec_tee_fw.c   |   5 +
 drivers/media/platform/amlogic/vdec/mjpeg.c   | 471 ++++++++++++++++++
 drivers/media/platform/amlogic/vdec/mjpeg.h   |  33 ++
 6 files changed, 530 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amlogic/vdec/mjpeg.c
 create mode 100644 drivers/media/platform/amlogic/vdec/mjpeg.h

diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
index 6d91750ec673..c5eda54598f6 100644
--- a/drivers/media/platform/amlogic/vdec/Makefile
+++ b/drivers/media/platform/amlogic/vdec/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o mpeg12.o aml_vdec_tee_fw.o
+aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o mpeg12.o mjpeg.o aml_vdec_tee_fw.o
 
 obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
index 7a5098f3e116..c383dd642586 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
@@ -90,6 +90,9 @@ static const struct aml_dec_type dec_type_name[] = {
 	}, {
 		.codec_type = CODEC_TYPE_MPEG2,
 		.name = "MPEG2",
+	}, {
+		.codec_type = CODEC_TYPE_MJPEG,
+		.name = "MJPEG",
 	},
 };
 
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
index 83efadcb8aef..d54b09b6bbc0 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
@@ -7,6 +7,7 @@
 #include "aml_vdec_hw.h"
 #include "h264.h"
 #include "mpeg12.h"
+#include "mjpeg.h"
 
 static struct aml_video_fmt aml_s4_video_formats[] = {
 	{
@@ -31,6 +32,17 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
 			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
 	},
+	{
+		.name = "JPEG",
+		.fourcc = V4L2_PIX_FMT_JPEG,
+		.type = AML_FMT_DEC,
+		.align = 64,
+		.is_10_bit_support = 0,
+		.codec_type = CODEC_TYPE_MJPEG,
+		.num_planes = 1,
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
+	},
 	{
 		.name = "NV21M",
 		.fourcc = V4L2_PIX_FMT_NV21M,
@@ -96,6 +108,11 @@ const struct aml_codec_ops aml_S4_dec_ops[] = {
 		.exit = aml_mpeg12_exit,
 		.run = aml_mpeg12_dec_run,
 	},
+	[CODEC_TYPE_MJPEG] = {
+		.init = aml_mjpeg_init,
+		.exit = aml_mjpeg_exit,
+		.run = aml_mjpeg_dec_run,
+	},
 };
 
 const struct aml_dev_platform_data aml_vdec_s4_pdata = {
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
index 63da8b4dac28..a92405047c6e 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
@@ -87,6 +87,11 @@ static struct aml_tee_fw firmware[] = {
 		.core = CORE_VDEC_LEGENCY,
 		.is_swap = 0,
 	},
+	[CODEC_TYPE_MJPEG] = {
+		.fw_format = VIDEO_DEC_MJPEG_MULTI,
+		.core = CORE_VDEC_LEGENCY,
+		.is_swap = 0,
+	},
 };
 
 static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
diff --git a/drivers/media/platform/amlogic/vdec/mjpeg.c b/drivers/media/platform/amlogic/vdec/mjpeg.c
new file mode 100644
index 000000000000..7989b5f42a56
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/mjpeg.c
@@ -0,0 +1,471 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Motion-JPEG decoding on the Amlogic legacy VDEC core.
+ *
+ * Ported from the reference's vmjpeg_multi.c.  The microcode parses the whole
+ * JPEG itself - markers, tables, scan - so every OUTPUT buffer is simply one
+ * complete JPEG picture and needs no controls.  It writes planar 4:2:0 into
+ * three canvases (Y, U, V), so the only CAPTURE format is YUV420 (I420); a
+ * 4:2:2 or 4:4:4 source comes out downsampled to 4:2:0 by the microcode.
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
+#include "mjpeg.h"
+
+#define MJPEG_TIMEOUT_MS	500
+
+struct aml_mjpeg_ctx {
+	struct aml_vdec_ctx *v4l2_ctx;
+
+	void *stage_vaddr;
+	dma_addr_t stage_paddr;
+	u32 stage_size;
+
+	int canvas[3];
+	u32 decoded;
+};
+
+static void mjpeg_canvas_free(struct aml_vdec_hw *hw, struct aml_mjpeg_ctx *m)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(m->canvas); i++) {
+		if (m->canvas[i] >= 0)
+			meson_canvas_free(hw->canvas, m->canvas[i]);
+		m->canvas[i] = -1;
+	}
+}
+
+/* Y, U, V canvases for the capture buffer; returns the spec or ~0. */
+static u32 mjpeg_canvas_setup(struct aml_vdec_ctx *ctx, struct vb2_buffer *vb)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mjpeg_ctx *m = ctx->codec_priv;
+	struct v4l2_pix_format_mplane *pf = &ctx->pix_fmt[AML_FMT_DST];
+	u32 w = pf->plane_fmt[0].bytesperline;
+	u32 h = pf->height;
+	dma_addr_t addr[3];
+	u32 cw[3] = { w, w / 2, w / 2 };
+	u32 ch[3] = { h, h / 2, h / 2 };
+	int i;
+
+	addr[0] = vb2_dma_contig_plane_dma_addr(vb, 0);
+	addr[1] = addr[0] + w * h;
+	addr[2] = addr[1] + (w / 2) * (h / 2);
+
+	for (i = 0; i < 3; i++) {
+		u8 idx;
+
+		if (meson_canvas_alloc(hw->canvas, &idx)) {
+			mjpeg_canvas_free(hw, m);
+			return ~0u;
+		}
+		m->canvas[i] = idx;
+		meson_canvas_config(hw->canvas, idx, addr[i], cw[i], ch[i],
+				    MESON_CANVAS_WRAP_NONE,
+				    MESON_CANVAS_BLKMODE_LINEAR,
+				    MESON_CANVAS_ENDIAN_SWAP64);
+		regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_CANVAS_BLK32,
+			     (1 << 11) | (1 << 8) | idx);
+	}
+
+	return m->canvas[0] | (m->canvas[1] << 8) | (m->canvas[2] << 16);
+}
+
+/*
+ * The microcode only handles baseline (SOF0/SOF1) 4:2:0 Y/Cb/Cr: a 4:2:2,
+ * 4:4:4 or progressive picture decodes "successfully" into garbage, and a
+ * grey one fails.  Check the frame header and refuse the rest up front.
+ */
+static bool mjpeg_supported(struct device *dev, const u8 *p, u32 len)
+{
+	u32 i = 2;
+
+	if (len < 4 || p[0] != 0xff || p[1] != 0xd8)
+		return false;
+	while (i + 4 <= len) {
+		u8 marker;
+		u32 seg;
+
+		if (p[i] != 0xff) {
+			i++;
+			continue;
+		}
+		marker = p[i + 1];
+		if (marker == 0xff || marker == 0x01 ||
+		    (marker >= 0xd0 && marker <= 0xd7)) {
+			i += marker == 0xff ? 1 : 2;
+			continue;
+		}
+		seg = (p[i + 2] << 8) | p[i + 3];
+		if (marker == 0xc0 || marker == 0xc1) {
+			if (i + 2 + seg > len || seg < 17 || p[i + 4] != 8 ||
+			    p[i + 9] != 3)
+				break;
+			/* Y 2x2, Cb 1x1, Cr 1x1 */
+			if (p[i + 11] != 0x22 || p[i + 14] != 0x11 ||
+			    p[i + 17] != 0x11)
+				break;
+			return true;
+		}
+		if ((marker >= 0xc2 && marker <= 0xcf && marker != 0xc4 &&
+		     marker != 0xc8 && marker != 0xcc) || marker == 0xda)
+			break;
+		i += 2 + seg;
+	}
+	dev_dbg(dev, "mjpeg: not a baseline 4:2:0 JPEG\n");
+	return false;
+}
+
+static int mjpeg_prepare_input(struct aml_vdec_ctx *ctx,
+			       struct vb2_v4l2_buffer *src)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mjpeg_ctx *m = ctx->codec_priv;
+	struct vb2_buffer *vb = &src->vb2_buf;
+	const u8 *in = vb2_plane_vaddr(vb, 0);
+	u32 len = vb2_get_plane_payload(vb, 0);
+	u32 need = len + VLD_PADDING_SIZE + 64 + 8;
+	bool pad;
+	u8 *p;
+
+	/*
+	 * The microcode skips whatever segment follows SOI without looking at
+	 * it.  Encoders put APP0/COM there, but a webcam frame or a JPEG rebuilt
+	 * from VA-API buffers starts straight with DQT, which then goes missing
+	 * and the picture decodes with the wrong quantiser.  Give it a COM
+	 * segment to skip.
+	 */
+	pad = !((in[3] >= 0xe0 && in[3] <= 0xef) || in[3] == 0xfe);
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
+	if (pad) {
+		static const u8 com[] = { 0xff, 0xd8, 0xff, 0xfe, 0x00, 0x04, 0x00, 0x00 };
+
+		memcpy(p, com, sizeof(com));
+		memcpy(p + sizeof(com), in + 2, len - 2);
+		len += sizeof(com) - 2;
+	} else {
+		memcpy(p, in, len);
+	}
+	memset(p + len, 0, VLD_PADDING_SIZE);
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
+		     round_down(m->stage_paddr + len + VLD_PADDING_SIZE,
+				VDEC_FIFO_ALIGN));
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
+/* The reference's init_scaler(): a unity 4-point triangle in the pscaler. */
+static void mjpeg_init_scaler(struct aml_vdec_hw *hw)
+{
+	static const u32 filt_coef[] = {
+		0x20402000, 0x20402000, 0x1f3f2101, 0x1f3f2101,
+		0x1e3e2202, 0x1e3e2202, 0x1d3d2303, 0x1d3d2303,
+		0x1c3c2404, 0x1c3c2404, 0x1b3b2505, 0x1b3b2505,
+		0x1a3a2606, 0x1a3a2606, 0x19392707, 0x19392707,
+		0x18382808, 0x18382808, 0x17372909, 0x17372909,
+		0x16362a0a, 0x16362a0a, 0x15352b0b, 0x15352b0b,
+		0x14342c0c, 0x14342c0c, 0x13332d0d, 0x13332d0d,
+		0x12322e0e, 0x12322e0e, 0x11312f0f, 0x11312f0f,
+		0x10303010
+	};
+	/* horizontal/vertical initial info (Y, C) and phase steps */
+	static const u8 init_slot[] = { 37, 41, 39, 43 };
+	static const u8 step_slot[] = { 36, 40, 38, 42 };
+	struct regmap *map = hw->map[DOS_BUS];
+	int i;
+
+	regmap_write(map, PSCALE_CTRL, 0xc000);
+	regmap_write(map, PSCALE_BMEM_ADDR, 0);
+	for (i = 0; i < ARRAY_SIZE(filt_coef); i++) {
+		regmap_write(map, PSCALE_BMEM_DAT, 0);
+		regmap_write(map, PSCALE_BMEM_DAT, filt_coef[i]);
+	}
+	for (i = 0; i < ARRAY_SIZE(init_slot); i++) {
+		regmap_write(map, PSCALE_BMEM_ADDR, init_slot[i] * 2);
+		regmap_write(map, PSCALE_BMEM_DAT, 0x0008);
+		regmap_write(map, PSCALE_BMEM_DAT, 0x60000000);
+	}
+	for (i = 0; i < ARRAY_SIZE(step_slot); i++) {
+		regmap_write(map, PSCALE_BMEM_ADDR, step_slot[i] * 2 + 1);
+		regmap_write(map, PSCALE_BMEM_DAT, 0x10000);
+	}
+
+	regmap_write(map, DOS_SW_RESET0, 1 << 10);
+	regmap_write(map, DOS_SW_RESET0, 0);
+	regmap_write(map, PSCALE_RST, 0x7);
+	regmap_write(map, PSCALE_RST, 0x0);
+}
+
+static void mjpeg_job_done(struct aml_vdec_ctx *ctx, enum vb2_buffer_state st)
+{
+	struct aml_vdec_dev *dev = ctx->dev;
+	struct vb2_v4l2_buffer *dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	struct vb2_v4l2_buffer *src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+
+	/*
+	 * A JPEG request carries no controls, so the buffer is its only
+	 * object: once that is done the request is complete, and completing
+	 * the control side afterwards (as device_run does for the other
+	 * legacy codecs) binds to a finished request and WARNs.  Do it first.
+	 */
+	if (src && src->vb2_buf.req_obj.req)
+		v4l2_ctrl_request_complete(src->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
+	mjpeg_canvas_free(dev->dec_hw, ctx->codec_priv);
+	if (dst)
+		vb2_set_plane_payload(&dst->vb2_buf, 0,
+				      ctx->pix_fmt[AML_FMT_DST].plane_fmt[0].sizeimage);
+	ctx->int_cond = 1;
+	ctx->job_finished = true;
+	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, st);
+	wake_up(&ctx->queue);
+}
+
+static irqreturn_t mjpeg_isr(int irq, void *priv)
+{
+	struct aml_vdec_dev *dev = priv;
+
+	regmap_write(dev->dec_hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_CLR_REG, 1);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mjpeg_threaded_isr(int irq, void *priv)
+{
+	struct aml_vdec_dev *dev = priv;
+	struct aml_vdec_hw *hw = dev->dec_hw;
+	struct aml_mjpeg_ctx *m = hw->curr_ctx;
+	struct aml_vdec_ctx *ctx;
+	u32 status;
+
+	if (!m)
+		return IRQ_HANDLED;
+	ctx = m->v4l2_ctx;
+	if (ctx->job_finished)
+		return IRQ_HANDLED;
+
+	if (read_dos_reg(hw, AV_SCRATCH_D)) {
+		regmap_write(hw->map[DOS_BUS], AV_SCRATCH_D, 0);
+		return IRQ_HANDLED;
+	}
+
+	status = read_dos_reg(hw, MJPEG_DEC_STATUS);
+	dev_dbg(hw->dev, "mjpeg irq status %x from %x w %u h %u\n",
+		status, read_dos_reg(hw, MJPEG_FROM_AMRISC),
+		 read_dos_reg(hw, MJPEG_PIC_WIDTH),
+		 read_dos_reg(hw, MJPEG_PIC_HEIGHT));
+
+	/* Picture size report: the buffer is already there, go on. */
+	if (status == MJPEG_STATUS_SIZE) {
+		u32 w = read_dos_reg(hw, MJPEG_PIC_WIDTH);
+		u32 h = read_dos_reg(hw, MJPEG_PIC_HEIGHT);
+		struct v4l2_pix_format_mplane *pf = &ctx->pix_fmt[AML_FMT_DST];
+
+		if (w > pf->plane_fmt[0].bytesperline || h > pf->height) {
+			dev_err(hw->dev, "mjpeg %ux%u does not fit %ux%u\n",
+				w, h, pf->plane_fmt[0].bytesperline, pf->height);
+			mjpeg_job_done(ctx, VB2_BUF_STATE_ERROR);
+			return IRQ_HANDLED;
+		}
+		regmap_write(hw->map[DOS_BUS], MJPEG_DECODE_PARAM,
+			     (h << 4) | 0x8000);
+		regmap_write(hw->map[DOS_BUS], MJPEG_DEC_STATUS, 0);
+		return IRQ_HANDLED;
+	}
+	if (status == MJPEG_STATUS_TIMEOUT) {
+		mjpeg_job_done(ctx, VB2_BUF_STATE_ERROR);
+		return IRQ_HANDLED;
+	}
+
+	/*
+	 * Anything else is the end of the picture - the reference does not
+	 * look at what FROM_AMRISC holds either (it is often 0).
+	 */
+	m->decoded++;
+	regmap_write(hw->map[DOS_BUS], MJPEG_FROM_AMRISC, 0);
+	mjpeg_job_done(ctx, VB2_BUF_STATE_DONE);
+
+	return IRQ_HANDLED;
+}
+
+static void mjpeg_restore_hw(struct aml_vdec_ctx *ctx, u32 spec)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct regmap *map = hw->map[DOS_BUS];
+
+	regmap_write(map, AV_SCRATCH_4, spec);
+	regmap_write(map, AV_SCRATCH_5, 0 | (1 << 24));
+
+	regmap_write(map, DOS_SW_RESET0, (1 << 7) | (1 << 6));
+	regmap_write(map, DOS_SW_RESET0, 0);
+	mjpeg_init_scaler(hw);
+
+	regmap_write(map, MJPEG_TO_AMRISC, 0);
+	regmap_write(map, MJPEG_FROM_AMRISC, 0);
+	regmap_write(map, MJPEG_DEC_STATUS, 0);
+	regmap_write(map, AV_SCRATCH_D, 0);
+	regmap_write(map, MJPEG_STOP_POS, 0);
+
+	regmap_write(map, MCPU_INTR_MSK, 0xffff);
+	regmap_write(map, MJPEG_DECODE_PARAM,
+		     (ctx->pix_fmt[AML_FMT_DST].height << 4) | 0x8000);
+
+	regmap_write(map, VDEC_ASSIST_MBOX1_CLR_REG, 1);
+	regmap_write(map, VDEC_ASSIST_MBOX1_MASK, 1);
+	regmap_write(map, VDEC_ASSIST_AMR1_INT8, 8);
+	regmap_update_bits(map, MDEC_PIC_DC_CTRL, 1 << 17, 0);
+}
+
+int aml_mjpeg_init(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_mjpeg_ctx *m;
+	int i;
+
+	if (!vdec_get_hw(ctx->dev))
+		return -ENODEV;
+
+	m = kzalloc_obj(*m);
+	if (!m)
+		return -ENOMEM;
+	m->v4l2_ctx = ctx;
+	for (i = 0; i < ARRAY_SIZE(m->canvas); i++)
+		m->canvas[i] = -1;
+
+	ctx->codec_priv = m;
+	return 0;
+}
+
+void aml_mjpeg_exit(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_mjpeg_ctx *m = ctx->codec_priv;
+	struct aml_vdec_hw *hw;
+
+	if (!m)
+		return;
+	hw = vdec_get_hw(ctx->dev);
+
+	if (ctx->dos_clk_en)
+		aml_stop_vdec_hw(hw);
+	mjpeg_canvas_free(hw, m);
+	if (m->stage_vaddr)
+		dma_free_coherent(hw->dev, m->stage_size,
+				  m->stage_vaddr, m->stage_paddr);
+
+	if (hw->curr_ctx == m)
+		hw->curr_ctx = NULL;
+	kfree(m);
+	ctx->codec_priv = NULL;
+}
+
+int aml_mjpeg_dec_run(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_mjpeg_ctx *m = ctx->codec_priv;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct vb2_v4l2_buffer *src, *dst;
+	u32 spec;
+	long ret;
+
+	if (ctx->pix_fmt[AML_FMT_DST].pixelformat != V4L2_PIX_FMT_YUV420) {
+		dev_err(hw->dev, "mjpeg: capture format must be YUV420\n");
+		return -EINVAL;
+	}
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	if (!src || !dst)
+		return -EINVAL;
+
+	if (!mjpeg_supported(hw->dev, vb2_plane_vaddr(&src->vb2_buf, 0),
+			     vb2_get_plane_payload(&src->vb2_buf, 0)))
+		return -EINVAL;
+
+	hw->curr_ctx = m;
+	hw->hw_ops.irq_handler = mjpeg_isr;
+	hw->hw_ops.irq_threaded_func = mjpeg_threaded_isr;
+
+	if (mjpeg_prepare_input(ctx, src) < 0)
+		return -ENOMEM;
+
+	spec = mjpeg_canvas_setup(ctx, &dst->vb2_buf);
+	if (spec == ~0u)
+		return -ENOMEM;
+	mjpeg_restore_hw(ctx, spec);
+
+	dev_dbg(hw->dev, "mjpeg run %lu bytes spec %06x\n",
+		vb2_get_plane_payload(&src->vb2_buf, 0), spec);
+
+	ctx->int_cond = 0;
+	regmap_update_bits(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0x6, 0x6);
+	aml_start_vdec_hw(hw);
+
+	ret = wait_event_timeout(ctx->queue, ctx->int_cond,
+				 msecs_to_jiffies(MJPEG_TIMEOUT_MS));
+	ctx->int_cond = 0;
+	if (!ret) {
+		dev_err(hw->dev,
+			"mjpeg timeout: status %x from %x pc %x lvl %x rp %x wp %x bitcnt %x\n",
+			read_dos_reg(hw, MJPEG_DEC_STATUS),
+			read_dos_reg(hw, MJPEG_FROM_AMRISC),
+			read_dos_reg(hw, MPC_E),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_LEVEL),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_RP),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_WP),
+			read_dos_reg(hw, VIFF_BIT_CNT));
+		aml_stop_vdec_hw(hw);
+		mjpeg_canvas_free(hw, m);
+		return -ETIMEDOUT;
+	}
+
+	aml_stop_vdec_hw(hw);
+	return 0;
+}
diff --git a/drivers/media/platform/amlogic/vdec/mjpeg.h b/drivers/media/platform/amlogic/vdec/mjpeg.h
new file mode 100644
index 000000000000..153eb19ad79b
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/mjpeg.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Motion-JPEG decoding on the Amlogic legacy VDEC core.
+ */
+
+#ifndef _AML_MJPEG_H_
+#define _AML_MJPEG_H_
+
+/* Scratch register meanings for the mjpeg_multi microcode (vmjpeg_multi.c). */
+#define MJPEG_DECODE_PARAM	AV_SCRATCH_2	/* height << 4 | 0x8000 */
+#define MJPEG_TO_AMRISC		AV_SCRATCH_8
+#define MJPEG_FROM_AMRISC	AV_SCRATCH_9
+#define MJPEG_FRAME_OFFSET	AV_SCRATCH_A
+#define MJPEG_PIC_WIDTH		AV_SCRATCH_B
+#define MJPEG_PIC_HEIGHT	AV_SCRATCH_C
+#define MJPEG_DEC_STATUS	AV_SCRATCH_F
+#define MJPEG_STOP_POS		AV_SCRATCH_K
+
+#define MJPEG_STATUS_SIZE	1	/* picture size known, waits for an ack */
+#define MJPEG_STATUS_TIMEOUT	0x21
+
+/* Not in reg_defines.h; addresses from the staging meson vdec headers. */
+#define PSCALE_RST		REG_ALIGN(0x0910)
+#define PSCALE_BMEM_ADDR	REG_ALIGN(0x091f)
+#define PSCALE_BMEM_DAT		REG_ALIGN(0x0920)
+#define MCPU_INTR_MSK		REG_ALIGN(0x0304)
+#define VDEC_ASSIST_AMR1_INT8	REG_ALIGN(0x002d)
+
+int aml_mjpeg_init(void *priv);
+void aml_mjpeg_exit(void *priv);
+int aml_mjpeg_dec_run(void *priv);
+
+#endif
-- 
2.56.0

