Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446951;
	b=eXC88EC62liGXNouRdi41Ju774Z4ekdd5qPnsn9klNPAHXgGwmY7LC1bfitv/tHMetvV
	 FsRDI4Pg3qbFAYYEc5LYR+2Zuv9d7+U5jtVA2S5rCd6jNcej7dUDznY3subOXuYKEq024
	 quJpJ6ZSoig8A5cCqfQ/1WOrg7aYVWszrSUn1TMzoGwegN1b6m56dfYCHZrfa1X/Zfm92
	 tjEUHz3Y90Thiscivzou8Yc5nPCabJPWS2Z6WMESMROyom4N1TaZRvN9SMbYXmCy6Z63l
	 L6eRRucD4Fej0h2lwlKng6wGt5KyKyYYx0KGwUfTyeiZ2kDUyGDTI1QFsaKekCLbqqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
	b=1RpXuZYMkSGFMmS4iyRPaI2DPwpiuNvyH7zY/AAr89UA0w8KYFqO3aKcurSS+BPp7+7J
	 nIQ26gbtQ+StP0Q0whe7f7ryWJclawlfioJtggirAwzm7qy6lbUVjBsvdu9ZM4wzi8Iqw
	 CQNM5EY3NXGxH23XXu48wu3qnx7GDsveLw+D+YS4SrLN+mX8IRmfqD0LM9qFKc8J0TAMy
	 adSKjzjTUzF7HNRiLOQKmXgYQbJ2c0WeFzu6NrVtulh3xnPKx5BVdMI1fpsIJGHp++3dK
	 2DNSmRIvPiRQwmqdJUARREN9HAwG8GgZuv4dVuVkBrMS4+R3HrBcFnwLQMTMWArmBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fknygLnO;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38AD606DDF6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38AD606DDF6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fknygLnO
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53ec2cc397aso2023881b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446950; x=1795051750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=fknygLnOpFvu1wyyTXBaVpxJqU9xCWTbqZypjq7AbJHRju24C2CSRGs18CnIiHIxPG
         MUETgCUxnyeWN0jLo42UM66KiWy/T6wXqUrhhS/YlrGD+IBwHR++W3hluAIirLm4HFlV
         Hz1OADch8V6nMRBxK/Y9aOdjIPkxNVUkTQkEC9fcR+lkZDmPseK/oMWyZCxVMxtsPMJ/
         U4RmWouXBjgniWgzN3UoXueawvbs+o8hzUwVQw66n11BRF++/genxHG+DZDM4RrbqNP9
         an+Zu+2vl5JruMDHxebZHVwrqLLUEsKUkpbRTE5mBodqzhGZk8nPU2CPiT/RB7CJHNUC
         G2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446950; x=1795051750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=uYj840cO8rm7kOpHuQcIURRz7JzuYsl2mJIcl8tsk1SDFy1t+f9FGG9hfyc3EN2mio
         c37gdsaR18JAyo80mgN/LOYzGzHmcstt12IaPTa7TLRQl9VXi6MZloV8/OZXp6W5fEbP
         2Aeq9j/xTyAZ1NLetW+e5574OSWskdUT9iT1wI4cVKbUCPg8U8wDw/pLSXhlWeWmkZ4E
         nKCT6UGhoyEwhpJVridTo+LWCpaxcgtTPmKQrFqrWsE3vp0DPQBVACVS1IYyKXRSOARY
         fSNCjbGZYO4QnPXiABTy+AStWGM80IV24JjkJn+nf6sd5wSH8ItCg32EDKw7+jGRy9c1
         WhBw==
X-Forwarded-Encrypted: i=1; AL+hErE8FzcNwKudP5uVFpLGbb35diXClq9oRt39jq+rfzfch2K0sJxOsG58u4Ht5pZ8y7N+P6MQRVweW6Wjc24=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HydSgmhvSjMR7AQoWm5HlTquW6uBusEqaMbAqWLQBjbHyPGfi
	QuXKSogVpVcyLBoR2EZfr5ziB5Q1AxVN5FQyeL+OEpgvjtEMy5/tiHco
X-Gm-Gg: AYBFou1DrXpJ+WoleAi5qhMOJi100PvNS4MklHxVzk8iPbM1EChu/JZ9T/D5Ln1bVZK
	9QlxGe4V/grl6ZuP3wJix6pNHRUGzzTPN901+P5YNiwm07BfR0aswUm66i4aNaYIFENiPzuLfhH
	yMv4OHcgJSBkvtwcebUnE8owf2nR+gS2xPClzH+IerVUP7zCfhAXL54MVS6l4DKcrIoIU231Oxx
	PZyM67nUzvt7op62FBRVYKpj9ybnetFccaG4l0pm3Zyf7wqg/gY8qRZIWRR93nl7LYTJW4W6rOz
	Vl0vzDB7ICpVF+lv7NFAly9XyUy9gpnaYGNGnUoMZx/j9NnuQlaUPcmoLuR/wExzVoeJgLKgSu5
	cl6i4/Vo9a0UggdW7b2rdG6jL67MohoOosHkDvVAvkzyRoMEuSxoeDda2FW5HktFqBfTX/bGqGD
	jpNCXE/PpkRC2QhPww9STJ6Jvqjf3HhKZjekygqo8Dq3mNyS1DDOw7jHSL3C9aIIc3bmwiSzzxp
	PpRS05KYtp7Op6Ag1GwEdSGMmgMe/M1Mrkf9OpB4mRgBkuiAdXfocwLVlFaDgspPrKFRexOtbQ5
	022EUnPK9QjebSL0uEeI7lDmv9uN0Oj4ogjgiSE19w57chTL2Ho00eNpJHmjIdO2sGXKnRc34Ok
	e9CfAl6nC05okfVxPC6KLNXslJtthE6DfSOE9ywNd289jg0AY0twqOSr4AMvaBdLXGHOwEI6D58
	GnRqLoqXngYr2IXEXvwYxrffOhjbuQ01jQfL/60duVIrZSZ+3lYFwC
X-Received: by 2002:a05:6808:c215:b0:4d6:9222:99f7 with SMTP id 5614622812f47-56b98327045mr3914540b6e.55.1794446949668;
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:16 -0700
Subject: [PATCH v3 37/58] mtd: rawnand: meson: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-37-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Free transfer buffers in the synchronous NAND detach callback.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 47 +++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 2a554f62a25e..871dc5e22759 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1398,8 +1398,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1409,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1427,21 +1427,23 @@ meson_nfc_nand_chip_init(struct device *dev,
 
 	nand->options |= NAND_USES_DMA;
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	ret = of_property_read_u32(np, "nand-rb", &nand_rb_val);
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1451,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1459,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_lifetime(nand, to_meson_nand(nand));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1496,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1550,15 +1561,17 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0

