Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446964;
	b=TrSSJUKy5hmrVHog0D6w1OMkbxsMbZPa/Dtyz+qwGHVJ0Qw+kONcDc0k/9VcrVS4fENT
	 bQRC8w0P5xgIta+oTRN9mF6JVHklxJHC4AYrKH4xFDH2PvUe3C8RQPHBtTk8f3JekvRAF
	 +ZKHi/VLo/L+zpNSAQxtauCU1ZNu+MvOQjTe1ar/AyjORai69ZGBKhXHXWmquYE1viN6l
	 IdtigGC2IyOTweTNQOdZbVXXo7UJkkMQoNNPbNn54lNZh3RAtt3sgt2zgBSYAKcBSETp7
	 sRvabB4ML+H9gOLN/kwmyXbXS6q89oBAcRGWfEMOWR8CuuN7sse9uZmf3FkLcXp7lqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
	b=AynsBgIxG/XAbwsC10M2EnqI9JD/Sx9HTmW/nWnqcF0b0h4pC1oYKa/qV3yWPCr+1C6P
	 72JLLk4SNhiG/eosmhdcDTXBLC4BhhY7ljJKkX5DIXjcL0J5qsLivMG9xa7JODKXtSY+y
	 3s8n3dyG+JuwOoBo5Z+zF4TynLPbw2VDwD5/NpTuDuH/Dg2nQbki0KRQ40rrmHqx4kJLS
	 p4E4UCp0RMcmlAkcjf4LN0G/dXbe1QJJUryXg/yJfR+FTiqYSEFzPAlLZvKsIOWGTVBmS
	 /BZejbdIc2Rw31/5GYspRzcRA9I8tUl/AEbEwJMdkHG4CAM/lMqiah2NzgH6bOy2x8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndLvk1dP;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B36071AF8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 846B36071AF8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndLvk1dP
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f66bb2ab57so1138487b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446963; x=1795051763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=ndLvk1dP5+Kdax7tr2C82q71sN+xzq7RRXP1rIll22YIydkroeMUenWZHxXaAAnHOu
         lyjlGgqlasMLHYxl2l+XEy/7TSYYJt1cUl1rSML0svKTaj1C+6s0Iuwbe913y1jrxTTJ
         SUb0e9nMXERgD7KOe9Ba/IaZePI9fvOL8XJtEArxQclSUNA2Wz5XTNbUKgUpAc1XnMb0
         eeVMdYEBbPzZfyBpGJyDRT+7KQnEdo1ZpAz291SV3gXivY6DvMkx6NXOGCdAYKGT0fwZ
         DjIZGOP/gXqwWKmfDwj7K9zc7X/CWqmevbgaLLqstfQ4Tv7wognGZ5JowevoruHLFkFF
         kfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446963; x=1795051763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=AVTSgoxidv2kkLx9UJjw9WoEbViMd1lY+av/TstMSKZrbEMbW+qhX3HIegLm2QTwpS
         MQkqgvCZengLy4fmWw+Wq9GO/6lc2CY4S4j646nUwTITphq0pOIT72tP2WvVlYXnbYOT
         sgjrq3+1I0hWAXBdE23Q8fMACqL4txXtOEIeBBRt4R9NGEZ4m61yVQVCYoAYRyz836UL
         s72RFsbmP4Qz9TZWPh0gFYT96b/nn0ZabWz5SdNZQGtybbw1fJU+R4LPHNKKVYuDXRW4
         /tFiCom9OM5VEhYX1ocf8QvT4WH/txDDLjyXAV7Ww7DnKGRvdalpgivsizLhcxR3tuX9
         8TrQ==
X-Forwarded-Encrypted: i=1; AL+hErHfVgcOiqsND0TiMLpSXQyXJ6hdT8xqZwWHS9Jqd4LSVrQ6Y5J6/T6m7uPPTa5FykKhAkDBnf3J0jeKxCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z2UMB8izU1WbUKLcSWYzT3p3zGp1/HrZeUQHXpDlhpNQQ7I/Y
	U9imr92ODLXYZHEG+HMZ9vuG6jsJ5Qk1fPYBaA63bTxsl9/KSPcKNoSw
X-Gm-Gg: AYBFou2y+W1cBLLEfjCYYFrhGZJXGq6yPKhCraXkEHjfyeKRCzGaAR60EPxKzQXErVh
	xUOhNFw2s62mMHllDWkcATygEd0g6pBmjjyLBlBwNNfvNfJTXV/DzR4j04bWj6iSBjw7GAzONKD
	Ri45S1Iszs5a5SV6Uw1DRwX3b/abIL91IDmv9pFo6md411naD09GOIW562RRfk6lZwku8apci85
	Hr88KQfAtLYDRUhEpQYvO4hSLdPHk6jFxqimJ/VaJAGkRsUgBAur1Aq/SItw7qme5YX5cuOG7qG
	PJn5QlkQwL9PBPqr1ZeA2qw6jDBris9PT7vZpPZdJFzrWkn01vAxMfrOlqdG4wAO0lpkkb+4ENu
	Q0Q6g2beZINmzC8MnajuptOFQ1hrwbc2hCNdsTwl/ohAm4JW9MtJXHnqQV2DfyPN6hlnsYONajw
	uYnQ9XPKiFrFB7G+Tm2/eSYkNlSlVM1ShpSTFBLu1EPlrs2AEmoG0IQ/jbUflY90mpm8aucl3nf
	1lZSXSIayaGtQBouFDI4ebwqTlDi/tSIYoq2lY5flFo+RIb9/NoxRlpMbpS8vqPhu/SyOo08faP
	2SJ8rzoCY9v4cO04lk0O3Dx5rkPz5Wiwaa/i8a2gcl/Wjcs4c/tppjkpk7haRNrVE6PVyYMWKar
	6kKfzFXRzHgp8Gxc0Vd7AEcxgSK5rUjJAoPwz/2aIuQZZDsHNeVjqYq9n+Hyoehjmd8da/C7amU
	oTC3Xaim/JHt8Kl5e60ZsT126xMO275NLymaXaLgjk0w+TbCMeze//
X-Received: by 2002:a05:6808:f12:b0:569:5c3:d578 with SMTP id 5614622812f47-56b93243299mr4395163b6e.9.1794446963491;
        Wed, 11 Nov 2026 17:29:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:29 -0700
Subject: [PATCH v3 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-50-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

