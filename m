Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D74380FD8;
	Wed, 16 Sep 2026 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571703; cv=none; b=HcmTgUX4tLu9ZcEU6bmJCIei4eFYTRYzX6Onx1d4NIS+Y7PST01o7qLs1JfQr+JAi9g/O+wowXB43rZCtL1cUYP9exuGaxGYPeANSsyRPEBFYWVCQkphpNY95Jpv7VvCEgXq/CgeDrhsGjMprgaD/mvnl/GPbH+TpI6DInuvW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571703; c=relaxed/simple;
	bh=fpzSuIufPZ56HXqu87ytoBKywkjsrqHiUe554CEMGsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8Ak4GqtRsMcmRnKDZz+i8XHbv7INB0AxqHYj2hHSdzPrXBp6YT9tQPm/c+kKCBn1xmzqXAiLN8ZlfMFDlsg5sKaq5sWXhxj2d6HjNTKEm7sKKxGHby3FUbdZVaKALulg7bwYCZUaWMPHA+KY4bhUTE2bKmlEbTtPlpZGVn+5z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7998C205A01;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGl-001Fsx-25;
	Wed, 16 Sep 2026 17:09:55 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:54 +0200
Subject: [PATCH v2 13/17] media: rockchip: rga: move core initialization
 from bind to probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-13-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2

Move the core initialization from the core binding function to the core
probing function. This better matches the actual sequence, where the
core probe initializes most things and the bind function just binds the
core to the actual rga struct from the master device.

As the probe has no rockchip_rga struct, it has to get the
rga_hw struct from the of match data to determine if the given core has
an iommu.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- indirectly fixed component_add error path not using goto err_put_clk
  by using devres version for pm (pointed out by Sashiko and Nicolas)
- reordered commit for a better diff
- Avoid NULL pointer deref when interrupt fires on an unbound core
---
 drivers/media/platform/rockchip/rga/rga.c | 97 ++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 37ccac5b406a4..fa34b93b1b7a5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -72,6 +72,10 @@ static irqreturn_t rga_isr(int irq, void *prv)
 	struct rga_core *core = prv;
 	struct rockchip_rga *rga = core->rga;
 
+	/* ignore interrupt on an unbound core */
+	if (!rga)
+		return IRQ_HANDLED;
+
 	if (rga->hw->handle_irq(core)) {
 		struct vb2_v4l2_buffer *src, *dst;
 		struct rga_ctx *ctx = core->curr;
@@ -740,55 +744,16 @@ static int rga_parse_dt(struct rga_core *core)
 
 static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct rockchip_rga *rga = data;
-	struct rga_core *core;
+	struct rga_core *core = dev_get_drvdata(dev);
 	struct video_device *vfd;
 	int ret = 0;
-	int irq;
-
-	if (!pdev->dev.of_node)
-		return -ENODEV;
-
-	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
-	if (!core)
-		return -ENOMEM;
 
 	core->rga = rga;
-	core->dev = &pdev->dev;
 
 	rga->cores[0] = core;
 
-	ret = rga_parse_dt(core);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
-
-	ret = devm_pm_runtime_enable(core->dev);
-	if (ret)
-		return ret;
-
-	pm_runtime_set_autosuspend_delay(core->dev, 50);
-	pm_runtime_use_autosuspend(core->dev);
-
-	core->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(core->regs))
-		return PTR_ERR(core->regs);
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_irq(core->dev, irq, rga_isr,
-			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
-			       dev_name(core->dev), core);
-	if (ret < 0)
-		return dev_err_probe(core->dev, ret, "failed to request irq\n");
-
-	ret = dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
-	if (ret)
-		dev_err_probe(core->dev, ret, "32-bit DMA not supported");
-
-	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
+	ret = v4l2_device_register(dev, &rga->v4l2_dev);
 	if (ret)
 		return ret;
 	vfd = video_device_alloc();
@@ -804,7 +769,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	video_set_drvdata(vfd, rga);
 	rga->vfd = vfd;
 
-	platform_set_drvdata(pdev, core);
 	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
 	if (IS_ERR(rga->m2m_dev)) {
 		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
@@ -855,6 +819,8 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 	v4l2_m2m_release(rga->m2m_dev);
 	video_unregister_device(rga->vfd);
 	v4l2_device_unregister(&rga->v4l2_dev);
+
+	core->rga = NULL;
 }
 
 static const struct component_ops rga_core_ops = {
@@ -864,7 +830,54 @@ static const struct component_ops rga_core_ops = {
 
 static int rga_core_probe(struct platform_device *pdev)
 {
+	struct rga_core *core;
+	const struct rga_hw *hw;
 	int ret = 0;
+	int irq;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	hw = of_device_get_match_data(&pdev->dev);
+	if (!hw)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	core->dev = &pdev->dev;
+
+	ret = rga_parse_dt(core);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
+
+	ret = devm_pm_runtime_enable(core->dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(core->dev, 50);
+	pm_runtime_use_autosuspend(core->dev);
+
+	core->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->regs))
+		return PTR_ERR(core->regs);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(core->dev, irq, rga_isr,
+			       hw->has_internal_iommu ? 0 : IRQF_SHARED,
+			       dev_name(core->dev), core);
+	if (ret < 0)
+		return dev_err_probe(core->dev, ret, "failed to request irq\n");
+
+	ret = dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
+	if (ret)
+		dev_err_probe(core->dev, ret, "32-bit DMA not supported");
+
+	platform_set_drvdata(pdev, core);
 
 	ret = component_add(&pdev->dev, &rga_core_ops);
 	if (ret < 0)

-- 
2.55.0

