Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446941;
	b=clQrF/HDuga3FAO0obO4qCJL76lCKLPEOVPDRQRMUmy6AG2KEZgZhZYahoJUB7Od+9MM
	 Ch7+fbfhIbS4nYQO13b6HjihBxz1leTbcLaO7Np8Sqs/hVkG/vwo+7Vipk3BdVImnEEsr
	 WGSPHpij6VbWFid3ujW49Bx7Dzmgs7Oe16oatgtGRc/5/xXJ+j6Z0ebrMRlslJh29tE95
	 Voz+Wg9gc/0utWUvshR5c/xHQBXNFxxYFtT6c7AVNeU0t/CokzTJzRGNN+XuV6QqpkzIs
	 Z/Rg+i8xJ+bz3mEp+Oq8s6kUJsAlZoEeKfBH5uX3MvnEnAtcPnxztphopmFm9H6NPrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
	b=bhJkEEMU3CqkAFEPeKL4N2w3hOFfm7OKjQbWRsAhFgM7YoGC9KJS9wA/q3IFlyu4vqwl
	 jCb4PPmCFKqnSG4tnFL8cfWgDmxJVH0I8LGLlnw/TfdCowS57XA5iNmx+q4xg8ARFriad
	 JgOewWBq1puVgWxj2SuY5z1GnSQgzMDud+SVDUSKBxFTfZG47XQi+qDLP42FbdjuR20ZC
	 a39RSjDr1grTmldZlxgX/rg/1igLiKW9+TPNs65xOJFcq8CnpGl5ATXzn08Gjo8VesZ8q
	 dRb49JLRt/qaO8uF6v3ucEyiGsrHjOMTfONjmH9l/C8zXr4K2SJnbnYyQ7OWqx70fwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbzERR9r;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5595A606C190
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5595A606C190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbzERR9r
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4ed6d69bdfaso2359634b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446940; x=1795051740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=EbzERR9rhE9XeCUJTFlRMph21Bs1HFyCQhhcvdYjiNrX+PkbCRO9Q2V7IHV54lEMkA
         /RSxb0f6Tz+koxj0yRtDsZWEQ9Q9D9wHToXP3aK7e/1Hw09FZcOacj8ECmevy8VQ+e/c
         J3n0k/zawy9ON+e9pjswYHwd5aAGWR4D+qz0n311HwsA69zA14bS7jATtodvo0JXFG+4
         VBLPCiyuAmzWGVsRCh0vYw/dj05NZhKiEaybiM23DfzOXDuKcDbRTQMcTIRbGUgzhdyz
         P0r8BD25UT5AuwdjUygvH0Uv243n/9O2pX+pDZTOgxZnEyEA2IqyvoJgCsWZbxlIkRmF
         JIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446940; x=1795051740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=d9GKZgdWumEZH8byjP+ZEJirS7Aftb9yTjzdImKwX4/DjKnPt0XjQBckcgkGXZp1Ao
         1PjO5Oyvomq8jNNT+n593mU5S/bhXa6zFElCCP9sgzmovPsGYO+lHEGg+myxlqx5TRGH
         VeQpeOxeRUBL+ApvsW8H/SFaL5FaZhFqeAqVRlWCAUB8WcqK5mc+QHggmJy5wiavY69J
         oGfDVeP+et7Qr+MvopF1Hq106sc44JMhixouabXwwlGF3WCrtvZPJO7r61+aU7btmXVK
         RqdUbnfkqPF1L9SfhAjOWsI46olCZTq+w/6yPG5f9hatc56qjtPjgmHtx9fAAwfmoHi9
         f6Gw==
X-Forwarded-Encrypted: i=1; AL+hErFfLhQ4wL+apMSihftjPVyX8gPqTieDsiO/B1KRVMhj0WFsDkE1Njknj8eURcM9tQWY/mLzrg1VgE2T2QU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cPlc9XH76uXCBBKDuBt1zcmDIujCag6bzQLgJvWVgYDCekm1H
	/4ffUcVjxLjgyNZwRK+XwvvGLp8iFXPB9O2CNDLYrPUyoT1m6ghXTuFX
X-Gm-Gg: AYBFou0s3I84giHrd0GOY+d+iV2rlpaR0UpOva/vHucx2EmgFZPL8maXjJBXYIBjOOT
	vBElnSEV1j3JltOJXjJ78Fm7BKt5zr+5OfROzkHC2vBpqFKVAui2RWE9mEe1TfUrBzr4Kf5bCQS
	ogZXCp+hN073HaMrLvtq4dN+M1GwPsH5TJ7XwIs0iS+/lb+l+lkODEnqfgZS79fOdWXoU6ELfgf
	RIKPDehZ+lZStgzDH6whiu6dJaVXu5lwXpAyMkD+Yr42quj8Ar+lgdmW0W+Ro8xW29m0kuAoiUn
	vhi33r3L3puyx87/zUmgWC3EASecqDW+2dAig1bTjCqUkM3nvuLkAQpfrW2NN6HPNKVX8wqdUqu
	B70VX2tk2C5/tT69oMePZ94mnsXa/NP/ytJTMn32BuA3GpoJaVpeSUI6ssvwyDzT5SVlNYI8qM+
	JoE/WMR8UDrjC8XSI4SwEgS7Qany4wkVocQD5rBsw0CTBZ7jifiRgK332U4GlmgCN/a5m/4ALOr
	ViChx0HUkNUf+bvZiI7g6OdVfV+VAiDoZPpbON/X4TFDQvMCGfu4CNDr+Xp8UmTjuVJkb97MPct
	YPSrfa52BnrTNhNdIhLWyyLFlYKqCyJACK2TNWDR/bFCRkJdvbnP78YUL6grZxiqZ7bOBW4w5G3
	uJ3D8QPVF/xUoy2NlyP+OWD2HTVnvgf2W82IsDPEdGgwQlXzCM3P0u0g+L89UGsFG3DUiWAJ0Wh
	8nH1kXQbLyxq1/apzd7gP7POHEf8RoRxY8q1Coj2sdMuxtbrB8HMmk
X-Received: by 2002:a05:6808:16a8:b0:4f7:867a:bfa with SMTP id 5614622812f47-56b92845782mr4039294b6e.5.1794446935572;
        Wed, 11 Nov 2026 17:28:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:03 -0700
Subject: [PATCH v3 24/58] mtd: rawnand: xway: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-24-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded controller and chip across platform-device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 7fcefb24fc23..89c4cda08794 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -171,10 +172,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +195,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +230,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_lifetime(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +255,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0

