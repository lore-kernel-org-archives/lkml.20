Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296720;
	b=B0dlbVvkuMNT5K0VyWUiazQXhcXgbMLSEkXfkhLkaqL/SOymCbOi15buVrwlupWhAIss
	 UFmJKz+SeXA8WxXvzYyB6oaHF2ZE7d9+esFco71QEMdXcvVJsc10NGcUwtTwyKrDgezcs
	 OSWixAKKgDucgaglzihT33S9hcJZMyf+MLNwa0DiCtmH5AXJpLEw4uRtlsyG6+plJAZ/Z
	 Qb5rBAPt4wLqt9fcVEn+mpdCDyLujX5wwZYbhANilnSoK6IY26PkqdY4spy+qygb9HoBF
	 JdmUnrX1JRd3UWI9x77hXdqyRnBwDvvpA4r6g/vtV1br65zY15GaX1vio6q2MemyrCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
	b=B458aPt/BdV0jk0UhLjF0lVv4TYJo98yzeO05x9MG76FUIY/8L0OQzpdjG+Z1lTGJEsu
	 tit7KjTQThJcRnIrnAJ0ssqg8vx0eLWh+ks152b3KMOKgculRj0bi/FKr78nbG72Luz0F
	 FNXOvBgWqn7wxPbBSCLjGa/PoEaaGlonn/bC1MW3xJGkRt33rVQ/mb3YY32DOD71a2Jcb
	 apEC0RQsNViC05o1hlxpHOb8de9HChVL4bsbbRPznm55Ru4PjdbUrVUGIyEFycXdDv+MF
	 OeVXkF70pVFsdYbMzzGlq8x/TzdligrlD85hwwc+cO6nUgntQr1/ORxv0xrhWLzwFbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0plDzh91;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614660742EA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D614660742EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0plDzh91
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-563a0462094so863512b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296719; x=1794901519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=0plDzh91fEoRnsk5GSf+jnKQWgAyDQq/OaR1+bd6jkTh9I2ov/jSayAIZ50kkirMzm
         vXtVUY7FXdxFt6/olAS6gTTwY3tX40v4CZ+6v5/mdQH3PgIKngStobFZrdJMm67sX/l7
         SMVAp/lvjaR6wk9Q8FZSBqsnyR0rg6zRGLQAncAAGBAowMzj8i3ZxnSgzecjF1KFDpdP
         u1IHiuiJFuxSqrA2iXZVcQOEF5Q8hZ5hXo2IXw3Z2NZ01sWCK/Wljgv7oy/do98cdmOk
         xBc3AyEWUwqFKgQ7AiLZWUdx2M9ccQIO8DPRDhyLylZ20Tdh90Roigxi5E/wBKwA/gHt
         PrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296719; x=1794901519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=pAP0KCaubrv2BELjwuhT1k+qkxmuijbxUCdzsSi3j3OvcBVq4sKmPds9jOR7chh338
         W5jlnwkBmZBryst9qGOBceCLPa4Nb+1kfIoz7dvnyUOUsA8imrrMnVqK1eSvi84p/1pG
         wPIndbMIZGcqkqDXS2JUWthzb9N/UZoblkMckHBs/vhMa6eHoUDo16lFmjTdVFxFf2eW
         6v+c7VJ/l3RajdemWOTEeE6x9wh4RFztHkr83U3aVWObCeh1JiEyt58T0GEByRWBgMPV
         Qhpx1IfE8jzSRqsqmmFziIo84IuYOGNkt1wbIk05HSkRihBMbEBIXdcP2uSJz3MZDSig
         IKzg==
X-Forwarded-Encrypted: i=1; AL+hErHJCnnEPp60vL0IIdoYVv9iYs65bMowCaztwM7VYHtHbTKZ45PX9EA7M/MQFGenj0/PsECMWkM5xdqyLWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9RoFx4Zf2gGsbnvX3/QlMjQQaF219tkIQg9rpMFyw5kBcXx41
	gK+aZqluBVZiHy8z2F1RFoH1V9zcHLMF5SsIEj2yIFCH7K+EPpH5drTjTw86aW5V
X-Gm-Gg: AYBFou3Gxyh1Vsd30/BfvgChZoEy5IEqfvM7c3y91Gm+NPJk0JYwcWTywTVLvRqe44R
	FCBLhGESzwOqoTjCz66aJTAWBpUapaDxgd/Nmrw9k74R4vOf4dJVaySnWYmNOEgawCZf87szjUS
	SNaWBXiue2DS0SWLSXTwYf2btQf3fLBrCt7s/hb49WYAmFyDviJw4h1MgaHxe3sP+nNcpKIs35W
	nVjLAas8KlPy86VVJ7b19lx0nd5zG6pWqcly4od8uxBn8ffVwG0DTDFCd/dVtOo80SVaiz5IXB4
	h5nSe/GhcPeabKwUZmvv/9BooMjVCejpz/reo4kKHhsEfSsmWt6D88hTnHqmofbkBn1KgfOegpG
	MTSk5jChbqxHvnbOUFAgnNTDdPULzbKL+xANgyH0rMyNzJThOC1DkoW3Y0hiIdyxvnE+uY5UNKG
	4/rzq+9PAn+g/jm+/sYK0rV0s/e+EFYHhKS+qbxEP+9xePT+sivSS3saqnD2F3Y8KoNgbjpbozs
	QZGoEkYRuxi5WWv/XV+XUWsZ0TlGuKbdeIrXh5n5WVEBnj8O0qhQlQxE53+fpv9pm9qflj6wkNN
	YichIZ+mVuO2gZlnf0lRqPb4ujnhJdrdTCahX9Cu7Un2micmGDSkYxxfjg5on7NbkaiLiEEoLCW
	60PeL6jgRMml3VHuY6EMc5lD8U++e1uZkXyJquvqRBpZIe6hpIfEUYDn9TwsnEnJMr3Q8sDu0ci
	nv+czJYbzCB9lkiUI3K8tPh0X2hZhNSvsxfJ/Sj7qnxv2OtqyNCzs=
X-Received: by 2002:a05:6808:5087:b0:503:8f9d:f11a with SMTP id 5614622812f47-5683cd8022amr1530811b6e.29.1794296718777;
        Mon, 09 Nov 2026 23:45:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:55 -0700
Subject: [PATCH v2 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-52-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4d4e185c22e5..60fc440d4515 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -19,6 +19,12 @@ MODULE_AUTHOR("Rafał Miłecki");
 
 static const char *probes[] = { "bcm47xxpart", NULL };
 
+static void bcm47xxnflash_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct bcm47xxnflash,
+			   nand_chip.legacy.dummy_controller));
+}
+
 static int bcm47xxnflash_probe(struct platform_device *pdev)
 {
 	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
@@ -26,9 +32,14 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller,
+					bcm47xxnflash_release);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +59,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_release(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +83,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0

