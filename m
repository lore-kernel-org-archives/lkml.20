Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446927;
	b=PzIOsUML1z9GtGDI5HqTRRTJmJjf/FdouoruPxlY5ZKyUmKymlJs0INeu4PCbIEHAhrG
	 vQt1d4ijjcHTofUJadiQDwcYWUYlG49odPJUjr9iquNPzx3WEfn3wuVvfXgkjqWehlbwd
	 hWsBTWDaKe4uI3CvxTYcW9bpHOf87agvHSrm7u4nvBTyPPS3pQRJZsAMKaZQih7lw8/9d
	 xrftiodwzGVWpG8NfCgb7llzTT50Ph2tp4Ga19kHkmHAV+8aY4w5mVpWx9Zu7F6/CvUOH
	 aAkys1oahdHYsI8lOk7oaTt8PaTeW8sTbQOwRVo9K4GnYeQnosMFChTvY3/ULJhUZJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
	b=0DZbsbH42KlTWd4/ule/QCyp2Q8pGd4+kI/A7GRruIl9eYof5SYF0AV4NOUzmZRNjbqV
	 e9JI7n7cvE4T7ojxhoOZARe5fCDtqElnSkpnJJA4voAv5hlrcpd4WcB9Zi6El52rKbHWz
	 1ECNU2e9PvCMgccU6lMkuTrQ4SHncCW+X/p/xVp52U83YeE17IVAxrwwKRPh9FkYGusaI
	 c+uSz30YXhS1u/Pp8eGIsyko92eK7ch8uzg/bymwy3erD8PviOpflQEI2n64q3K5L5+3J
	 ZzF1+e8QXHHEFUdksLLvqM7ltD+R1PoxBkZmHTBrGJICqgrRzLNISWdXL+Q+dTBeW8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7zBOPVC;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE57606A89F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE57606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7zBOPVC
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so2384523fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446926; x=1795051726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=H7zBOPVC8ozjvLld3p0A2txqtWWmvrkWpDFd1yjiF3DvT05tQKEtxD/l+NFAargU5t
         ArspgDsAXZmLbNNrSR9FN1w8q2tpJ6HYDUCtxqeX2jox0RD27+oQsOUda/NrXAlUCqR7
         HbJV00SUGro4wYAbiZJWT8TBLnX548zmVUBmOC+cPLdT9tf1YgtbhVHuHqRms+EKiGBp
         lmZ6OkpKyF5Gjp1ghnfmNDaQMaUfay7+TISsvAHS4tzKg6wQBClO7j15OKzoIbNRVt0n
         exxwEyYzzqwpFr8weJndlCJTZ+t3xuSx/voDv4QaIeskpc2LDGRDCHddBDttj8BHlCEe
         uI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446926; x=1795051726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=d5S+G0sWPN9EvKxWQw3L8fUjSXcZxXvtgf7VfZJqLnxpSC0QcxqGAh7sDPcCgzyXpq
         nyINvAJW9rJipOoDDnEOmN/Aez5xjfBXryy4W24iD6C5ZzZ+HNu/LY5HlKOr4aGYyjmZ
         spMO4TU5IzzX4v1rCUh1vz4TrKzxqCH34xwXizmfEODNigQEi1JVw7Lkdsch3ROIN1+F
         nw4LYz+nploLI4SP+XDKGG8a9f04EErN9A2pfFO+wQQloo6SMbD1aj1EMwUMApIuCq2I
         HuOuvlUg9ZhaxxLyQGlKtQ0rSZcCudsIi6JA5Ov4/7KcBXOmXJVYvkx7qgkFaUh/iftc
         Zriw==
X-Forwarded-Encrypted: i=1; AL+hErEP7NQK64uZhw1RbmGDpCV6tDwPgbuV8ZXCGXdJy9y/gk44wDDUTF381YdiEankzDeO+NWb1S9LntEYoiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z91e5ziEHnviAtM8Y8dQ0AjPZQNiRf9oJv4wnEY6cy9krPfEaVk
	xkSaE7j8p8S4XmUmzui4bFZ97IrV5ydMSoNlvUCn/5sBJ9c2ymuMr5lz
X-Gm-Gg: AYBFou0CnqN6/BJl9sz+ROEF84oOjqveU4bqjdvR4fCtb3uGTsZlqnBUSAn3bwCDRr+
	m8LrJIUFDQtcXDUcgidtGnbCFG+4/QYFcj6Nrvaauv2x9/td9tREaeXh4O5hWbS/5Q5dEMuKIll
	n9I3McyshlAOWAIASyw1p45uHenlqGXQiR1ynT1yImpTjXXLpseaobxktOde753Pa73o5c7PYZn
	u1Aby/pvYSC3VaeB/NjWm/NxxPdVu0EI1DpnXCUgboEKffvVpqwVz34wsaRuYs8TJ8IUFbipvme
	gLYSBbDZzKADAa2yb5uXV3zMSruh/OmcyzhCkYBbyPeTUAKsZETn0K01MIJTqy1axUVFW8Z0+ka
	LVnzeg+CE4uiz89bbuJa787HymXpDA2B6oH9/kK5ZeXibomGp/kvqEAC/eF3vXTFtDV+lYTIygH
	WYB+w//ZIl880Y3uPYgsVIK0GZvHl+necag/c/+rt7DyYoacLv5SJUbcoJ3IZK5d0hmGtkve1fl
	MnWGvVaflc2qTJtXOeWvt++aqP2cc0zfbBCvWfk1JzTP3NzjlQI7ol8xFxVlUHLB86GSR6QsV1K
	tCbENB7Emrb2mRkzoG7YFzq8EFqN2/FqD7tAUWycJm/yKMAVfb3dfpYxrzkVBdqaD+wcyJJVDMO
	46n0fMNw6wxeKZdMioCOF61mX+e+/Me2puYwc8IRLcUiWX1pRX55cIbflD2clyJZuhXEBEH1mpt
	E/zs6kDVGq4Qpw0MDvzoZnhwqn4SEphUSkpXMSp5StC8xbT6EET0Hb
X-Received: by 2002:a05:6808:13c1:b0:52b:7641:33a6 with SMTP id 5614622812f47-56b95164a88mr4069642b6e.14.1794446926299;
        Wed, 11 Nov 2026 17:28:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:55 -0700
Subject: [PATCH v3 16/58] mtd: rawnand: mtk: retain chips across controller
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-16-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index a36a82d10aa7..010f614a2da3 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1356,8 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1365,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1406,7 +1407,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->ecc.read_oob = mtk_nfc_read_oob_std;
 
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 	mtd->name = MTK_NAME;
 	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
@@ -1415,18 +1416,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(nand, chip);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1452,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1511,11 +1523,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0

