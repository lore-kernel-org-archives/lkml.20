Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810632;
	b=08M2Tn15DtNB5dFqNW1Euy3pv0ZfmFpXst8tX66auNXpRHcfEL01toXR9RLeU5t1ycnW
	 KNpr7z3zv0N8e0ksJnsj9Leh4QFwJiMKU4QsiBtbpPrCzZsEeqFaLmQntDSTU86ZIo1Ww
	 1h/GxmfMok73N+KcuQHsdTNQuYbYhGvK1QGflzOOgNfGe73OG+v2hzW0bypbNKH1gnXex
	 obqhh6hByMaiiTHxCd0gLI9sXKJp66Lok4xTphuZlew6BgqShbAMrRLHL1io4U23gZTW8
	 iVzyQY6MSN0YNd8F2cP6rNZ4UOpmDpc/tARZpLoqeCqxLlvU2MtdvL63ji1/JwTrBPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
	b=Ig9qUC6tHjbdp3SSoP/VIVvz5gXbTuKUe/wWesrav1ghn+oJ8LGYxOeMZmGP+/IzXA7o
	 /YS6AJAR1MvVNGJuzXqTnT5TlGKMkG59A49bGA+GtEzbBTfAs9QXrfsiHj6Nf+Tyuuvpu
	 SCM1eZIpWYDNl619HzJ9779+VLy3LhA3p5nBuy5WDjPAxawdmMXlxR/s5HBlXf6Xlpx+R
	 MS9ye+CTYhiKnzFlvCEV+xzB9Gytibha/f9Hx1daAeMS5YXDZQxlBwM4VRO1XphnImI01
	 b2xTJP0PzbK4XJGJfgQXsE4WNV1h+mOkOQ5nMS35D10ILWZfG3ORIKqBnW+W5EjHrsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwPAuETH;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D860A3810
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426D860A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwPAuETH
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-716c0217635so4204338eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810631; x=1795415431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=hwPAuETH0fxABBhOZkj/Sl+55xMEO3gQaQnRsicVGPlT4+/LTLL8gTLm9D5gCTGR6g
         6E2F7YDVcEOI6ULaWk1Ng+E0oUvFUZhYDcaMxfj+ysr2PfD/LtcJt9FQTWtTiFNMM0/F
         iyfTiL1G9NOBsB66YL35zT7PtEmUzVy6ApzBMucmy/ZS9Tn5gcSLDfu1ZAiVlgdFktne
         LVD8HiFa3j1vd3mVpJyWHnag6ExORXwz9hGeN93fDqL7/R0AJV7stDuVxkMdADj2OVXz
         HiBK0sburOaPsKcntN0Y8uQaUCyB3C6Zkh3ZaHCHlMKtaaNkN7FiW+IPywY8YPgqtSk3
         psAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810631; x=1795415431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=UAeXwUr7YM7Waq4ZtzKLL3Mya6n5uGdO00ACe7l8fOrInYDQ/Alwv751aB3Hj+BuwT
         N0hb/y0hXm0JdFC1y5OqRgCtHK2gTVHbZ1zhNypuNLcr19hTkCDSuzwx/OJp0zaGCU1A
         9ZV0azmdIUomjHPCqnv3HfWVZHUM+tmVoRQS9XicbPJGzoXYYLWoLB+dLAxbnym0KRr9
         +bpQkdqWQcWnq1srPrsn6ku+gRzS1Yh6rn4EUOaYYb++v0iuqtsJi/ZQZPskTjDBfdih
         A0IEpDJeb3/ThSzsZJJH/kr2P4gc5IxzjepZ1Da2L+OqqSE171LKObzMWGzQ5sLNqLPo
         Ab6w==
X-Forwarded-Encrypted: i=1; AL+hErFPTYh0t66PfLmzwmC4imRMOq+L4a+Vzn56N1nuSjX6wj6B8aTWZinfLvSTw6BiM1NgJ3Sq8U+go2RNF+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8scmPjIgbZp8HxOtAIIz17HMdbmugPBikOPZ7DluE4ZL4u0Vw2
	g8RDawNz+By6r2Qx/27r4WW2Gggn56WtSY3BBwxLyvc1e2+TXTz1hkHO
X-Gm-Gg: AYBFou01In48oJ0dSwhtzbZj13mpI5ZBYQCmseZnuHytX7kJpbTzwpVK4HstnfWXJsZ
	XBs5yVFYCCI0UChXxYDXpVv0wYsyng78n0d8eCTpPAImPTA8+RTOZ20ymH4C+JIwakluMDO1chI
	4ImnGuBlTL94mTISuzoOrPbuSE3sbpekNJIU/mL1bnBInhyzJJAud09U8t6diVE7NtZxfbKEHM2
	3xM50rYO3CbQ8Z+ctQF4X4Dkta18iDmwDdBp4sG3BEzivZslmeo9r0U5KKR/8gsaYx5RLIcJ5ET
	eW30qJ4VaS2SYpu0gUwWt/lyvBP1dIOrKvjMC0Ca2YgkWp/EOapUAIbwsgsO0x1QI8VBCSfvHyX
	R5tC6ixeSw1SIhFd2dkIWFCWHfxXFfwLnDf/mqIhS3F2RFou+lOq6oMg6y1X5klLaWWUEkhppen
	wEIqGAY2SZbhKEo7f0NDQqVI1CWYqCq+5vtVmaCxwriu1o0OB0jrJ9RblemzSKqYsdgvWjPimbz
	nA8OWZJeWWsj4QMSUV3FAVAkON4z5yc9E05l5P4wfIkcDusOKo4lpFVOlBpkBEC7OiFeFcmjnnM
	rXud97mzUT//mwCoEWYsyK6khU5BVxKtgabnEF+N71FPuXNmBLU8IfBYYGIANaA/uRu5WTXAJwy
	MUAeKpFjk0rrA0ZXlTYPIc5hJAmEi1gPlT6c0WcuTn4BP/K0ka3LVuuZ2YyyWkFML5TKyQGwwui
	K0WXYJtoqY2wDRI6MUHY7Or9DjHhpRoUMV0lJpdDOo7OQGxmB5WesD
X-Received: by 2002:a05:6820:1c8b:b0:716:b936:7cf6 with SMTP id 006d021491bc7-71ab4d8584bmr5458319eaf.4.1794810631234;
        Sun, 15 Nov 2026 22:30:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:52 -0700
Subject: [PATCH v5 37/58] mtd: rawnand: meson: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-37-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev

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

