Received: from outbound.mr.icloud.com (mr-2004e-snip4-11.eps.apple.com [57.103.69.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F884EF158
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737393; cv=none; b=fQwqByB1DbWNjTEX++U6zm0e3glXie2wpL6l7ka+aabznm/PCUCGG/J0GoUqsv+/Zp6wiaVsOVilgbQLIYCdC8ROK2VzvlwGsTwdQHYoPTB/WxVxJHOJHdOWPbTPJcL5LVOzrb1ptcfF1spJqe390ElCgFmlaUBh/aeTk1uW5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737393; c=relaxed/simple;
	bh=UJxVcf16PBg0RMCquG83QRCbmgRRn1OliPU+HNqepsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JySpnYwr2uFwyE/Srb8KdWDkLgMmjJZb7XFri2G2f+b4lyCo7f1tqCzIqin+A+hta4rrIeaD8PFkUBt05lusLVFWwMIIwTcxWLBYcHXmRug9o8JT79QzAxHY0S6zAGw2RL7JniiP6zIH3BR0ObJhsVn3SosrZbgYYl13AIlBpdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=XnPsMm8r; arc=none smtp.client-ip=57.103.69.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="XnPsMm8r"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id D38EE180184F;
	Fri, 18 Sep 2026 13:16:24 +0000 (UTC)
X-ICL-RepId: 01a0b4a9-3b55-7a0c-bdc7-66ad6f161a86
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGA0MUTApUAFwLQwgeB1gCK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737387; x=1792329387; bh=7lw5RMcosrCIoI5mHIqE3B5Oz6d22zIRejbfFZ9IMUU=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=XnPsMm8riuVofng34ekKElnBB2TWkvJvcU0AISfYRavHRDIvUWYsz9qCfcAHA8KM1k9OYmO+ZOXleCAdIHoJjPLwVWwm4JkbbB4WKnmDJORWlshynXjha717FgtQhqlM2iuwkeqq9xhxiyf0QjauRIi5fUQSITBCWInsRGHlv5TfduWLVXUHHTmBFLcvqRl6Rz1vqoAcYD7FsplFBBV30SN8lhV/DrjaLJeRF6D/XiX+mNpf03nr07fweVC2YZpK+WP8org3bitHIF5iCzwuTxEIgZHribOewgchaEYwSN51TKZ7KW0NSRXqSiS94vCwbyqD/ALN4I/vuuBQyYfspw==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 2FDBC1800141;
	Fri, 18 Sep 2026 13:16:21 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:18 +0200
Subject: [PATCH 13/14] media: apple: avd: add hevc support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-13-49977931f455@icloud.com>
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
X-Authority-Info-Out: v=2.4 cv=UaRciaSN c=1 sm=1 tr=0 ts=6aad39aa
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=7YfXLusrAAAA:8 a=s8YR1HE3AAAA:8 a=cm27Pg_UAAAA:8
 a=iboFVNew7yKLZztMqZsA:9 a=QEXdDO2ut3YA:10 a=SLz71HocmBbuEhFRYD3r:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX7RWcIZ5CbkM2
 p+SQ786DitWgaBY6U7+cInqH+O6RN7MlAFriHJQJvVMyYLQmYIHPBVMctrm8tNTwTTNfoKK/Cok
 5cBjqJ8JyaGhRdvgsB2MaHDtoi2A5xW3UIWd/KWNgmdVpya/mTYW02dPh1brCB1hGYtP41sXEF5
 xojSRzQJeAIVEAqR/7ctZ10suJB+2utzeWZMyE9jpfg345I+J5p9/d7OzuLEKQNPSmR407k1QqH
 BGHxETxdpQJnCmPg2uUJtE5GcdoMijKRD0zRutLn3Y1Xv2T9iW36p/cM7uk6qzjUI5LYmebQAgx
 ZEG0BikvyB4rouyFtdHtSO7aDpIL9x+hFJuIkw+Rem6/FyxaXjTRjHlbC2USjE=
X-Proofpoint-GUID: PBdPgPbVNDdLqiWbYw1L7rtdWENVixDF
X-Proofpoint-ORIG-GUID: PBdPgPbVNDdLqiWbYw1L7rtdWENVixDF
X-JNJ: AAAAAAABjjW7A7kuqdkhvdbo5U7XcMAoXCuREQW6/CKLXEUyhtZB/xfQ3bBePmYB56xNctQVNRJ7XExqpMpeaVLyzrDUvNut73prk3f6I8ORP1OmOqq890TyFXovb+4V5M/8TtkKCKZyXLiYkAPDlwRic7hLybshWPSYT3FgyUqiieIBJkC+cnwGyWHvWt0JaPqVgCwgStZ2NwGKrfdVBVjR4tBNfblwuY5A4/rAO/VOwEQOXHDQFIpk1AeqN2+yITa5dFyjrX/5yEflq4PgZ5NfKTtthhw86FvkQ6VZwD+a90o1gmglZ8PcHQcsdxfVsXpwWW155MQbY5AjfOiag01Bavge/560n9XzEHXwZl2DtEmjRKN4yeGnqBj7QPdIlsG9+2IHs2G4RjvedwJTWoScZkilsT/h75VlQXeR2KQiWVF6esmcGDffSXhme4xa0hDe87XSwMJ1LWz4m9/7s9JktTSJXeIu4PEEJAsYkPd9TVihgFVE9LSkf8LKiomouT1dRVp5HdQyPHADdHtLuattM8/yf80tRsQMj3HLWkGQq+OaUaCQjTAmv1WO+rfYlxjAZpcP4oq9XYdfB1qXGVo/M2L8uG+Is6jDSDJdX1H5zZ4f+GK/5of9clznQTcra1Vn9HnqfQ9bpASWf4aDRIsbmdS1cb/9RclqoxEuHZvmTGrJzlm4okaJPbGFShV9oIX6oUVeBpKD4Ul/uzOfOriyhT1J24mZzRrMrBKh9DY+tgNnxW82P9FmEldDz7Gj83cm4QDciz1yDbg44hdUSCmQTYV9ujzF90CCMb+wryz5Dm+KPEV+ZVtewbxIRbkhJaNkFLVUNDIm2Q2cXMikM7/LzAHxlkJTTOCS++nz+OW2tIKD/VH0HBN+A119ijSBgPOAgw==

The fluster score is 143/147 for JCT-VC-HEVC_V1.

RPS_E_qualcomm_5, WPP_D_ericsson_MAIN_2 and WPP_D_ericsson_MAIN10_2 are
failing, but should be supported. WPP tests fail at random when
increasing job count in fluster.

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/platform/apple/avd/Makefile   |    2 +-
 drivers/media/platform/apple/avd/avd-hevc.c | 1326 +++++++++++++++++++++++++++
 drivers/media/platform/apple/avd/avd-v4l2.c |   70 ++
 drivers/media/platform/apple/avd/avd.h      |    6 +
 4 files changed, 1403 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/apple/avd/Makefile b/drivers/media/platform/apple/avd/Makefile
index 54ea67a589cd..6109d12b8452 100644
--- a/drivers/media/platform/apple/avd/Makefile
+++ b/drivers/media/platform/apple/avd/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-apple-avd-y := avd-drv.o avd-v4l2.o avd-hw.o avd-h264.o avd-vp9.o
+apple-avd-y := avd-drv.o avd-v4l2.o avd-hw.o avd-h264.o avd-vp9.o avd-hevc.o
 obj-$(CONFIG_VIDEO_APPLE_AVD) += apple-avd.o
diff --git a/drivers/media/platform/apple/avd/avd-hevc.c b/drivers/media/platform/apple/avd/avd-hevc.c
new file mode 100644
index 000000000000..d4815c031f7d
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-hevc.c
@@ -0,0 +1,1326 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Video Decoder HEVC driver
+ *
+ * Copyright (C) 2026 The Asahi Linux Contributors
+ * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
+ * Copyright (C) 2023 Eileen Yoon <eyn@gmx.com>
+ *
+ * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
+ *	Hertz Wong <hertz.wong@rock-chips.com>
+ *	Herman Chen <herman.chen@rock-chips.com>
+ *
+ * Copyright (C) 2014 Google, Inc.
+ *	Tomasz Figa <tfiga@chromium.org>
+ */
+
+#include <media/videobuf2-dma-contig.h>
+
+#include "avd.h"
+#include "avd-inst.h"
+
+#define NEW_TILE_ID	BIT(0)
+#define NEW_SLICE	BIT(1)
+
+#define HEVC_TR_INTRA(v)	FIELD_PREP(GENMASK(4, 1), v)
+#define HEVC_TR_INTER(v)	FIELD_PREP(GENMASK(7, 4), v)
+
+#define HEVC_PCM_EN(v)		FIELD_PREP(BIT(12), !!(v))
+#define HEVC_PCM_BD_LUMA(v)	FIELD_PREP(GENMASK(11, 8), v)
+#define HEVC_PCM_BD_CHROMA(v)	FIELD_PREP(GENMASK(7, 4), v)
+#define HEVC_PCM_CB_MIN_LUMA(v)	FIELD_PREP(GENMASK(3, 2), v)
+#define HEVC_PCM_CB_LUMA(v)	FIELD_PREP(GENMASK(1, 0), v)
+
+#define HEVC_UNK_ISM_EN(v)	FIELD_PREP(BIT(9), !!(v))
+#define HEVC_UNK_FLAG		FIELD_PREP(BIT(3), 1)
+
+#define HEVC_CTB_SIZE(v)	FIELD_PREP(GENMASK(8, 3), v)
+#define HEVC_MERGE_LV(v)	FIELD_PREP(GENMASK(11, 9), v)
+#define HEVC_FLAG_ENTROPY_EN(v)	FIELD_PREP(BIT(12), !!(v))
+#define HEVC_FLAG_TILES_EN(v)	FIELD_PREP(BIT(13), !!(v))
+#define HEVC_FLAG_TQB_EN(v)	FIELD_PREP(BIT(14), !!(v))
+#define HEVC_CU_QP_DD(v)	FIELD_PREP(GENMASK(16, 15), v)
+#define HEVC_FLAG_CU_QP_EN(v)	FIELD_PREP(BIT(17), !!(v))
+#define HEVC_FLAG_TSKIP_EN(v)	FIELD_PREP(BIT(18), !!(v))
+#define HEVC_FLAG_CI_PRED(v)	FIELD_PREP(BIT(19), !!(v))
+#define HEVC_FLAG_SDH_EN(v)	FIELD_PREP(BIT(20), !!(v))
+#define HEVC_FLAG_TMVP_EN(v)	FIELD_PREP(BIT(21), !!(v))
+
+#define HEVC_SCL_DIMS	0x127ffff
+
+static inline u32 mv_color_size(u32 w, u32 h)
+{
+	/* this will waste some memory when max cu size != 64 */
+	return DIV_ROUND_UP(w, 64) * DIV_ROUND_UP(h, 64) * 256;
+}
+
+struct avd_hevc_tile_info {
+	u16 col_width[22];
+	u16 row_height[22];
+	u32 col_bd[23];
+	u32 row_bd[23];
+	u32 *ctb_addr_rs_to_ts;
+	u32 *tile_ids;
+};
+
+struct avd_hevc_run {
+	struct avd_run base;
+	const struct v4l2_ctrl_hevc_slice_params *sl;
+	const struct v4l2_ctrl_hevc_decode_params *decode;
+	const struct v4l2_ctrl_hevc_sps *sps;
+	const struct v4l2_ctrl_hevc_pps *pps;
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
+	const u32 *entry_point_offsets;
+	int num_entry_point_offsets;
+	int num_slices;
+	struct run_addr {
+		dma_addr_t mv_color;
+	} addresses;
+	struct avd_hevc_tile_info tile_info;
+};
+
+struct avd_hevc_ctx {
+	struct avd_h264_bufs {
+		struct avd_buf mv_above_info;
+		struct avd_buf az_above;
+		struct avd_buf ip_above;
+		struct avd_buf lf_above;
+		struct avd_buf lf_above_info;
+		struct avd_buf lf_left;
+		struct avd_buf lf_left_info;
+		struct avd_buf sw_left;
+	} bufs;
+	int submit_num;
+};
+
+static void stream_refs(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_decode_params *decode = run->decode;
+	const struct v4l2_ctrl_hevc_slice_params *sl = &run->sl[0];
+	const struct v4l2_hevc_dpb_entry *dpb;
+	struct avd_hevc_ctx *hevc_ctx = ctx->priv;
+	struct avd_decoded_buffer *dst, *ref_buf;
+
+	dst = vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
+
+	push(0, "");
+	pusha(hevc_ctx->bufs.mv_above_info.addr, "mv_above_info", 7);
+	pusha(run->addresses.mv_color, "mv_color", 0);
+
+	push(0, "");
+	push(0, "");
+	push(0, "");
+	push(0, "");
+
+	for (int i = 0; i < decode->num_active_dpb_entries; i++) {
+		dpb = &decode->dpb[i];
+
+		ref_buf = avd_get_ref_buf(ctx, &dst->base.vb, dpb->timestamp);
+
+		dma_addr_t comp_addr = vb2_dma_contig_plane_dma_addr(
+					       &ref_buf->base.vb.vb2_buf, 0) +
+				       ref_buf->comp.start_offset;
+
+		push(AVD_REF_NUM(decode->num_active_dpb_entries - 1) |
+			     AVD_REF_FLAG_CONST |
+			     AVD_REF_FLAG_LONG(
+				     dpb->flags &
+				     V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE) |
+			     AVD_REF_DELTA_POC(sl->slice_pic_order_cnt -
+					       dpb->pic_order_cnt_val),
+		     "hdr_d0_ref_hdr");
+
+		push_comp(ctx, comp_addr, ref_buf->comp.offsets);
+	}
+}
+
+static void set_scaling_lists(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_scaling_matrix *s = run->scaling_matrix;
+	int i, j, k;
+
+	u8 (*dc_16x16)[3] = (u8(*)[3])s->scaling_list_dc_coef_16x16;
+	u8 (*sc_4x4)[4][4] = (u8(*)[4][4])s->scaling_list_4x4;
+	u8 (*sc_8x8)[2][4][8] = (u8(*)[2][4][8])s->scaling_list_8x8;
+	u8 (*sc_16x16)[2][4][8] = (u8(*)[2][4][8])s->scaling_list_16x16;
+	u8 (*sc_32x32)[2][4][8] = (u8(*)[2][4][8])s->scaling_list_32x32;
+
+	/*
+	 * this should presumably be how many of each are enabled?
+	 * or some other scaling related thing
+	 */
+	push(HEVC_SCL_DIMS, "hdr_7c_pps_scl_dims");
+
+	for (i = 0; i < 2; i++)
+		push(AVD_SCALING_I2(dc_16x16[i][0]) |
+			     AVD_SCALING_I1(dc_16x16[i][1]) |
+			     AVD_SCALING_I0(dc_16x16[i][2]),
+		     "dc_16x16");
+
+	for (i = 0; i < 2; i++)
+		push(AVD_SCALING_I2(s->scaling_list_dc_coef_32x32[i]),
+		     "dc_32x32");
+
+	/* transposed in stride 4 */
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 4; j++)
+			push(AVD_SCALING_I3(sc_4x4[i][0][j]) |
+				     AVD_SCALING_I2(sc_4x4[i][1][j]) |
+				     AVD_SCALING_I1(sc_4x4[i][2][j]) |
+				     AVD_SCALING_I0(sc_4x4[i][3][j]),
+			     "scaling_4x4");
+
+	/* transposed in stride 8 */
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 2; j++)
+			for (k = 0; k < 8; k++)
+				push(AVD_SCALING_I3(sc_8x8[i][j][0][k]) |
+					     AVD_SCALING_I2(
+						     sc_8x8[i][j][1][k]) |
+					     AVD_SCALING_I1(
+						     sc_8x8[i][j][2][k]) |
+					     AVD_SCALING_I0(sc_8x8[i][j][3][k]),
+				     "scaling_8x8");
+
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 2; j++)
+			for (k = 0; k < 8; k++)
+				push(AVD_SCALING_I3(sc_16x16[i][j][0][k]) |
+					     AVD_SCALING_I2(
+						     sc_16x16[i][j][1][k]) |
+					     AVD_SCALING_I1(
+						     sc_16x16[i][j][2][k]) |
+					     AVD_SCALING_I0(
+						     sc_16x16[i][j][3][k]),
+				     "scaling_16x16");
+
+	for (i = 0; i < 2; i++)
+		for (j = 0; j < 2; j++)
+			for (k = 0; k < 8; k++)
+				push(AVD_SCALING_I3(sc_32x32[i][j][0][k]) |
+					     AVD_SCALING_I2(
+						     sc_32x32[i][j][1][k]) |
+					     AVD_SCALING_I1(
+						     sc_32x32[i][j][2][k]) |
+					     AVD_SCALING_I0(
+						     sc_32x32[i][j][3][k]),
+				     "scaling_32x32");
+}
+
+static void hevc_set_flags(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_decode_params *decode = run->decode;
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+
+	u32 log2_ctb_size = ((sps->log2_min_luma_coding_block_size_minus3) +
+			     sps->log2_diff_max_min_luma_coding_block_size);
+
+	push(HEVC_PCM_EN(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED) |
+		     HEVC_PCM_BD_LUMA(sps->pcm_sample_bit_depth_luma_minus1) |
+		     HEVC_PCM_BD_CHROMA(
+			     sps->pcm_sample_bit_depth_chroma_minus1) |
+		     HEVC_PCM_CB_MIN_LUMA(
+			     sps->log2_min_pcm_luma_coding_block_size_minus3) |
+		     HEVC_PCM_CB_LUMA(
+			     sps->log2_diff_max_min_pcm_luma_coding_block_size +
+			     sps->log2_min_pcm_luma_coding_block_size_minus3),
+	     "hdr_30_sps_pcm");
+
+	/*
+	 * RExt sets a few new flags here
+	 */
+	push(HEVC_UNK_FLAG |
+		     HEVC_UNK_ISM_EN(
+			     sps->flags &
+			     V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED),
+	     "hdr_34_sps_flags");
+
+	push(HEVC_CTB_SIZE(log2_ctb_size) |
+		     HEVC_MERGE_LV(pps->log2_parallel_merge_level_minus2) |
+		     HEVC_FLAG_ENTROPY_EN(
+			     pps->flags &
+			     V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED) |
+		     HEVC_FLAG_TILES_EN(pps->flags &
+					V4L2_HEVC_PPS_FLAG_TILES_ENABLED) |
+		     HEVC_FLAG_TQB_EN(
+			     pps->flags &
+			     V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED) |
+		     HEVC_CU_QP_DD(log2_ctb_size -
+				   pps->diff_cu_qp_delta_depth) |
+		     HEVC_FLAG_CU_QP_EN(
+			     pps->flags &
+			     V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED) |
+		     HEVC_FLAG_TSKIP_EN(
+			     pps->flags &
+			     V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED) |
+		     HEVC_FLAG_CI_PRED(
+			     pps->flags &
+			     V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED) |
+		     HEVC_FLAG_SDH_EN(
+			     pps->flags &
+			     V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED) |
+		     HEVC_FLAG_TMVP_EN(
+			     !(decode->flags &
+			       V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC) &&
+			     sps->flags &
+				     V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED),
+	     "hdr_5c_pps_flags");
+
+	push(AVD_HDR_H26X_QP_OFFSET_CB(pps->pps_cb_qp_offset) |
+		     AVD_HDR_H26X_QP_OFFSET_CR(pps->pps_cr_qp_offset),
+	     "hdr_60_pps_qp");
+
+	push(0, "hdr_64_zero");
+	push(0, "hdr_68_zero");
+	push(0, "hdr_6c_zero");
+	push(0, "hdr_70_zero");
+	push(0, "hdr_74_zero");
+	push(0, "hdr_78_zero");
+}
+
+static void set_header(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+	struct avd_dev *avd = ctx->dev;
+	struct avd_hevc_ctx *hevc_ctx = ctx->priv;
+	u32 bytesperline;
+	u32 width = sps->pic_width_in_luma_samples;
+	u32 height = sps->pic_height_in_luma_samples;
+
+	bool is_intra = run->sl[0].slice_type == V4L2_HEVC_SLICE_TYPE_I;
+
+	push(AVD_OP_HDR | AVD_OP_HDR_FLAG_DECOMP(ctx->decomp) |
+		     AVD_OP_HDR_FLAG_INTRA(is_intra) | AVD_OP_HDR_CONST |
+		     AVD_OP_HDR_FLAG_PIPE_STATE(
+			     !(avd->variant->quirks & AVD_QUIRK_NO_PIPE_STATE)),
+	     "hdr_34_start_hdr");
+
+	push(AVD_HDR_CODEC_MODE(AVD_CODEC_HEVC), "hdr_50_mode");
+	push(AVD_HDR_HEIGHT(height - 1) | AVD_HDR_WIDTH(width - 1),
+	     "hdr_54_height_width");
+	push(0, "hdr_58_pixfmt_zero");
+
+	push(AVD_HDR_HEIGHT((height - 1) >> 3) |
+		     AVD_HDR_WIDTH((width - 1) >> 3),
+	     "hdr_28_height_width_shift3");
+
+	push(AVD_HDR_COMMON_CHROMA_FORMAT(sps->chroma_format_idc) |
+		     AVD_HDR_COMMON_BIT_DEPTH_C(sps->bit_depth_chroma_minus8) |
+		     AVD_HDR_COMMON_BIT_DEPTH_L(sps->bit_depth_luma_minus8) |
+		     AVD_HDR_COMMON_MIN_LUMA_CBS(
+			     sps->log2_min_luma_coding_block_size_minus3) |
+		     AVD_HDR_COMMON_LUMA_CBS(
+			     sps->log2_diff_max_min_luma_coding_block_size +
+			     sps->log2_min_luma_coding_block_size_minus3) |
+		     AVD_HDR_COMMON_MIN_LUMA_TBS(
+			     sps->log2_min_luma_transform_block_size_minus2) |
+		     AVD_HDR_COMMON_LUMA_TBS(
+			     sps->log2_diff_max_min_luma_transform_block_size +
+			     + sps->log2_min_luma_transform_block_size_minus2) |
+		     HEVC_TR_INTER(sps->max_transform_hierarchy_depth_inter) |
+		     HEVC_TR_INTRA(sps->max_transform_hierarchy_depth_intra) |
+		     AVD_HDR_COMMON_FLAG0(sps->flags &
+					  V4L2_HEVC_SPS_FLAG_AMP_ENABLED),
+	     "hdr_2c_sps_txfm");
+
+	hevc_set_flags(ctx, run);
+
+	push(AVD_HDR_FEAT_H26X | AVD_HDR_FEAT_COMMON |
+		     AVD_HDR_FEAT_PIPE_STATE_EN(
+			     !(avd->variant->quirks & AVD_QUIRK_NO_PIPE_STATE)),
+	     "hdr_98_const_30");
+
+	push(0, "");
+	push(0, "");
+
+	if (avd->variant->revision == 3)
+		push(0, "");
+
+	push(0, "");
+	push(0, "");
+
+	if (avd->variant->revision == 3)
+		push(0, "");
+	else if (!(avd->variant->quirks & AVD_QUIRK_NO_PIPE_STATE))
+		pusha(ctx->pipe_state.addr, "pipe_state", 0);
+
+	pusha(hevc_ctx->bufs.ip_above.addr, "ip_above", 0);
+	pusha(hevc_ctx->bufs.lf_above.addr, "lf_above", 1);
+	pusha(hevc_ctx->bufs.lf_above_info.addr, "lf_above_info", 2);
+	pusha(hevc_ctx->bufs.lf_left.addr, "lf_left", 3);
+	pusha(hevc_ctx->bufs.lf_left_info.addr, "lf_left_info", 4);
+	pusha(hevc_ctx->bufs.az_above.addr, "az_above", 8);
+	pusha(hevc_ctx->bufs.sw_left.addr, "sw_left", 9);
+
+	push(0, "");
+
+	push_comp(ctx, run->base.comp_out, ctx->comp.offsets);
+
+	pusha((u64)0, "packed_fmt_scratch", 0);
+
+	bytesperline = ctx->decoded_fmt.fmt.pix_mp.plane_fmt[0].bytesperline;
+	if (avd->variant->quirks & AVD_QUIRK_LSR)
+		bytesperline = bytesperline >> 4;
+
+	pusha(run->base.y_out, "y_out", 0);
+	push(bytesperline, "y_bpl");
+	pusha(run->base.uv_out, "uv_out", 0);
+	push(bytesperline, "uv_bpl");
+	push(0, "");
+	push(AVD_HDR_HEIGHT(height - 1) | AVD_HDR_WIDTH(width - 1),
+	     "hdr_54_height_width");
+
+	if (!is_intra)
+		stream_refs(ctx, run);
+
+	if ((sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED))
+		set_scaling_lists(ctx, run);
+	else
+		push(0, "");
+}
+
+static void stream_weights(struct avd_ctx *ctx, struct avd_hevc_run *run,
+			   const struct v4l2_ctrl_hevc_slice_params *sl)
+{
+	int luma_weight_denom, chroma_weight_denom;
+	u8 chroma_log2_weight_denom;
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	const struct v4l2_hevc_pred_weight_table *pred = &sl->pred_weight_table;
+	bool has_luma_weights =
+		((pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED) &&
+		 sl->slice_type == V4L2_HEVC_SLICE_TYPE_P) ||
+		((pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED) &&
+		 sl->slice_type == V4L2_HEVC_SLICE_TYPE_B);
+
+	const s8(*delta_chroma_weights)[2];
+	const s8(*chroma_offsets)[2];
+	const s8 *delta_luma_weights;
+	const s8 *luma_offsets;
+
+	if (!has_luma_weights) {
+		push(AVD_OP_WEIGHTS_HDR, "slc_76c_cmd_weights_denom");
+		return;
+	}
+
+	chroma_log2_weight_denom = pred->luma_log2_weight_denom +
+				   pred->delta_chroma_log2_weight_denom;
+
+	push(AVD_OP_WEIGHTS_HDR | AVD_OP_WEIGHTS_HDR_FLAG1(!has_luma_weights) |
+		     AVD_OP_WEIGHTS_HDR_FLAG0(has_luma_weights) |
+		     AVD_OP_WEIGHTS_HDR_LUMA(pred->luma_log2_weight_denom) |
+		     AVD_OP_WEIGHTS_HDR_CHROMA(chroma_log2_weight_denom),
+	     "slc_76c_cmd_weights_denom");
+
+	luma_weight_denom = 1 << pred->luma_log2_weight_denom;
+	chroma_weight_denom = 1 << chroma_log2_weight_denom;
+
+	/* comes from 7.4.7.3 */
+
+	for (int y = 0; y < 2; y++) {
+		if (y == 1 && sl->slice_type != V4L2_HEVC_SLICE_TYPE_B)
+			break;
+		luma_offsets = y == 0 ? pred->luma_offset_l0 :
+					pred->luma_offset_l1;
+		delta_luma_weights =
+			(s8(*))(y == 0 ? pred->delta_luma_weight_l0 :
+					 pred->delta_luma_weight_l1);
+		chroma_offsets = (s8(*)[2])(y == 0 ? pred->chroma_offset_l0 :
+						     pred->chroma_offset_l1);
+		delta_chroma_weights =
+			(s8(*)[2])(y == 0 ? pred->delta_chroma_weight_l0 :
+					    pred->delta_chroma_weight_l1);
+
+		int to = y == 0 ? sl->num_ref_idx_l0_active_minus1 :
+				  sl->num_ref_idx_l1_active_minus1;
+		for (int i = 0; i < to + 1; i++) {
+			if (delta_luma_weights[i] != 0 ||
+			    luma_offsets[i] != 0) {
+				push(AVD_OP_WEIGHTS | AVD_OP_WEIGHTS_IDENT(1) |
+					     AVD_OP_WEIGHTS_LIST_IDX(y) |
+					     AVD_OP_WEIGHTS_INDEX(i) |
+					     AVD_OP_WEIGHTS_WEIGHT(
+						     delta_luma_weights[i] +
+						     luma_weight_denom),
+				     "slc_luma_weights");
+				push(AVD_OP_OFFSETS | AVD_OP_OFFSETS_OFFSET(
+							      luma_offsets[i]),
+				     "slc_luma_offsets");
+			}
+
+			if (delta_chroma_weights[i][0] != 0 ||
+			    chroma_offsets[i][0] != 0 ||
+			    delta_chroma_weights[i][1] != 0 ||
+			    chroma_offsets[i][1] != 0) {
+				push(AVD_OP_WEIGHTS | AVD_OP_WEIGHTS_IDENT(2) |
+					     AVD_OP_WEIGHTS_LIST_IDX(y) |
+					     AVD_OP_WEIGHTS_INDEX(i) |
+					     AVD_OP_WEIGHTS_WEIGHT(
+						     delta_chroma_weights[i][0] +
+						     chroma_weight_denom),
+				     "slc_chroma_weights[0]");
+				push(AVD_OP_OFFSETS |
+					     AVD_OP_OFFSETS_OFFSET(
+						     chroma_offsets[i][0]),
+				     "slc_chroma_offsets[0]");
+				push(AVD_OP_WEIGHTS | AVD_OP_WEIGHTS_IDENT(3) |
+					     AVD_OP_WEIGHTS_LIST_IDX(y) |
+					     AVD_OP_WEIGHTS_INDEX(i) |
+					     AVD_OP_WEIGHTS_WEIGHT(
+						     delta_chroma_weights[i][1] +
+						     chroma_weight_denom),
+				     "slc_chroma_weights[1]");
+				push(AVD_OP_OFFSETS |
+					     AVD_OP_OFFSETS_OFFSET(
+						     chroma_offsets[i][1]),
+				     "slc_chroma_offsets[1]");
+			}
+		}
+	}
+}
+
+static void stream_slice_dqtblk(struct avd_ctx *ctx, struct avd_hevc_run *run,
+				const struct v4l2_ctrl_hevc_slice_params *sl)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+
+	push(AVD_OP_QP |
+		     AVD_OP_QP_VAL(pps->init_qp_minus26 + 26 +
+				   sl->slice_qp_delta) |
+		     AVD_OP_QP_CB_OFF(pps->pps_cb_qp_offset +
+				      sl->slice_cb_qp_offset) |
+		     AVD_OP_QP_CR_OFF(pps->pps_cr_qp_offset +
+				      sl->slice_cr_qp_offset),
+	     "slc_bcc_cmd_quantization");
+
+	push(AVD_OP_DBLK |
+		     AVD_OP_DBLK_FLAG_SAO_CHROMA(
+			     sl->flags &
+			     V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA) |
+		     AVD_OP_DBLK_FLAG_SAO_LUMA(
+			     sl->flags &
+			     V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA) |
+		     AVD_OP_DBLK_OFF0(sl->slice_tc_offset_div2) |
+		     AVD_OP_DBLK_OFF1(sl->slice_beta_offset_div2) |
+		     /* i wonder what this should actually be */
+		     AVD_OP_DBLK_FLAG_EN(
+			     !(sl->flags &
+			       V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED) &&
+			     (sps->flags &
+				      V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED ||
+			      sl->flags &
+				      V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA ||
+			      pps->flags &
+				      (V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED |
+				       V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT))) |
+		     AVD_OP_DBLK_FLAG_FULL_EN(
+			     sl->flags &
+			     V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED) |
+		     AVD_OP_DBLK_FLAG_TILES_EN(
+			     !(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ||
+			     (pps->flags &
+			      V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED)) |
+		     AVD_OP_DBLK_FLAG_PCM_EN(
+			     (sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED) &&
+			     !(sps->flags &
+			       V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED)),
+	     "slc_bd0_cmd_deblocking_filter");
+
+	if (sl->slice_type == V4L2_HEVC_SLICE_TYPE_B ||
+	    sl->slice_type == V4L2_HEVC_SLICE_TYPE_P) {
+		for (int i = 0; i < sl->num_ref_idx_l0_active_minus1 + 1; i++)
+			push(AVD_OP_REF | AVD_OP_REF_LIST_IDX(0) |
+				     AVD_OP_REF_LOOP_IDX(i) |
+				     AVD_OP_REF_DBP_IDX(sl->ref_idx_l0[i]),
+			     "reference_frames_l0");
+		if (sl->slice_type == V4L2_HEVC_SLICE_TYPE_B)
+			for (int i = 0;
+			     i < sl->num_ref_idx_l1_active_minus1 + 1; i++)
+				push(AVD_OP_REF | AVD_OP_REF_LIST_IDX(1) |
+					     AVD_OP_REF_LOOP_IDX(i) |
+					     AVD_OP_REF_DBP_IDX(
+						     sl->ref_idx_l1[i]),
+				     "reference_frames_l1");
+
+		stream_weights(ctx, run, sl);
+	}
+}
+
+static void stream_slice_mv(struct avd_ctx *ctx, struct avd_hevc_run *run,
+			    const struct v4l2_ctrl_hevc_slice_params *sl,
+			    bool is_first)
+{
+	const struct v4l2_ctrl_hevc_decode_params *decode = run->decode;
+	struct avd_decoded_buffer *dst, *ref;
+	bool ref_valid;
+	const u8 *ref_list;
+
+	if (sl->slice_type == V4L2_HEVC_SLICE_TYPE_I) {
+		push(AVD_OP_SL_REF |
+			     AVD_OP_SL_REF_SLICE_I(sl->slice_type ==
+						   V4L2_HEVC_SLICE_TYPE_I),
+		     "slc_a8c_cmd_ref_type");
+		return;
+	}
+	/* bidirectional prediction */
+
+	ref_list = sl->slice_type == V4L2_HEVC_SLICE_TYPE_P ? sl->ref_idx_l0 :
+		   sl->flags & V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0 ?
+							      sl->ref_idx_l0 :
+							      sl->ref_idx_l1;
+
+	dst = vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
+	ref = avd_get_ref_buf(
+		ctx, &dst->base.vb,
+		decode->dpb[ref_list[sl->collocated_ref_idx]].timestamp);
+
+	ref_valid = !(sl->flags &
+		      V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT) &&
+		    (sl->flags &
+		     V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED) &&
+		    is_first && !ref->hevc.is_intra;
+
+	push(AVD_OP_SL_REF |
+		     AVD_OP_SL_REF_MAX_MERGE(
+			     5 - sl->five_minus_max_num_merge_cand) |
+		     AVD_OP_SL_REF_FLAG_CABAC(
+			     sl->flags &
+			     V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT) |
+		     AVD_OP_SL_REF_FLAG0(
+			     (sl->flags &
+			      V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED) &&
+			     !(sl->flags &
+			       V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0)) |
+		     AVD_OP_SL_REF_FLAG1(
+			     !(sl->flags &
+			       V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO)) |
+		     AVD_OP_SL_REF_FLAG2(
+			     (sl->flags &
+			      V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED) ||
+			     (sl->flags &
+			      V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT)) |
+		     AVD_OP_SL_REF_NUM_L0(sl->num_ref_idx_l0_active_minus1) |
+		     AVD_OP_SL_REF_NUM_L1(sl->num_ref_idx_l1_active_minus1) |
+		     AVD_OP_SL_REF_SLICE_P(sl->slice_type ==
+					   V4L2_HEVC_SLICE_TYPE_P) |
+		     AVD_OP_SL_REF_SLICE_B(ref_valid),
+	     "slc_a8c_cmd_ref_type");
+
+	if (ref_valid) {
+		dma_addr_t mv_color_addr =
+			vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf,
+						      0) +
+			(ref->base.vb.planes[0].length -
+			 mv_color_size(fmt_width(ctx), fmt_height(ctx)));
+		pusha(mv_color_addr, "slc_bd4_sps_tile_addr2_lsb8",
+		      decode->dpb[ref_list[sl->collocated_ref_idx]]
+			      .pic_order_cnt_val);
+	}
+}
+
+static void set_slice(struct avd_ctx *ctx, struct avd_hevc_run *run,
+		      const struct v4l2_ctrl_hevc_slice_params *sl, u32 size,
+		      u32 offset, u32 flags)
+{
+	dma_addr_t slc_addr =
+		run->base.coded_in + offset + sl->data_byte_offset;
+	push(AVD_OP_CODED_DATA | flags | AVD_OP_CODED_DATA_ADDR(slc_addr >> 32),
+	     "cm3_cmd_set_coded_slice");
+	push((u32)(slc_addr & 0xffffffff), "slc_bd8_slice_addr");
+	push(size, "slc_bdc_slice_size");
+}
+
+static int submit_slice_segment(struct avd_ctx *ctx, struct avd_hevc_run *run,
+				const struct v4l2_ctrl_hevc_slice_params *sl,
+				int row, int col, u32 col_bd[23],
+				u32 row_bd[23], u32 pic_in_cts_width,
+				u32 pic_in_cts_height, bool first_slice,
+				bool hflip, bool vflip, u32 coded_flags,
+				u32 last_tile_block)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	u32 tb_x, tb_y, tile_block, tile_boundary;
+
+	if (coded_flags & NEW_SLICE) {
+		tb_x = sl->slice_segment_addr % pic_in_cts_width;
+		tb_y = sl->slice_segment_addr / pic_in_cts_width;
+
+		tile_block = AVD_OP_SL_LOC_Y(tb_y) | AVD_OP_SL_LOC_X(tb_x);
+
+		if (!(sl->flags &
+		      V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT))
+			last_tile_block = tile_block;
+
+		/*
+		 * tile block start
+		 * CABAC window
+		 */
+		push(AVD_OP_SL_LOC | last_tile_block, "cm3_cmd_set_cabac_xy");
+
+		stream_slice_dqtblk(ctx, run, sl);
+	} else {
+		tile_boundary = AVD_OP_SL_LOC_Y(row_bd[row]) |
+				AVD_OP_SL_LOC_X(col_bd[col]);
+	}
+
+	if (coded_flags & NEW_TILE_ID) {
+		push(AVD_OP_SL_DIM_START |
+			     (coded_flags & NEW_SLICE ? tile_block :
+							tile_boundary),
+		     "cm3_cmd_set_ctb_xy");
+
+		/* tile boundary end */
+		if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED)
+			push(AVD_SL_DIM_END_ROW((hflip ? 4 : 0) |
+						(vflip ? 8 : 0)) |
+				     AVD_SL_DIM_END_COL(col) |
+				     AVD_SL_DIM_END_Y(row_bd[row + 1] - 1) |
+				     AVD_SL_DIM_END_X(col_bd[col + 1] - 1),
+			     "cm3_set_ctb_xy");
+		else /* first slice, one CTB */
+			push(AVD_SL_DIM_END_Y(pic_in_cts_height - 1) |
+				     AVD_SL_DIM_END_X(pic_in_cts_width - 1),
+			     "cm3_set_ctb_xy");
+	}
+
+	if (coded_flags & NEW_SLICE)
+		stream_slice_mv(ctx, run, sl, first_slice);
+
+	/* current tile block / boundary ?? */
+	/* Unlike entropy, motion vector window resets every time */
+	push(AVD_SL_DIM_END_COL(1) |
+		     (coded_flags & NEW_SLICE ? tile_block : tile_boundary),
+	     "cm3_set_mv_xy");
+
+	return last_tile_block;
+}
+
+static void compute_tiles_uniform(struct avd_hevc_run *run,
+				  u16 log2_min_cb_size, u16 width, u16 height,
+				  s32 pic_in_cts_width, s32 pic_in_cts_height,
+				  u16 *column_width, u16 *row_height)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	int i;
+
+	for (i = 0; i < pps->num_tile_columns_minus1 + 1; i++)
+		column_width[i] = ((i + 1) * pic_in_cts_width) /
+					  (pps->num_tile_columns_minus1 + 1) -
+				  (i * pic_in_cts_width) /
+					  (pps->num_tile_columns_minus1 + 1);
+
+	for (i = 0; i < pps->num_tile_rows_minus1 + 1; i++)
+		row_height[i] = ((i + 1) * pic_in_cts_height) /
+					(pps->num_tile_rows_minus1 + 1) -
+				(i * pic_in_cts_height) /
+					(pps->num_tile_rows_minus1 + 1);
+}
+
+static void compute_tiles_non_uniform(struct avd_hevc_run *run,
+				      u16 log2_min_cb_size, u16 width,
+				      u16 height, s32 pic_in_cts_width,
+				      s32 pic_in_cts_height, u16 *column_width,
+				      u16 *row_height)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	s32 sum = 0;
+	int i;
+
+	for (i = 0; i < pps->num_tile_columns_minus1; i++) {
+		column_width[i] = pps->column_width_minus1[i] + 1;
+		sum += column_width[i];
+	}
+	column_width[i] = pic_in_cts_width - sum;
+
+	sum = 0;
+	for (i = 0; i < pps->num_tile_rows_minus1; i++) {
+		row_height[i] = pps->row_height_minus1[i] + 1;
+		sum += row_height[i];
+	}
+	row_height[i] = pic_in_cts_height - sum;
+}
+
+static void compute_bd(struct avd_hevc_run *run, u32 *col_bd, u32 *row_bd,
+		       u16 *column_width, u16 *row_height)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	int i;
+
+	for (col_bd[0] = 0, i = 0; i <= pps->num_tile_columns_minus1; i++)
+		col_bd[i + 1] = col_bd[i] + column_width[i];
+
+	for (row_bd[0] = 0, i = 0; i <= pps->num_tile_rows_minus1; i++)
+		row_bd[i + 1] = row_bd[i] + row_height[i];
+}
+
+static void compute_rs_to_ts(struct avd_hevc_run *run, u32 pic_in_ctbs_size,
+			     u32 pic_in_ctbs_width, u32 *col_bd, u32 *row_bd,
+			     u16 *col_width, u16 *row_height,
+			     u32 *ctb_addr_rs_to_ts)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	int i, j, tb_x, tb_y, tile_x = 0, tile_y = 0;
+	u32 ctb_addr_rs;
+
+	for (ctb_addr_rs = 0; ctb_addr_rs < pic_in_ctbs_size; ctb_addr_rs++) {
+		tb_x = ctb_addr_rs % pic_in_ctbs_width;
+		tb_y = ctb_addr_rs / pic_in_ctbs_width;
+		for (i = 0; i <= pps->num_tile_columns_minus1; i++)
+			if (tb_x >= col_bd[i])
+				tile_x = i;
+		for (j = 0; j <= pps->num_tile_rows_minus1; j++)
+			if (tb_y >= row_bd[j])
+				tile_y = j;
+		ctb_addr_rs_to_ts[ctb_addr_rs] = 0;
+		for (i = 0; i < tile_x; i++)
+			ctb_addr_rs_to_ts[ctb_addr_rs] +=
+				row_height[tile_y] * col_width[i];
+		for (j = 0; j < tile_y; j++)
+			ctb_addr_rs_to_ts[ctb_addr_rs] +=
+				pic_in_ctbs_width * row_height[j];
+		ctb_addr_rs_to_ts[ctb_addr_rs] +=
+			(tb_y - row_bd[tile_y]) * col_width[tile_x] + tb_x -
+			col_bd[tile_x];
+	}
+}
+
+static void compute_tile_ids(struct avd_hevc_run *run, u32 pic_in_ctbs_width,
+			     u32 *col_bd, u32 *row_bd, u32 *ctb_addr_rs_to_ts,
+			     u32 *tile_ids)
+{
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	int j, i, y, x;
+	u32 tile_idx;
+
+	for (j = 0, tile_idx = 0; j <= pps->num_tile_rows_minus1; j++)
+		for (i = 0; i <= pps->num_tile_columns_minus1; i++, tile_idx++)
+			for (y = row_bd[j]; y < row_bd[j + 1]; y++)
+				for (x = col_bd[i]; x < col_bd[i + 1]; x++)
+					tile_ids[ctb_addr_rs_to_ts
+							 [y * pic_in_ctbs_width +
+							  x]] = tile_idx;
+}
+
+struct sl_ctx {
+	u32 ctx_col;
+	u32 ctx_row;
+	s32 q1_col;
+	s32 q1_row;
+};
+
+static void stream_slices(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	struct avd_hevc_ctx *hevc_ctx = ctx->priv;
+	const struct v4l2_ctrl_hevc_slice_params *sl;
+	struct avd_hevc_tile_info *tile_info = &run->tile_info;
+	bool tiles_enabled, first_slice, first_segment;
+	bool hflip, vflip;
+	int slice_segment_offset, entry_point_idx = 0, pos = 0, offset = 0;
+	int row, col, i, s, to;
+	int slice_flag, size, new_offset;
+	int tile_id, last_tile_id;
+	u16 log2_min_cb_size, width, height;
+	s32 max_cu_width, pic_in_ctbs_width, pic_in_ctbs_height;
+	u32 num_cols, last_tile_block = 0;
+	struct sl_ctx last = {
+		.q1_col = -1,
+		.q1_row = -1,
+	};
+
+	width = sps->pic_width_in_luma_samples;
+	height = sps->pic_height_in_luma_samples;
+
+	tiles_enabled = !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
+
+	log2_min_cb_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
+
+	num_cols = pps->num_tile_columns_minus1 + 1;
+
+	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size +
+			     log2_min_cb_size);
+	pic_in_ctbs_width = (width + max_cu_width - 1) / max_cu_width;
+	pic_in_ctbs_height = (height + max_cu_width - 1) / max_cu_width;
+
+	for (s = 0; s < run->num_slices; s++) {
+		sl = &run->sl[s];
+		slice_segment_offset = 0;
+		to = tiles_enabled ? sl->num_entry_point_offsets + 1 : 1;
+		/*
+		 * since we are the only one using entry_point_offsets verify
+		 * that we actually have enough.
+		 */
+		if (tiles_enabled &&
+		    sl->num_entry_point_offsets + entry_point_idx >
+			    run->num_entry_point_offsets + 1) {
+			return;
+		}
+
+		for (i = 0; i < to; i++) {
+			first_segment = i == 0;
+			first_slice = s == 0;
+
+			ctx->job.num++;
+
+			if (tiles_enabled && to > 1) {
+				if (i < sl->num_entry_point_offsets) {
+					size = run->entry_point_offsets
+						       [entry_point_idx++];
+					new_offset = size;
+				} else {
+					size = sl->bit_size / 8 -
+					       sl->data_byte_offset -
+					       slice_segment_offset;
+					new_offset =
+						size + sl->data_byte_offset;
+				}
+			} else {
+				size = (sl->bit_size) / 8 -
+				       sl->data_byte_offset;
+				new_offset = size + sl->data_byte_offset;
+			}
+
+			tile_id = tile_info->tile_ids
+					  [tile_info->ctb_addr_rs_to_ts
+						   [sl->slice_segment_addr]];
+			last_tile_id =
+				first_slice ?
+					-1 :
+					tile_info->tile_ids
+						[tile_info->ctb_addr_rs_to_ts
+							 [run->sl[s - 1]
+								  .slice_segment_addr]];
+
+			slice_flag = 0;
+			if (first_slice || tile_id != last_tile_id ||
+			    !first_segment)
+				slice_flag |= NEW_TILE_ID;
+
+			if (first_segment)
+				slice_flag |= NEW_SLICE;
+
+			vflip = false;
+			hflip = false;
+
+			row = pos / num_cols;
+			col = pos % num_cols;
+
+			/*
+			 * in the JCT-VC-HEVC_V1 tests only TILES_B_Cisco_1
+			 * seems affected and it only seems to need hflip.
+			 *
+			 * If there is a spec equivalent or a better way to
+			 * represent this, it could not be found.
+			 */
+			if (slice_flag & NEW_TILE_ID) {
+				if ((col >= last.ctx_col &&
+				     row > last.ctx_row) ||
+				    (col <= last.q1_col && row > last.q1_row))
+					vflip = true;
+
+				if (!(slice_flag & NEW_SLICE)) {
+					if (row && row == last.ctx_row + 1) {
+						hflip = true;
+						if (!vflip) {
+							last.q1_row = row;
+							last.q1_col = col;
+						}
+					}
+				} else {
+					last.ctx_row = row;
+					last.ctx_col = col;
+					last.q1_row = -1;
+					last.q1_col = -1;
+				}
+			}
+
+			set_slice(
+				ctx, run, sl, size,
+				offset + slice_segment_offset,
+				/* makes WPP more reliable? But not really ?? */
+				(sl->flags & V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT ?
+					 slice_flag & ~NEW_SLICE :
+					 slice_flag)
+					<< 13);
+
+			last_tile_block = submit_slice_segment(
+				ctx, run, sl, row, col, tile_info->col_bd,
+				tile_info->row_bd, pic_in_ctbs_width,
+				pic_in_ctbs_height, first_slice, hflip, vflip,
+				slice_flag, last_tile_block);
+
+			if (slice_flag & NEW_TILE_ID)
+				pos++;
+
+			slice_segment_offset += new_offset;
+		}
+		offset += sl->bit_size / 8;
+	}
+
+	hevc_ctx->submit_num = pos;
+}
+
+static void update_dec_buf_info(struct avd_decoded_buffer *buf,
+				const struct v4l2_ctrl_hevc_slice_params *sl)
+{
+	buf->hevc.is_intra = sl->slice_type == V4L2_HEVC_SLICE_TYPE_I;
+}
+
+static void avd_hevc_adjust_decoded_fmt(struct avd_ctx *ctx,
+					struct v4l2_pix_format_mplane *pix_mp)
+{
+	pix_mp->plane_fmt[0].sizeimage +=
+		mv_color_size(pix_mp->width, pix_mp->height);
+}
+
+static enum avd_image_fmt avd_hevc_get_image_fmt(struct avd_ctx *ctx,
+						 struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
+
+	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
+		return AVD_IMG_FMT_ANY;
+
+	/*
+	 * TODO: we can do up to 4:4:4 12 bit
+	 * not sure if v4l2 supports RExt
+	 */
+
+	if (sps->bit_depth_luma_minus8 == 0) {
+		if (sps->chroma_format_idc == 2)
+			return AVD_IMG_FMT_422_8BIT;
+		else
+			return AVD_IMG_FMT_420_8BIT;
+	} else if (sps->bit_depth_luma_minus8 == 2) {
+		if (sps->chroma_format_idc == 2)
+			return AVD_IMG_FMT_422_10BIT;
+		else
+			return AVD_IMG_FMT_420_10BIT;
+	}
+
+	return AVD_IMG_FMT_ANY;
+}
+
+static int avd_hevc_validate_sps(struct avd_ctx *ctx,
+				 const struct v4l2_ctrl_hevc_sps *sps)
+{
+	if (sps->pic_width_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.width ||
+	    sps->pic_height_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.height)
+		return -EINVAL;
+
+	if (sps->bit_depth_chroma_minus8 != sps->bit_depth_luma_minus8)
+		return -EINVAL;
+
+	if (sps->bit_depth_luma_minus8 > 2)
+		/* not implemented */
+		return -EINVAL;
+
+	return 0;
+}
+
+static int avd_hevc_start(struct avd_ctx *ctx)
+{
+	struct avd_hevc_ctx *hevc_ctx;
+
+	hevc_ctx = kzalloc_obj(*hevc_ctx, GFP_KERNEL);
+	if (!hevc_ctx)
+		return -ENOMEM;
+
+	ctx->priv = hevc_ctx;
+
+	return 0;
+}
+
+static int avd_hevc_alloc_scratch(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	struct avd_hevc_ctx *hevc_ctx = ctx->priv;
+	struct avd_dev *avd = ctx->dev;
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	struct avd_hevc_tile_info *tile_info = &run->tile_info;
+	int i, ret, w, bit_depth, max_col = 0, max_row = 0, cols, rows;
+	int log2_min_cb_size, max_cu_width;
+
+	cols = pps->num_tile_columns_minus1 + 1;
+	rows = pps->num_tile_rows_minus1 + 1;
+	bit_depth = sps->bit_depth_luma_minus8 + 8;
+	w = sps->pic_width_in_luma_samples;
+
+	log2_min_cb_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
+	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size +
+			     log2_min_cb_size);
+
+	for (i = 0; i < cols; i++)
+		max_col = tile_info->col_width[i] > max_col ?
+				  tile_info->col_width[i] :
+				  max_col;
+
+	for (i = 0; i < rows; i++)
+		max_row = tile_info->row_height[i] > max_row ?
+				  tile_info->row_height[i] :
+				  max_row;
+
+	ret = avd_buf_alloc(avd, &hevc_ctx->bufs.ip_above,
+			    ((max_col * max_cu_width) / 4) * bit_depth);
+	if (ret)
+		return ret;
+
+	ret = avd_buf_alloc(avd, &hevc_ctx->bufs.mv_above_info,
+			    ((max_col * max_cu_width) / 16) * 20);
+	if (ret)
+		return ret;
+
+	ret = avd_buf_alloc(avd, &hevc_ctx->bufs.lf_above,
+			    DIV_ROUND_UP(w, 16) * bit_depth * (10 + 6) +
+				    (cols - 1) * 256);
+	if (ret)
+		return ret;
+
+	ret = avd_buf_alloc(avd, &hevc_ctx->bufs.lf_above_info,
+			    DIV_ROUND_UP(w + 7, 16) * 36 + cols * 128);
+	if (ret)
+		return ret;
+
+	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
+		ret = avd_buf_alloc(avd, &hevc_ctx->bufs.lf_left,
+				    ((max_row * max_cu_width) / 4) * 36 +
+					    144 /* why? */);
+		if (ret)
+			return ret;
+		ret = avd_buf_alloc(avd, &hevc_ctx->bufs.lf_left_info,
+				    ((max_row * max_cu_width) / 4) * 9);
+		if (ret)
+			return ret;
+
+		ret = avd_buf_alloc(avd, &hevc_ctx->bufs.az_above,
+				    /* not sure if its cols or rows */
+				    DIV_ROUND_UP(w, 64) * 144 +
+					    (cols - 1) * 128);
+		if (ret)
+			return ret;
+
+		ret = avd_buf_alloc(avd, &hevc_ctx->bufs.sw_left,
+				    ((max_row * max_cu_width) / 4) * 216);
+		if (ret)
+			return ret;
+	} else {
+		ret = avd_buf_alloc(avd, &hevc_ctx->bufs.az_above,
+				    DIV_ROUND_UP(w + 7, 16) * 4 * bit_depth);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int avd_hevc_compute_tiles(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	bool tiles_enabled;
+	struct avd_hevc_tile_info *tile_info = &run->tile_info;
+	u16 log2_min_cb_size, width, height;
+	s32 max_cu_width, pic_in_ctbs_width, pic_in_ctbs_height,
+		pic_in_ctbs_size;
+
+	width = sps->pic_width_in_luma_samples;
+	height = sps->pic_height_in_luma_samples;
+
+	log2_min_cb_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
+
+	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size +
+			     log2_min_cb_size);
+	pic_in_ctbs_width = (width + max_cu_width - 1) / max_cu_width;
+	pic_in_ctbs_height = (height + max_cu_width - 1) / max_cu_width;
+	pic_in_ctbs_size = pic_in_ctbs_height * pic_in_ctbs_width;
+
+	tiles_enabled = !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
+
+	tile_info->ctb_addr_rs_to_ts = kzalloc_objs(
+		*tile_info->ctb_addr_rs_to_ts, pic_in_ctbs_size, GFP_KERNEL);
+	if (!tile_info->ctb_addr_rs_to_ts)
+		return -ENOMEM;
+
+	tile_info->tile_ids = kzalloc_objs(*tile_info->tile_ids,
+					   pic_in_ctbs_size, GFP_KERNEL);
+	if (!tile_info->tile_ids)
+		return -ENOMEM;
+
+	if (tiles_enabled) {
+		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
+			compute_tiles_uniform(run, log2_min_cb_size, width,
+					      height, pic_in_ctbs_width,
+					      pic_in_ctbs_height,
+					      tile_info->col_width,
+					      tile_info->row_height);
+		} else {
+			compute_tiles_non_uniform(run, log2_min_cb_size, width,
+						  height, pic_in_ctbs_width,
+						  pic_in_ctbs_height,
+						  tile_info->col_width,
+						  tile_info->row_height);
+		}
+
+		compute_bd(run, tile_info->col_bd, tile_info->row_bd,
+			   tile_info->col_width, tile_info->row_height);
+
+		/*
+		 * 6.5.1 CTB raster and tile scanning conversion process
+		 * (6-7) and (6-9)
+		 *
+		 * we really only need to know if tileidx != last tileidx
+		 * so maybe there is a better way
+		 */
+		compute_rs_to_ts(run, pic_in_ctbs_size, pic_in_ctbs_width,
+				 tile_info->col_bd, tile_info->row_bd,
+				 tile_info->col_width, tile_info->row_height,
+				 tile_info->ctb_addr_rs_to_ts);
+		compute_tile_ids(run, pic_in_ctbs_width, tile_info->col_bd,
+				 tile_info->row_bd,
+				 tile_info->ctb_addr_rs_to_ts,
+				 tile_info->tile_ids);
+	} else {
+		tile_info->col_width[0] =
+			(width + max_cu_width - 1) / max_cu_width;
+		tile_info->row_height[0] =
+			(height + max_cu_width - 1) / max_cu_width;
+	}
+
+	return 0;
+}
+
+static void avd_hevc_stop(struct avd_ctx *ctx)
+{
+	struct avd_hevc_ctx *hevc_ctx = ctx->priv;
+	struct avd_dev *avd = ctx->dev;
+
+	if (!hevc_ctx)
+		return;
+
+	avd_buf_free(avd, &hevc_ctx->bufs.mv_above_info);
+	avd_buf_free(avd, &hevc_ctx->bufs.az_above);
+	avd_buf_free(avd, &hevc_ctx->bufs.ip_above);
+	avd_buf_free(avd, &hevc_ctx->bufs.lf_above);
+	avd_buf_free(avd, &hevc_ctx->bufs.lf_above_info);
+	avd_buf_free(avd, &hevc_ctx->bufs.lf_left);
+	avd_buf_free(avd, &hevc_ctx->bufs.lf_left_info);
+	avd_buf_free(avd, &hevc_ctx->bufs.sw_left);
+
+	kfree(hevc_ctx);
+}
+
+static int avd_hevc_run_preamble(struct avd_ctx *ctx, struct avd_hevc_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+	u32 dst_len, mv_color_len;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
+	run->decode = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
+	run->sl = ctrl ? ctrl->p_cur.p : NULL;
+	run->num_slices = ctrl ? ctrl->new_elems : 0;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_HEVC_SPS);
+	run->sps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_HEVC_PPS);
+	run->pps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
+	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS);
+	run->entry_point_offsets = ctrl ? ctrl->p_cur.p : NULL;
+	if (!run->entry_point_offsets)
+		return -EINVAL;
+	run->num_entry_point_offsets = ctrl ? ctrl->new_elems : 0;
+
+	avd_run_preamble(ctx, &run->base);
+
+	dst_len = run->base.bufs.dst->vb2_buf.planes[0].length;
+
+	mv_color_len = mv_color_size(fmt_width(ctx), fmt_height(ctx));
+
+	run->addresses.mv_color = run->base.y_out + (dst_len - mv_color_len);
+	return 0;
+}
+
+static int avd_hevc_run(struct avd_ctx *ctx)
+{
+	struct avd_hevc_run run;
+	struct avd_decoded_buffer *dst;
+	int ret;
+
+	ret = avd_hevc_run_preamble(ctx, &run);
+	if (ret)
+		return ret;
+
+	dst = vb2_to_avd_decoded_buf(&run.base.bufs.dst->vb2_buf);
+	update_dec_buf_info(dst, &run.sl[0]);
+
+	ret = avd_hevc_compute_tiles(ctx, &run);
+	if (ret)
+		goto done;
+
+	ret = avd_hevc_alloc_scratch(ctx, &run);
+	if (ret)
+		goto done;
+
+	ret = avd_init_job(ctx, AVD_CODEC_HEVC,
+			   run.num_slices + run.num_entry_point_offsets + 1);
+	if (ret)
+		goto done;
+
+	set_header(ctx, &run);
+	stream_slices(ctx, &run);
+	avd_run_postamble(ctx, &run.base);
+
+	ret = avd_submit_job(ctx);
+done:
+	kfree(run.tile_info.ctb_addr_rs_to_ts);
+	kfree(run.tile_info.tile_ids);
+	kfree(ctx->job.segments);
+	ctx->job.segments = NULL;
+	return ret;
+}
+
+static int avd_hevc_try_ctrl(struct avd_ctx *ctx, struct v4l2_ctrl *ctrl)
+{
+	if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS)
+		return avd_hevc_validate_sps(ctx, ctrl->p_new.p_hevc_sps);
+
+	return 0;
+}
+
+static void avd_hevc_submit(struct avd_ctx *ctx)
+{
+	struct avd_hevc_ctx *hevc_ctx = ctx->priv;
+	struct avd_dev *avd = ctx->dev;
+
+	writel(AVD_OP_EXEC |
+		       AVD_OP_EXEC_FLAG_START_REV4(avd->variant->revision ==
+						   4) |
+		       AVD_OP_EXEC_FLAG_START_REV3(avd->variant->revision ==
+						   3) |
+		       AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx) |
+		       AVD_OP_EXEC_FIFO_MASK(avd->variant->fifo_slots),
+	       avd->ctrl + avd->variant->submit_offset);
+	for (int i = 0; i < hevc_ctx->submit_num - 1; i++) {
+		writel(AVD_OP_EXEC | AVD_OP_EXEC_FIFO_IDX(ctx->fifo_idx) |
+			       AVD_OP_EXEC_FIFO_MASK(avd->variant->fifo_slots),
+		       avd->ctrl + avd->variant->submit_offset);
+	}
+}
+
+const struct avd_coded_fmt_ops avd_hevc_fmt_ops = {
+	.adjust_decoded_fmt = avd_hevc_adjust_decoded_fmt,
+	.start = avd_hevc_start,
+	.stop = avd_hevc_stop,
+	.run = avd_hevc_run,
+	.submit = avd_hevc_submit,
+	.try_ctrl = avd_hevc_try_ctrl,
+	.get_image_fmt = avd_hevc_get_image_fmt,
+};
diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/platform/apple/avd/avd-v4l2.c
index 52dcb70b340c..5f2a31f8b9d4 100644
--- a/drivers/media/platform/apple/avd/avd-v4l2.c
+++ b/drivers/media/platform/apple/avd/avd-v4l2.c
@@ -173,6 +173,62 @@ const struct v4l2_ctrl_ops avd_ctrl_ops = {
 	.s_ctrl = avd_s_ctrl,
 };
 
+static const struct avd_ctrl_desc avd_hevc_ctrl_descs[] = {
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SLICE_PARAMS,
+		.cfg.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+		.cfg.type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS,
+		.cfg.dims = { 600 },
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
+		.cfg.ops = &avd_ctrl_ops,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_START_CODE,
+		.cfg.min = V4L2_STATELESS_HEVC_START_CODE_NONE,
+		.cfg.def = V4L2_STATELESS_HEVC_START_CODE_NONE,
+		.cfg.max = V4L2_STATELESS_HEVC_START_CODE_NONE,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS,
+		.cfg.dims = { 256 },
+		.cfg.max = 0xffffffff,
+		.cfg.step = 1,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.cfg.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+		.cfg.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.cfg.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+	},
+};
+
+static const struct avd_ctrls avd_hevc_ctrls = {
+	.ctrls = avd_hevc_ctrl_descs,
+	.num_ctrls = ARRAY_SIZE(avd_hevc_ctrl_descs),
+};
+
 static const struct avd_ctrl_desc avd_h264_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
@@ -251,6 +307,20 @@ static const struct avd_ctrls avd_vp9_ctrls = {
 };
 
 static const struct avd_coded_fmt_desc avd_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 16384,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 16384,
+			.step_height = 16,
+		},
+		.ctrls = &avd_hevc_ctrls,
+		.ops = &avd_hevc_fmt_ops,
+		.capability = AVD_CAPABILITY_HEVC,
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_H264_SLICE,
 		.frmsize = {
diff --git a/drivers/media/platform/apple/avd/avd.h b/drivers/media/platform/apple/avd/avd.h
index facf23d151c0..4f284a2d962c 100644
--- a/drivers/media/platform/apple/avd/avd.h
+++ b/drivers/media/platform/apple/avd/avd.h
@@ -97,6 +97,10 @@ struct avd_vp9_decoded_buffer_info {
 	unsigned int bit_depth : 4;
 };
 
+struct avd_hevc_decoded_buffer_info {
+	bool is_intra;
+};
+
 struct avd_comp {
 	u32 size;
 	/* offset to start of compressed data */
@@ -111,6 +115,7 @@ struct avd_decoded_buffer {
 	struct avd_comp comp;
 	union {
 		struct avd_vp9_decoded_buffer_info vp9;
+		struct avd_hevc_decoded_buffer_info hevc;
 	};
 };
 
@@ -247,6 +252,7 @@ void avd_run_preamble(struct avd_ctx *ctx, struct avd_run *run);
 void avd_run_postamble(struct avd_ctx *ctx, struct avd_run *run);
 
 extern const struct avd_coded_fmt_ops avd_h264_fmt_ops;
+extern const struct avd_coded_fmt_ops avd_hevc_fmt_ops;
 extern const struct avd_coded_fmt_ops avd_vp9_fmt_ops;
 
 extern const struct v4l2_ctrl_ops avd_ctrl_ops;

-- 
2.55.0

