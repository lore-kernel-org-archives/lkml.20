Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593773;
	b=CerK978c7EjuuWYHY62AUaRGuTh8Yd19bQDqhyvGN0ki1CoCn0nSYZEqmADLcr/WKw2m
	 ZsZ9nCYA2ziG2GIT3lSYlBPzQK0fTFk0nB95FCudZemHDHMGuLoaA3IFVjSa0AyTM/yZ1
	 04McSRFIDXmJw12wq7qJnPfohrl/gfEdINQ766zJuQFURT08pfkRl1Xbn27YyCidW5fci
	 M5ktqPTTBs5nkHCINT8v+jYhW9POHS4DkLNBUICxOc5xeX4lnG6z58BfOtskjiR+7HO8T
	 3S1aeE2jdkbi9foaQvOXO+NFIP4FKX1qryYGVJGTHUoRTepqGDRuik34t+3Vad8HQKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
	b=JDIFt8kTwHAVvlbkaz3nEyhxeb8I21oYxxqGgWSza+xrHoc+QCrlhFpivmLKkGIt6CYH
	 zvnERfKdmT2cqoYJHuxMTRv3jIxCUOUfcKTTNDhCjka30QOOcRfYMyCCN6piVBREsusql
	 1r2NmpnOWNWbT05blI7/yFDSm74znwlLKZII6ECcnRymW5X033OFarDBHXkD+PU9xZ7wv
	 P1NLSeIUT1yEvCPhcmij75ZzowQ2D8YDAW1oLEpoeYd/7pviB9zbG83k/MDgGvM2Fhskf
	 gAmp8828AcQD2aeOiDmDqCRIXyux4FiKSiOPEaG7CKvxNs8vqUoE/+tSpthwp0eCd9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dIo/4x5Q";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F8606B215
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0F8606B215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIo/4x5Q
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8479f46ecd8so449096a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593772; x=1795198572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=dIo/4x5QGESMn1OQMbIcQ7fPqupbAzBbPZsV8wpa8kNZNa/t3rEo1dgNIUvPtemEyN
         SyYKrsulXimdtMCoL8v74WenP0N8nCrDfvo4MSayllXFv8XG2EBj0cS7harTLzhtqJZk
         3TEmYPunjdU5ZU1QckvWVVF2RIgoAqaZjOSZnKjT4dUWXSX+95PCTHWfDxES6wrJhZxv
         Rx5BuZ6d4hY+//CB3H5SpBaJfF5sPrEKr5qizzcK53zHvYA2gB+/WJP4nANwd3T6D9br
         ZhO1+x7BzDtIGivpLKrFTA/AR7L4lMBk4ebdQ+5d9yhcgI8puu3qYc8Vg98SZo9aJ9WT
         IrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593772; x=1795198572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=OiFmGJH1Jbtbljx66SyiRyFvHwhg/AA5RHUXiF5CMSvimPPqWU4e42pPFkvutopodr
         5xiCNFGA5vv8H+o/cmazua7n4yVQ+0UpFEnaFQSvu6fPOERJvPFY8MbiziE+vwa2AYJU
         jDk7sxeTvZkgrjBy36edTuZccNe66Orp2AaZ+JDm/+WZjvi0cNbyOo5EdeMeLZVSo3Rx
         pZnBagOtMBju1wht8R+okEEOgeRGADJK7Pqx0D37eNb8jW2BuCAOD0IiwSG3d7fuXvoD
         iPgVkngXB0Y3oEBjMSFBSgYvs4eUJ6wwByL24hkRsfSqfHsfszPe9WxHHPtzXrCfmiXz
         5P4g==
X-Forwarded-Encrypted: i=1; AL+hErHkUT87fN3pkSEWOchvPxOCPuB2kL47aBhvAwIHDoI5dl4Z8y6d3ClyEFSC5TYTxkkbUqZCgYe8ws+ASiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NUGWL16XNS3+vo7CExhmYwihFrE9x+gDCVzTivKoXWifZZq3f
	eIgyU3dwf3Op+Heni2UZu/RFRJMNUn5r75Cszadzlj1f7ED2Aqk2aQHslg/6t/Jf
X-Gm-Gg: AYBFou2SNhvNQGkDje8wyVzuZH/EV1ICpTEWeN9E5ouIFkHn8Gy7ePbtXvTi8Q5Sh38
	ZVQlfrseRaN85VbDv8rMg19MFFrYVQNoAQxDjMMQHnh4XT3BehOoJ5G6pdtHqwYoLYi7UqrMpyj
	An1YTimynGXQakoFrQIU4SeDanVhR1hzXRbWnhWq0Adtnh7tPKO9YPgURAcGDfUD/te6V/WRjuE
	14lXum2OjDPOuDTz0p+bi6NS+RY3TgSJ15fzFj9QcGQxZhJVIjxmj58WWPVvK5qOjKY5Oa7UZCj
	Gy3gCwQHVlIISW8b0MaAgsksPC1sUNakqyUWAMZS89bBVCETbLBRDnkeBgS3vAFH5UPfZSUEqv0
	Wy9hA1HvFwwA90ECNt07rSz+PmPi5kO3iEO89rVwAbh4kgSabaAs7aNL4Fnf/8bhnfozodlIf1P
	PAoxcKlJpyjyDYMOlm7CsicJkv0gwTY9LRYuuaMk7F/ZXqoy0vzimyA43Off5CXjsIlRtLwbUvn
	Rj68VCfbYWdGLzr86lRH82dtKffBtdJCij4V2AFDqh9WlNzIeEqt6OQG2Q2jQPdaRnK9PzLViSu
	MUJROkikjKZY6Z/vZZplals4QO+63/ZvDcfQWrWHDwE5UgIW6jX8rok0KSnSjYuWNhyqsL799z1
	+OBbhK34JZA/TWjsr95QhPcGGnSYLvfW/OWNFsMdmlBoA5+VNN0+QoK7mzg84Bt4K74RlCR7KYK
	YKxSxBGNef01CIqyAxLst+pqaQZAPP4RqBkeHyZyMeZ3vwcqHZA1MR55k+lEDhf4hfwWgvjPGZ
X-Received: by 2002:a05:6830:44a7:b0:821:a094:b26d with SMTP id 46e09a7af769-862898f49f0mr2869747a34.13.1794593771578;
        Fri, 13 Nov 2026 10:16:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:51 -0700
Subject: [PATCH v4 35/58] mtd: rawnand: marvell: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-35-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the layout metadata used by OOB queries and unlink before put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 44 ++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 56350209f7e0..7bd5537d6b62 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2630,9 +2630,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2652,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
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
@@ -2688,7 +2688,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2703,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
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
@@ -2737,9 +2739,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct marvell_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2754,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
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
@@ -2766,8 +2778,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2939,13 +2952,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

