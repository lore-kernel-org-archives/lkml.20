Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9151C07A;
	Mon,  5 Oct 2026 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220707; cv=none; b=PNy/uF8SHagWjYPq4y/IvtUloRmmH7ouBjBXe6reFBq4lK93uEC3h71ZAe/svwkzWtqq6P21lhZFG72kYjwvjVe1z2PiN1FDA5aGJeR0gidBihzypYcu13RathldOBlSYITSsnMC4lqkMF6mcJZADEmVcRAigqPJcT8qD+cCGx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220707; c=relaxed/simple;
	bh=1Iski5pJi2epRY8IPitbKWA0ia/OPSSesGU1u8nTJlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL+b0b2NbepRoLkeN/kEeTsjHl/8GfnCeT/Wndlgmwt6bU0PrFt9ymvSWgUNuHxLsSy2F0/YeJwHKY6XcBUfnd0t+2muuqyucPvdBwhY+fBMFC6XyUtqw+8rnscil82ISoWkCW01A6bGkju9R34ixjJoZJp2CZ5EmwMseHko49Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO0VrkEN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO0VrkEN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767951F00899;
	Mon,  5 Oct 2026 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220705;
	bh=dxaWaVg2k8NRXs9Wki34SQ1KWSiMYa2RQzHwOTQY/XM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mO0VrkEN8fZ2Vp66U8QJmN9ybjB5CXNf5KYDJQvocrJgPxCJQ30BlhZXsHgvD8ALk
	 MWkxdHdRQ+Mn/J+loHnnSz7EqqYxE0ZzRF9Zr9ZYWVoP23Z9RrCkFq+tJ1YYlQJ9Vh
	 JxsRS7UyoinQg7yoncw6JL8Lm3WnjthYM0E9PFd89M/r+ldduRY0rJi2Uodaq4flf0
	 MDGRTxxAG6E51hA6AKkxaP7OEc8b1TUHO8Q5sGP4BmcfMHD13FEIrzgfxD5ZS3nBvj
	 vdNB75x9yHCq614bLkW6BdhQ6gcnQw9GNdTx9wxb0L4XR4GjXanOjd9O2h5N60Wbwu
	 upT2822uAgi5g==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:16 +0200
Subject: [PATCH 46/74] media: qcom: camss: vfe: Add helper methods to
 enumerate output descriptors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-46-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6463; i=bod@kernel.org;
 h=from:subject:message-id; bh=1Iski5pJi2epRY8IPitbKWA0ia/OPSSesGU1u8nTJlk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9shNlMn4HASU2q/dcNMyE6yu8r+5PVF3U/7V
 fl7NlmLSEqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbIQAKCRAicTuzoY3I
 OljfD/wIHzcxUuZCHkyFeUXYQ70Ps+ol4v3ezaggPdYnAIbQ3EMvpFWx+FAGnZsoBMWNztdKZeg
 oVgHyEdVigDCDFyMVHg1HftsqrTIRJNxX3c6oaRqq0IXyOSEfuuyr8tgXprC7wBez0azafF/nfP
 KdtOv8xhCE/JQ5QBDqIsdQyRrBt+4zGRn7oGnE573TQGVTQYJXnE3vNlxxqdhzPWEg8fgIpVwoB
 tVUaVlNFm9ZO1pLRwo3NK+LNzfAD95uiy0BIAjXGeD2kYb6KG6BgvMGh/iXXEwqeGdlFVbwq9mG
 g5mX+chIMdWjXY+s8KCzPDoqdJN6bfzy6mKZwMldnX1ocM7GK5cP4Ypc9k0T/Xi1rvJtWRRNx30
 Z2hW1JOPFfCoaqgOGDxWbwwWB3mW7l4RMQVonDmFqk8YTj10TAgbDeb+ToPOBg5C5IwzotJucRE
 g6/0BJnFRN3rLp/9N4E20egO2tW+perprOjA9GBO9/Gr7czGoQk3SUjnMscqHrtMyJHGB4eWkxJ
 cXr+GgLudmPs3zoWERHwd4tsc5fjcMnGlAodY01Yf5HHo/UXsDI+hn8FH8O7J/CeDuDlImTBMQO
 MGdLOZhMlvaA6LF7Re7A3R/RF3SgoWTl2D8ek2rXnFFSD2udsB9yJwd1WNcMFDRxfEON7oj2M4x
 5CsBnmH17ByAEkw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 50 +++++++++--------------
 drivers/media/platform/qcom/camss/camss-vfe.c     | 49 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h     | 17 ++++++++
 3 files changed, 85 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 9c20bb8d2e45f..88d74323fe276 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -148,47 +148,35 @@ static const struct camss_video_ops vfe_video_ops_780 = {
 	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
-
-static void vfe_add_rdi(struct vfe_line *line, int bus_client, int comp_group)
-{
-	line->output[0].wm_num = 1;
-	line->output[0].wm[0].bus_client = bus_client;
-	line->output[0].wm[0].plane = 0;
-	line->output[0].comp_group = comp_group;
-}
-
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
+	struct vfe_line *pix = &vfe->line[VFE_LINE_PIX];
+
 	vfe->video_ops = vfe_video_ops_780;
 
+	/* RDI lite */
 	if (vfe_is_lite(vfe)) {
-		vfe_add_rdi(&vfe->line[VFE_LINE_RDI0], VFE_LITE_WM_RDI0, VFE_V3_COMP_GRP_1);
-		vfe_add_rdi(&vfe->line[VFE_LINE_RDI1], VFE_LITE_WM_RDI1, VFE_V3_COMP_GRP_2);
-		vfe_add_rdi(&vfe->line[VFE_LINE_RDI2], VFE_LITE_WM_RDI2, VFE_V3_COMP_GRP_3);
-		vfe_add_rdi(&vfe->line[VFE_LINE_PIX], VFE_LITE_WM_RDI3, VFE_V3_COMP_GRP_4);
+		vfe_add_rdi(&vfe->line[VFE_LINE_RDI0].output[0], VFE_LITE_WM_RDI0, VFE_V3_COMP_GRP_1);
+		vfe_add_rdi(&vfe->line[VFE_LINE_RDI1].output[0], VFE_LITE_WM_RDI1, VFE_V3_COMP_GRP_2);
+		vfe_add_rdi(&vfe->line[VFE_LINE_RDI2].output[0], VFE_LITE_WM_RDI2, VFE_V3_COMP_GRP_3);
+		vfe_add_rdi(&pix->output[0], VFE_LITE_WM_RDI3, VFE_V3_COMP_GRP_4);
 		return;
 	}
 
-	/* RDI0 */
-	vfe_add_rdi(&vfe->line[VFE_LINE_RDI0], VFE_WM_RDI0, VFE_V3_COMP_GRP_14);
-
-	/* RDI1 */
-	vfe_add_rdi(&vfe->line[VFE_LINE_RDI1], VFE_WM_RDI1, VFE_V3_COMP_GRP_15);
-
-	/* RDI2 */
-	vfe_add_rdi(&vfe->line[VFE_LINE_RDI2], VFE_WM_RDI2, VFE_V3_COMP_GRP_16);
+	/* RDI */
+	vfe_add_rdi(&vfe->line[VFE_LINE_RDI0].output[0], VFE_WM_RDI0, VFE_V3_COMP_GRP_14);
+	vfe_add_rdi(&vfe->line[VFE_LINE_RDI1].output[0], VFE_WM_RDI1, VFE_V3_COMP_GRP_15);
+	vfe_add_rdi(&vfe->line[VFE_LINE_RDI2].output[0], VFE_WM_RDI2, VFE_V3_COMP_GRP_16);
 
-	/* PIX YUV: FULL Y + C, one plane each, group 0 */
-	vfe->line[VFE_LINE_PIX].is_pix = true;
-	vfe->line[VFE_LINE_PIX].output[0].wm_num = 2;
-	vfe->line[VFE_LINE_PIX].output[0].wm[0].bus_client = VFE_WM_VIDEO_FULL_Y;
-	vfe->line[VFE_LINE_PIX].output[0].wm[0].plane = 0;
-	vfe->line[VFE_LINE_PIX].output[0].wm[1].bus_client = VFE_WM_VIDEO_FULL_C;
-	vfe->line[VFE_LINE_PIX].output[0].wm[1].plane = 1;
-	vfe->line[VFE_LINE_PIX].output[0].comp_group = VFE_V3_COMP_GRP_0;
-	vfe->line[VFE_LINE_PIX].output[0].type = VFE_OUTPUT_TYPE_PIXEL_YUV;
+	/* Add YUV, DS4, DS16, stats and params descriptors */
+	vfe_add_yuv(&pix->output[0], VFE_WM_VIDEO_FULL_Y, VFE_WM_VIDEO_FULL_C, VFE_V3_COMP_GRP_0);
+	vfe_add_ds(&pix->output[1], MSM_VFE_PAD_SRC_DS4, VFE_WM_VIDEO_DS_4, VFE_V3_COMP_GRP_0);
+	vfe_add_ds(&pix->output[2], MSM_VFE_PAD_SRC_DS16, VFE_WM_VIDEO_DS_16, VFE_V3_COMP_GRP_0);
+	vfe_add_stats(&pix->output[3], VFE_WM_STATS_AEC_BHIST, VFE_V3_COMP_GRP_4);
+	vfe_add_params(&pix->output[4], VFE_V3_COMP_GRP_0);
 
-	return;
+	/* PIX mode */
+	vfe_set_pix(pix, 5);
 }
 
 static void vfe_global_reset(struct vfe_device *vfe)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 8726353b52d3d..6ee9b5024447d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2449,3 +2449,52 @@ bool vfe_is_lite(struct vfe_device *vfe)
 {
 	return vfe->camss->res->vfe_res[vfe->id].vfe.is_lite;
 }
+
+void vfe_add_output(struct vfe_output *output, u8 pad, u8 comp_group,
+		    unsigned int wm_num, const u8 *bus_client)
+{
+	unsigned int i;
+
+	output->comp_group = comp_group;
+	output->wm_num = wm_num;
+	for (i = 0; i < wm_num; i++) {
+		output->wm[i].bus_client = bus_client[i];
+		output->wm[i].plane = i;
+	}
+}
+
+void vfe_add_rdi(struct vfe_output *output, u8 bus_client, u8 comp_group)
+{
+	vfe_add_output(output, MSM_VFE_PAD_SRC, comp_group, 1, &bus_client);
+}
+
+void vfe_add_yuv(struct vfe_output *output, u8 bus_client_y,
+		 u8 bus_client_c, u8 comp_group)
+{
+	const u8 wm[] = { bus_client_y, bus_client_c };
+
+	vfe_add_output(output, MSM_VFE_PAD_SRC, comp_group, ARRAY_SIZE(wm), wm);
+}
+
+void vfe_add_ds(struct vfe_output *output, u8 pad, u8 bus_client,
+	       u8 comp_group)
+{
+	vfe_add_output(output, pad, comp_group, 1, &bus_client);
+}
+
+void vfe_add_stats(struct vfe_output *output, u8 bus_client, u8 comp_group)
+{
+	vfe_add_output(output, MSM_VFE_PAD_SRC_STATS, comp_group, 1, &bus_client);
+}
+
+void vfe_add_params(struct vfe_output *output, u8 comp_group)
+{
+	vfe_add_output(output, MSM_VFE_PAD_SINK_PARAMS, comp_group, 0, NULL);
+}
+
+void vfe_set_pix(struct vfe_line *line, int num_outputs)
+{
+	line->num_pads = MSM_VFE_PAD_NUM_PIX;
+	line->num_outputs = num_outputs;
+	line->is_pix = true;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 18403bf46178c..06bdc337f4d83 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -399,4 +399,21 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
  */
 u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift);
 
+void vfe_add_output(struct vfe_output *output, u8 pad, u8 comp_group,
+		    unsigned int wm_num, const u8 *bus_client);
+
+void vfe_add_rdi(struct vfe_output *output, u8 bus_client, u8 comp_group);
+
+void vfe_add_yuv(struct vfe_output *output, u8 bus_client_y,
+		 u8 bus_client_c, u8 comp_group);
+
+void vfe_add_ds(struct vfe_output *output, u8 pad, u8 bus_client,
+		u8 comp_group);
+
+void vfe_add_stats(struct vfe_output *output, u8 bus_client, u8 comp_group);
+
+void vfe_add_params(struct vfe_output *output, u8 comp_group);
+
+void vfe_set_pix(struct vfe_line *line, int num_outputs);
+
 #endif /* QC_MSM_CAMSS_VFE_H */

-- 
2.55.0

