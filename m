Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296715;
	b=pHuJ40tJG6b0goVbsYdx4dMZqCZcZZc0vydibcvziB3X8FYdiFtuOQmDw6xOX2V0FA4L
	 p9BctSoGU2/nDjiPDM3aiY8ugg2y6y2F2R4+EgOJWdPfuTMXrYkMh3xLowadYR7qaTzSC
	 kM3/Jqktsk1OEtDzMWLSO22pKY2TfAGJ9RJZEQfsXG7ji9sHAEXeqQjMDby2pAZ3Ufrst
	 +p2s0dZPGYWAa4IuNDN3oexd6sFo9Sky9HFyMohReCTMAGkuFqk/qFsv1mYD2hvocIaPm
	 PLmNdQRS3Hi/XtovbWixrOmrzf4BL6AymvsZr38aVXMXwvmfhiDM/Iyi03iYuTrZC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+OJPSVWkhBoScGRX8u1MCa4c9TmlNDLnW4QbLk/yAO0=;
	b=ORgX71yNabqyGlKcnVLXS3IqmBH6Gv2sWF5Bo2kG6FKOVWwrBODhbCjGEbxItz5T4BDv
	 mbLQzXmWVHtZ8zW/9wcexTRV+/89ruR/gNZWrUbA5rwxG+RSv5MG6Yu7kIWj3UA/6Z4xu
	 ymlQRAOr042He6S//BHDXFq/WqvEygnc9rb6OgN1+pq+82pZHOvjDEJlA7UTGgF+CjqmV
	 ab6ynt9amutdFi/cVwR5BTnIGAwVfrDEarl9UPi7eZ4aw8ZtYAS4jB9OBqsxgENm/95rQ
	 tBVySPmRPYJeGlmqMZcBRggwB9KtCeh/4EE+NfSD8PHpxTehVVp/Fsnv1CeHAr2dsrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hykCxBc6;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468B6073C40
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1468B6073C40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hykCxBc6
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d68de53053so1157775eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296713; x=1794901513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OJPSVWkhBoScGRX8u1MCa4c9TmlNDLnW4QbLk/yAO0=;
        b=hykCxBc6X/QdECaDhfhmFKgM4B8jAeKvjZzUbnKQMDDIWcmgxsieykV4tit7U3MdZO
         bwPiNgMize5BlAmn++eoFcwTox9SfMvfol0vVsvoVa0kwajrZgpN4XUUfTrQLNg3Rx8T
         stcPFY4Jh53M1i1EOzadTeE+Lomyyrow3Ky5N0zTwW5lBjaa2+zTQrcYBDVhHSEsBkm0
         YiRTdF3PzsEYkL4VO5NhV+g3Tpk88hWj+X8ypZmYB5Pt9h+Sm372y3WWbYhc9yfe3cqT
         GROf97pSUYoGzloNtTUvzTWnRwtGOCRstIfouKtflkx1pVvmA1UoEPDMmlMgJabWAv6L
         sOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296713; x=1794901513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OJPSVWkhBoScGRX8u1MCa4c9TmlNDLnW4QbLk/yAO0=;
        b=RcimBWLnguiKQbhKd5fnefV0GqsWboi+/mDxuNnB8TufCGaZOm0zhVlnZFVfftG9mF
         qnZ/etgWJWxkepi6MK4djN3yhqegZP6Cf0x09fSX7MT767Lddv7L24vU1orRhoGv7P0A
         W0rMgyN/DiigRnYSZVJuHuKyg78LwSMlY1S0716SF96RLoNxMR8HGFFal1ivWrm+FhyS
         YETMHXKFYngYC1oj2Xj+UWLnvnAsH7GEsMtxM1PYSsZ5NVhFlqi8jmj5vbsH5uH3l6LK
         xq5gIWAqctmn+nUQNMhtx6V5OeeOwVbNsWfv6ctWIULjLmOqpXMg5QZTo9vCTkD+f0ri
         Nvdg==
X-Forwarded-Encrypted: i=1; AL+hErG1UWbZXLM0gE71OBKdSittT5JglxjKqVIhUJBgNThHPjkaAj1dV6X0p5llYgdWf79Y+vswOBOOa+M0mdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mSqSNl5M31flaP0ZzJxy8wdfvJVH0iUe/vAcYrA+r943GSDiP
	D/7WTzV8GOcG924SLm92Hc95BMKofUzbAX9FG4zHVEhAI1/qBQBxr17/XCwIwe8r
X-Gm-Gg: AYBFou3sdlvIwBjcoQRbzee+/T9QZ6tVK5gL2LJ4nI1r6TxLrniZiVInqOJ4dr5f5f6
	pRyayHJtJY5IeUTvFb+ODJj/qm6dU02JFMB3ydMDsGgdAaGnxIL6jqhBMFZXlCy7kjNkwwOueKR
	8tp4beBPAnmfVcYksR3PivmQhjWjz2GTJKzcpu7AwyJ5fF/L+6VgZxPDUyeok1U97infO3OQq0U
	o1yrSrNNwpqc9eiXNVcW1goEBAWikTXPXVNESZVKcDHkJxaCjWBHHA5uNFxhesUzjDv4mVB9eF6
	ClIbQ1wG9GUnkp/rJ8K5+HU/j/dLgU9fhh1G/WtRf7iHHVHJHvjiv/prYauzqLIB4dWmEU6QLP+
	foYUnwG0GCayoEfa7jqjurKFaYNkhKvUpN1l/9X6kWjP2RLOpLTvoAbXIR6SdsuOME90OjdUukx
	4I4BAciobkHXvah+8iU+fRHxpq+0DkFC2EwvdcPrau6AvYt29WnVlCyP/PxbWEnFKzLxXDLAIt3
	cEnImVu7Ei6nTdxcPmcGincRy0HSYnrxK9UePOINApUtwQxf81SGVBEZMyl/nJ0d75os9xhLcbH
	w+7F5Z6ylF79rU3ig0xKnRhSFFUL6gtLcckEaUTUxkK871ELLJbJMYpIGE04ivWl8SFqSvaMskx
	uUkaYhzW936EmvB52/aTtyAg21Ixj8EpQ9rsjlEwtWMyqyIk177BHhXakGKM2zarTBAuwcGScrp
	nvlfxa1+ta0/Wx6VC6dKin3LC2RR8tM0QE/fbtQ4CaLrymd9147Po=
X-Received: by 2002:a05:6808:13d6:b0:4e4:627a:e094 with SMTP id 5614622812f47-5683cc1114amr1237629b6e.11.1794296713566;
        Mon, 09 Nov 2026 23:45:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:50 -0700
Subject: [PATCH v2 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-47-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 8436015edcb4..93ee8cfc0345 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -675,6 +675,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -687,9 +693,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +805,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +847,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +858,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

