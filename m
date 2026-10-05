Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3472651A75D;
	Mon,  5 Oct 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220696; cv=none; b=I4ICONHUWTZM8Otk0ngcmP+qLZeYDqiNl2boYmlwzJGIMD4FHHxeL2xTZyRmjHfza6YYAB5blXzV7A+8RYtWqXpnXRgwSyxcTlOH4V7ErLdTE1FqQQ1vLa/oULfxAEyO6m1xmXDdP82n3B8HXB9AdQyiubr+thnHZAYGX3/JDc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220696; c=relaxed/simple;
	bh=D0bmUloToCcp6IH4lf3eHL5gLBt4ckmPhZqu4RYampU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7k5DjZNXzR4egO0KHGPFg5SK8jJY1/Sn4hb0VR3ckUWhWYzU0B+ZmYtY8JaDGmwevWYX7BMDgreBm6ndiK9+zdluKmdUWH6Jzwfc9K+L+NemwxklPWKcICxWASkPEXEsSL7v/qPS97uLXLlegzshHFlMmpuOQ7i9YE9TDp/+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fi1eu8vI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fi1eu8vI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9FE1F000FF;
	Mon,  5 Oct 2026 17:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220695;
	bh=mO5qig69nfhgKOli34C3livlTpXvbP2JcYdL67S+kkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Fi1eu8vIdAP/pBzfVr/X7ozl2JKmBDxVzytdbl347mJlR0kCJ1k2zhuliBmel7rjE
	 9UapB6L5LXV+hEH20x/jpL46gha1nej5HjZDHAYNC7iGtefxitdD8yhl/0lNv6O/rT
	 r19Sgf+QThwXi1a3yxandTiMSZEv2uGp5xeinOHfhEOlm1BEFCQ4gqOianFSqzVHkq
	 7ReM5yo2whWB+rBeR0FNB7ioi2bSWn80bwqnqaE+s3PYI6YN6zjc8JH+MtDjITHQ4T
	 SohCwRrs7qhab/1qHZpgDqqaWiRo/tYOX/8lGwXGFsKMYctL/zZZBhCYtyDpjTPRFg
	 ZCOmziser5yBA==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:13 +0200
Subject: [PATCH 43/74] media: qcom: camss: vfe-780: Use bus-client to
 derive write master index
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-43-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3531; i=bod@kernel.org;
 h=from:subject:message-id; bh=D0bmUloToCcp6IH4lf3eHL5gLBt4ckmPhZqu4RYampU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sfflCW4612VpJetOO8Ebu9qlv/Kl8KnfS4C
 mqHmKk/+fyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbHwAKCRAicTuzoY3I
 OsQQD/4+zpJ7+3cpsZvnjFMUAAqH5t9lAblKMGbl07s8AsPqHM17GjGBqXLOEbiLtYaLh5GqH3/
 sDjcJKHf4mOlTv0mmIvr4DwYNxGLwpVawUpbvvGi6glvk4VSovqXoYLkIDCjZzBGYE4t3RvMysH
 54dL8nxn0kTo4I5yR7gKGfOJfcoF0xflrUOidrEk8AMy2/B6QVHGDSRGByiwQgruOgQKS8RuhZK
 dKhvZ8b2v5Q+GIgp+dNyVVeZdf+VhAR/O6UuivxuBXvNSuIO44rdaJJFyqKxPMe6e6uGbx3K/S2
 Ou9iGil8yEcEPcH/ang2l9LlReRiJp0tScrQKvK+luFtRhD/UaB3oN6wH7LG4/wOe7kcCC9l9XD
 zPO1lfiDtZQiHd3JWEmnJSdy5gCxjGq1d4XezYmYWA/pX0baak/j6/DHP0gGgfKxsiUXdwP5hme
 YIZ6wcSnROJO+XrDPeDo8u2NFksuly7Pn8zgFnC2zbxwlIih1fBQ6ebfSEu3lkFOc0PECQ5q932
 Kh2PSABdrO/et4I7Zdloy1tq02HoPd8k5eH/OFWSYbFlZ2iQlxpacBVi17GcpCE21W/sRQ97Qen
 tKZxEryN3pCzx+XlIHm/VQBFwE+vnMMnrRHraYiORyNFY2ym7JvmvvBXV0DPmmnllFuxQkvSnxe
 L9fO2cGQu82v9sA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Use line->output->bus_client defined in subdev_init instead of fixed macro
offsets to derive write-master indexes.

Aside from extensibility and grouping of code together this allows us to
very obviously see by just looking at plain and simple code what a
write-master identifier ought to be, what its completion group is, what its
pixel format is etc.

The macros need to be deprecated globally, starting here.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 43 ++++++++++++++++-------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 93f7c7a8e33f7..381d053dd9c15 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -55,16 +55,6 @@ typedef enum {
 #define BUS_REG_BASE (vfe_is_lite(vfe) ? 0x200 : 0xC00)
 
 #define VFE_BUS_WM_TEST_BUS_CTRL (BUS_REG_BASE + 0xDC)
-/*
- * Bus client mapping:
- *
- * Full VFE:
- * VFE_780: 23 = RDI0, 24 = RDI1, 25 = RDI2
- *
- * VFE LITE:
- * VFE_780 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4
- */
-#define RDI_WM(n)	((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
 
 #define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
@@ -94,7 +84,7 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	struct v4l2_pix_format_mplane *pix =
 		&line->output[0].video_out.active_fmt.fmt.pix_mp;
 
-	wm = RDI_WM(wm);
+	wm = line->output[0].wm[0].bus_client;
 
 	/* no clock gating at bus input */
 	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
@@ -124,14 +114,14 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
-	wm = RDI_WM(wm);
+	wm = line->output[0].wm[0].bus_client;
 	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
 }
 
 static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	wm = RDI_WM(wm);
+	wm = line->output[0].wm[0].bus_client;
 
 	writel((addr >> 8), vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 
@@ -159,9 +149,36 @@ static const struct camss_video_ops vfe_video_ops_780 = {
 	.flush_buffers = vfe_flush_buffers,
 };
 
+static void vfe_add_rdi(struct vfe_line *line, int bus_client, int comp_group)
+{
+	line->output[0].wm_num = 1;
+	line->output[0].wm[0].bus_client = bus_client;
+	line->output[0].wm[0].plane = 0;
+	line->output[0].comp_group = comp_group;
+}
+
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
 	vfe->video_ops = vfe_video_ops_780;
+
+	if (vfe_is_lite(vfe)) {
+		vfe_add_rdi(&vfe->line[VFE_LINE_RDI0], VFE_LITE_WM_RDI0, VFE_V3_COMP_GRP_1);
+		vfe_add_rdi(&vfe->line[VFE_LINE_RDI1], VFE_LITE_WM_RDI1, VFE_V3_COMP_GRP_2);
+		vfe_add_rdi(&vfe->line[VFE_LINE_RDI2], VFE_LITE_WM_RDI2, VFE_V3_COMP_GRP_3);
+		vfe_add_rdi(&vfe->line[VFE_LINE_PIX], VFE_LITE_WM_RDI3, VFE_V3_COMP_GRP_4);
+		return;
+	}
+
+	/* RDI0 */
+	vfe_add_rdi(&vfe->line[VFE_LINE_RDI0], VFE_WM_RDI0, VFE_V3_COMP_GRP_14);
+
+	/* RDI1 */
+	vfe_add_rdi(&vfe->line[VFE_LINE_RDI1], VFE_WM_RDI1, VFE_V3_COMP_GRP_15);
+
+	/* RDI2 */
+	vfe_add_rdi(&vfe->line[VFE_LINE_RDI2], VFE_WM_RDI2, VFE_V3_COMP_GRP_16);
+
+	return;
 }
 
 static void vfe_global_reset(struct vfe_device *vfe)

-- 
2.55.0

