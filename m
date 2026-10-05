Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7844D9552;
	Mon,  5 Oct 2026 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220620; cv=none; b=njZl4ImnDXxZiDui97/Sm9Kryx9ecT+0jO2pRKJdQkDVNAm26dTP3JSBEUnr4HQ68rfgoT8Av5fj+TW5u1qo5eEF73EES2/0ikzFEgvG3vK4KVdDK7L5tTvpxb+nlHSnDzwxzrRRKVUBHxk2O6NWzcWfPKmQ2FaddObH2Ulylc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220620; c=relaxed/simple;
	bh=bOQkHJpa9j6I3ldFdS/97ztkAiQyARWHD/TphLGqdIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqFwkaPhiHkzQ0LEs/mOmLe+XJFuW/FYioKLhnWU8BEsEtMbhGmw0Re/+vCFp4raLiKANWMLmb+ecohq9Op6eQng+F//SXExyM7IWza518y6a/vLaMyFEovTNiJUEE/XXyHxOQw17n3K/vY439PHFqZPSDh5VdvrJDU3HrB2+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLhPf7j2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLhPf7j2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9EA1F0089A;
	Mon,  5 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220617;
	bh=gt9PlZtuX2xRbkTkk2bZvpg6unStsMlGZqrk/YRiMyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lLhPf7j2xWPKcH//nUUXEfSFcQtr3PQn83DOMFgw30GzPAp1i/EjDuvblZurtkkEj
	 zLFZX50Y4v6Na48Ptw3UJfwuT9KjfbI95CetQ9m3fLKWxfT83/6e0NeSeZ+/0AS3Jr
	 B1fsoSsXytlHd2QAqwNE7UJal7TO5d2I0yiri9BBnCmt2NBtIlNAWUMz9s+NydQWWC
	 zs1iFz0lOkgz7XBVIkPTZcs5olHWMPoAHJIBm8m6NORJECHB/aBFeVTmKuNrWd2ICH
	 ZTJxo4kFuIeRQ0fnwobODI9jOYetH5m3CKIhLlP4WTDoJwQzGuEpg5xexxWskS+cxm
	 NQnnAyuAJGMBw==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:51 +0200
Subject: [PATCH 21/74] media: qcom: camss: vfe: Represent vfe wm inside of
 a struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-21-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19184; i=bod@kernel.org;
 h=from:subject:message-id; bh=bOQkHJpa9j6I3ldFdS/97ztkAiQyARWHD/TphLGqdIw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sPrLyx0/fDQ4OBxIMIEPsE046FHNea2OQJ8
 49AtY40nkuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbDwAKCRAicTuzoY3I
 OolFEACX5Iq+Y4waor6C47vJ6i5ejdyxpwOvGZ3j5RIKYq5ygAeRe9zRPhfSkdlU/3RaDMnb1c0
 dYcueVq6RCbuqksyQ/t4F6yBHUeiuWdPxvmDtnlJ+5keVwdhgzqky89Bk6ptbfI2OOAZSF0Lgb+
 oNtnzJsVm3BxWp9TFrAxv1n9Rte9CI2WO2t0T/0ChhhEBdjK5tXX+szrM0lg08Oe7sq2TjI6uxr
 3xP4z8syK+P1F/iE5Ll6vWSKaUW3957MyMT93WUSOeWjbSpShZ8jujqK6b1v5xHCke3JEOqP1P8
 o8SFtKOb5+j8/783cRH6XFbRb9RedKLwUXLynWn8bKUY9KpCF93hNnMVTHhYph/WNhrkSeFst7+
 UySVNXAFS5ERB+rD79TNqK9BFQIWo/99V0ZLEyJ2r6EzwAq9H2XqDNd+7jT6rKR3jP1GPdYDFRY
 nWId1GqEX3kLsvdKNQe+yuFGKaBuBCJH2vUqhdnD6zeDUzyUDcIrPk16w/64HHeBGzBAYhDc6b5
 736tBsTkUA2FBp+5glnNYAgS3H+gn/E7Hsuf57iF2VKkP2FnGLFJjLPezVG+t4xDhMEjUyk6LBc
 1JLC7UDBJcA7elcVmGvDkogxcXvoeGpc2eBSoF6N1Gw1QCY4pYnC3h0ctNZuTtyXwVdCif+r+EK
 /2QgbKB6VM2KZ7Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Right now we have a major source of concept confusion where write-master is
used in-lieu of of completion group. In the code when we say "wm" we
actually mean "completion group".

To extend this driver out to support completion groups where multiple
write-masters within one completion group signal readiness via their group
completion status, we need to associate write masters with their completion
groups.

Firs step is to stop indexing wm's as sacrosanct indexes and instead hide
their fake sacral nature in a struct.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  | 10 +--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  | 22 +++----
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  | 22 +++----
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c | 72 +++++++++++-----------
 drivers/media/platform/qcom/camss/camss-vfe.c      | 14 ++---
 drivers/media/platform/qcom/camss/camss-vfe.h      |  8 ++-
 7 files changed, 78 insertions(+), 72 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index d9e37cf609823..8cb0c028a3bce 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -541,7 +541,7 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	output->buf[index] = vfe_buf_get_pending(output);
 
 	if (output->buf[index])
-		vfe_wm_update(vfe, output->wm_idx[0], output->buf[index]->addr[0], line);
+		vfe_wm_update(vfe, output->wm[0].bus_client, output->buf[index]->addr[0], line);
 	else
 		output->gen2.active_num--;
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index ccc065924b6b6..40fa7cecd0f71 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -493,16 +493,16 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 			break;
 		}
 
-		if (output->wm_idx[i] % 2 == 1)
+		if (output->wm[i].bus_client % 2 == 1)
 			reg <<= 16;
 
 		if (enable)
 			vfe_reg_set(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[i]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[i].bus_client),
 				    reg);
 		else
 			vfe_reg_clr(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[i]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[i].bus_client),
 				    reg);
 	}
 }
@@ -568,8 +568,8 @@ static void vfe_enable_irq_pix_line(struct vfe_device *vfe, u8 comp,
 	irq_en1 = VFE_0_IRQ_MASK_1_CAMIF_ERROR;
 	for (i = 0; i < output->wm_num; i++) {
 		irq_en1 |= VFE_0_IRQ_MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(
-							output->wm_idx[i]);
-		comp_mask |= (1 << output->wm_idx[i]) << comp * 8;
+							output->wm[i].bus_client);
+		comp_mask |= (1 << output->wm[i].bus_client) << comp * 8;
 	}
 
 	if (enable) {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 1f02adb79f921..f98986641ae1a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -577,32 +577,32 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_LUMA <<
 			VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
 
-		if (output->wm_idx[0] % 2 == 1)
+		if (output->wm[0].bus_client % 2 == 1)
 			reg <<= 16;
 
 		if (enable)
 			vfe_reg_set(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 		else
 			vfe_reg_clr(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 
 		reg = VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_EN;
 		if (p == V4L2_PIX_FMT_NV12 || p == V4L2_PIX_FMT_NV16)
 			reg |= VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER_INTRA;
 
-		if (output->wm_idx[1] % 2 == 1)
+		if (output->wm[1].bus_client % 2 == 1)
 			reg <<= 16;
 
 		if (enable)
 			vfe_reg_set(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[1]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[1].bus_client),
 				    reg);
 		else
 			vfe_reg_clr(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[1]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[1].bus_client),
 				    reg);
 		break;
 	case V4L2_PIX_FMT_YUYV:
@@ -615,16 +615,16 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 		if (p == V4L2_PIX_FMT_YUYV || p == V4L2_PIX_FMT_YVYU)
 			reg |= VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER_INTRA;
 
-		if (output->wm_idx[0] % 2 == 1)
+		if (output->wm[0].bus_client % 2 == 1)
 			reg <<= 16;
 
 		if (enable)
 			vfe_reg_set(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 		else
 			vfe_reg_clr(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 		break;
 	default:
@@ -719,8 +719,8 @@ static void vfe_enable_irq_pix_line(struct vfe_device *vfe, u8 comp,
 	irq_en1 = VFE_0_IRQ_MASK_1_CAMIF_ERROR;
 	for (i = 0; i < output->wm_num; i++) {
 		irq_en1 |= VFE_0_IRQ_MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(
-							output->wm_idx[i]);
-		comp_mask |= (1 << output->wm_idx[i]) << comp * 8;
+							output->wm[i].bus_client);
+		comp_mask |= (1 << output->wm[i].bus_client) << comp * 8;
 	}
 
 	if (enable) {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 577d1ddfe84b4..06bcdf72132b2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -548,32 +548,32 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_LUMA <<
 			VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
 
-		if (output->wm_idx[0] % 2 == 1)
+		if (output->wm[0].bus_client % 2 == 1)
 			reg <<= 16;
 
 		if (enable)
 			vfe_reg_set(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 		else
 			vfe_reg_clr(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 
 		reg = VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_EN;
 		if (p == V4L2_PIX_FMT_NV12 || p == V4L2_PIX_FMT_NV16)
 			reg |= VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER_INTRA;
 
-		if (output->wm_idx[1] % 2 == 1)
+		if (output->wm[1].bus_client % 2 == 1)
 			reg <<= 16;
 
 		if (enable)
 			vfe_reg_set(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[1]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[1].bus_client),
 				    reg);
 		else
 			vfe_reg_clr(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[1]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[1].bus_client),
 				    reg);
 		break;
 	case V4L2_PIX_FMT_YUYV:
@@ -586,16 +586,16 @@ static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
 		if (p == V4L2_PIX_FMT_YUYV || p == V4L2_PIX_FMT_YVYU)
 			reg |= VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER_INTRA;
 
-		if (output->wm_idx[0] % 2 == 1)
+		if (output->wm[0].bus_client % 2 == 1)
 			reg <<= 16;
 
 		if (enable)
 			vfe_reg_set(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 		else
 			vfe_reg_clr(vfe,
-				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    VFE_0_BUS_XBAR_CFG_x(output->wm[0].bus_client),
 				    reg);
 		break;
 	default:
@@ -690,8 +690,8 @@ static void vfe_enable_irq_pix_line(struct vfe_device *vfe, u8 comp,
 	irq_en0 |= VFE_0_IRQ_MASK_0_line_n_REG_UPDATE(line_id);
 	irq_en1 = VFE_0_IRQ_MASK_1_CAMIF_ERROR;
 	for (i = 0; i < output->wm_num; i++) {
-		irq_en1 |= VFE_0_IRQ_MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(output->wm_idx[i]);
-		comp_mask |= (1 << output->wm_idx[i]) << comp * 8;
+		irq_en1 |= VFE_0_IRQ_MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(output->wm[i].bus_client);
+		comp_mask |= (1 << output->wm[i].bus_client) << comp * 8;
 	}
 
 	if (enable) {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index ac4c4fd261b33..4b0fe2db7fcf5 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -53,7 +53,7 @@ static int vfe_disable_output(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
-		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[i], 0);
+		vfe->ops_gen1->wm_enable(vfe, output->wm[i].bus_client, 0);
 
 	ops->reg_update(vfe, line->id);
 	output->wait_reg_update = 1;
@@ -66,15 +66,15 @@ static int vfe_disable_output(struct vfe_line *line)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	if (line->id != VFE_LINE_PIX) {
-		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 0);
-		vfe->ops_gen1->bus_disconnect_wm_from_rdi(vfe, output->wm_idx[0], line->id);
-		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 0);
-		vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[0], 0);
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm[0].bus_client, 0);
+		vfe->ops_gen1->bus_disconnect_wm_from_rdi(vfe, output->wm[0].bus_client, line->id);
+		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm[0].bus_client, line->id, 0);
+		vfe->ops_gen1->set_cgc_override(vfe, output->wm[0].bus_client, 0);
 		spin_unlock_irqrestore(&vfe->output_lock, flags);
 	} else {
 		for (i = 0; i < output->wm_num; i++) {
-			vfe->ops_gen1->wm_line_based(vfe, output->wm_idx[i], NULL, i, 0);
-			vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[i], 0);
+			vfe->ops_gen1->wm_line_based(vfe, output->wm[i].bus_client, NULL, i, 0);
+			vfe->ops_gen1->set_cgc_override(vfe, output->wm[i].bus_client, 0);
 		}
 
 		vfe->ops_gen1->enable_irq_pix_line(vfe, 0, line->id, 0);
@@ -138,10 +138,10 @@ static void vfe_output_init_addrs(struct vfe_device *vfe,
 		else
 			pong_addr = ping_addr;
 
-		vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm_idx[i], ping_addr);
-		vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm_idx[i], pong_addr);
+		vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm[i].bus_client, ping_addr);
+		vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm[i].bus_client, pong_addr);
 		if (sync)
-			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+			vfe->ops_gen1->bus_reload_wm(vfe, output->wm[i].bus_client);
 	}
 }
 
@@ -158,8 +158,8 @@ static void vfe_output_frame_drop(struct vfe_device *vfe,
 	drop_period = VFE_FRAME_DROP_VAL + output->drop_update_idx;
 
 	for (i = 0; i < output->wm_num; i++) {
-		vfe->ops_gen1->wm_set_framedrop_period(vfe, output->wm_idx[i], drop_period);
-		vfe->ops_gen1->wm_set_framedrop_pattern(vfe, output->wm_idx[i], drop_pattern);
+		vfe->ops_gen1->wm_set_framedrop_period(vfe, output->wm[i].bus_client, drop_period);
+		vfe->ops_gen1->wm_set_framedrop_pattern(vfe, output->wm[i].bus_client, drop_pattern);
 	}
 
 	vfe->res->hw_ops->reg_update(vfe, output->line->id);
@@ -237,27 +237,27 @@ static int vfe_enable_output(struct vfe_line *line)
 	vfe_output_init_addrs(vfe, output, 0, line);
 
 	if (line->id != VFE_LINE_PIX) {
-		vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[0], 1);
-		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 1);
-		vfe->ops_gen1->bus_connect_wm_to_rdi(vfe, output->wm_idx[0], line->id);
-		vfe->ops_gen1->wm_set_subsample(vfe, output->wm_idx[0]);
+		vfe->ops_gen1->set_cgc_override(vfe, output->wm[0].bus_client, 1);
+		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm[0].bus_client, line->id, 1);
+		vfe->ops_gen1->bus_connect_wm_to_rdi(vfe, output->wm[0].bus_client, line->id);
+		vfe->ops_gen1->wm_set_subsample(vfe, output->wm[0].bus_client);
 		vfe->ops_gen1->set_rdi_cid(vfe, line->id, 0);
-		vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[0],
-					    (ub_size + 1) * output->wm_idx[0], ub_size);
-		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 1);
-		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[0], 1);
-		vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[0]);
+		vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm[0].bus_client,
+					    (ub_size + 1) * output->wm[0].bus_client, ub_size);
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm[0].bus_client, 1);
+		vfe->ops_gen1->wm_enable(vfe, output->wm[0].bus_client, 1);
+		vfe->ops_gen1->bus_reload_wm(vfe, output->wm[0].bus_client);
 	} else {
 		ub_size /= output->wm_num;
 		for (i = 0; i < output->wm_num; i++) {
-			vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[i], 1);
-			vfe->ops_gen1->wm_set_subsample(vfe, output->wm_idx[i]);
-			vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[i],
-						     (ub_size + 1) * output->wm_idx[i], ub_size);
-			vfe->ops_gen1->wm_line_based(vfe, output->wm_idx[i],
+			vfe->ops_gen1->set_cgc_override(vfe, output->wm[i].bus_client, 1);
+			vfe->ops_gen1->wm_set_subsample(vfe, output->wm[i].bus_client);
+			vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm[i].bus_client,
+						     (ub_size + 1) * output->wm[i].bus_client, ub_size);
+			vfe->ops_gen1->wm_line_based(vfe, output->wm[i].bus_client,
 						     &line->output[0].video_out.active_fmt.fmt.pix_mp, i, 1);
-			vfe->ops_gen1->wm_enable(vfe, output->wm_idx[i], 1);
-			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+			vfe->ops_gen1->wm_enable(vfe, output->wm[i].bus_client, 1);
+			vfe->ops_gen1->bus_reload_wm(vfe, output->wm[i].bus_client);
 		}
 		vfe->ops_gen1->enable_irq_pix_line(vfe, 0, line->id, 1);
 		vfe->ops_gen1->set_module_cfg(vfe, 1);
@@ -316,7 +316,7 @@ static int vfe_get_output(struct vfe_line *line)
 			dev_err(vfe->camss->dev, "Can not reserve wm\n");
 			goto error_get_wm;
 		}
-		output->wm_idx[i] = wm_idx;
+		output->wm[i].bus_client = wm_idx;
 	}
 
 	output->drop_update_idx = 0;
@@ -327,7 +327,7 @@ static int vfe_get_output(struct vfe_line *line)
 
 error_get_wm:
 	for (i--; i >= 0; i--)
-		vfe_release_wm(vfe, output->wm_idx[i]);
+		vfe_release_wm(vfe, output->wm[i].bus_client);
 	output->state = VFE_OUTPUT_OFF;
 error:
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -394,9 +394,9 @@ static void vfe_output_update_ping_addr(struct vfe_device *vfe,
 		else
 			addr = 0;
 
-		vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm_idx[i], addr);
+		vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm[i].bus_client, addr);
 		if (sync)
-			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+			vfe->ops_gen1->bus_reload_wm(vfe, output->wm[i].bus_client);
 	}
 }
 
@@ -413,9 +413,9 @@ static void vfe_output_update_pong_addr(struct vfe_device *vfe,
 		else
 			addr = 0;
 
-		vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm_idx[i], addr);
+		vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm[i].bus_client, addr);
 		if (sync)
-			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+			vfe->ops_gen1->bus_reload_wm(vfe, output->wm[i].bus_client);
 	}
 }
 
@@ -658,10 +658,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 
 	if (active_index)
 		for (i = 0; i < output->wm_num; i++)
-			vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm_idx[i], new_addr[i]);
+			vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm[i].bus_client, new_addr[i]);
 	else
 		for (i = 0; i < output->wm_num; i++)
-			vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm_idx[i], new_addr[i]);
+			vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm[i].bus_client, new_addr[i]);
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 18f66bea5e3b1..8899f02ceba02 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -624,7 +624,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	output->buf[index] = vfe_buf_get_pending(output);
 
 	if (output->buf[index]) {
-		ops->vfe_wm_update(vfe, output->wm_idx[0],
+		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
 				   output->buf[index]->addr[0],
 				   line);
 		ops->reg_update(vfe, line->id);
@@ -683,14 +683,14 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	output->wait_reg_update = 0;
 	reinit_completion(&output->reg_update);
 
-	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
+	ops->vfe_wm_start(vfe, output->wm[0].bus_client, line);
 
 	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
 		output->buf[i] = vfe_buf_get_pending(output);
 		if (!output->buf[i])
 			break;
 		output->gen2.active_num++;
-		ops->vfe_wm_update(vfe, output->wm_idx[0],
+		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
 				   output->buf[i]->addr[0], line);
 		ops->reg_update(vfe, line->id);
 	}
@@ -724,7 +724,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 	if (output->state == VFE_OUTPUT_ON &&
 	    output->gen2.active_num < 2) {
 		output->buf[output->gen2.active_num++] = buf;
-		ops->vfe_wm_update(vfe, output->wm_idx[0],
+		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
 				   buf->addr[0], line);
 		ops->reg_update(vfe, line->id);
 	} else {
@@ -808,7 +808,7 @@ int vfe_get_output_v2(struct vfe_line *line)
 	 * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> PIX/RDI3
 	 * Note this 1:1 mapping will not work for PIX streams.
 	 */
-	output->wm_idx[0] = line->id;
+	output->wm[0].bus_client = line->id;
 	vfe->wm_output_map[line->id] = line->id;
 
 	output->drop_update_idx = 0;
@@ -938,7 +938,7 @@ int vfe_put_output(struct vfe_line *line)
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	for (i = 0; i < output->wm_num; i++)
-		vfe_release_wm(vfe, output->wm_idx[i]);
+		vfe_release_wm(vfe, output->wm[i].bus_client);
 
 	output->state = VFE_OUTPUT_OFF;
 
@@ -955,7 +955,7 @@ static int vfe_disable_output(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
-		vfe->res->hw_ops->vfe_wm_stop(vfe, output->wm_idx[i]);
+		vfe->res->hw_ops->vfe_wm_stop(vfe, output->wm[i].bus_client);
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 42ac030d339b0..29682e8e9f401 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -78,9 +78,15 @@ enum vfe_packer_format_v3 {
 	VFE_BUS_WM_PACKER_FMT_V3_MAX,
 };
 
+struct vfe_wm {
+	u8 bus_client;
+};
+
+#define VFE_MAX_WM_PER_OUTPUT 3
+
 struct vfe_output {
 	u8 wm_num;
-	u8 wm_idx[3];
+	struct vfe_wm wm[VFE_MAX_WM_PER_OUTPUT];
 
 	struct camss_buffer *buf[2];
 	struct camss_buffer *last_buffer;

-- 
2.55.0

