Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAD374E73
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847412; cv=none; b=TsHazLu1woTyEkVcVYX08ylM2Hehu2QVEHupcfuAg1DQSRprv4aceIW1cUsXUeZkHC0KYtAZqXGfMQgj0S+fLQFpR/SniGChlnuBgXP3jd9QkKq+ZHewnjbBgCGeQyagc98XLreQdu66HPtNcvvS49bf922CqRhUOEtYEuIh3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847412; c=relaxed/simple;
	bh=l43HThn9QCxr+rbpXlBDV7OBshETPR1x3QVq5POk+SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=biya1FSv+zaznsUG7IpeqOVKJLeFuYaV/+lAugv+dC8tD1mUX5JO8jftndowgoeWlRFXtUwA1DbTsC/RqFwmZJ5fO4HlLskFwA1nES9X1P3u20LThRTqN1hw0Lrr4R1kk8wpkiDvOhtyXlF4TpPiWKuipoub4n9IidNFekdXvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ry8mCQvw; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ry8mCQvw"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-853c07a76adso4019481b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847409; x=1789452209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4z6TM9f6LWcvEtLSVg7GWqirsSCBkLcI0Q+87lSZCw=;
        b=ry8mCQvwXJZoOBprY+Ff5M9yLwwxX3bW356CF3oRmenvKljgEDAbiuDy5syyeNr4z2
         LdjiLzdFNAnPE+fhZe5c933Tpt3n4CEAbMDOn2Pq+HZqgexdld1kxiGF1NnK5FzXUqOI
         muo1dlXv/Cy6Q//395tswQlXvU7jqKkZ0EDIy/h6OOVmV2Umg2GLR1FPAu3zFAFW0Uiv
         6aot+wqYGsTYyOHzNRo6yATUMz1HZ32hgj+NjoX/9af/Jjmlx9+WTGjNWYpiuVf37I5C
         wFZh+E1Ki77/m7LX7VvoI/RIbvUQ7+wphqk5cVpNAgkF2QI7G5oZnaRspNUAIP4HZkTx
         Xf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847409; x=1789452209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4z6TM9f6LWcvEtLSVg7GWqirsSCBkLcI0Q+87lSZCw=;
        b=Q1FHBqoeeAXg39jwmZObJTnqIuHgyn8OPEixikmI8Q4J7zqjHAR8M9IHw+fRphqRJ1
         S5Z6guuzgt6Hfm72wR0grA3xUn8JneXEdy+HLrctjt8UDCuvnuhd8DEGzIhmc7tU5v6D
         tvA7JnIFzw0GTgJB/5uLrU55NMxRdjP/ZCC7Zwfap3mgohaZNd4CvcX1NzFGjaoUdHN9
         fCiWz8mteR3JJTTkETROBGvoP/Qe6ZaVe0lJnsVzi19qFT2VqQ+rx4keO6FpbZaszjuW
         pt0sifov+DiklQUjBzy6FyBfMS4zFR9wIFnatuf8pzud4gL47LyFC969yJVyPOib3d7x
         vOJw==
X-Forwarded-Encrypted: i=1; AKwUvBwFJ7EtzXNos8PY4OGz9VOeDHz6yEwvqNESCFRXWMnVDmt4d8iArMQ0omZi6QVerrUBRNEyII3jiNX+9YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nFpFqx3y7tQ4frNCZHLZxht8AWRw35lxigYct/YFDUps/cqNKc
	PKGmyNzgadrOowILy3nrLXyuPtSZt4prIUEaUjFON67czmVJ1IyIoJ/mXuqtgw==
X-Gm-Gg: AYBFou3lm6NkpVJMSJjXB786agbvBlGS0bLvEf1FjGwdK//PvRfye4cCxWlakcsrE4m
	n7yNk+qi8H0VfBSdMcEJXa/3mf9naLWzBmetdhuFoA9ra9Xt94fgcNn7glkNu0omoO/l4SE7xR2
	Uj+oOLY2nx3s4FbYcowH+MxtNst/U718JALLJcFcXwGINXekeiVh6iO4LQF+RuTrwsE6GYBciBN
	XQqLMkMg4Z+iytZS4eANlqHXZF9l+CyGpCx2VUtjnbJCK1mQyRJz+CRP7uDXiwP6CjXdSSjbD7f
	8wLnxDFLDc6FFgZTY4w5IOjFaT1bxU+sBhy6BbS/eH9hs6DDg5OhKkiuAO1WlSZVRli3rLTqvqd
	4+jv277FoZ9WzwlR1uwPHkEe2gpFf6yYrKxq+5qrL0vI3PMiHCE7qT6ppsI2RA75wrK+KUpbnCf
	qjTJbNB52rbPmeibpP5y8huyzDqCMNlYmHaHXrF+SbwdhoWeF3sG2YYCyK6acGCVv032Q/jWQXD
	A/5S6IoOxRErn0tvS5GWvpD8DmRpUv17rbM5WxUHLIMooCGSRykmCkdPahvWW75XdK3EO3MvXiw
	82xV0EBs58dGEoWDfpd7TGLdJ3aaLpbcWcaSpA==
X-Received: by 2002:a05:6a00:1915:b0:84a:60a4:2651 with SMTP id d2e1a72fcca58-861669c6dd1mr36166021b3a.6.1788847409045;
        Mon, 07 Sep 2026 23:03:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f872e0esm5049222b3a.4.2026.09.07.23.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:03:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] mtd: rawnand: fsl_ifc: use devm_platform_get_and_ioremap_resource
Date: Mon,  7 Sep 2026 23:03:27 -0700
Message-ID: <20260908060327.42775-1-rosenp@gmail.com>
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
 v2: rebase and remove now unused header.
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 30 +++++++++--------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 4c2d95461c2e..469b233db73e 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -12,7 +12,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
@@ -968,9 +967,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 
 	kfree(mtd->name);
 
-	if (priv->vbase)
-		iounmap(priv->vbase);
-
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 
 	return 0;
@@ -995,12 +991,12 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
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
 
 	if (!fsl_ifc_ctrl_dev || !fsl_ifc_ctrl_dev->rregs)
@@ -1008,15 +1004,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ifc = fsl_ifc_ctrl_dev->rregs;
 
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
 	for (bank = 0; bank < fsl_ifc_ctrl_dev->banks; bank++) {
-		if (match_bank(fsl_ifc_ctrl_dev->gregs, bank, res.start))
+		if (match_bank(fsl_ifc_ctrl_dev->gregs, bank, res->start))
 			break;
 	}
 
@@ -1051,13 +1045,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
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
 
@@ -1073,7 +1061,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		  &ifc->ifc_nand.nand_evter_intr_en);
 
 	mtd = nand_to_mtd(&priv->chip);
-	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res.start);
+	mtd->name = kasprintf(GFP_KERNEL, "%llx.flash", (u64)res->start);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
@@ -1095,7 +1083,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		goto cleanup_nand;
 
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
-		 (unsigned long long)res.start, priv->bank);
+		 (unsigned long long)res->start, priv->bank);
 
 	return 0;
 
-- 
2.55.0

