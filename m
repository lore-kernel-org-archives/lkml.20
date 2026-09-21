Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31082D73B8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996733; cv=none; b=iXipE/9mY9AicfBxFytiDIWkwj1yggva9PGUxGpghoDIDIX8evoGggt+Elvy+kK/gOpZuHAP0ONrQHdQYzRO4+70LMyAhs++E5F8NdPlprFLFYApAN72gdgm2TGD42wDRAqB4Sb//PI5dcNxqMhDc5obZPmdh0Bh7z7inH7k6Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996733; c=relaxed/simple;
	bh=jZuypoR3MOk4j8mwbMkBfCH9ChVQWIYrvhrSN9ratfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzGrlYd1kusE/PaLvjOxw9KB/tf46KosYNLe3+6Kc2Qn+ngj1KZ2vWDTGD06slZiYN4p89wRbr5LMY0UhbuicISvC+wg6loaJICkhyJWQHIeWQRMEO+DT7GAn12GT7xEyBtIonv3u/F0kPrK8VEYYhrVtKJPWtSc7QRwvuSmXEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6OyIMIs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6OyIMIs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so15231395e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996730; x=1790601530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBUilLABy+haqxmyNuDtxCS558jv0OslZcYLXXiBzgY=;
        b=c6OyIMIsGe05AHzfBsd4SD78J33jAz/dhmlLCiGZp03z/o4Y8SRRGr1D005P1zpc7c
         y+C3nb+5NodzcO8/bkTYrcTXaHzbgKY7qfE7PaJSoQMmiTem5e5Mdmo0oUwSK33Pjqvx
         EGKhZbtdmlbbQ/Pd7wa6Wa94CANgzS8OQSJ85l5+MmV7cvGz81sFrjLTc/JNX5D/jBqc
         LIUYf6RgALEs3RGEBd66U6faJDR1xbtPFTnMLggR7EAt55TO/CvBKUyDU/ADGlywYR2c
         U9xD9AqEp1QTOOUK9kaGQ20xkFyh8eUBbi8KItptZGcNdpEhZO7GS8smN4wYIU8iyMGV
         be2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996730; x=1790601530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBUilLABy+haqxmyNuDtxCS558jv0OslZcYLXXiBzgY=;
        b=xJQTM46XrDQFtlrmLQbpCEXO6Xx8G3I7MAU9g94JwdA4JNDguxC32Kkqi+DjAcUCFG
         E2CbrTiLl0fqIF+5fa4L0eSru6KT4So2zUz3vUxUHMXtfhtJQGcf1YI5oRo32IIrvZuF
         wj30H2KaV1nFGgzgSTH4aUTOJ0DYflg2x3fncLiv2XhIrY3ZhGnrR4g6afsxFfZznHZd
         R2cj9TYL9einDNabyfoNIy3PbZlr5nV4dxgqKkFBxZYobyXcnbPoTSEJxwcEsJpVE+yt
         Dw+LYr8MgHg9cnAIXuY5KOt7WbZxmszqLh+D9OTBXmn+OErLox+W/5IcvUM7k8eg15qC
         qXaA==
X-Forwarded-Encrypted: i=1; AKwUvBxy/HyKu9IXq1rBvnJgqQUHQjAaxMLrw1hgwyQapBqYVhTnQBfTudJUmrG/AcHcBYXJorF0cxGEf3KnB98=@vger.kernel.org
X-Gm-Message-State: AFuF++m2NsmsGIZAwqzucBQ/q3bMHOuLGH2heZUVv+0JmQBmCfSjaJXl
	519vpgVJRFW4uvuMg46rnLpwximLCF8Qm0OdPahFJsy/oBsEE4n1fkPc
X-Gm-Gg: AYBFou27YEowVYe3A7ys9YrXN2KEkv9+X5f3tkBn/z2Bq/Sh+TCDnXKM9J0QD7oNhm2
	F4owwZu0pQl6EtiW3ywy+4wJEg0oqKByWPUsIiFLCMiX6FmEN8S6d5Wpg4N2pGbil0O0Y2I/HGA
	5W3RKaHUoWJRBKqM2LgZano2e7+0Kj1xRFSPvC+OGv+VGrCWJAseVnX054ypZ2t+2qkPzgO8WpQ
	1t12tfZbS6qit0HtkzP80KIVskETBXWXO7BmX+xpngHp/uskdFB3rt9uJwDE0mB91WPQiUAkTz0
	TBSGczZMEpxoj4KahhoqFtgCIz3aS73n5bwHSisp11r80ot6y+PZOkId68OYVDsmFx68d250mZb
	KtY6pp7ox6N13o4HBsIDNsJOnPJ66xilfj+ApcS01yds1J9u/nRSjoDM1VUxe/2iyhE8bs4w8ka
	Z3uR8QOYU218rIZSAM8WDKYBb/xPtj9pYBknFQB5MF0SJKbFfIN6aVJzjT6UgLG1fcYbdymqknM
	ETU38EWBamk75Lifa8DbuBlOcOfZ0RRfQ==
X-Received: by 2002:a05:600c:c1c8:10b0:49e:81a7:9fbc with SMTP id 5b1f17b1804b1-49fc574aacbmr107980195e9.24.1789996729754;
        Mon, 21 Sep 2026 06:18:49 -0700 (PDT)
Received: from osama.. ([156.223.80.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm22198797f8f.11.2026.09.21.06.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:18:49 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v7 1/3] drm/panel: Use devm_mipi_dsi_attach in BOE panels
Date: Mon, 21 Sep 2026 15:17:55 +0200
Message-ID: <e9b653b02636c19b60d1153ee78284a8b915df3c.1789994813.git.osama.abdelkader@gmail.com>
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

Use the managed MIPI DSI attach and panel add helpers in BOE panel drivers
and drop the corresponding manual detach and panel remove calls from
remove paths.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 19 ++++-----------
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  | 23 ++----------------
 drivers/gpu/drm/panel/panel-boe-td4320.c      | 23 ++++--------------
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 24 ++++++-------------
 .../gpu/drm/panel/panel-boe-tv101wum-ll2.c    | 23 ++++--------------
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 24 ++-----------------
 6 files changed, 25 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 84c21c62a43e..e9519923c6d8 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -357,9 +357,11 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(boe->panel.backlight),
 				     "Failed to create backlight\n");
 
-	drm_panel_add(&boe->panel);
+	ret = devm_drm_panel_add(dev, &boe->panel);
+	if (ret)
+		return ret;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
 		return ret;
@@ -368,18 +370,6 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void boe_bf060y8m_aj0_remove(struct mipi_dsi_device *dsi)
-{
-	struct boe_bf060y8m_aj0 *boe = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
-	drm_panel_remove(&boe->panel);
-}
-
 static const struct of_device_id boe_bf060y8m_aj0_of_match[] = {
 	{ .compatible = "boe,bf060y8m-aj0" },
 	{ /* sentinel */ }
@@ -388,7 +378,6 @@ MODULE_DEVICE_TABLE(of, boe_bf060y8m_aj0_of_match);
 
 static struct mipi_dsi_driver boe_bf060y8m_aj0_driver = {
 	.probe = boe_bf060y8m_aj0_probe,
-	.remove = boe_bf060y8m_aj0_remove,
 	.driver = {
 		.name = "panel-sw43404-boe-fhd-amoled",
 		.of_match_table = boe_bf060y8m_aj0_of_match,
diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 4a8560b4b899..facf37bd1c14 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -851,9 +851,7 @@ static int panel_add(struct panel_info *pinfo)
 	if (ret)
 		return ret;
 
-	drm_panel_add(&pinfo->base);
-
-	return 0;
+	return devm_drm_panel_add(dev, &pinfo->base);
 }
 
 static int panel_probe(struct mipi_dsi_device *dsi)
@@ -881,23 +879,7 @@ static int panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	err = mipi_dsi_attach(dsi);
-	if (err < 0)
-		drm_panel_remove(&pinfo->base);
-
-	return err;
-}
-
-static void panel_remove(struct mipi_dsi_device *dsi)
-{
-	struct panel_info *pinfo = mipi_dsi_get_drvdata(dsi);
-	int err;
-
-	err = mipi_dsi_detach(dsi);
-	if (err < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
-
-	drm_panel_remove(&pinfo->base);
+	return devm_mipi_dsi_attach(&dsi->dev, dsi);
 }
 
 static struct mipi_dsi_driver panel_driver = {
@@ -906,7 +888,6 @@ static struct mipi_dsi_driver panel_driver = {
 		.of_match_table = panel_of_match,
 	},
 	.probe = panel_probe,
-	.remove = panel_remove,
 };
 module_mipi_dsi_driver(panel_driver);
 
diff --git a/drivers/gpu/drm/panel/panel-boe-td4320.c b/drivers/gpu/drm/panel/panel-boe-td4320.c
index 23558a76dd72..73b762817e3e 100644
--- a/drivers/gpu/drm/panel/panel-boe-td4320.c
+++ b/drivers/gpu/drm/panel/panel-boe-td4320.c
@@ -202,29 +202,17 @@ static int boe_td4320_probe(struct mipi_dsi_device *dsi)
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
 
-static void boe_td4320_remove(struct mipi_dsi_device *dsi)
-{
-	struct boe_td4320 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct of_device_id boe_td4320_of_match[] = {
 	{ .compatible = "boe,td4320" },
 	{ /* sentinel */ }
@@ -233,7 +221,6 @@ MODULE_DEVICE_TABLE(of, boe_td4320_of_match);
 
 static struct mipi_dsi_driver boe_td4320_driver = {
 	.probe = boe_td4320_probe,
-	.remove = boe_td4320_remove,
 	.driver = {
 		.name = "panel-boe-td4320",
 		.of_match_table = boe_td4320_of_match,
diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index a70a2e58f88c..c5f18e310b43 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -391,25 +391,16 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
-	drm_panel_add(&ctx->panel);
-
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
-		dev_err_probe(&dsi->dev, ret,
-			      "Failed to attach panel to DSI host\n");
-		drm_panel_remove(&ctx->panel);
+	ret = devm_drm_panel_add(&dsi->dev, &ctx->panel);
+	if (ret)
 		return ret;
-	}
 
-	return 0;
-}
-
-static void boe_th101mb31ig002_dsi_remove(struct mipi_dsi_device *dsi)
-{
-	struct boe_th101mb31ig002 *ctx = mipi_dsi_get_drvdata(dsi);
+	ret = devm_mipi_dsi_attach(&dsi->dev, dsi);
+	if (ret < 0)
+		return dev_err_probe(&dsi->dev, ret,
+				     "Failed to attach panel to DSI host\n");
 
-	mipi_dsi_detach(dsi);
-	drm_panel_remove(&ctx->panel);
+	return 0;
 }
 
 static const struct of_device_id boe_th101mb31ig002_of_match[] = {
@@ -431,7 +422,6 @@ static struct mipi_dsi_driver boe_th101mb31ig002_driver = {
 		.of_match_table = boe_th101mb31ig002_of_match,
 	},
 	.probe = boe_th101mb31ig002_dsi_probe,
-	.remove = boe_th101mb31ig002_dsi_remove,
 };
 module_mipi_dsi_driver(boe_th101mb31ig002_driver);
 
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
index 20b6e11a7d84..8a6c4d5c6320 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
@@ -198,29 +198,17 @@ static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
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
 
-static void boe_tv101wum_ll2_remove(struct mipi_dsi_device *dsi)
-{
-	struct boe_tv101wum_ll2 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
-
-	drm_panel_remove(&ctx->panel);
-}
-
 static const struct of_device_id boe_tv101wum_ll2_of_match[] = {
 	{ .compatible = "boe,tv101wum-ll2" },
 	{ /* sentinel */ }
@@ -229,7 +217,6 @@ MODULE_DEVICE_TABLE(of, boe_tv101wum_ll2_of_match);
 
 static struct mipi_dsi_driver boe_tv101wum_ll2_driver = {
 	.probe = boe_tv101wum_ll2_probe,
-	.remove = boe_tv101wum_ll2_remove,
 	.driver = {
 		.name = "panel-boe-tv101wum_ll2",
 		.of_match_table = boe_tv101wum_ll2_of_match,
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 150dff3ab6c3..cf9f15fae272 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1736,9 +1736,7 @@ static int boe_panel_add(struct boe_panel *boe)
 	boe->base.funcs = &boe_panel_funcs;
 	boe->base.dev = &boe->dsi->dev;
 
-	drm_panel_add(&boe->base);
-
-	return 0;
+	return devm_drm_panel_add(dev, &boe->base);
 }
 
 static int boe_panel_probe(struct mipi_dsi_device *dsi)
@@ -1765,24 +1763,7 @@ static int boe_panel_probe(struct mipi_dsi_device *dsi)
 
 	mipi_dsi_set_drvdata(dsi, boe);
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret)
-		drm_panel_remove(&boe->base);
-
-	return ret;
-}
-
-static void boe_panel_remove(struct mipi_dsi_device *dsi)
-{
-	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = mipi_dsi_detach(dsi);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
-
-	if (boe->base.dev)
-		drm_panel_remove(&boe->base);
+	return devm_mipi_dsi_attach(&dsi->dev, dsi);
 }
 
 static const struct of_device_id boe_of_match[] = {
@@ -1820,7 +1801,6 @@ static struct mipi_dsi_driver boe_panel_driver = {
 		.of_match_table = boe_of_match,
 	},
 	.probe = boe_panel_probe,
-	.remove = boe_panel_remove,
 };
 module_mipi_dsi_driver(boe_panel_driver);
 
-- 
2.43.0

