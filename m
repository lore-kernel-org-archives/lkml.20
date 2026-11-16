Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810597;
	b=5TGOTU7nYmdyokybRIj2sj4AWQRp0BExS3WfR2EuZ/2fs0XmTIx5SBW7O4swQByL5eiK
	 +s8xksR1cUkA7H0gCWWt1y43esLkjx7d9QgrLDWApr1jep4b5sLYwsx0tdOxkwvmFFMHg
	 hunDIzGxFczu82Dg7gtkrjQ0yQNjYhLADF+kGV7P7bJlvlv+ogSGF0DPjBr7Je2RiCCrQ
	 Yq7sb9GDiIELQoOXisbQ0Vdq8zMUTkSBVL7rK4BngSJQb6ynNTyk57zVsG5c1KiDf9mAS
	 B7I2Sxwd9NSr40hJPzpJfewJN8EWDxoWiKXXB7hL+MjPFd13gQpgz1wQ2or3G64m2tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
	b=aYuSVa60Dnkw4O8kRARso6lLuvapHLaRAtGDa0WrGtuuZE7VCIC2s8DkQAW9G5twKaAH
	 cw9T9s/VYCMK5QBsgmaaG9B+cY7h7eP6fY4Mcn/lObrI7xfmjayR78ozddDiSO+qztFHO
	 EKPhL04MFaVH9iD1fa/B9AKqb32xCfyAt3W1EiG6U4+2pExep72UL/dpX8rkXZvrKFR/S
	 b1jhiSx+wqL/KD24HrSYciexbKXbyy1qAl7bpdhcILzyHp4WAn7oTn0L3fpd/x4+jYmi/
	 zyuyCO94OlJUgvSjd/xXvHPQ8X0s7rgASxUhOaas05vZqGAnW0ou0rbEMxtd4rPbI2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rskJ2nSp;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE660A2608
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEE660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rskJ2nSp
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716c0217635so4204043eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810596; x=1795415396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=rskJ2nSp20EgLeh44aQ8UDBu35j4PZo7C594/zu5Uo8PMk9Na84NZCWdS5N+AVH/pa
         9KjvKL4ddu0CAcwOubtfDK0Htg1kzjA/We62AcF1y4xlP+MciVLkN/2qZAAQKadKsV+j
         t5x6puQOOyETjJeH5Q92JuigoS8E1u845jGl25aOnd7y0DpXFtGJOJ5hhqyU/0mcwue0
         B+cl4ZUwSsJRf1Nngyws7BYUw17/gJfa7fDOBW02CL88hz2zBQGcL57uIEbLs1/qOBqI
         BxEcBinbzXd2vbtdmkzPYnA6JD/xYVui4CKxaG2zb8fdJZ97hOS9ObxROvIqW5P8DAQN
         6Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810596; x=1795415396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=jVNp6uAUbdYzsuCluo/jiunRdwoWS40i6kw81UQEHUmh14LmaCPuGYxyDEnON6iqtW
         0lOgcVHC/MLoKdSl8eTu00mhHw9ksg3O2cy2wGLK/o3me80p+UV6Liya4MeYl1gYb0tm
         /58FNtdg0Tyb8Ya52F/9Wd+KAwqmZI8fGnC3jsqqYvM7Oj4zprLrDRNT9fWK4Q6IvRHq
         BoRA/PKGMAmKeblLdqTyEeCLypk6+7OKE8Spo0xC+Ua/O6gOsCYDZoFyczYO7GN1B/fu
         9FBMK/AkLM7nJrplRrWpPEjUGuadYKSq6KGaXOGEs3mNHouOpVOzKTXfgDI86/8TMG74
         zkzw==
X-Forwarded-Encrypted: i=1; AL+hErGQkkMmiYqTtlbpuH9jMn4TNOo93J+rXVZHvUKh6H2tD4NUjXxU7BrsirHBFRXKf+npaGJOBZ2qYIA/tOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TxINcAKPWVS3MvClJaoCj0v9NHsrhNw6aSP5UUK8o7CEYdvfh
	vaEbM/H5WVs0tj6fcS+F2/WN8290y/v7dzndDbE/e+d4vizS4KFdoNRk
X-Gm-Gg: AYBFou3zK1H+tR34x9GAeiuJ4bSgDWktl6JM217k8hGSfqsiuscBnTef4YAlpdpk3gn
	WZrWm4JBfy5GYV2BJgWk7r/kzsdi9LmQwVwjkmTpp4J1lv0Vki52dbHY7EyEbkseCCbUB9DiAP3
	ISLzHpCK2y4kbF0sbRmTs0yl0hLiHaDdmQcAOK9VUrAwehg6Jsh23B78P5Vz42qq/1S3Bv/byGw
	y+Fl1I+rNdC14J2+wHInTHE8lmH9y+zGE2GT5lTw6zcjRtjCLIZOTbXNr9xN9joa46X68oNZjgN
	ermGut3tRlLYsk1BDbHhSHiM430rcD+HAxJ+ftN3HhR7b2sHxd2WqctPu7ZhQHGAl42QyV0zsI2
	nnX7hRM5O3YguSzaQ9bGbJM4oT8+gkSfiLXzLDD3pZtNnbrTNnPTZ4Fqpoi8S5QplCHt4beYK4z
	dB36U4sF22+RaYPOXseG2C+tD0cEZsaH6yTGDfug8eZ2+Zrftp3vbXegsDPuP0Oqj6XovERnQ98
	knMUWGoNMZMBSACHoHJtDTeAllcogmQEKMufJMr49hEmqx/qz2jEq5m76LcQovXZqBMPtx1l5nu
	htjRWdnczV66m//EDYLvuufwafxWhB+D08lHiNtlYuDVqjjYznEQQnKDASxeIkHJh7au2s3Vcbs
	tfOj19rkEfIoFas3DmX1J+ykM32pW/ZpC+jA39FUHaAFsmRHY2auFemjdZB2RK3lZEzD9wuJURy
	fsDVCDPV6IcmdFhlnLbIFZjuWwK0qceuZhZOeBSC0I8fhbL5y2cUw=
X-Received: by 2002:a05:6820:7043:b0:71a:de33:9235 with SMTP id 006d021491bc7-71ade339c6dmr2095104eaf.42.1794810596210;
        Sun, 15 Nov 2026 22:29:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:24 -0700
Subject: [PATCH v5 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-9-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.17-dev

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index d17fb2244923..2a8c44865636 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -273,13 +273,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +295,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpiomtd);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +349,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +377,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

