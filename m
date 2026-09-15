Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944647DD43;
	Tue, 15 Sep 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461730; cv=none; b=a+dMzP2P1SaL8o0KdfAya7Jay7MIas363dAdSf9RADsDM8BwOr7pOZdysZHZpEFqh1U+7YCbDkOw3nBxuqftLUYoQdUo8Xuh3zZk96MdVknQrW9qjiqixq7IRVUPNBsb66/57DMsvrCO/5K/bEY2tIHqcqLa0K4/pegJCT0nWcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461730; c=relaxed/simple;
	bh=6aKjiiiV3r+u+ttJGtnTE0DCvbNuV5aY0+blwbJlC64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByPIV2+N50mYfOvB+tbYIDOvDaTUALQTcVgG0uPDRlXMkBVcbviQpHABDAa2kzBYDHAfH0Z3nZ7ovGEsC7J4Gn/ljUiqbS8Z7PYTSAm41aeq47PSLHnfaaaGk0KRNB4R/DDVwGIjZX00TVpmiszZ/VRwJQKWoIqZW1NDdEJM86w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EY7ariHc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EY7ariHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461726;
	bh=6aKjiiiV3r+u+ttJGtnTE0DCvbNuV5aY0+blwbJlC64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EY7ariHcSosv9FXvURve5zifrtHUzlfN3bgGtelahL8mdbR/BGDVGJU0wEafcITP9
	 /x3pAPm9fpabSh0zFAD9bLrsAPtycUBH53UdLM/7czPIoEvVWuaRbxMizIxOpmWDc3
	 MtPMjUR8V9SHOSdvlhApP0kOaI2yCfzqOcKrCea0C5W2LGHd05+x160wZ0iceg+LSq
	 2zPURihIvH2P9OXPpTk6Pdi4RoqIdTzbUOtffFoIfgyeHseS4qupvkVc7NeOkwcinC
	 uRA2TnbIYgEOwM/R4rt539qM7T4Nl5zt1BvUsrfAoyHbDrOT1xMJzrzWgjfRXkpLT2
	 kpsMpY1rr7zCA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1506A17E125C;
	Tue, 15 Sep 2026 10:42:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 05/13] drm/mediatek: mtk_dsi: Enable interrupt at component bind time
Date: Tue, 15 Sep 2026 10:41:40 +0200
Message-ID: <20260915084148.11385-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having the DSI interrupt enabled before actually binding the DSI
component to the display controller driver is both useless and
dangerous: the main purpose of this interrupt is to signal CMD
done, LP RX data ready, or VideoMode done, or to reset the HW
engine if this doesn't come.

Should this interrupt come too late (during probe), the HW will
be reset only at the next occurrence of a timeout, which slows
down boot and may render artifacts to the DSI display.

Moreover, clearing the DSI interrupt while the display controller
is not ready yet, may result in an interrupt storm.

In order to prevent this from happening, request the interrupt
with IRQF_NO_AUTOEN, and enable it only when binding DSI to its
display controller component master.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0b167b4411e5..ef1638e77f00 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -225,6 +225,7 @@ struct mtk_dsi {
 	int refcount;
 	bool enabled;
 	bool lanes_ready;
+	int irq;
 	u32 irq_data;
 	wait_queue_head_t irq_wait_queue;
 	const struct mtk_dsi_driver_data *driver_data;
@@ -1101,6 +1102,8 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	enable_irq(dsi->irq);
+
 	return 0;
 }
 
@@ -1109,6 +1112,8 @@ static void mtk_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	disable_irq(dsi->irq);
+
 	drm_encoder_cleanup(&dsi->encoder);
 }
 
@@ -1342,7 +1347,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	int irq_num;
 	int ret;
 
 	dsi = devm_drm_bridge_alloc(dev, struct mtk_dsi, bridge,
@@ -1375,9 +1379,9 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->phy))
 		return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get MIPI-DPHY\n");
 
-	irq_num = platform_get_irq(pdev, 0);
-	if (irq_num < 0)
-		return irq_num;
+	dsi->irq = platform_get_irq(pdev, 0);
+	if (dsi->irq < 0)
+		return dsi->irq;
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
@@ -1386,17 +1390,15 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	ret = devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
+			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
 
-	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
-			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
-	if (ret) {
-		mipi_dsi_host_unregister(&dsi->host);
-		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
-	}
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.55.0

