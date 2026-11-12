Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446924;
	b=snhGyGaSYnZMf5iZ/rCeYJ9pLmHfVXcZ1G85REO90CX/uptTv5POIygmYCm9acgjwTWK
	 6YJenkRNE9xv6/JcbAXkYU+DQUd31GswFuzTWJ+onzepRLQRKdtlhjWXZQzlFntJU6DC2
	 rruwxvT5U07j5FAt/ybolUKoEHytPZaVLHesO9+z7RvAX/KYqR8SR3Z7WWyTSFUVSlbRF
	 SFX2pbDmKNXVW/lFuURF8GUq9gAJAulJBeX2I1hQQUJQAXBKAhwCR/vyltfJrZeH/0s8c
	 /gZVYcszrwv6oxaddp4i3H0IZ/mNS5fCIHa1DXwsCla6rN/7c9t80G0Usa06jB1Nlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
	b=Hx+Kjc91Ud/ngwu6wlrHGQsIDZ+G8tSIIPXXBP7EVm0NpSCI5oifwylD1wOzvQskIqbk
	 bdAcV6WIUl6ZRIPAJ8N8LraVez7UgWzWdS2NxNuqDNNKjo0VuZ49druOPUZDXdfSvcuJl
	 NbJ3pSE/nPdsRHIU0UkjOefU/te8EVxus9CVJSfy7c95ei6fHaA+PSn/gzQqA/4ZmcvtJ
	 ecI3zoX+1+yOd5dS1KoHrBQeZuZNRuRVKU75Q9gHpW79Ayfbhu0+9V737emSp12J4NYYe
	 XrjTzyR1J0p4buYqkc0+fnWLrSUpOc7B2X1s9OZ+7LKK/BuYg7YQwQgyX3ALNbp2MYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHScfNve;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13260A3829
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD13260A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHScfNve
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53dbe9b8d6eso322115b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446923; x=1795051723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=pHScfNves1GM+FPo7EVLSkupVrNHiCzoJGL/CXPjPMq/1RSHMDkErNtwL9f+6Pci4Q
         1rEXQ4szDUn7YhwX5YZoeCFdDXnzKFB2BPogNDYnM0gfvR5PIKomX1SQvxhF1LqUbWqL
         1T9wGcBSHI5P1m0QMUa3LTKnpTlVwGKGi1K10M8xqDkfWTBnKNyvNqGP9fCsJSZyKSi6
         BYWiP5AMnTvE2S57DwGtiH19+E3fGW3TWsF8EsVWabqNLUO/Tav2xgH9Dl/aI+EfYIXS
         t4seguuZpzqBUuV9hTquhVKvw+sbyVO9dj7kHraAah5zRPOcOpWAEmiUN+TbjasMIhyb
         th0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446923; x=1795051723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=Iyow5i48ogAywJqIBnYclYZj2Jn5KBJJi65ndsvY+GBo4c7Q/VTOhABuXSEMEiYanX
         JLgIme47fFpVTZPeM8Gb4xa2gEQvkp2LAgWlN+3b3mvRaO5adVKpHVpIziexvak3QaXC
         DleY+aqz+trjw7K027uaYbbHMZY9xqmaTaUkzW3AX/0TWfRYiV1f/I50aaf/OTuolQUp
         wi/rBEYwHKz/vqXwOEVxuOQx4pJy+OKowBp8r+DYUsAW9N54S7caKu2wbZEneLMO0rFh
         8c56QdLMjjAlC//U7Hb96oDFbSR9HwT/7H2SUAGwwDhxnVwxifU9kfCKR8v6LR7YY4tc
         HAoA==
X-Forwarded-Encrypted: i=1; AL+hErFFybutCQc1Pl56imUieY0S5ySZ6adsiSwYEFgzyEJ2yIIBQxO/Oe7kjqOxpeJvVKcbN4V8IoEBl9/fpvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TSopIIhK+stniblLIuIyF2oEqWO0VjE6vDnHJcfnYv0RfsTYs
	0iD1dIl6+RhyT+H4DbeK7QNt4OuE1oL7ng12rDXgcckYS7V4AyV0Jqoh
X-Gm-Gg: AYBFou18IshMXdNya1drm/IlXfJDXcDc1PKVOagIBPPc02/1V85Mk0T8SQ5xWzeRJYL
	9zLPkHIATN7TqFRy80B/lreqUHrD5oe0vebBF6BH5nTTy7GXVnC1LurX6hLZcBYUZwI4rskcfW3
	6+MtmaQ3ruFeb+Zy7nIUuU+EvlJXPZdbfy80hluZNPe53KGvEsl/vyJeYW1doBkz5zm+hrD2KgY
	CjtR6OgJAtQejZG8IQdzhyuO/0qZwko8+wiZ46qDJKGIPpAYYzXHzlQLzYlm0aISY/TMrRURJhk
	5GXsYXPKzUd6G+C0rU3bHQUbWFGei+P3OkeBfIbMY/n35CzXfVWIltXPVSUYe1+zK77YjTNJqHB
	ubnnF+eZeUkcvoEjCLaEIgT0OJujw+qKTsbP/zTTlr46dmeN0DrMlLDMAPsa7sFfs7bgJ1nfMYl
	QFFpi1PPL90oM2J0nSs7Q+8zZpazKeqBNng7euGn3o7loVlLok2ThlyOE4bY+9+aZFGzeOrIjjD
	dMP1aGiBwXzfykBNvqlr9ebnacIXxfEFhzLvA6sC81GRTJlp5XC6czHhogUXlcMaVpSLrf/Arq9
	pqecIv9DOdB4Via61i4IUYH9bzdb+kDMiMToQybI9fJEA3vza04EGECWhJ95vm4X/CXpCkdJdXs
	c4UigCBbifZj4ooKAw+Ohg5InOcQFWczqiUwUK+nqXlU4bdCFOIRPQq94bkY40dyQ1SptGfSDf9
	g3DV/AVQbog8j577WRKdAh81JLPBMvTk5nexG4D5E8VsdAN1J7N84VRA==
X-Received: by 2002:a05:6808:5142:b0:564:3e9e:b498 with SMTP id 5614622812f47-56cd673bd8bmr887601b6e.22.1794446918084;
        Wed, 11 Nov 2026 17:28:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:48 -0700
Subject: [PATCH v3 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-9-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.15.2

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index d17fb2244923..2a8c44865636 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -273,13 +273,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +295,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpiomtd);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +349,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +377,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

