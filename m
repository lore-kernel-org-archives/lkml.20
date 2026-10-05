Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933674D8D92;
	Mon,  5 Oct 2026 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220611; cv=none; b=K2JjbOp+n1oA8NqfS5MgnO5Zx5smhjiCbYgmggo5DnywKAB3KoadyRQnX1jjAfywPQ/z+hOuNoDDQrgXQdRkQcbS10RVpuVzIleTug7vlM/CeJnndpIh8/ho6jpPq8C/Fvu7wBMJ29S/AlziYyRa39BNAwUlI138lBF5DDNMGAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220611; c=relaxed/simple;
	bh=Cuom3BOgEBp0agpKOMFiUCi6YCzYQh4KSG4Q2RYpQJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtbN5SIPYm8TTE9CvGWiNot7sH6vv0/cYhkSZf8vWpCnH4tbs+Cln0b2Sc7GBn5k83wj6FQy4qCwqZLiooHgpEr8W35Q0xP8cZrDqikQH73R7XObY0tP9FqHpxEiMKrgMw8pd5Swh+ny54K/U0vMlu1JcVOapeNhDreNLbG7RnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+Mbd08s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+Mbd08s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB611F00893;
	Mon,  5 Oct 2026 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220609;
	bh=fljHQPgJsHc2i0tS09te61iaZ8/2Jr/wKmtPwY878gY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m+Mbd08sG33c6NTI4YCfTQ1n8jfV88viVB6ml7SiLw/y+pzC4HkZlP071RFi1wEhD
	 t3e8U6FNj6t0WYBtO+uN+MVid5pa3eQ2/MFSe6Oce2Uo+4/6k0ME2Inq0PSqhAiy35
	 pHU6IOUJN4YSGfgb8MEhxELVC/8OUfLCNYJh+klv9eIGm8uLyS20CmOczwZFvXIQT3
	 ySdCyRT2F2Ms6N6jh3eQGl/r8+UJd5uMo5H7gCfrqz/KMT/8mOe1BubV/NuaID39OE
	 6oOXqyC2nODstSB0sLSNx1c1UPJLpdZ5wP4/ZiupHn5xThqPPqmVaDQx38b/P0uKtI
	 NuHyoFWqEriIg==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:49 +0200
Subject: [PATCH 19/74] media: qcom: camss: vfe: Represent output as an
 array instead of a singleton
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-19-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13885; i=bod@kernel.org;
 h=from:subject:message-id; bh=Cuom3BOgEBp0agpKOMFiUCi6YCzYQh4KSG4Q2RYpQJc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sOI9IGm8v8JVuvUvhUwUgBpja0ln4MIx1LB
 GTuv1s55yOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbDgAKCRAicTuzoY3I
 Ol+zEACCzfP4Gz77i39Z4+X20owDzOaV8QBtAMpAob/T3JVHIzHDc0a9GcOKHeoFSGvbM9xqK68
 wDISLquZrGbcVkp9y0Dha9LphLBkM+HNs/8d3h7RWNVMq0dk7DCXOWTNE4v1A8Fu07tlg/3uOw8
 hm7UcLbjjJz0Den/Ij9IuAHXgiK+QPpFOU5rxKppqvCl/6TPIJPbdychKRqZdyHr43lMlkP3Muf
 9kRtxt+3w3k0qeu2QvHyBXOjKmv206fL7Dga8SaPRtD09Uj0QB+pIIZGWKY2hkNCnFunUX4y1On
 pUNlCksWEmAtUiAuOyfiV7nYoO+Zv2SwYUX7d9s9uAuKaP46C9WRPJ6JiAarozGyjTwBuD+bndB
 Wn3ocrUxNI828HU2mh+7/tnryG6/l4SFe+QBErEhepMgwXtWJMnwb7GCtSbTm7gdAMWX1AcRFrs
 IsHVEzTl2rWqL+HhQNLOLRqZioGkI9DQTNGybExeH/PCIVl+epR/Uk8iRevpIA//yN7YTG3O2Wp
 PFj9GyZi/1VUF3+A9tYt3fNi9M2ErcCk3zvoxa9vFGnxcShrqOAwMbiK5/QvuF20QI8sEZDv5HH
 V2/g4F25xWFQAUyiY57+/mViXkzGbv0DBEVdTEzSaOBnX94U80EvwIDWx4cm3OujdPzMBW/05AQ
 sa1GptherqdphkQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

In order to instantiate multiple v4l2 sub-devices off of one "PIX" device
we need to represent more than one output per IFE. Right now the
representation between an IFE line and an output is 1:1. That simple link
works fine for the case of a raw data dump however, for multiple SOURCE and
SINK pads connected to a PIX device, we will require more outputs.

The first low-intervention step is to represent the existing singleton
output as one instance of an array of outputs. Since container_of() won't
work on an array element as input, introduce a line pointer to the output
structure to make that linkage back between output and line.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  |  4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-480.c  |  6 ++---
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c | 16 ++++++-------
 drivers/media/platform/qcom/camss/camss-vfe.c      | 26 +++++++++++++---------
 drivers/media/platform/qcom/camss/camss-vfe.h      |  6 ++++-
 8 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717b3bc..d2dc2acc9d234 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -490,7 +490,7 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	vfe->res->hw_ops->reg_update_clear(vfe, line_id);
 
-	output = &vfe->line[line_id].output;
+	output = &vfe->line[line_id].output[0];
 
 	if (output->wait_reg_update) {
 		output->wait_reg_update = 0;
@@ -521,7 +521,7 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 				    "Received wm done for unmapped index\n");
 		goto out_unlock;
 	}
-	output = &vfe->line[vfe->wm_output_map[wm]].output;
+	output = &vfe->line[vfe->wm_output_map[wm]].output[0];
 
 	ready_buf = output->buf[0];
 	if (!ready_buf) {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 9cf1ccdb2fe7c..a2a91217a3cf8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -475,7 +475,7 @@ static void vfe_bus_disconnect_wm_from_rdi(struct vfe_device *vfe, u8 wm,
 static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 			     u8 enable)
 {
-	struct vfe_line *line = container_of(output, struct vfe_line, output);
+	struct vfe_line *line = output->line;
 	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	unsigned int i;
@@ -555,7 +555,7 @@ static void vfe_enable_irq_wm_line(struct vfe_device *vfe, u8 wm,
 static void vfe_enable_irq_pix_line(struct vfe_device *vfe, u8 comp,
 				    enum vfe_line_id line_id, u8 enable)
 {
-	struct vfe_output *output = &vfe->line[line_id].output;
+	struct vfe_output *output = &vfe->line[line_id].output[0];
 	unsigned int i;
 	u32 irq_en0;
 	u32 irq_en1;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 76729607db02d..2eb4c3d505ebf 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -565,7 +565,7 @@ static void vfe_bus_disconnect_wm_from_rdi(struct vfe_device *vfe, u8 wm,
 static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 			     u8 enable)
 {
-	struct vfe_line *line = container_of(output, struct vfe_line, output);
+	struct vfe_line *line = output->line;
 	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 
@@ -706,7 +706,7 @@ static void vfe_enable_irq_wm_line(struct vfe_device *vfe, u8 wm,
 static void vfe_enable_irq_pix_line(struct vfe_device *vfe, u8 comp,
 				    enum vfe_line_id line_id, u8 enable)
 {
-	struct vfe_output *output = &vfe->line[line_id].output;
+	struct vfe_output *output = &vfe->line[line_id].output[0];
 	unsigned int i;
 	u32 irq_en0;
 	u32 irq_en1;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index b2f7d855d8dd0..3166660d864ec 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -536,7 +536,7 @@ static void vfe_bus_disconnect_wm_from_rdi(struct vfe_device *vfe, u8 wm,
 static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 			     u8 enable)
 {
-	struct vfe_line *line = container_of(output, struct vfe_line, output);
+	struct vfe_line *line = output->line;
 	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 
@@ -678,7 +678,7 @@ static void vfe_enable_irq_wm_line(struct vfe_device *vfe, u8 wm,
 static void vfe_enable_irq_pix_line(struct vfe_device *vfe, u8 comp,
 				    enum vfe_line_id line_id, u8 enable)
 {
-	struct vfe_output *output = &vfe->line[line_id].output;
+	struct vfe_output *output = &vfe->line[line_id].output[0];
 	unsigned int i;
 	u32 irq_en0;
 	u32 irq_en1;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index d73f733fde045..616d80ae1da74 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -164,8 +164,8 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 
 	for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
 		/* Enable IRQ for newly added lines, but also keep already running lines's IRQ */
-		if (vfe->line[i].output.state == VFE_OUTPUT_RESERVED ||
-		    vfe->line[i].output.state == VFE_OUTPUT_ON) {
+		if (vfe->line[i].output[0].state == VFE_OUTPUT_RESERVED ||
+		    vfe->line[i].output[0].state == VFE_OUTPUT_ON) {
 			bus_irq_mask |= BUS_IRQ_MASK_0_RDI_RUP(vfe, i)
 					| BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i));
 			}
@@ -242,7 +242,7 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	vfe_reg_update_clear(vfe, line_id);
 
-	output = &vfe->line[line_id].output;
+	output = &vfe->line[line_id].output[0];
 
 	if (output->wait_reg_update) {
 		output->wait_reg_update = 0;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index d84a375e33187..3e3d103e0d09d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -36,7 +36,7 @@ int vfe_gen1_halt(struct vfe_device *vfe)
 static int vfe_disable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
+	struct vfe_output *output = &line->output[0];
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	unsigned long flags;
 	unsigned long time;
@@ -162,13 +162,13 @@ static void vfe_output_frame_drop(struct vfe_device *vfe,
 		vfe->ops_gen1->wm_set_framedrop_pattern(vfe, output->wm_idx[i], drop_pattern);
 	}
 
-	vfe->res->hw_ops->reg_update(vfe, container_of(output, struct vfe_line, output)->id);
+	vfe->res->hw_ops->reg_update(vfe, output->line->id);
 }
 
 static int vfe_enable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
+	struct vfe_output *output = &line->output[0];
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	struct media_pad *sensor_pad;
 	unsigned long flags;
@@ -289,7 +289,7 @@ static int vfe_get_output(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
-	output = &line->output;
+	output = &line->output[0];
 	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is running\n");
 		goto error;
@@ -526,7 +526,7 @@ static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
 	unsigned long flags;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
-	output = &vfe->line[line_id].output;
+	output = &vfe->line[line_id].output[0];
 	if (output->gen1.wait_sof) {
 		output->gen1.wait_sof = 0;
 		complete(&output->sof);
@@ -548,7 +548,7 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	vfe->res->hw_ops->reg_update_clear(vfe, line_id);
 
-	output = &line->output;
+	output = &line->output[0];
 
 	if (output->wait_reg_update) {
 		output->wait_reg_update = 0;
@@ -625,7 +625,7 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 				    "Received wm done for unmapped index\n");
 		goto out_unlock;
 	}
-	output = &vfe->line[vfe->wm_output_map[wm]].output;
+	output = &vfe->line[vfe->wm_output_map[wm]].output[0];
 
 	if (output->gen1.active_buf == active_index && 0) {
 		dev_err_ratelimited(vfe->camss->dev,
@@ -693,7 +693,7 @@ static int vfe_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
 	struct vfe_output *output;
 	unsigned long flags;
 
-	output = &line->output;
+	output = &line->output[0];
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c95fe5b0b05fc..54ab906b01a82 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -604,7 +604,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 				    "Received wm done for unmapped index\n");
 		goto out_unlock;
 	}
-	output = &vfe->line[vfe->wm_output_map[wm]].output;
+	output = &vfe->line[vfe->wm_output_map[wm]].output[0];
 
 	ready_buf = output->buf[0];
 	if (!ready_buf) {
@@ -645,7 +645,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 int vfe_enable_output_v2(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
+	struct vfe_output *output = &line->output[0];
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	struct media_pad *sensor_pad;
 	unsigned long flags;
@@ -719,7 +719,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 	struct vfe_output *output;
 	unsigned long flags;
 
-	output = &line->output;
+	output = &line->output[0];
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -798,7 +798,7 @@ int vfe_get_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
-	output = &line->output;
+	output = &line->output[0];
 	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev, "Output is running\n");
 		goto error;
@@ -849,7 +849,7 @@ static void vfe_init_outputs(struct vfe_device *vfe)
 	int i;
 
 	for (i = 0; i < vfe->res->line_num; i++) {
-		struct vfe_output *output = &vfe->line[i].output;
+		struct vfe_output *output = &vfe->line[i].output[0];
 
 		output->state = VFE_OUTPUT_OFF;
 		output->buf[0] = NULL;
@@ -933,7 +933,7 @@ static void vfe_buf_flush_pending(struct vfe_output *output,
 int vfe_put_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
+	struct vfe_output *output = &line->output[0];
 	unsigned long flags;
 	unsigned int i;
 
@@ -951,7 +951,7 @@ int vfe_put_output(struct vfe_line *line)
 static int vfe_disable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
+	struct vfe_output *output = &line->output[0];
 	unsigned long flags;
 	unsigned int i;
 
@@ -1325,7 +1325,7 @@ int vfe_flush_buffers(struct camss_video *vid,
 	struct vfe_output *output;
 	unsigned long flags;
 
-	output = &line->output;
+	output = &line->output[0];
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -1387,7 +1387,7 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
-		line->output.state = VFE_OUTPUT_RESERVED;
+		line->output[0].state = VFE_OUTPUT_RESERVED;
 		ret = vfe->res->hw_ops->vfe_enable(line);
 		if (ret < 0)
 			dev_err(vfe->camss->dev,
@@ -2055,8 +2055,12 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		l->video_out.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		l->video_out.camss = camss;
 		l->id = i;
-		init_completion(&l->output.sof);
-		init_completion(&l->output.reg_update);
+
+		l->num_outputs = 1;
+		l->output[0].line = l;
+
+		init_completion(&l->output[0].sof);
+		init_completion(&l->output[0].reg_update);
 
 		if (i == VFE_LINE_PIX) {
 			l->nformats = res->vfe.formats_pix->nformats;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 98d403a71cf95..e043ef4468626 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -22,6 +22,7 @@
 #define MSM_VFE_PAD_SINK 0
 #define MSM_VFE_PAD_SRC 1
 #define MSM_VFE_PADS_NUM 2
+#define MSM_VFE_NUM_OUTPUTS 1
 
 #define MSM_VFE_IMAGE_MASTERS_NUM 7
 #define MSM_VFE_COMPOSITE_IRQ_NUM 4
@@ -102,6 +103,8 @@ struct vfe_output {
 	int wait_reg_update;
 	struct completion sof;
 	struct completion reg_update;
+
+	struct vfe_line *line;
 };
 
 struct vfe_line {
@@ -112,7 +115,8 @@ struct vfe_line {
 	struct v4l2_rect compose;
 	struct v4l2_rect crop;
 	struct camss_video video_out;
-	struct vfe_output output;
+	struct vfe_output output[MSM_VFE_NUM_OUTPUTS];
+	u32 num_outputs;
 	const struct camss_format_info *formats;
 	unsigned int nformats;
 };

-- 
2.55.0

