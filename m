Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977224ADD82
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487223; cv=none; b=G/WZnPkNJVO3QPLPlczuifnXooG6s1InnC29MUvUDPgO/WTtcV2Tf/m5bcXBCC88RjKduVufzDDzVDy62QQjf4i/TfEzIa/mn5/pa4O+pPo2jCmrmKkQaOevi05nN1O/w2DdZr3MPbY8RA2XBxXo2L5qFfNAL4z0KaV8YaNGTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487223; c=relaxed/simple;
	bh=jZuypoR3MOk4j8mwbMkBfCH9ChVQWIYrvhrSN9ratfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGqvSVq+v5+O+qc+0Eu2vZtjd7ZQ74F/l0VdrPbdbUX4zSswspLhF4PCcMBa64ONCekDCR0HzH9YNWyqbVig+3O7LpVwJP035VrmG9PgbGFXtpY5bXRmnr2NQRM/A0otsc2FwIW8qcvwW3rsit4CcZJedlAlbtWPfVkEg5RcTAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu7zRK7r; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu7zRK7r"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso2755005f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789487219; x=1790092019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBUilLABy+haqxmyNuDtxCS558jv0OslZcYLXXiBzgY=;
        b=fu7zRK7rpF6bOKFotdOH/d/jgPmPg3Dg44tdsMRf4pLK3R5E67I8cJYhgoe3erUT0T
         0jBJWVBhb6meJjChnjfmYRmx2qSn65sAUvqebPHWB46KOmV3f8TaMr1rYRjfv3pnVU1q
         K3vczsDG0MiARaBtdNSwBddTvmGBq7VwZ32x6JspIm6blRmqnURKR3F0v3phIHAASCra
         e1f5AXXz+fj61JI7QG2GS3MxXJL3IExsJ66k9CHfDL4jk7Q5SQ5ILXbO26G5tuBt4Ehf
         p1KVV5dpp3Nhi1gtgxmjoPa2t5ccrfQISixJ8iVII9Z6qpaKcTXsyhB8wYZa8Yt/WmoN
         jeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487219; x=1790092019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBUilLABy+haqxmyNuDtxCS558jv0OslZcYLXXiBzgY=;
        b=BL4IAiYOg6+2DEjtM/GOytoREz0KLLbOSCNRYzcwJxY35T4wm6WIghaHspGwQF1I5j
         m+qKPCFr8erCypgmeG/+3TxXtplpl6f9e+ulVQ7vv06lmKseZ9y5pXWADEmExcbeemle
         KVFHO01mmZ7WJzMlTJtWbG8nOu3RCi3Cj9IJU49w2gZy6EmfLW3Q3NnhxwxegYuZ6Fvs
         TxWA1i/y/kqBD9NXmxzrlDfKn8OLDW/cQKSg3obLoPPGgmStiauT0sjmMIsRBC/xCOGg
         awj/cPO20NdjQQBik93e7bDMrKCL5H+AhVEcrI/qxaOpKPnLRGBg88/8010s1Qj/z5hU
         PK+w==
X-Forwarded-Encrypted: i=1; AKwUvBxv+EH27vQ9lVY32JpvK7GDfaNEbNGLD2hZ/vZamrrYaiOPiR/tSVRyQHWAvUI4dKmK8INuTcvt4sUU3V8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyfA7wET0+2PgtWnWMJ3PgQSj8ZMHtYsrkrMGRY3V2rkLpLMyZ
	cGfIzlsNaFEyP6gVGzuzhhApSvRpuRXyDCmT3BKcwZtXCTp399RzZAET
X-Gm-Gg: AYBFou18jaJ0ShaIATQ0KTrd7++uDJ84Me/Scno/pfBlA5qvqBgp8fVAcLK0ZlulIk0
	fNuiDtyQc+0sxtdk2LYZDcdWOhNMu/14yC2zsbutOT1azD8sjkeAO2QkaObSfRQD/HOzIk1BDCj
	BJ8+9DhYAFHzhHjcA19175sajhsAs70IU8K40C87H8fzfmUEm1PUG1mYP5yxSMVKvndSxo+mPR+
	WjhE8N14Y33ZtWW97ZWgnDCsez7k6iGzKkZnRxZ+NUTpB8m0MuWM9il2EKcOiJQb27SfAS+JlUo
	akkZbg10kQybDWdHvjS0NPP+yIOEKTKcYqkJPt2+/pbTKUXK/2+0gvx1shXDgjG4Uo9pyqlZD5N
	0o/WEvInJeb8MLPixy9u9JwQnlH8EY1I8JE+LAYjULg8W1BqeiYWletgXs4uDSCLGlr8H2+BvSj
	Eaf87d6RrUF3wOl4qIwV6atQM8o7NK+zH+5gY37U2m5YknfmsgYKi2vGskm/PGqg/ZkMHaL08Af
	mHLB+OJjUYLIu/Ng2A3OOv95LE4y723aw==
X-Received: by 2002:a05:6000:25fd:b0:486:faa8:77f7 with SMTP id ffacd0b85a97d-48702ab91cbmr21236367f8f.9.1789487218515;
        Tue, 15 Sep 2026 08:46:58 -0700 (PDT)
Received: from osama.. ([156.223.70.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm34160468f8f.16.2026.09.15.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:46:58 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v6 1/3] drm/panel: Use devm_mipi_dsi_attach in BOE panels
Date: Tue, 15 Sep 2026 17:46:38 +0200
Message-ID: <20260915154644.104460-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915154644.104460-1-osama.abdelkader@gmail.com>
References: <20260915154644.104460-1-osama.abdelkader@gmail.com>
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

