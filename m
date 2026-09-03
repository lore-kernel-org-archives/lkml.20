Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F242E420
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423145; cv=none; b=b6+W44k7ndsxLO963FPDeHd8/cdXd+clWizJKEKXORwYj4nrJjjNGFnIXmgkfa/Q6UMxOatXutLzLE1s9n228he9joUvp33zCo2wX72wzl2sN1hTBRn7qZMQRjlT6tLslNDCI7TNDL0rNjIgHPd1Z+Ql++e3p8jnizWkGSMOlJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423145; c=relaxed/simple;
	bh=KpPb45TZcVjYZv41RAyyBFmb8YZ1rSpyHDXoeZKKK1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAotj6r5LQzFYo33UcoUQgLeud054PbuwlNPTjArSmNoeL/lUXrBub5GXbI2AXuWutgO093edZH1pAmpbzijRSoeFnfRyM45c2aSNP4jAOHx1p46+Rle3iH8/PTSOPk3CwXld8NGEUtUCZJhq1uX2NgBUbHx6h3qHuZWyiI5Zzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1o2PoOZo; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1o2PoOZo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D3CE1A198F;
	Thu,  3 Sep 2026 08:12:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC319602B8;
	Thu,  3 Sep 2026 08:12:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8465211C79F4D;
	Thu,  3 Sep 2026 10:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pPgqqB8slFMQr5Kpl6JRMxMiHaZVEfJqqUfrSa3/Ilg=;
	b=1o2PoOZo+DtGsRxxzjrT/1G89edmkPpDh1cVQRxL3uqGp4HuRlWG43GBHQ6f1btv/8gp9U
	MiMJhkdNDKNRs2FSbDVqT4kxgHHGaBmi1N1qVNT9tSy5y4sm4Un+heWEE+W8NpWgkp6DXj
	MrQPO1F9zB2tGWr3iKlRxla1yVDcaTKHjJ3L3Ois+9XuEAs1GNsV7lDesKpvtaoOmJLCnT
	dFwfAXiuANQfmJFCbcz2iLm8DQEN/tIIxtJjxRBmc4AaEP6BmpCd3l0nQS2dmvyKqjzfs7
	Vnj0T4/37iuVTWbZOWjBez2Fb2c/N8lbqOiaHTdM/5DN6CXwYUk6s3ny94JUKA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Sep 2026 10:11:11 +0200
Subject: [PATCH RFC v2 08/19] drm/mcde: dsi: simplify device_node
 management using scoped for_each variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-drm-bridge-every-panel-v2-8-2ab8ee24538e@bootlin.com>
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
In-Reply-To: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Before further modifying this function, simpify the struct device_node
management using the scoped variat of for_each_available_child_of_node().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 694372581840..ce078aa3910f 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1076,7 +1076,6 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
-	struct device_node *child;
 	struct drm_panel *panel = NULL;
 	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 
@@ -1104,7 +1103,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	}
 
 	/* Look for a panel as a child to this node */
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		panel = of_drm_find_panel(child);
 		if (IS_ERR(panel)) {
 			dev_err(dev, "failed to find panel try bridge (%ld)\n",
@@ -1114,15 +1113,12 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			bridge = of_drm_find_and_get_bridge(child);
 			if (!bridge) {
 				dev_err(dev, "failed to find bridge\n");
-				of_node_put(child);
 				return -EINVAL;
 			}
 		}
 
-		if (panel || bridge) {
-			of_node_put(child);
+		if (panel || bridge)
 			break;
-		}
 	}
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,

-- 
2.55.0

