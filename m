Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446923;
	b=EKDFbC606wJrezSofhc1OBjM/+yPl6OJvCMJPDL6YVDfI2Q9awq9t9jcmYHm0ejsufrQ
	 ccc05KAD4671Dne2FlPaz6FHipjS9DwT4w7hm2yQU6p0/R6VxRALH54EUPhRKIvoHIL7b
	 t9v9q8qxGDMfVCFzfutYdmeCirJGWtPR0Ev20mAQn7vv6HJIGSUD0KEtI3ZIB9BxJZtex
	 /25AI+acVn8w9AF3Mxp3TE59AHKpr/fdm32dLJraskZZfjzFQ1uoXgXY6iv4UI/OwMx6E
	 4glHy//KDXZ7/NgiPODR9kkPPEHsuDVlBwa2arsspkbADwf5w5UczAB5WuMoiY0wkSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
	b=BKwyuRCOkrPirdP78s9VYtA8Jaa47AkAu45tj+yPluu5yUiOG0cUn1BTUmxWESbw0X6n
	 iT5f3tj4W0o04a2/F401PzK3g60SyJDRqDW7VgK2BCZmedVjxu7MBXo6ceFtTz220lPu6
	 1Jy2sVa88gNYUrTvBKfyzkD0Qn4qBKq+f0P5xkZh/blWH0oggNi0T8/Y9Ugkg4SJNmatF
	 DnMTeF/W/6uZZTrdOY26owS2TazEtBda+wfu+IM5ipQtq+IU7AYMkILGYCp4fAab8r80Q
	 2cZgSXfoAAkClkqkm1GQ+s/BJKZguMP8lge7RcBCsteme27JdmUg2DPkjnS1Ewb6u+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MN4f9KAV;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431B60A380B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B431B60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MN4f9KAV
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec9237600so1849390b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446921; x=1795051721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=MN4f9KAVTAAZRWqZG1ErI2laZYDIs28nop3UBmjX6qG+0KM8ntsj4+wN8o+QrdWOZZ
         6UfCrJUgL01NlYAvnNNvbIaZuPXxlN2fDq2wDXPZEqDMTT5dFKRBdAuxlI4S/ugDb3or
         KWkI+RN2OSXJUEsBzqbJsTTgFFs0YVkO3jyhTERHbz5+g5kSHt75FjFxcNbgd9vkQaY7
         F2CuSv72lSdXwvhEcagD1gq+5Xp1p71gJMaJJgpdsezvwDIQhS9qckpsQz7aDkMT9qR8
         +FCWEtqfyQ0j0qPncQ3OSlfAJx7FQGa51ED33zwY7JT+NBOy9sowpRb9daJ0wglHUFmT
         87ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446921; x=1795051721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvDXsJc/tHKQ9x8Zd/OGcZR11iZ+N58MwVpjl8HFytk=;
        b=zh+IGB0nDfUV8E6oQXL8qMO7BdlFdprfEzg6E598Bnd5GcnlAI02k8yMX5Fggfmu3X
         3gI2o+aSG9+fvcxBL2lySC1yyQgHkA+E+FuM1wSgzZPK/Oo0mJyu378kRR/n1GF4I5b9
         eDjLuQgQNQ+XRHbv9HuFilXuGVSOCvLaB3YibvJsU6qfYLeh67lVdp8yKTwuhr0yrfLY
         LNq4o0NzPyHtxxEHIz+WysYOjauV6kHjyAPW5W8+LCT9AkkISAZgAYuCoxNKvfmsAfdZ
         TAEXFm72cjInGVwJkcgUeRGnrzXaktV1s1Co6NZxPuQvQ+PU9PFeuYzZYZkf9TZtTmUt
         BSYg==
X-Forwarded-Encrypted: i=1; AL+hErGqJbDCYSY5hXwZxbOzJpbTQybe4wLsTV384FgOlD4dIKznX2icHYDUuTp18Uw6HKSs862eDejqIcCtu6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z0IXtI/7uX8GLHRHfF29C0/PNIBFLdcl1e9HCIHdXFrCfU7mY
	wihb9Yuy4VbBtan8X6EwV/7VOi4eBV/a3rpJZ3dRjQfyCHLw19IxOemF
X-Gm-Gg: AYBFou3cw4ZBriPwtpC6u0eTpXCvSAF8MNxO2MV2/tS6AD0KhZWRZsR22vJWcU0mXyp
	ofyxmrQu4ByhfFFKIQXfyUBUTCAhHQOLJGYyVqTdS7fY7P5l9HY/nEvtltMA1I2btzGFwc5UjoG
	043bhJkj0u03V+werzSvDe9DeO0CYzGEohNvybHQcl31ymVpmTZGj1/FumtyT3nV6f5B4m67GFY
	tX1+VBeOA7oaIb0ngY+LdKrj7fI+EURRNEKfL2AfCn026Unf3+VQfrbM447uVfzsPAltcK3USey
	xsvewqa8MYJTqxM5OjQDW5glFNP9nEHBdn2xry+Y91nDwsmaglgGV7kBI1bvQ3/HvwonmQqCLV9
	gANTyOqQ4iV5mGBQCwPeGgmrWj9VYkCHoPKvBC1HkZmDIdp228yYumEtkNOiVQ8JdwFa24wuGPZ
	f3EOpuJQN0cJz1rvC5H+F3hck/avMpF0k3370xcpps6orKexnxXjzdPcVvkWZP+Gn0PEN0DyzdN
	uuJXMs/qH0uwumCpA48uzSm7ZVmUyr9jw73MSADpYMUKRBrKWE5XWFta/Y/j2FFOxyI+sE/aKBR
	/J8EnagI8fMOw2gt2Hplb4YI24JMSeA2gUANxJzB9LaPHWdgKEuruvvWynfTuGCSKy+gSIGB3wU
	M9hxrw1WrvNsEqd117dK9jQ0nRPTMV2Ap4O7VpJtrLjL/cHt/FL53FT/rOY+o+5f7YKTAzfY/5V
	XbEVMyM2tCsrzXF2G+xG0va7iSOzQ/ThJe38lUxtJKZcMk1GEM+LX2
X-Received: by 2002:a05:6808:5087:b0:55c:928:69d7 with SMTP id 5614622812f47-56b97710a41mr4004524b6e.67.1794446916902;
        Wed, 11 Nov 2026 17:28:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:47 -0700
Subject: [PATCH v3 08/58] mtd: rawnand: plat_nand: retain open-handle state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-8-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>
X-Mailer: b4 0.15.2

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Run NAND cleanup while the platform is bound. Keep the chip, controller
lock and copied layout until the last MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vitaly Wool <vitalywool@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index a2775886e7c4..7963ca2d4557 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -65,10 +65,12 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +79,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +127,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_lifetime(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +140,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +160,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0

