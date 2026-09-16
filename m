Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675C3932C3;
	Wed, 16 Sep 2026 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571396; cv=none; b=Pan7qWqhBuqN+19OKdmHn+QKOIkDDz63BJNXP69MCkUl4RgFkpcQG7H0BJz+g8GTxUZfDXng5KpkNagbCMFNIh+B0YdjXfNOUQymXJ0VrjVDi+aqUsROTUgYwBYODFASXs33ZaV1nQsQPsIncvuxb3FAEJ58DHtZlTu0D/LKaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571396; c=relaxed/simple;
	bh=3DbUNM/U7+cBB1aeOYZgdZv12xTbkgeY4ZzAFCkBQKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQigG2K5RYhf3soioxTtFrXcI4FOcHF4aJaTgwZqUQRyfqNw+WxD4qDCH62XS65n9EsiXpaSNJ8i7r8naWZ6r5JEhPc39/pEJeC4SeHrHqHa7jxrN3o+qJsJOw7AZ4fCOOH2p0Hkw0CB6JIbWIYMTeyfm0/9QBSeKSBUMLHvZkA=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E87682059F3;
	Wed, 16 Sep 2026 17:09:49 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGf-001Fsx-2g;
	Wed, 16 Sep 2026 17:09:49 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:46 +0200
Subject: [PATCH v2 05/17] media: rockchip: rga: use devres version of
 pm_runtime_enable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-5-23aa2cb74e61@pengutronix.de>
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

Use the devres version of pm_runtime_enable named
devm_pm_runtime_enable to ease up the cleanup handling. Also it avoids
having a mixed cleanup order due to the following
devm_platform_ioremap_resource being cleaned up anyways after the probe
function has returned.

This also changes some dev_err calls to dev_err_probe for convenient
returning. This may not print these messages in the error case, as
dev_err_probe may handle them differently based on the error (e.g.
ENOMEM won't be printed).

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
v2
- added
---
 drivers/media/platform/rockchip/rga/rga.c | 34 +++++++++++--------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 8c03422d669cf..d7f0712177b70 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -797,37 +797,31 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
 
-	pm_runtime_enable(rga->dev);
+	ret = devm_pm_runtime_enable(rga->dev);
+	if (ret)
+		return ret;
 
 	rga->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(rga->regs)) {
-		ret = PTR_ERR(rga->regs);
-		goto err_put_clk;
-	}
+	if (IS_ERR(rga->regs))
+		return PTR_ERR(rga->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_put_clk;
-	}
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_irq(rga->dev, irq, rga_isr,
 			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
 			       dev_name(rga->dev), rga);
-	if (ret < 0) {
-		dev_err(rga->dev, "failed to request irq\n");
-		goto err_put_clk;
-	}
+	if (ret < 0)
+		return dev_err_probe(rga->dev, ret, "failed to request irq\n");
 
 	ret = dma_set_mask_and_coherent(rga->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(rga->dev, "32-bit DMA not supported");
-		goto err_put_clk;
-	}
+	if (ret)
+		dev_err_probe(rga->dev, ret, "32-bit DMA not supported");
 
 	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
 	if (ret)
-		goto err_put_clk;
+		return ret;
 	vfd = video_device_alloc();
 	if (!vfd) {
 		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
@@ -877,8 +871,6 @@ static int rga_probe(struct platform_device *pdev)
 	video_device_release(vfd);
 unreg_v4l2_dev:
 	v4l2_device_unregister(&rga->v4l2_dev);
-err_put_clk:
-	pm_runtime_disable(rga->dev);
 
 	return ret;
 }
@@ -892,8 +884,6 @@ static void rga_remove(struct platform_device *pdev)
 	v4l2_m2m_release(rga->m2m_dev);
 	video_unregister_device(rga->vfd);
 	v4l2_device_unregister(&rga->v4l2_dev);
-
-	pm_runtime_disable(rga->dev);
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)

-- 
2.55.0

