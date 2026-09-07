Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D135272621
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 00:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788741819; cv=none; b=K+6I/ooQjF/scm9tlPVcMIOZvzNqBBlPU2JwwV53HyMMbfDTl7s1sQPRbvXmyXBXChLc9Oo12iEeaeYfbwA5iJEmUi70HrvRR7cpSbxFQV8I85Hw4lV38wxiHeq1KZo07hQIB4BQ7MR+ewhlbtw1vbSwhS9/v8Fb9sKSlhTrS+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788741819; c=relaxed/simple;
	bh=6L3LDFagaQCsDfVP0FJBsSxZ5m4twcTw1LREZtZc5wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETBCgivZHkR4sQGiuZfhHaZTBuqLma3SzsUsV3Det8cVArNKl4Sllwcj5Wt+XUTEb/0R0V3bxWy3uJivpw71zWh+/CW/tfD3HO8sBryZ/J7ejp3x/5wIXfKm82G3mrmS1ALCBSFuHb8jDTyRF5L1f05HgKKR6Q6CEZJlrFLpjcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5OuFHgn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5OuFHgn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so3646771a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788741817; x=1789346617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0x88oH7CrnZpFAXii2e1khx4b7zho7HKvH8FBEonEo=;
        b=p5OuFHgn0jMWqbxMSI1WXsUfM+ifigK/Zo/5/lRcP5Ml/uXrzG9+xkAxDO6mnC/FxL
         Aup0onlDgArehGK207qyvOdX+vdTH/TgtN7Qz4kZXbeLN7IIBv5LHgjU32Gxl+ExnvsU
         9v0EzRKQ3BgSCV4E9qKoE7hPmFnAk2VfZZ5zZEbhAPBuqr/kTkcw44euDjCbNHbvvfHA
         uMQIJyCTwDbLUJ9QyNOGstv35GXV8oDWANXD2uLL5JEqQrYxmWg1DWMT6taw3C5Gk1K/
         wcL3qNXKREH3VFkE6EJtTyvbVC/+p1TfTeWDqgTe9W8SzMIEJLnXiO4Bj3dknl+nRlh+
         Hxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788741817; x=1789346617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0x88oH7CrnZpFAXii2e1khx4b7zho7HKvH8FBEonEo=;
        b=d6GsGsnH/jqplL3ZR9Q+/y/II9tsQX8j6c7SMK89a0i9F7XK39nlbIhE2CJwu9IqPc
         53uU95MZcOVfHFsGLiNSVc0kObYCsO818HEuQLrFT6dplKATMC3GYhema4+C/pZXafAe
         J0K36d/0mhmWXVxyUxgvcYlAorbD6EViWmI+4x7CDOUkc38tRTIsbGUvbiW0ypNUTJc+
         6uFGcuFHkIQz7vqG4OJJpcXK9KHbJyvL+u8v34uHZYtOHkL8XYLmQ63vrk4hNwpPlywF
         sEHpu4UEqhvxmwtx/aWSAX0JRr5Ppl5Ymdtw+lr5v1jrDxIjvVX2sDnpc/Qn822YfU0r
         vXPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc8Ku10nRddzBx+yMZzPHbJTdFp504vndxNACp7pUFa0GJCOEiFk8ZkJbrU74KR018wxrkiAn+PMMqOQo=@vger.kernel.org
X-Gm-Message-State: AFuF++mZvwcWEcptR7bOjWxJywYCVTMA1ed6/PsAG726Nu72nVItG21+
	tST2S9GoOEAUny17DIL6ze6mww+628HNJvY8jY60joiPVJJgGYyfA0w5
X-Gm-Gg: AYBFou1OgkearzerFdE75UFKW5s6LEmVpBqF1LJ0G7haHD9g4nculnvhNMAX8rpvGKO
	/YzFYuwTw9V/oR0H61N/d+mUCwfwry5mYy+a1HHnOPzj/gE1gxRUs2+eEuq9U8Mg7BQrE/5kFNX
	maQJrQ9xNHkQP1wXBFAQ6Qr7+scCzH7EJoenlo7SLR31LV68CmFo2dz8Lq6Qg9xKXtpFNQnqWm0
	FARI0+B6O862FIsS0om2aR/edwgzl6uAEkoJ02f4icfYqikYwR7m3FcJPrs4F6JADuhEbJ0g/Lh
	HJyvwgwiyhFks/1ZhxhzhBjYa/dwAT1LR/EKsZK/fugCQvQTabFQlzOyFR6hhEPB3ijyoK65sLi
	H3QbJpac0GO4aoIXQs7D2aWuN/UydzkS7eqXcqNZfGpoX/R84d7rkIlYem8GsTqd5lNt9uT/3qh
	vlkcoE4zuVCGNGgkcEqBvqhQWECEhYMlneHBSI6cjmr48A6Cm5ubRtfllhWZ2VL11YnRBOXimZ+
	opiRi/ByTqTVQ0gR9Rwfg2VYZtnLFPK3fVuaBLu79maxUC/xAPEcjTgLsa0YtyBISyHvEWLk5YY
	vwHuRCfT07j+wNkjr+DvogXVutKDiU7pGHO/PQ==
X-Received: by 2002:a17:90b:390f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39b261b216dmr29493077a91.15.1788741817065;
        Sun, 06 Sep 2026 17:43:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm33187839c88.4.2026.09.06.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:43:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: use devm_platform_get_and_ioremap_resource
Date: Sun,  6 Sep 2026 17:43:34 -0700
Message-ID: <20260907004334.221683-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual of_address_to_resource(), ioremap(), and iounmap()
in the probe/remove paths with devm_platform_get_and_ioremap_resource()
so the resource is managed and released automatically on probe failure
and driver removal.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index b34524726dec..74db19e1d54f 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -969,9 +969,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 
 	kfree(mtd->name);
 
-	if (priv->vbase)
-		iounmap(priv->vbase);
-
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 
 	return 0;
@@ -996,12 +993,12 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	struct fsl_ifc_ctrl *ctrl;
 	struct fsl_ifc_runtime __iomem *ifc;
 	struct fsl_ifc_mtd *priv;
-	struct resource res;
+	struct resource *res;
+	void __iomem *vbase;
 	static const char *part_probe_types[]
 		= { "cmdlinepart", "RedBoot", "ofpart", NULL };
 	int ret;
 	int bank;
-	struct device_node *node = dev->dev.of_node;
 	struct mtd_info *mtd;
 
 	ctrl = dev_get_drvdata(dev->dev.parent);
@@ -1010,15 +1007,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ifc = ctrl->rregs;
 
 	/* get, allocate and map the memory resource */
-	ret = of_address_to_resource(node, 0, &res);
-	if (ret) {
-		dev_err(&dev->dev, "%s: failed to get resource\n", __func__);
-		return ret;
-	}
+	vbase = devm_platform_get_and_ioremap_resource(dev, 0, &res);
+	if (IS_ERR(vbase))
+		return PTR_ERR(vbase);
 
 	/* find which chip select it is connected to */
 	for (bank = 0; bank < ctrl->banks; bank++) {
-		if (match_bank(ctrl, bank, res.start))
+		if (match_bank(ctrl, bank, res->start))
 			break;
 	}
 
@@ -1055,13 +1050,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	priv->bank = bank;
 	priv->ctrl = ctrl;
 	priv->dev = &dev->dev;
-
-	priv->vbase = ioremap(res.start, resource_size(&res));
-	if (!priv->vbase) {
-		dev_err(priv->dev, "%s: failed to map chip region\n", __func__);
-		ret = -ENOMEM;
-		goto err;
-	}
+	priv->vbase = vbase;
 
 	dev_set_drvdata(priv->dev, priv);
 
@@ -1077,7 +1066,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		  &ifc->ifc_nand.nand_evter_intr_en);
 
 	mtd = nand_to_mtd(&priv->chip);
-	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
+	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res->start);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
@@ -1099,7 +1088,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		goto cleanup_nand;
 
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
-		 (unsigned long long)res.start, priv->bank);
+		 (unsigned long long)res->start, priv->bank);
 
 	return 0;
 
-- 
2.55.0

