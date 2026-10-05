Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6C5534475;
	Mon,  5 Oct 2026 17:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220798; cv=none; b=reqxGQ0DtwQBA5B7zS0D+UX81xMsRrevPbDuYP4MOf8/4wx62qMdv7wbephyvdXP/VwlwgtknYkBIDYi36uuGdaWqFUeY61mtSt2g7wVHPMI9uMH8kC1gEwMGVoqFPVtJq0Q+ZJMYSfSzU+rsNoHc5hyHGtB+cpQgTM3DG0aD60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220798; c=relaxed/simple;
	bh=i73ogzvTCd0ulozWQ8euTo5sJJo+kehLMeVuuPs2dPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLqlsjPtO0KkCv6hnantz7yPMw01vrDIzpTUJyGfmIpYM8iFJ8Olgj2GQF5/AyYZnl2xIrpxa6RVyLUYL5URAFUNfFvafrJrntQgUZEw+22iGWkCPe1u84saDXp5y/lmx4qlahF7JnhLE230iaTnRV1hj9hJAPGjJD4nuQIY8bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNf4Cu7k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNf4Cu7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E5C1F00898;
	Mon,  5 Oct 2026 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220796;
	bh=f/ylcXvgUkSf60tvdEamQIwShZyKmnejx/DhwlszxC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HNf4Cu7kH8s0Tr5x6/cmFUgbIPs4t8kf1z3A6zInvytD5TzZ1F8DNboq7/NDahS2j
	 niWJKsPwf6yCpoQIH4K2Xbq7jfrIk72tuFldaJw5s1k5COxdsmANaf+oIDqaP1FQs0
	 XynnUqLu0NlANGklNNiIKMjxZdstnU3WScuXLYNV8BW+YZegIVb3DVpQcK6QjBs489
	 8enAQFFD5gu7GaFstOKrWB/RsitFFvIeX9vuxwp7hO2prQiKear0d11gDNfiSvDODd
	 YEbc/gK5MOhXrNZ99fU+wy0PSHW59X08plTniwciqrQ+dm0K8ltRHgkZRkF5KvdOGK
	 OE8/uTFRIJ/eQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:42 +0200
Subject: [PATCH 72/74] media: qcom: camss: vfe-780: Apply the AEC Bayer
 histogram parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-72-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7211; i=bod@kernel.org;
 h=from:subject:message-id; bh=k8NT5r2w+Gxc4rPBpzLyvnYF179SFsJFAbvANTkh2mk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9s0L+xYP5v6FrOaxF1ugtfiKd0Nuea/Y2AiS
 C8gpFPDEQyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbNAAKCRAicTuzoY3I
 Oio/D/90f/yyNGiqlLkE5j1wQM10f0iWo9iguh5UfYpc5C5EVmncU4XdZ+23JT8dL4e85yfne7F
 /YuDhhAZ3YK5I756xUKVjIh8V9w/0YTaMN3wfI72rWig6GsYr+WdjG2GFpk9jo+nffnQIwJy9cB
 G45BJVpCJRc6WwcqJ1dmmSPKsQsBY3pqJWxhp1xnIEJBMXQbN61oQF4FNghLAjcvSW5hn/pq07K
 +Qh9+nYF9u+ecxTKxGzhMlFq+B7H4mw6kiRF9exXWIwap2bR8OHYpAx1JlYeDGvo23BDxakZt6E
 F2KomYtGdq6T2Y+ujMwt+gfzrepffjIer8DkGKzpmiMRFaUOVaFa3GwQDLizE+4t6FB0JYBDRVA
 KanWM5jEJh548OU9eEuy/BW8omyIzE4VHtwgKuqzZzu7TW46loHn2/RRuqEyfTuNcs21dtVehKC
 IwKVc52sGQky4vKX7S5TYBJUbBuKAjJAytS94/rk6m7i/QnsnNgIhIFsy/yzpbHyP1iWXfbkXEA
 PpKJDEzJEnmikMBmxJqQHSjlE/bG++atcjqog5H3StOZ/djcJSRaXE1X5JYi4bfO2DLtZsR8Zi/
 k5w5eL48AjPeH9iaI90b+ta+9cJxXvi6WLsxdU5Z2xsmL+1n93p8eQL5kDFuMItkLhfp6edhzCL
 oWb/cV2/z2GfwlQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Accept CAMSS_PARAMS_AEC_BHIST on the pixel line's parameters node and
program the region the AEC Bayer histogram counts. The region is clipped
to the Bayer frame entering the line and converted to the 2x2 quads the
histogram counts: RGN_OFFSET_CFG takes the offset and RGN_NUM_CFG the
size, less one, as vfe_setup_aec_bhist() programs the full frame.

The other CAMSS parameters blocks belong to the OPE and are rejected.
Every type up to CAMSS_PARAMS_AEC_BHIST has an entry in the block table,
so that no block passes v4l2_isp_params_validate_buffer() with a size of
zero.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c  | 103 +++++++++++++++++++++
 .../media/platform/qcom/camss/camss-vfe-880-pp.c   |  17 ++++
 .../media/platform/qcom/camss/camss-vfe-880-pp.h   |   2 +
 3 files changed, 122 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 7642d9d4500de..33247e6de898c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -9,6 +9,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 
+#include <linux/qcom-camss-config.h>
+
 #include "camss.h"
 #include "camss-csid-gen3.h"
 #include "camss-vfe.h"
@@ -273,7 +275,105 @@ static void vfe_line_prepare(struct vfe_line *line)
 static const struct camss_video_ops vfe_video_ops_780 = {
 	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
+	.prepare_buffer = vfe_params_prepare,
+};
+
+/* Blocks the IFE does not implement, the OPE's among them */
+static int vfe_params_block_unsupported(struct device *dev,
+					const struct v4l2_isp_block_header *block)
+{
+	dev_dbg(dev, "Unsupported parameters block type %u\n", block->type);
+
+	return -EINVAL;
+}
+
+static int vfe_params_aec_bhist_validate(struct device *dev,
+					 const struct v4l2_isp_block_header *block)
+{
+	const struct camss_params_aec_bhist *bhist =
+		container_of(block, struct camss_params_aec_bhist, header);
+
+	if ((bhist->left | bhist->top | bhist->width | bhist->height) & 1 ||
+	    bhist->width < 2 || bhist->height < 2) {
+		dev_dbg(dev, "Invalid AEC BHIST region %ux%u@%u,%u\n",
+			bhist->width, bhist->height, bhist->left, bhist->top);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * Every type up to the last one the IFE accepts has an entry, so that no
+ * block passes validation with a size of zero.
+ */
+static const struct v4l2_isp_params_block_type_info vfe_params_info[] = {
+	[0] = {
+		.size = sizeof(struct v4l2_isp_params_block_header),
+		.block_validate = vfe_params_block_unsupported,
+	},
+	[CAMSS_PARAMS_WB_GAIN] = {
+		.size = sizeof(struct camss_params_wb_gain),
+		.block_validate = vfe_params_block_unsupported,
+	},
+	[CAMSS_PARAMS_CHROMA_ENHAN] = {
+		.size = sizeof(struct camss_params_chroma_enhan),
+		.block_validate = vfe_params_block_unsupported,
+	},
+	[CAMSS_PARAMS_COLOR_CORRECT] = {
+		.size = sizeof(struct camss_params_color_correct),
+		.block_validate = vfe_params_block_unsupported,
+	},
+	[CAMSS_PARAMS_GAMMA] = {
+		.size = sizeof(struct camss_params_gamma),
+		.block_validate = vfe_params_block_unsupported,
+	},
+	[CAMSS_PARAMS_AEC_BHIST] = {
+		.size = sizeof(struct camss_params_aec_bhist),
+		.block_validate = vfe_params_aec_bhist_validate,
+	},
 };
+
+/* Clip the region to the Bayer frame entering the line, then count quads */
+static void vfe_params_aec_bhist(struct vfe_device *vfe, struct vfe_line *line,
+				 const struct camss_params_aec_bhist *bhist)
+{
+	u32 frame_w = line->fmt[MSM_VFE_PAD_SINK].width & ~1u;
+	u32 frame_h = line->fmt[MSM_VFE_PAD_SINK].height & ~1u;
+	u32 left, top, width, height;
+
+	if (frame_w < 2 || frame_h < 2)
+		return;
+
+	left = min_t(u32, bhist->left, frame_w - 2);
+	top = min_t(u32, bhist->top, frame_h - 2);
+	width = min_t(u32, bhist->width, frame_w - left);
+	height = min_t(u32, bhist->height, frame_h - top);
+
+	vfe_880_set_aec_bhist_region(vfe, left / 2, top / 2,
+				     width / 2 - 1, height / 2 - 1);
+}
+
+static void vfe_params_apply(struct vfe_device *vfe, struct vfe_line *line,
+			     const struct v4l2_isp_buffer *params)
+{
+	size_t offset = 0;
+
+	/* validated at prepare: every block fits and has a non-zero size */
+	while (offset < params->data_size) {
+		const struct v4l2_isp_block_header *block =
+			(const struct v4l2_isp_block_header *)&params->data[offset];
+
+		if (block->type == CAMSS_PARAMS_AEC_BHIST &&
+		    !(block->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE))
+			vfe_params_aec_bhist(vfe, line,
+					     container_of(block,
+							  struct camss_params_aec_bhist,
+							  header));
+
+		offset += block->size;
+	}
+}
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
 	struct vfe_line *pix = &vfe->line[VFE_LINE_PIX];
@@ -336,6 +436,9 @@ const struct vfe_hw_ops vfe_ops_780 = {
 	.vfe_disable = vfe_disable,
 	.vfe_enable = vfe_enable_v2,
 	.vfe_line_prepare = vfe_line_prepare,
+	.params_info = vfe_params_info,
+	.params_num_types = ARRAY_SIZE(vfe_params_info),
+	.vfe_params_apply = vfe_params_apply,
 	.vfe_halt = vfe_halt,
 	.vfe_wm_start = vfe_wm_start,
 	.vfe_wm_stop = vfe_wm_stop,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
index a4bccedb4a2f1..9b4bdad6d3963 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
@@ -460,6 +460,23 @@ static void vfe_setup_aec_bhist(struct vfe_device *vfe, u32 w, u32 h)
 	writel_relaxed(0x00000000, vfe->base + IFE_STATS_AEC_BHIST_MODULE_LUT_BANK_CFG);
 }
 
+/*
+ * vfe_880_set_aec_bhist_region - Select the region the AEC BHIST counts
+ * @vfe: VFE device
+ * @h_offset: horizontal offset, in 2x2 quads
+ * @v_offset: vertical offset, in 2x2 quads
+ * @h_num: width, in 2x2 quads, minus one
+ * @v_num: height, in 2x2 quads, minus one
+ */
+void vfe_880_set_aec_bhist_region(struct vfe_device *vfe, u32 h_offset,
+				  u32 v_offset, u32 h_num, u32 v_num)
+{
+	writel_relaxed(((v_offset & 0x3fff) << 16) | (h_offset & 0x3fff),
+		       vfe->base + IFE_STATS_AEC_BHIST_RGN_OFFSET_CFG);
+	writel_relaxed(((v_num & 0x1fff) << 16) | (h_num & 0x1fff),
+		       vfe->base + IFE_STATS_AEC_BHIST_RGN_NUM_CFG);
+}
+
 /* Main output round/clamp: round mode 2, clamp 0..255 */
 static void vfe_setup_main_output_round_clamp(struct vfe_device *vfe)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
index 32f0a14e5b95a..e033880e5534d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
@@ -7,5 +7,7 @@
 struct vfe_device;
 
 void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, u32 width, u32 height);
+void vfe_880_set_aec_bhist_region(struct vfe_device *vfe, u32 h_offset,
+				  u32 v_offset, u32 h_num, u32 v_num);
 
 #endif

-- 
2.55.0

