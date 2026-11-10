Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296718;
	b=BXVBEEIswzBStwT7qVPd2btFZ7t0+70B2o4I+inyqNEzW8o06TqAjC8XS71ZWy4TgX+t
	 noKjzICg+Wy55YY1d6+/wiJxBgbWUZprDsk0S0Uzk3VkMg8bthohbU73W1fyxBJGZYIpl
	 fm4ACMV3AAwFMoN75+RxOdb5Q6QTpMPwntbKMsoFKM9h1iKbENLL5o2/Xt0HIQm0SzfEG
	 U4PLFpMgtj5WHUtzTPkSJjhi4WTASEe0dypYnQFd3TqfXoF8bgqBGbSXSmfzemr/Qrhy7
	 QYAr4bv0WGFpyioPmAFYZfRfUxgKNYpPtR1TAFgpykKLrYbwmRpmOUqyo/IsmCuwHWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
	b=pNstUJGttNQB47lySgrth2Rf6LTFa4robT/RooRpfDWAqYX57p1xSdJAVJ2nNvFuzpRd
	 itzdBbAJFAg0BZZWcMcIRCm1F7Mj29hbOPuMAWHH04jcCe84XA1xJD3B+z+e9l4guTMs5
	 rKQaIT1vbmVQPAziC7pYRRtDivh7eLro5Q8TNjlg9cgH/nGIgFkgxty9b0C6tYptVH3w4
	 Dhp97BPTs3+eIXv44Takd3mw8KRNzYq/nn/fmY6qhOkgS35c/l51U9jOz53e16N3gybPi
	 gz7LWfyGj2HxOR2w2SnuiTNC8FJApOFjJkPpLEA78sGSGYwGMS7q+RLiCn1Ved4M95g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=igme2IZP;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD54A60742C0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD54A60742C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=igme2IZP
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8256106635eso763906a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296717; x=1794901517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
        b=igme2IZPDnrzZLUDBjJ7JC56FCY5L6Nz+uNSAN+WdZ9mLvhIvFixTSc9PwJIk0QeQ/
         QNapVPy4ulqMmaZbHmft7k1AGIaygIUGi4uCqXTzRaVO0hEonelP6Ngz/iyrkglp/1v6
         FxHUOmJSX5afutmj+a2Ee3X4Jg6aXQIxRVWdzuLMfKmQUKm4bjjta1NgkHtbR+qlbadJ
         827nfeQf2fAOAhyK1zd7pWWHcSGGHTvT/Ypu8/W5t+5ul8IJJefeIKsoqQKSXT3hLyYE
         sXloBtjjjwzGEX+TBAmSVshWhCYdf5098tcHiKDWQjoTrxX1kMb1ecSb3hN2tHUi73OY
         0LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296717; x=1794901517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtoE/q2C4k2NNiMs/Ld1bUT7pKQ3a3d65YuvuOUWKZ4=;
        b=fud+NbvM4YFFKYdd6wj0C9Y/2zaTAv/TnzOkO01v4wDwdqguo3nEiC9t7DJc2ymiBv
         vM/zQp9iIP167z5BeTogiXGQPyk2tjd3DwYKZOgJ3YxBT+LwXiCJZQhZVUNJ0IgpPkSS
         80XQgiQevBN8SVoj0ikF0n1VuXys1BB2h9C8X3FKgeCT2EHEFQ42m8YsesmNvCddD3kL
         OYGmlgGZX77IfiA5uIcODf9Ypvv4VfRn2zUQOYyUppghHIqoyzIsJMO5ow7sJmCUhwwv
         57iLSsUA2aTHMdz8sg2zJLkS3Cr8i8dHpnkNvn2c3TJuOCGE7pxyKdtdBM4XSRSc7t2a
         Vwug==
X-Forwarded-Encrypted: i=1; AL+hErGQYE1Wg2xbLW7pHmbJRFdKhXlEkoN60PPASBd0uBti/5DbEEeWwUQ4n53bC/akZjgwbTHb07wSLlEXT20=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aE/vpiFnaS0kxsRQzLPqRBfYRYEuL/bHED64Lzn2U2zWEa39W
	yu5kl7CkUhe+JyZvrF0IFsEZFscmtAjoOl3lNfgWp1YaTe74cogy8jed
X-Gm-Gg: AYBFou33huseQgH2M9FXrQRqQgSdc2XMDAGFiUPr49rsWU6X36+6pnLYbcn3etZuzHJ
	fj6x8J2VrO37yUgr1B0ZfKI+BhhhU35KI1ywRldT+7uwbhP/2TWtGkSZindR4j372APSKT3ESs5
	F6fI6/e5NmandAfUzP88d3umjREWMxVsg2gLC0Axga0EiMaArHLxqbgB90dtBi8AbReeEn1XeBf
	OoaGA7ctQR1WcpxDLOKLL3FiauWXAYJM7PUf8i5BXhAKnn9C44Mh2jw2F0lsr4Xmu9vya6pThjy
	BoH3sjdq3vmg6ydP9s+4hUicluJ8/Kux8YrVvAhLKkTw9JPLq/fnBzg2HtlRwFLlTy7hGSfmfq9
	LCvG6lA1Y5mwxolubjnFJFXVrx5bc0Gw61gDbGL6NsFfE88JzW6OOqEwioFK5s4oMTMjb9vtR37
	jU+mEgrO1ILWkpbtbx/wgmDs5lD/R/K5U40y0V5hLzivcleAYQZvMq7U9RxCQ8053DK08A+cgbr
	uduXWx43ElOOO51DmEKU6x9wtgYzUZAc0vft4A0E7D50QKXvrv/1kGoN3CHDCWwEORfL0bHaYRY
	0RTy/E8Iu8sBXXG+T+KZ9mvnxu6AHfClTmsEXkHFVF8oTzDMiBsg0jEWGzB7ux3kU74RPhJ7JwZ
	N5wnU3moIC8FMMMVn813hQfUpvPSCv4rhREwTb8YNwNDT2rQO90q9DMA7VKszhSfGXO2yGizvhz
	dT+NNrwqYakLkIAP6p1WkpDjo5Dium1CSYbWRKERdEVTCAWk1KHks=
X-Received: by 2002:a05:6808:13c2:b0:4f4:4de8:9376 with SMTP id 5614622812f47-5683cd9c3f7mr1680606b6e.54.1794296716679;
        Mon, 09 Nov 2026 23:45:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:53 -0700
Subject: [PATCH v2 50/58] mtd: rawnand: ingenic: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-50-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>
X-Mailer: b4 0.15.2

Unregister and disconnect all chips before releasing the ECC provider.
Retain each chip and its shared controller until the final MTD put,
while releasing hardware resources during device removal.

Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index f1e2c82936b3..775ebf4dd3b9 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -341,6 +341,11 @@ static const struct nand_controller_ops ingenic_nand_controller_ops = {
 	.exec_op = ingenic_nand_exec_op,
 };
 
+static void ingenic_nand_release(struct nand_chip *chip)
+{
+	kfree(to_ingenic_nand(nand_to_mtd(chip)));
+}
+
 static int ingenic_nand_init_chip(struct platform_device *pdev,
 				  struct ingenic_nfc *nfc,
 				  struct device_node *np,
@@ -368,7 +373,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -377,7 +382,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	if (IS_ERR(nand->busy_gpio)) {
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -385,15 +390,17 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
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
 	mtd->dev.parent = dev;
 
 	chip->options = NAND_NO_SUBPAGE_WRITE;
@@ -404,17 +411,27 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 	chip->controller->ops = &ingenic_nand_controller_ops;
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, ingenic_nand_release);
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
@@ -429,8 +446,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
 		chip = &ingenic_chip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&ingenic_chip->chip_list);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -461,6 +479,11 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 	return 0;
 }
 
+static void ingenic_nfc_release(struct nand_controller *controller)
+{
+	kfree(to_ingenic_nfc(controller));
+}
+
 static int ingenic_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -474,9 +497,12 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
+	nfc = kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, ingenic_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->soc_info = device_get_match_data(dev);
 	if (!nfc->soc_info)
@@ -493,7 +519,6 @@ static int ingenic_nand_probe(struct platform_device *pdev)
 	nfc->dev = dev;
 	nfc->num_banks = num_banks;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 
 	ret = ingenic_nand_init_chips(nfc, pdev);
@@ -511,10 +536,10 @@ static void ingenic_nand_remove(struct platform_device *pdev)
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

