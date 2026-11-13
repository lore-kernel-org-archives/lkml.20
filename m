Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593761;
	b=SaKyNOdGvxAx7U3Hzf+oNhIZbv4MdvMIPALSzafuLyjLtikOVjIRJBvI/2gB6QzSrolS
	 5z5sNcS0l2lhEMYSA7SRloay/FEyPF+pPBLzXBBPP7Qz+tLVKeMAgRyB0Yf3f76AZG+RB
	 IvboTKe9oee4hq/UBZ3kXcEb/mMvkKl3nEw6IjOVVFFKrK6WlixhVG8mGVn4xPTQfuK5Q
	 58D5qzR4MkZ7Io5Eu/FuYauxqG7WghtXVXosz4POuRPbDTSWfIC6txRpTx8Ky6zSKk51m
	 ogu6dRVPV5Z2j/PXpulO0n0FWj+0xw04YkIxS+SRtFLICFpDMBomgfCWsKbjifI9etA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
	b=GRrrUdK3NUTn93xFgxgvFFaI7Xuerb1602FKvIWzQ0f2RA2cMSq7K4T6/tSEt3j/lpEK
	 4KykFR5C2Js/tYDdK6Ka2xyWNBwzb17C66GxdY2e+VoVQ82LcbssWP1uW/XuXaWYQcAzu
	 lNXmJhfefVfDC1g7gdQuHsQ5Qau1Av4VxxQhhiXe7IS503kza9IqXGKCJn474i1tnFtxm
	 63YC2mFfk6LZTjIKKKl5iraFb3p0pmuXaQGqcigO99lMQ/ah7ifJTL2AQ/ZcTnaw+jrpc
	 Abij7wk3uwBJkPpKArB+drwAMllpL6NqxkYJ4IeGDw4HYIm99JqkRPsQNqzzgsUmzOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HV4dy9Kg;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D3606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383D3606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HV4dy9Kg
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2090160a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593760; x=1795198560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=HV4dy9Kg9EMQklxIeLy47pk2AtyoFcE7KrLILgw4Q4d7Ht7up41PlzuRNUr9HIdSD3
         pCHEYFKjkIJOwmDyBVrJ2aWiLSz6Ln2uiC4pZX/DASEfwM/Pi24gECnTMyV6fi10D0AH
         OJWeOV8cuRRqNDu7w35tK3nTDFa7tM/XjKMaGOAf6vGs2sFVFa/XlKlThT4JZc8X+rYN
         yrFBTXRvpy6oGmt6CXNzza8upTcuq7qt7SGMgdFwDfOaehMR8gC+uJ2rdTPikPCF/SXX
         dIrGvaFD0eQ3rWSBlabt9jeSy8Zv9OBXXZ0aQ4jqtP3FtoVdQk1gO6GXumDdt+XEjsJl
         +Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593760; x=1795198560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=OjXdL/L62BA9CSVst8HWw/USFznqnsvhzZBRjdPPv9m15+eAd5bzV9FqWb8xUcPhKm
         ZcZB1Vy9ZUxFCDUwy2F9g61FUT8rl0CHJO1H82r6nuJtxqGBbaFj3lcrM0vMdDCYt8A6
         lz79X56JkY1D9wLphTu1M29J9EsISPWyI1iP54pd4ovHpMwDGCmWOlJdYTInuUeJLrpS
         GINg8lony1HD6JgC7m11c36a2Y9+S/A5PxucmzEdzpDANnV0/pVtSqiclDpn5kY7Q1X+
         /EeLtwQZ8uUKsu7m8Gc+VZMBGSqm1//rCIhLTqhjQAKFWcWzEZlHwEH1jTnqKTmDGoGV
         Ml9Q==
X-Forwarded-Encrypted: i=1; AL+hErFXi86jcjFUwgaUumBDUAm0iZqApGqrcSzMlBNvc6C2/ntShomk7kz2bn563aWQeJ6k38leQp5g6+2z+fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FzcMatPipDnxszI1rTnMckvqBNho1/SiTrzEhHGeq6Tklj2uP
	K64mBFSoyB7wcwWivvUIwU7rycblH/Ny1W2mXcLNMiNdLWBtM2dvt5Tl+hkzfg17
X-Gm-Gg: AYBFou3mHV6QRorZzE75jotuTPpD0EPRD1kM5XKpsF6z4z+OjlysvBpOSuCfgn/sHCl
	AD3TWdQSSsCi/5x3rXi65wajmeB10Z2Wrge8utOdrPj4z+yYCr77I41cetcY0iMw7VrgK/x5yB0
	yQdidUn1GEwwDlEz7rpfiO7nc1qJPYOq+B0h64StrvBQ7yOO1OiUmJ5edPMTDRUWCFMxA4xquX3
	De1OR57T5PJEJte8WVCkhCZCqGBdlQKZmfmMKVQKkmAdF4v8qPfp57RGLDf8/bBDk8HxVXhzNO7
	Zng3NurlcOUEE9ltyLhZSELTw53WbjRO1SuYj0SVtpQev14DpcLMpgMuI6/qQ10ymDkihGg5QbY
	wZh/cAN6tf8/+IHMp9KRoTEnr7GmSHcWh/+Cgllo53Lk0JXIR056Kb0OxmFeC0wtcR1HSnKFfVH
	zrOUSSiI8tteRpbAGrGdFtXvs6RJkaesdugZWGIHQxOm7GhZSaIzF4rITNDsd7VMoQTnFXLAQ8P
	mXoZ3Si2O+JdcAUqEiTItUKzpQlWC8rYzlVDw8YqfkxtUTTgaCF6u7p5OxwOYiiJ5CD0Qxuz2rf
	SNWKm0XaL6gn5WGIo+Tx84tTa52q7evxsDcOMqucaAT7CW+3rywx3QmjAKIdctP50VfZH0WpTYl
	JMHqZPLy9UwDw1OghHENdHh3ZEmhRFt6S6gTtQ+qZBWe+NkWP82UoaAKuiP67u4wY7SzVktPXby
	EkpqxIU7XKhZoq3EKge2DWQItE35e4ncSHingBJM7YQdIeG1W6LHwn
X-Received: by 2002:a05:6830:7183:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-8628981220cmr2349087a34.8.1794593760312;
        Fri, 13 Nov 2026 10:16:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:46 -0700
Subject: [PATCH v4 30/58] mtd: rawnand: pl35x: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-30-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind chip ownership on registration failures as well as removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 36 ++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 537387014e2a..e5d86d72faf3 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1057,22 +1057,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1091,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, plnand);
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
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1131,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1153,12 +1167,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
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
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

