Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593773;
	b=Oe2v6zsZNPtUq9ktM1J22pDnGs7wNYeZfRKpczmD2OCPNiTn8efWnOxRpOsF0k1cvdMl
	 7lB2oOjtaHEPj7RpKLkbgYQWvVi66ZOP4fFEiaUcJLVR5N8LVpo12IUIrCUaH+AWRFBzG
	 uU4kE1r1ZoBRAtf/EYjbGXWE0/fa6ep9yDcE/+R8RKmqlFys3g29dMnsaeF4eI712YCs1
	 xgpGjAnknDSLdUiNgzd69CE+D4qeRGMP/C2Si9kE4vbxR9rbxTyyCcuJ4zlTcuJwwl948
	 xoqgnoLBbac/Sv9OxLzsawD5Vs6bloU+gdnWvwduOkMCoIXpNgTNA4j/NtcJgXgCc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
	b=CgnWt01HPy7OTuvzQeQU9Wm9Rk1mYZaqDvNgjWlU42fnGCbXFCw7LnxYOkSnwhXHAy74
	 fWgsp6LoyIhBXT3i7xr+Mkc9W6jT29OjNc44iPKRrbXl+yuS/TdRp286diSC0mwKp+xoO
	 0/idmnMVa/fwnLIq2YjhTN1Hok9ASXed/1pn1ce/Dd3BcDlcLSn75hRBkBg7xO5+qcWG7
	 4TFQgpD6lj0f7Gwnul9p9gOgqF55m6F7mtv03goaVNm6DDemZXy6XN77jvRgjtrravlcX
	 fN5Sd5YzO3RMOQEOz9w9KiwTrcV+tDjBLMnQqGQsBZ+WyGyYlAGE7XuiwPvk1D2POqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j1/9ewcD";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A4E606B220
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A4E606B220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1/9ewcD
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-833e671ee9fso2375888a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593773; x=1795198573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=j1/9ewcDwV4PgRumsbyVzaUAtn7p2u4jx7Utu+V/bsMTCiyEoR25jsPjZnlGkkF1Gg
         V26YbWnz96whgiESQe6KKoZgf0fScL45BZRkUPpjBnY0Cs63yWowets/TqP0cxxtbtUZ
         PB4ZTXQhuRntoKzIFQoPFqb80AfxOUKBbauSQJtCBWDvs90f0h7Jq98wpgCQ3wNutQW1
         SAeEChYgyrprAN7MZnrQGp6OIFNzt89mM+Y0GbUfxYEc1Tbfbw+2Kg0iEDEOQAbatZf9
         WxhxhMf3k5qKd4CS/kd+ruHCmwt5qirAqk/NLLLKVfNUEGklel1l9fptfwtuwL2MUNdl
         z2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593773; x=1795198573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=gA+lwM8fr8HEh+YNbmQiqwmKiaEXjENSyajo8AFjdmPI0LcMWjyl9hC2ReMON1X/r0
         1S1lPgl8MFczVt4W1sOrUw9MpOF6iGA7SnzmiqOYZj2j4E0AjI9iLDOmQJvalHO6SmnY
         lw9SgQLzo9cB3lL00rJZAN87OUiJC7VuO2b3g8YioNsHs297zfSjtN3wTDxYiVEJ6SS6
         dRJSu+/98APiKNBWVYu/P6Bg/z2Mz7baydOd/BO5Heer0RUPzFw8D90oKmK7+KiDruRj
         c3IGtUrsIq06ACn5aDu1t3cU5kTm+l/DtwFWK4iZpvTuJkXgi5FAYYyVDJfY3aDEr98Z
         T/VA==
X-Forwarded-Encrypted: i=1; AL+hErGUV65meT+P9/eZ5FGvB7agD/NSxsPUtgSHLgON/FirGHBYINuOZdZ8CmZzcQ1qiV4TCZ+P46KXGvV1xwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/95o7fzrxhjgvJfghShKSsdJ+KQ7MbdaWXVdPJLtDxp+mr4GPy
	tuRmGnGT6Yk1GCpaujay3vegBdZlHhL1T3WHEd5iQ0Rz+WJGG/iOFuIN0ifbj+I6
X-Gm-Gg: AYBFou2NYmbDtgOCtWw11Im+I21a8E/LKdvYo3SlrHNoLkw0YGVXkoeR9MxqcK4B32Y
	b0tYE1irQtGGOkFLiDdbzUonmKp+UfE8Kw+SS+51mMRtz3I1tGlCvgPupC4m+syE6dakpU4h52E
	EsxaHzPsS8fF5+0xkNNE236n/rNUkT8wUuVWDvUZ1sSneYHZwt6p9Kyqw+ZIKbxF3XCpPOTVYM3
	vpjFuD9Om6dAC5wknSvl9FjOoA+3CMl0Z4FNhiElCzheYrfuT4yyd/WTtY/eEUiUllQy2B1FFVL
	c6HdJLt7jj/hZ4cw0oYOG+lChWs2ayM0jwR/Jk58wF5a74vLAS9zcwmTDqeff3/vBzPMLLios+Z
	RloOnfXn0iAdrFkSvfKwnuvMRaSEVVS+LIvZCtV6OSfqzTGq7IpShIxdWvkfB0/ANd+OzYsuvkf
	pppZYeugugMVBNKkO+Ao4aYzvA+bZpZVTXQFtUOFsp+YvPm605aXHisMQTEX7SoRXLznKFafZ5H
	Aqtp02JyUI9IyurHn/SY/WEUe9GJF/keQYrMgRoj0C/+eszLDjqkyVFNqq269Z2wjFPlHXj7Nv3
	VN+B628ZBB0zuH231CzR8gJiAa1q4XCLmOa3rIHL5+DHiwnb0mnNzHzlyDlzQsD3FqKssrIxiJS
	cGUZw0xJHdkFYIempS4R1O8UCi+y2MRRg7X7G6e8QcQnCUSdS0Sc0Q0sj5+BgGF07rsviXfLnxm
	Ux9q0Y71iLdGw+NdAG2n9qdVz1t/qcvd+KBXMkzx3pHgam5ueHSpE=
X-Received: by 2002:a05:6830:310d:b0:7f6:5536:8b7f with SMTP id 46e09a7af769-8628982a042mr4014286a34.7.1794593772589;
        Fri, 13 Nov 2026 10:16:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:52 -0700
Subject: [PATCH v4 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 35 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 135cdb67a472..8a2a55007148 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1217,8 +1217,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1228,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1258,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rnand_chip, chip));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1289,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1304,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1322,12 +1331,14 @@ static int rnandc_probe(struct platform_device *pdev)
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

