Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502E4D6C22;
	Mon,  5 Oct 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220802; cv=none; b=RBVBxnpNKvHhvar11k7oeezY2FSvjHZ62zQp6YCfFbe2TQgR/ArOtDiqO/tQ2VlB9ptlScnquZsuBCzXTeZ+8ZTbbrz2aoHd9yM9NrFFrodf2UWj00YK/Hh07tigiXJIRYGF1OQ9JNrgAdtEB2VrGFgGimypyrRbgHbuyDo0mQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220802; c=relaxed/simple;
	bh=1CSYYKIiLI72C56Be3UNFpwCM4iJs96M2YYNrrKQ9sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gs2fo95RnwrmbQpHf3wBr9iYGjuWesfCYJukVnVGLaQsr4hZ3ntapYYm7bDgjtYo8gMB25snpPBnvZjDtM7GivIhZM+AlBz0bYEON/zxWNXBt7gSQTkRnUKZhVMvdZ89gZo4rMFpf26F2TqIDvKmzYz58q/gAjNxdnlzAKpUYJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISeRnlK0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISeRnlK0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC1C1F00893;
	Mon,  5 Oct 2026 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220800;
	bh=33Y2QJimaw6mHCoXqF7KjzeQ/5/kKGY0O6OILtcUDkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ISeRnlK095c++0wwDNbq7ekeGTVxfp0Gkkt4SU1vI7/uom+9Fcl5DM43XYW0OI5E+
	 1WH/i3YP/svR0HL/ftii+1uFgRGU1nnD8rRXTis+CBEAIqO+p+FLsASBWef1rv1VFt
	 yujUCwH0O6rtVoJ6AgHvazrUANFdg2qfkoDCowYalM2GZifRcNYDKhBgCMxUGooowV
	 o/tOH5X9lF2AlACa6Do2cmAM2o9wjt4elRYJP6H2LQe32fxUwNmL9+vl6ceLqsZTvE
	 YtgwK8K54aQsr/juLMm1LzcwImliN7BhOUvb7RU1PRSdd8H1cT0LlywkYLj8cQydqZ
	 mBCtf0o6y3gVQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:43 +0200
Subject: [PATCH 73/74] media: qcom: camss: vfe-780: Drive the write masters
 through the output ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-73-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6639; i=bod@kernel.org;
 h=from:subject:message-id; bh=3eAd+OfgIoes37o3Y5yIXk4mmfCTx1zQIVICewH+kJQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9s1+7CgaolhEt0UlLiUE3jTGGWISJzoHU7B6
 KRaG1hJ69aJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbNQAKCRAicTuzoY3I
 OqU5D/9xLKY1B3z71+UIvUDdl1tCu9J+IydNZLaR8NOFbp+sn+aXBIpJdo1TDxEOlQTt4heJsSh
 mkanKOVAzCfVXqmTDzEZqhdsNmElxHZs/lvmwd/cUc3VjB/3+Ds2mdOx/3URAOHEwh9JwTWG95i
 AFfzo3FyE2fUeTYwTBIIu+L3mK/j2dH2e5Men9V2c0ulCJtmFrvAly/0fUUI17oD62STflsVTHB
 RHRW2jrtpPTpw9XTDUc9L9j6G2eTZU1IzXk4nSL+SSQ3/iHIubjEwSUpWQqYHexMjvwIdnMDHMB
 ujFqY+/T4RBZi+5Ohkc98+eCWorY+A127cbIgvnJhLYrWk3wc9R5R3vAV0FWIgQsRnLehENRbdN
 f6FIK1DAW0ibS46C4WTQa6fPTc2REE+zRTmdKcY8OiZ0/OBkDwI5N4P+4HQVyylwnw3w0M/4viR
 SyUE74JLfZWUcny55MvMRGlgIctW0ovYTx+4a2Y3eapFZjzLw02eBYf8+SlViICe6qnH2OZBkuV
 8RzkvtSmW5ZhhuPzd7dBbpUkPAB+YqjEBF1xGRoABokq40IHHNXYzKausIxL14jkmmKT2Qjz76o
 oTPkNUf5q/U9mjcnYdDt4o8j/bcY9RAA8zqJSaGuQu1eysh69SPQVKj2qkCuOCIeigmg7Ar7W/a
 wWLV8KlfrGT8rTA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

vfe-780 implemented its outputs inside the write master ops: given one
write master, it ignored it, looked up the output it belongs to and
programmed every write master of that output.

Implement vfe_output_start(), vfe_output_update() and vfe_output_stop()
instead. Each gets the output and programs its group of write masters:
the Y and CbCr planes of the PIX output, the statistics write master,
or the single write master of an RDI. The reverse lookup from write
master to statistics output goes away.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 110 ++++++++--------------
 1 file changed, 41 insertions(+), 69 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 33247e6de898c..6d483f917d151 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -84,10 +84,9 @@ typedef enum {
 #define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
 #define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
 
-/* One write master per plane of the PIX output: Y, then CbCr at half height */
-static void vfe_wm_start_pix(struct vfe_device *vfe, struct vfe_line *line)
+/* Each write master of the PIX output writes one plane: Y, then CbCr at half height */
+static void vfe_output_start_pix(struct vfe_device *vfe, struct vfe_output *output)
 {
-	struct vfe_output *output = &line->output[0];
 	struct v4l2_pix_format_mplane *pix = &output->video_out.active_fmt.fmt.pix_mp;
 	unsigned int i;
 
@@ -116,24 +115,8 @@ static void vfe_wm_start_pix(struct vfe_device *vfe, struct vfe_line *line)
 	}
 }
 
-static struct vfe_output *vfe_stats_output(struct vfe_line *line, u8 wm)
-{
-	unsigned int o;
-
-	if (!line->is_pix)
-		return NULL;
-
-	for (o = 1; o < line->num_outputs; o++)
-		if (line->output[o].pad == MSM_VFE_PAD_SRC_STATS &&
-		    line->output[o].wm_num &&
-		    line->output[o].wm[0].bus_client == wm)
-			return &line->output[o];
-
-	return NULL;
-}
-
 /* Statistics write masters are frame based and fill the output's kernel buffer */
-static void vfe_wm_start_stats(struct vfe_device *vfe, struct vfe_output *output)
+static void vfe_output_start_stats(struct vfe_device *vfe, struct vfe_output *output)
 {
 	u8 wm = output->wm[0].bus_client;
 
@@ -155,29 +138,11 @@ static void vfe_wm_start_stats(struct vfe_device *vfe, struct vfe_output *output
 	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+/* An RDI output has one line based write master dumping the CSI-2 payload */
+static void vfe_output_start_rdi(struct vfe_device *vfe, struct vfe_output *output)
 {
-	struct vfe_output *stats = vfe_stats_output(line, wm);
-
-	struct v4l2_pix_format_mplane *pix =
-		&line->output[0].video_out.active_fmt.fmt.pix_mp;
-
-	wm = line->output[0].wm[0].bus_client;
-
-	/* no clock gating at bus input */
-	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
-
-	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
-
-	if (stats) {
-		vfe_wm_start_stats(vfe, stats);
-		return;
-	}
-
-	if (line->is_pix) {
-		vfe_wm_start_pix(vfe, line);
-		return;
-	}
+	struct v4l2_pix_format_mplane *pix = &output->video_out.active_fmt.fmt.pix_mp;
+	u8 wm = output->wm[0].bus_client;
 
 	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
 	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
@@ -200,42 +165,49 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+static void vfe_output_start(struct vfe_device *vfe, struct vfe_output *output)
 {
-	struct vfe_output *output = &line->output[0];
-	unsigned int i;
+	/* no clock gating at bus input */
+	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
 
-	if (vfe_stats_output(line, wm)) {
-		writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
-		return;
-	}
+	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	if (output->pad == MSM_VFE_PAD_SRC_STATS)
+		vfe_output_start_stats(vfe, output);
+	else if (output->line->is_pix)
+		vfe_output_start_pix(vfe, output);
+	else
+		vfe_output_start_rdi(vfe, output);
+}
+
+static void vfe_output_stop(struct vfe_device *vfe, struct vfe_output *output)
+{
+	unsigned int i;
 
 	for (i = 0; i < output->wm_num; i++)
 		writel(0, vfe->base + VFE_BUS_WM_CFG(output->wm[i].bus_client));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
-			  struct vfe_line *line)
+static void vfe_output_update(struct vfe_device *vfe, struct vfe_output *output,
+			      struct camss_buffer *buf)
 {
-	struct vfe_output *output = &line->output[0];
-	struct vfe_output *stats;
 	unsigned int i;
 
-	/*
-	 * Each frame consumes one programmed address, as for images: hand the
-	 * write master the output's kernel buffer once per queued buffer.
-	 */
-	stats = vfe_stats_output(line, wm);
-	if (stats) {
-		writel(stats->dma_addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
-		return;
-	}
-
-	/* camss-video sets addr[1] = addr[0] + bytesperline * height for NV12 */
 	for (i = 0; i < output->wm_num; i++) {
-		u32 addr = buffer->addr[output->wm[i].plane];
+		u8 wm = output->wm[i].bus_client;
+		u32 addr;
+
+		/*
+		 * Each frame consumes one programmed address. Statistics land
+		 * in the output's kernel buffer, handed over once per queued
+		 * buffer; camss-video sets addr[1] = addr[0] + bytesperline *
+		 * height for NV12.
+		 */
+		if (output->pad == MSM_VFE_PAD_SRC_STATS)
+			addr = output->dma_addr;
+		else
+			addr = buf->addr[output->wm[i].plane];
 
-		wm = output->wm[i].bus_client;
 		writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 
 		dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
@@ -440,8 +412,8 @@ const struct vfe_hw_ops vfe_ops_780 = {
 	.params_num_types = ARRAY_SIZE(vfe_params_info),
 	.vfe_params_apply = vfe_params_apply,
 	.vfe_halt = vfe_halt,
-	.vfe_wm_start = vfe_wm_start,
-	.vfe_wm_stop = vfe_wm_stop,
 	.vfe_buf_done = vfe_buf_done,
-	.vfe_wm_update = vfe_wm_update,
+	.vfe_output_start = vfe_output_start,
+	.vfe_output_stop = vfe_output_stop,
+	.vfe_output_update = vfe_output_update,
 };

-- 
2.55.0

