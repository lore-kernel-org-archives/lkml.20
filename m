Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810609;
	b=u0zJhIYR97AMXzZ/3X1exUw0eSjlfHlI3kCydRYbWS45IK9T7tWoalVEgE32DSz9B6w0
	 R4jdt/meWPdx7Z1yKV2uwIPZmyI/05oi1xBknfp9oRsgx+vg2YXwMKnacPUn327O4ccVA
	 iU3KcSnF9m2oD0KiEdAgjWzVwaD6KJlOpRCKTDRjDzbjL5Hdjf/WGqff6l5TnHQOYHycW
	 Xu5SkM636u03Ac8/4W68GhLkQhHqG0NNLPczKNS2u0m2cPO54EE6IxiNLMxFpOoPvn4Dx
	 F9c3/CWY1OZVFSZ7x941zzK6EVlzPFOAQP9xkJY0dlVmrZyPagMygzkKY4Sdn3AXgig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
	b=L9N2D+frR/ye2G331G1Uto07+2rh79sEO9D/gKGc/hxiCi6IO5yw7cTzs+v7eAhEnVmO
	 2bibC/tMQV/zHKtj6/bFmM7/xuIeyMByjdgJ6wnKFl49cRKfPFoXWZ+YetMxmEQR8w+Zs
	 f72DMUHuK/XZ+DzdpF2vDyHKVXFpSrxG8H4DoXb/dSaMqE8VoOVE5jhFOMJpW8Z56iSBa
	 CY0JTfS1uZquRtoHyd+nhpULx/xT49mw1Ntxd4CzyHUd2Dsz4dHqQNMFs5GhqRG3615My
	 v7u+EWI15+djAx7oO7Lkm6HOusuXsxk28y11G6ZQHgSx0RnTH5dJmzKN2tom8ssJoRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAxCsqd8;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E760A263E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8E760A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAxCsqd8
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df7f544919so2398627eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810607; x=1795415407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=uAxCsqd8sMye7R3Gys9Gj03uxGwcnDjP+kBvso3+cMf834s+YyOvGC3aOPpZEBanq8
         AwBQY62OdzM1GjNyvKfoimpA6CNEqo2wgafQPoFUfI539Q6UWvmE5IyvlhjpRhayYxU8
         dLqUD1vMsHbFX7J6d7/5KVagr1pq998AtkQ0A2vv41IdBYtv29NlpSh0kq2f5qbQi8Ce
         gK/l15DrqVhaAARsJGzq4eTtTACbN7OnKRmf/bW7oyMrcyBKZNG9Y+zDvERCWB5a5sqc
         Afpm0rbSzTrlIFaeb8lSJEDImSB57YrN7BSF9BaHqflql4dqbnI39sjZ8cQ110ALA5iN
         0vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810607; x=1795415407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=koJ60v6e+ja7kJt0lfl+dbmsKyQuXjsis3IgmDrBWQiSuJGh2DgkZQiZ3oS43f/2W5
         2LmuvLlYT8gkKvlpxGqJpuJeLoMyzvVUU+7u1yTl6jIFQjdKutyyurMmRev95Lq8C/4D
         T7Wbc61blzXitT7Kqp6s3PQg0uspZuMh0fb+hsf1PABfkKVy3iW2KI/x8/HetShYcbzp
         TqOnuYVXCekf7krO0o9dzmC0NzLavkemStwo69sesGL1tmO9xzcF1edQRwuTWWRk4BJo
         c8TnOVVKupHf9vW3xmabsxRUpaaAVbrZQPJsXvb0upk2oevK+3V01/YHw5DNakiXPI/4
         9B1g==
X-Forwarded-Encrypted: i=1; AL+hErEc6atKZ93CSclPiWCBgrusT56biHKqNWAhPu+xqrqfExuSNTeIGiZef3ED/nvkbCQ0bRXgjJxJYI4OfXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5+BO+I+yUZWCqrNM4zE8+HrSn+F6g2iWWUUgSmqPnN7ovvfen
	4p2QQ50GJn65e9dqrvUp2UVrauFRk6+BFcMwpm4MktPgjI1WgavZWxWg
X-Gm-Gg: AYBFou3j22JsyKpdy7bOTYzlzkXbWbyZhm+w+662PrqEYlKAwwe9OZjmwoyPPy9MKmL
	n/tCp4bmk1PCq+LBcLKd6hnAbtSRTFtFksk31NMX0A5OSLS+17adG/1dlSXAHfEkhKyLyjFz636
	lAXZdqj1GKcRMhOZY+GXoqY4rgFOhAj5eW/7UeDa98WtMrDJ6hK6z/PlX2sKElOqBkNPZeYxQjd
	38TTwo2pF8ZyAIWZGrtCuY2TDw7Hk1yb817kNn1AYZUngiuN/1sKHUPLJ18rhbYpXNRcyimj50B
	FCB/s0PbSFkSv3Oi1u8IG3+IWYfK9ysE1An3d09lHu3rHu/83KtCosMoR16+JUEfeSmxuNv/88X
	CGrGDhmppTtMhwke3A3FobxzzzLDb6ycNhVCWLXdMRYZPQJObTK3yrkwMr/Pn+pAbuo2PAYsong
	pLU/oVG4J617V5M/3il0cfubzt7E7POFoNScLTvYzMeb5JCICAXvu1OAgHmtpukqYPRKq8a+RIF
	ovOPiGBDfLeec20VWJHqJGFwMNBBhGECiIsPIej6kThjklbxWLbVVTBfzmMoV//XgX2akGZbk+D
	rhiLchTCaHMGH5wAnghpg66xIuS10UkUUCS5LwbwM2jR/GdykEmzEsmhAfxAapeJeY0fiOh3bkz
	xUzDfcgUTVwRXxcy8noXig5T9fmh3n1I/lpN0zkWB4Uzl8mxDt/oKMJYh+BtLk6Swm1ixJWaxtZ
	h2wMIJjoOLzoTdt8N+e4k3Y7/tmLOY0Y1vRwGquFiiJ8UXHlL+/yA=
X-Received: by 2002:a05:6820:16a4:b0:71a:d76b:fb39 with SMTP id 006d021491bc7-71ad76c0212mr3490029eaf.2.1794810607608;
        Sun, 15 Nov 2026 22:30:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:33 -0700
Subject: [PATCH v5 18/58] mtd: rawnand: atmel: retain chips across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-18-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev

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

