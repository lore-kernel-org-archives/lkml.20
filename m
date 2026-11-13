Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593736;
	b=x+rV3y7rsH/TuA9iklcElaYeU/oe8fACBU31suZItHkJhCpLLM1Puhq8Wj2dr0l7PD4t
	 FRi9S9whwBfQX1jP3g7picI41EQrxz6mELP6LKNEi55ZRf54JdMjOJJOTFbtLat2j4e/a
	 YEqhy6i8Wsk0MEVdM0I231L343kklRwz9sWZ4TBGp1puGmtDwI3xN3C8v4LtWUXsihU6U
	 THuSBXAtGOzQXJoUQG2jYEyWexzsSlaYK/d0NQ53Tfut8JvfRmev5dnMnb8n78AgO7hx/
	 eo2kycnqoU+3FVR9fcu8uJPcoKxeMi4/EnFPUxVbyaAwuKVN46wZOPTdhE6wrvLWW8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
	b=V2BfqhB7M1ru3NEI9JglWckVORorLhZwn+jgRWY61jmjD/J+bmN0+EuRkxmWhhNEKjW7
	 pv4WDC2Z/ZJBUNwwZWfC1gOxz1heZ6h9to8jhLaAmhrbUdoFQ648j+Q8OfiLjo9g2gb7K
	 JBC/aC5KuSAIhGwSHPpGakBcmgi8DQMTGKAIRwy6DJViD2RzazPIUhReI5uzlq7sfle2j
	 DLVOwyv4viOfa8nHCiZN/k5aVOxWqBpDvj+XHD3JljwPjSmjDvRQ+IPWsIA2swJHRrzgC
	 m7com3MQehXN73Lz1SPmFDwiUvg6uSNvgga3y6j5ClhMNyCPCWdN78HwFQ4GRvX7oug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XLChZRH/";
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3E60A6F48
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D3E60A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLChZRH/
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8628b63dd60so389976a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593735; x=1795198535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=XLChZRH/Tvi11UBCUGS3WIM9y3GVuQ6VdIrLvZTJVUCe4+GjiZJ20tlFBNO86YmoxS
         7XMzVHzpDcASy9EDiEBL/bgrmkRbKw8ZzN2wGqxWOnpJy/dhKBjBriAQRMhcuUTH2ooB
         BvETnHtDXczanmaJcG3hJccNhBKV+c5f5D2mIneMR+8zas+PITrn3qMV1pzs5XI2xJ7H
         Yju+7ji/uqqdB5AqXiOUXPrJDH7BMIu6ChKa/B3FParU3VOrRWXmUmcGuRupmYW48Uo6
         hzV/BB/I0SDwGK+DjB/wTzZMT/8FGuumfpI4sD0PjMz1mLvvgN0WWx3aIZrQgTBAY6Xk
         Fdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593735; x=1795198535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=qM9m1IQYtntyWiF9quW7nfvwtPKsXqGkQRzH5NHHOCdQHf5k1i6bZoNViFvqBqc8B7
         C+QC0u1i0Jy0QReENgBH6joXiwvDdt34owo8+V0pFKFRJQ7ltSJAUYW/iJ7w8RvgnhKy
         fHaxYuRM6RgWNVul04VcaDlzktYZBbsmsRyuKtwkgytbIdkPgq1/qSaGFaSDGj/DniiR
         URux7cRx10Z3yulqQ/KKUVEpBxGeUT0DotJqR4MhZxqQwPqO01iVx9TWsPPZiBPagUa3
         jEzQ3teUOdMoe9+v+xgc9Bwrs1PiLD3BB2pQgEyaXTJFJPss0OAESWgSTiYMLOyYjI2C
         eHDA==
X-Forwarded-Encrypted: i=1; AL+hErGQ+6SmuoEaUqbMGYuVXnxaxvIu0CduxdE29b1mNjwkU6cYGFCY7787Zzmu7JKUr/vvmbfXfUleL4qJXOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wClyInuznypSLFjBzKDfc30SthheAKjYxAj8VTwspDhFbBFMX
	gQa8QKF/f5IGc0vgO3/nIpLMe7z4/xjoBMw01BUiWpXS5i7fL0f5uuotxTx1WhDA
X-Gm-Gg: AYBFou3RU6scrrvzKjq9cqKUCu3+ru0E2xvOATlenIu8XZ/GjJ+5RiDkq3Fyb7gtUaY
	X4FlsQLOVIs2f/7UUwgHYlLqck5Z1bQCTA8bO3zQCv9Yj7nd5bLcnCdX+2G1h/b7w6zzMLqZ8bS
	biLvY5uY7PQTWkuMItaW0NC6/t4qk/2rHl3Bw5zdtEmpFf/tJS3Vcvi5GmL7ocUmiTtXVcsuSSD
	Kq0XGYf3BGtpK8hl0jbyonrNCEofITPIbC4ue0Ih03KdpHuXey8JEoRk2eSY8M075lZpSg6GJz6
	EDQ1CkEgErD8j1FvxsOdq7Blp4zTIdBNtmRUC/1RYBWFn8kMMaPFkpp7En7iM8Y/6DipT+xdZrJ
	kJ9zLdOy+ZH6crGbzaTphjFATYSEn7tGujXGKLl9rcO2/kXc2Qi6DLrV7ewAJ+fRMi0vpu0PnOk
	N9o7NCdTxXRkIiDLoEG20MotgUpsPBoB5+nXwUwYS0oPKdpB49asdePyrNEQ4ponGbK9+ifLlA/
	bGvas3BM4aROfu9rmf1YQyJfgF3IUEH2rscAmPzL4W95B8+qNGIhaVhouwCRpYKy/Mh5zp/nakT
	Jh8li2r7F9ETRnqVQtSBcsjlB6JxyXitldEEhw1a8eEiRgrTrahTSUCnL6X2XFnObKXZCb62cn2
	q9Ksj91DRVvk+0ZLrxzwbaxbmtYQiiDOj8ZBg5aaWyzWKjbFDYx7QipWnobKlb5UCrl3Nv4M0gc
	qKfrWsnh2FglXc6pi7TMapdnVBA/8vbSWibpnS96J0zeNp/PG9D84=
X-Received: by 2002:a05:6830:7192:b0:814:8259:781e with SMTP id 46e09a7af769-8628979ea24mr2976379a34.1.1794593735257;
        Fri, 13 Nov 2026 10:15:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:32 -0700
Subject: [PATCH v4 16/58] mtd: rawnand: mtk: retain chips across controller
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-16-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

