Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593780;
	b=RI+c25yicvljefksn4tEDoa5I1Q/QobhSEYb4wi/mEMJ43OPQpfXBNH92K2Q3/AScISh
	 KivzjdgnX2A/Ov8+8sa8/dqmy2fOjMK4n93CR/RSIU6q0e+sDAxkwkknCj8VnS/an7ZKb
	 L0MvCUSCjp0s80tWinUn32zNRJDt6N8q85HKXNSAu/IATxAgaV1bnmu9L82zdJBlKmRED
	 5vjHBvmrg9uiKpS0xzpuAuB7hOUExrsX+OP173QOlHSTze9lLXdGNInfGJ22zPRjRuYhS
	 lT4hvF+m9APPhRB1g7CYTYoW9BXG00nc2g1sCCJJ5K34yvFHaKbgyKhbZox1vg/LcNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
	b=bcVLiaBxYaMxFPTgQG20m4ipNLB4kd+dSSRC0UniVhNYlI6duZ/DzEiSNnTmLPnShEoi
	 AFhuX4QeB8731JR5P4flFZSwTQ1R2UKYDKwNVhq3LxgCrdD/RDkF80vVAD2Cm7V0ntwdu
	 F4/BZRYNH5ZLWzksUru01hHypHTdxiyUgiQdc9gDqJfFQhypjoSLDLLjG8Q6HX2YacJjX
	 S7Vik0GJpSbgxXtYrmDSLiOtWr2hWhZxOdEYAbie12cXjqA/OnEjs4HR6YnmunaZFGxan
	 mm4di0xZpSekOCfvd6EMqTTcqXCDbCLP3tnM8Cwfv530jVEsEqcp0NYM9w39LyYRKRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP9CbwpE;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50B606A6E3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D50B606A6E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP9CbwpE
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-847ac7ccd85so1463561a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593779; x=1795198579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=lP9CbwpE9dRsZeHHKIA+YTW89p3wGJUgvxRGZj8DGU5MFe4N+7hM+uTAoQOP1H17ad
         ZI54ubvCzSk1E7m8n15ew/KrOG9idAY5uWH3d94PEM4TjhjNwgVKP/ToHCnZanMvk+Zd
         +5nyylH8YwnSHg3pEiPHGOV6G7hnQA9AdcKT6XBL9evf9fWGW3XFPrL+cd5BwkSaFDX2
         qZzdLf2HOG6ghbrjEF8v0tBwTuEWpjlXAYs4aLKlLQYx7mOzC4gP883sW0DjakiD0cJc
         UykXQjBIhqebY2kPPqaCNb7mdwBHtF5HVWICJhZ0svxY4xyiEne16e3U0AL9lu97uqmb
         DqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593779; x=1795198579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=JbhFOzbfkQ3K77jnVETU9M5mEmB/zV45m9C6nl7D3WgDEhJTZZ170dY+sNjRni/mod
         mKvAnZLcC97K9/IIoOaUqWXN68g+UO6ZHDOey0ze5j3D6VPskNiCy7JQUAjzescZ2uq3
         4MoanxSijExBSB4n1KM3Fy1xB+NRcIXPHXan2cncbvg7Cw31zu5Bca5VVSkUZpZoUKk/
         0fsdDK9Rcqptwc5tUfoEp4ET+2CUEALMlEPxHzYAED3gwTU1BilRlxldEUgQQ1FUX1jy
         BO1aWp/uvztYmbmUUpD+yeYSH9ePwCl9IhY5kEXLOXJx1f5GYtZKPuEpva+ViFYpFfaf
         B7Fg==
X-Forwarded-Encrypted: i=1; AL+hErG0tjr8Jvj+rRTSYgoI0TOiGy7KGAxu2HkQbKrmvpgtpPqBDBXC0/l8Tx5GK5RArs+HPRxEcj2E4XkTTrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xdknagRKpor87HMQKDpE17n8+SyYD1muHElOUAyWb3aC006kF
	6XmqfdW+cPca6lA4Lam4SEtLXboxZW8EThLrQJplgD7IKy1hd2Z/qTsvNSdu78wm
X-Gm-Gg: AYBFou3st510HnSxFdFH+l7LVFmG7l1B3BHk05av5dsJ8BS2/3457ShTUUWScSjWArz
	RS2/0rZS+Dwi35U87GucKW+9ZrZT8DH6L/SCNGqxdsxZB+KbEFgn/rCIWueZDgFagrxZzG7J9Rl
	Jm52PYI5IT61jAW0mFO4wkyYkzZzVUTMuHejwZBhEJofJEv571pe+0mT4v92aJL4JGpRCcj+nOf
	4jSL9/EZh5p2X2TVTQilNSfr9yFsoWUQjGkSmMoRz/OannsPfUhGXU89fyfOTfyWWeWv1VqtCkH
	iJsoSgYQRSqLrVtI8Qm/AU3uXuKAn9y5rfixfVC0rcBjOiHR8TjOicaeVZI1RGfP5MEeOnuMcpA
	uymUcWlLUboQRqrV/QVN9Nh3EpWJWmX/VPbj2r3OZt3Lzu9w3lB1JDOJMrhbjT58HqS6PpNlCnZ
	cRzY6BgKJswIPjggEOrWrKGEmcBExCp3TiwkoDgbdnBGycBh4AHMP/KQKSe36FVgOGwsoY5+tFf
	gZqIpdsSIG+oIMDbu23Cn9OT1BvaWJ7ftWRImx93H9vRx69PpHMs1JqUMe4soiPTKmnVI6Wyjnw
	l8lW26RVfnVk3rBkC0k2XfRGA9y3VuujEFuwS3XADl2cW6cgAmM9kMKSWU9HRo8OhDTNvdrXdZC
	HriJ2ri9xa0/eVo2LXkL0TeFiS/jaPjxizcO3wWT7JoXhTK/Hb2+KvDEyBmKO56n1be/f9DmHVN
	jGpf8DAGfS3JkioAbQWsd4tvaiV4uwz3cJknKPCcDIpK238GVC7nM=
X-Received: by 2002:a05:6830:411c:b0:861:55b8:68d7 with SMTP id 46e09a7af769-86289828d11mr2760027a34.7.1794593779150;
        Fri, 13 Nov 2026 10:16:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:57 -0700
Subject: [PATCH v4 41/58] mtd: rawnand: brcmnand: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-41-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

