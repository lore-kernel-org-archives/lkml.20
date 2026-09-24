Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4032847FB19;
	Thu, 24 Sep 2026 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255108; cv=none; b=obKWqo0xCKZFNvgQgRE1Tr6aRPCbx7e92399bnwvrV7VAO/lhNIsMuXZ0jd3Ces0Zi9M5z2PwxkDc5gPxF8d8g844MFqwj/6Cu8qrZtCeuOFJ/FrMW3RvdndEohOOAE9TR/He29yPy+SH4TtdipfZqk2YgDFZYGKrJmSWAFBHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255108; c=relaxed/simple;
	bh=e07vGJYDWmQo+2xpujVitCrBoYhngsffPos8gfqif1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faTdyegiAa6lJEgKeZDqWNjtphwS0TLWi7psdg0ydH1oENs2ihQB/BXZBCKjhOQDchUzGD5WlTP7KoQnJeF9IqX5Ml7MGmhLJaRBPfpaMO5Y0hPyqt5SeLaV/YjItoXdRrGppq+ag81dZGVjN49BR8qahyUhDTbC805lDxBXCgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CyDhrSr5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CyDhrSr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790255100;
	bh=e07vGJYDWmQo+2xpujVitCrBoYhngsffPos8gfqif1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CyDhrSr5dU0anRlNNJd5aobYwLomFZVSlIVcMwTFtVFWSW99ke7lFCxaVBfZTOZxo
	 0egITSz9xLB63v4YIoSSeMjcUqy+uPjRf9I53G6kv3XvsW+jh9uucz7dUcb8/NjHjj
	 o7cF7iSNXg/dLIYvUxKnXY/6Kd3KM3+dKHVKP5/FXsHvQ0tc6ORMZjB1vZT4rm2Mny
	 9r3MAWsUVHE0UdpWT7padEzmQNXij4cK2yIVobvZarHVccDYzY0QQJaMBXz/prEGjQ
	 bp53CWi++LbuKxSfsffGWMiQKqYmWfWew6bCmZBys19rdVY2znudsme6vjpidT3brf
	 RWD7I1r/IX9Gg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E8BE17E089A;
	Thu, 24 Sep 2026 15:05:00 +0200 (CEST)
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
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 1/3] media: verisilicon: Remove deprecated variant
Date: Thu, 24 Sep 2026 15:04:51 +0200
Message-ID: <20260924130453.196299-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"nxp,imx8mq-vpu" is tagged as deprecated since:
commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
merged since v5.17-rc1.
There is more reference to it since that.
Remove for driver to clean up the code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v3:
- remove more dead code

changes in v2:
- have a separate patch for documentation
- rebased on v7.3-rc1

 .../media/platform/verisilicon/hantro_drv.c   |  10 --
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 105 ------------------
 2 files changed, 115 deletions(-)

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
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index fa4224de4b99..b091d807ae4e 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -25,55 +25,6 @@
 #define CTRL_G1_PP_FUSE		0x0c
 #define CTRL_G2_DEC_FUSE	0x10
 
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
@@ -234,45 +185,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
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
@@ -319,30 +235,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
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

