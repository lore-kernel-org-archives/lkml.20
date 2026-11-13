Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594379;
	b=w/pffCSc7yZ2wMzbNLGRl0lzFJhuqWnIryuKwe37BJxtmPVyqPaClpVw7vmyKjPZLUBH
	 +dqVUFaHBJmI8fVmdpmFIvy8/0v6Y58mcENSnihaVKSkga3FMKxRDcdyL8GwsG65BumhG
	 UQiK3btQBRvQxnj3lrxyrbtUI38uD4wrt4zg1KyHgwYc9QQvT1okcQfRwkxI/DZhipPAl
	 hRRaRbL3EwNgsBbUZ/2KVSIr55hIkK7L9Bixa5gaNCzyKN++BnCYMFwkAr+FVm9RIBKDf
	 XLnf+cJE3Jkd7b8ZNM741Ugkp50bfPnjEgJKZRJJtfUSxl313ikMW0azbQmnyqc7Bmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
	b=M2SsP/Hh6YoQ6LATwHhhzUIH2SvkJXRfVd0nreOcDS44u/uz4/yBuNLF2DrKxSrAv8ao
	 ATP8Jk0TSXJ0pNC262x7rDv3B4HMWWxwyZDi2JRSjF95E8aeleAf39iIOQAm2KTU7qg0f
	 qR6Rat4J1ugvqjfiTnDZ/xyI0DSLxITzpyEZrca4c6vfFhFcE2n5pqh3QGxhS6F/RQyQB
	 sbRllV4DmVmiJhohVyYuRebnSI/YtqYBoVjw6F31xzDDaUq0OUdLGbmgy7YgUhdUW2Sok
	 hOdtVD7ZKohD+D9XNvTRT6//FZMmnLzN7hIVCrTZKbH0WXnfBRyuMHWE5rCe95J6muQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5xz7HG6;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D98A60A5BE5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D98A60A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5xz7HG6
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-451a49abd8aso1901556fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594378; x=1795199178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=o5xz7HG6WgXf14fqxfpm8jNhX/AYdR51ZrstH8VL31atsFYeLXRwvrqswQml5n5P9x
         K2WP301LAxjxpdXD8trfn5cXZ7GOPV4wvepIBEcUYrSkTEPN5Vsp1rOOvokfsRiv8n0/
         2Ia9sJuM+Q/xA/j+Tz1E9+m9wiKFzJ5fCIXeX294S+jrPS3RpAWazVCt0riKUDgLM2zP
         Lk5cqOh9CzS32NamHUaS3VOPiuBTGjCMMyt9Ix9NoWuH6LIhDLOXvSzMvz3MApTsoLVF
         5dQlc7tjHHYqClrpUZrAvChsykMp7FhmkjuL/8RPMVx4C9pWq3/+4pOwHp2RU2SxXX0W
         vutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594378; x=1795199178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=oZXzpE7AIava3R7K7Legi2RXflNpDRrUmigxsg5drsoQXVbLVIsEAA+Srh+ZNs1pBd
         sWRRkfFyx7YRTILpDeqMQGvuwuNFmuZ+riCJGDLMKTlf7r9dEVVgmMXrjC9J/ChFMMj+
         yHdirHKqeD2DSZ3/pIc/qTJ5wURRomsuFiEXuCaLtE7VdtBLdVFQS4dfS7AxSc4D+81F
         B9GL2dlMTJASq0ysYOMNh8Wtn2KlHmaCEXvcCQNPEBJOAiAKiO71klf0wSgdG49l7yaJ
         QuEXZNIQ+FTLGFDdbnpf4pVxzaKQx4EjoZMor3/EO+UlxNT5ek1ldqg2xE0r3CX8kEUG
         +fIA==
X-Forwarded-Encrypted: i=1; AL+hErExMtEtrBpmIfrRrx20Sz2E4IWGwXyEdgX6T7r5LVECRemezgNkRofyf+ElF1C9DuSgNkSUBiYTC87Ua84=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+sBh4I47RLRbuFXgVacyYe15/AM4CAcT5LKRw6/jppB49mNa3
	MVDOnwhZQbcPQ1T6OisxL0mI5MANae4Hh5rfr9afZWsQFpJiAB1e+7gH
X-Gm-Gg: AYBFou2ds6evBtFkKBCzs8kQrQfD6uzX/lgjdTtUmF6WF5HsoVhLUkE/+R3lHpSMHGB
	OTcsTlLiM1W2d9GuTzsIN/9p217XlvJ4KUtA1TxWr9u3ZvEYG8Gvxbkm8czXG7H3o/bUHgtQFaj
	QSQmH0mrI5IlcG9sD8BI9+N0uI0NnuPFt2oksNpOjVMgDEXWPEQW0JBTN2et/KM5AKrp7h1rPvC
	aT+44hTzM6spedenEUpvf96p8c7U3LJQG/gEM5kks9nDDt2dbsI2XlufL5nAmX6uxH4rxNVzy9L
	xXWMeAoPNlimLZy8YnvHvxBeJlRXuLRTKsj5XLt0tI8wuVackfssdhwH1rz8ubf71Yto7zQWdxp
	6B9iZTZBTwovvm7TeuPzQK+766rpwY+WUQK76INCPtqy7mvNuQM1dZBEplYaMXg0mG/Qkvn0+Py
	H829U4fXY3crRmIa5RNnB9EUKqRBu0i3v8suMqGQcXmkPYuDzkPeyBNRyOt0brSFnCUMWb6C0kf
	XsqspSgu6H1vPudiOl8lwqOFO4peGcwhLOCs7Hbd2ou0GVHltuIxRiq6WTX7PYURpAyfKj2js7K
	RH9AAeJe0n24dayuDvq3KJWBzuwNQdZ0ya4ALtse/kHik1+ZU8JSEAxHEWyfXulSWWWZW+fpmuA
	v8fu7BjtCrvPiGn+uIV0IlHQws3Tkod5qhYjd65hxso1wI1Rmp571iMTmh3LOgjVJjq6tTq+fL9
	lACPUaZQXIBqDP/2jSeIJ1MH9L7VwNO5gVXhYGjesRFgsW0PjCCz4=
X-Received: by 2002:a05:6870:c459:10b0:48f:e0e5:a1f6 with SMTP id 586e51a60fabf-4afdf948d70mr2365773fac.42.1794594378235;
        Fri, 13 Nov 2026 10:26:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:06 -0700
Subject: [PATCH v4 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.15.2

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 39 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index bdda06ae0d72..2818ffe76796 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -368,7 +368,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +377,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +385,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 	mtd->parent_dev = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +406,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, to_ingenic_nand(nand_to_mtd(chip)));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->chip_list, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
@@ -429,8 +441,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -474,9 +487,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +509,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +526,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
+	ingenic_nand_cleanup_chips(nfc);
+
 	if (nfc->ecc)
 		ingenic_ecc_release(nfc->ecc);
-
-	ingenic_nand_cleanup_chips(nfc);
 }
 
 static const struct jz_soc_info jz4740_soc_info = {

-- 
2.53.0

