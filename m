Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA484CE699;
	Mon,  5 Oct 2026 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220548; cv=none; b=O508vEBPZTCI1/jnrrRf/v6xrpmaE6WgAZF3V1Vjc1MZX8cOLNoyiYjG8faHjlVisoGZQgRFBMtamvqU4Vi4Hj+VnBaEkh5qe/GuZrb/zJaOvO851FwbLMuSsVxcRGV61j/1E8ZFc0dPYTbH5uQ2O4hNITDuYwA6xKIA5jLj0ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220548; c=relaxed/simple;
	bh=3KI+WRfOWe1BqN3B0+hvh29upFHskMPI5atz6YE3l8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dpe4oqIHXaogIQq8KIGVBl1ZkBj75zGH4uY4yRy/hNwZHBPsue5tJf7YYwmyq9UwRP8Ip9zOHou+S9Ryx+st0LMHvGb17hIhoKB7TPZ2oMsGrznS8yGjlYGZNHCdXKfcKHLws4CLZ8u0luHvlF74fyOfCDZPkq2WuIS7htjuL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBM/ckDs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBM/ckDs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97E51F000FF;
	Mon,  5 Oct 2026 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220546;
	bh=PNhVxcjyDyVesjAh/2LTUKSGS0WDwiR2Mj+OOwzsm24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CBM/ckDsP7vHKN0RNptkRC8dmot7Z6sHbbnL+Gsq1KaXWfbIfGfnTYV7RMJKTBIjG
	 2GVaL1DgkxhbOuJrwiKLcIRfDD9xGvArUsWhBdvchLzhw0Yw6OppXyhw8/7GpTsYVB
	 94rqqrpIB6jJ3SvKwWWHqZD3n+vCzj7hAli4HfqKI51aNp5fUw5itHnXq70X7E41V1
	 8VXKyxyzIuEXbRL/EqNhnUBnzjkItnoq3I1xdnQDFfy4cb6W/dKU8UYoxjEXlwK+mC
	 tXPlQIJHHsmQYv6bkD2Uz9G06IT86yD47ugSqqprcE2e/oiG6wsCxkxaePoPaYpvww
	 WIdPM3RtMsDwg==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:32 +0200
Subject: [PATCH 02/74] media: qcom: camss: vfe: Separate VFE 690 from VFE
 780/880
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-2-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13999; i=bod@kernel.org;
 h=from:subject:message-id; bh=3KI+WRfOWe1BqN3B0+hvh29upFHskMPI5atz6YE3l8M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sBu+cQpMvdZLtBKPiVWly1ROJUtNl1p192F
 bSJkw155myJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbAQAKCRAicTuzoY3I
 Oi36EACTwJj8Ha8fyEmzl2LpHYktFHYfXNSdhg+0lf5Bm4NNpe6TupWqEHrobvwdB0k66g93huh
 KSFKiwPGHGLXMinkOEuWqxfEOAs/EXPDzY/3pGRb2BME6ZWYffvHz5ue5UK+oi0eCK3XIVyJmZO
 NXXkRhkddF8o9otil0A8Rvf0KvfwmU7mPAZ7SQ2z0fwjXJ4FMsKSXHC2d4bpqzO9B5eI4xlHWOM
 Fb422Ys+Vdu8KqhHoePOFyecZKKHLiY/Xsljhn4sRzkPW24sIqRO0IOCdNoJQWAks5v9pl+A0Yk
 dh0+ER8y7lwgjYaMx8fW7esDaII+SNOYky4TmR1PjRi0fBVfvYgKQ/yXnrZhuVaqMgIdJL3SaJA
 6eVOXO1hj5TgBoC9AI/qUn4qHdjmR4/s1diYDzqMoqoGtOskZ/zF9ShGtSBFKzhcB2tULYVUcig
 /XUMznIYneoy9TwuK5u9E3yGTjY3tEeb0eurpgkHOz9zqW2NoUAd8zAdjiYcPKWGArmL+c5NmOd
 UdbO4iwICM/0M7itrg+HmOgsUPVB9IYC4b4pu1FVdI7iyVs7xCH7lX2h8+ADDqU6Tg6sJYSLsFK
 edEdhNMrsCcIArtdbU/TKSW5Rp85l/Sc0l6+YbvZ18S2IorQbp0WHrvktvFw3TRobLdOHK56nr1
 GJmU36DlrV6C/tQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Looking at the write-master index for VFE 690 and VFE 780/880 we can see a
discontinuity between 690 and 780/880. Extending out the functionality in
these files will result in spaghettification of the code for no good
purpose.

The WM index difference is indication enough that the silicon should live
in separate files.

Disjoin now.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/Makefile        |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-690.c | 168 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-780.c |  53 ++-----
 drivers/media/platform/qcom/camss/camss-vfe.h     |   1 +
 drivers/media/platform/qcom/camss/camss.c         |  14 +-
 5 files changed, 187 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e82bc8141c241..4dcb08a0e25aa 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -25,6 +25,7 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
+		camss-vfe-690.o \
 		camss-vfe-780.o \
 		camss-vfe-gen1.o \
 		camss-vfe-vbif.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c b/drivers/media/platform/qcom/camss/camss-vfe-690.c
new file mode 100644
index 0000000000000..6f90134d5ed64
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 690
+ *
+ * Copyright (c) 2024 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+#define BUS_REG_BASE (vfe_is_lite(vfe) ? 0x480 : 0x400)
+
+#define VFE_TOP_CORE_CFG (0x24)
+#define VFE_DISABLE_DSCALING_DS4  BIT(21)
+#define VFE_DISABLE_DSCALING_DS16 BIT(22)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL (BUS_REG_BASE + 0xFC)
+/*
+ * Bus client mapping:
+ *
+ * Full VFE:
+ * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
+ *
+ * VFE LITE:
+ * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
+ */
+#define RDI_WM(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
+
+#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
+#define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
+
+#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
+#define		WM_CFG_EN			BIT(0)
+#define		WM_VIR_FRM_EN			BIT(1)
+#define		WM_CFG_MODE			BIT(16)
+#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
+#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
+#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE	(0xFFFF)
+#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
+
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+
+	wm = RDI_WM(wm);
+
+	/* no clock gating at bus input */
+	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
+	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+
+	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* TOP CORE CFG */
+	writel(VFE_DISABLE_DSCALING_DS4 | VFE_DISABLE_DSCALING_DS16,
+		vfe->base + VFE_TOP_CORE_CFG);
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
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+{
+	wm = RDI_WM(wm);
+	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+			  struct vfe_line *line)
+{
+	wm = RDI_WM(wm);
+
+	writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
+		wm, addr);
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, true);
+}
+
+static const struct camss_video_ops vfe_video_ops_690 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_690;
+}
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	vfe_isr_reset_ack(vfe);
+}
+
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	/* nop */
+	return IRQ_HANDLED;
+}
+
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+const struct vfe_hw_ops vfe_ops_690 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 6c04e3c64b841..4adbd0680898f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 780
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
@@ -12,40 +12,19 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-#define IS_VFE_690(vfe) \
-	    ((vfe->camss->res->version == CAMSS_8775P) \
-	    || (vfe->camss->res->version == CAMSS_8300))
-
-#define BUS_REG_BASE_690 \
-	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
-#define BUS_REG_BASE_780 \
-	    (vfe_is_lite(vfe) ? 0x200 : 0xC00)
-#define BUS_REG_BASE \
-	    (IS_VFE_690(vfe) ? BUS_REG_BASE_690 : BUS_REG_BASE_780)
-
-#define VFE_TOP_CORE_CFG (0x24)
-#define VFE_DISABLE_DSCALING_DS4  BIT(21)
-#define VFE_DISABLE_DSCALING_DS16 BIT(22)
-
-#define VFE_BUS_WM_TEST_BUS_CTRL_690 (BUS_REG_BASE + 0xFC)
-#define VFE_BUS_WM_TEST_BUS_CTRL_780 (BUS_REG_BASE + 0xDC)
-#define VFE_BUS_WM_TEST_BUS_CTRL \
-	    (IS_VFE_690(vfe) ? VFE_BUS_WM_TEST_BUS_CTRL_690 \
-	     : VFE_BUS_WM_TEST_BUS_CTRL_780)
+#define BUS_REG_BASE (vfe_is_lite(vfe) ? 0x200 : 0xC00)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL (BUS_REG_BASE + 0xDC)
 /*
  * Bus client mapping:
  *
  * Full VFE:
- * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
  * VFE_780: 23 = RDI0, 24 = RDI1, 25 = RDI2
  *
  * VFE LITE:
- * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
  * VFE_780 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4
  */
-#define RDI_WM_690(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
-#define RDI_WM_780(n)	((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
-#define RDI_WM(n)	(IS_VFE_690(vfe) ? RDI_WM_690(n) : RDI_WM_780(n))
+#define RDI_WM(n)	((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
 
 #define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
@@ -82,12 +61,8 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
 
-	if (IS_VFE_690(vfe))
-		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
-		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
-	else
-		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
-		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
 
 	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
 	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
@@ -95,11 +70,6 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
 	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
 
-	/* TOP CORE CFG */
-	if (IS_VFE_690(vfe))
-		writel(VFE_DISABLE_DSCALING_DS4 | VFE_DISABLE_DSCALING_DS16,
-			vfe->base + VFE_TOP_CORE_CFG);
-
 	/* no dropped frames, one irq per frame */
 	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
 	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
@@ -123,10 +93,7 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 {
 	wm = RDI_WM(wm);
 
-	if (IS_VFE_690(vfe))
-		writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
-	else
-		writel((addr >> 8), vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+	writel((addr >> 8), vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 
 	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
 		wm, addr);
@@ -147,14 +114,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 	camss_reg_update(vfe->camss, vfe->id, port_id, true);
 }
 
-static const struct camss_video_ops vfe_video_ops_gen3 = {
+static const struct camss_video_ops vfe_video_ops_780 = {
 	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->video_ops = vfe_video_ops_gen3;
+	vfe->video_ops = vfe_video_ops_780;
 }
 
 static void vfe_global_reset(struct vfe_device *vfe)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 68cd05331ffe7..089f525b98cf5 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -248,6 +248,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
+extern const struct vfe_hw_ops vfe_ops_690;
 extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 80697d0ab701b..40a993ade5f6d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4001,7 +4001,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4029,7 +4029,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4054,7 +4054,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4079,7 +4079,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4104,7 +4104,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4129,7 +4129,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4154,7 +4154,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}

-- 
2.55.0

