Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF145326B9;
	Mon,  5 Oct 2026 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220778; cv=none; b=duOpRMidvA8bAW4xjzTXutk3IlyC25F+Ey3m6YzJ1pYdKLiQUGTRNG1c/U2Y9Od/aTUapID7t5dwhNSH1tvctwqo9oKupy3iaPX2tz6m1qizLJaLcd7Mgdm5GgkfFkG3ifBG7f4cr/cPcKcx7rvOVsdlhXGfyEi4IhQ4nEISopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220778; c=relaxed/simple;
	bh=ZAeMUJY7Vv7SXGpaZsq8fdqhNXs1ifXVraeALel9kuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJvNFDdxo0mPqp6OwwdXBj7WGF2FHVAH9b5lrKMLKinojQt9JLu5+WjrH+frm8h/MDO6S7OS/1yWYMlZA3+aSVZqXk4Y8jMoueFIt23V9FNLd+beVSvXM6xoK+LtZPQKlwBdk6LOPhV/f5f/FREGDMaRAj0tJRYNwGxERveJWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3UY1Cy8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3UY1Cy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99ED21F00893;
	Mon,  5 Oct 2026 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220775;
	bh=OilB7lfVHBmuQruzCX2aH+dgjcoar56Y9kebuxabgfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M3UY1Cy802SsTdANgyDcVdxT0tumZv8oLFmZl5oJc7PYKLAOnwFbtMFl4YjMbv0By
	 wuFTvyZ83PjP+mEJVJm26XT3PC3r5qhE93sqYGtEBnanvfXPHG/KtjtFErrUvd9o8o
	 Wh6K1lwUhM0sECmfDfG5uMV/cghZzNMh8LEDZKXWZPc3RormXGSArBGpUoRcF4kMQ0
	 2QkYbsBPEJXVbMJPZx+KZRhYk68Sg7hQ5CUQeljmewWFefjKU25CpeyQzORRlnYUqO
	 xsZzC8Qq/4HEL5MgVNUY8x0pNetZPlkCAsacW3Q6pi65Dt3clVC9BuwS48UlF+0oEi
	 ulJGLezhP8NPg==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:36 +0200
Subject: [PATCH 66/74] media: qcom: camss: vfe-780: Produce the AEC Bayer
 histogram statistics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-66-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9578; i=bod@kernel.org;
 h=from:subject:message-id; bh=VKtoAnubVl0uH2M7kAilsVWYm/9TxFlIY0PyQS5toLU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9swECxtkj4oN0qPNVGnXXADrc3VYrXyQ6gNI
 dJaOCv+Tq6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbMAAKCRAicTuzoY3I
 OhNGD/9FBNnfsIPNArQeC3tEYD6k6RYwNKuBklaLShl69Nybvu//tQOkb3d4LmRVJDTzodo79tz
 +LTk3BVzrHyphFFSGg28csBR6xG+IlyDKhnh9IbH4Xk3pQrqdvirPOpOamLjBWUu7goNj91RMWi
 f9hihCEVJ30urcerBun5uRK8hvX2193SwR10ezPmGDq0LuMzvL7KpbPjYrJYYbmE8pBkUA7Y+4G
 EvJLHCHnJAvzrfz8x4idxVULgc8Lxa6lohOMHzr8EvO6n0wtoQEMXc6XOW0E5YQAUIrVMQHWe7n
 xD3Sf/iETYHLipm7xoyWl9Zx+j9u5+XXh49S/g67su1xXFEKZP+useNhNhPyjMejsH8ryV56B6Q
 0BB1d1Bb0BTtOQwBMhSwuXiKLOJzsgtHu2IeToPVnEhEIGQ52o0Sx+fjvFjrvpgHq7okPXptHMf
 XoJQ+9SOo67HBrUQlsvs4ks+oshPujztAHPfnmP9evrQ99R4Mwtc7ijpunkK6Ps0b2pC5nSKb5x
 XCluSLdQvYki/Ip+HAOgIVcuDLvapSPbeODk7nnUbb6iU47V0a6zsfjnnKH0z6koqbrb64XpWJf
 xVBxmWTogH4IVEmdml64DhU/svJhTxMS81an4Ht1XQTlgEchzcnTMZeDryHRMkH1ExnUl69Fv3P
 9Xk/KZ3ZgeE3RFQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Stream the AEC Bayer histogram on the pixel line's statistics node, as
the V4L2_META_FMT_QCOM_ISP_STATS block CAMSS_STATS_AEC_BHIST.

The AEC BHIST write master is frame based, PLAIN64, in completion group
4. Write master addresses are 256 byte aligned and the v4l2-isp block
payloads are not, so the write master fills a kernel buffer and the
completion of group 4 serialises it into the next queued statistics
buffer with v4l2_isp_stats_init_buffer() and
v4l2_isp_stats_init_block(). The copy runs a frame before the write
master writes the kernel buffer again.

As with image buffers, each frame consumes one programmed write master
address, so the write master is handed the kernel buffer once per queued
statistics buffer. Without a queued buffer it has no address and the
frame's statistics are dropped; the sequence numbers show the gap.

The statistics output runs when msm_vfeN_stats is streaming as the
image node starts. The node may stop and start again while the line
runs: vfe_flush_buffers() now forgets the buffers it returns.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 64 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c     | 68 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h     |  9 +++
 3 files changed, 141 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 1d00a3656d7c3..7642d9d4500de 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -114,8 +114,49 @@ static void vfe_wm_start_pix(struct vfe_device *vfe, struct vfe_line *line)
 	}
 }
 
+static struct vfe_output *vfe_stats_output(struct vfe_line *line, u8 wm)
+{
+	unsigned int o;
+
+	if (!line->is_pix)
+		return NULL;
+
+	for (o = 1; o < line->num_outputs; o++)
+		if (line->output[o].pad == MSM_VFE_PAD_SRC_STATS &&
+		    line->output[o].wm_num &&
+		    line->output[o].wm[0].bus_client == wm)
+			return &line->output[o];
+
+	return NULL;
+}
+
+/* Statistics write masters are frame based and fill the output's kernel buffer */
+static void vfe_wm_start_stats(struct vfe_device *vfe, struct vfe_output *output)
+{
+	u8 wm = output->wm[0].bus_client;
+
+	writel(0, vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel(0, vfe->base + VFE_BUS_WM_IMAGE_CFG_1(wm));
+	writel(1, vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel(VFE_BUS_WM_PACKER_FMT_V3_PLAIN_64,
+	       vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* no dropped frames, one irq per frame */
+	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
+	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
+
+	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
+	struct vfe_output *stats = vfe_stats_output(line, wm);
+
 	struct v4l2_pix_format_mplane *pix =
 		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 
@@ -126,6 +167,11 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
 
+	if (stats) {
+		vfe_wm_start_stats(vfe, stats);
+		return;
+	}
+
 	if (line->is_pix) {
 		vfe_wm_start_pix(vfe, line);
 		return;
@@ -157,6 +203,11 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	struct vfe_output *output = &line->output[0];
 	unsigned int i;
 
+	if (vfe_stats_output(line, wm)) {
+		writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
+		return;
+	}
+
 	for (i = 0; i < output->wm_num; i++)
 		writel(0, vfe->base + VFE_BUS_WM_CFG(output->wm[i].bus_client));
 }
@@ -165,8 +216,19 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *bu
 			  struct vfe_line *line)
 {
 	struct vfe_output *output = &line->output[0];
+	struct vfe_output *stats;
 	unsigned int i;
 
+	/*
+	 * Each frame consumes one programmed address, as for images: hand the
+	 * write master the output's kernel buffer once per queued buffer.
+	 */
+	stats = vfe_stats_output(line, wm);
+	if (stats) {
+		writel(stats->dma_addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+		return;
+	}
+
 	/* camss-video sets addr[1] = addr[0] + bytesperline * height for NV12 */
 	for (i = 0; i < output->wm_num; i++) {
 		u32 addr = buffer->addr[output->wm[i].plane];
@@ -237,6 +299,8 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 	vfe_add_ds(&pix->output[1], MSM_VFE_PAD_SRC_DS4, VFE_WM_VIDEO_DS_4, VFE_V3_COMP_GRP_0);
 	vfe_add_ds(&pix->output[2], MSM_VFE_PAD_SRC_DS16, VFE_WM_VIDEO_DS_16, VFE_V3_COMP_GRP_0);
 	vfe_add_stats(&pix->output[3], VFE_WM_STATS_AEC_BHIST, VFE_V3_COMP_GRP_4);
+	if (vfe_alloc_stats(vfe, &pix->output[3]))
+		pix->output[3].wm_num = 0;	/* no statistics without their buffer */
 	vfe_add_params(&pix->output[4], VFE_V3_COMP_GRP_0);
 
 	/* PIX mode */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b90b538c1aaaf..1522f1046d8dd 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -623,6 +623,63 @@ u32 vfe_hw_version(struct vfe_device *vfe)
  * @vfe: VFE Device
  * @wm: Write master id
  */
+static const struct v4l2_isp_stats_block_type_info vfe_stats_block_info[] = {
+	[CAMSS_STATS_AEC_BHIST] = { .size = sizeof(struct camss_stats_bhist) },
+};
+
+/*
+ * vfe_alloc_stats - Allocate the write master target of a statistics output
+ * @vfe: VFE device
+ * @output: statistics output
+ *
+ * Write master addresses are 256 byte aligned and the v4l2-isp block payloads
+ * are not, so statistics are written to a kernel buffer and copied into the
+ * userspace buffer when their completion group fires.
+ *
+ * Return 0 on success or -ENOMEM
+ */
+int vfe_alloc_stats(struct vfe_device *vfe, struct vfe_output *output)
+{
+	output->dma_size = sizeof_field(struct camss_stats_bhist, bins);
+	output->dma_vaddr = dmam_alloc_coherent(vfe->camss->dev,
+						output->dma_size,
+						&output->dma_addr, GFP_KERNEL);
+
+	return output->dma_vaddr ? 0 : -ENOMEM;
+}
+
+/*
+ * vfe_stats_fill - Serialise a frame's statistics into a userspace buffer
+ * @vfe: VFE device
+ * @output: statistics output
+ * @buf: buffer to fill
+ *
+ * Runs from the completion of the statistics group, a frame before the write
+ * master writes the kernel buffer again.
+ */
+static void vfe_stats_fill(struct vfe_device *vfe, struct vfe_output *output,
+			   struct camss_buffer *buf)
+{
+	struct v4l2_isp_buffer *stats = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	struct v4l2_isp_block_header *block;
+	struct camss_stats_bhist *bhist;
+
+	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
+
+	block = v4l2_isp_stats_init_block(vfe->camss->dev, stats,
+					  vfe_stats_block_info,
+					  ARRAY_SIZE(vfe_stats_block_info),
+					  CAMSS_STATS_AEC_BHIST,
+					  CAMSS_STATS_MAX_PAYLOAD);
+	if (!IS_ERR(block)) {
+		bhist = container_of(block, struct camss_stats_bhist, header);
+		memcpy(bhist->bins, output->dma_vaddr, sizeof(bhist->bins));
+	}
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0,
+			      v4l2_isp_buffer_size(stats->data_size));
+}
+
 /*
  * vfe_output_done - Retire the filled buffer of one output
  * @vfe: VFE device
@@ -657,6 +714,9 @@ static struct camss_buffer *vfe_output_done(struct vfe_device *vfe,
 	ready_buf->vb.vb2_buf.timestamp = ts;
 	ready_buf->vb.sequence = output->sequence++;
 
+	if (output->pad == MSM_VFE_PAD_SRC_STATS)
+		vfe_stats_fill(vfe, output, ready_buf);
+
 	index = 0;
 	output->buf[0] = output->buf[1];
 	if (output->buf[0])
@@ -1487,6 +1547,14 @@ int vfe_flush_buffers(struct camss_video *vid,
 	if (output->buf[1])
 		vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
 
+	/*
+	 * A metadata node stops while its line runs: forget the returned
+	 * buffers so a later completion does not return them again.
+	 */
+	output->buf[0] = NULL;
+	output->buf[1] = NULL;
+	output->gen2.active_num = 0;
+
 	if (output->last_buffer) {
 		vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);
 		output->last_buffer = NULL;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 11cded2b345eb..0b2634f1e4d6a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -143,6 +143,14 @@ struct vfe_output {
 
 	struct vfe_line *line;
 	struct camss_video video_out;
+
+	/*
+	 * Kernel buffer the write masters fill, for outputs the CPU copies
+	 * to userspace at completion (statistics)
+	 */
+	void *dma_vaddr;
+	dma_addr_t dma_addr;
+	size_t dma_size;
 };
 
 struct vfe_line {
@@ -422,6 +430,7 @@ void vfe_add_ds(struct vfe_output *output, u8 pad, u8 bus_client,
 		u8 comp_group);
 
 void vfe_add_stats(struct vfe_output *output, u8 bus_client, u8 comp_group);
+int vfe_alloc_stats(struct vfe_device *vfe, struct vfe_output *output);
 
 void vfe_add_params(struct vfe_output *output, u8 comp_group);
 

-- 
2.55.0

