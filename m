Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296682;
	b=XNB1eo/67wpTGemT9aC5chSBAKQFxy/jgdiQHQR68+d++Eeqd41fHyV5Ylf8tyUeT5/b
	 Jid/PuHP0EmzrhBar2oU0Nm6Wc7fDJTQmBHHzLjylgLYFgErkalrJPmlLN6gs1HZ9ij9y
	 BxfQ4NZ0Eb5vnw+SjL1Qu+/qFacMNMb6Lp5hBuwNrbC2JmAFHLWpuixaXtPxECfw8jr5x
	 LLb5pScWHSCvnI/UlXPG1tLpxQWCbhXoOpj2iS4nJfUMmF0OdMUKZdfj0JPIUAkOTlTjs
	 0oKKbIMD0AT9qlciRiT5+J+gm3uOgZPwfRQfATPgjiH4XB0CxzdzWcGgnIy87SXK4pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DaAKG9GqMtdplQAd/Y1trIoVdi+3obNoCtIC3s0V3Fw=;
	b=WmmeT1SFx81SC+EvyqRj013H5ITd9Mey+SFiJVFOpRk8xJyNspN1FexGEqXfFO/W2vn7
	 fu3I7ZcN9z9HXdmgnCwsVMdYb6cuvhhSQKjjB1xi4iHlYXtRUyT+35oH70Sm9gMrZHCOK
	 0xhMY+FtbZnZ5HZai2n+8/jYdWlbgnpyOalJ7GtYfPikOFNkIpRWuPhrgTZ2FZBuCV+Fs
	 gKXGv7mUI1G197mCW8XjfL7CqDPAoVjkCGfYxCYs0QhnWiP06OSzWv2nv0Th0d98CP71i
	 /QH2xdUuhy6EbKErjKVLeV8e/N+GFDqaU8zoxxDzc2MKGOgwyWWAWcRe7GptvsLuOCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCh7v4FZ;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ADB606DF42
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6ADB606DF42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCh7v4FZ
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-53dda625f63so1140707b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296681; x=1794901481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaAKG9GqMtdplQAd/Y1trIoVdi+3obNoCtIC3s0V3Fw=;
        b=jCh7v4FZJYTzut2F0Gax6VTbmM24zVlpr3XM/W3UVUugJoDORqo/D8dxHVX7wBZEU+
         VDrsp9je+FJ8nUKHLO4kBjIJ8+sa4qmHs+iQMz3zhDuUMAf4YjNA+fO4o/USI0puC9T5
         hBHFokIk7f/RexrkudR5wvcgP0uvErzVhkKsLbkRtthShLlZHE7emalrGCMtXqMmdkcJ
         /KzoTm3G4EBZFkg6YPVpIxU5xzDBGViXnqV3AqeT9S+lfQ/zNpmGh85j/CB4yuH06NBZ
         K3TX2Sqpfkabw4pWxeLYKR7H3TR72QPzrot1n4iBNy0ZBLM9YJCma8TkdT5ET5SL5dp3
         APmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296681; x=1794901481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaAKG9GqMtdplQAd/Y1trIoVdi+3obNoCtIC3s0V3Fw=;
        b=CQzK8o0HmLU9sM2n2hysyRQBD/nDCFEB7/OpYIvbcWKC/dIogQ9fnZdX6bd/rIBkh2
         KuYtG8eWkvSvZ7IIVYvhVcVuM9+3R40aTlTvYMPCaME031Zv+D2jGAIvqIGx8ipi7YCK
         7ig5n6Ty+XNGNF2Lset/2pwgWt5R/O6OEBYCh7WwLoLFRNau36a4sx6yYQMACXD3TfUR
         BhfSIfUH+ya5JWIJLNnqa94aZyM8g9deRN62yIjcE9vKE3dhs01C3kUJDNIyMQEfELyg
         7+Iw9ft+tlu4aNmsmlsJAYuBf51AdMV66KhcLRCA4PlBb84OhWuBoA8mGyFlXxYHJisa
         pZ2Q==
X-Forwarded-Encrypted: i=1; AL+hErE5AVgF710V8b/0L4kEf0lOdgGRIYhIzj5fyPV9J3JBrOXngfRGbGEfQMLkrklbD4YxQVy1EsGesrpzdBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qkD5Thj7GSGEKL9XfWcSvcaXwUmj1OxRU/fgEDQk3S6XcGOs4
	zRmQf6KEJ7lpyDUQRGECxBDqsF+ivrpudiNLqkx6VctC0PA6CT2eUpor
X-Gm-Gg: AYBFou1GPymEn7wLyenqMWTSIyBlqYXcDeEIJzRD12JvRUUnvPzfF7hmgccLHZqRUjD
	fDNwmtnDLRYAXGyee+zspggQ/tped1EHtGZYEfK4Y+cCVLc3XVLOVcHUFpew0hkd0h7CDqX5eq+
	wkook8EycXUU86FdrYZfNYy2s8V7GXk6XFjKcFupIkIbOUAfodaI2BV82gVxWBVUVm5n/Fp22Ad
	I9F23NGEcGnqMqpal+ygjiXoK23M0WWZwPxrfQUuuE3Ykj81WPf5Mu3BC1qr/jOtrZBFc9ZvEDH
	HN404h3alu6Niyc/TRoP/SiUYgmXXlFU8PyqcRaWUAa2nmsZGvJJj84OhUlXOozLSrkgut4mrlh
	6TztGjhXjBtlo1oBxn2EcFtH/t8PVQwI44bxWQQBVBXRQnjjkqlkaZhGSrBdCR+XPrjcaI+2ma4
	+CVgKlLP/iMjmsHrDFoed+7IpFf8f3kY5OZ4QlbfJCBURWYphu/TwSjC4TzOePUbEbzMwmdja1O
	8BVS2BXJDma/0YsmbL0YOsJ2xGgqIEy1myKOiDxrpRNbuSGRfJyCJOu2qI8dadjRdzucUubpVJF
	TxSqSHfcPgNJ4Wh/xMtrHp73Ykz0h5jqP35exGf5sYJixkXYLLcG+6pXiphu6MKHYRmHHZbff/w
	vj/N2JpMSs1jjA2ko7TAiC+o5RAfKlKzyGcoLWukbmIEs+XTZXPoVy0ty5N9j4RxT0sfij3d3nQ
	RtuelVsl1Cc8cOZY2I7qrnoQThKwqULo1BDcFW29ONVCan8/V3Xrk=
X-Received: by 2002:a05:6808:15a0:b0:53d:55e9:246e with SMTP id 5614622812f47-5683cdfaef9mr1338214b6e.61.1794296680666;
        Mon, 09 Nov 2026 23:44:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:21 -0700
Subject: [PATCH v2 18/58] mtd: rawnand: atmel: retain chips across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-18-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 59 ++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 9a724de67624..ed8b703f5684 100644
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
 
@@ -1735,7 +1737,12 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand_set_flash_node(&nand->base, np);
 
-	return nand;
+	return_ptr(nand);
+}
+
+static void atmel_nand_release(struct nand_chip *chip)
+{
+	kfree(to_atmel_nand(chip));
 }
 
 static int
@@ -1749,6 +1756,7 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	/* No card inserted, skip this NAND. */
 	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
 		dev_info(nc->dev, "No SmartMedia card inserted.\n");
+		kfree(nand);
 		return 0;
 	}
 
@@ -1757,19 +1765,29 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	ret = nand_scan(chip, nand->numcs);
 	if (ret) {
 		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, atmel_nand_release);
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
@@ -1792,7 +1810,6 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 {
 	struct device *dev = nc->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	struct resource *res;
 
@@ -1800,7 +1817,8 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1858,7 +1876,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand_set_flash_node(&nand->base, nc->dev->of_node);
 
-	return atmel_nand_controller_add_nand(nc, nand);
+	return atmel_nand_controller_add_nand(nc, no_free_ptr(nand));
 }
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
@@ -2044,7 +2062,6 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	nand_controller_init(&nc->base);
 	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
@@ -2353,6 +2370,11 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 	return 0;
 }
 
+static void atmel_hsmc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_hsmc_nand_controller(controller));
+}
+
 static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2360,9 +2382,13 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_hsmc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)
@@ -2432,6 +2458,11 @@ static const struct atmel_nand_controller_caps atmel_sama5_nand_caps = {
 	.legacy_of_bindings = true,
 };
 
+static void atmel_smc_nand_controller_release(struct nand_controller *controller)
+{
+	kfree(to_smc_nand_controller(controller));
+}
+
 static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 				const struct atmel_nand_controller_caps *caps)
 {
@@ -2439,9 +2470,13 @@ static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_smc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base,
+					atmel_smc_nand_controller_release);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)

-- 
2.53.0

