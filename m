Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593776;
	b=jqzGrFxetkICQEEHpisEKrEO1QVr8Nl+L5RBo+1yf6J68R+BgZotQJk81E0+7f+2Iz8C
	 Ahs/DvXhXEDIc/i1Htun56qOfyVZlQ1ELg2P/ywlwKvLm+yC9qmEOLqguyLWKYxodFPxN
	 dL+slONfg+0KbcrKFiI/N/7mlolJnVhIBQuP3484VkliY/SjjISZrqznzjja0fcnFyYtv
	 OJpuqznr4si0KNDI27rkeAKRB20oYKslQcyTtFe0q/tedbCAKyQTNk19kWtJsQu67s60q
	 kjfg9GO35PNZhjcev+Xao8wHjDjPdRbM/2OkMcNtdGv+riKgO8wo4rmK6cIHz6jCAIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
	b=KNasBEUPV4k+HCxbV1ccmq/zoI6TwdO+F6e8AVYVibbO0tNsgi9RXWYqFrPsFZ3LeCyx
	 VcZGeUb99C4ImS3Z+AgFhXW1vv5rorIEa1Mn6Jfn1WWmjRs083aGx8myrYU8EHGAcZ/QS
	 nB9bnuXwDE4j5XFAF2zkyeGh7sFjjXyWPSimcJ9i4eADbWZpJbfc8Z7Jx0LDrHkSdmEQY
	 QYANGDrXjdz+Lq/Zt0JA/9rF/lMSiMU2XFem7O5LWMOUz3tzzmG5YH3m540p07OD4b4Ax
	 FyOly42/oe/xBvgjNrnQ5SJStXl7b8O8tzdXTv3q6kep64S0iowDMuoL2CrU1ylyKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gHD6ojIF;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DB606B234
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026DB606B234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gHD6ojIF
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843cf077f10so2770322a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593775; x=1795198575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=gHD6ojIFam+ZzwqVssEDy2vGgh/ImX+T0gS/uc8e5o5FBagBr8UmtMlJr1/2eK/+4v
         Cd4IH6ers58mpFrxqWz/7q9OnSIvOEL32xaoHHMCKl5pumRjg+coa87D1DI2Su1WA4wc
         g88sbLYqTPppv8m55JRKhdEyuYl8YK6B9ctGUM+Y337o2YO9O/CRPNOrdTMObLGYJ6Fj
         ZCnCKVrftnsYM7XfQEfJ4em225J5zTMp2n799o+rm/xqSH1lehRl5kZFt5dS0HGlVW99
         Q3Bdq8MHVqmY+gPvaDRP81ggdiJcjP3kibaBtVC1Liz1PpYTH8tdWApZkuRlt4B2UZnv
         DOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593775; x=1795198575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=JrxLS7prd6SQ0IBrMGcwm8Rtb1vzeiE/5j9N3ZlTm8lBrGytVmcdoyytxYVMAcgi1K
         VnQjFMminzYx9B5jfIw7uJA+HC268b1c9No41nolX5tqpddGD7X2rxES39lqAy+p8EtL
         vJGF9VbUoikJxysBA4noMFOyuXaI8DzhZr2+v2EcL9ahmlSzcgeRAOO2ypiN4Vx+HfZX
         fLE6sXfyIyuC8CAvngetWYxFe6x6e8Naqp3jnAnml0EK6dI2qu69YZUjTgxCHB8N/kiq
         s8i1O9vW0tVOiuR/DEhdGCM81HKWOMQ48JL9Z6KpbfIHE7JE8CD9AsXnCfOfPozSs0o1
         P2dg==
X-Forwarded-Encrypted: i=1; AL+hErGptiwnFksZ8DunhUUG4NPycMHwtqcueKR1i1frlSdAj/3W9FrZ0dvIkQzD1HKpEOjNwIuy2oUnATBjZek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KGHIc8y6iF1XIZxAP1EZVcU+OTRo/FK/IkgRhVCQpsSfYTV5X
	MTjjDiEq9VLP62OH+6MRqgablVX4CX1UasKIyovuV9CWK8FrrtN4rutIXeOyVgW1
X-Gm-Gg: AYBFou3zB4JKzAZ7criiNsXaU8QWN/d9Qo82H1SWkf/16urahJZ22+6gUS3ET4wT0ND
	BP4FAhyHSOc3+X2XcO7PWq8gc0f/xoa1mq3YF8xT0cODELF3AJ5DIVYRbz94rz9D8uu7ooyzYMr
	q+MsTz1ew3qGDT3siOHT+605n64fGqTiSD8794C3oW2tX5rXuPxJxQdrkdgW6J7v5YoIbjOHg5E
	IWcRktR8mshcvnvSFKXa1O+NS9D02uFjp3g9eLINWx8nUK/dGM9/DjWiU91ZM5aFIacuujA11KQ
	xf4jMo9XA/+D5/p0Ko6cPLWQsOltk6tf8SwDgdHpmy7wSDPSZFs8OzRzxfICMeQYi3ZKhdb5pHy
	E502pvVuHIlXZXlJhmgWhUIKqWg3gW0FAguZRRYi9IcsctS22QsTXUmdrzagx3LTAZJ0ZDR7qvY
	SI5jgS7LPfoKu0nh/6CTvmgy4ylg1R1pzjA3hJmCgxkwi2wmHzysh+cMPwyAvU4thKCT3kV2c1M
	ghCsr/PNKT747OuHrKMV/jJZVFKWd0MZDon0l/awx16SH/5NcVhwUKbVcRxvXo388XoKoE7EfHz
	1SdKP8jrWcOgIjo4zLt8ycLmZGYpK1U2yA8sI4YoIUWAoj1hi/3aWH48dHziTPSUKrDlJI3IqmF
	SoXq8qS2VjC2ORGYqkI90rxmUljROznSvtC86/niLTyKInDu4o8Rt03bIG2/zXOMPOirPQPXlDn
	DH9lm0Y8Lq7oNfg2Cf1q6a+Jd9kJJR6tmmzJGWO9dcdYMxrmobfaE=
X-Received: by 2002:a05:6830:4489:b0:81c:37e2:2012 with SMTP id 46e09a7af769-86289870d4bmr3052287a34.15.1794593774827;
        Fri, 13 Nov 2026 10:16:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:53 -0700
Subject: [PATCH v4 37/58] mtd: rawnand: meson: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-37-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

