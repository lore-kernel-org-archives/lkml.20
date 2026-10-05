Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B445372D6;
	Mon,  5 Oct 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220805; cv=none; b=aBV+Px3y33tbM2HHha5xvVi+y49LcCdoSgD+CS2+Rb+/8ti9I37Zaud2RaiceJ8K0Fs15g1aFvFP1u78tDGdOI5vwHQyPyojWJq2yFhOGsyQYJcSsX3JqfYyaPSZ3wt+teWu7raAlWjBpGq0CUwqBCRG+7LMDl5XW2bXe4K/9mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220805; c=relaxed/simple;
	bh=M+aL7Y5+CFhajlMNGE3Rr+tyKdLTVvBJJ3ifEnT4Sgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSns+FugnBgdEi7KehPE5Z4Leo460MjxZkzR8kHbuGl2Lp8Pz1ebPd6MaCFjN38Hhm8zKxd+npKKFTlyOn1KtDqm3t4JSpLiWAoHL32bg2T6ztlNXOggiRyro70O2WT55Ly6JV+zl+HCSiJYMPHpLnPgJj+yi1DEqD6oux9r1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3BJQFv3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3BJQFv3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CD31F000FF;
	Mon,  5 Oct 2026 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220804;
	bh=LkG62FwnNdwF9wHWLFMjOiZQQzocTOlXKj7vXOa/wis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S3BJQFv36SYacq6VnJsXUrL3/0CaLZH3Fw4K5k0zyymjqFwjr+mMdwqqln1FS5FO0
	 AFFUYOHl7opmEC2N6Tf9j59vExh/q7wQIuB+WPmzpz8T3DguN0oWZR7AfJk/Ld7KsH
	 RqjcnSfzoWOpNJbXTF4Fubhp9MXOj+TSLcSDtKnxoaW+0sP97MWTKkWebAkAIyLndy
	 x4I8YOuWRFausFm6It0tQX/VhKjVtjlssoyR7/1SAGZRHImcevMwyiijTXTRiGbSzR
	 FnCToAuMC0qna1VKnlkW61vCGyLtt/P7Sgt/Y7mp5s6J0AJ1wMOqmFhOkEekcfT6Yg
	 eKGjsk6exp0oQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:44 +0200
Subject: [PATCH 74/74] media: qcom: camss: vfe: Pass the write master its
 address again
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-74-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7112; i=bod@kernel.org;
 h=from:subject:message-id; bh=AAcje0UfNpnoKsI70oiIkvJd05SHBD9und2fAXfmrR8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9s1w2rSyDXyx2HuihS7H/ofXqoPpQ2/dsdUi
 MnAwABwnmSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbNQAKCRAicTuzoY3I
 OnmNEACEL58WP4eB7swNiWyiKKjD/1MC/n857RrBrYQ/zMjmpBBsozzXvggDlEfK1F1zKQvkMkp
 lxpmaXtskSi1hnFjTx3gdMsXmqJlm/Bi0bUmcH7X/xX7ESXIX/ubcMkwKNtcrgLBoeUZv3+ZcAG
 sXyK760Rkqtt26W2UdIc2V3UGYy7aVswzWdpiE3yd/eJeyLVj8KzO/+BX3Wrjl6r1cebZTdrUbY
 3FL8Q6kf/XLdAd81ZV/r9foem5D5vhBUDHaN7u1S5TyFvwd5hbB/CyZVHY/gv2a3VAmjCv4ue87
 27XwQN4s8VvKZwUSVf9axwL4/I9mPHfJutEtns1wbo0ML/dkWxfAHf3h3K7LpAd6UUiBTwe2xeb
 iprA1ZtMcD7tPU2n2WoX7raok/uXOg0pMy4mwaYZix3egi5vkD2I61q8Ya3RyM7J98hMuopXF/j
 LdtUmVPxY6a4gJtiQFH3+YuGrDHFpE73XMf2X4DktdeS7/RClYhAYgI0amxIdv8kLVNq9KaoYOO
 7WBWfDyb0ETiL6QK48Zb0cj+QCQzMpEQVN6TFXfWJ6HduBBzIEwOGm6AjAuzZSx4KVUFnlLEISg
 QhLtIU69No7me67RIcvgKvuQlDy3moJjmEUOwHMovz/8Ne3Yvxy3wJTrkQVMhgVHW/1Al813ohg
 tdEnqHDpTlNpODw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

With vfe-780 programming its planes through vfe_output_update(), no
backend needs the buffer in vfe_wm_update() any more. Go back to passing
the write master its address.

This reverts commit "media: qcom: camss: vfe: Pass the buffer to
vfe_wm_update()".

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 ++---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 3 +--
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 3 +--
 drivers/media/platform/qcom/camss/camss-vfe-680.c | 5 ++---
 drivers/media/platform/qcom/camss/camss-vfe-690.c | 4 +---
 drivers/media/platform/qcom/camss/camss-vfe.c     | 6 +++---
 drivers/media/platform/qcom/camss/camss-vfe.h     | 2 +-
 7 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index a2d336e7f7aa9..52812d34530d6 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -253,13 +253,12 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
 		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u32 addr = buffer->addr[0];
 
 	writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 	writel_relaxed(stride * pix->height, vfe->base + VFE_BUS_WM_FRAME_INC(wm));
@@ -542,7 +541,7 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	output->buf[index] = vfe_buf_get_pending(output);
 
 	if (output->buf[index])
-		vfe_wm_update(vfe, output->wm[0].bus_client, output->buf[index], line);
+		vfe_wm_update(vfe, output->wm[0].bus_client, output->buf[index]->addr[0], line);
 	else
 		output->gen2.active_num--;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 708dad42186f9..051f270a38187 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -252,10 +252,9 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u32 addr = buffer->addr[0];
 	u8 client = tfe_wm_client_map[wm];
 
 	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index bb065e47fe91e..75dc73eadd6d0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -133,10 +133,9 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u32 addr = buffer->addr[0];
 	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
 	writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
index 242bacb051cc0..d9a6402e8d928 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-680.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -144,11 +144,10 @@ static void vfe_disable_irq(struct vfe_device *vfe)
 	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 1));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
+static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
 			  struct vfe_line *line)
 {
-	u32 addr = buffer->addr[0];
-	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
+	u8 wm = RDI_WM(rdi);
 
 	writel(addr, vfe->base + VFE_BUS_IMAGE_ADDR(vfe, wm));
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
index efe8d963b4703..fb40560d4ab41 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-690.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
@@ -96,11 +96,9 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u32 addr = buffer->addr[0];
-
 	wm = RDI_WM(wm);
 
 	writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5c72357bb8f02..485feb0bd7420 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -822,7 +822,7 @@ static struct camss_buffer *vfe_output_done(struct vfe_device *vfe,
 			ops->vfe_output_update(vfe, output, output->buf[index]);
 		else
 			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-					   output->buf[index],
+					   output->buf[index]->addr[0],
 					   line);
 		ops->reg_update(vfe, line->id);
 	} else {
@@ -942,7 +942,7 @@ static int vfe_enable_one_output(struct vfe_line *line, struct vfe_output *outpu
 			ops->vfe_output_update(vfe, output, output->buf[i]);
 		else
 			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-					   output->buf[i], line);
+					   output->buf[i]->addr[0], line);
 		ops->reg_update(vfe, line->id);
 	}
 
@@ -1016,7 +1016,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 			ops->vfe_output_update(vfe, output, buf);
 		else
 			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-					   buf, line);
+					   buf->addr[0], line);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index b39bce17f8dec..f7d9070391163 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -196,7 +196,7 @@ struct vfe_hw_ops {
 			    struct vfe_line *line);
 	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id,
 			     struct camss_buf_done_info *buf_done_info);
-	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
+	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
 			      struct vfe_line *line);
 
 	/*

-- 
2.55.0

