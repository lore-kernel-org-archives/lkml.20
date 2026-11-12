Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446935;
	b=pZwGA/fi91ERAd8SfFxIrU0E5JH/Y1mwQDop3A5P90DACV2xOeUN5uoVuLG+bkjTNBpV
	 o8Xo4mtsAeleyEqqZ0zFqlenPa2rgobp4b3m49F/oDVoJPMiCvh070otTaVpZPIi8LbJw
	 0Zh206vGzSgRAAw3PgowpelW3LRGJ+6k2Y9zU5hBNwGR52QTvwwKd+tcS8qGOPxDrVGsP
	 Si6dmmUA1r857L3AwmaPEzqHp5YQXyZicYB85SkABQYCdac1dPUAftTTY+pIUWf0kwlKa
	 m0tfL++pHEkIG2yf0WxRE99OE+n/bxqYAI1qzg/pOecVPU+yFHPcutFutcMMGDBR/cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
	b=nbkk8FYW0SgaJ7FN0oBcaHCq6lE2/8eqq1+M9qCbxxFcH37zdDwVndH7npXQ4Dp0AeqT
	 hz7QvXmI4DplP1aGCcN2k9Vxqn0XJP9+JiQXszFL7cyjnLTHGzmXHsSeg6CDK3zL0ZpHA
	 g/6wXNzqlx7a8i4AXdhA+oXFrZTRZvvdSXD7I/F6CZX5UxESG8DpoWxfQJowpyPv9WN5h
	 be5zSHAz8d8DPIE6QiWsBjyf1XWGxSreM+jlo+K7LKe3TtNkY5mbIqoNMtI4s5M5pGTcR
	 6WUAwf2WPtiXlieyfxq3Ro6NZjqZjBmDfK7/52j5bPrG0NNpV4axp2yTrPtyi4WXHWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xD/c1kZe";
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BAE606E121
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BAE606E121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xD/c1kZe
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4e4a4d77e5bso255675b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446934; x=1795051734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=xD/c1kZe3k3zk0EsGZwkM1BinK+9ZMrfiXNoGGkUm0MnEHyq5W6Ow6soBRDL3JYpzs
         JGBwFxq5hcAL1OUxl8tZwZoeEBgx1fuGXuD5jk73z7zPphnyp7qthZz4VMhlyZnpORJC
         FL5yEOfyCEFjL/bolKYnMbeHi+i7ySzLjJp5gXcW4w57NmFTilKaRVkRZsKetS53xhPS
         xmhXwFEnLVGqhZkD3GGoYf5x7oa9ptHlqzuAx+Cjfew+tMcg4GMwDbAXrh0PXs9Ro8T9
         GoW3m8JPC05d9ATnkC8rsNY9rnB513y423TbZfilhM5vxfLkXnqsjbjmbESHOmXU7Ynq
         OgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446934; x=1795051734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=ysEcK5batVOtwpwG16MCGtY8L8X/SCqrKriBAwUEFdD+6fjLeVL4dH2hfpk+Ge6CNS
         J8UsbLWfHAdD/57xt+wgJT9DidRZHZqL0o0/OHHZvBb08P+7uYbGxt2854AhLjgCsgvU
         zx80eWTNnnV6yevdpMCXltkHN3ONPJYCyycXISITNqrwolv6h4CyUssJOJQJtTTdZwmP
         DOv054r+xFDBrPcXulFDzBaEa/Hen7R/IsQFfBME73j9H2t/yXd3xRMmZ/3N2qAec4VT
         meS0Kj4zqqepa6M4hSOO19SCHg1u6zd/rrV3GhJEJSDVSgyfRwS9WBVkYiRc4IBSaW4c
         Rc+Q==
X-Forwarded-Encrypted: i=1; AL+hErHtY0d9Sl3sDILKR88CDoW8Q8hiA0g/9MXbnf7JErc2t7WXXVD49pPSoF109dhSw6qZh3Rg3qRir06AwzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vYPov7igxdokqXfS9fLBfhqjghhEEbaN09FxSC9TTRMECEC65
	VCPcufZVQgrrrxELxNJ8GHuSc/l9sX3Lh7q9rMsylnt/Xe2HT25x6Cfi
X-Gm-Gg: AYBFou1ng3kZrp8jT/DF3bSbQsE0h9r8zTSLXHN+aaEu5EZhlNv45cGGkjBTEdJgy+n
	nfwO0G2dx5ltN55FmXPT7naFFS/3xUzogo7Vqu1iYXvkjJwc9nz8YuBcGOh6xdtf9uKpNExvpWg
	ufw9p8Nf0A+mnP/H5k8DMWaiwpypUJ4L8/gneEiQ+SxV+B6pVwsnPlr2DeoWnDteKLkxSWxyWv/
	d4YZh8vssscU4DjHe9wPHFgjwa7afshZta+q8SlG7SLWVGvoCqCCOwiyQklcnhxX0B0moY7q35j
	/p1oD5SVb0dyAsj6Bobs313m24MaDuEerBMi7SjjCjGBsN6VsjuqSGHRj+SH6GSyNI7xg9C44hW
	xWhywKGVi+ILy6LTkQurnzoWHnVSz3JrnaCn87DJhdGaXu/va19yljiHE6cNBr4SGE6XBhNKHxU
	LQC/JjeeZ72aYWcb+OgRW5/0DnijyMC4nbPYhITTh3/XZB6ay7HGrsvACqcluEpQAI04+GFw4fV
	n1tMW2S1aWNrSFsfokQMcwAfff6aX+oeRewvXCvEGgaQsOsgGqh4He4WGJDlSkJZJYC67075EmN
	0CPp0W6V860jeqt3jqsuACiQAvg4s0AoyOoME+Y+4/M5RZxdsB0uilYkJs8ZD1SdDt+qXTWvbmw
	0yP9IIGjhq8Euzpy222I15CXYdsIIk+FmF4k6ZRqQkV+y1JdKWVeKAqRuwdI/HkaRZFqCZn5w24
	3Y+46eZt+bYaxEmWG8Gx+ftOLdUKeq04uRNMdj4gyd1INd1H7yhJJe
X-Received: by 2002:a05:6808:bd1:b0:50d:26fc:e6d3 with SMTP id 5614622812f47-56cd8dd564bmr1052007b6e.43.1794446928946;
        Wed, 11 Nov 2026 17:28:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:57 -0700
Subject: [PATCH v3 18/58] mtd: rawnand: atmel: retain chips across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-18-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

