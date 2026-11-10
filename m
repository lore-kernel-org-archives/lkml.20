Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296700;
	b=VmfToGhdVC/OaroZxYl8BkTYqe+Xf/1vB49RknOPToaGNwUCkP9MNIst1s5LU5U4pEZK
	 0UXwPoKbryHdFhT8xH9WDH2FWm9+bEbYgmB1+kEZW90vxPJOA3HnCfnePVWJLLUi5RKJ3
	 qff5Lvcv9Ms4XxAkAM/yQffsU+OEeuh/AIyNugJHHq2oMFHGrSt5irJg6gzSWJ+ebBLlU
	 z7D+hZfvMd5sDDz2YzsE0gNDrxOcUxmdJ4Nn8JujsVEUCLJIm6FXyX9nTJbSNt0wM3GM9
	 Jz1QBCkR2pEWtOG5LClZN3zgQo2ih2EsYFyGhG6qZX6cyCcY7kXB4dswuxWEOPzDdQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
	b=qHGYMbdnDNuop80rph1RTHoz6O+iA0mBHsxN4CkNBQ3CR1c/BrhW71uHMwoNbWu4R6Yw
	 H7fImh1KdVCNVmaZGhz9Kq8+r6rvxbsiC37U74SLBq4jAZvTK5SkoFCY2RvZ8WN4U6/dh
	 OvIR9iDfvF6cLiyDLObIQb+QNZEdu/2USNQ2CxksLJzGr926nXDHV3DuwsRCKLt/WGQLr
	 FZ3ABOOpd7xhe6ghZgr3yerUkEEq0nAYqbS/+2vaHXTATIBWiB4udSJK2tjLV+uHTQOKn
	 NSYnfS3FS6MQRo0f/G+gwzpkAklgcjObTepWvftW9pnN8pXabEl7tGH2rmOlhn0UtAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnQemCOs;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4536606DF1B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4536606DF1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnQemCOs
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4e4a4d77e5bso997314b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296699; x=1794901499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
        b=gnQemCOsvekxvALR+ruSLj0VZFgzvd0PRu7ejBWlfihjCJ5FTgvjAKZBrXctyjNKAf
         TM0ILfdmKeP4qrZUE+j2BwU4PkbuVy5f/Ja0RiCa6FKTCp/VcJIMDYfvV0xTwxwcf42F
         z5TOlgc+XvVYooJPLPTatKbqDT3THnMvaw0r2j8hCqQeeMNOLE+j+bmVZuF/GKPsphWJ
         68YpJzz5u2Doj2Sw8tqMWhAWyRiaK5AtucwM1VWeP6B3mHpP05ZfcoJZINb8b3t/O7HZ
         FSzAKPkBQoPc/bimqQT8XAvFtOcB1a2mRH1mRmj+ffSJfg7IfZvfFA8ENsAa9hlbekvQ
         dmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296699; x=1794901499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
        b=r9GRlFGYDDTlZV3mdw8yJf5NIeQCih1ZW8rmIbFDjfTHZg2XvsBNlXQatRUFwBiEGi
         T3bB3AClIM3MrVJj84LzZnCJmY6PHJ/XK89aCfYktOCuFPV+a47jAq84i0RMV3dFh1qT
         Uf0QUwA5A7cEA/6UZdjCqeOk3ueS/WJbitf8iaRJp6Q3H3srY0BGL/PnLIl9g4OPOFzH
         9QjVlJ/MEO2XNryt9xyUmwJ7bfdEyZxIy0qqkE/R5iQ85JxzBL5TsOPHSxzyGEs/SxzF
         17bsFYwvi5lxK16ZBx2D8O9xbpAjOyy55vui3camclyVKu/InU8MzfLSj8Xkdb1N8NJ9
         vcyw==
X-Forwarded-Encrypted: i=1; AL+hErGbMGclYyQI2oyxbWP0HjveLtfsuDQWNOtndAD/UNQTz5kYbj4CCmg2uzMj3aXuhAN0blQC4r/25dnkKho=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NkM6QGnPCvBoAsBhvkEpDLyuw199SzLDsO97GTqdaounT4jWs
	Pwv2pgsB5C6RqNsQNjQCENgSqFm4gO7XD7YRTuN7b0X3U3ZEEZ+vQ8CMdhWxLwgX
X-Gm-Gg: AYBFou0prN+hTyTWsWd6+k5FCTJXG93h4Rg4z+pX/be2+apsyvCR8ff8un3ZW2UuzY8
	9CPoXCgN4hvSMW6nibvH4pToZrnv/uI21+QTL2FWmZrdfMaF5j54seEstEvQTFe9tnwLqGfv9Xf
	rsuld9e32gcvEmDDNxqoURU9een9U85zxQae4uG+Ucha8Pj4CP/W+7gL7KaVELvz2OdI2x1cugu
	R0eeGLABisl9evcRy2MhRVKobI0MPzHouG1ZXS2O452tuV32slQoxkWaj8ClYg84njwXFkedRoS
	GAUUnfCoVROU1MO76kFH5ZmdBXoD7o9p9wld3hmoTPJeQ/JoAFEgGXiBsuaYA4b8JhFsFOqUWMo
	O2B80WflKIpf9dUaZJ5RoDM0WKF2IkstzveOcKaOhU/bzByA8Sq3zSdm2fzkkhcHzeaclgQpAF+
	EVSdQLAXutcp9wwsC8E/8lWlvaf7O/hqZotHClxpb8AeXYpf+EABSOl2d9G7WrHzPpibUXMRP4b
	LXIo3M4fcXkf7je0kHwZH/8UtCKHifYSW5lFCg9oDnSviTM8BQ6dzNBN5QSsapwlZbHEqTnHBnI
	FHxPGMxkC+02Eu7VyEnTDoQekMuysCnQ3x9VcrSo1aXzY92w+k1GPFxpbeb4wWpyOlrZSh/2hUH
	PHO5nEyqjA+I/xuhk6BagCc4iXjAxr0gLB+Uw/C+BHuYZumKvlA0RoSNTG/mmfD1rWjEaHTFZS/
	CavZnbiAO0Y7dP+vXaL0fi8dbDwJExu1uwqQhnbzsz28l3+szoPXR6X4QHGx10xfkRJAstS1G7Y
	w==
X-Received: by 2002:a05:6808:23c7:b0:564:3072:3830 with SMTP id 5614622812f47-56881290b71mr784466b6e.8.1794296698788;
        Mon, 09 Nov 2026 23:44:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:38 -0700
Subject: [PATCH v2 35/58] mtd: rawnand: marvell: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-35-9137d08f05df@gmail.com>
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

Retain the layout metadata used by OOB queries and unlink before put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b992c..f3967024411c 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2600,6 +2600,11 @@ static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.setup_interface = marvell_nfc_setup_interface,
 };
 
+static void marvell_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct marvell_nand_chip, chip));
+}
+
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				  struct device_node *np)
 {
@@ -2630,9 +2635,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2657,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			if (ret) {
 				dev_err(dev, "could not retrieve reg property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (cs >= nfc->caps->max_cs_nb) {
 			dev_err(dev, "invalid reg value: %u (max CS = %d)\n",
 				cs, nfc->caps->max_cs_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -2688,7 +2693,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2708,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				dev_err(dev,
 					"could not retrieve RB property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (rb >= nfc->caps->max_rb_nb) {
 			dev_err(dev, "invalid reg value: %u (max RB = %d)\n",
 				rb, nfc->caps->max_rb_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		marvell_nand->sels[i].rb = rb;
@@ -2737,9 +2744,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, marvell_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2759,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&marvell_nand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(marvell_nand);
+	return ret;
 }
 
 static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
@@ -2766,8 +2783,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2932,6 +2950,11 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 	return 0;
 }
 
+static void marvell_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct marvell_nfc, controller));
+}
+
 static int marvell_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2939,13 +2962,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, marvell_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

