Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810640;
	b=YUXz7lW+dxoECxtQzsqy5nzDab7T+sztAayBmSAzP6ko7jiPN6KPH9BW0Bw2VjtNetrC
	 h19z2LPDVsACeHQaJiTXrdIumvw49g07t+o2ztTJgdvwj8m6o7njfGBxbjDYWPe7qzLH8
	 6jTEg3FavZW8bax4SLoKie1kGKAQXTea3hBzftjCgiI+9vf0qZJs+0mLc5wXIa00BNp68
	 DWAr1WpCxm+ZrLsZFz1Z7btd6/tQZmRP9vpvNjlBQ9ZiSTMe10/4tHPJf7IEksdVolIa8
	 qnWImSk/eJPfqMrvzRgFFgzPiz+u3+mSC8S8RcCg8FqXJKrnQyPtukcEMInjgVe4BGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
	b=G8MEndIzZUCp95WOzkDGCV9ZHVLreSNavsdrx+Mb1xj3Icis5WCvOq78WjXhRLZhO+qJ
	 uqBX0jHkgGgIbxsCaYy5gTxjt9c2yqbnhiNV5u41kF75I5uGyb4rWKoMDvLwsyC6DUAMe
	 vQXvsBMhDZoXF94hl1vTLCorvHbt+H4HdM4HVlbwAhBXQocrSfKmLkHkhwvjVvvVjOxEn
	 j+vPlw//1Bw1ZyZ3ScOMeOt7pSx2pOgRvJZwUAAwd7Qal3p99Sz7ysr84AWbdIiKYkM+q
	 7m3XLV/Hrq2lTAXfkBR6ZdtRzfX+DkkbEQ0wZdrS2TlRpTxXUDnLJa4yZhg1escFCLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMYMQ9BK;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69325606C21A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69325606C21A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMYMQ9BK
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-702fd86d674so2708961eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810639; x=1795415439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=yMYMQ9BK7vyRnAeoSqOhb/urO0mvg4nx2lqTo8snx7n1qPy1qXI0wv46iUnb4QbSgh
         joMtpiMp9KlTxxe/HqvxOAOC+v3WCKYuANExCBIKroBJKeBhyv7XxYQ7vG8sOFfmLq1w
         8jyYjE2tT6R1JDbaOPnbNkA2exajP98nv8bzOCIHqcdXA4rNgSjNEM4idoTItbJd9YfB
         boT1lP2RA4wZjnRNxcz9ISBkAh2OSb5hPGmSV/bLzdeMABZCFs7SpWy2qMHjjStXaUc6
         xsZCQkShmH8VhTxl6vlOuwRH3XQdQjaP2Xk5ga0VXbKRkgoDYgvtb+LF8fV8lt/k427h
         n2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810639; x=1795415439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=LN1Xza88soZdYYK1fmP+KORR4maPfCryhksu2gJ+ipm/ofOuUKESQf6HeC3wJgZwhm
         3nsQe1tqWNb8EfqSnR3LtvjNh05e/GMW2YiOHbCUz2hV7q5gWJHg6pUfZIKTMxhPJy+8
         8bI/xyj6S8Npvi3bb4lilsLF1sLu3tPQDgJYb2m+ldSXG4SDHfZR4UDehxynNUuicYO9
         RgJUPkVdXsDTWw//10IvZwQTBXt7O4IKLqS/zo3Wux55N8JyScrJlrHNsQkVqFRBD3WZ
         oi2Mn64SHcYn+OFCuiA06sZNoYbwKTs1Qka1PZDtKm8Z9/xSDA4tW7XREzHxQbnfLrgw
         ruNw==
X-Forwarded-Encrypted: i=1; AL+hErErM4AInzgnL+inPj9pnIXmFjtJLA4WRV9AzygKjcLAYw2DUJc0JJ31yBoHMa1b5FYBe/AtXqowMFtmKiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZnHV/9k4lB/AkXf0X7yH9JcWC+qXTFu1ctKVhLNPYyMMPJutc
	8LDc1KSWo+Iv4dV0oRtKQEQVUcLwoBD+fAfwUaL7A+ymjIO8+sNdznpn
X-Gm-Gg: AYBFou36gMHrYGO6qI8aRq4V/zEcEL2Q9BOsvywBedFXpKy40ArBpIBZRwVSqpht3w+
	Rb9+1JXiK3HE6prSthkR4Xa6pJO14ARv/Y9CZ0FwnCofrid9oxfPGTz2TathTphpRFzm4MSFXpQ
	xyQsqm+7JBtVH9DPcyHvvNV2SYdToleWff9QeIcPcf+ViP38wVqK2HwemCuhr+haUwOr2sA1VFK
	oXO3TK5Vv/pB4L8XNSlvMxGWLuubNqdOycKWncUwTpyzX0HFlep/10i7CvThPPFSWuOXtxK8bts
	555Wy7bOjRHOAG44qdYQqmBTF/vGKlpHvUblk6lBvHcxywhxiKZ7+IsDfsVcRSK+CydZhijLI9I
	AwOqTdC+Uz/ff+Tqi/OjNQtDcnM6OYXimPGycVkxw2oegBauASsI5Wrd8o8JRh04mGTtAkgJhZn
	36Cx5FBCgBHzCfXLfl2eU5cst3cyMfE+xQAU2pUd1JaFKO92r66FlCgYxNjjJwmtO3DpaxZDPKe
	8L4pO6O6/kvUGE0sCJXfG47LL1pIC+78E+RPAZZ0OdeyZxFyugXzsE2ABGVUFW02jhzjXnOMZbk
	M3hcpVstPEdsgzV/L2cDBxbom6Z4Tm40lYDkgWBcILiMxKOfxWRkDRP6bo1Qxyg8p3F4xisJgu1
	Pmim6kAk8g/xhjXYNyDxplVbS2AwkrpLCfZmKuBTfcaHTqnUrUvtogEBcmNRI+h+Mg6lSvYcqyt
	DLYq9rnEhlNMxdZFwInmcfN//E9kr1YCbkBBLmPO6nHcPjF67bpuk=
X-Received: by 2002:a05:6820:f006:b0:714:b51d:f513 with SMTP id 006d021491bc7-71ab4cf6a10mr6609094eaf.13.1794810639270;
        Sun, 15 Nov 2026 22:30:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:59 -0700
Subject: [PATCH v5 44/58] mtd: rawnand: davinci: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-44-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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

