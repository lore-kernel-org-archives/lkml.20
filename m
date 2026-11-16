Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810632;
	b=R3Io5VPEcsk5TWYDOXC2c0Q51S3yrEXc0UmvFgJCuoFZVm8ARrdUDXd6HQHR0iM11bCG
	 TYPA1z9vAx+gFAzaiE/HRi4m5ZqgpBVOPuoTkBlxG35vKF3ipAz3f+XwD7Z7lQqrrEqUh
	 7ewN5WAYR//rSexgagllVJVtTQuMEb1Cv0gfbQQf9/l2davPj6y03wspruJkee8ykLkOU
	 vprsdB5rlO37TiESRPA/v3FKod0YRwhF4SFexULjG/SVZ6HZr6izHrWp3UdDxdyWwjVaU
	 RZWOnLF04IKkCaVxALkYKu/dtnRgV24XBuHYphroki1vwBfzg3EmNhXy2K/ZE6qJrgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uVPWWKmrrXj8p9e5vViITMKgzrJGNIhKtx82JngydDw=;
	b=YOG2GEpj9O/ndlNe/M2g07No1B6mAYsm4vBJEIrkLOrpd5sAlcGzkR9U95MiZoovVUAd
	 ZgvpPig5PjnFvdD6X++JKqMPxdYNkRZSYNOJwNems9FzM2mvjp1MMM8yxeT58NOvKM7o+
	 7sv2yAB0B+mvucB4chNIiO3Kb94C82XpWUNMBHg2ZSarn2Ar96lX1CkSHgill6YJpY57r
	 uSxvw50KLjf4wdMAdGSUxPQtEUJpUzsjIuy9jAtWIdrkbfBHJTyNX83U9SCNqFoiDxfCV
	 tEO3flVDn/+f9FE4b28QAQUH/8gDJbJjxqFWk6y0BBZ4xQGls43WKa5XC6DAN230Uqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsSXXLzx;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BEE606C4B5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01BEE606C4B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsSXXLzx
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-716d052dc23so1090850eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810630; x=1795415430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVPWWKmrrXj8p9e5vViITMKgzrJGNIhKtx82JngydDw=;
        b=HsSXXLzx7O3NDNAC06E4MIPYzlL8jlSRO+pdt39tEv0JKMTL8gYo/mhsD53R6N8CaE
         smmqa2QZPUzBYZbnXhxsggRqx6+oIVoBJ4v06YIFHtHMd9zFmTAz8dxdVGNXXYdb6qRx
         2Ej/Vc94166ZdVGzi7cb7UslzDabhXjDK8vBnNzlqljQXgMYnf77r+vIF80CDwNmbin7
         1PWxx6SN8YHcGsPJQJxt6YcHTWUeQ80yEtl0BvVt+GPxAm+MjU56OOCKba9i1pcbkQaC
         g34BAsfWGX4A2cDqzdNYcbVFDCjEbVYpVYrXMNdvzKhQNbX9LuI+xCryHUoN93dMs57d
         j9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810630; x=1795415430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVPWWKmrrXj8p9e5vViITMKgzrJGNIhKtx82JngydDw=;
        b=CX5DZCuvyT53u8KGn1+F/rFod/JTJ1rpNT69hK8foWgrLOmNsdr0JnRHx4EvKudoSx
         oMTOFlFtZ2mDl+oc1iIFVUNJfOQ5kewtKtszem4sYspFbjJOs+7iiv1M5Xqgq5IfF0eC
         h9CtgbV7t8kOpp8n9hXyVqQxkf9TsKjr04PeL8Cb7NhMnV9feSF+UJjWLNpP2EkWbTHA
         iS/IhonOD+6O1kdSucq5lvIJ8pDE/EE2ziSNwFKoK+8OqWMOE2cSRb0JkbXfsn5DNe17
         GiUuMANm69/gLRgw2wo9XvEPjhIeESlNRkMx9k4kDMl5tqhAHnWOYu3UD7zjSYioYPQk
         XjJQ==
X-Forwarded-Encrypted: i=1; AL+hErGi/vDiwau9fQoiPs/jnn9ijZIuNh5pwmMs7KXclob6ChK7+NU5hLkXCcw3IOE7FHO6GHhJGD6PFoMNRvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sjDm8nub4pH+e6D7bib1Jan5v5Q3/Ddu3tK1BCY5x+ejAu7nH
	qf4HlwucHTa/tSTAsECGwa5tFhnU0+gALh6+IfZitmJtAyTjmLyxeuP+vzAr/6I1
X-Gm-Gg: AYBFou3lJDK1itsgjLc3LYAecaxdWOmnsD9oUiqYA25lOu1st4CXN1yvR09SzHG9yUI
	nWdc0N/aCFcpUJaOmOpNgZ1PcH48Bgbv1KTju5m97pLzkO0wTTGdu4uLZvaM7eGmq+174g4GDPI
	fC1n79Tu2ZRVPQ7nNsmdWa3vrVA33phgzCyLSqAQH2TfsON/DL9pspqShAp36fYaECOYSkHuqsq
	rfMWb3hAE5Ua7yt6fzZAlk7H8s2jobCuWgoEJp2HXhDi/NJAQkzAXB//IFFlHJi6/9V3ZhStQ2N
	3Hxq82MubomFp8GTvj89IxOgNIy/7AfiWgIvGjvGAPkAnhUQx0UNQ4/NUBGSRVEVIJ+ymPbdWVT
	l0cC2+Q+CPAV7zpl870ckpkL3MYiiP4Zet9MIL7IgehfpnKWYLyzQPkYh6c1vqP837XapoafHMK
	jXD+TyXh0oPh98PeMMNI9mmA5bqNntp0fA42RdCAC0H9zZn4QodecQSinCPom5Gl1dqyyJRoWvR
	pvgz+MYVlZAT4M8396Mg2XP3IWQt2Rvw7WYqlOGHHx1vVNrKPxov9dXR4OhGmtCQNQGKUy8PtzB
	yf+7hxT0GfH2+sth6UqDyT9OdJB3WDJl8L6uTapn5s7wTvMQM7edoihyHt5NsI65uuFah7ARxqH
	Nx8riYyV1Qhn0JIW8wVaBhFr1/QdOc9IiN6GGLBq4vHmLOHPVPWDKVR8dfDaXUjD1cn4S5kcjKE
	c/v986OpM+6opsdKgrBkwYHJkAaRzgOcGlVveiNfrLwZxHT7AnP0c=
X-Received: by 2002:a05:6820:4607:b0:716:cb30:8a47 with SMTP id 006d021491bc7-71ab526fb1dmr4759602eaf.77.1794810629906;
        Sun, 15 Nov 2026 22:30:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:51 -0700
Subject: [PATCH v5 36/58] mtd: rawnand: renesas: retain open-handle state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-36-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-renesas-soc@vger.kernel.org
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 35 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 135cdb67a472..8a2a55007148 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1217,8 +1217,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1228,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1258,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rnand_chip, chip));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1289,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1304,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1322,12 +1331,14 @@ static int rnandc_probe(struct platform_device *pdev)
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

