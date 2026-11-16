Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810637;
	b=ZbDxIYmTXVDuIOSsaBZ6dJ/k6OxHa+r+Pcx9wFOuQKEkwBToAjPVKgXqbCh4WL8VG8ZK
	 riNYtqpcFECSaKqr3xmDav4T9I5vZol7xkzk+H+qsXTJ3dYf6uFRfX8dMVN9OzSkBhUeX
	 zs3r8TXcH4yK/nbX+rjXmaOWexlgRwAku6ppWy/EgHC7ekKedBT5vh4+G2RTr+Gvj6U25
	 xD0WwwUmdQdB25pV+5pNpYgC7VJoA+8gzRw59S2w8+2HaPtQZtE7T90wfRrap8rWgc+Ds
	 fpQGA4CXANWcwidrHAI0BgHjKRdx/VYaBWyZ624GJjqTKG1LsOwYPyW17OimqzZHqAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
	b=2XQRFu23tCGviidh3jr/RXvbKl1dI/6cfKcfTjv8jkRJQJcDaahn0XPrDaOhKJtSxujb
	 Nxf5EQtZYGNlb8lnQ0PbzJvKifNwAMxyjKgOMM8InpkSpBYdTQZDsI3kOdMPkoxVuNRAx
	 FIrkvZaC64SYs8y0dK9/cPxsNsorld9jH3gsYMiAmVxVYuqj+p2w/jJtHMFBi0bNAfAJR
	 U52+sRK//Lpj1fnj3qq0kA0n9iqybeRAP2/6n4Xqrg74wyEa+pQhJ8bQFSDtUxgAQxvVG
	 NyWxydI1aG81S1nzpNSvLgYzxFRNOhk+H/DObkOeluy5wHbDbt4usSEXohFhhAhKhOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lohCgbvE;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F5660A2623
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F5660A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lohCgbvE
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-7190d9bdb2cso2620205eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810636; x=1795415436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=lohCgbvE3sdV7xVql3D6oUCXRqbKJgffOHWHwPzD2A1kmgBbBHzt6iDw3w1753gSSn
         gexMzkk0hcvEtIOOs6r9/n88sjbvba4KOy4sv4+H6Ieq9rxCFzPdhK4G1+jvvGTWGHGx
         Amja4CGoXNdMstbi07b37pKn+shlFD7E5VVzWWMW0D1ULuP86ME9BATfuIi0YhoWjBOI
         wnqhxyzWuMFZOv2gM1KnMJUXcnTI3wZp4qDqq5gRTqu4zSJZqt0767Dk9tep4Z9sl+jz
         4ksbAV1RUqhTy6mEVmPSR1v5QkjZoIMsndojM56rwM208ZGpmh7Q4iKo8U0C1abCGmWE
         TyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810636; x=1795415436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=uQpyvMwk1Nhdpg1CLpAnfNt+zSTePEYi9+moGA5EYx3/Yzg3+EUCRp6uWTn3Yc53f7
         PO5b/fgXMEUaBaLT7q3H8/d8iEWNy+eyy0abBiqCmslC0KKHu1Fq4ku6PdiZw1bI1avY
         RKMboX1YwDgma+I4gbWM+ierIqouyVKTy97jlOHEqOAxSe5E9KJXqJ9C219ZCq3vlo8+
         SggfNhpvBwaZ7/zQA6OICNzj7aaE6LGXuNgTFqcc3Ca3jR2KGnrXirXceSKwN9sVYeCO
         ddVjs51cAma/TgZrixRZ2W+dn2eL/BOved6TvrxvPbzMmNAK9Z8MtF91O3N70oyKYofo
         cynQ==
X-Forwarded-Encrypted: i=1; AL+hErHvxzxjBHbiFPZnJZJS9yuWnV2yFf69UJM2waQze3cGPhGzZZ19ZeouSyaJNEdfPFCgNnbzYUkC3HoE5iE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LZMyjooE6UU8SjL8pTPp7rGr+wXnvGUqXxwxVSOFjpAN+ys9Y
	EpPQswECYRzWYfwspghENgzBnx7jmCgUWPMpOUCzR+8xC5JUSiKT9imf
X-Gm-Gg: AYBFou3JVap3py5/AgUGyZkPirVy0g4a3iCwLNdgvbVSVCyAoFuAOsjCOfwq4f7U3x3
	F+wkGpvTjG3K6Yu6XeZk7GDEKAbAfPKCSYBDmDVDRXlmJVsK+ph6Q1Kk7wWLwYPCuU4IFKgkS3U
	dLZnWhRewsxNg0sS4QGFbP/3Z4rMWhpGBrgQ8/Q1a6Wjhi/mePNPBYvQ5jJTWmIhMZEnFuiNbMl
	1dk9yc+GBpDi7zG84bJVr4cZT05+yp7SqeUzPSqKA/kpszlSEsPrETetUQPRX/qXUraLS+Ir/JX
	XazTdVJi5fgWVszf3xq8FMjbuaKQ6wmu7QS2+zp3H783oVMvWZrxA9eBSHTeS0z7iP4wEZIqiPc
	9WhK/JpwvmElZUEU8lIWR1/nTRBjQe6oFA8/HASPrU3PRE8ydx/KnMZlnbbZQf3JHrSBLEEEY8/
	4/0MWqOVvPsJ9PLd3SORGAz26xYwfe0Ex2TPBdXCQ4SOFOpT/ZQrAvj/kDOOUnTn+PPXep5z2TY
	0Ds2bVh1tEVmIjZqVjky3wbCYtYDnAosQP6ay2bxNNuXueImEQyUcWXHOVIUx/4LcIp69vfXV8r
	pVbvJHR2tijuziXjwzmdy7jdlUeKctZ/L/f7Xl2egkxs/oRBQiC9nW7ZGAmwWJzx52zRUzZ/oYs
	nRyGFJGTXbgsjaHqKETDQk3A/2OfZoSbmp2lBjjNSq1xSlzwhLbuC/W8H5TOjPT4RY0H6cjhKA+
	pr/XrZz1qEf6sAxDccb4jwpPiKBNFL7ts1A5JgdWbHtGY4iY3UNrE=
X-Received: by 2002:a05:6820:a292:10b0:70a:6888:2274 with SMTP id 006d021491bc7-71ab5073337mr4232314eaf.45.1794810636011;
        Sun, 15 Nov 2026 22:30:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:56 -0700
Subject: [PATCH v5 41/58] mtd: rawnand: brcmnand: retain open-handle state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-41-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>
X-Mailer: b4 0.17-dev

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

