Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446960;
	b=YjTWbibz8ZWfp0PpUY3fAWH55+eVI2eCqk5uDmGjbk+Kp5EdP0FYV+BNhvdae+2AgQC7
	 CdkYW5nr6TeO2ei+B99d8EtULHX3eFXKPg70TxREI7NvmsZTVoBD6B6MG0J5pVmXdoseR
	 l89VZO7Aj5+z41zFxeCgYKEIMiyFd49V5Ol+b8YY7qUUdGw1A8vnAK6S2vRKyNCG2/MhN
	 OJNDKi/ZswDSZpwnAA4J0sVuMnazt3yU3+JDQdeUUz+kPIcEnlQJjgvLbM9Mzx6CpsHf5
	 1IS0ZFI8vCb21jmcOTn2UDHf9hduGEd5/d8FnXtpu6j48A6BdItv3wAdvFYybIb17/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
	b=pbgGLstKsM8HLUk6Ood3/NsNzgNL6k4MZPXQDqazQZmMbd2x0TM0wgh3efniRqy76WNW
	 JbgMkH1Y/L32wCkJzkN2Y1nHmAiEmtDnf8yKuMsQyFa3OJUz5Y3SiQX7T4U04U4owz7dS
	 dqsqWY7fVdXY4/fdxmo3Kz1AY1mKyIWZlNYSV6bnsws7Py2QsPmnRPjhKpJEVJl6JAKSd
	 DskGYuRS8Ek4DPjmorEuQHNjOJXIeiW56HJaAD4k0LuWhmApyCE6gfpquLCvV4UUQwhBt
	 w1RPjoxuGhdmNjwmT/U/DQ9R79CRhAlefshQUrI7mKik6uIojlAmny+epsQmoP35wbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OgDmTW8e;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25536070DD8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25536070DD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OgDmTW8e
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4af81963f35so1874849b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446958; x=1795051758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=OgDmTW8e5YXEIRKQ5e9iOvh6PkO1gez/Kt7myZdCC+mDegpbEa+wwZm3w8z/XFhrYj
         ob0Mr+7A+As79uXW4P63inUowYNxvJebUCSbPpiL1C4xDcxQlnyYhPHY2VbiaIriywgM
         brNTeIWt9PJovdXSttYwYOpVmC25k7BH2eYxr+3zG13J2BrueAwZNF7/Qz2NTbfLSPoS
         Mte4erZbsTbg98vBGA98cx/0B4o5V+Z9FqczjMtnKu4UEvmYo1tJgTWK0brYsvSTOxA3
         AFdstus0WAiDzarp0oISIMv3wbLzvgVSq+epE8jSj4h227j8+mvbRLjgmJs8jTXG47oJ
         DQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446958; x=1795051758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=XFoqwqcG5AeEtuJW9B+5i/Gz4GcGKe37B/E7a0b3F4sGoUXoUeY3OxFsVPIUc160Mt
         KsLiKBMlZQRBgmGKnkXwts/OZJMKNTJ8A6yQ7EHnjW1YDL35/ncgkJ9NlG3ywLndsIDw
         6ekEmGhasbx36ygVicPuyXPhvBlYhbPm63tIuGk/U6YBImXd7gL8L97s4YVGxoCUYJL0
         CvM9PmIjeulDlnKhhh2SfyEM7BRZskHR1gL5RdQREKPVys8Z5mGKSHE2Z1LQJZUoCOLN
         PlMP/iBRMDeGjJT9l6Mx7TodWBKiKZsXWWcYiKduSmpronszQGiiMMqUCtzah+W+cKIK
         teiQ==
X-Forwarded-Encrypted: i=1; AL+hErHVrifcrsgH44gB3Kk2JN8WA/4bRTVWXLKht37kMTEKvb8mD65obiFr3RKXpn60rTZSy6JAWeJkAYDmKC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t4i4IBpd9ep1bWi3YZ5tyMdqiD4A+81H8GiDJNye/DBilSW7/
	faNvEcO26droztphVQlBCzDO24rFUuu86ohsHtKG5vUch91O3rH/Vc7j
X-Gm-Gg: AYBFou0c5gPWD6iQ6BbIJ0AEItSSpQNu6VuJlWy7pRkYfw9MzkGVJBYPWxjXnkM49Hq
	AglvIgshO6L4pdCgTMCItk40K9L6VYdrFEJOQRORiYRFOdlgFxaQpY5CeUoSP3CmzFgVn8m1xDD
	4+IMa9sC8/UkOeQChk3aMg7qAtzSt2zPEboNoVcDQ6m9e9R91OfnRJJPn5f/dNI+7Iwv634ZWAN
	sBtqe59GIISjaU0zx83dcK3ly+iCvfqO2h7iZGKnG/haEcxJ9T9BNzCgOmn2ssESlzEdtFTJ2gJ
	U9Gllk3qx1PguVxyZPZSiAQ2W54S6f45wDxLaV77TvHWGE8XXN4sp5FaMpG5RLm2Z7auxoT5fm6
	YhxAGZfRgeYMtI4UvuD3WUQ/X2vhIofHFTOEHuG2vJUd7sqgqHSRN+GCUi34Z8llxsK99hWLMS+
	UHqA4yrbGt6I11IysX4YaTg2lNp/ohSKSDFgQAMsyxSdfckt18AJC6f66y6gfyZU3AJdj3+8U1g
	MFN5f78/kH45m0IHzBTrteCkNTqXyA/TV6vEBuDUx5SVHV4o9v5hPqanh7yGkiIF59fZOGdnfam
	6jLQfn1Yu6b+0wxDElxkjO/OriV4OHXdlHxu9e2Sz+USDQyHzcQefAMDf8p/0PDIPJwG2G5XVnB
	62G6ObBQVmbnZffhwznt3LpXW8OiwTAYtY+QKLrsZjfauXjkMeCsogPcnZDCFABMoiXo1eA6JTo
	lZqRSMGGCZq1DYwktBENb5axCekzYF//q+2XWshfJmbPhpat8UcX+5aWxGPdMib8SKyeR8rcjwE
	A==
X-Received: by 2002:a05:6808:6508:b0:565:343d:7e09 with SMTP id 5614622812f47-56b95b7e2d9mr3691847b6e.30.1794446953851;
        Wed, 11 Nov 2026 17:29:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:20 -0700
Subject: [PATCH v3 41/58] mtd: rawnand: brcmnand: retain open-handle state
 on removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-41-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind previously registered chip-selects on probe failure.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 63 +++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0378014da6d2..8b2ffe5d44af 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3093,10 +3093,11 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = dev;
 
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
@@ -3123,13 +3124,24 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
-	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
+	ret = nand_set_lifetime(chip, container_of(chip, struct brcmnand_host, chip));
+	if (ret) {
 		nand_cleanup(chip);
+		goto free_host;
+	}
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
+
+free_host:
+	kfree(host);
+	return ret;
 }
 
 static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
@@ -3294,6 +3306,21 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 	return 0;
 }
 
+static void brcmnand_chips_cleanup(struct brcmnand_controller *ctrl)
+{
+	struct brcmnand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &ctrl->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -3307,9 +3334,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
-	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ctrl->controller, ctrl);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
@@ -3324,7 +3354,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
@@ -3489,7 +3518,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			host = kzalloc_obj(*host);
 			if (!host) {
 				ret = -ENOMEM;
 				goto err;
@@ -3500,7 +3529,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			ret = of_property_read_u32(child, "reg", &host->cs);
 			if (ret) {
 				dev_err(dev, "can't get chip-select\n");
-				devm_kfree(dev, host);
+				kfree(host);
 				continue;
 			}
 
@@ -3511,7 +3540,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 				if (ret == -EPROBE_DEFER)
 					goto err;
 
-				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
 
@@ -3528,7 +3556,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* If we got there we must have been probing via platform data */
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host) {
 		ret = -ENOMEM;
 		goto err;
@@ -3554,6 +3582,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	return 0;
 
 err:
+	brcmnand_chips_cleanup(ctrl);
 	clk_disable_unprepare(ctrl->clk);
 	return ret;
 
@@ -3563,16 +3592,8 @@ EXPORT_SYMBOL_GPL(brcmnand_probe);
 void brcmnand_remove(struct platform_device *pdev)
 {
 	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
-	struct brcmnand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &ctrl->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	brcmnand_chips_cleanup(ctrl);
 
 	clk_disable_unprepare(ctrl->clk);
 

-- 
2.53.0

