Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C2566C40
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931302; cv=none; b=drx/6qykur9sBwl2VBSv3BawTr/0qfFXbtQs3L3ohGvF6Ffv9XVlBDB9cuhJFC+4zronKKib/hg20qQ37LT7Sud5wF87p13/NXFRmsxwQpg2LTNzMHPKZeKpexwb+YjmpmEqOkprV2HO3tzpLB5he+BW0/WbJlGu9Jiv/+gajjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931302; c=relaxed/simple;
	bh=undUZWlqW54LZYqQj9uC2M13aoARl0CexcT0FHK7v7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lu5tvHGjXedVTFkV9SC8xdXfrAGBMNQiTBPWYww1WOBzf3yFVx6oYi3EwIufCjH/XiLPYPfi9hKODUlQKeUYyIile9Dwbp4YjiisKtSBk0Usf51I5tgvKSny1YUntDepvaOBmIWusO3H3lUsc3XZ02EqLlvbV5Hmn7e6x0NOteM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbSorsyH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbSorsyH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db80fcdf8bso19794335ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791931298; x=1792536098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/1itgMrpNBxkE6u/m9rVj9aqLYPpbOV4tP8FDG8nZw=;
        b=SbSorsyHJZ9yVwFumg75x4xac76IaSQLLcbUoWwFDs8T/dPoJAqzDRhkVZo67OMebI
         c9y7bDsdnH9TUhV2S5j+p39iciWGr5dQIyUwPlbKp9KIFNiBhzp49gGASAbjaoOHlRIo
         8Z6WV/INtWegvCGlGa8xRMkTuxYiB3JGO2h6xvMXTtsJ9r6zi8vuvN/jEKYhD2Sk3PV6
         r1iOBDUBhmPX+VkOGW+r6BD01lw/SCtwz2y5w4wnOlJit2N4XIJMYRzA0UIsiFARS39A
         tkdwtstPM0IxdzpmPDl+Ci0S6+wX+d5rSCIbJw+YDqXbvVSwzQrhdlPLibXQNuQ7nvJv
         6HTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931298; x=1792536098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/1itgMrpNBxkE6u/m9rVj9aqLYPpbOV4tP8FDG8nZw=;
        b=LK1qGJ7zqeo/8gWrAI1dBjZddmztBDPHox//VMGCk8/3dbw02K+mD/S4nuKAow8Lay
         YnqdVznrjqZ0RjrVWEGoU/FeIyJOiLi8S9Ykco7KoR9u0/bSruGwiTx+4mv1UzCXFqOc
         cfg/Vlr8s5ax4qn6uhXII69UbceVaKU8bK/RMIo5Kao/IvVcJLaQobLad6aEUDoOx7aj
         KIO7M+ksd8FDiGh7EzfW7I+dtrr/lsu/RUMVQupuq+y4fd6Kv6lK1Pf1ptzknAoBfu6B
         F2QfLHRpuvKibs1JhxyCnoUtB2ZU+i/fsvz7o9iqQs8CIEjsgxdBUDuz3KnPyJonYBxY
         jHaw==
X-Forwarded-Encrypted: i=1; AKwUvBy+aVVtnBPk+FLrU4sqZ0/sPHy2oa/vvq/ldKfwVL84kmeRcjjHa5uy2w5vPeNaxlEOIvIeuUb3m/tHCUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA+JSJJ2j6FXochMZPJc34rRQ3XB7KC0fkc7fyT+S5jrobXH5A
	HjeoibAqRQDbdMkCXST5aORrUL/VgN7tjYsiYo5HK1zB06wjp7DWvE7A
X-Gm-Gg: AYBFou31QxlZQDrRzxFnxsHKoGLwhf+04xCaicUL8vRUwfwtUWgmLzmfKptGTkrxnYj
	DF0gGZHpqrOhbqu5/Y3w0n9rZ0Th2SNmk/MAw5gaIu7qD8m67rhzn/qk7TWojWwjdqTcSgl3LFb
	M2mtv/OhirLl2g39X8P7N1HauuES9jvYm9p1racAKzdTKWv1axXj8n1qGKoVyzWgajMfij6H6l8
	cV1efb3QEeZ+gNY6fsw5WJcbt99UN6Q7YRXA92OCMpHWWu3iWTn3cAFvnSLconeGHn2GKTYrydA
	3TSIYcmrloZwb+/b/md6YaMnoXHYpL+WyXNBJcbCJ0uzNpAbjX9TIN//kb3+79Tearpsv4/b00k
	Zm11CJ14kukjvZF+TFyZvtV52ow7j2G21PbqQw2kTrRbINd6g0a09ukc7l8RHzJ8QFOV5euMAX6
	JpBa4BDbYKhC16djdL749riD1hXmXsF/9MLdz59BtImGKNphTkmd6Vdj1QJ+H2ttFmqRTEDu+kc
	NpiDW3VBVBalo85O3oRkgLE1dkkd0LO1Ol/DWBf+ivPK6P9Q+ab7ncemSPYlN+6yCBmR8HbEM6C
	CN+mtdFiQoD+dp8+I/HAIfNoXIPBbMvu0AUhhWYrqDxtfTOM
X-Received: by 2002:a17:902:e748:b0:2e6:13b1:e1aa with SMTP id d9443c01a7336-2e8428a1f27mr123298395ad.15.1791931297983;
        Tue, 13 Oct 2026 15:41:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422fb8b4sm61576805ad.82.2026.10.13.15.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:41:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fsl_ifc: drop unused controller chips array
Date: Tue, 13 Oct 2026 15:41:34 -0700
Message-ID: <20261013224134.42967-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chips[] array in struct fsl_ifc_nand_ctrl is only ever written to,
never read.  Remove the array, the fsl_ifc_chip_remove() function that
cleared it, and its callers in probe and remove.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index cc75b6a67e07..7f4bf4e2cb78 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,7 +40,6 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
-	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
 	unsigned int page;	/* Last page written to / read from	*/
@@ -961,13 +960,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
-{
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
-
-	return 0;
-}
-
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 		      phys_addr_t addr)
 {
@@ -1037,7 +1029,6 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	}
 	mutex_unlock(&fsl_ifc_nand_mutex);
 
-	ifc_nand_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
 	priv->dev = &dev->dev;
@@ -1058,19 +1049,17 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mtd = nand_to_mtd(&priv->chip);
 	mtd->name = devm_kasprintf(priv->dev, GFP_KERNEL, "%llx.flash", (u64)res->start);
-	if (!mtd->name) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!mtd->name)
+		return -ENOMEM;
 
 	ret = fsl_ifc_chip_init(priv);
 	if (ret)
-		goto err;
+		return ret;
 
 	priv->chip.controller->ops = &fsl_ifc_controller_ops;
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
-		goto err;
+		return ret;
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
@@ -1085,9 +1074,6 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 cleanup_nand:
 	nand_cleanup(&priv->chip);
-err:
-	fsl_ifc_chip_remove(priv);
-
 	return ret;
 }
 
@@ -1100,8 +1086,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-
-	fsl_ifc_chip_remove(priv);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.56.0

