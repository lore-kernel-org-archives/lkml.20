Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296671;
	b=D3EzZGgZ3g4GxXKj13xnAz2m9DplXVDoh3j3RsMbZUeeEv5qbf+CfRjRjI46jPF3ch7w
	 +WBnFwNAYv5SGoqdS9Zyhv1FtBU2sN4F2oXGg5wYxTwhNHxOVQx3tdrjtW+CdrvKv2/zl
	 0ERpO0tte6EOfrZyWcNsWSJX1+SM6rPjof2hRRJQ/+3tl7jQhD+ZCPih6jlrJDnF6ZURM
	 GfDj0AXQl35kftzWYS0uVYB+Emd5rnkG6K+XK5mzo2QGxtIdEMB6cbwbsToQrBwH15nlY
	 dIN5je0gwOLjexZIu16B3SfJxjQyi9w//EAhDKcbUxNW5q5+XbMchbcwdrDuZ7r0t3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=saxuqUeRTOnaPiqijlB/dtpIqfvbLNndGAKNn31lHT8=;
	b=KGzd/0dnQrcYcR2q7B8wszAQX0cP92amSG9oUGS4Y/JLr0QbT2XQrjYVTKHZ7gcQILKE
	 smZiP4DyhH7b+MNKIo/z8kVywLCFJY2AG0a7OSzEzETU/dZ8O0kRtuov4rQBdkuBRsXI2
	 Ucp11fIThKmi3SvggjqJZ7QirND7iv8HKGpCrqF3BIM4Ye2YxU26kwBbQmJgECaWJ+QK9
	 Zv84OzBQ8cxDgdwaydVG39JGTmT0ITvuxhmUy+b1RB5s5qgVtruWTCdiInoEpMwIFCH9g
	 6tU9HrFUzeKt1WZtC+2C5rGQUfsGxJSfNW7O70/2867y+NRbnqL25XICaxfzeqfpQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjWELZtZ;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553B660A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 553B660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjWELZtZ
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f699fe49b3so1177345b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296670; x=1794901470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saxuqUeRTOnaPiqijlB/dtpIqfvbLNndGAKNn31lHT8=;
        b=EjWELZtZ6T/ZPch47/ITf2gnXZ/hJ7JhgKjEkWTNHYM5g/oZCEidsTguTjdP3c5iyi
         ETLFtC6rcu454X6XTJDQHhZjE0DymI5qYqNHWTh03sVgJYFwHVW97l74BXQ+WUYBI00W
         uiB0CF9YIS8B6+TEVwTzmRsvp4QAJ6DohpSTSOnho1+38KJfhCGirhJtliBQvXc5ClC/
         MIyQO/QJVel/K0HnLtUuR4dKo6RsciKJ3LrJZsJ9ziMP9VBuOfWrqMpoFaYZTx1fvoov
         0g50F4mk2SFC4LqQLV2P7Wn98Q3NXTvyXOTfnGZcaW4jvSJt23GwHPW9QpUgFdm+md8o
         Cmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296670; x=1794901470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saxuqUeRTOnaPiqijlB/dtpIqfvbLNndGAKNn31lHT8=;
        b=y+UR6OrZcZ7+dATMxGtdJNkWyVTmlKY1iaahVedhrgjZYRrSRfPm8p0WKnX9Chj6Pd
         R3P4gCm1DC6H3+L6en2Vsiaf302dETR9GpzQs+t4Xk/iDKw2V9CYRzZ616Y1HOWyCcac
         Psh8p/tHFMw/hAv+4LTc9oAIY56mMH1/MpnxFj/B1JpScxPiBgijPNwGLlsJH3zhqBTG
         lpiQl5W85Cv+4+cOkVlZQgJgCP+9Ux89XnXh/4mARW3ekdqWXvflBgvI5jCOtD2lLNWB
         fNIKzDrInhUu2p63QiMcH4/cYB6JzFEylrfQqbSzR/XMKf5WAhqxMsbmd+GnEo6/p3FJ
         CO7g==
X-Forwarded-Encrypted: i=1; AL+hErHBdQDLQQt35K9ra3Ot2fHg9K3NzTgQeUfb/+BHOd+QaYCAPHpiaUwzSBgh03PJpXIsnibrdSyato84sUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+geqY7YtSGtRjiHhcHwyn3i5ZsgMdDCnfqE0xFVOtC9D99PXQX
	En5TXrCgoH3+sRSul2+5UwIL+FiAc7hyhGkyDgZBNCIZDxzudokJeWqq
X-Gm-Gg: AYBFou1G++56Q6m4dr1fBzyM7VlmH+fn8Lmtm3jz56ZGpoHwj60EfsvGfLI/6MutXzn
	fUxoSJ5U5A3mPO0JIYzkPN5UfpnHDIRvaDEzlIwIqe8uVVaqrYTdN+Yxw+eR6cAaIr4fQWixAkB
	cxRvIXLBFySD8HywfYHM7g6Oxv/S3LpT0zO2p8dD5uUVqS9jsw88XFMHRdUZgYCHmEfDoMyW4rH
	S36xjgXocnsEDqGbEzHQOXwZTZR09VaokZ9Gyu5VNd9CA5KloSZaEPlbYbaqektCu23rgXouu1M
	3dexl5hXKDFVjt9PSjX4m8xZnp4sIxSJ2786qNPEvLHWbBRurGpdzEGdpxvhOvwRHAc+sxRMiiM
	dfhP78PE0yCz6y3YfQONw6TVeVy0JenavZvBJI9iZK95OnX59lcwNruulLjm1Z3hroaH4kB6Nm3
	/oHLX2rBgf8P2TaPwPXEjZdTnMCdLHLTGtUgKf6adUTacZtqb/9e+V1n7/eNVx4M1Hj5SyhxxFv
	1NFwcqDr1UXOBM6onezltFJUI4fqAxcDcrMRnzi5+QC8Y8dDPQliUDPripDaNPxTgdn1NlHOZDK
	rGSx0EzZpw51J+xKib7p+4wQvcqFaWAUsdnGAMAm8fBqP0DImAc+TivJ36Ph0iyVtOuKMV9lk/J
	ex7oCD+WowvD7WBjaJZxaPd+ewQ00PnmqfXH+8GKxxpRVWdDhxeMGaFRIT13L5DNqXDl8/XWx4H
	AIfc+ehgY9SGvGub/0yYkb55Kk/Xa1ApK3qQBuUlgEnBolGOofsD0=
X-Received: by 2002:a05:6808:2388:b0:4c4:28a5:1885 with SMTP id 5614622812f47-5683c9e2eb0mr1431354b6e.9.1794296670257;
        Mon, 09 Nov 2026 23:44:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:12 -0700
Subject: [PATCH v2 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-9-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.15.2

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 69e5e43532a4..b6c98c374e39 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -265,6 +265,11 @@ gpio_nand_get_io_sync(struct platform_device *pdev)
 	return platform_get_resource(pdev, IORESOURCE_MEM, 1);
 }
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpiomtd, base));
+}
+
 static void gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
@@ -273,13 +278,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
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
@@ -294,9 +300,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpio_nand_release);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +354,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +382,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_release(chip, NULL);
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

