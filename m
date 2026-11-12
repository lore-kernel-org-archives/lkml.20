Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446972;
	b=ROhzhyc/z9gMWCITLPk4o89MePgrTad08kY84TxBxfVeBfS56XDkLZrCp+J2PjujbUBp
	 W+DOGv4fNiXCnACerQKgykaVUjjj4QqBuKHXJI/zl+Gz2XQqQDi10j1hhQRpSlKWywZqZ
	 wuuBfN8HWPnc60oGznDYEtFSrbS/l7VREK/EtIdKWByI3FRraJwFqMoFdj1zegtL7orhS
	 rhJEN2tlc0wmOtw+tYgMJ0Mg8PbCO0SBs3PNk77cKImxy6HQjZB33QutNjKE+ZYsQRSUJ
	 WPEU/K8//i9K2CfatDzALO9dlnuOICNuuk4DHAwcBDy81+VAh97sC8HSKUmSUIYrVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
	b=2Eh1Mj2PBp+yOL075xLckHL4k2IZmEINDe/HZGq0Zc7d7rXKeYOwMncRxG11pfMatgUQ
	 Ph9YvbU4yThxcDIZWh7CQ20xqTAb2M1RZKo7NeQEootKdcvyZE7tILt3cH94yaTLFMMBo
	 xbciCgLBopOVqxVOOLuab1ZRlHbmoWm7OYM2KWhhV/aOJuAfZ1Ys3+yjX/Z0XMX3e1Lzw
	 984XsnLJuu/YTF6gbtGfHS+6UwV/akhDMmDNPcA71SsNtqzUv43GNhwo/2j5dp5YrhNd/
	 zUsIylbYBVkSdcSQ0/Dt3nH1zZTtXmpJQshwE5btXXr5THU1xaBvP+KJQ8cR1UpPv7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/z/wkXg";
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6890C60A263D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6890C60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/z/wkXg
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f699fe49b3so2449868b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446971; x=1795051771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=r/z/wkXg8lHrH7mJxVBZlRDyAFK7haF47tWHXzu+biJOCF22dyElaknktUPIBZKH+p
         3OO1WJEWr7sdfL1egmlOQwMWK49AdHCsOa7V0mUZwmCSN4HTppLPtg/g+1lwQhT+QQ8G
         svc904E4uV4veqDF/rKpVssrPmMogtmLRcDLA53iraotiIuxEY0TLgzVQ7zqdSgd8zcl
         eU+Q8l6rZln9w7oep91ABAIMGZNS1G0uvSU3vsNbvPhMxWKCeabe1DM2eyghEQ1lEvS4
         EBrDeJOTUhoxn62j7EgHTy2O1bh+9x3yeeJP0450N1jms2huROzN4sAKt6xnso+BNGsz
         UoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446971; x=1795051771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=njWHANd6YkN0WPCL+zgsR9C7Xsb4dPup55zEy9mQ6rh5tZnRdAr8D0HYmUDR7Uq7Sr
         /EZEGYrM6b4DkTPzAin0WY8G2kpOFPaSgx+gXnBsDyPFqd3mhGd7ApUHXWQ1zL254GZq
         ioIVtLSgpZLpM9ucszEcv0ADjuW2BHG8uk+S0qYVxHdv00YDWPRGZF/GGsTLZd6Zhxbx
         gBe5ducgI5WQt5eE+LAG/Hs1hRhDHhcFzfoFbOSXgirVCaTaYK3yep/DQwmSblyj6sDR
         V65+iSK5fR+z5LILvbDj1q1gojGiR0dbC4YCgJofMOtWeXw3ab2c4PL+5y7jJCDmyp6e
         /vkQ==
X-Forwarded-Encrypted: i=1; AL+hErHrpDLA256svZ4/X7mcNiFoTMT7PW/20abSiuryR5jlulOYHtUW2ScFbUaTPljMRMfj2dhwMIH1o1/PMVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wkRlSdSw0ghecZOzFOmZAuoN3jamu+lNaAxe43rBL+bAF+q2O
	RMZlgbci0yjRi1yqfKnujPOlWhPWJvypoE8DZU6QAVQLPChGUwJn+X+S
X-Gm-Gg: AYBFou0/r1KPPGTMIPQDNYWIDlxBSXzxIW62kHPelllHNECcg2blUJ34+Fd674gmezD
	tU4/fa5fno02jsPW855tIwlQjoZ1GAzk39db/6WoBH+e6jmHVo19V36eZAHwFDmq3heeNnB5coH
	xY8JAvvUoIGvTVdFcwWecHsjD5cgzhp/18xXGkLZIG7b/hL5uSiijt4WYDFlKC/iEJFw1k9OV8G
	XTKAvB2/c5EuKTd0ouAWDgXhNvgjqlPFLTmutW/0sQxl2Z8RF74t9rePbucacCwnDnfRP45E87s
	36V2HxRvHG6AVIvxGOU5SiLdgLn3e6+9AMO3BZ80Th3qBRzqLUkRJ0TWuBgcGrNHcnJ9mZpJiJF
	nPFGwDq7E67CnMF+ruWEg2Ak4DYS1fiqhbykggQwMNPxOshd9RBkzJFJNQ1JngWE8R5V23Bl7sn
	2w7gzNE4PcCqgcSYaWfQIgTlArTnTAp4rBHCyDDOVH/NaLjvDMQwQUGfanIlu+TbuW8Hb7MXteF
	O3qHo6ir8knFLZPq8KNQGDpdV6Y7pI+rLSkm4Yn3+DdC1tC0T+NmuQiOmaOulnZ8BDXTueCoYJJ
	IgbhXqqRTHKpABJ+d9fb4jT8OtHDoc64yGnMgUvo0AKzyA/G/xeUUXDbvB8zl7pzQ3xRU9zVf8X
	FuUuK0q+JAzTm2hx5zYUa3R8FQecbQaKBz76vAhZupGqxiCK0njOSuZqRhmosS8yw5dmXNIxX+P
	kBuGdXsvoLEJP5WW1G7/VXKVG2baIZEmTtG5aYtH91oxd3/R94Bk1s
X-Received: by 2002:a05:6808:1789:b0:568:1cc2:96ec with SMTP id 5614622812f47-56b97c194a2mr4220392b6e.46.1794446966606;
        Wed, 11 Nov 2026 17:29:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:32 -0700
Subject: [PATCH v3 53/58] mtd: rawnand: fsl_elbc: retain chip state across
 removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-53-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep a reference to the shared FCM controller for each scanned chip,
including chips retained after unbind. Count active banks separately so
a new binding cannot reuse controller state still owned by old MTD
handles.

Unregister and drain the chip before unmapping its chip-select window.
Run NAND cleanup before releasing the hardware. The NAND core releases
chip storage and the shared controller reference after the final MTD put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 54 +++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index 6216ffea4324..f1034b70f717 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -837,23 +837,22 @@ static const struct nand_controller_ops fsl_elbc_controller_ops = {
 	.attach_chip = fsl_elbc_attach_chip,
 };
 
-static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+static DEFINE_MUTEX(fsl_elbc_nand_mutex);
+
+static void fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
-
-	kfree(mtd->name);
 
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
+	guard(mutex)(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
-	kfree(priv);
-	return 0;
+	if (!--elbc_fcm_ctrl->counter)
+		priv->ctrl->nand = NULL;
+	nand_storage_put(&elbc_fcm_ctrl->controller.storage);
 }
 
-static DEFINE_MUTEX(fsl_elbc_nand_mutex);
-
 static int fsl_elbc_nand_probe(struct platform_device *pdev)
 {
 	struct fsl_lbc_regs __iomem *lbc;
@@ -867,6 +866,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct mtd_info *mtd;
+	const char *name;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "lbc_ctrl_dev missing\n");
@@ -904,21 +904,25 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		elbc_fcm_ctrl = kzalloc_obj(*elbc_fcm_ctrl);
 		if (!elbc_fcm_ctrl) {
 			mutex_unlock(&fsl_elbc_nand_mutex);
-			ret = -ENOMEM;
-			goto err;
+			kfree(priv);
+			return -ENOMEM;
 		}
-		elbc_fcm_ctrl->counter++;
+		nand_storage_init(&elbc_fcm_ctrl->controller.storage, elbc_fcm_ctrl);
 
 		nand_controller_init(&elbc_fcm_ctrl->controller);
 		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
 	} else {
 		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
+		nand_storage_get(&elbc_fcm_ctrl->controller.storage);
 	}
+	elbc_fcm_ctrl->counter++;
 	mutex_unlock(&fsl_elbc_nand_mutex);
 
 	elbc_fcm_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_lbc_ctrl_dev;
+	priv->chip.controller = &elbc_fcm_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &pdev->dev;
 	dev_set_drvdata(priv->dev, priv);
 
@@ -945,11 +949,21 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	name = mtd->name;
+	ret = nand_set_lifetime(&priv->chip, priv);
+	if (ret)
+		goto cleanup_nand;
+	kfree(name);
+
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_elbc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
@@ -959,32 +973,26 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 cleanup_nand:
 	nand_cleanup(&priv->chip);
 err:
+	kfree(nand_to_mtd(&priv->chip)->name);
 	fsl_elbc_chip_remove(priv);
+	kfree(priv);
 
 	return ret;
 }
 
 static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
 	struct nand_chip *chip = &priv->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_elbc_chip_remove(priv);
 
-	mutex_lock(&fsl_elbc_nand_mutex);
-	elbc_fcm_ctrl->counter--;
-	if (!elbc_fcm_ctrl->counter) {
-		fsl_lbc_ctrl_dev->nand = NULL;
-		kfree(elbc_fcm_ctrl);
-	}
-	mutex_unlock(&fsl_elbc_nand_mutex);
-
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_elbc_nand_match[] = {

-- 
2.53.0

