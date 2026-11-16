Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810598;
	b=lVGsGi9L2xdMY6MpPMVD5SRmi0XMce6HqKXi6WWm8Q3aBHd4v0n+Xs50j1EeoZoLLF6/
	 SjqCDDRWhUMZJs0TXp5pnoyrygyNpGo7LHUxO/nHJUOfO1OiOHD9K3EMkc6gMqY+8aJ2p
	 GHABsxpj/f5+QFo5p+yv7UwZZCK+yC8ja+S8MliSeviCK9RNjf0rumJQo6fZ9zUrfazOA
	 KOUx6FDI/ved/O5KCzxuhzJW5+Hv8Xh3KJt3J3g4brEh5ZvfbJWqDFY1jH9vMXjdN9V83
	 TJ2DMyT8KZJWTyq/CpTPzovqpXDztVDgOOXSG/6Jci0kft8uGJCnzy8UNHd8J/qu2tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
	b=VH5MeYtt8YbUNCoZTrytgRnuE8lYwyN1557doXsmmCZ1JXVUU/hm1CLXJImMbNqMPD1K
	 NOiBrU4We59UPjSWanhm969eaeLA955iXfnQa7x3KdX6suX2f1x03qmkstqrc9GI4d50Q
	 6Ntf5pZBV68QdV/rsTv00Z1BeGYO/ORPpEjF7z4KSpQ+EVrPE5ACkebeIEKo17BY57hYR
	 z08Oo1s8upQgVCnC7djPGDKZ6swxdpQZW3N5R+B7ii9NEFTLz+b8tgGDA7Uwt6gz/PDFl
	 Lzx/obbrvAvQ6jyr5b7l+J5bGQD6Of5eSTSjssMFYiaLqc5oOBW6afdzNpu8+R094MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MU5lKJu8;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D0606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531D0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MU5lKJu8
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ab5e64742so2622256eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810597; x=1795415397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=MU5lKJu8xuMuNBLioBtCRFrQAP+2omfWx7EGNRAdL4zT44TEDe4saQHZ5273K/GjcJ
         1I1ApRYeUybixVvCPQWmwAXZVG+LjHH4be5D0/FW1TBUmeGdWswC/uW4nsg0q91HOKVj
         FBFXnvcR19vOVbg6Q4laD+J1g2EOAtpiM0sr8AGx5Aevh6sRm761qIT1W0LtyQifgAyF
         idSNAFeI89rOTKKtJvWZF55HEfjEKlucX8Ul7W/bDFT3JYMXvXzcIGEfARkvRef4W6o5
         zzBwkfPgEpSzr/xdOS22gdM5pjtkLvUl447Kq3fjwmq/8el9SyMYC9vXphpksJsF6P69
         sMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810597; x=1795415397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=zfSWLiX9VPugTObEidpP1yJ5XfP5skHNfSoJnWuRb7NeRGVlCipuBJZMY3eDQOwZCg
         U1yEKfHq9zZZDsr8kWtnNPI5SLrhx0LKQcMi+UANBzAYb8v1lE6Q+gQ1M/0jW/dnLKno
         b8QmhXBYlyTxB9Zh/OEkgmT4mdrzT5wnikXU/msyOUGxRRDHs2yyPq/FlwZpaPdpRH8O
         h1VsCVUkKHwfgaYBpcPjnSvI4Bni63fPWKBzpjgaQ2yPRJ8YKf/zTB2WGTNshW94Bdjd
         ZhD2auv8Jdmz7GzH+UV2pp2XVYR2cbSi2QpwgNeHdqCGAYnzBOqPVhEzZ0jYlr/iMFq7
         u90w==
X-Forwarded-Encrypted: i=1; AL+hErH62PG9DlyUY773EAxsXgg35NbGHpu5NTMMqRKQEcv1ZqgoXJQCnX2onwLnhp+j6VCi2rEi9cYaqS7U7Ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z91nEfv4HQdWll9s7nTDGmBGtpJCYSj4M52J/OU3tdwlf6IiuY6
	wJpYtNCSUrRedYXPnAW194OFk1gV82bqe2daFOkLz4E44AlMQznmQxMO9QjIrl77
X-Gm-Gg: AYBFou3ILSsNW1xR6KC6Mf5e5fBQmtHtu2VjavmLbhYUmeJWn1hcYoebqHKdszZ5sjN
	b1jUg/VmRKQOccJCyk1DLygfPTASaTmV9bKkkOCc1r1AR5/Uu4rs+W6hQB1pcFr0/jFlVvWkjBH
	qqD+ZYOYNvC69aLsfkt+eBqhqvDfrXibdL36BzbkUdfrFpNUYJNKWKWDySyXjko4PWWEALoiJ22
	q1H++iNFlxVx+z1kPGPY3z251gm6J6UFyKk53HpcCofUvfjypLGJh3JjkPZG6HJ1l1ZsDIrFlLy
	u54Pz6OeTZKu3EZ94QBRkY+ucrF3HbF3Vzfai3WyWd7tz4pONqBNdlVDqIwifROZrmxauC9ZBlO
	GskJQ6m3jdVDzWsyIiAe8qVViPaZobdcjDPbrY0PcYypKDnn5fce38JEV+t5ReDypBMaCdoR04k
	h3P7eJpZPuXH3O4ByRJ71u1kW4srwFFYKDBlyzRJoSYnQmxnS4mxKeNLhf6orynqmcK+GJq8c+c
	aNhzm8dDRhywsaVPCLTAkcMB190D2MRRILEisNVI0m81JIZ8A+VsHFNPPhi6x+iOPwN+5Hjl4vy
	QZhjaqmM6jdcv5YiindKGZ5G5ozntxJhqhe5VMYGs/AjaU3Xvbgl8+uSV0mVmpwVuRWkw4i+oY1
	UKrht1Y6p4v76QNQvJanm03pPjBa+Kf4B0rSzbeIcRgKCzwk4nLNEG8t9rAs+CPHHqoRRD6Tlyd
	8q2VhHXZ7Kv29Tm1b8JnXfA+e8oHtpomDZjjZURHaoi2lAMDGfyUj4iMwNFP3nS61ypH698evQ
X-Received: by 2002:a05:6820:a287:20b0:6cd:3ffc:e336 with SMTP id 006d021491bc7-71ab51d7135mr4392333eaf.84.1794810597121;
        Sun, 15 Nov 2026 22:29:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:25 -0700
Subject: [PATCH v5 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-10-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.17-dev

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
run NAND cleanup during disconnection and retain the core-owned layout
and controller storage until the final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 78af58d87960..2b8c0b467f7b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1915,12 +1915,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2026,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2069,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2082,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

