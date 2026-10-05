Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF754D9542;
	Mon,  5 Oct 2026 17:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220615; cv=none; b=DZ5V1v0JOp2LYX1Md8ZiYeLMqIJA6hal6v8yRhwfq6zqVUg2HKk2JMc2FEtqnF3wrAzaKrsvOYVGn2wMdLtjL1rX7cPCyXpKJGWDr+qJFbo8FCco2osCtcRSFwyhK1QsST4xxtn9QDfyR6pBhasrWOX2R5fLf0SanxF+Y3mDck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220615; c=relaxed/simple;
	bh=8tE/VrSYseq1rYuBIbNmyYqUqa/PPxg1KS78abVx2Uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHAmNF9WUi0Yu3TTqbV3d11dB3yE+VS5nzZsiMdzDqQoDUj5sLXRIZ+ItfLNe2LugJSyBRRLEEaDiLeBVI2cA2q/Ks4WLDshqVjyTPdBndIsvv2vWV4XnPqZVIjuKXgxQksGZEiRlnMQm4VGXf7zjgOiSvLGRWYPEsPQSGNdlqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGDmw/WM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGDmw/WM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26EE1F000FF;
	Mon,  5 Oct 2026 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220613;
	bh=IYq3aZblsL+IEQB02Wc/GznQOyWSkQDG2qUoH13L2Tk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oGDmw/WM2mMeKedE9zmZ+YLDZZtpabPnviKHv0DIuoj2ukGAfLUNQ5aQbUG2XKoRa
	 0yKsjtkbkLkwoUQPRfuo/omuCHSDRLe7w1nvag5iaBsyiSvdrJAM8t+tFdmOi0iXfL
	 zYzBaRwyaKEzv1ldqEK7KVXXSzd7G442MyeH45KKiSfGlpV8v/WxI2A4E0wh4gMXLl
	 N59axHlgRAciEj7WQVu0Fpusy2dQuFFe9Y8WzQ3WxVlXd+9LDXB1O0eUpuP/f2PWUk
	 /wV4ka5+f0fc4P5Yml2eUiH0AkYPvUothtPZi1B2bug1b2wFlXT/Oio6LR8JtTZZgf
	 LA4lIHCFNl0lg==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:50 +0200
Subject: [PATCH 20/74] media: qcom: camss: vfe: Move video_out from
 vfe_line to vfe_output
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-20-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15016; i=bod@kernel.org;
 h=from:subject:message-id; bh=8tE/VrSYseq1rYuBIbNmyYqUqa/PPxg1KS78abVx2Uc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sOLD1TlDGV4J0XUgevZsLx43pANnOLdtO47
 YAtEl3uJq2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbDgAKCRAicTuzoY3I
 Oi3MD/0alLrqJYtgh21wttBVvutMsEBpLtYMU6U5WMdBU/OPi1UbxhV89mlbYKIq68MH/zkBXK5
 JvcpLm00vYu6k5Zv/xY6JEt73CWwU7r5/1RVt+SXeIOTQCkKJIfPqx/XW0SqXjJ3fCaztn/txiC
 WVyN+dswqSAjS6PD4cw7ra2cRrszd/K1Y2nWrsGkC9FH+Hw4M4i5j91Cg9zEsBx7pwSi2rJOJ1g
 xiT96OdJ291yxTn/enG/iD4R6FTfC0hkMqxCkODlaHebwRN9fDuHzV67uhHxax8u5IyWGYrmgVM
 751FbR1ClYt0hASTcDuFR7bt9SxmHqDCTUWPsivWADcWiEdNwgnfEThXO1da7Ikd9CNrh1fuaVs
 6AZrnSUFM3kDd/fTMdxcK0+zwfCssEFQj6OJXZWykYC4hDuR8p1DGX2CsKRiOhg6k53/Qif3QXS
 NHAyCFn5Vm9ResDSZA4/pgudO0FZkCpzq8p7JmszgefU9/ZSdD4D3We475+nHe/GHY0BWN4YrdW
 ZKCYRCzxLLpJN4IZH9W6TlKWxqQQWG6DVgU7ckXyH3rl6lSiPrUG7OoFxMmWp7xPIuj6ylFJKAL
 +kQJDwZqq1xRAk53aY6IaSsOrH5UtV4awQ9sEOiZxN2CemBvlbdpHWcBZ80G/w4CHFQL2VysQEI
 NJQihu9khyzuSzg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

In preparation for having multiple source/sink pads on VFE PIX nodes, move
the video_out structure to vfe_output.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe-340.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  6 +++---
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |  8 ++++----
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  |  8 ++++----
 drivers/media/platform/qcom/camss/camss-vfe-480.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe-680.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe-690.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe-780.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c | 10 ++++------
 drivers/media/platform/qcom/camss/camss-vfe.c      | 22 +++++++++-------------
 drivers/media/platform/qcom/camss/camss-vfe.h      |  2 +-
 12 files changed, 31 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index d2dc2acc9d234..d9e37cf609823 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -257,7 +257,7 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
-		&line->video_out.active_fmt.fmt.pix_mp;
+		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
 
 	writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2526d568686db..6edbfcf766dad 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -282,7 +282,7 @@ static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
 
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
-	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pix = &line->output[0].video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
 	u8 client = tfe_wm_client_map[wm];
 	u32 cfg = TFE_BUS_CLIENT_CFG_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index a2a91217a3cf8..ccc065924b6b6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -476,7 +476,7 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 			     u8 enable)
 {
 	struct vfe_line *line = output->line;
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	unsigned int i;
 
@@ -631,7 +631,7 @@ static void vfe_set_demux_cfg(struct vfe_device *vfe, struct vfe_line *line)
 
 static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	u16 input, output;
 	u8 interp_reso;
@@ -686,7 +686,7 @@ static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 
 static void vfe_set_crop_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	u16 first, last;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 2eb4c3d505ebf..1f02adb79f921 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -566,7 +566,7 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 			     u8 enable)
 {
 	struct vfe_line *line = output->line;
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 
 	switch (p) {
@@ -635,7 +635,7 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 static void vfe_set_realign_cfg(struct vfe_device *vfe, struct vfe_line *line,
 				u8 enable)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 val = VFE_0_MODULE_ZOOM_EN_REALIGN_BUF;
 
 	if (p != V4L2_PIX_FMT_YUYV && p != V4L2_PIX_FMT_YVYU &&
@@ -782,7 +782,7 @@ static void vfe_set_demux_cfg(struct vfe_device *vfe, struct vfe_line *line)
 
 static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	u16 input, output;
 	u8 interp_reso;
@@ -837,7 +837,7 @@ static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 
 static void vfe_set_crop_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	u16 first, last;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 3166660d864ec..577d1ddfe84b4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -537,7 +537,7 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 			     u8 enable)
 {
 	struct vfe_line *line = output->line;
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 
 	switch (p) {
@@ -606,7 +606,7 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 static void vfe_set_realign_cfg(struct vfe_device *vfe, struct vfe_line *line,
 				u8 enable)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 val = VFE_0_MODULE_ZOOM_EN_REALIGN_BUF;
 
 	if (p != V4L2_PIX_FMT_YUYV && p != V4L2_PIX_FMT_YVYU &&
@@ -753,7 +753,7 @@ static void vfe_set_demux_cfg(struct vfe_device *vfe, struct vfe_line *line)
 
 static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	u16 input, output;
 	u8 interp_reso;
@@ -808,7 +808,7 @@ static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 
 static void vfe_set_crop_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
-	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 p = line->output[0].video_out.active_fmt.fmt.pix_mp.pixelformat;
 	u32 reg;
 	u16 first, last;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 616d80ae1da74..73bfb53266c3e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -99,7 +99,7 @@ static void vfe_global_reset(struct vfe_device *vfe)
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
-		&line->video_out.active_fmt.fmt.pix_mp;
+		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 
 	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
index 99036e7c1e763..c002ff126135a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-680.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -155,7 +155,7 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
 static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
-		&line->video_out.active_fmt.fmt.pix_mp;
+		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
 	u32 cfg;
 	u8 wm;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
index 6f90134d5ed64..88dc902dd30dd 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-690.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
@@ -56,7 +56,7 @@
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
-		&line->video_out.active_fmt.fmt.pix_mp;
+		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 
 	wm = RDI_WM(wm);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 4adbd0680898f..a4a2beb0c38b7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -52,7 +52,7 @@
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
-		&line->video_out.active_fmt.fmt.pix_mp;
+		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 
 	wm = RDI_WM(wm);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index 3e3d103e0d09d..ac4c4fd261b33 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -255,7 +255,7 @@ static int vfe_enable_output(struct vfe_line *line)
 			vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[i],
 						     (ub_size + 1) * output->wm_idx[i], ub_size);
 			vfe->ops_gen1->wm_line_based(vfe, output->wm_idx[i],
-						     &line->video_out.active_fmt.fmt.pix_mp, i, 1);
+						     &line->output[0].video_out.active_fmt.fmt.pix_mp, i, 1);
 			vfe->ops_gen1->wm_enable(vfe, output->wm_idx[i], 1);
 			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
 		}
@@ -282,7 +282,7 @@ static int vfe_get_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output;
-	struct v4l2_format *f = &line->video_out.active_fmt;
+	struct v4l2_format *f = &line->output[0].video_out.active_fmt;
 	unsigned long flags;
 	int i;
 	int wm_idx;
@@ -688,13 +688,11 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
  */
 static int vfe_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
 {
-	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
+	struct vfe_output *output = container_of(vid, struct vfe_output, video_out);
+	struct vfe_line *line = output->line;
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
 	unsigned long flags;
 
-	output = &line->output[0];
-
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	vfe_buf_update_wm_on_new(vfe, output, buf, line);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 54ab906b01a82..18f66bea5e3b1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -713,14 +713,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
 int vfe_queue_buffer_v2(struct camss_video *vid,
 			struct camss_buffer *buf)
 {
-	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
+	struct vfe_output *output = container_of(vid, struct vfe_output, video_out);
+	struct vfe_line *line = output->line;
 	struct vfe_device *vfe = to_vfe(line);
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct vfe_output *output;
 	unsigned long flags;
 
-	output = &line->output[0];
-
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	if (output->state == VFE_OUTPUT_ON &&
@@ -1320,13 +1318,11 @@ void vfe_put(struct vfe_device *vfe)
 int vfe_flush_buffers(struct camss_video *vid,
 		      enum vb2_buffer_state state)
 {
-	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
+	struct vfe_output *output = container_of(vid, struct vfe_output, video_out);
+	struct vfe_line *line = output->line;
 	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
 	unsigned long flags;
 
-	output = &line->output[0];
-
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	vfe_buf_flush_pending(output, state);
@@ -2052,8 +2048,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
 		struct vfe_line *l = &vfe->line[i];
 
-		l->video_out.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-		l->video_out.camss = camss;
+		l->output[0].video_out.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+		l->output[0].video_out.camss = camss;
 		l->id = i;
 
 		l->num_outputs = 1;
@@ -2212,7 +2208,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		sd = &vfe->line[i].subdev;
 		pads = vfe->line[i].pads;
-		video_out = &vfe->line[i].video_out;
+		video_out = &vfe->line[i].output[0].video_out;
 
 		v4l2_subdev_init(sd, &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
@@ -2297,7 +2293,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 error_init:
 	for (i--; i >= 0; i--) {
 		sd = &vfe->line[i].subdev;
-		video_out = &vfe->line[i].video_out;
+		video_out = &vfe->line[i].output[0].video_out;
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
@@ -2320,7 +2316,7 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 
 	for (i = 0; i < vfe->res->line_num; i++) {
 		struct v4l2_subdev *sd = &vfe->line[i].subdev;
-		struct camss_video *video_out = &vfe->line[i].video_out;
+		struct camss_video *video_out = &vfe->line[i].output[0].video_out;
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index e043ef4468626..42ac030d339b0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -105,6 +105,7 @@ struct vfe_output {
 	struct completion reg_update;
 
 	struct vfe_line *line;
+	struct camss_video video_out;
 };
 
 struct vfe_line {
@@ -114,7 +115,6 @@ struct vfe_line {
 	struct v4l2_mbus_framefmt fmt[MSM_VFE_PADS_NUM];
 	struct v4l2_rect compose;
 	struct v4l2_rect crop;
-	struct camss_video video_out;
 	struct vfe_output output[MSM_VFE_NUM_OUTPUTS];
 	u32 num_outputs;
 	const struct camss_format_info *formats;

-- 
2.55.0

