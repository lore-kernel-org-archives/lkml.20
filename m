Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810647;
	b=yge3n8bOiRWFaPh4alcg6V5AdQo+Wi6E8XFQPQLkF4IJKiYJI6S03KIWj+b0uQSOTYir
	 UZnx+5fDPtW3QOcCEWJNV8zC9axXUsoEg9MzmvH8TeeNX4a2I4lZ1vTEcOb7rq5mMMCFY
	 YnqW1z5vKiFRnPPKHT/NPv0m9gfv/JXVWWzNZC/zSws85ydZYtkW34U0JeM4D/zaoqVPi
	 Y0ABwkc9NxWJTrA8HKAPgcWjPpqCaiLQQK48djrq2VOQcqxyj7ZPqjGpqPXifHYX9iOJJ
	 sEl3ddI2j21l6ilXHbMLgejchjynSSQkLdTK5qA/h/80GY9HaRzuCbe9JZmMWgS32dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
	b=DyLvklhJtWwmUYTY2CO3ll/nLcJZejq5tIBhPYKbJdRsGtGBgzCM5ZWEUxPdC7TFAHzg
	 TcDMrgqP4KIvNlMaOoLMaEiOcUsKOp1kmbKy706CUrO958NSRllg0+4U+UA84BN8yM4jg
	 72PwlKln8yEuGL6WVlaEPnfaLeDsm4fLwD3wNBP6fb/uCDTXDdEYAw85/2oIeeWowr8JI
	 EMrQiLMmFocd3419GqDHYcRcWTn6HhQ5gzyn/VrKxrNG1zMr3nQgyucdJNfWeH/Spu6l6
	 DcxgUkJBrD0krrWNts9RQq3SwvFxtFAmQTtqjXhUlSBsozjHKFhux+yxYqxAt6Qd0uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7gVs72E;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F9606D971
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8F9606D971
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7gVs72E
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-702fd86d674so2709010eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810646; x=1795415446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=d7gVs72E431n5MdxVFfDKztRz31s02LZozR+CYzh06kurT1LQGlkqVtWLBwG5IDijF
         vLJg8Mk5y5qxhftuNur3PcgAzXk031ZggozEsNpDag0DPeFeqPj0brVzKrzeyci28ZAm
         3owKsg8vjWD/8V5EuLrmOkhhB8m9aVni+7ql4WWsL08pBxlElptODXlWMBfd2O+jAXLm
         Hg6FNvUc0JrfrvILZEwEjbg8MkraaozP0k++Cyznk1suXY5ovEL66KMfzMLzMbQiiJBN
         AP/sMgeYLtBqGOpm+RIwPTm28eLve9EG4qmZnAqi9PeUGjCMXXL7QS83kBPHdAjLLJea
         J71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810646; x=1795415446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2riwwIuDITOXYtuG9XDP+0W9d4KCwIC3n7aRF44epYw=;
        b=DIItokrWDBokfk1ZsKPh27a8eb2RBQLAXE3+bBEljiQohNHVgdETWEGVHvNsi6uF4a
         VEfm29G2NV0eQYMee3XFpJfi+KKEs6W6qgGO0udUrohyOdiKFda42IPzJbp5lHwwJL2K
         r0z0oeun3rR//EPbp0UlHWOEfrlahnltWg5x4AKZuBk2ba6mcYS+PA2mR7ggUD0oK8q6
         o7QznFRON5/98uy96VXD0B7qk0YMu+MWM0bjAjTZEEy27t1V9Q4Qs6nOKOLv/LVG4hWK
         vHgrM7uRNf4QpZCdVt7EJW60djIHxJ9Up8+irfzdrA2Hj2Z8GwQHskuKgSvxiOjvqwCw
         /yHg==
X-Forwarded-Encrypted: i=1; AL+hErFRfQvRTp4gVHySMlir1nqOzun2WISyL4Fs4V0Q5Kz5eF1W/a3Eq6y/5HSuZdnmwKthFWTNX7bvI1s5Nw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pb5RtYrn9DQv1NLpBxLb2lTvyhhpEFXNabUdMobWSbJ55m9EV
	f3BWV2T5m75oebHBn5zK6HodjYGp8oLw1Ti2jihvFTpv5YQKNu5chZDn
X-Gm-Gg: AYBFou1tv9QiCwybNJ9tSzu8K6+PjWHignEwwg+AaOMK/tydxOK9+OPGhkKDrUJVup8
	SNRUpecFKer8tGGddq+kGk9ShBPOUpor08h+xAens5hXY1ryF+yPBylqJj6sCtUCcM+ZH6O7xx3
	Mz75ViKrC3l9wC6ULw9w8oJHr62EUrHdFIHmgp8qXXbgN0aRoia+7e+WAJf4cZcsLBct+hGbfj/
	p8089c03RMm2c8lRDg70VSDQ/peyEDAz6dbiPjxVgTGn1dtB6rkmhQnpXYhy5QayrC+Sfn7+GXl
	UH9sD23SE1201203At630sWnJAT1LMUW4ymn2QvACUiglZugDAk4nOOv+SQ2pCEQQUCBphdo3tF
	19yuKYC5UQ9xE26Y87EOkmKmaqgA3IWoYrIn8zogXqVSOPr0aKLE1f+MpYsUUMak/BQfM2J2l/+
	Xwn+uaw1OlVL7kWCW5AC95G1yveTHbAP2MBsfEn0dHEK3Y7ia0T+w6LcxQ7rG5KDQ82OrcSpuMU
	ZTlgPZpGbj1QcidX0zaI1P+kzEUr+ePraDgbgYBFcWFuP3M9XdXMWeWE97/V+523BAjU4j2eNNH
	ZzzC4MGJTGmt5nA7DpPEhAr+KBlsfKasIXQGzhTE2uj87wqR2cuY3kNNIP1Xa8ecXso0v56j+mo
	cCE/2D+iMLU2xlwK9MyrBN7NPiv1MF7BpaMnVrKapAYCVO0qZ+6D5oda+Lni5NmDg5ioN3MZ20x
	pDuyL3mdnf9vLJeys7lwwAB2dUQw0yKkqCrXlt01dKkZ5lDIf9Smw=
X-Received: by 2002:a05:6820:a513:10b0:71a:eb81:3bb6 with SMTP id 006d021491bc7-71aeb813ddamr1408535eaf.38.1794810646022;
        Sun, 15 Nov 2026 22:30:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:05 -0700
Subject: [PATCH v5 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-50-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.17-dev

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 39 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index bdda06ae0d72..2818ffe76796 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -368,7 +368,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +377,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +385,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
 	mtd = nand_to_mtd(chip);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
 				   cs->bank);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 	mtd->parent_dev = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +406,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, to_ingenic_nand(nand_to_mtd(chip)));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->chip_list, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
@@ -429,8 +441,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -474,9 +487,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +509,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +526,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
 {
 	struct ingenic_nfc *nfc = platform_get_drvdata(pdev);
 
+	ingenic_nand_cleanup_chips(nfc);
+
 	if (nfc->ecc)
 		ingenic_ecc_release(nfc->ecc);
-
-	ingenic_nand_cleanup_chips(nfc);
 }
 
 static const struct jz_soc_info jz4740_soc_info = {

-- 
2.53.0

