Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594374;
	b=UguKrwp1H06gMawkyzEj+SizGgQUke2Qi7EoIqncF6bRSPuDingc4srkU4J7/6sAwe/5
	 pb8Kq/+4JdnRXAkB14J/EyJ6cErnm4CwMyyiHlED0pItTncq/vyKwpSN8NZDwV3DPsP+X
	 syJuP+9z6ypAQGw2bMFiRFxKQOBeXJJLiu7xESuunJkYc0I7v+a2tdYGedV6dbOjFGv+O
	 1T1yIGM6XsAP/nJ3fVH4nhfT8LBmhMu9dCFNDMA70sdJsgCGv4gMLjrcsojSN4zhfa9av
	 DQ6svKYIVF+FgYqVuZ6/5xHfqynm4z+hR39TytOQPjnzPvEqiHzOFqxqEgr17FzyKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
	b=2Hj1UknoeY+hlGoe3QYcKq08rSaRkrifageEHj5Qja9iXsre8G4E/J5+1nHrTQWIGdDz
	 trH7Gj5TF3xejYSvWZwG0oN63K0jqrdqfkajBmBaT73OdKioaa4svYlf7VGTP3lMbebr1
	 QwYW9XB+OWManiWe4DjLbe52JkvuLs1qv5ssK89Hp7wmO2fuPhUcwuooro5bzmcjdYLf1
	 iOCOCGvYYcToJoTqoYrPDMpBm43iwja7Afgj1aFOEwZcnmPeDKqIQTDZeqnF3V5W2k6UV
	 dhN4tio0cMwDEVz91nVaom9aRxl1EirHHIfcie+zsZFnRBVIGBUP5l0CRAL4+olOISg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDDkTnlu;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF81E60A262E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF81E60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDDkTnlu
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-451a49abd8aso1901445fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594372; x=1795199172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=EDDkTnluKHl9xLGOLY+htHoRZ+L/Miv993by/bCOjFyPWlMNDuKavPAD8MClNb779F
         NXxzHPseG58EgHUn7BkZMEu4JDqF5X7zZ/Wv3bIerIDoZIrkWeShrrMt8MVEI8nHfIys
         eZ843eH4DHfDWg0vp/kSiQn4KlHcGCTa5AuqkhGKcgXcpo2IV8Os/zOLc4P/otHUHT3X
         zWUem6YzHn66jZVbCxeiZVnjGRAKnX+HHWer9VqeFNFZafc1AGo+cka2w7GPJpUml7Tl
         5ahkMgZzYnKGKncFhfxp7RXS6pQeEa5QCFglHlt3TUJHzEjI38izPsWAwSmV956r10UE
         vJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594372; x=1795199172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=JtfzLJxDaUqexRbrErOMYasnGTDwoBQm6As7tqeERaCJDaTyhMH6xbiHqq+ca645AG
         4W4sUpNtN5gGcYSyySOVtxb2CYnb9QQAJDHuPgyZgYEM7w00SIe+moBU7wfxiRiyo3Km
         nGfFS9jpOC7t22NurZS6jmC7AT2d///SL7IJAxsZMQ7TrAjdu4omnoBSRXHdeKex2UoM
         1erGPrJt4VWdrKpEXHwcYpf3RDPWsG9IoJYpCpad7VIrm5RDApkVlHejynkWcjj/R02H
         nlkzoLiBCdDmlbY6LiJquxFP2uPpXQE5R5b+75rDUtr5VCkL+k5pg+RmiJxw2QHZYqPN
         jXPw==
X-Forwarded-Encrypted: i=1; AL+hErHzborTLLsBW4+ivMGAd9vNjAsyg5u3w5Czh6LilC+le2Bhna4on49nJRMG0zZXruQ3aab/UNE/WwmkZQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hEqdP2tbusFjRpIdonKnKipBhR0ajTXgf1hRrBmRpHsd4BYDd
	+hiPtv4ziHrnHQAbO/blc6kkRLuwdJ1Mt92RaqrNNRNIjwuO9drZNPTT
X-Gm-Gg: AYBFou0+ZbLsVsN76pw+putmGCO6x+OO+BVzYZSukOSiqrXzPrbmJKKEpfx7fuX1P4c
	vSwR/ANAFz3MH/0qKovfFZhDdSbsCm3NZgdaBGspL/hk7+kWIWDo82uRIDHow8PgB4n7FyuKqY+
	AsDiho2HpLAztKb10bwU4eUO+qhi7VCsO+i80eUs0r++U+y8eEkMmMyNys8GSHhrnM6cd0s4f48
	9Qo4u8uRgYALRojWRbJH7PBW77c5wIsM2lKwYo651a1ehcqtQAzmT6Jw3fj5DTLm29ggsldM/Ls
	kaKxzqrn67cw0tTur9YSng38T82FfddjecMVZ3O4Gf4FIpCKnt2Yk6YCmdVbmPoyMtE9Jn3EzAk
	i9cPKceeWq0sCtlVMwH3lL5x17FcBLvnfI013KP6Gp+kvaz6s+R44/OUYunhHUPgeN9CZxuB2dM
	6RprTDLjYyH1kMlND+b75tvKLeh5M/htub8cI9eGWO3SS50nlq7uTRlHQPhsGmwrt9Dv/S5QHKv
	rRgnuzaue4dya9CCEvBxeV1mccf0nLOhLdq55rPjYaMEXy5duj6zcz3B+CrnzrxUcjVVdZ0H3ko
	0HftE5bCBjocDx/wODHMSTHfVHffdcDIlcWPpuCLDU4GDkX1H9s+0K2Sn59hdgL11B15L67M4VO
	YaBaGJFDrF/ggdvWj4SaujdoQUGvau0LMUv9ZwRwlSKDr6eYFP5XNjYbUhaR/L7rJVIUp80XzOG
	aS+6GtkwMGf1Kpoli2Y3XJLVhix50/rUepWdIM0z1SwtttXdJayLE=
X-Received: by 2002:a05:6871:a1e5:b0:4a9:58d3:b60c with SMTP id 586e51a60fabf-4afdf6f359bmr3316826fac.32.1794594372472;
        Fri, 13 Nov 2026 10:26:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:04 -0700
Subject: [PATCH v4 48/58] mtd: rawnand: ndfc: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-48-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index ce10fc6a41aa..27ab5c034e70 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,7 +171,16 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
@@ -187,11 +194,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +209,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +254,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0

