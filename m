Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446923;
	b=Wc1OaApHaMD1Xe6itg4gZDnRQfMpqiqG9PAIn76LAvHJcH+O37e5y0z74YuqBHft8aaH
	 K+ia4eJquFC4IwJl8liU+Avp3KTDU25jwVGXTg1nqpsHWBf8/R8WRUAVeesi9gyN2//Rv
	 d9vHGiALou7hrS3+RF2uQKdFJgmqPgrJlKkZVhpl93PkEWZDBBxc8VcpwSv9+GKmPfIEc
	 z/4JL1l2f+uYvM6efnVyYi0O6ICn2p5BEo5+G3do3RD4S9jmPrleddmGCElSL/k3RnkUL
	 d6ymxjR0R4KC7B2pbDWDVPL9TrP8kVdsJqv0fSKOUVG6iqGuEQODURTUx/zKdfsktKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
	b=3ZM8407d6js9YFhvQT9c5vFwAzgflJM8cKaowvbGW8AOXncFs5sqcgTYLTU12DfIId/U
	 4WHYl8qz64PsD1XPT7rRww9IaR/JfyPiy+7XE3Sx22znt0+dsgedQ93vqn9rzQMPXwuz5
	 EBfC3q1oN9ZZW2ckN7Rld0gVf6smhg2sEyGSlRvtRpPmbdQDdZ9CLfow80o5HdNSuweT5
	 14+eE8iGvGXLprp5taVRgu3p8WKEanmSVyLsaUxU7uAH4Xs+psD2vSd7kQ7NKMmHWAU5j
	 iNZ2N9eT4lieExPuVVv7R17wpMOs32fGCiEaMKZLn6ZwPWZ53IhWhJZKzNxrQqj0nJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbLJxy6u;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376F606A88D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A376F606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbLJxy6u
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-823b938464fso2538083a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446921; x=1795051721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=tbLJxy6uh7QStqUt65IrLhgPzpqYBRSE0fqXfKzJtuhpC1Ssz3pB9kN7KKSiSKpbEI
         TFt0cAqxykvRFd8gWkKbQSdXlkCsCiJxP1GeLchm+GyJAFnxWIgWAQSwUsJJTQGAEuqJ
         b5M4IRmYYg3PRqghnsHhk1e22wqDfnTcCrjAywo359FPsqNxIVUWKoap92IOHNAJBnBp
         /rKeORR71rhlX7NRCs3I4KpKI593f7QiQeGRQgPbTbnTCbdxixzqwPfSSUdHZGfy3K31
         cwudn4rhS6NgJPaxRrXxt3aG+8iRUVWG9drjfLoWPWKfFm43rxFITLR+EpkVPc2V2yvW
         sinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446921; x=1795051721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=kQ4/xbZD9wksF7wUDWMxkafAy5NeL552+rs+5XNbGRz974US+fz3sXd37TIGg5p6OR
         1HQbdMHo02qqM4ZWUzTjCtkI1YuhVHPiHaCnhioShrm2Yt/Cxq2v/yFHExz9HszljlEG
         u4pexEpedweBNN4D0Ypd3JWrFqkthBtKiJKP5WUV8mEMJ0+tWcUvcMAXsjIlW8Xd+0gX
         u9a1osbA5qZtEqBPumYrKxDQgBg0AkvOyARaEzmXfT3kx8yXdhapGFrchtIyph4DCqgZ
         lMCCURvJhXwjrk2eCTFluwu4Ls3uB5KOPWAE27HSdYZPOEufA6zU0wMSHoTmZNSlOTYo
         9pug==
X-Forwarded-Encrypted: i=1; AL+hErG+4ik/xZQocwSEypn7B7rj6UMAr9Vc6wX9FfgSGr8AjsLz9MihyQrzPTi/sI/WKdv12+6jyxAFG6eyyQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b2XFTKr7aZRNAX0y7PUX2vJivhhkC9nSTTxAkxYIaTGFGbOHF
	g75yi9Aj6wX7K/+r3V0V7Ju7kfoLoW49fPnX7lv/kKTwVaPmzfVcOb0F
X-Gm-Gg: AYBFou3L7TooVcGWc7pHZMcal5DDmTQgA0X/iZxpKGHZvwfYkXgVdeAbUw2PmYatAdT
	yk+N5LtI9y16wS5qAwk3clmTL4C68c7KUhEyfooRzzrcZksa/gq/pUfkpnNrpNGqTz0JJ9bMS7j
	ixFmnPCeh/FMB1xsp1j1dn2RbSfC5AAvsKphxofZGgCc/n3YFoWaCwqG2eLQZwtWWIc0J/blvQ6
	wvsfOIfxXNLb5984IUmc4whyr8+07u0hQISyZjgd+SP4FLiLiSZoppi57toelQoSSUR24ef+vHP
	8I2x4jjh1OXcJMwXmZXuOX83Tz5BQ5LVlH3QL22G5R/9V3tNIpOZuE6N/5eFkp59PnamoZKAwOT
	a6W6kYK21FJZdQOdYLoBE7x5OB64KyRyYQrzN/jk0uMM1aKs7I9N9s16FDIIuuWU4o01AW8FfvC
	LBW71nvJrOXsH0lrojQIE7BBZetw0oOTsHTXMxwumHFLNvFIELyJbyomLhGXlVUksBk8os9sInZ
	K98MyOBfeLBtJGotm5uvh79NpS18wyBbEJgtGMuJlmqUGaa+jdBUA97wSOK7C6+HRFoEAEXNauV
	p3GWKUnvbNKHc8TPL0l0OjUy8FbLB7lepvf+N8WUFC6HChgOo5BtlE2KScJZmVv5obafgy6HMgu
	fdwCSlnqYBRve4v9O/QsUgDCFqUiNl1rTvjZQZ4jDqkLmaLezQuzUV71dWHUs//A2Es277tCriO
	MRdPj4kw3axqi4C5AmYycZn0itBa+Lz5vaheERsG+ZVtFg+03i1iYW
X-Received: by 2002:a05:6808:c1a6:b0:4f2:4d2f:7ba with SMTP id 5614622812f47-56b9293c5fbmr3827971b6e.8.1794446921570;
        Wed, 11 Nov 2026 17:28:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:51 -0700
Subject: [PATCH v3 12/58] mtd: rawnand: arasan: retain chips across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-12-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage until the last MTD reference
is released. Release BCH state during disconnection. Unregister and
disconnect the chips before releasing chip-select GPIOs, so notifier I/O
and active NAND operations finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 47 ++++++++++++++++++---------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 839aef6c460b..a28daae30330 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1276,7 +1276,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1284,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1327,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, to_anand(chip));
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1368,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1436,12 +1452,14 @@ static int anfc_probe(struct platform_device *pdev)
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1499,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0

