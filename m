Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999AB5448A9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905061; cv=none; b=VajqfoLl+cOBDS0Xz8I26hsLs8QI5IQtWd6nUiIUI7uW7PqU+SKEnUUaJVkZAepqiT6QgbpbanSzUsi6CTTWvBQ90RPv+c2QHCBBywLZEZWYNR9/52R+fwA47zl4lvO8eGI6q46Cy4sWXW97Phwo+BO00JM2OoLpn5u8eDTU6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905061; c=relaxed/simple;
	bh=vA8a2AP2sVFDhrzZ90G8yMBik3wkgyW2BFzIqAbwroc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOfqbJ+JLQuIMEmOxhZjSXNpXgAZ66eJ/nnqmuAr8PNosl/XpFZykDMVQ4LT/NpbRMT+/ud2j/B+hYHgPEtoFtPlgyZ2LaonEBdAZNfnAA+7rJin9vqPEd7g0ktMGWtmNvTjkqP1ROKT8NnimRVhn/bsWH0DESEQljnYNUtU0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nTSna4sb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nTSna4sb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B909CC653F1;
	Tue, 13 Oct 2026 15:25:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E29460362;
	Tue, 13 Oct 2026 15:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D15B511D716D0;
	Tue, 13 Oct 2026 17:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CPKtQn2Ee6QRSaNvPNC634l+HMrpL7iwwERF0X97bgM=;
	b=nTSna4sbDzZPHSPRnafU2B8yzKzzUlRyU/Qm9+O85orOxPa8N4FTTXERjihSPc1POm9y5R
	hVchvfXUenQzClnyUdJZOYcm8nbC87p7uCFD7fahj4g/ONEdtaPr3rm23vWvYGuy13jsyA
	GNIwsCE3oQQ+72PxfacH/l3az33sE7+LAIWK6aQNse92LA1dobZ3UYhm5Xzr7PpV3/ncXf
	tOAksqBzm4yWZ38T7L9dmXNfpVJ1PmwYCA1FQ5fNFHZhgmBKBXGsJjSiwpVH+LpoHBRam4
	ytc0hFUK9JS4LzqcBi21UnIA00z5/b6niq+Kn9W/MCwyC1hJuLW6aHiSsj3A8Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 13 Oct 2026 17:23:56 +0200
Subject: [PATCH v3 3/3] drm/vc4: dpi: inline vc4_dpi_init_bridge() into
 vc4_dpi_bind()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-drm-fix-of_get_bridge-build-regression-v3-3-0b4c0b65be82@bootlin.com>
References: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com>
In-Reply-To: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

There isn't much benefit in this small static function. Inline it in the
caller.

Link: https://lore.kernel.org/lkml/accaa9f4ad05ef73071e5cfb5368fcbdd394d3ab.camel@bootlin.com/
Suggested-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index feefefcf3ad7..5439e73da0d4 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -278,26 +278,6 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
 	{}
 };
 
-/* Sets up the next link in the display chain */
-static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
-{
-	struct device *dev = &dpi->pdev->dev;
-
-	struct drm_bridge *bridge __free(drm_bridge_put) =
-		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
-	if (IS_ERR(bridge)) {
-		/* If nothing was connected in the DT, that's not an
-		 * error.
-		 */
-		if (PTR_ERR(bridge) == -ENODEV)
-			return 0;
-		else
-			return PTR_ERR(bridge);
-	}
-
-	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
-}
-
 static void vc4_dpi_disable_clock(void *ptr)
 {
 	struct vc4_dpi *dpi = ptr;
@@ -366,9 +346,20 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
-	ret = vc4_dpi_init_bridge(dpi);
-	if (ret)
-		return ret;
+	/* Set up the next link in the display chain */
+	struct drm_bridge *bridge __free(drm_bridge_put) =
+		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
+	if (IS_ERR(bridge)) {
+		/* If nothing was connected in the DT (-ENODEV), that's not
+		 * an error.
+		 */
+		if (PTR_ERR(bridge) != -ENODEV)
+			return PTR_ERR(bridge);
+	} else {
+		ret = drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
+		if (ret)
+			return ret;
+	}
 
 	dev_set_drvdata(dev, dpi);
 

-- 
2.56.0

