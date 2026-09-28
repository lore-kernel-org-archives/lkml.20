Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8340E8FC;
	Mon, 28 Sep 2026 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582918; cv=none; b=IlBerKqY5i8lZOJPyGcfeUyBuDaLHsNHrN3eUMhRwBM8CT/mTx++dm0EM9kMeS5BhqSo6E7Ts3z88IQ4k23r0IxTHarv3HPn3nmrYN6yh8xjpT/nzAmK7qTloTPmPRnUO01K5OLCZ7NkWuFZqOJ9tvrOLG2qFHC3POA+HQiDGMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582918; c=relaxed/simple;
	bh=jV3uRqr6FAj1srTz2DJ0dS8I2habfLhFBG1upjKhQRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yw2Ubpva6oV7j7YnqgBuIoW12DLRpL8qTRqn8230S162Glpc8B6fw/E8964ILNJUyF0WnzFL8ElfmgQoAvWJ2+viezB7uGg8JJUBJZ/HOnYCYVDZuOTeDLVEkXFL0H7Bi8G1f5xWWKZwQ4HzV60ulEPe/suAPXN1cCLE/4lC/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ibK+YQwb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ibK+YQwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790582908;
	bh=jV3uRqr6FAj1srTz2DJ0dS8I2habfLhFBG1upjKhQRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibK+YQwbjUjtWA1Tq8Uzw/q6YYJA5PZfvdvBqKR3kcL2tiuC/ue89ZmFXkNzPeO2u
	 etOQoWcPHKT+xdO7GxS/5ptpmFfcKlm6DaWSQ4fFaxSx42cAZq5Og5dHU7zTyobSpn
	 kgNjx2rLcvOrmYtvd3QOuJfaigN7L3PyDcYO7k3Y/9t9ppy7DXJl+OQ5XGY5GEMCzQ
	 oc6h5bPx0E/ijyMm9StxnLPi9QWWiCz1DaoBIvdgICnezofFNJDXmYWACxYhF+2tWp
	 cU6mZZO31oJkY/UVY7N8PhOxZSPHQnP1fU/dpFnb1eqR476TbGEYz6PMdtDXkoiiDd
	 KUmALCHBkP4mg==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2553417E015A;
	Mon, 28 Sep 2026 10:08:28 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v5 1/3] media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant
Date: Mon, 28 Sep 2026 10:08:20 +0200
Message-ID: <20260928080822.19553-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"nxp,imx8mq-vpu" is tagged as deprecated since:
commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
merged since v5.17-rc1. There is more reference to it since that.
Remove for driver to clean up the code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_drv.c   |  10 --
 .../media/platform/verisilicon/hantro_hw.h    |   1 -
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
 3 files changed, 128 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index ad71c0402ef3..12c804dcc669 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -725,7 +725,6 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
-	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
 	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
 	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
 #endif
@@ -1100,15 +1099,6 @@ static int hantro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/*
-	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
-	 * but it's deprecated. Please update your DTS file to use
-	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
-	 */
-	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
-		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
-			 match->compatible);
-
 	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
 
 	vpu->clocks = devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..865de26ffbce 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -405,7 +405,6 @@ enum hantro_enc_fmt {
 extern const struct hantro_variant imx8mm_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
-extern const struct hantro_variant imx8mq_vpu_variant;
 extern const struct hantro_variant px30_vpu_variant;
 extern const struct hantro_variant rk3036_vpu_variant;
 extern const struct hantro_variant rk3066_vpu_variant;
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index fa4224de4b99..0d6a71ae5f45 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -13,67 +13,6 @@
 #include "hantro_g1_regs.h"
 #include "hantro_g2_regs.h"
 
-#define CTRL_SOFT_RESET		0x00
-#define RESET_G1		BIT(1)
-#define RESET_G2		BIT(0)
-
-#define CTRL_CLOCK_ENABLE	0x04
-#define CLOCK_G1		BIT(1)
-#define CLOCK_G2		BIT(0)
-
-#define CTRL_G1_DEC_FUSE	0x08
-#define CTRL_G1_PP_FUSE		0x0c
-#define CTRL_G2_DEC_FUSE	0x10
-
-static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
-{
-	u32 val;
-
-	/* Assert */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val &= ~reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
-
-	udelay(2);
-
-	/* Release */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val |= reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
-}
-
-static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
-{
-	u32 val;
-
-	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
-	val |= clock_bits;
-	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
-}
-
-static int imx8mq_runtime_resume(struct hantro_dev *vpu)
-{
-	int ret;
-
-	ret = clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
-	if (ret) {
-		dev_err(vpu->dev, "Failed to enable clocks\n");
-		return ret;
-	}
-
-	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2);
-	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
-
-	/* Set values of the fuse registers */
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
-
-	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
-
-	return 0;
-}
-
 /*
  * Supported formats.
  */
@@ -234,45 +173,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	},
 };
 
-static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
-{
-	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
-
-	return 0;
-}
-
-static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	imx8m_soft_reset(vpu, RESET_G1);
-}
-
 /*
  * Supported codec ops.
  */
 
-static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
-	[HANTRO_MODE_MPEG2_DEC] = {
-		.run = hantro_g1_mpeg2_dec_run,
-		.reset = imx8m_vpu_g1_reset,
-		.init = hantro_mpeg2_dec_init,
-		.exit = hantro_mpeg2_dec_exit,
-	},
-	[HANTRO_MODE_VP8_DEC] = {
-		.run = hantro_g1_vp8_dec_run,
-		.reset = imx8m_vpu_g1_reset,
-		.init = hantro_vp8_dec_init,
-		.exit = hantro_vp8_dec_exit,
-	},
-	[HANTRO_MODE_H264_DEC] = {
-		.run = hantro_g1_h264_dec_run,
-		.reset = imx8m_vpu_g1_reset,
-		.init = hantro_h264_dec_init,
-		.exit = hantro_h264_dec_exit,
-	},
-};
-
 static const struct hantro_codec_ops imx8mq_vpu_g1_codec_ops[] = {
 	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = hantro_g1_mpeg2_dec_run,
@@ -319,30 +223,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
 	{ "g2", hantro_g2_irq },
 };
 
-static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
-static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
 static const char * const imx8mq_g1_clk_names[] = { "g1" };
 static const char * const imx8mq_g2_clk_names[] = { "g2" };
 
-const struct hantro_variant imx8mq_vpu_variant = {
-	.dec_fmts = imx8m_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
-	.postproc_fmts = imx8m_vpu_postproc_fmts,
-	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
-	.postproc_ops = &hantro_g1_postproc_ops,
-	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
-		 HANTRO_H264_DECODER,
-	.codec_ops = imx8mq_vpu_codec_ops,
-	.init = imx8mq_vpu_hw_init,
-	.runtime_resume = imx8mq_runtime_resume,
-	.irqs = imx8mq_irqs,
-	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
-	.clk_names = imx8mq_clk_names,
-	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
-	.reg_names = imx8mq_reg_names,
-	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
-};
-
 static const struct of_device_id imx8mq_vpu_shared_resources[] = {
 	{ .compatible = "nxp,imx8mq-vpu-g1", },
 	{ .compatible = "nxp,imx8mq-vpu-g2", },
-- 
2.53.0

