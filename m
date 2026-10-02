Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACAE4EFFCA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956754; cv=none; b=FpItYkD0wIMo81M09367mBCTj3CqMzR0jqjjWPTORAtM7KGvn+pUU41qmbFzcARUExE7oJHuTUCF80IKORCgZr72CgZrj9CeJ3bZFOm3oh4VeZ0CfM/h4CiwadBt7/ubqfiB2rcwwbRS4uDj30vkjOsy+875pGOj7cbZhyO+1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956754; c=relaxed/simple;
	bh=ksEdNwe7aCyHle4RS9XJQKW80j7SBmFKRYMzEN0jQ2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvADtuTD1yhcD4Hq8wb1Wz2HSvOcdT8fIhx5uUmYwlLoTctBKv4cH++GooRyrRzbwX4/pFbjhR+pchzOXsblPMyoVqrq+5+EJv40lItMBTG/ZyVBnZoc7JMeOuoQlCtifnVxwnd8kK47sq8qMfkDRMk5SO/ys54zsnsIvSA/IF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6rERZ4m; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6rERZ4m"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so438995e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790956747; x=1791561547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hal81nvlomYgdsLAqBj3P0kj2PhVnZ71gMp9u1ojPc=;
        b=R6rERZ4mN2EHrjTZRdNPqWs4ouaF6oLTbxKswjzp8ilOsDu21WAvlt2I7gZQefXJob
         ZWzVXIKLQ07qTHzBzLQh2zhlgLAyrj9yY5SPVxCackDBYkpV/nk2i+/7IJCBbLtFIUTd
         Uv31LWZ1SRqgTmiNgAWLzej8+6ktex4UhtLpCeqqKSzYW/GBvm5U4+E6K0qK+w9eZxBG
         cnDLcprgpAa+R8HENmKdbLrAMoteTZQfPt2tWAnaLhipgjgcXMKcQ6UVWhZD6kb6rl6e
         9mGdY3zfwcpjI+ffS6f0rlF4Pfm/KxphGRNvhNOb/4mvjF1f/29PrhNdBHgUsf1c+tQL
         n/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956747; x=1791561547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Hal81nvlomYgdsLAqBj3P0kj2PhVnZ71gMp9u1ojPc=;
        b=uZa+2mc2HjTd4aAUeDdAg4WymaPzs84UBGiakHJFTTwoEGm5WWZ8kGbnRgbPPb+mPr
         MA73c40HW52hW8YeqFezrbX1LScvCXm4BDdmkrusppznRxPHqxkrplSWTW1uBTPfvbA2
         TWvTdXJl10ryJwT6xtpUTgStApI1qlA+C9EPbmm0WcaKVZC6vDlHooV1DkJtB+XRm2gs
         ojhZQjB+7Xrcsu9Oft8Et/6X7jexDbCzLqB+IL9pieDTEnox4qoZx2Eoy7ou1CI03YIN
         w7UKMKi+8YFVTPpIATUMd9ecmYLItv7jKdcmjQ61xxEd2eMZuzDbf2VPqmKhKYbtCKnZ
         yBag==
X-Forwarded-Encrypted: i=1; AKwUvBx6NC5YGAMKxOqoXxie9o0y1het8PzJqABUGLqseyXc6ZCU2ebOifFBl2M3CVKx1LfStRYwA9Jy2ziFa/M=@vger.kernel.org
X-Gm-Message-State: AFuF++ldzuRBs8NcGtd+o2GL3Di8rIPVSopKgZ4KjkumZ0g8757wK9/6
	H9KyQw3RtUDJDpioZGhN2UHp5iv4dDVOn/GgEfpX1E5TTW10rr8P5EOcbMwXynnabek=
X-Gm-Gg: AYBFou1ab/s1aUoBlAt2d0mK45P+fEPrn+ESdZzFKAoC3o3JEQhuF5qESQFljISaSJC
	wck5zps1vowr4MujZwwnh4lh6906jhNr44dgM+V6tglveYVCxuue/I2P7pNSRSsfP5AwvFS0aSO
	apl1FxLz1mp9/cVB69TCRVRKWjmTPhb0DSr9zdB0KXfBQBGtnuyaGHI4EWY0cIyHRc1A3MQC76r
	FaNHjvOmfwSjyuiH5IOJu/kRVWJvTcddXJDGUaDyER8ASdz/2JXr/XV2mZ2E6B75p3e016qbXUq
	pw1XnnyvX3qg7ESaWMyCcab88qkSNLIJrNitweNBTELHNT9WpYC9EL60ojLLqE8UNEIS5pXDLQv
	xgliuox4B0RKxdA+tGeNYkoY8sglxG7VqJXb2CnibIcd+h243nzvcqmJU8qKcQGr/HwoJaDHNoA
	d1sWVAS8VDmlUU8OXPn1Bnw5drsjNjSnpgaJRH6ADfPxb1FxAEZBOA3TROaZswFyHQ
X-Received: by 2002:a05:600c:8b27:b0:4a0:1e3a:4119 with SMTP id 5b1f17b1804b1-4a16380d864mr24523845e9.23.1790956745831;
        Fri, 02 Oct 2026 08:59:05 -0700 (PDT)
Received: from [127.0.0.1] ([109.76.210.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770fe4csm97162395e9.7.2026.10.02.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:59:05 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 02 Oct 2026 16:59:00 +0100
Subject: [PATCH 2/2] media: qcom: camss: vfe: Separate VFE 690 from VFE
 780/880
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-vfe690-780-split-v1-2-40e15aa8716c@kernel.org>
References: <20261002-vfe690-780-split-v1-0-40e15aa8716c@kernel.org>
In-Reply-To: <20261002-vfe690-780-split-v1-0-40e15aa8716c@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13999; i=bod@kernel.org;
 h=from:subject:message-id; bh=ksEdNwe7aCyHle4RS9XJQKW80j7SBmFKRYMzEN0jQ2A=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqv9TFuxWdZ7F7aochWU7os9/aLtrO8M4pJDyM2
 nYXvXuSQsqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCar/UxQAKCRAicTuzoY3I
 Oh7MD/4q/Ak/H7uqPXc7taTQpnOPHI3v7C5An6MzOpPQzXvIG3bWxcjXxjichDAQZX1012wPU4y
 /IRiO3jG2sBJWOObHwMiVvL9GQgCwKxDUSALDrxRcCIEUnJaHvg3aXJ2U3eqBuc4ax9rjWynxNc
 p9pDsYV4tubGIe1dd4ZkOpW0OOhJN0SAn+N9EMs95uosTZEn4FVEElL9V4SrXkvOMCYh8/4AfpO
 osVZu2LwB0LYUl6RLlpXND6tyYNNtGr+F10pGgnSL9NaKJys3TJUkPS+TyCitZOJap6LtDLWHvk
 FmxpU0L+3OBZS/i15uwDIi4qj12TvffjWYDh9F07hgocg8cUJg2nicCPUI2VpgxAsfJJKiYbgct
 69xq0tVLYDiCMfl3C40W1RmgAYcaeYrpwb5kM+9Ko8lgIZAbZbaEZRbuuK4Mcyx0wk80FtsM9AQ
 dmWBtz8/QVtciJ0rSUFBCwqcFWiOq747/Icl6rtuFLG1hF8goq/8OzseaTCvu/KZcl9lTpUn90h
 D53cPMvWXWA3tW8T8nVd6vB+Uyga/SIZ31N7Wbm4VIQS1gxEwWtVgwIGcSAoaB9kLNHCUjMIQ8U
 sK9fKHQwZJaS0Oiu4bpPHSNcPQyL6r+2jejYCyvqc5lneG69kTtYU/YPx1waDp/Jap/bhS36G6h
 r+YQSSFJf9kQPIQ==
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
index 156e17a3ebc6b..fd01e922b4394 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3925,7 +3925,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3953,7 +3953,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3979,7 +3979,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4005,7 +4005,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4031,7 +4031,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4057,7 +4057,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4083,7 +4083,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}

-- 
2.54.0

