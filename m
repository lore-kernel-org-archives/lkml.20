Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593739;
	b=mpLPtlP0X18WIpraR2jGL76Ca4Dhc5kyjUWDLagfyqyhTnjpciV3WAKQkSjHNNDo5h1f
	 U0sZPCeNyvw2Da+YN/EA47FLpTg7C3vjFjNQoyerQUY+3vc+qJTdjvgYi/JbbtJsjslm8
	 R+RFTfh1DTRL6XvyXfkqzjZt8++Vz8BrS5tZAV8C6cCgyE1dFgsnXTcp1aPgX/xjTzcka
	 x4SOAG12gLdVKCSTyJcyDcsCUA/jJfpNgQEAHK2ut7XgxoPKaVONfR7Fk/D/oczjz3i8D
	 XtY7O/GjMzGgYeTnZZsMOaArqRSe3dEgXp/FVhNKYvutJZJqtAk1srKgm6HcClZQDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
	b=QFFwKbnFI8sBFeM6x8+lYKqcUEZHze/q/K1jRWjLhlU5RlIGwylbhxtGr3MYDdjmv+6p
	 4aHQ5nRZSlAqCbIrjxMa8nOZ7UHPC+M4BaOftfwHYBi2EaI29RcFYAx6wA9hM4hU+o2Wj
	 9gWWHtR4/hPqEITAv+pGhaQnx/9yu88QT9XObUBJLfeaYE+6THqTBGXiP1novTnYyl22Q
	 XFIlnZdXrBpQPioDayJB+bT8i4hHJMDxKykOLxeGr9UJZP+XbcUAGg1qU7QVzDFbMzlrK
	 uHM5VC7prk01zsAQAUTaywacBtoLySIux+DNtwIvTc6OjkyD7b1FyZeN550rWbOu+ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIP30B7G;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962A960A6F7A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962A960A6F7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIP30B7G
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f84a55cc06so1486127a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593737; x=1795198537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=fIP30B7G8d6tDlVxQ61as0ZNgndi0TWKlLzaIXOWzsFxN3LT812qftuurizAFaQZ/W
         F8jszA3D4YFOua706so9le5GPma83PGZksrxghCGuhZQIXvwfzKdrrspo74LrAfsDQ7k
         D5AW6vFYBkndvGW4HLliUqrd1pgF3DKj3WeCiruG8XA/BQB4dHV/5f9CRo4vQBmjSc2x
         3WrbuPxFdV97TVs2gk+SmBYWKnc4SzJe/lXw2g0+ji6kDGprM83KGp54NYy6fPdXkXN6
         9BeJXMO3P1TMy9j0xGDL/nV77QF2HSMo5KLqiOIH5K+ICDQxbAm8Nn85XCIc5yWoyh7u
         306A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593737; x=1795198537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=zcSSUWrAgkS85mK58xDfkkWkDSHU6m80NW57bRdbVwXIuydyUD3W0vA3oCT9ApYkIf
         m+WEGsoqZePCik+vb5X4oWZdwl5CLrnEQlo9MOe09RsnLHwgxR3i/k7WZUfJZIwkpT7j
         zP4v3doU6UzV/XhJEk4CXxAJgOULVUuQvqwru5VBXP0LjptEzsF46PA9YhxWe1AyRk7V
         aa8gN2pucvTiltat91QNrGQZc/2xpyGF/SpEBbWP70gCkga/YzVx3ZN36oKa0DuKqe05
         7Pw/zW9Aqi+MMYTxtQypTIzOzEnnfQfmbR6O+Iio1F955fXcarkPMQyaWStCmA3wCbm3
         t0Tg==
X-Forwarded-Encrypted: i=1; AL+hErHvQQSWN2WbmuPZUGf3wEEVOiGBGbV5rHHB5hsTN49ocoyzzf2ODq0G0FaShTKFoqckmeNlRQhDOWCiqac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bQ9BJTAqjupXZAHP8Zxd0YXGZZkalm7QfmsuxQKSsQzuIuTbJ
	112NgFTq1FzgmfiUUI/rdTxqo0HfE+mXm8U5bXo4t8OqkXC2F06Y8eMKFjZeYpcX
X-Gm-Gg: AYBFou1sSVAWZMtZY89XLNUf3EnOZYgRIOQWrdePGfzkZ4hMP3v3kNLaey1TfuMKqj5
	vHYc4oiSiLsV7MpUzOVreKVa/oJgxXZ3IaZqgjpxR9NtC5ryuR7sqTSZiZeclScjibpHmaMmFgu
	5b3Exr3Wo07edU+CLIm5KAQHbX3gSNig+E0VUNGb+VS4RMVqFl24R6oL/dBLA1xtBnseH3GgEoj
	wBaHx+zgovMgPr9ygjD75otaSybOLDnJYO2/ilhcIG0UQmOGmrs0YZdtB+as6d38uz/FTRBncYZ
	ejpBK9Wjqi1Ni63o9Nb21z/I115Y4UxZ3UNUgk1BI79xsLqgyBuyLdpf2F9dxcVsulWjLetuT4A
	G0eDIRfU8iO9jA0UxC+T9sypxnlTeUS8czTs0ED4Y3YFJCQOtQDPM5iwt6sLg6tzE/GIfGuv0yS
	vJ5sKmRTtNG2gUEyP0M9nsxH/EFdHugrFUn6zSGNA0LW9zTEa1lPRrmGMeAYB/925txERJzJ+C3
	JZHctGyCslEcH4HbMC16UAsWLM2a1shhGc0jBLiqKfnzLt/5GRvpC95IhHAt7C6XfkMGZQcDYwi
	jfc2YCb+Ild1DK8ECIPZCCdgDwnHy263tnlAzvjE4zACqu7F/TUPN73Oll2F+sWm0jXw8mD2v2R
	zQZ6GmTdrluojiy24B5MJ79lBNhrtoJu4H1+d977sPxHgog/r1tn620yZQUvq1qLlaJZrRiLthe
	+YRy6JOrVp/DbbUSYc6fQYxurd3/PXvzt0MO3M0of+xuqejY7+Fs3+
X-Received: by 2002:a05:6830:4489:b0:81c:37e2:2012 with SMTP id 46e09a7af769-86289870d4bmr3049997a34.15.1794593737543;
        Fri, 13 Nov 2026 10:15:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:34 -0700
Subject: [PATCH v4 18/58] mtd: rawnand: atmel: retain chips across
 controller removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-18-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>
X-Mailer: b4 0.15.2

Keep NAND chip metadata and SMC or HSMC controller storage until
retained MTD references have been released. Disconnect registered chips
before releasing DMA, SRAM and clock resources. Give chip initialization
ownership of its allocation on both success and failure, including
absent SmartMedia cards.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 42 ++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0c79d30b9e30..087b7b5fe987 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -62,6 +62,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <soc/at91/atmel-sfr.h>
 
 #include "pmecc.h"
@@ -1629,8 +1630,9 @@ static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 	if (ret)
 		return ret;
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	list_del(&nand->node);
+	mtd_put_master(mtd);
 
 	return 0;
 }
@@ -1639,7 +1641,6 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 					    struct device_node *np,
 					    int reg_cells)
 {
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	int numcs, ret, i;
 
@@ -1650,7 +1651,8 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 		return ERR_PTR(-EINVAL);
 	}
 
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, numcs), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, numcs), GFP_KERNEL);
 	if (!nand)
 		return ERR_PTR(-ENOMEM);
 
@@ -1735,7 +1737,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand_set_flash_node(&nand->base, np);
 
-	return nand;
+	return_ptr(nand);
 }
 
 static int
@@ -1749,6 +1751,7 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	/* No card inserted, skip this NAND. */
 	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
 		dev_info(nc->dev, "No SmartMedia card inserted.\n");
+		kfree(nand);
 		return 0;
 	}
 
@@ -1757,19 +1760,29 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	ret = nand_scan(chip, nand->numcs);
 	if (ret) {
 		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_lifetime(chip, to_atmel_nand(chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->node, &nc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static int
@@ -1792,7 +1805,6 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 {
 	struct device *dev = nc->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	struct resource *res;
 
@@ -1800,7 +1812,8 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1858,7 +1871,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand_set_flash_node(&nand->base, nc->dev->of_node);
 
-	return atmel_nand_controller_add_nand(nc, nand);
+	return atmel_nand_controller_add_nand(nc, no_free_ptr(nand));
 }
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
@@ -2044,7 +2057,6 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	nand_controller_init(&nc->base);
 	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
@@ -2360,9 +2372,12 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base, nc);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)
@@ -2439,9 +2454,12 @@ static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_smc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base, nc);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)

-- 
2.53.0

