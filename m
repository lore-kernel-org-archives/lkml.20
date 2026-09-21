Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682D49BD94
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996752; cv=none; b=jIFNfDbqB5JM6v8WCH93VFeKBmiJOTPU6I2iauFcKYwLzjtHp2yd2zkrwtY/zdLYxyvniPHBmrMFC6Pm77q5DaFZqPhEJpv87WoiFC31CJJdvmq0wE7p5zI8joFGvIGkIJRivdRLIT2dhkFxN1ith7iRCt7r/nZPhb9dSpWeQow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996752; c=relaxed/simple;
	bh=sNysPI4cYYPHrZiQyC/ehfqych5/W+0Z8YOhjZiLKKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRW9Fye/sqlpWGsq/tjyL/aVU9779qqanHNT/1n7KLqKu1Lt45XZrEKqbtx+zrHhg+BN+0HGR5Kh0euywPcdY1T+iVpfBvrBt4+MX7ub87jNr+MEvulJjTRo1elCX7Dmzy7KnyVwIc+7VMtuEmTX8jhkI1wiZ6kzkpFg42bntvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYg3vVN6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYg3vVN6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so1951743f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996748; x=1790601548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBJLa2aJjw7TBYT1KdM93L6LJC/yf6Je94tOEx2rVZw=;
        b=dYg3vVN6duQRgdbLGBPU3FZcPx8DQNBoVRngpfOu4iCQk30jXrAI3g8VOJ65v4tVH9
         KmoUzanYiz7HUeisckQNB37rBq+ws35NV7VH0L6e3NN4mgj8oRZiPFeVI4dciQgAxina
         BPBoirojIoPDPG8RZXCjFedKk1tnCUR/+sjgestCWno26QUIVHLQ2cKqQG+V+2BDYdWM
         olfYY8NjzE39TIIiM19orRyiBg5DTpydGXAUnoz0qw11M16/4BK/9NzoU/VAOdc2DFdD
         9IrDagHPsTpRs8cH0v1AHHUxP2Y57Z1hOw+yLZFz/Y9Zd5SBGHcOZoabPtgI0t94j1zG
         evkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996748; x=1790601548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBJLa2aJjw7TBYT1KdM93L6LJC/yf6Je94tOEx2rVZw=;
        b=Gl/Jhvg3FDx5PmL3SxGh923lvbRqIRs8oeXJzfNqPhOb3e0kP7BBR62xnV7kBYhcgb
         TF6o9QdQNg0bjUsX+OzO/GWLEzmGQbX1W3z3XLAQ8QrvVm8r8lsSzlCL7bQer6nF2gXq
         OyamoHkvFQlIRkPSlEgUiwTTfJG1q0Bvq38msl/pTCuAhnR9x4r+i6Z2XkG5EDaqabDj
         N81Ogmwx8VRHAhF00IvAaZMF5z5AGohTq7mf7recbOY84j+hFHZH7oAOII2bhtsphZU7
         2eBKOVHNV6gxyRNt542iXyaitAbO5D/z2aKqAnZUrv3+fyfMK1rAWEkwNvYp+zdQFQSZ
         q9eg==
X-Forwarded-Encrypted: i=1; AKwUvBwj/1wZ4navlIz775ITSxgXSU8gWdC3aGBYskB/7D0HEmllQpwXCB8uxYLPM5JKfHzN6rPefROCdoQaXm4=@vger.kernel.org
X-Gm-Message-State: AFuF++lW4r7P8zZleFOFHPEGCeE26j25xFl8JEcqjrm3nV2etj7OWLDW
	K0lujtu+JCsNRyulRTVG7YcvBVgBbwljCZUsuekEit9uCHLTHhqqwum/
X-Gm-Gg: AYBFou0ypYdaTWHwzkpVGbpsUz13vS542cv0JQEoqL89hLTWqYcloyTgGoYDqJ/rLgU
	lLhs+IPUFEkZeL5yEOioqkW4Ounjrg9h5JMn8zJ2g//1sLbcZwExUB8GQ8UrGEzCR+s2KiXi1c+
	XG8fK4kJZYFWfmLDMf3Yfu0XcidlBqKiYYgEBzlcik0VmxeE/03vUZoWtNloSkIG23H+ljcwF/7
	h/zybHjT0YFx9it/1tptqKW3WQoGE5C4x+/h4wah0T9rbBocsa17ydSNgLFZzLsvb8uM35AdCWv
	+0V0gOxk4QGe4iep7NIKqaZ+TDvamH/OeqpaZb5/UlSsXE56vXFz2hxuSLeKbbq3j/CqmWX0g8i
	+TBdqpY9Dyr7CAB1MCBs3tx90d+x748Hgc3hi9UpLAvxFv8ILggrLITSna0tZjVuwbFGCfRfDIk
	rI5j223QFheaczhxqpLQKpbSY28YtPeLV30z+YfCjPoAZQrpE271nDVbyuTXGoH0FHhpHfCS7ux
	zmo4+Ck/lYsIxFzaSiynp7LYvqAL573HA==
X-Received: by 2002:a05:6000:4287:b0:485:8f2e:75ba with SMTP id ffacd0b85a97d-4871e269e82mr15123057f8f.34.1789996747751;
        Mon, 21 Sep 2026 06:19:07 -0700 (PDT)
Received: from osama.. ([156.223.80.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm22198797f8f.11.2026.09.21.06.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:19:07 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linusw@kernel.org>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Robert Chiras <robert.chiras@nxp.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v7 2/3] drm/panel: Use managed helpers in Novatek and Raydium panels
Date: Mon, 21 Sep 2026 15:17:56 +0200
Message-ID: <66eccc200bb4f5e26a3464a46448b1a4c03b53a6.1789994813.git.osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789994813.git.osama.abdelkader@gmail.com>
References: <cover.1789994813.git.osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the managed MIPI DSI attach and panel add helpers in Novatek and
Raydium panel drivers and drop the corresponding manual detach and panel
remove calls from remove paths.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v5:
- nt35510: keep manual attach/detach; remove() powers off after it. (Luca)
v4:
- Use devm_drm_panel_add() instead of drm_panel_add().

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 13 ++++++----
 drivers/gpu/drm/panel/panel-novatek-nt35532.c | 23 ++++-------------
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 19 +++-----------
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 25 ++-----------------
 .../gpu/drm/panel/panel-novatek-nt36672e.c    | 21 ++++------------
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 23 ++++-------------
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 23 ++++-------------
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 22 +++-------------
 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 23 ++++-------------
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 16 +++---------
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 20 +++------------
 11 files changed, 49 insertions(+), 179 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 3189d89c7ca0..86d1a19afb7b 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -1173,11 +1173,13 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 		nt->panel.backlight = bl;
 	}
 
-	drm_panel_add(&nt->panel);
+	ret = devm_drm_panel_add(dev, &nt->panel);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0)
-		drm_panel_remove(&nt->panel);
+		return ret;
 
 	return 0;
 }
@@ -1187,13 +1189,14 @@ static void nt35510_remove(struct mipi_dsi_device *dsi)
 	struct nt35510 *nt = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	mipi_dsi_detach(dsi);
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
 	/* Power off */
 	ret = nt35510_power_off(nt);
 	if (ret)
 		dev_err(&dsi->dev, "Failed to power off\n");
-
-	drm_panel_remove(&nt->panel);
 }
 
 /*
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35532.c b/drivers/gpu/drm/panel/panel-novatek-nt35532.c
index edea766a3c44..752144220514 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35532.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35532.c
@@ -752,29 +752,17 @@ static int nt35532_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
-		drm_panel_remove(&ctx->panel);
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
-	}
 
 	return 0;
 }
 
-static void nt35532_remove(struct mipi_dsi_device *dsi)
-{
-	struct novatek_nt35532 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct of_device_id nt35532_of_match[] = {
 	{ .compatible = "flipkart,rimob-panel-nt35532-cs", .data = &rimob_panel_desc },
 	{ /* sentinel */ }
@@ -783,7 +771,6 @@ MODULE_DEVICE_TABLE(of, nt35532_of_match);
 
 static struct mipi_dsi_driver nt35532_driver = {
 	.probe = nt35532_probe,
-	.remove = nt35532_remove,
 	.driver = {
 		.name = "panel-novatek-nt35532",
 		.of_match_table = nt35532_of_match,
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 6e5173f98a22..be42eb9ef423 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -433,23 +433,11 @@ static int nt35560_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(nt->panel.backlight),
 				     "failed to register backlight device\n");
 
-	drm_panel_add(&nt->panel);
-
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
-		drm_panel_remove(&nt->panel);
+	ret = devm_drm_panel_add(dev, &nt->panel);
+	if (ret)
 		return ret;
-	}
-
-	return 0;
-}
-
-static void nt35560_remove(struct mipi_dsi_device *dsi)
-{
-	struct nt35560 *nt = mipi_dsi_get_drvdata(dsi);
 
-	mipi_dsi_detach(dsi);
-	drm_panel_remove(&nt->panel);
+	return devm_mipi_dsi_attach(dev, dsi);
 }
 
 static const struct of_device_id nt35560_of_match[] = {
@@ -467,7 +455,6 @@ MODULE_DEVICE_TABLE(of, nt35560_of_match);
 
 static struct mipi_dsi_driver nt35560_driver = {
 	.probe = nt35560_probe,
-	.remove = nt35560_remove,
 	.driver = {
 		.name = "panel-novatek-nt35560",
 		.of_match_table = nt35560_of_match,
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 464d9ce47d87..da466cdd9354 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -428,9 +428,7 @@ static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
 
-	drm_panel_add(&pinfo->base);
-
-	return 0;
+	return devm_drm_panel_add(dev, &pinfo->base);
 }
 
 static int nt36672a_panel_probe(struct mipi_dsi_device *dsi)
@@ -458,25 +456,7 @@ static int nt36672a_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	err = mipi_dsi_attach(dsi);
-	if (err < 0) {
-		drm_panel_remove(&pinfo->base);
-		return err;
-	}
-
-	return 0;
-}
-
-static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
-{
-	struct nt36672a_panel *pinfo = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
-
-	drm_panel_remove(&pinfo->base);
+	return devm_mipi_dsi_attach(&dsi->dev, dsi);
 }
 
 static const struct of_device_id tianma_fhd_video_of_match[] = {
@@ -491,7 +471,6 @@ static struct mipi_dsi_driver nt36672a_panel_driver = {
 		.of_match_table = tianma_fhd_video_of_match,
 	},
 	.probe = nt36672a_panel_probe,
-	.remove = nt36672a_panel_remove,
 };
 module_mipi_dsi_driver(nt36672a_panel_driver);
 
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index c5e00eb55722..85902338f10d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -561,27 +561,17 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 
 	ctx->panel.prepare_prev_first = true;
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
-		goto err_dsi_attach;
+		return ret;
 	}
 
 	return 0;
-
-err_dsi_attach:
-	drm_panel_remove(&ctx->panel);
-	return ret;
-}
-
-static void nt36672e_panel_remove(struct mipi_dsi_device *dsi)
-{
-	struct nt36672e_panel *ctx = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(ctx->dsi);
-	drm_panel_remove(&ctx->panel);
 }
 
 static const struct of_device_id nt36672e_of_match[] = {
@@ -599,7 +589,6 @@ static struct mipi_dsi_driver nt36672e_panel_driver = {
 		.of_match_table = nt36672e_of_match,
 	},
 	.probe = nt36672e_panel_probe,
-	.remove = nt36672e_panel_remove,
 };
 module_mipi_dsi_driver(nt36672e_panel_driver);
 
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37700f.c b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
index c221dd498fed..c2d219e52f6a 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
@@ -257,29 +257,17 @@ static int nt37700f_tianma_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
 				     "Failed to create backlight\n");
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
-		drm_panel_remove(&ctx->panel);
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
-	}
 
 	return 0;
 }
 
-static void nt37700f_tianma_remove(struct mipi_dsi_device *dsi)
-{
-	struct nt37700f_tianma *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct of_device_id nt37700f_tianma_of_match[] = {
 	{ .compatible = "novatek,nt37700f" },
 	{ /* sentinel */ }
@@ -288,7 +276,6 @@ MODULE_DEVICE_TABLE(of, nt37700f_tianma_of_match);
 
 static struct mipi_dsi_driver nt37700f_tianma_driver = {
 	.probe = nt37700f_tianma_probe,
-	.remove = nt37700f_tianma_remove,
 	.driver = {
 		.name = "panel-novatek-nt37700f",
 		.of_match_table = nt37700f_tianma_of_match,
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index 5e46c4c6d771..4db560b66f4d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -270,7 +270,9 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
 				     "Failed to create backlight\n");
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
 
 	/* This panel only supports DSC; unconditionally enable it */
 	dsi->dsc = &ctx->dsc;
@@ -283,27 +285,13 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
 	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
 	ctx->dsc.block_pred_enable = true;
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
-		drm_panel_remove(&ctx->panel);
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
-	}
 
 	return 0;
 }
 
-static void novatek_nt37801_remove(struct mipi_dsi_device *dsi)
-{
-	struct novatek_nt37801 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct of_device_id novatek_nt37801_of_match[] = {
 	{ .compatible = "novatek,nt37801" },
 	{}
@@ -312,7 +300,6 @@ MODULE_DEVICE_TABLE(of, novatek_nt37801_of_match);
 
 static struct mipi_dsi_driver novatek_nt37801_driver = {
 	.probe = novatek_nt37801_probe,
-	.remove = novatek_nt37801_remove,
 	.driver = {
 		.name = "panel-novatek-nt37801",
 		.of_match_table = novatek_nt37801_of_match,
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index 2af6aa47a551..62062ae0ebe3 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -590,26 +590,11 @@ static int rad_panel_probe(struct mipi_dsi_device *dsi)
 
 	dev_set_drvdata(dev, panel);
 
-	drm_panel_add(&panel->panel);
-
-	ret = mipi_dsi_attach(dsi);
-	if (ret)
-		drm_panel_remove(&panel->panel);
-
-	return ret;
-}
-
-static void rad_panel_remove(struct mipi_dsi_device *dsi)
-{
-	struct rad_panel *rad = mipi_dsi_get_drvdata(dsi);
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
+	ret = devm_drm_panel_add(dev, &panel->panel);
 	if (ret)
-		dev_err(dev, "Failed to detach from host (%d)\n", ret);
+		return ret;
 
-	drm_panel_remove(&rad->panel);
+	return devm_mipi_dsi_attach(dev, dsi);
 }
 
 static const struct of_device_id rad_of_match[] = {
@@ -624,7 +609,6 @@ static struct mipi_dsi_driver rad_panel_driver = {
 		.of_match_table = rad_of_match,
 	},
 	.probe = rad_panel_probe,
-	.remove = rad_panel_remove,
 };
 module_mipi_dsi_driver(rad_panel_driver);
 
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index b2ba006c06f6..e16f9ad6d193 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -420,29 +420,17 @@ static int raydium_rm67200_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0)
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
-		drm_panel_remove(&ctx->panel);
-	}
 
 	return ret;
 }
 
-static void raydium_rm67200_remove(struct mipi_dsi_device *dsi)
-{
-	struct raydium_rm67200 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach DSI host: %d\n", ret);
-
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct regulator_bulk_data w552793baa_regulators[] = {
 	{ .supply = "vdd", },		/*  2.8V */
 	{ .supply = "iovcc", },		/*  1.8V */
@@ -479,7 +467,6 @@ MODULE_DEVICE_TABLE(of, raydium_rm67200_of_match);
 
 static struct mipi_dsi_driver raydium_rm67200_driver = {
 	.probe = raydium_rm67200_probe,
-	.remove = raydium_rm67200_remove,
 	.driver = {
 		.name = "panel-raydium-rm67200",
 		.of_match_table = raydium_rm67200_of_match,
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index c535dc931903..f235cb4ae071 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -360,26 +360,19 @@ static int rm68200_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach() failed: %d\n", ret);
-		drm_panel_remove(&ctx->panel);
 		return ret;
 	}
 
 	return 0;
 }
 
-static void rm68200_remove(struct mipi_dsi_device *dsi)
-{
-	struct rm68200 *ctx = mipi_dsi_get_drvdata(dsi);
-
-	mipi_dsi_detach(dsi);
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct of_device_id raydium_rm68200_of_match[] = {
 	{ .compatible = "raydium,rm68200" },
 	{ }
@@ -388,7 +381,6 @@ MODULE_DEVICE_TABLE(of, raydium_rm68200_of_match);
 
 static struct mipi_dsi_driver raydium_rm68200_driver = {
 	.probe = rm68200_probe,
-	.remove = rm68200_remove,
 	.driver = {
 		.name = "panel-raydium-rm68200",
 		.of_match_table = raydium_rm68200_of_match,
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
index 8e9484768657..4065cdf690f9 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -315,7 +315,9 @@ static int rm692e5_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
 				     "Failed to create backlight\n");
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(dev, &ctx->panel);
+	if (ret)
+		return ret;
 
 	/* This panel only supports DSC; unconditionally enable it */
 	dsi->dsc = &ctx->dsc;
@@ -331,28 +333,15 @@ static int rm692e5_probe(struct mipi_dsi_device *dsi)
 	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
 	ctx->dsc.block_pred_enable = true;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
-		drm_panel_remove(&ctx->panel);
 		return ret;
 	}
 
 	return 0;
 }
 
-static void rm692e5_remove(struct mipi_dsi_device *dsi)
-{
-	struct rm692e5_panel *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct of_device_id rm692e5_of_match[] = {
 	{ .compatible = "fairphone,fp5-rm692e5-boe" },
 	{ }
@@ -361,7 +350,6 @@ MODULE_DEVICE_TABLE(of, rm692e5_of_match);
 
 static struct mipi_dsi_driver rm692e5_driver = {
 	.probe = rm692e5_probe,
-	.remove = rm692e5_remove,
 	.driver = {
 		.name = "panel-rm692e5-boe-amoled",
 		.of_match_table = rm692e5_of_match,
-- 
2.43.0

