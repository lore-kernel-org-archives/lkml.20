Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810630;
	b=xdiSC5iRs5XCZGwGogvp3+Ixz52xZXLBfYARv89nkd3j8arckgJPk0L4neCa8IiMmOhx
	 /hJn6WDjFEnXECjHuwoyVlR+dBfEJut6rjJowmBD9sCUh8qfPWNbZA9f/MfPRpcGrD5Wr
	 WfbDI1tbewG6hL+a53KwUuhcliMjLL0k2Ux8QIrDdbg1KVGtre7hE69cYwtbirHTU1V6T
	 g+S1/HAXUdcHMuJY1IenpkLSORJWJVyZyu0LE4XhABWnNUEK9LreompdRd3kUuvztVAcY
	 hcYgyw/S1TBy8RHkGCH7ou4S9XBvujE2IFtPgtu+Kpczkxsl6/PSySWh/z01+/1C+pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
	b=TA+jxeHz9Xze92sAuAkColSgx8W0f8mFFMGGdKm+HHejVzG2IQV1xprY3a3URTzbBosd
	 K/Ah4JKqaZ9mUVRqHEbuqJDi2bz9WzRjfIpWvBwT1hv2xjUHWtUz1ZdYzRv/zmGUU4Mi6
	 VcS3G/5xLmW/EQeuzfFQKhmFbQnQwxByvjGR8eYEd1YAdfMzObqqmYuGLkB1p6C1aN4OY
	 px18A/+TrWdj0TIHmuxeIcR6V+PfsYbtRmn4bOX3LLLSX1Dub6kYewTbZIOzBUIoEKBWw
	 7fBV+c1UCHcis6P23idZSp53QWo3kBHENK9Rz884VX9yBtXIAzk/eHs5IDILHPvak0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMlMOFJs;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7CB606C49F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD7CB606C49F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMlMOFJs
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-703be215729so982992eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810629; x=1795415429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=hMlMOFJsRtIWgoFrwEE5gGeUuKWSy480EETb7i8E546Ig+nmBUGbVe5lsABCjLvUN8
         mWDcFoWQznG6NmfsrQtB8aekA0V7PFSRlrTRQBbTQQEdfUHIGD/grPFhXqJdSbIUdvxv
         +0yi/dNTzHsIqx8N47Q6KURdEqP9Sknt7G3CiJVp3WbssH2pFBq9sg6RKI5Tuu7yf4oD
         aSabqMkaIpH2dVjERHY7PLQOoFUxXxXxuQoCXrhD5IZ14ILalP5vj9KK6KG9pK5e4L5i
         XEkToOro1aVeCWbtXbNHMUULw37eViu9HbzHkuQUxMXlC7k3fW4lzs2IqSU1yGoQd+lK
         8jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810629; x=1795415429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mPUHEVu65L+xu4Mh38b6InONgI5Ier43hx3eUD05eE=;
        b=PiAo3X+C8KsKNkLCO7QMgWxK1YQkY6VgA4jh/KOrdxNsWsixe6wO70I0BIwlP/7bd7
         Hcy6R8QWwJc4FJ1q/H9+MM+vfqdnKuXnOd/xoXyM+qmuwLq4g7AzlCtySxzuaSwNo3dY
         pJZuDYqLg63SVc9ICxFs656V4+1we3QG4wQUjI1bYzClsMIIOK251MYLHqnMF/Eb4SfK
         KtSAZ3dd8mKfRHAvlT2/uMTpNcAHQh8J1Z6YMkyPzAjFM+TIq+rE4KN9GfdaH0Iu1KwK
         WsqCnkaZq0rWt08D8lIC9mcx9d99UTdmFNherjNtm1Lkdu/f+C4Z2Q2oyNM5X1NyzItc
         6s1A==
X-Forwarded-Encrypted: i=1; AL+hErF2cz/N4m4gTzmlI0ee4/r+FwiuV1hQFZiwJuM/vjQAYEUxfhTnNiDuCf0tyGxSV3d/+QFAF92Ie97D8f4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VNyzCrX1hdsIqpqKvk7H5jsc+XiAZu+mfaaLkDxQ7JqduIAvc
	dI+OBqhahc3Lxg3KDwHJ96mFwtabMoYDqAjLAeBVTkH7e+7t6olN/slY
X-Gm-Gg: AYBFou3ClCVbuwug9Z8bgvnC1PYKhr1LDJfdOix4EgelV3I89aSvps1rj6OKYz8guuw
	ogDwZA5jkGUxRFwg3P11UPGLGw+qvquyH0Yoq8ALMmfK2ttreBd4IkPM6O7l+Y+wUJXxdzrmpl4
	RJb96cX9lx3I346PRYYmxh3aPYG8+Gl3mXoYtTy0mPojHBhm1ItSP/n5BhzfUg7VuiIJUTyOw5J
	I74ynEFMYDY6B6KblgxwCmtnCyL9xVlRxUTwmeyV1EM2uQMVo9O+E3PawqYnIEi8kjmY8Xio6jh
	FwTRCGgZDJ/wRZhZvgLl8EyHmBcBoAkR+JYf1VEG1yT6Mu451eFlMBtvqej31awql/y02sTF4go
	PJF3GBBKQ55HxnvddE55rDethBCj1JRJDldFS+gFqMpy7TJgjCkysK91FesmTDM0A+oPAbxtgeD
	dG068OCdzy13ljUmARkkU3438hyHo9VMuYusk3nDYfDfjwIe8zIGqpBUJARElXhHwDJwhQXJhGb
	G2XvzPQ68AobHbuBbKWRMY73zwXW1dJyQcKLlfDv41/fHPkIqM/A7MyQ/UeESUlqc60yT6HBKtG
	+5DyUxnwxGWRi2j3r/VbL35IpdWqI6R2siNGEqE7rOVZbv8k0po9aV2CGaSJQoTM1gjWmoKxPfE
	DHKanPfJURdfLTYolzs5I4H7jePhfDMQherZXHknfqTbjo9xwUFvCLSr97xVTLaRm6FmIhr5mHH
	416WS/+B+W+D7Z4MjW9lTxe3syCOOSoO7VCFRz4AT1iVQXGmc8LWM5
X-Received: by 2002:a05:6820:1353:b0:71a:e96b:d510 with SMTP id 006d021491bc7-71ae96bdd7dmr2063803eaf.23.1794810628588;
        Sun, 15 Nov 2026 22:30:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:50 -0700
Subject: [PATCH v5 35/58] mtd: rawnand: marvell: retain open-handle state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-35-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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

