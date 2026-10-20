Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489164;
	b=CiwlGE4bt54LdRZjOcXsA2C0pd7WY+SlIHU13mFZxRWVizwbCJPw7HdMCS65JTnn9Zwb
	 Iava8/3NPidJ0QfzUFbtzFZ+kPOxb3mVU5bGj9I1/52gd9WsOdPjr2nqUHxqjEn6Im0Sn
	 rKe33OdcdZnUpGwJBQgtQWfmrZLXu+T1yRmls5M74qM3npLT/1yXuemAvU8l6sXzgzI73
	 qW6Xzr/dhJJkmhh2oeNDDfTxx2bRCkFPcsgCT9UoBpJx31NFe5VnE8LP9JFQ8ytPq2DK+
	 Z8YfYK2FeLJFzJYlokYzcsFUGT8fMQqps0aoZwENN6B0xDNsFg2MOWftt48jA+lE0PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489164;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=9KDebcAg1XR1qe3H5k5F57dHPFO7EWied1XNo/yDWnE=;
	b=Rx/3Lidla/17fyTmYzmnUt0XJMvT7mJMJmfPZLhzZ+bEuQWXMRBxZBayLgmSXAUt46Vf
	 yikF7hmrzCGu24gwjh30FLuyWzTLSfdTSe/oETjfFk5zs9jQ++PEj2iExlq7h5YLlr77J
	 NojQjdBHwqM3k5FOcBr70cJYwNrCqlzW9laVyGEcn6dLCG77RM7umD7XYFfoo7TW1duPV
	 qtnX/zfrgIm2l6tox47qUjg7TCkFOblt8htJb/rI+430pAm2KLvLKeW7IkOV8BdOg6i0a
	 LZTITHhHIFemMV3EqWfqS66Z8cPXkQlyA8eKf9q+1Wv9tvOqfMTd1o5EdG+Y8ayS7xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=b63DLKLk;
	arc=none smtp.remote-ip=57.103.79.114
Received: from outbound.st.icloud.com (st-2005j-snip4-1.eps.apple.com [57.103.79.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D660A3816
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479D660A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=b63DLKLk
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id AE91718006BC;
	Tue, 20 Oct 2026 09:39:19 +0000 (UTC)
X-ICL-RepId: 01a158ad-fbd7-7654-b595-3bec1cb061c3
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGBV0BTVAPVgoAQQtNV1V3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489162; x=1824025162; bh=9KDebcAg1XR1qe3H5k5F57dHPFO7EWied1XNo/yDWnE=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=b63DLKLk3ZyuquAz2/nXaY8BuBVrm7R+O0WhUJXZgK/6TAVUK/8MvBM5JR3jii7sxjvcAEuZFTS8nCembASpyF9YADwNetWhWi4HZI8hC4hz5Xorgr3rdPPSy0EDfydCjyNM3vaz72zlwgMG38FZqLKXjKQ2uDdUnMZuYuQJIhNcsVK97PKIK3Znq8KyFj3HPYR0Ck5u55fYu+YSixqRx8E/aBFNlnLH+UMVAzW/NWB10Xm/nSXnfChqMtEbFOmLX+x6twwO2plNCI1Y5X02BCQ+Kh+YnpNftKe9tzVoHpkh0S4pZo1dMyhl6oPTAYLUL3Qni8i1s6yahzxtSfs8DQ==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 092A51800219;
	Tue, 20 Oct 2026 09:39:16 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:48 +0200
Subject: [PATCH v3 07/17] media: apple: avd: add h264 support
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
Message-Id: <20261020-avd-v3-7-85cbaa2125d8@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX+KyKUcOgSovg
 v7L0z+eV3VnfM8DKukWXkYAJuMHh9oxy0EmYH/l0s0Y7BG7yY8xNV0S4OhN+jdZh+bD8vBeaMSc
 UvPXO5+bSkZ4e6DnhPtM4I6CjSht3Gx2wJPY+BkcXNq4QEBj+am4WYSstQ1oUPBieIS3gUis9NH
 Tc5rOds4eunihgdFLcgB3V9OEztFi+6Qa0hQYtXXl7YDco3DGWXf7DQiZYjXfRuJz+L1Bk7MffV
 RBGWF05t/HfWX+6ka8mQ3IuM2HWG6SxMuZNa9aCAOrg3NEc6neBnIQuuAq3nxqArz66FUdZb3qq
 8Q9xwDdEvfxLP+fMjUHRRlLFyEec/Ht8AgdwBWYF4lEvbgAoyq0Pozu7BoPJtw=
X-Authority-Info-Out: v=2.4 cv=f5NFxeyM c=1 sm=1 tr=0 ts=6ad736c9
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=7YfXLusrAAAA:8 a=s8YR1HE3AAAA:8 a=cm27Pg_UAAAA:8
 a=3kA6WVUWK8qzWw8_FPAA:9 a=QEXdDO2ut3YA:10 a=SLz71HocmBbuEhFRYD3r:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 7asN_IBng3ouuMNqkuC9lCDQN_Dev5cz
X-Proofpoint-ORIG-GUID: 7asN_IBng3ouuMNqkuC9lCDQN_Dev5cz
X-JNJ: AAAAAAABWn6O3QWc/KuxrTKABeBFcd37vv3rEMVUN/VT5m13cqOaYCaTHgot42c+RBGI/0X0jQuZ4CIDFrAv23Q/exSRUN1xJTi57XZnYYhcIyTAaykz6wwTESKnyGyLxTJQ9no0M8HEnqTFLtPdMO5Yz5rbZMWDkABRuoz/xGRAi2p4Rs7y91QP+1VMXSJrosNyEXn9CYmi7K5sJogoIBCZSNz17EyXKSO7KrFSCCnj0ZsqaxBxVMy1r5n/9B3nV/uy4jG8kiXB8gYUgFBC6uJ0oJmXsj6kayg7JgbOfaUX2YK49uJutYfGFzJUJMZrLaNTJ32TwB6uL2vImZvAbVc+F4+HbzWTKqO1BIgYe9Hz/F04lc3PDhWRrRxnvaN4nQ9KfwrN+qsV+/pPgw8/jTI6NcPLzvfEBs0CccxrOkhZ9ojv9QR8f9SdbYVYncuZ6rQgqOPzBb44GSf7aVqW+AFNbzkxJv/roHaR/BleNfL3EStyamThI13ILupBZOEO6UYkJoC805513U6LyFN1h5ZSxpwAuKCyklt1QH7h6T6z88Wgue7UZ8AzN84DMcLdGAFehF3T2Eo2RqgSR8gaPsJg7vXKRPTbek3EinHzV3JbbV52wGmaP2zDNxTAWAf10Umdx0Lkm6RJR6eba+KXAppygJgj4/H503QJ1T/4dLS9jb7uMUTrSDDc0lQ4k6J2I2O9Q9yNl8GFH/rNVohWh83NQyyYNIbLp+P4EGdKs6O51ZLyJWz/4a2slYgnHNAJTv2m/HoEfRlz6lEThQs+xxXgge8hVlMDu2jGA1D+zmjNhNwHuBTG7qica0ASMp/9eE2iMX33PPijSr8kLjKfIXe6iqpVFoq0nyiuATkjepztWyEEC6iRzV2JcXf23X7kF3sCbuMxZfNcupGyVSuYi7Dd7Ow=

The fluster score is 77/135 for JVT-AVC_V1 and 42/69 for JVT-FR-EXT.

While there are no unexpected test cases. FM1_FT_E, SP1_BT_A and
sp2_bt_b still have some unsupported features that are not rejected,
which causes the hardware to fault.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/platform/apple/avd/Kconfig    |   1 +
 drivers/media/platform/apple/avd/Makefile   |   2 +-
 drivers/media/platform/apple/avd/avd-h264.c | 862 ++++++++++++++++++++++++++++
 drivers/media/platform/apple/avd/avd-v4l2.c |  72 ++-
 drivers/media/platform/apple/avd/avd.h      |   2 +
 5 files changed, 937 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/apple/avd/Kconfig b/drivers/media/platform/apple/avd/Kconfig
index 68efa2df368a..cad7cfa72451 100644
--- a/drivers/media/platform/apple/avd/Kconfig
+++ b/drivers/media/platform/apple/avd/Kconfig
@@ -9,6 +9,7 @@ config VIDEO_APPLE_AVD
 	depends on V4L_PLATFORM_DRIVERS
 	select V4L2_MEM2MEM_DEV
 	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_H264
 	help
 	  Support for hardware video decoding on Apple Silicon devices using
 	  the Apple Video Decoder (AVD).
diff --git a/drivers/media/platform/apple/avd/Makefile b/drivers/media/platform/apple/avd/Makefile
index b2f6736a790e..482d43f8ea8e 100644
--- a/drivers/media/platform/apple/avd/Makefile
+++ b/drivers/media/platform/apple/avd/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-apple-avd-y := avd-drv.o avd-v4l2.o
+apple-avd-y := avd-drv.o avd-v4l2.o avd-h264.o
 obj-$(CONFIG_VIDEO_APPLE_AVD) += apple-avd.o
diff --git a/drivers/media/platform/apple/avd/avd-h264.c b/drivers/media/platform/apple/avd/avd-h264.c
new file mode 100644
index 000000000000..c32b805a9405
--- /dev/null
+++ b/drivers/media/platform/apple/avd/avd-h264.c
@@ -0,0 +1,862 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Video Decoder H264 driver
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
+#include <linux/dev_printk.h>
+
+#include <media/v4l2-h264.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "avd.h"
+#include "avd-inst.h"
+
+#define H264_SCL_DIMS	(0x1000000 | ((64 / 4) << 5) | (((16 / 4) << 5) - 1))
+
+#define h264_FLAG_CI_PRED(v)			FIELD_PREP(BIT(19), !!(v))
+#define H264_FLAG_ENTROPY_CODING_MODE(v)	FIELD_PREP(BIT(20), !!(v))
+#define H264_FLAG_NOT_IDR(v)			FIELD_PREP(BIT(21), !!(v))
+
+#define H264_TRANSFORM_8X8_MODE(v)		FIELD_PREP(BIT(7), !!(v))
+
+struct avd_h264_run {
+	struct avd_run base;
+
+	const struct v4l2_ctrl_h264_decode_params *decode_params;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const struct v4l2_ctrl_h264_slice_params *slice_params;
+
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
+	const struct v4l2_ctrl_h264_pred_weights *pred_weights;
+
+	struct run_addr {
+		dma_addr_t mv_color;
+	} addresses;
+
+	s32 cur_poc;
+	u8 num_valid;
+};
+
+/* state */
+struct avd_h264_ctx {
+	struct avd_h264_reflists {
+		struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
+		struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
+		struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
+	} reflists;
+
+	struct avd_buf *slices;
+	struct avd_buf *active_slice;
+	size_t slice_num;
+	size_t alloc_slice_num;
+
+	struct avd_h264_bufs {
+		struct avd_buf above_info;
+		struct avd_buf lf_above_info;
+		struct avd_buf lf_above;
+		struct avd_buf ip_above;
+		struct avd_buf mv_above_info;
+	} bufs;
+};
+
+/*
+ * use first_mb_in_slice instead of fh.m2m_ctx->new_frame to detect at new
+ * frame since many clients dont submit propper timestamps
+ * We only support slices in raster order anyway
+ */
+#define is_new_frame(sl) ((sl)->first_mb_in_slice == 0)
+
+/* scaling matrix */
+static const u32 default_8x8_intra[] = {
+	0x060a0d10, 0x0a0b1012, 0x0d101217, 0x10121719, 0x1217191b, 0x17191b1d,
+	0x191b1d1f, 0x1b1d1f21, 0x1217191b, 0x17191b1d, 0x191b1d1f, 0x1b1d1f21,
+	0x1d1f2124, 0x1f212426, 0x21242628, 0x2426282a,
+};
+
+static const u32 default_8x8_inter[] = {
+	0x090d0f11, 0x0d0d1113, 0x0f111315, 0x11131516, 0x13151618, 0x15161819,
+	0x1618191b, 0x18191b1c, 0x13151618, 0x15161819, 0x1618191b, 0x18191b1c,
+	0x191b1c1e, 0x1b1c1e20, 0x1c1e2021, 0x1e202123,
+};
+
+static inline u32 mv_color_size(u32 w, u32 h)
+{
+	return (DIV_ROUND_UP(w, 16) + 1) * (DIV_ROUND_UP(h, 16) + 1) * 64;
+}
+
+/* sorry for the formatting */
+
+static void stream_refs(struct avd_ctx *ctx, struct avd_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_decode_params *decode = run->decode_params;
+	const struct v4l2_h264_dpb_entry *dpb = decode->dpb;
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	struct avd_decoded_buffer *dst, *ref;
+	dma_addr_t addr;
+
+	dst = vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
+
+	push(0, "");
+	pusha(h264_ctx->bufs.mv_above_info.addr, "mv_above_info", 7);
+	pusha(run->addresses.mv_color, "mv_color", 0);
+
+	push(0, "");
+	push(0, "");
+	push(0, "");
+	push(0, "");
+
+	for (int i = 0; i < ARRAY_SIZE(decode->dpb); i++) {
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_VALID))
+			continue;
+
+		ref = avd_get_ref_buf(ctx, &dst->base.vb, dpb[i].reference_ts);
+
+		addr = vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf, 0) +
+		       ref->comp.start_offset;
+
+		push(AVD_REF_NUM(run->num_valid - 1) | AVD_REF_FLAG_CONST |
+			     AVD_REF_FLAG_LONG(
+				     dpb[i].flags &
+				     V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) |
+			     AVD_REF_DELTA_POC(run->cur_poc -
+					       dpb[i].top_field_order_cnt),
+		     "hdr_d0_ref_hdr");
+
+		push_comp(ctx, addr, ctx->comp.offsets);
+	}
+}
+
+static void stream_scaling(struct avd_ctx *ctx, struct avd_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_pps *pps = run->pps;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling =
+		run->scaling_matrix;
+
+	push(H264_SCL_DIMS, "hdr_4c_pic_scaling_list_dims");
+
+	for (int i = 0; i < 6; i++)
+		for (int j = 0; j < 16; j += 4)
+			push(AVD_SCALING_I3(
+				     scaling->scaling_list_4x4[i][j + 0]) |
+				     AVD_SCALING_I2(
+					     scaling->scaling_list_4x4[i][j + 1]) |
+				     AVD_SCALING_I1(
+					     scaling->scaling_list_4x4[i][j + 2]) |
+				     AVD_SCALING_I0(
+					     scaling->scaling_list_4x4[i][j + 3]),
+			     "scl_46c_pic_scaling_matrix_4x4");
+
+	/* Instead of 8x8 raster scan order avd expects 4 4x4 subblocks */
+	static const u8 map[16] = {
+		0,  8,	16, 24, /* top left */
+		4,  12, 20, 28, /* top right */
+		32, 40, 48, 56, /* bottom left */
+		36, 44, 52, 60, /* bottom right */
+	};
+
+	/* 7.3.2.2, only matrix 0 and 1 are used if chroma_format_idc < 3 */
+	if (pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE) {
+		for (int i = 0; i < 2; i++)
+			for (int j = 0; j < 16; j++)
+				push(AVD_SCALING_I3(scaling->scaling_list_8x8
+							    [i][map[j] + 0]) |
+					     AVD_SCALING_I2(
+						     scaling->scaling_list_8x8
+							     [i][map[j] + 1]) |
+					     AVD_SCALING_I1(
+						     scaling->scaling_list_8x8
+							     [i][map[j] + 2]) |
+					     AVD_SCALING_I0(
+						     scaling->scaling_list_8x8
+							     [i][map[j] + 3]),
+				     "scl_4cc_pic_scaling_matrix_8x8");
+
+	} else {
+		for (int i = 0; i < ARRAY_SIZE(default_8x8_intra); i++)
+			push(default_8x8_intra[i],
+			     "scl_4cc_pic_scaling_matrix_8x8");
+		for (int i = 0; i < ARRAY_SIZE(default_8x8_inter); i++)
+			push(default_8x8_inter[i],
+			     "scl_4cc_pic_scaling_matrix_8x8");
+	}
+}
+
+static void stream_hdr(struct avd_ctx *ctx, struct avd_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_decode_params *decode = run->decode_params;
+	const struct v4l2_ctrl_h264_sps *sps = run->sps;
+	const struct v4l2_ctrl_h264_pps *pps = run->pps;
+	struct avd_dev *avd = ctx->dev;
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	u32 bytesperline;
+	u32 width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
+	u32 height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+	push(AVD_OP_HDR | AVD_OP_HDR_FLAG_DECOMP(ctx->decomp) |
+		     AVD_OP_HDR_FLAG_INTRA(
+			     decode->flags &
+			     V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) |
+		     AVD_OP_HDR_CONST |
+		     AVD_OP_HDR_FLAG_PIPE_STATE(
+			     !(avd->variant->quirks & AVD_QUIRK_NO_PIPE_STATE)),
+	     "hdr_34_start_hdr");
+
+	push(AVD_HDR_CODEC_MODE(AVD_CODEC_H264), "hdr_38_mode");
+
+	push(AVD_HDR_HEIGHT(height - 1) | AVD_HDR_WIDTH(width - 1),
+	     "hdr_3c_height_width");
+
+	push(0, "hdr_40_zero");
+
+	push(AVD_HDR_HEIGHT((height - 1) >> 3) |
+		     AVD_HDR_WIDTH((width - 1) >> 3),
+	     "hdr_28_height_width_shift3");
+
+	push(AVD_HDR_COMMON_CHROMA_FORMAT(sps->chroma_format_idc) |
+		     AVD_HDR_COMMON_BIT_DEPTH_L(sps->bit_depth_luma_minus8) |
+		     AVD_HDR_COMMON_BIT_DEPTH_C(sps->bit_depth_chroma_minus8) |
+		     AVD_HDR_COMMON_MIN_LUMA_CBS(1) |
+		     AVD_HDR_COMMON_LUMA_CBS(1) |
+		     H264_TRANSFORM_8X8_MODE(
+			     pps->flags &
+			     V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE) |
+		     AVD_HDR_COMMON_FLAG0(
+			     sps->flags &
+			     V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE),
+	     "hdr_2c_sps_param");
+
+	push(H264_FLAG_ENTROPY_CODING_MODE(
+		     pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) |
+		     H264_FLAG_NOT_IDR(!(decode->flags &
+					 V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC)) |
+		     h264_FLAG_CI_PRED(
+			     pps->flags &
+			     V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED),
+	     "hdr_44_flags");
+
+	push(AVD_HDR_H26X_QP_OFFSET_CB(pps->chroma_qp_index_offset) |
+		     AVD_HDR_H26X_QP_OFFSET_CR(
+			     pps->second_chroma_qp_index_offset),
+	     "hdr_48_chroma_qp_index_offset");
+
+	push(AVD_HDR_FEAT_H26X | AVD_HDR_FEAT_COMMON | AVD_HDR_FEAT_H264 |
+		     AVD_HDR_FEAT_PIPE_STATE_EN(
+			     !(avd->variant->quirks & AVD_QUIRK_NO_PIPE_STATE)),
+	     "hdr_58_const_3a");
+
+	push(0, "");
+	push(0, "");
+
+	if (avd->variant->revision == 3)
+		push(0, "zero");
+
+	pusha(h264_ctx->bufs.above_info.addr, "hdr_9c_pps_tile_addr_lsb8", 0);
+
+	push(0, "");
+	push(0, "");
+
+	if (avd->variant->revision == 3)
+		push(0, "zero");
+	else if (!(avd->variant->quirks & AVD_QUIRK_NO_PIPE_STATE))
+		pusha(ctx->pipe_state.addr, "pipe_state", 0);
+
+	pusha(h264_ctx->bufs.ip_above.addr, "ip_above", 1);
+	pusha(h264_ctx->bufs.lf_above.addr, "lf_above", 2);
+	pusha(h264_ctx->bufs.lf_above_info.addr, "lf_above_info", 3);
+	push(0, "");
+
+	push_comp(ctx, run->base.comp_out, ctx->comp.offsets);
+
+	bytesperline = ctx->decoded_fmt.fmt.pix_mp.plane_fmt[0].bytesperline;
+	if (avd->variant->quirks & AVD_QUIRK_LSR)
+		bytesperline = bytesperline >> 4;
+
+	pusha(run->base.y_out, "hdr_210_y_addr_lsb8", 0);
+	push(bytesperline, "hdr_218_width_align");
+	pusha(run->base.uv_out, "hdr_214_uv_addr_lsb8", 0);
+	push(bytesperline, "hdr_21c_width_align");
+
+	push(0, "cm3_mark_end_section");
+	push(((height - 1) << 16) | (width - 1), "hdr_54_height_width");
+
+	if (!(decode->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC))
+		stream_refs(ctx, run);
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT)
+		stream_scaling(ctx, run);
+	else
+		push(0, "cm3_mark_end_section_scl");
+}
+
+#define DEFAULT_WEIGHT_DENOM \
+	(AVD_OP_WEIGHTS_HDR_LUMA(5) | AVD_OP_WEIGHTS_HDR_CHROMA(5))
+
+static void stream_weights(struct avd_ctx *ctx, struct avd_h264_run *run)
+{
+	int luma_denom, chroma_denom;
+	struct v4l2_h264_weight_factors factors;
+	const struct v4l2_ctrl_h264_pred_weights *weights = run->pred_weights;
+	const struct v4l2_ctrl_h264_pps *pps = run->pps;
+	const struct v4l2_ctrl_h264_slice_params *sl = run->slice_params;
+
+	bool pred_weight_req = V4L2_H264_CTRL_PRED_WEIGHTS_REQUIRED(pps, sl);
+	bool default_weights = pps->weighted_bipred_idc == 2 &&
+			       !pred_weight_req;
+
+	push(AVD_OP_WEIGHTS_HDR | AVD_OP_WEIGHTS_HDR_FLAG1(default_weights) |
+		     AVD_OP_WEIGHTS_HDR_FLAG0(pred_weight_req) |
+		     AVD_OP_WEIGHTS_HDR_LUMA(
+			     !default_weights ?
+				     weights->luma_log2_weight_denom :
+				     0) |
+		     AVD_OP_WEIGHTS_HDR_CHROMA(
+			     !default_weights ?
+				     weights->chroma_log2_weight_denom :
+				     0) |
+		     (default_weights ? DEFAULT_WEIGHT_DENOM : 0),
+	     "slc_76c_cmd_weights_denom");
+
+	if (!pred_weight_req)
+		return;
+
+	luma_denom = 1 << weights->luma_log2_weight_denom;
+	chroma_denom = 1 << weights->chroma_log2_weight_denom;
+
+	for (int y = 0; y < 2; y++) {
+		if (y == 1 && sl->slice_type != V4L2_H264_SLICE_TYPE_B)
+			break;
+
+		factors = weights->weight_factors[y];
+		int to = y == 0 ? sl->num_ref_idx_l0_active_minus1 :
+				  sl->num_ref_idx_l1_active_minus1;
+		for (int i = 0; i < to + 1; i++) {
+			/*
+			 * AVD only expects offsets/weights if they are not
+			 * the default ones, otherwise we get artifacts
+			 */
+			if (factors.luma_weight[i] != luma_denom ||
+			    factors.luma_offset[i] != 0) {
+				push(AVD_OP_WEIGHTS | AVD_OP_WEIGHTS_IDENT(1) |
+					     AVD_OP_WEIGHTS_LIST_IDX(y) |
+					     AVD_OP_WEIGHTS_INDEX(i) |
+					     AVD_OP_WEIGHTS_WEIGHT(
+						     factors.luma_weight[i]),
+				     "slc_luma_weights");
+				push(AVD_OP_OFFSETS |
+					     AVD_OP_OFFSETS_OFFSET(
+						     factors.luma_offset[i]),
+				     "slc_luma_offsets");
+			}
+
+			if (factors.chroma_weight[i][0] != chroma_denom ||
+			    factors.chroma_offset[i][0] != 0 ||
+			    factors.chroma_weight[i][1] != chroma_denom ||
+			    factors.chroma_offset[i][1] != 0) {
+				push(AVD_OP_WEIGHTS | AVD_OP_WEIGHTS_IDENT(2) |
+					     AVD_OP_WEIGHTS_LIST_IDX(y) |
+					     AVD_OP_WEIGHTS_INDEX(i) |
+					     AVD_OP_WEIGHTS_WEIGHT(
+						     factors.chroma_weight[i][0]),
+				     "slc_chroma_weights[0]");
+				push(AVD_OP_OFFSETS |
+					     AVD_OP_OFFSETS_OFFSET(
+						     factors.chroma_offset[i][0]),
+				     "slc_chroma_offsets[0]");
+				push(AVD_OP_WEIGHTS | AVD_OP_WEIGHTS_IDENT(3) |
+					     AVD_OP_WEIGHTS_LIST_IDX(y) |
+					     AVD_OP_WEIGHTS_INDEX(i) |
+					     AVD_OP_WEIGHTS_WEIGHT(
+						     factors.chroma_weight[i][1]),
+				     "slc_chroma_weights[1]");
+				push(AVD_OP_OFFSETS |
+					     AVD_OP_OFFSETS_OFFSET(
+						     factors.chroma_offset[i][1]),
+				     "slc_chroma_offsets[1]");
+			}
+		}
+	}
+}
+
+static void stream_slice(struct avd_ctx *ctx, struct avd_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_decode_params *decode = run->decode_params;
+	const struct v4l2_ctrl_h264_pps *pps = run->pps;
+	const struct v4l2_ctrl_h264_sps *sps = run->sps;
+	const struct v4l2_ctrl_h264_slice_params *sl = run->slice_params;
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	u32 payload_len = h264_ctx->active_slice->size;
+	bool en_mode = (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) ==
+		       0;
+	const u8 *data = h264_ctx->active_slice->cpu;
+	u32 min_off = (sl->header_bit_size + (en_mode ? 0 : 7)) / 8;
+	u32 off = 2;
+	u32 num_ref_idx_active, bytes_read = 2;
+	dma_addr_t coded_in, mv_color_addr;
+	struct avd_decoded_buffer *dst, *ref;
+
+	dst = vb2_to_avd_decoded_buf(&run->base.bufs.dst->vb2_buf);
+
+	if (off > payload_len || payload_len < min_off)
+		return;
+
+	/* include emulation byte in offset to slice header */
+	while (bytes_read < min_off && off < payload_len) {
+		if (data[off - 2] != 0x00 || data[off - 1] != 0x00 ||
+		    data[off] != 0x03)
+			bytes_read++;
+		off++;
+	}
+
+	coded_in = h264_ctx->active_slice->addr + off;
+
+	push(AVD_OP_CODED_DATA |
+		     AVD_OP_CODED_DATA_BIT_OFF(
+			     en_mode ? (sl->header_bit_size % 8) : 0) |
+		     AVD_OP_CODED_IN_HI(coded_in),
+	     "slc_a7c_cmd_set_coded_slice");
+	push(AVD_OP_CODED_IN_LO(coded_in), "slc_a84_slice_addr_low");
+	push(payload_len - off, "slc_a88_slice_hdr_size");
+
+	push(AVD_OP_SL_LOC |
+		     AVD_OP_SL_LOC_Y(sl->first_mb_in_slice /
+				     (sps->pic_width_in_mbs_minus1 + 1)) |
+		     AVD_OP_SL_LOC_X(sl->first_mb_in_slice %
+				     (sps->pic_width_in_mbs_minus1 + 1)),
+	     "cm3_cmd_exec_mb_vp");
+
+	push(AVD_OP_QP | AVD_OP_QP_VAL(26 + pps->pic_init_qp_minus26 +
+				       sl->slice_qp_delta),
+	     "slc_a70_cmd_quant_param");
+
+	push(AVD_OP_DBLK |
+		     AVD_OP_DBLK_FLAG_FULL_EN(
+			     sl->disable_deblocking_filter_idc == 0) |
+		     AVD_OP_DBLK_FLAG_EN(sl->disable_deblocking_filter_idc !=
+					 1) |
+		     AVD_OP_DBLK_OFF1(sl->slice_beta_offset_div2) |
+		     AVD_OP_DBLK_OFF0(sl->slice_alpha_c0_offset_div2),
+	     "slc_a74_cmd_deblocking_filter");
+
+	if (sl->slice_type == V4L2_H264_SLICE_TYPE_P ||
+	    sl->slice_type == V4L2_H264_SLICE_TYPE_B) {
+		num_ref_idx_active = sl->num_ref_idx_l0_active_minus1 + 1;
+		for (u32 i = 0; i < num_ref_idx_active; i++)
+			push(AVD_OP_REF | AVD_OP_REF_LIST_IDX(0) |
+				     AVD_OP_REF_LOOP_IDX(i) |
+				     AVD_OP_REF_DBP_IDX(
+					     sl->ref_pic_list0[i].index),
+			     "slc_6e8_cmd_ref_list_0");
+
+		if (sl->slice_type == V4L2_H264_SLICE_TYPE_B) {
+			num_ref_idx_active =
+				sl->num_ref_idx_l1_active_minus1 + 1;
+			for (u32 i = 0; i < num_ref_idx_active; i++)
+				push(AVD_OP_REF | AVD_OP_REF_LIST_IDX(1) |
+					     AVD_OP_REF_LOOP_IDX(i) |
+					     AVD_OP_REF_DBP_IDX(
+						     sl->ref_pic_list1[i].index),
+				     "slc_6e8_cmd_ref_list_0");
+		}
+		stream_weights(ctx, run);
+	}
+
+	if (sl->first_mb_in_slice == 0) {
+		push(AVD_OP_SL_DIM_START, "cm3_cmd_set_mb_dims");
+		push(AVD_SL_DIM_END_Y(sps->pic_height_in_map_units_minus1) |
+			     AVD_SL_DIM_END_X(sps->pic_width_in_mbs_minus1),
+		     "cm3_set_mb_dims");
+	}
+
+	push(AVD_OP_SL_REF | AVD_OP_SL_REF_FLAG_CABAC(sl->cabac_init_idc == 1) |
+		     AVD_OP_SL_REF_FLAG1(sl->cabac_init_idc == 2) |
+		     AVD_OP_SL_REF_FLAG2(
+			     !(sl->flags &
+			       V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED)) |
+		     AVD_OP_SL_REF_NUM_L0(sl->num_ref_idx_l0_active_minus1) |
+		     AVD_OP_SL_REF_NUM_L1(sl->num_ref_idx_l1_active_minus1) |
+		     AVD_OP_SL_REF_SLICE_P(sl->slice_type ==
+					   V4L2_H264_SLICE_TYPE_P) |
+		     AVD_OP_SL_REF_SLICE_I(sl->slice_type ==
+					   V4L2_H264_SLICE_TYPE_I) |
+		     AVD_OP_SL_REF_SLICE_B(sl->slice_type ==
+					   V4L2_H264_SLICE_TYPE_B)
+
+		     ,
+	     "slc_6e4_cmd_ref_type");
+
+	if (sl->slice_type == V4L2_H264_SLICE_TYPE_B) {
+
+		/* sl->ref_pic_list1[0].index < ARRAY_SIZE(decode->dpb) */
+		/* bidirectional reference of previous mv */
+		ref = avd_get_ref_buf(
+			ctx, &dst->base.vb,
+			decode->dpb[sl->ref_pic_list1[0].index].reference_ts);
+
+		mv_color_addr =
+			vb2_dma_contig_plane_dma_addr(&ref->base.vb.vb2_buf,
+						      0) +
+			(ref->base.vb.vb2_buf.planes[0].length -
+			 mv_color_size(fmt_width(ctx), fmt_height(ctx)));
+
+		pusha(mv_color_addr, "slc_a78_sps_tile_addr2_lsb8", 0);
+	}
+}
+
+static int avd_h264_alloc_bufs(struct avd_ctx *ctx)
+{
+	struct avd_dev *dev = ctx->dev;
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	int ret, w, bit_depth, mb;
+
+	w = fmt_width(ctx);
+	bit_depth = (ctx->image_fmt == AVD_IMG_FMT_420_10BIT ||
+		     ctx->image_fmt == AVD_IMG_FMT_422_10BIT) ?
+			    10 :
+			    8;
+
+	mb = DIV_ROUND_UP(w, 16);
+
+	ret = avd_buf_alloc(dev, &h264_ctx->bufs.above_info, mb * 20);
+	if (ret)
+		return ret;
+
+	ret = avd_buf_alloc(dev, &h264_ctx->bufs.ip_above, bit_depth * 4 * mb);
+	if (ret)
+		return ret;
+
+	ret = avd_buf_alloc(dev, &h264_ctx->bufs.lf_above,
+			    bit_depth * 4 * 4 * mb);
+	if (ret)
+		return ret;
+
+	ret = avd_buf_alloc(dev, &h264_ctx->bufs.lf_above_info, 32 * mb);
+	if (ret)
+		return ret;
+
+	ret = avd_buf_alloc(dev, &h264_ctx->bufs.mv_above_info, 32 * mb);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int avd_h264_validate_pps(struct avd_ctx *ctx,
+				 const struct v4l2_ctrl_h264_pps *pps)
+{
+	if (pps->num_slice_groups_minus1 != 0) {
+		dev_err(ctx->dev->dev, "pps->num_slice_groups_minus1 != 0");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int avd_h264_validate_sps(struct avd_ctx *ctx,
+				 const struct v4l2_ctrl_h264_sps *sps)
+{
+	if (sps->chroma_format_idc > 2)
+		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
+		return -EINVAL;
+	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
+		/* Luma and chroma bit depth mismatch */
+		return -EINVAL;
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+		/* no interlaced support */
+		return -EINVAL;
+
+	return 0;
+}
+
+static void avd_h264_stop(struct avd_ctx *ctx)
+{
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	struct avd_dev *dev = ctx->dev;
+	int i;
+
+	if (!h264_ctx)
+		return;
+
+	avd_buf_free(dev, &h264_ctx->bufs.above_info);
+	avd_buf_free(dev, &h264_ctx->bufs.lf_above_info);
+	avd_buf_free(dev, &h264_ctx->bufs.lf_above);
+	avd_buf_free(dev, &h264_ctx->bufs.ip_above);
+	avd_buf_free(dev, &h264_ctx->bufs.mv_above_info);
+
+	for (i = 0; i < h264_ctx->slice_num; i++)
+		avd_buf_free(dev, &h264_ctx->slices[i]);
+
+	kfree(h264_ctx->slices);
+	kfree(h264_ctx);
+}
+
+static int avd_h264_start(struct avd_ctx *ctx)
+{
+	struct avd_h264_ctx *h264_ctx;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_H264_SPS);
+	if (!ctrl)
+		return -EINVAL;
+
+	ret = avd_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
+	if (ret)
+		return ret;
+
+	h264_ctx = kzalloc_obj(*h264_ctx, GFP_KERNEL);
+	if (!h264_ctx)
+		return -ENOMEM;
+
+	ctx->priv = h264_ctx;
+
+	/* assume one slice per row */
+	h264_ctx->alloc_slice_num =
+		ctrl->p_new.p_h264_sps->pic_height_in_map_units_minus1 + 1;
+	h264_ctx->slices = kzalloc_objs(*h264_ctx->slices,
+					h264_ctx->alloc_slice_num, GFP_KERNEL);
+	if (!h264_ctx->slices)
+		goto err_free_ctx;
+
+	ret = avd_h264_alloc_bufs(ctx);
+	if (ret)
+		goto err_free_ctx;
+
+	return 0;
+
+err_free_ctx:
+	avd_h264_stop(ctx);
+	ctx->priv = NULL;
+	return ret;
+}
+
+static void avd_h264_run_preamble(struct avd_ctx *ctx, struct avd_h264_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+	u32 dst_len, mv_color_len;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_DECODE_PARAMS);
+	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_H264_SPS);
+	run->sps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, V4L2_CID_STATELESS_H264_PPS);
+	run->pps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_SLICE_PARAMS);
+	run->slice_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_SCALING_MATRIX);
+	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_PRED_WEIGHTS);
+	run->pred_weights = ctrl ? ctrl->p_cur.p : NULL;
+
+	avd_run_preamble(ctx, &run->base);
+
+	dst_len = run->base.bufs.dst->vb2_buf.planes[0].length;
+
+	mv_color_len = mv_color_size(fmt_width(ctx), fmt_height(ctx));
+
+	run->addresses.mv_color = run->base.y_out + (dst_len - mv_color_len);
+}
+
+static int avd_h264_realloc_slices(struct avd_ctx *ctx)
+{
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	struct avd_job *job = &ctx->job;
+	struct avd_buf tmp_buf = {};
+	size_t alloc_slice_num;
+	void *tmp;
+	int ret;
+
+	tmp = h264_ctx->slices;
+	alloc_slice_num = (h264_ctx->alloc_slice_num * 3) / 2 + 1;
+	h264_ctx->slices =
+		kzalloc_objs(*h264_ctx->slices, alloc_slice_num, GFP_KERNEL);
+	if (!h264_ctx->slices) {
+		/* make deallocating a little easier */
+		h264_ctx->slices = tmp;
+		return -ENOMEM;
+	}
+
+	h264_ctx->alloc_slice_num = alloc_slice_num;
+	memcpy(h264_ctx->slices, tmp,
+	       sizeof(*h264_ctx->slices) * h264_ctx->slice_num);
+	kfree(tmp);
+
+	/* we could already have the correct size */
+	if ((alloc_slice_num + 1) * sizeof(*job->segments) < job->buf.size)
+		return 0;
+
+	ret = avd_buf_alloc(ctx->dev, &tmp_buf,
+			   (alloc_slice_num + 1) * sizeof(*job->segments));
+	if (ret)
+		return -ENOMEM;
+
+	job->segments = tmp_buf.cpu;
+	job->num_alloc = (alloc_slice_num + 1);
+	memset(tmp_buf.cpu, 0, tmp_buf.size);
+	memcpy(job->segments, job->buf.cpu,
+	       sizeof(*job->segments) * (job->num + 1));
+
+	avd_buf_free(ctx->dev, &job->buf);
+	memcpy(&job->buf, &tmp_buf, sizeof(tmp_buf));
+	return 0;
+}
+
+static int avd_h264_run(struct avd_ctx *ctx)
+{
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	struct v4l2_h264_reflist_builder reflist_builder;
+	struct avd_h264_run run;
+	struct vb2_v4l2_buffer *src;
+	void *slice;
+	int ret;
+
+	avd_h264_run_preamble(ctx, &run);
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	slice = vb2_plane_vaddr(&src->vb2_buf, 0);
+	if (!slice) {
+		dev_err_ratelimited(ctx->dev->dev, "could not get slice vaddr");
+		ret = -EINVAL;
+		goto postamble;
+	}
+
+	if (ctx->job.segments &&
+	    h264_ctx->slice_num >= h264_ctx->alloc_slice_num) {
+		ret = avd_h264_realloc_slices(ctx);
+		if (ret)
+			goto postamble;
+	}
+
+	h264_ctx->active_slice = &h264_ctx->slices[h264_ctx->slice_num];
+	ret = avd_buf_alloc(ctx->dev, h264_ctx->active_slice,
+			    vb2_get_plane_payload(&src->vb2_buf, 0));
+	if (ret)
+		goto postamble;
+
+	memcpy(h264_ctx->active_slice->cpu, slice,
+	       h264_ctx->active_slice->size);
+	h264_ctx->slice_num++;
+
+	/* Build the P/B{0,1} ref lists. */
+	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
+				       run.sps, run.decode_params->dpb);
+
+	run.num_valid = reflist_builder.num_valid;
+	run.cur_poc = reflist_builder.cur_pic_order_count;
+
+	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
+	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
+				    h264_ctx->reflists.b1);
+
+
+	if (is_new_frame(run.slice_params)) {
+		ret = avd_init_job(ctx, AVD_CODEC_H264,
+				   h264_ctx->alloc_slice_num + 1);
+		if (ret)
+			goto postamble;
+		stream_hdr(ctx, &run);
+		/* h264 only submits once */
+		avd_end_segment(ctx, true);
+	}
+
+	if (!ctx->job.segments) {
+		ret = -EINVAL;
+		goto postamble;
+	}
+
+	stream_slice(ctx, &run);
+	avd_end_segment(ctx, false);
+
+	if (run.base.bufs.src->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF) {
+		avd_run_postamble(ctx, &run.base);
+		avd_job_finish(ctx, VB2_BUF_STATE_DONE);
+		return 0;
+	}
+
+	ret = avd_submit_job(ctx);
+
+postamble:
+	avd_run_postamble(ctx, &run.base);
+	return ret;
+}
+
+static void avd_h264_done(struct avd_ctx *ctx, struct vb2_v4l2_buffer *src_buf,
+			  struct vb2_v4l2_buffer *dst_buf,
+			  enum vb2_buffer_state result)
+{
+	struct avd_dev *avd = ctx->dev;
+	struct avd_h264_ctx *h264_ctx = ctx->priv;
+	int i;
+
+	if (!(src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)) {
+		for (i = 0; i < h264_ctx->slice_num; i++)
+			avd_buf_free(avd, &h264_ctx->slices[i]);
+		h264_ctx->slice_num = 0;
+		ctx->job.segments = NULL;
+	}
+}
+
+static enum avd_image_fmt avd_h264_get_image_fmt(struct avd_ctx *ctx,
+						 struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+
+	if (ctrl->id != V4L2_CID_STATELESS_H264_SPS)
+		return AVD_IMG_FMT_ANY;
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
+static void avd_h264_adjust_decoded_fmt(struct avd_ctx *ctx,
+					struct v4l2_pix_format_mplane *pix_mp)
+{
+	pix_mp->plane_fmt[0].sizeimage +=
+		mv_color_size(pix_mp->width, pix_mp->height);
+}
+
+static int avd_h264_try_ctrl(struct avd_ctx *ctx, struct v4l2_ctrl *ctrl)
+{
+	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS)
+		return avd_h264_validate_sps(ctx, ctrl->p_new.p_h264_sps);
+	if (ctrl->id == V4L2_CID_STATELESS_H264_PPS)
+		return avd_h264_validate_pps(ctx, ctrl->p_new.p_h264_pps);
+
+	return 0;
+}
+
+const struct avd_coded_fmt_ops avd_h264_fmt_ops = {
+	.adjust_decoded_fmt = avd_h264_adjust_decoded_fmt,
+	.start = avd_h264_start,
+	.stop = avd_h264_stop,
+	.done = avd_h264_done,
+	.run = avd_h264_run,
+	.try_ctrl = avd_h264_try_ctrl,
+	.get_image_fmt = avd_h264_get_image_fmt,
+};
diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/platform/apple/avd/avd-v4l2.c
index 838f6e348a49..98d2fe0f082a 100644
--- a/drivers/media/platform/apple/avd/avd-v4l2.c
+++ b/drivers/media/platform/apple/avd/avd-v4l2.c
@@ -204,7 +204,77 @@ const struct v4l2_ctrl_ops avd_ctrl_ops = {
 	.s_ctrl = avd_s_ctrl,
 };
 
-static const struct avd_coded_fmt_desc avd_coded_fmts[] = {};
+static const struct avd_ctrl_desc avd_h264_ctrl_descs[] = {
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_SPS,
+		.cfg.ops = &avd_ctrl_ops,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_PPS,
+		.cfg.ops = &avd_ctrl_ops,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_PRED_WEIGHTS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_SLICE_PARAMS,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+		.cfg.max = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+		.cfg.def = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+	},
+	{
+		.cfg.id = V4L2_CID_STATELESS_H264_START_CODE,
+		.cfg.min = V4L2_STATELESS_H264_START_CODE_NONE,
+		.cfg.max = V4L2_STATELESS_H264_START_CODE_NONE,
+		.cfg.def = V4L2_STATELESS_H264_START_CODE_NONE,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422_INTRA,
+		.cfg.menu_skip_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_444_PREDICTIVE),
+		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+	},
+	{
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+	},
+};
+
+static const struct avd_ctrls avd_h264_ctrls = {
+	.ctrls = avd_h264_ctrl_descs,
+	.num_ctrls = ARRAY_SIZE(avd_h264_ctrl_descs),
+};
+
+static const struct avd_coded_fmt_desc avd_coded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.frmsize = {
+			.min_width = 64,
+			.max_width = 16384,
+			.step_width = 64,
+			.min_height = 64,
+			.max_height = 16384,
+			.step_height = 16,
+		},
+		.ctrls = &avd_h264_ctrls,
+		.ops = &avd_h264_fmt_ops,
+		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
+		.capability = AVD_CAPABILITY_H264,
+	},
+};
 
 static bool avd_is_capable(struct avd_ctx *ctx, unsigned int capability)
 {
diff --git a/drivers/media/platform/apple/avd/avd.h b/drivers/media/platform/apple/avd/avd.h
index 980ecce4f3df..a6e4154d2fac 100644
--- a/drivers/media/platform/apple/avd/avd.h
+++ b/drivers/media/platform/apple/avd/avd.h
@@ -242,6 +242,8 @@ void avd_job_finish(struct avd_ctx *ctx, enum vb2_buffer_state result);
 void avd_run_preamble(struct avd_ctx *ctx, struct avd_run *run);
 void avd_run_postamble(struct avd_ctx *ctx, struct avd_run *run);
 
+extern const struct avd_coded_fmt_ops avd_h264_fmt_ops;
+
 extern const struct v4l2_ctrl_ops avd_ctrl_ops;
 extern const struct v4l2_ioctl_ops avd_ioctl_ops;
 extern const struct vb2_ops avd_queue_ops;

-- 
2.55.0

