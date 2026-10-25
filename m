Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956335;
	b=ctbmxcJ54yM4HBMWXjVskcClvFKX55d3zizsmtsgtgFkM5oIJbECDOI4jG6QC5Vv4/ND
	 7oHtc6tQjFcz1m3Dw6n4GLb4ZkS37CNcGFJX7iT4GS0317yU7TFKNaEQS81x1JG623rKf
	 OeT3tZqf/uprbvrGr4IPrT06p9vFjVbCyofoQCczWbh/WvGDqHNIJERaIBRi1e2fVato/
	 5n5Fkrve7tbsAscIdyiLfx8/3L1PdEDtG7oQZpWvUy75eFStEutPZUoDSBRftlCNlI40e
	 8SHe1R5neHVr4M0KVOSl83seogJVciaiC9NxiiHq/ACdES2g1X97MA8XGtZTQN5y9YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956335;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=UVBDLoVwd4uboXLVM/qE/6k5R7T7/xzfggC+5dCS8m8=;
	b=qBZ1lwmVxx3hWjF4Qn1gxnRYmkVMRq87Wdu7AtQjHAXrvJQx2SOcbF9NzI+2G5qRDydi
	 +OJiuh5qH8j0uzsvqVGvUeNwDydPhR0RYjqDxFnYt/gSmDCW8bjlYZ6B4rZuGk5zOlXDA
	 rUFc2Ulv4QvtkAdF4dqV30tXTPkoVDSp9Lrkr1mO7PiT7/jQrzO3HaVmEcB4P9SNTHg85
	 w+XO5yzXvEA9+0spptrN2P+aMt9Q1jy5YCELcRS+nNXKiISkkF5pfJPJqitleCzkPnLg2
	 T8PwJc046o0jV4J+MLDjmO6bOwqVNKeyaRCNmzv3bIcX0NxvR3jJIoJp32wjoue5+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=J9qyhIll;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDE60A3824;
	Sun, 25 Oct 2026 19:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EDE60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=J9qyhIll
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8En519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:20 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8En519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956322;
	bh=UVBDLoVwd4uboXLVM/qE/6k5R7T7/xzfggC+5dCS8m8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J9qyhIllGpmbA3bcdZnhOYiRqWUs90wv7V7Wb+6G98VUEKgnkZdVLB+k8y4eeQVrJ
	 cdvK7a6HCbSVm6q/qZ6yhjtGW2mLC+eDtcp8bInsYTi19BLy5Zv42NivKeIDOzPmRx
	 i/qK7oyl5RDIOarIS5+mX1OWdTjiJ69McLziZQAo=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 05/11] media: amlogic: vdec: add MPEG-1/2 decoding
Date: Sun, 25 Oct 2026 20:25:01 +0100
Message-ID: <20261025192507.210058-6-christian.koever-draxl@student.uibk.ac.at>
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

Decode MPEG-1 and MPEG-2 (V4L2_PIX_FMT_MPEG2_SLICE) on the VDEC core
with the mpeg12 multi-instance microcode. The microcode parses the
headers itself, so the sequence, picture and quantisation headers are
rebuilt from the stateless controls in front of the slice data.

Field pictures are decoded as pairs into one held CAPTURE buffer. The
output differs from ffmpeg by +-1..3 in a few blocks, which is the
hardware IDCT's rounding.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/Makefile  |   2 +-
 .../media/platform/amlogic/vdec/aml_vdec.c    |  18 +
 .../platform/amlogic/vdec/aml_vdec_platform.c |  17 +
 .../platform/amlogic/vdec/aml_vdec_tee_fw.c   |   5 +
 drivers/media/platform/amlogic/vdec/mpeg12.c  | 708 ++++++++++++++++++
 drivers/media/platform/amlogic/vdec/mpeg12.h  |  51 ++
 6 files changed, 800 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg12.c
 create mode 100644 drivers/media/platform/amlogic/vdec/mpeg12.h

diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
index 5a2cf8e6814e..6d91750ec673 100644
--- a/drivers/media/platform/amlogic/vdec/Makefile
+++ b/drivers/media/platform/amlogic/vdec/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o aml_vdec_tee_fw.o
+aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o mpeg12.o aml_vdec_tee_fw.o
 
 obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
index 2a5ff842fd39..7a5098f3e116 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
@@ -66,12 +66,30 @@ static const struct aml_vdec_v4l2_ctrl controls[] = {
 			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 		},
+	}, {
+		.codec_type = CODEC_TYPE_MPEG2,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE,
+		},
+	}, {
+		.codec_type = CODEC_TYPE_MPEG2,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_MPEG2_PICTURE,
+		},
+	}, {
+		.codec_type = CODEC_TYPE_MPEG2,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION,
+		},
 	},};
 
 static const struct aml_dec_type dec_type_name[] = {
 	{
 		.codec_type = CODEC_TYPE_H264,
 		.name = "H264",
+	}, {
+		.codec_type = CODEC_TYPE_MPEG2,
+		.name = "MPEG2",
 	},
 };
 
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
index fa4f979b07ee..83efadcb8aef 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
@@ -6,6 +6,7 @@
 #include "aml_vdec_platform.h"
 #include "aml_vdec_hw.h"
 #include "h264.h"
+#include "mpeg12.h"
 
 static struct aml_video_fmt aml_s4_video_formats[] = {
 	{
@@ -19,6 +20,17 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
 			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
 	},
+	{
+		.name = "MPEG-2",
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.type = AML_FMT_DEC,
+		.align = 64,
+		.is_10_bit_support = 0,
+		.codec_type = CODEC_TYPE_MPEG2,
+		.num_planes = 1,
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
+	},
 	{
 		.name = "NV21M",
 		.fourcc = V4L2_PIX_FMT_NV21M,
@@ -79,6 +91,11 @@ const struct aml_codec_ops aml_S4_dec_ops[] = {
 		.exit = aml_h264_exit,
 		.run = aml_h264_dec_run,
 	},
+	[CODEC_TYPE_MPEG2] = {
+		.init = aml_mpeg12_init,
+		.exit = aml_mpeg12_exit,
+		.run = aml_mpeg12_dec_run,
+	},
 };
 
 const struct aml_dev_platform_data aml_vdec_s4_pdata = {
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
index d7106ec47ba9..63da8b4dac28 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
@@ -82,6 +82,11 @@ static struct aml_tee_fw firmware[] = {
 		.core = CORE_VDEC_LEGENCY,
 		.is_swap = 1,
 	},
+	[CODEC_TYPE_MPEG2] = {
+		.fw_format = VIDEO_DEC_MPEG12_MULTI,
+		.core = CORE_VDEC_LEGENCY,
+		.is_swap = 0,
+	},
 };
 
 static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
diff --git a/drivers/media/platform/amlogic/vdec/mpeg12.c b/drivers/media/platform/amlogic/vdec/mpeg12.c
new file mode 100644
index 000000000000..e09ff4d79902
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/mpeg12.c
@@ -0,0 +1,708 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * MPEG-1/2 decoding on the Amlogic legacy VDEC core, stateless.
+ *
+ * Ported from the reference's frame-based vmpeg12_multi.c.  That microcode
+ * parses the elementary stream itself - sequence header, extensions, picture
+ * header and the slices - so the parsed V4L2 controls are turned back into
+ * the headers they came from and staged in front of the slice data.  The
+ * microcode decodes into whatever canvas REC_CANVAS_ADDR names and predicts
+ * from MREG_REF0 (older) and MREG_REF1 (newer) anchor pictures; reordering
+ * and the reference bookkeeping are left to userspace, like every other
+ * stateless codec.
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
+#include "mpeg12.h"
+
+#define MPEG12_TIMEOUT_MS	500
+#define MPEG12_HDR_MAX		1024
+#define MPEG12_TAIL		4
+
+struct mpeg12_canvas {
+	int y;
+	int uv;
+};
+
+struct aml_mpeg12_ctx {
+	struct aml_vdec_ctx *v4l2_ctx;
+
+	void *wks_vaddr;
+	dma_addr_t wks_paddr;
+	void *cc_vaddr;
+	dma_addr_t cc_paddr;
+
+	void *stage_vaddr;
+	dma_addr_t stage_paddr;
+	u32 stage_size;
+
+	/* rec, ref0, ref1 */
+	struct mpeg12_canvas canvas[3];
+
+	u32 pic_info;
+	u32 status;
+	u32 decoded;
+
+	/*
+	 * Field pictures come as two requests into one held capture buffer.
+	 * The first field is only stashed (headers + slices); the microcode
+	 * decodes both fields from one chunk when the second one arrives,
+	 * like the vendor's frame-based input, and interrupts once.
+	 */
+	u8 *fld_buf;
+	u32 fld_len;
+	u32 fld_cap;
+	u64 fld_ts;
+	bool fld_pending;
+	struct v4l2_ctrl_mpeg2_picture fld_pic;
+	/* the newest decoded I/P frame, for a field that predicts from its pair */
+	u64 anchor_ts;
+	bool anchor_valid;
+};
+
+struct bitw {
+	u8 *buf;
+	u32 bits;
+};
+
+static void put_bits(struct bitw *bw, u32 n, u32 v)
+{
+	while (n--) {
+		u32 byte = bw->bits >> 3;
+		u32 bit = 7 - (bw->bits & 7);
+
+		if (!(bw->bits & 7))
+			bw->buf[byte] = 0;
+		if ((v >> n) & 1)
+			bw->buf[byte] |= 1 << bit;
+		bw->bits++;
+	}
+}
+
+static void put_align(struct bitw *bw)
+{
+	while (bw->bits & 7)
+		put_bits(bw, 1, 0);
+}
+
+static void put_start(struct bitw *bw, u8 code)
+{
+	put_align(bw);
+	put_bits(bw, 24, 1);
+	put_bits(bw, 8, code);
+}
+
+static void *mpeg12_ctrl(struct aml_vdec_ctx *ctx, u32 id)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, id);
+
+	return ctrl ? ctrl->p_cur.p : NULL;
+}
+
+/*
+ * Rebuild sequence header + sequence extension + picture header + picture
+ * coding extension.  The quantiser matrices go in the sequence header
+ * (both are in zigzag order there and in the control); for 4:2:0 the chroma
+ * matrices are never used.
+ */
+static u32 mpeg12_write_headers(u8 *buf,
+				const struct v4l2_ctrl_mpeg2_sequence *seq,
+				const struct v4l2_ctrl_mpeg2_picture *pic,
+				const struct v4l2_ctrl_mpeg2_quantisation *quant,
+				bool with_seq)
+{
+	struct bitw bw = { .buf = buf };
+	u32 vbv = seq->vbv_buffer_size / 2048;
+	int i;
+
+	if (!vbv)
+		vbv = 112;
+
+	if (!with_seq)
+		goto picture;
+
+	put_start(&bw, 0xb3);
+	put_bits(&bw, 12, seq->horizontal_size & 0xfff);
+	put_bits(&bw, 12, seq->vertical_size & 0xfff);
+	put_bits(&bw, 4, 1);		/* aspect ratio: square */
+	put_bits(&bw, 4, 3);		/* 25 fps, informational */
+	put_bits(&bw, 18, 0x3ffff);	/* bit_rate: variable */
+	put_bits(&bw, 1, 1);
+	put_bits(&bw, 10, vbv & 0x3ff);
+	put_bits(&bw, 1, 0);		/* constrained_parameters_flag */
+	put_bits(&bw, 1, 1);
+	for (i = 0; i < 64; i++)
+		put_bits(&bw, 8, quant->intra_quantiser_matrix[i]);
+	put_bits(&bw, 1, 1);
+	for (i = 0; i < 64; i++)
+		put_bits(&bw, 8, quant->non_intra_quantiser_matrix[i]);
+
+	put_start(&bw, 0xb5);
+	put_bits(&bw, 4, 1);		/* sequence extension */
+	put_bits(&bw, 8, seq->profile_and_level_indication ?
+		 seq->profile_and_level_indication & 0xff : 0x48);
+	put_bits(&bw, 1, !!(seq->flags & V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE));
+	put_bits(&bw, 2, seq->chroma_format ? seq->chroma_format : 1);
+	put_bits(&bw, 2, (seq->horizontal_size >> 12) & 3);
+	put_bits(&bw, 2, (seq->vertical_size >> 12) & 3);
+	put_bits(&bw, 12, 0);		/* bit_rate_extension */
+	put_bits(&bw, 1, 1);
+	put_bits(&bw, 8, (vbv >> 10) & 0xff);
+	put_bits(&bw, 1, 0);		/* low_delay */
+	put_bits(&bw, 2, 0);
+	put_bits(&bw, 5, 0);
+
+picture:
+	put_start(&bw, 0x00);
+	put_bits(&bw, 10, 0);		/* temporal_reference */
+	put_bits(&bw, 3, pic->picture_coding_type);
+	put_bits(&bw, 16, 0xffff);	/* vbv_delay */
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_P ||
+	    pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B) {
+		put_bits(&bw, 1, 0);
+		put_bits(&bw, 3, 7);
+	}
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B) {
+		put_bits(&bw, 1, 0);
+		put_bits(&bw, 3, 7);
+	}
+	put_bits(&bw, 1, 0);		/* extra_bit_picture */
+
+	put_start(&bw, 0xb5);
+	put_bits(&bw, 4, 8);		/* picture coding extension */
+	put_bits(&bw, 4, pic->f_code[0][0]);
+	put_bits(&bw, 4, pic->f_code[0][1]);
+	put_bits(&bw, 4, pic->f_code[1][0]);
+	put_bits(&bw, 4, pic->f_code[1][1]);
+	put_bits(&bw, 2, pic->intra_dc_precision);
+	put_bits(&bw, 2, pic->picture_structure);
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST));
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT));
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV));
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE));
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC));
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN));
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST));
+	put_bits(&bw, 1, 1);		/* chroma_420_type */
+	put_bits(&bw, 1, !!(pic->flags & V4L2_MPEG2_PIC_FLAG_PROGRESSIVE));
+	put_bits(&bw, 1, 0);		/* composite_display_flag */
+	put_align(&bw);
+
+	return bw.bits >> 3;
+}
+
+/* Stash the first field of a pair: headers and slices, for the next job. */
+static int mpeg12_stash_field(struct aml_vdec_ctx *ctx,
+			      const struct v4l2_ctrl_mpeg2_sequence *seq,
+			      const struct v4l2_ctrl_mpeg2_picture *pic,
+			      const struct v4l2_ctrl_mpeg2_quantisation *quant,
+			      struct vb2_v4l2_buffer *src)
+{
+	struct aml_mpeg12_ctx *m = ctx->codec_priv;
+	u32 payload = vb2_get_plane_payload(&src->vb2_buf, 0);
+	u32 need = MPEG12_HDR_MAX + payload;
+	u32 hdr;
+
+	if (need > m->fld_cap) {
+		kvfree(m->fld_buf);
+		m->fld_cap = 0;
+		m->fld_buf = kvmalloc(need, GFP_KERNEL);
+		if (!m->fld_buf)
+			return -ENOMEM;
+		m->fld_cap = need;
+	}
+	hdr = mpeg12_write_headers(m->fld_buf, seq, pic, quant, true);
+	memcpy(m->fld_buf + hdr, vb2_plane_vaddr(&src->vb2_buf, 0), payload);
+	m->fld_len = hdr + payload;
+	m->fld_pic = *pic;
+	m->fld_ts = src->vb2_buf.timestamp;
+	m->fld_pending = true;
+	return 0;
+}
+
+static int mpeg12_prepare_input(struct aml_vdec_ctx *ctx,
+				const struct v4l2_ctrl_mpeg2_sequence *seq,
+				const struct v4l2_ctrl_mpeg2_picture *pic,
+				const struct v4l2_ctrl_mpeg2_quantisation *quant,
+				bool pair)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mpeg12_ctx *m = ctx->codec_priv;
+	struct vb2_v4l2_buffer *src;
+	struct vb2_buffer *vb;
+	u32 payload, hdr, need, len;
+	u8 *p;
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	if (!src)
+		return -EINVAL;
+	vb = &src->vb2_buf;
+	payload = vb2_get_plane_payload(vb, 0);
+
+	need = MPEG12_HDR_MAX + payload + MPEG12_TAIL + VLD_PADDING_SIZE + 64;
+	if (pair)
+		need += m->fld_len;
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
+	len = 0;
+	if (pair) {
+		memcpy(p, m->fld_buf, m->fld_len);
+		len = m->fld_len;
+	}
+	hdr = mpeg12_write_headers(p + len, seq, pic, quant, !pair);
+	memcpy(p + len + hdr, vb2_plane_vaddr(vb, 0), payload);
+	len += hdr + payload;
+	/* The microcode only ends the last slice on the next start code. */
+	p[len] = 0;
+	p[len + 1] = 0;
+	p[len + 2] = 1;
+	p[len + 3] = 0;
+	memset(p + len + MPEG12_TAIL, 0, VLD_PADDING_SIZE);
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
+		     round_down(m->stage_paddr + len + MPEG12_TAIL +
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
+static void mpeg12_canvas_free(struct aml_vdec_hw *hw, struct aml_mpeg12_ctx *m)
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
+static u32 mpeg12_canvas_setup(struct aml_vdec_ctx *ctx,
+			       struct mpeg12_canvas *c, struct vb2_buffer *vb)
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
+static u32 mpeg12_ref_spec(struct aml_vdec_ctx *ctx, struct mpeg12_canvas *c,
+			   u64 ts)
+{
+	struct vb2_queue *vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+	struct vb2_buffer *vb = vb2_find_buffer(vq, ts);
+
+	if (!vb)
+		return 0xffffffff;
+	return mpeg12_canvas_setup(ctx, c, vb);
+}
+
+static void mpeg12_job_done(struct aml_vdec_ctx *ctx, enum vb2_buffer_state st)
+{
+	struct aml_vdec_dev *dev = ctx->dev;
+
+	mpeg12_canvas_free(dev->dec_hw, ctx->codec_priv);
+	ctx->int_cond = 1;
+	ctx->job_finished = true;
+	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, st);
+	wake_up(&ctx->queue);
+}
+
+static irqreturn_t mpeg12_isr(int irq, void *priv)
+{
+	struct aml_vdec_dev *dev = priv;
+
+	regmap_write(dev->dec_hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_CLR_REG, 1);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mpeg12_threaded_isr(int irq, void *priv)
+{
+	struct aml_vdec_dev *dev = priv;
+	struct aml_vdec_hw *hw = dev->dec_hw;
+	struct aml_mpeg12_ctx *m = hw->curr_ctx;
+	struct aml_vdec_ctx *ctx;
+	u32 reg;
+
+	if (!m)
+		return IRQ_HANDLED;
+	ctx = m->v4l2_ctx;
+	if (ctx->job_finished)
+		return IRQ_HANDLED;
+
+	if (read_dos_reg(hw, MREG_DEBUG)) {
+		regmap_write(hw->map[DOS_BUS], MREG_DEBUG, 0);
+		return IRQ_HANDLED;
+	}
+
+	/* Sequence info report: the parameters are known already, go on. */
+	if (read_dos_reg(hw, MREG_SEQ_REPORT) == 1) {
+		regmap_write(hw->map[DOS_BUS], MREG_SEQ_REPORT, 0);
+		return IRQ_HANDLED;
+	}
+
+	/* User data (closed captions) - nobody consumes it here. */
+	if (read_dos_reg(hw, MREG_USERDATA) & (1 << 16)) {
+		regmap_write(hw->map[DOS_BUS], MREG_USERDATA, 0);
+		return IRQ_HANDLED;
+	}
+
+	reg = read_dos_reg(hw, MREG_BUFFEROUT);
+	m->status = reg;
+	m->pic_info = read_dos_reg(hw, MREG_PIC_INFO);
+
+	dev_dbg(hw->dev,
+		"mpeg12 irq out %u info %08x rec %06x w %u h %u err %u\n",
+		 reg, m->pic_info, read_dos_reg(hw, REC_CANVAS_ADDR),
+		 read_dos_reg(hw, MREG_PIC_WIDTH),
+		 read_dos_reg(hw, MREG_PIC_HEIGHT),
+		 read_dos_reg(hw, MREG_ERROR_COUNT));
+
+	switch (reg) {
+	case MPEG12_PIC_DONE:
+	case MPEG12_SEQ_END:
+		m->decoded++;
+		mpeg12_job_done(ctx, (m->pic_info & MPEG12_PICINFO_ERROR) ?
+				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+		break;
+	case MPEG12_DATA_EMPTY:
+	case MPEG12_DATA_REQUEST:
+		mpeg12_job_done(ctx, VB2_BUF_STATE_ERROR);
+		break;
+	default:
+		/* Not ours; leave the microcode waiting for the timeout. */
+		return IRQ_HANDLED;
+	}
+	regmap_write(hw->map[DOS_BUS], MREG_BUFFEROUT, 0);
+
+	return IRQ_HANDLED;
+}
+
+static void mpeg12_restore_hw(struct aml_vdec_ctx *ctx)
+{
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mpeg12_ctx *m = ctx->codec_priv;
+	u32 w = ctx->pic_info.coded_width;
+	u32 h = ctx->pic_info.coded_height;
+
+	regmap_write(hw->map[DOS_BUS], MREG_CO_MV_START, m->wks_paddr);
+	regmap_write(hw->map[DOS_BUS], MREG_CC_ADDR, m->cc_paddr);
+
+	/*
+	 * No context is carried between pictures: the headers are resent with
+	 * every one, so the microcode is always started as if fresh.
+	 */
+	regmap_write(hw->map[DOS_BUS], MPEG1_2_REG, 0);
+	regmap_write(hw->map[DOS_BUS], PSCALE_CTRL, 0);
+	regmap_write(hw->map[DOS_BUS], PIC_HEAD_INFO, 0x380);
+	regmap_write(hw->map[DOS_BUS], M4_CONTROL_REG, 0);
+	regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_CLR_REG, 1);
+	regmap_write(hw->map[DOS_BUS], MREG_BUFFEROUT, 0);
+	regmap_write(hw->map[DOS_BUS], VDEC_ASSIST_MBOX1_MASK, 1);
+	regmap_write(hw->map[DOS_BUS], MREG_CMD, (w << 16) | h);
+	regmap_write(hw->map[DOS_BUS], MREG_PIC_WIDTH, 0);
+	regmap_write(hw->map[DOS_BUS], MREG_PIC_HEIGHT, 0);
+	regmap_write(hw->map[DOS_BUS], MREG_SEQ_INFO, 0);
+	regmap_write(hw->map[DOS_BUS], MREG_SIGNAL_TYPE, 0);
+	regmap_write(hw->map[DOS_BUS], MREG_ERROR_COUNT, 0);
+	/* bit1: report width/height, bit0: CC buffer from the host */
+	regmap_write(hw->map[DOS_BUS], MREG_FATAL_ERROR, 3);
+	regmap_write(hw->map[DOS_BUS], MREG_WAIT_BUFFER, 0);
+	regmap_write(hw->map[DOS_BUS], MREG_SEQ_REPORT, 0);
+	regmap_write(hw->map[DOS_BUS], MREG_DEBUG, 0);
+	regmap_write(hw->map[DOS_BUS], MREG_DECODE_STOP_POS, 0);
+
+	regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, 1 << 17, 1 << 17);
+	if (ctx->dec_fmt[AML_FMT_DST].fourcc == V4L2_PIX_FMT_NV21 ||
+	    ctx->dec_fmt[AML_FMT_DST].fourcc == V4L2_PIX_FMT_NV21M)
+		regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL,
+				   1 << 16, 1 << 16);
+	else
+		regmap_update_bits(hw->map[DOS_BUS], MDEC_PIC_DC_CTRL, 1 << 16, 0);
+
+	regmap_write(hw->map[DOS_BUS], MREG_USERDATA, 0);
+	/* frame based input, no saved context */
+	regmap_write(hw->map[DOS_BUS], MREG_INPUT, 1 << 7);
+}
+
+int aml_mpeg12_init(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_mpeg12_ctx *m;
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
+	m->wks_vaddr = dma_alloc_coherent(hw->dev, MPEG12_WORKSPACE_SIZE,
+					  &m->wks_paddr, GFP_KERNEL);
+	m->cc_vaddr = dma_alloc_coherent(hw->dev, MPEG12_CCBUF_SIZE,
+					 &m->cc_paddr, GFP_KERNEL);
+	if (!m->wks_vaddr || !m->cc_vaddr) {
+		if (m->wks_vaddr)
+			dma_free_coherent(hw->dev, MPEG12_WORKSPACE_SIZE,
+					  m->wks_vaddr, m->wks_paddr);
+		if (m->cc_vaddr)
+			dma_free_coherent(hw->dev, MPEG12_CCBUF_SIZE,
+					  m->cc_vaddr, m->cc_paddr);
+		kfree(m);
+		return -ENOMEM;
+	}
+
+	ctx->codec_priv = m;
+	return 0;
+}
+
+void aml_mpeg12_exit(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_mpeg12_ctx *m = ctx->codec_priv;
+	struct aml_vdec_hw *hw;
+
+	if (!m)
+		return;
+	hw = vdec_get_hw(ctx->dev);
+
+	if (ctx->dos_clk_en)
+		aml_stop_vdec_hw(hw);
+	mpeg12_canvas_free(hw, m);
+
+	if (m->stage_vaddr)
+		dma_free_coherent(hw->dev, m->stage_size,
+				  m->stage_vaddr, m->stage_paddr);
+	dma_free_coherent(hw->dev, MPEG12_WORKSPACE_SIZE,
+			  m->wks_vaddr, m->wks_paddr);
+	dma_free_coherent(hw->dev, MPEG12_CCBUF_SIZE,
+			  m->cc_vaddr, m->cc_paddr);
+	kvfree(m->fld_buf);
+
+	if (hw->curr_ctx == m)
+		hw->curr_ctx = NULL;
+	kfree(m);
+	ctx->codec_priv = NULL;
+}
+
+int aml_mpeg12_dec_run(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_mpeg12_ctx *m = ctx->codec_priv;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	const struct v4l2_ctrl_mpeg2_sequence *seq;
+	const struct v4l2_ctrl_mpeg2_picture *pic;
+	const struct v4l2_ctrl_mpeg2_quantisation *quant;
+	const struct v4l2_ctrl_mpeg2_picture *rpic;
+	struct vb2_v4l2_buffer *src, *dst;
+	u32 rec, ref0 = 0xffffffff, ref1 = 0xffffffff;
+	u64 fwd;
+	bool field, pair;
+	long ret;
+
+	seq = mpeg12_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_SEQUENCE);
+	pic = mpeg12_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_PICTURE);
+	quant = mpeg12_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_QUANTISATION);
+	if (!seq || !pic || !quant)
+		return -EINVAL;
+
+	hw->curr_ctx = m;
+	hw->hw_ops.irq_handler = mpeg12_isr;
+	hw->hw_ops.irq_threaded_func = mpeg12_threaded_isr;
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	if (!src || !dst)
+		return -EINVAL;
+
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+	pair = field && m->fld_pending &&
+	       m->fld_ts == src->vb2_buf.timestamp &&
+	       m->fld_pic.picture_structure != pic->picture_structure;
+	if (!pair)
+		m->fld_pending = false;
+
+	if (field && !pair &&
+	    (src->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)) {
+		if (mpeg12_stash_field(ctx, seq, pic, quant, src) < 0)
+			return -ENOMEM;
+		dev_dbg(hw->dev, "mpeg12 stash field %u type %u\n",
+			pic->picture_structure,
+			 pic->picture_coding_type);
+		/* the capture buffer stays held for the second field */
+		ctx->int_cond = 1;
+		ctx->job_finished = true;
+		v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev_dec,
+						 ctx->m2m_ctx,
+						 VB2_BUF_STATE_DONE);
+		return 0;
+	}
+	m->fld_pending = false;
+
+	if (mpeg12_prepare_input(ctx, seq, pic, quant, pair) < 0)
+		return -ENOMEM;
+
+	mpeg12_restore_hw(ctx);
+
+	rec = mpeg12_canvas_setup(ctx, &m->canvas[0], &dst->vb2_buf);
+	if (rec == ~0u)
+		goto fail;
+
+	/*
+	 * REF0 is the older anchor, REF1 the newer one.  A pair takes its
+	 * references from the first field unless that is an I field; the
+	 * second field of an I/P pair predicts from its own first field, which
+	 * the microcode knows, and from the previous anchor frame.
+	 */
+	rpic = pic;
+	if (pair && m->fld_pic.picture_coding_type !=
+		    V4L2_MPEG2_PIC_CODING_TYPE_I)
+		rpic = &m->fld_pic;
+	fwd = rpic->forward_ref_ts;
+	if (fwd == dst->vb2_buf.timestamp && m->anchor_valid)
+		fwd = m->anchor_ts;
+	if (rpic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_P) {
+		ref1 = mpeg12_ref_spec(ctx, &m->canvas[2], fwd);
+		ref0 = ref1;
+	} else if (rpic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B) {
+		ref0 = mpeg12_ref_spec(ctx, &m->canvas[1], fwd);
+		ref1 = mpeg12_ref_spec(ctx, &m->canvas[2],
+				       rpic->backward_ref_ts);
+	}
+	if (rpic->picture_coding_type != V4L2_MPEG2_PIC_CODING_TYPE_B) {
+		m->anchor_ts = dst->vb2_buf.timestamp;
+		m->anchor_valid = true;
+	}
+	regmap_write(hw->map[DOS_BUS], MREG_REF0, ref0);
+	regmap_write(hw->map[DOS_BUS], MREG_REF1, ref1);
+	regmap_write(hw->map[DOS_BUS], REC_CANVAS_ADDR, rec);
+	regmap_write(hw->map[DOS_BUS], ANC2_CANVAS_ADDR, rec);
+
+	dev_dbg(hw->dev,
+		"mpeg12 run type %u struct %u%s %ux%u rec %06x ref0 %08x ref1 %08x\n",
+		 pic->picture_coding_type, pic->picture_structure,
+		 pair ? " pair" : "",
+		 seq->horizontal_size, seq->vertical_size,
+		 rec, ref0, ref1);
+
+	ctx->int_cond = 0;
+	regmap_update_bits(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0x6, 0x6);
+	aml_start_vdec_hw(hw);
+
+	/* Uninterruptible: see the note in vp9.c. */
+	ret = wait_event_timeout(ctx->queue, ctx->int_cond,
+				 msecs_to_jiffies(MPEG12_TIMEOUT_MS));
+	ctx->int_cond = 0;
+	if (!ret) {
+		dev_err(hw->dev,
+			"mpeg12 timeout: out %x info %x pc %x lvl %x rp %x wp %x bitcnt %x err %x\n",
+			read_dos_reg(hw, MREG_BUFFEROUT),
+			read_dos_reg(hw, MREG_PIC_INFO),
+			read_dos_reg(hw, MPC_E),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_LEVEL),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_RP),
+			read_dos_reg(hw, VLD_MEM_VIFIFO_WP),
+			read_dos_reg(hw, VIFF_BIT_CNT),
+			read_dos_reg(hw, MREG_ERROR_COUNT));
+		aml_stop_vdec_hw(hw);
+		mpeg12_canvas_free(hw, m);
+		return -ETIMEDOUT;
+	}
+
+	aml_stop_vdec_hw(hw);
+	return 0;
+
+fail:
+	mpeg12_canvas_free(hw, m);
+	return -ENOMEM;
+}
diff --git a/drivers/media/platform/amlogic/vdec/mpeg12.h b/drivers/media/platform/amlogic/vdec/mpeg12.h
new file mode 100644
index 000000000000..c5c9601623e1
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/mpeg12.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * MPEG-1/2 decoding on the Amlogic legacy VDEC core.
+ */
+
+#ifndef _AML_MPEG12_H_
+#define _AML_MPEG12_H_
+
+/* Scratch register meanings for the mpeg12_multi microcode (vmpeg12_multi.c). */
+#define MREG_CC_ADDR		AV_SCRATCH_0
+#define MREG_REF0		AV_SCRATCH_2
+#define MREG_REF1		AV_SCRATCH_3
+#define MREG_SEQ_INFO		AV_SCRATCH_4
+#define MREG_PIC_INFO		AV_SCRATCH_5
+#define MREG_PIC_WIDTH		AV_SCRATCH_6
+#define MREG_PIC_HEIGHT		AV_SCRATCH_7
+#define MREG_INPUT		AV_SCRATCH_8
+#define MREG_BUFFEROUT		AV_SCRATCH_9
+#define MREG_CMD		AV_SCRATCH_A
+#define MREG_CO_MV_START	AV_SCRATCH_B
+#define MREG_ERROR_COUNT	AV_SCRATCH_C
+#define MREG_FRAME_OFFSET	AV_SCRATCH_D
+#define MREG_WAIT_BUFFER	AV_SCRATCH_E
+#define MREG_FATAL_ERROR	AV_SCRATCH_F
+#define MREG_SEQ_REPORT		AV_SCRATCH_G
+#define MREG_SIGNAL_TYPE	AV_SCRATCH_H
+#define MREG_USERDATA		AV_SCRATCH_J
+#define MREG_DECODE_STOP_POS	AV_SCRATCH_K
+#define MREG_DEBUG		AV_SCRATCH_M
+
+/* VLD block registers the microcode keeps its picture state in. */
+#define MPEG1_2_REG		REG_ALIGN(0x0c01)
+#define PIC_HEAD_INFO		REG_ALIGN(0x0c03)
+
+/* MREG_BUFFEROUT values. */
+#define MPEG12_PIC_DONE		1
+#define MPEG12_DATA_EMPTY	2
+#define MPEG12_SEQ_END		3
+#define MPEG12_DATA_REQUEST	4
+
+#define MPEG12_PICINFO_ERROR	0x80000000
+#define MPEG12_PICINFO_TYPE	0x00030000
+
+#define MPEG12_WORKSPACE_SIZE	(4 * SZ_64K)
+#define MPEG12_CCBUF_SIZE	(5 * 1024)
+
+int aml_mpeg12_init(void *priv);
+void aml_mpeg12_exit(void *priv);
+int aml_mpeg12_dec_run(void *priv);
+
+#endif
-- 
2.56.0

