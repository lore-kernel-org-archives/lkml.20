Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7673AFAED;
	Wed, 16 Sep 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571707; cv=none; b=c9ILrzDkJy/DBEdDZWuWg7xRVrDqbZKVe1UiGXy/fCiwBrIq7/ufgUbtole4WOleqeDidWVL/hopjmVmU9FS1hH2pkYr7ebxQodSE9bsM4ppi0mYlgBRONHdfkKGDiNC9ZIbRzst2uT1jy9A5sG6uuIza+bxCKIDFqXf0RxazfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571707; c=relaxed/simple;
	bh=ygtkTR8WXgTZZeBapS+R9oHRk6VqN+yFXE46h+6kcms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlkAGQPysVM0VTZSgmf+kKdJo0GPL8egAJYeykqaRwBPls9krQPrxJzN2krGPq+QSqFgOoe3mHzK6I10BhBQ1vmYVm32Y05YJkYhn6kRLnskzHZvfVDTOKkCxQc19/pqFOwceToG32Tn4QH9i2WG7f2m5GmfLqL71Ll1bKIAPH0=
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D4618205A07;
	Wed, 16 Sep 2026 17:14:58 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGk-001Fsx-2z;
	Wed, 16 Sep 2026 17:09:54 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:53 +0200
Subject: [PATCH v2 12/17] media: rockchip: rga: move rockchip_rga
 allocation to master probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-12-23aa2cb74e61@pengutronix.de>
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

Move the rockchip_rga struct allocation to the master component probe
function in preparation of enabling all cores. This also adjusts the
allocation to use the actual number of cores found in the of tree
instead of being fixed to one core.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 367df0ee7b02f..37ccac5b406a4 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -741,7 +741,7 @@ static int rga_parse_dt(struct rga_core *core)
 static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct rockchip_rga *rga;
+	struct rockchip_rga *rga = data;
 	struct rga_core *core;
 	struct video_device *vfd;
 	int ret = 0;
@@ -750,17 +750,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	rga = devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->cores), GFP_KERNEL);
-	if (!rga)
-		return -ENOMEM;
-
-	rga->hw = of_device_get_match_data(&pdev->dev);
-	if (!rga->hw)
-		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
-
-	spin_lock_init(&rga->ctrl_lock);
-	mutex_init(&rga->mutex);
-
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
 	if (!core)
 		return -ENOMEM;
@@ -941,9 +930,10 @@ static struct platform_driver rga_core_pdrv = {
 
 static int rga_bind(struct device *dev)
 {
+	struct rockchip_rga *rga = dev_get_drvdata(dev);
 	int ret;
 
-	ret = component_bind_all(dev, NULL);
+	ret = component_bind_all(dev, rga);
 	if (ret) {
 		dev_err(dev, "component bind failed\n");
 		return ret;
@@ -968,6 +958,8 @@ static int rga_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct component_match *match = NULL;
 	struct device_node *core_node;
+	struct rockchip_rga *rga;
+	u8 num_cores = 0;
 
 	if (!match_desc)
 		return dev_err_probe(dev, -ENODEV, "missing platform data\n");
@@ -979,6 +971,7 @@ static int rga_probe(struct platform_device *pdev)
 		of_node_get(core_node);
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
+		num_cores++;
 
 		/*
 		 * As multi core is not implemented yet,
@@ -989,6 +982,19 @@ static int rga_probe(struct platform_device *pdev)
 		break;
 	}
 
+	rga = devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cores), GFP_KERNEL);
+	if (!rga)
+		return -ENOMEM;
+
+	rga->hw = match_desc->data;
+	if (!rga->hw)
+		return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
+
+	spin_lock_init(&rga->ctrl_lock);
+	mutex_init(&rga->mutex);
+
+	dev_set_drvdata(dev, rga);
+
 	return component_master_add_with_match(dev, &rga_master_ops, match);
 }
 

-- 
2.55.0

