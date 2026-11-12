Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446953;
	b=PJ8Z3k/WeN/NcoSoqvPNydaY8dI9VAzdEujDqOMtQ3M85fUs+zHcvFdUsh1mtzgAsba+
	 DEoq5I3rSEBqhdtNpAmCzrrvq2LNCYtg0/Ko2HfiopsRABLuGXJkBeqvGXPHXfubEAlpR
	 3nIkxOf8mZQYrEY+QJuyxSMqri04sr8DDHVM0hsW0uHXc7klD6v+qOUtu/6hxLO2Gr5LQ
	 fNL8gIxQ5vwuM3+c/aCM5mndxYir3FxuPpB/iYpZY/FZ2+JfCt1oy+8sF7otGdh/iWvWk
	 w8qs9XtzRwW/IOhi9MyWpjtGN7Q8nyBe4Uu6QLvZhUs+w3GYJW5R7wd/aQrUjjUYjgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
	b=MhGEbSEd3iADy+0Q3Kz3545kO40qYKLkHNaZsQpdidk10iPOUAus1vkCvNh44wfgz/js
	 Qt44K5gbHqD4IobDwX1bXJS1G7mLmjvOfnuTnAeAQJpmmN2tddKNz3QUFxjlOKg07Aw9Z
	 vlFYaBljYsbbrgJ2d4g66yn1M2M8QIz31tvp3/bYWlXRHPxH3y8/zCDueT6WoYOvbyb0t
	 KKbfao296/2ABdLHfYvBJuO44gLchSF1L+GhPz89xITodduaRbTwgx4AoYL9k2xQgkBZG
	 GRwDvUpQCKZ6EvJO4X2X53+DI6tPvnDUkigDLB16CF/DQ2KFO9ODKa61KgdFRRIITOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjWgZyXY;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D555606AD6B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D555606AD6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjWgZyXY
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8253bc5a613so2070512a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446952; x=1795051752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=RjWgZyXYKS8bTW2FAXgkFXm2x/yzhnF6K8sxF4/FXg4sNMV5BEEQ2/ZZI5Vaznd1xP
         3dXPF/iX2lSEBclXLvcbzXTGcFGxBQKV47SitG6X50wapdvY1oZYDzgOBI6ZZx6fivdL
         e3euKmztbyJY8x1Y3pSAf9K+hZ7baYGB7Cjrpg/FbItLq3ZhUOJaZ5kBYo/KhqQZ9/9K
         RJA0GGNhoK1uE+Cu53DIs2OcbO12kEt0pNxhU5/HzmluyLqsZ2ze6q4YMvIkOcyjDSoE
         XmoFgYYgiPap4uMWTi5BJ3VZaidMvZgt4F6G7zmQBy/QncHK9e7Mws0Vpbta4losNWLh
         ihDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446952; x=1795051752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=TS9ym9tsZXPFptR3hIOeke3QyfpOoI+KKazkAKiL8r1CGOo/lW0dASODdRtY7EsTsX
         G9so+nl1S/mqrYDljVLdImvWBjad/nek/K0XUFZoprgA2epJG+jNLE62lsdv0Vqk1PdV
         xcelPO18ac5ScGpApbKAlQZe/S+hcoSR1BtymhWFvEIfvCJVGHukemVp08OXeNrCi9cO
         pdBdI6VMTiblyP/2oHyqL0qEedRPB9cKE8GoH9BQuJEc/5M81XTsDFJ0PYjvrnn0Lb6a
         TXb8DYrV/kLBTQPT5NfOUnG+Y4I96GoNZ4ku6Jce8LenY9/k5gjGoumOjQG762PUrjJE
         weUg==
X-Forwarded-Encrypted: i=1; AL+hErFeKAqu6iLzV2m/nhjZmKYz0/fgcwPjALXYBwXDN/guERoTMIIMRzPEuszdWQC9huCFw1RP/rbFd2rO9is=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BG8CZbVVBZC0u3IaQvYhJqEpLpZD8Qg3dIWz/FjwN9nfKJYrb
	3q//yQfHoyaEv56lFDw4fSwNfXI1644exZRFZQ2yztu02JZhUMbkm+D6
X-Gm-Gg: AYBFou2XZB6eFdsaUQKV2G3g8aAXchPv6ED1rgbp+iHoFM5/pYIwrXgBos8AKboRsxW
	NcbexvzumCWM0A5XyKYLL6mYqwsLOuUap7BHMa/RMRGJpLUYcC4jeaIpjyMEUvN9tzlPxJ3wyBD
	aQvi+5Y0KmJmBF8Fa2LeIpLHmD4hAbIfCyemJ8uzcD8m0jhW4nZEYCzkZsl3J8f4XYOtm6HBwYh
	2gNAJMNH1r7QIz3vbfgmUxzWDiXCtvZa6hnf5xwFEKbS/1o/ExZuwpRh1Im8s6/8omeiRQFRgI4
	LK9izwFrj96mc87l+SAvPbygk4QF2HaRoDuCqbzRHwZa9bMMG5GVk3IlPdAy/E+HH87aj8jtuQR
	z4febyHZHoXYfJeqIyGx1OeXlgyH6W4bnEiJA9gpFgYjtA4tqRz0oZ45JfwE/COqCYBT9Gr0ADQ
	pQaPUEMFvndnJY/QSsv12dqH4tofP/DqxU57YlOKk64UBXu4Z88D7ehs3xxEIIyYnVcGKomE2Vm
	oCa+RiOZHSHevn9BEb5+TsQSmKmtWRfZr+LETh3zDn8G2IIRGtdc6TQzOFwC7N1d1s3+I/2+Goc
	U19Pn1iyzoWzYS8YG1PMXH0Q0G2rep39wlzw069D+RkPPza6aETfHGAobJlCAXqBSvMvfxAgwK1
	9X3uAsSuf+wi55gt/Bj+DKF8L9JkrD3bj0Do/io4gqH9JN+gqrcYAVMmnZEnU+EOgLJbWTvwcoh
	iCmZQqm2oTX1zonUwtwCWnFjIDOG+ZjgZwkKoLVshj6zZN0wmbMkNa
X-Received: by 2002:a05:6809:1c3:20b0:56c:c450:7a6f with SMTP id 5614622812f47-56cc4507d07mr1272582b6e.21.1794446947345;
        Wed, 11 Nov 2026 17:29:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:14 -0700
Subject: [PATCH v3 35/58] mtd: rawnand: marvell: retain open-handle state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-35-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

