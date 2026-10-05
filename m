Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3F4D5983;
	Mon,  5 Oct 2026 17:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220726; cv=none; b=i7u0j56wKIkdWMiTntpTNklVbaK0EzOH5wlT0WJgw2oaJ7fVKN7LBeJrxyfoHcs14S27zL7qY4YAcOrNemuQFFM2ZFRQTiOdepjToctD3MAqxdyv5AZOHc18ZB2L8ZEfnwknDTDXAW5WHYtEYiadeCmncDJe9xZtprpP3pXnAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220726; c=relaxed/simple;
	bh=eEx4ZayQDnxGFg69fImu7l+5ALHFOFuZ7T2UwtQKIQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrM0QgK0hZOkPMCJnZCoSTjGoIiMWXR0hzdCxku+913WA2K1BsQQ2f1bf2Tucz+NzQfhPQ73rVL5hcQO+hsCnUkpif6We8+c/AbD3l/1fgAa0uUSkWkywM0L32DZECz/2CMusxtcEcG8JkfBS3I9NuAzglPtBXZ6+C1P1gI65yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZIqYSCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZIqYSCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF301F00899;
	Mon,  5 Oct 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220722;
	bh=KMR1alMBbC6rdV1jL4YTxPV7dBXmHlXqdqHq4ZttuZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DZIqYSCiRjHCCAOQE5jidAwvoHeo/jQj0c04Hvl02f5xzvtZp8wpQ73iHGv5oA4le
	 Oy+klKbfvuKwrBNH0dCEowwyzl4+8ut5KBMD4Dv+e0ogeO0vwBG19skRx+aK5L3Vhu
	 dg8phZvg0fXeH7diP7FOEh0aYxxd4cqNmngMAlMJoOA321Hxw0QGNnnA7hm3528XDQ
	 fmVjc5U5vD5vptI4BtgDhEMBGNxkeQLE6/duRHrPWOdmUcr7bJef9fpUDy1XQizayn
	 EY69EVyG13ONWUwMmBdD2ajywpb0jJjSlcLGlEo76YZu83lAnYDezS2CCaAq4lgx3V
	 lc5E4ghrKTQSw==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:21 +0200
Subject: [PATCH 51/74] media: qcom: camss: vfe: Pass the buffer to
 vfe_wm_update()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-51-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7932; i=bod@kernel.org;
 h=from:subject:message-id; bh=AfM3XyhCG387zTBcoOaSgl0Pd+s8U3J9Ble6CGxqP2I=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9slvFCqzJvxVDDmq6wt+PVEfOPkgJ4C8jXT1
 mHh7vTlzteJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbJQAKCRAicTuzoY3I
 OpESD/9+BH+I1L1mNocbbApDBpethFhxD0EaibXi1gI5R0o2Xx7uPJnrRidPUhJJeNAuG1Nkud3
 wLT7uTB1j7f9ddfRZ3fMoZ3sUdiBP3IIsMrcMa54d24G0OD8vH8tMn+3PhOJovJxOCGSsxTfyX0
 QkJtT+rgT/DR8Z5eekHo3BScw9gnSCd/imbPB4ZrCXWodbIMcHR/4uQrimqwkBaxERD/62cIcCi
 hgl/UisnFz6v2Y/YEXcvNP1p9aKYTQk0OGtUHtz1YJr2LWmJ4uFLA7sI4VBRGFTl96kvxjdgGwe
 xmnguUwT7+5e7PIPEPCbPhRgD1xalATo+t8hIqF/Hv9Jd4yT+j3Zgdr5JUVSRikHwYQAEZFqkyY
 zmqJhZJCCKwvl1g9jq6xGeSPBBcH2Uk+sgOgrqXDygaAh4RfJ84gmeEd9JnAGSw6X3LjADx5TMf
 IeV0rtKgDx89U5uORES++v9DNMTAMOXShSGTvCOcHX+ikF/skKitynROMlU+wumI5tfVLI0Dbvc
 ko0RHptexa2ZWJ18JhXTncMhnV0BpsyXAr8BUg8CcKPJh+O7VLXB3E7bH6NjdsZYTW6CJgJUBFQ
 RHSbj6YBYXsOtZS1xEE3HVIeCsLYtacEzxDc67gLnMFFPr1b0Osh9cYM7rmLEkCxMMS5+pO14tV
 w3akxXSf1Xe7P/A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

A write master of a multi-planar output needs the address of its own
plane. Pass the struct camss_buffer to the vfe_wm_update() hw op instead
of its first address; every existing backend still programs addr[0].

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 +++--
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 3 ++-
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 3 ++-
 drivers/media/platform/qcom/camss/camss-vfe-680.c | 5 +++--
 drivers/media/platform/qcom/camss/camss-vfe-690.c | 4 +++-
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 4 +++-
 drivers/media/platform/qcom/camss/camss-vfe.c     | 6 +++---
 drivers/media/platform/qcom/camss/camss-vfe.h     | 2 +-
 8 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 52812d34530d6..a2d336e7f7aa9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -253,12 +253,13 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			  struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
 		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
+	u32 addr = buffer->addr[0];
 
 	writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 	writel_relaxed(stride * pix->height, vfe->base + VFE_BUS_WM_FRAME_INC(wm));
@@ -541,7 +542,7 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	output->buf[index] = vfe_buf_get_pending(output);
 
 	if (output->buf[index])
-		vfe_wm_update(vfe, output->wm[0].bus_client, output->buf[index]->addr[0], line);
+		vfe_wm_update(vfe, output->wm[0].bus_client, output->buf[index], line);
 	else
 		output->gen2.active_num--;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 493c4b2e64162..e5a0a70eed1e6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -252,9 +252,10 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			  struct vfe_line *line)
 {
+	u32 addr = buffer->addr[0];
 	u8 client = tfe_wm_client_map[wm];
 
 	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 75dc73eadd6d0..bb065e47fe91e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -133,9 +133,10 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			  struct vfe_line *line)
 {
+	u32 addr = buffer->addr[0];
 	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
 	writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
index d9a6402e8d928..242bacb051cc0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-680.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -144,10 +144,11 @@ static void vfe_disable_irq(struct vfe_device *vfe)
 	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 1));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u32 addr = buffer->addr[0];
+	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
 
 	writel(addr, vfe->base + VFE_BUS_IMAGE_ADDR(vfe, wm));
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
index fb40560d4ab41..efe8d963b4703 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-690.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
@@ -96,9 +96,11 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			  struct vfe_line *line)
 {
+	u32 addr = buffer->addr[0];
+
 	wm = RDI_WM(wm);
 
 	writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 88d74323fe276..d70e829524fdf 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -118,9 +118,11 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			  struct vfe_line *line)
 {
+	u32 addr = buffer->addr[0];
+
 	wm = line->output[0].wm[0].bus_client;
 
 	writel((addr >> 8), vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 896e8d8e8d8a0..fbc2068b301bc 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -662,7 +662,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *bu
 			ops->vfe_output_update(vfe, output, output->buf[index]);
 		else
 			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-					   output->buf[index]->addr[0],
+					   output->buf[index],
 					   line);
 		ops->reg_update(vfe, line->id);
 	} else {
@@ -714,7 +714,7 @@ static int vfe_enable_one_output(struct vfe_line *line, struct vfe_output *outpu
 			ops->vfe_output_update(vfe, output, output->buf[i]);
 		else
 			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-					   output->buf[i]->addr[0], line);
+					   output->buf[i], line);
 		ops->reg_update(vfe, line->id);
 	}
 
@@ -785,7 +785,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 			ops->vfe_output_update(vfe, output, buf);
 		else
 			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-					   buf->addr[0], line);
+					   buf, line);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 4e99a2c5b33af..0b632479cefc6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -185,7 +185,7 @@ struct vfe_hw_ops {
 			    struct vfe_line *line);
 	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id,
 			     struct camss_buf_done_info *buf_done_info);
-	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
+	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			      struct vfe_line *line);
 
 	/* Output based API - new and shiny */

-- 
2.55.0

