Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593784;
	b=avQ4QOBuuBmkHDkWMpOQxpZSD3sVtgVmwzV4iE50AeATsQHk2LD7+QC+ZAA9kjeIuhtA
	 DNlidU5V5bjpLctNiaaVXUpuKUDxA2csgBwG1BTyOkGhIvh8+Ojj8CUv4l9szauz9vpRf
	 b7V/ssi2JJbc3gm4GgSkONTJ/W5/HIxDM6EWgXhApcqjuiD33dFfwBMtxBkRHxPmfS2dh
	 612a2goFSgx/Ce/AANJhuhJ3S42E7fEcZ8YbxHmfjJhhQWA7siIHt1jgZ1n6fp8T3VGMi
	 ZqK5UUnq6zX08tcU+hHHXI895Y4DcozMRGW63wOdYuSJWOqApX+a9dZqmiwkJbPPpQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
	b=O6yXVTti+3+VOO61swNR6XDIzinWiTPuToLT1zZpQhLBLQ1VrAU2JI1uwmyAiwEqQCVW
	 XGecz79IuDl7pPL/I805hKRtu+6DWkBPkgbn+gbtVfhceaiihLfMs5mpKxbsN9fM/Osj7
	 DvQ+x+V6+b3ITF7owJhlJUJ1DnM0AqbBljFOMbL4bp44m4LnGrZwPvYsKmdI+vyGa7inr
	 6nicTyPrSo1eBH5cX9lVWlZUhdp/PuhZTfucF7+t5wLXPo0r42MOtaSK8lYyWQNVtmvM1
	 2S3h2x7RGUn8b1iGIHyDkpyUcr+lITex3Bt6lNHAx1Krd5IilRPOPMowXhc6NBrN6jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0n7wybyd;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9969606A6E3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9969606A6E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0n7wybyd
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-82380b0f55dso424501a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593782; x=1795198582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=0n7wybydDsZWVDyyvfL40lRTM6E+GXlncASuXRZzsw+gwbR/Etdclt+el0iffoaXO8
         AyIEii3aVc3Gbe9gmQu8CYSEQ9Q0/yFVOYTMEplLWZg7HdN9OLF8gRxQDj9eFryUvXdF
         U5jrPL2MwOTEU7PuPHqw2MZdfTmwjSYWyfnXy2uOyELqcLj7Z9uJo4xB9MiUClcVM4Za
         MAhU0CM7P+8hvnfdOz7PwTbCw/laKZfccVI4YtJpHr3EuaR+vtMxyGVSIKAazkuNWWle
         W2uXPNSbg7opLHlciok5klN8Y0p6jvBBMT+YvNNj6jej5goVmPt/CmB1J8i5k272HwYr
         JBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593782; x=1795198582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=thJSWM4jO8f0EvxgUKZU2SAOPqTZwSjYgaB8LSrH5znGU9n+uvi11p7fUEB/hAW0lq
         /aLmSl7rEQNdpznU2NTNqS30HyI70ODgJmU7qNmJUCIlvENParjvD54AtmQojJBN+wfQ
         TET4OSlxz1P/7P6J/X+GXRZ5w6LWnPLX3rMSrMQ6FU9YKULMqjEF2w6keCeqp/5ZEZc3
         FT/p4nDUlnIbN8x9cUKmz4lFLXre5F3ZMIXuBiSQc4AaISC9HcOSIDdt5kC7sNhmxLcX
         1h4lTzYYBqVIXk65CZJYhgbi0l/WZEbwsD7VY56QKhJq4ACsW/jzQCEcElBiYkwKZMwF
         bboQ==
X-Forwarded-Encrypted: i=1; AL+hErEg51UwuqfIYjyLQzWT+/f99AGTpdvtZQeVEUPgo0Ua4ve//VfNedgaJYn8f2SfWaN1LUyleVShFwDLG30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jDdrcoI1tNnXDnRvYBGQ0ix2JKeOGuMtB4qIdZZT9uGR5iHzG
	ZOwZlDX5u34SPdjBi1v4tc0IlAxFYbBDyilfFBldNZpR5FBZyT9Jv0pUi864Z7pS
X-Gm-Gg: AYBFou1vOroPbdaIjqf54rFv1bCWnmN2mwbKojwf7JIfvqybqN5IJIaeUg9NgOdelF1
	tdkNEpSd5bg5MwX8uILND/qIcTGtkywKMR/1kU/aM9OqCGJy1sZq25Kfm94x7qYnZcplzYuOCOJ
	yv0OQs2MttwjdKHp/Won0SU7yXuR5S2ybtkItcl39QEZEekY8m08Xu61Vk3rjcdjlNnnWE18O99
	DJ+KLYvNvUXA4Ksct/CZbxkwlwO/OfoPcjhN27IlBYGe55zYGtiRpeFUlUGbcL/nYJK/QkumK21
	IfGc5HAOO554VubQUwFKj2NKvURW8lvkqzvGS7fKxjRj4EyJpzl4lruprffnFHDyEWyYF05sSGC
	GRq587fmrSXybx3AvMmy3ZW0tcDd9hi0dry1QZkxRKsDOQ7u8L+UTnbTYb4blkAbs81wod+iPt3
	kephNEUc+YfB1TjX7WV/onUvGJ6ln+x0pCAD9LMhVYocqnvzZrUFqj/Qd9VmaPLTc1simPhNtuO
	mMDA57qh93n75t1s4CQgfIdgk61k2DUI0x45UcZ8wK+qbLDMzaJPjiHOqiPZFeM7/MwlyRafHTC
	MpeqDmWNUcG6wDNAgDX2VohqI9evLyZWcP5YNGqyqGlOi95ag5IQkCYCG9IsO4RaxBorLs6aaal
	Xtvb4fAupL2NiDOMhHUrjmdnsmPw7Gbn2/4dvYt5kbyvrDtAwIHRZ6no9czPFhg79Tl4vKolcCN
	tTJXfUsnktVBwRIJJsBTY/dRGq3mUnw1GWoEtBwQ45GD7moGe3ijQ=
X-Received: by 2002:a05:6830:310d:b0:843:ed9d:1535 with SMTP id 46e09a7af769-86289913a56mr4040897a34.19.1794593782563;
        Fri, 13 Nov 2026 10:16:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:00 -0700
Subject: [PATCH v4 44/58] mtd: rawnand: davinci: retain chip state across
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-44-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Disconnect the chip before releasing the shared four-bit ECC engine.
Run NAND cleanup while the driver is bound, and retain chip and
controller allocations while MTD references remain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 17c6fa73f4c3..40291db1fda5 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -919,9 +919,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +989,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +997,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_lifetime(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1028,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0

