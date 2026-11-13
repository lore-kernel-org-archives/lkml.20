Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593732;
	b=CDlYO7D+fpcjYaov3kY2Xi7OcNyVHZKtrjcTo+3GUztiKJTD+0m3AQQI7QRYsX47PMXQ
	 YTPREzjLHz9VvwLSX0oB0BcgPKEVVh9yPVS/qN4Dk2yGCslHqYpfUlI0xZOJFPm+Sft0R
	 BcWh37b+NKn2Bo4i9rELW/jPJ1ggI+2goNkMtG07CX2MrSB2/kqm4qETgZ+Apcu1VQXwa
	 MOdaGISJoq7n3Tz0hwlSBCdthWABHT9AF/Xbga9NiATw8PE9bNZ10ZJA9gj3W7oHAo1rG
	 PXvL9mwnYF05/zqNKawXgfe9Gl/7U/5agiMmIueW35yjRCKoUuzGuOqGJDg3cbEvg/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
	b=gaeU9JebckzyU6hFrSDb04PClew11FapktEUtyldgjA/fr06S3evEp/hGRzaU2Zn1nYI
	 wYRYT29sBhR08HNJgXyGYsHDemS/c0vuC+jai3uhsjlfbxoLb9FFzliHVYW8D0ZBD7/Lb
	 CdHkvmnz9AXuGXJ+89e6DagG0G/vpTeGfB12Ky8xEUicK7D73NbsdsnAZosHRLrP0M9f2
	 /xVz3Rtdv/bvJiO0qQWTJrcc3SM9uSrH7dXmuBX9os3EO0CDuDT+z4OhlkopnxAwBjns2
	 cWxfZBrggNNbDFU/NwzaM6Ir4CxrfhxtAfFysJB1UrhTkyiZQtSHu1jZWwn+98ntubg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rMn/THIC";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35D60A5BC1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E35D60A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMn/THIC
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-833e671ee9fso2374817a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593730; x=1795198530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=rMn/THICpBDaCZMyFc268hxAFxVCSMCAxgq+s3HKzwWd4BzJSPOao8NynVbN3dnmI5
         Ks8csX7fUwoyYcOwuczbpTbJ9fPZ+66vJkAw1m+3x39UQVqRSbxdauSLXncxp6PKEZ+B
         PMoG5hoCSa3CbvA+2I2J4dEM+lt1z0Lu0alZZ2uz3bJoTFTnn3SJJHWME9xG3eBJ3SOt
         Ppl/RZAsvYpveIaLOWf926ySDgzQGANH7smPr+ojdxAe9hreseREgfOBa6BZSVre5j9l
         Gw3irIilttDlcUtN2vX6Xtm/OBnJbe/DaC2mx7CqKWnbCvIP+kNXN3yJ0ITOOx7xb2c3
         uYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593730; x=1795198530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=YbChJTTnI4TCjoIMT3t4k1mc0oOpX9htINa8ypI7vxP45c+kGNT/xlXmCsYnoM3TJx
         2swkXSAfhBuCKoPqMyADRFGhq1ho0zuKRH6S10WXgfp2EgFSXGRKkcemVcAvi9ft5PZn
         HXfIS9jlUoiTN3rl2azRo6Tp92ODSHwWsG0SKCk4qXRu7vS+mx++4KyzTX70el7P5v3p
         8qgvkayMkeuGig4F6YToKQqADs/Tnw3jDryZc57Q/bkjqETu+4qgJe7P3um7JQa00LYB
         h4TOi1fJqPXRtf+LNh4MectkuJLLdLFyUXX9h+ZPU0qNyYMb0pKt1FcBDFeP6z7J6i+X
         ZLXQ==
X-Forwarded-Encrypted: i=1; AL+hErHih/njF7yYJsASxWwyHojoU63diB3uHnqkFW32d03Kjz1zHuY5O8XrxYZUtRZ3sxlKimXW2fN/5KxWCMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pIfncrJichv9cr0mX7TY7ajoIFttc4aRX3MSR9/CEBtiKmdiL
	BHeJF7gIT8kNuplqrZIxvInpN0wx8et8zLpvbe5vap1tb95XmVeQ/J7dUpt8u6Ls
X-Gm-Gg: AYBFou1TQsQmI/RmStf4jSYk1mo7Xf5SvkxozdPXVNFM8tu9GYygDe/gEy+T80f+baq
	QrTfiioMHTnsOa2ziuksBNb7QlvLS/AeItGzAbo2Z+MDOM6PoyWw99EcOHfMJWNglG/xWuzJJjT
	BtpPx8hgSQOFJqe0OHUnNDd5EawnAvKHELNWeba8JPtsRhYjKTw6CBibHhU+M0eRaBJL5EMRaX3
	DFt4Zavg5ju917pp8RGfnMRgtvNA7m34dVE9X3aNSaUxecn+tHH689LZF2M1ljIHPBjSfwJrUXZ
	SvafNBicvXTZwfle4xk3dv6Q7Q53ueCqIRorBaXpGTjlUSfEEfAEWT/sWfyMDByxcuaZvIxbkQX
	TftYZUiXJMTqAeKPv4lKvQ9mCVmTqeYFN7+nBG2Q+8nrWau29hmTrBo9zkHQ9QBKWLu7fgBdDHI
	9b5tXvpvBffw4RWz/NvKVSQG9U0AgrEotbxym3QiK7kSkDHYTkePdlX4d3G2nKIrBlKx+krIwiD
	xYmxuuGODCalLI5wvDGcsWF5HFJ8gIFcoR4umuse/X6W2QbWIZS5da+/ZupCKnWJKxBSv5Lg3O5
	qzkG5EOgefgJ12EEvMlv1wPPHyyiyt1EHJKJWPVuu0ZC6Cw2kL+b+Xpq9veUKWQlDh6mNJzHS5t
	b+EUl6tLrBycdMnC1a4V/Iwd4tG5503/y5nHuu6X+yRNy3jg4pjX0RpHc5ikfjP1+RwFMoUHu+X
	chw/Au4ujJRRFUCPMD1gbnA010S8tHRQMYB2tF5aKSbOwzOxspMfS8U9wSxHHpuQDpZ7MIxGIC
X-Received: by 2002:a05:6830:2b28:b0:862:544d:b8b5 with SMTP id 46e09a7af769-8628991ea97mr2748255a34.27.1794593730542;
        Fri, 13 Nov 2026 10:15:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:28 -0700
Subject: [PATCH v4 12/58] mtd: rawnand: arasan: retain chips across
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-12-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

