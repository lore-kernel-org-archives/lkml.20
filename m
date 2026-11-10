Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296704;
	b=Yjq1RwH8Ec0V3OLbxyn90qp0jU0UMAtc/5Gub94g25gPs1foStJ5+u1TNmx+R03nh52V
	 G6gcAJJQ4j89NW9vrtbMw2tyoY+geM2/R5OSyu6QhJfFazzOGMYRdwT9wCFCu6adxiY+E
	 +Xx4qxMkYwbTO+y+3YPhN0Uwx1pRCgezsjV4s7gxoBELxtz6UmSxssZOcVwZ2+XCH3vIm
	 mFqJSyMWgtxr1zOIlKLn+u6D9VcH1lebB0+npgt8JBeZmhOenpErgYW2sOfrJXYXuE05F
	 XqsRIOiyBpvsqUO6OAqdGqwgkNIxeK9q4N8PQyP+re23p7iSNjIEBwNKA1VG7KYv4dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
	b=SpG67QeYIk52sBPfpbBAQmlLXhX+2cAu4DbS5cpwS8aiXI+bseGyojOO2qjqa5xT9U2U
	 rTrsw3EReimVNRzH6YSHbsQ/5/lb7ZEF/t6Jz7jzOsiaxGyw5Acer9pqjTl0Pc/xOqCQC
	 uox9Zh+OtsXAiJXsjEsBVOczlUj0mavlyzHX+HyOccfXhowAvaOiDsLse+KTGGG5R5WGO
	 hw2R1Yn20djDs6is6+WHFzudVfm3DWtOaoIgzH9IRA0y3h2diHIszbqtUc3kPojPg8WUp
	 tYNXoo4X92rcmd02Md1pZ/IJZrAFh5vE+wFUfViI2G4MjjbgETOFOdlVb9T7HokBtyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeB+akYX;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1934F60A262F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1934F60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeB+akYX
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53dda625f63so1140846b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296703; x=1794901503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
        b=oeB+akYXNxQ4v9UIpCPwYz8xHPFGWc+kV6z+a0CbfH1VwKQBlwyjufSW8E9qUDX98C
         avHIYxydc6+ZBcQ/Y9kq19pantBD60NoMwIsBWWGDBHX29IR1GiC4uJfk7+oOGagO5s6
         U4JACAcizsY1eNycNSb1VrZCV3Wt1PgYTX1sWAZrszCSe+VtpKw3/BmLbZiC3SeY+3iG
         iBrh7m8yy4Zpp0N+/ZPa0BjXcMsCwgEYa5FHE47bBZoIslwsvoD4MhcWVXjDecBI1zQQ
         RkCML7OpAPIwLRwhUs5G+XR+rTY4FqtelRX2qVc3NWfv4UCdIwVygt1dcd0v1Y818SYN
         6mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296703; x=1794901503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLZfvDioLp/vY/9zYDjLGVC8TxAnz3Z/4xHRKH8AmZg=;
        b=tdkkf02JW4HUopePZV0msmDHBdyc8P4L2RaS7QVWE7hFEQg7a7nn9WSEWZhEy98emc
         l6aIOiLE8kICKxjp+m8IKjOH6HRzMCzWRMy2H0vUQU5Znc2B2c2nLohNLFwpYsrIx8yo
         SWZC7I3JcXYZlGmIMwwsncneJiYrqUFl2DT5/DZSLve3DzslvI4sA2ZbU2Z8M+HI0DO2
         IjroAwrw95PZnl/Zw2M7t25TKsBIkwc/edzeLfqoNzaqzPQxPUY8YPH84Ng3iQe7Xhs9
         6QBGNXyXa08nVhm7jFBqgEu3R93KzdBDafbGwkhCeIKAzinmtizAKIgXHYkKttYM3yFn
         ceSg==
X-Forwarded-Encrypted: i=1; AL+hErHWFez09seTRAKm0O+0EGhLavI5p3dRwoh/OvNIGomm8os6LlqZIJiAtxunVsTXZy9GarcW041CE7z9WpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8gTuOB48AMzs2mXyIUOzeIqsxcNEP+NbL4Sve4yMiEN/PRR3x
	g/u455AcF2ax++NXYNeS+ErSLWgC9B7dWK4ogB7l5IsGNirENaKaJSLHa/H2Oogi
X-Gm-Gg: AYBFou3sKCruQj9OnvZ8uEPoRXm8/xoV9cKk2C9rXF/k0YXDSn84+obdtL709lAnoHI
	Rv1PFYeW/VW9LS49i27WCyNgBdxPwDu+OtiDkTVdkeaZc9TykQ7++1jRB296DvT1cIh49Mw2Fnh
	vsZeOtAT6leKYeImztEqIfu2euSGKENIAu4cava8Io3WYZ17byUynQD2Y4vIRvwGevldDYDSp5G
	Nj4cKhVRDUKiCT8JYkSHtYpcTsZPLco55jhzqukRHgqX3mLQeQ1HbS+t8l+84jbz9VKjKcuz1R0
	NBK7jzdz6eupxCQlSyvcWS+n12Ju3KfpHv6NUUKhsJ9VZl/M2MCRzDJWx4zmowiZ9ZLgNB6eFnN
	3EtvM09TKYzjK+IX40Xej+olc0U8Ohu97rostPmawK6SzegqGQIcif8M/ar7JiRsHi+GTi1YqUd
	aKpEqNc+xM1OkMnnmz/2Ok6VwEjK+CARaVcuq+nuLUERPnuRIadaIwpUWcPw5bBgRd/Ea6r2sNY
	DsKfgwqSXScicJzDJCMI+uSE63r5OU4BkLcuV+qxcjyNkDDodWu1LfbgMGrSOpQ7cZG6H5MrLgr
	3fRVfBK7p31NFklj0VfeSP7g1rb3MPmgOPx+iBkYsclkhuUqF7TBHsKGTZDq8WtiNpifYqp77qR
	IgMmj39dPd5TB+zP1OMXwAE1DyHiGPcvXyxRIsgdezSqaw8+DlHobMzfoOifagvHIAuZeBOfI35
	7hoIy4vb/ZK6Fi9JK9B/P43ucD/1k/EYaQnEDEO3QfpZ41CuFal9Qh
X-Received: by 2002:a05:6808:e85:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-5683cc8615cmr1404944b6e.29.1794296702875;
        Mon, 09 Nov 2026 23:45:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:41 -0700
Subject: [PATCH v2 38/58] mtd: rawnand: cadence: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-38-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Allocate the final shared buffer before publishing any chip.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 60 +++++++++++++++++++-------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index d53b35a8b3cb..65c4eab600af 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -2991,6 +2992,11 @@ static const struct nand_controller_ops cadence_nand_controller_ops = {
 	.setup_interface = cadence_nand_setup_interface,
 };
 
+static void cadence_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(to_cdns_nand_chip(chip));
+}
+
 static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 				  struct device_node *np)
 {
@@ -3007,9 +3013,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3028,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3065,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, cadence_nand_chip_release);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3091,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3138,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3193,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3212,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3260,6 +3279,11 @@ static const struct of_device_id cadence_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, cadence_nand_dt_ids);
 
+static void cadence_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cadence_nand_dt, cdns_ctrl.controller));
+}
+
 static int cadence_nand_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *res;
@@ -3275,11 +3299,15 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller,
+					cadence_nand_release);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0

