Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296675;
	b=ayV5up4/vjumT9ivcDpY8mU9Q+KzsDs/B04P0gffGRxvCynsSOTYvjhpZvFB3C3iLXhq
	 Fwdp+2nTxqmIT3L0n6uAezMG1/GhS0UWrXRbzF+p2e7ch+65MIEKB2L3rPZJOsQRPkCT8
	 a//4Mtvyjw7hynETJ9Ans95CqqZ61cE1kA1N974aBeeNwZ4l21ZZzWrUv1mxOliVzHmET
	 5OwEuDQorOuzrMU9UHvLy+Y1pI6Dy+Wgn3P0Q97zVl2TMr3XWvTPE8e0YiBOl21vVf3g9
	 CxUfB63ZgCj5zg1iVe3BVCCoWO7CpN3L2eMrM0El8RdP9puKd258jOSwMn06iHlpKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tdQo3wXxFHmeo7xPvpCJxlweZL30baHWhmpYu6iwYLU=;
	b=u1fgpJJg5qWeQi9fnwS+DGham33QSS+RbyMPqqkm1A/hTZ/U9HbgiyIkXjpZ69tLD/xg
	 vQrTVDPbGrnDN/QMhsYCVGBQQvHyJBAjMt53kwFysx96CtZN3tGhW+4HonUCY80bSV0tJ
	 X6hxPye4anT+FX0ia9oGqeoqcKDwDPHhUgqqEweLNBmcUjZgf81MweguwXs/23N/Z9i/w
	 pQ1Iky9wBnYJJddX6jVG6hleWhOHjTYvMyQvabwdQDlhDOW3xYlxNXg/8Q6OhUU7D3v/g
	 KYGjL2Qil+HPFVhKRh1uxc/lBH07ZUfQRfWp4ZSqZLdsiqVFHQpm9hrHZA98Oq8ixQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e0/at/yl";
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534960A3825
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C534960A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e0/at/yl
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b28d7c729fso1103231b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296674; x=1794901474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQo3wXxFHmeo7xPvpCJxlweZL30baHWhmpYu6iwYLU=;
        b=e0/at/ylVumg5FoFhOswwp5/qxP0F+mJlMQvVj2nQK9DbljdSw6PfWS4VrIc7qP0xT
         lVGmoToSsXjedN54Yj2JUpPoNiylUXwJ43+LiXeWPabCueTrpHVytsIHMBGi0lg87QoZ
         STQqsZNJZlDHd2YsXo6KYcwGqtjOaHV/H2N4wsUAdsPqATejuEXq4/0R2cPXK62K6Kym
         ijRnLHJ2oe/C4TYc5BaiDEaiyEtTgQp3G3A67KcO3jfxsz1D7Ug6oOPlL/Bt5mztrTJJ
         QJq24ga5voiYQBsyLKumQ8EdCPg+zs3H57Huqk99uh+zC7IcCwr7RGAx5l+7g5am7Wgg
         1GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296674; x=1794901474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQo3wXxFHmeo7xPvpCJxlweZL30baHWhmpYu6iwYLU=;
        b=H3YfNJ1Ka5j2wYrsFIG/jRkkGV6hOrgkGERI43/Ref2tZG5ZbEKNQ9ei116cynZ+cq
         5BEtDGSF988PizGvEUlhwvihhdhHjPDV+WzlkPnsopvFNkLKdQ2VFkSTro+tcREfphYp
         zYpTTYl1CGWqgUVq28stjjg9AHb+KuovJvlc4gWZjNYeN73y9n3jMjthtv3JkTiachYr
         httSkUWdQNNqB6YUgzOZTv0/Lpi9tbHZYaoVXDhy4WEO1yTiVyylpTZme5uZ1HrLmrFx
         tCItl0unRV+dZMf3Zo1WtpMICBQXk4vSG25xJAhlpo8UqsDsdGPaiIej59D8HfU1Fp6u
         Y8ig==
X-Forwarded-Encrypted: i=1; AL+hErFPgi8cEjJKfzARZ5dFWTAlzHKgosJPfpnoc3gQ5GZSGUUbUR3WXBHMbzWaKyAxyDYaqeA/ahZmyBWcSX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MBhxWaRd/vuac5PmFnoHgcHosNHZ5I+Rl0u0MQCcp4Os/PCQ/
	5z+Dhvkl6p+N+ikNBYZj1Hfq/cbcMcQWsIO6tvVzatF+H6PFtgX7lzhW
X-Gm-Gg: AYBFou3U5oSkPXxoQBaPLSBy5/OdjrcpmDFXsFBUfToepq5Xl39F/oJSdecryIAaCig
	69iBFCqh9sm9+NSwuJY/8zoxQ9s9RvTghZUGBGjDQFnKOVUy08yTvk2QoTQtx64rkujFbq1AGIb
	8fEG6GVNjevVZPDCMpOFYIG2TVucawy8Pmcym36S7FPB8RzLRzZnCJBfqfOjnNP3UGDeKzFBbZH
	cUGx/s1OSOqAPGLbyZMVVn7R9mXiUqPv9QtMRc1UCwpTIy2MZqCMMqDpwaEbjzjJa3MtnrPNNgW
	buagc6Eg+GXeTUv4PtfDIdNs+1AB+oxS4guqNr4jiJrR8YDrJKSJ4QmxyEkshm3CPpYET/AK8cT
	4j0YZJ55ldp9xtW6t3nW01MMg4/TdGaLOP2pZQXSa9zJ2kIVhS6UMVMXbUyKCe+tDlZZE1FbGwE
	WmJ1cX5yxLcwyDfZ6dhus27Wzoe1ifG70e1HDeKPioCiAuD6aP7DzN4mx4LHz8Z4Y0TOVmqhXsJ
	CwEVQGgYD5AD2nTcIX2TUbScD2OQj17WwUXTmuvmdiVwheXHt/0faUTve7Gyohg8DcEAATx3Yip
	LqyUM9F+olYbv33JOMsJyaeYEtAYWE0kSWZ5EMBkkxsno07JuHWMD02Qrvu2V+2Ki9edmxL+q0X
	RD86So1UkAI+e3Tdle3PkuuHXa5KSa5rkrXyK1oDuLHQ7p/jo5ddgYDr1uU/BOGBgBW/JjqMGMU
	2RSOpA2N82ZJuOzHxwcIriLXs6lFawKO7MOtiAtyJHRwCVQkIy8sQ=
X-Received: by 2002:a05:6808:c1ad:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5683cccbab8mr1414448b6e.36.1794296673663;
        Mon, 09 Nov 2026 23:44:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:15 -0700
Subject: [PATCH v2 12/58] mtd: rawnand: arasan: retain chips across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-12-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2

Keep chip metadata, BCH state and controller storage until the last MTD
reference is released. Unregister and disconnect the chips before
releasing chip-select GPIOs, so notifier I/O and active NAND operations
finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 57 ++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 865754737f5f..57b5d6119b70 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1269,6 +1269,11 @@ static const struct nand_controller_ops anfc_ops = {
 	.detach_chip = anfc_detach_chip,
 };
 
+static void anfc_chip_release(struct nand_chip *chip)
+{
+	kfree(to_anand(chip));
+}
+
 static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 {
 	struct anand *anand;
@@ -1276,7 +1281,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1289,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
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
@@ -1323,24 +1332,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
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
+	ret = nand_set_release(chip, anfc_chip_release);
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
@@ -1353,8 +1373,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1431,17 +1452,24 @@ static int anfc_parse_cs(struct arasan_nfc *nfc)
 	return 0;
 }
 
+static void anfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct arasan_nfc, controller));
+}
+
 static int anfc_probe(struct platform_device *pdev)
 {
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, anfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1509,12 @@ static void anfc_remove(struct platform_device *pdev)
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

