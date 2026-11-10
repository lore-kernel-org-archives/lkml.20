Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296712;
	b=Go1RciUxKSdcmw6WmXWMmiHwIwuWbjGDdCS5OlqMEIXLJdUmXd8spDWYTv8pHomG2re8
	 1V4IET9FhQZ2Iy+0GK3+xjLllK5NABSB69jUMKsYVgEqYheQ2y1F4JlmtnNNtYizA7FUR
	 Mv2NPi1CeM+zlPaIiBqL/sQVAXWg0Po+z7AhRF2qJKRwMB5X1cz5jb6cMSrMsfPtc9X/n
	 KgO/iFD0bUQTTscAUxEmI8xX+CfcPxrycWfcy1t/wB7Dtu5FO6nBOuXPT/RWmdROhRFDT
	 PCGPcaM9NoNOvS3VAXCoB8iyZOgFWrqahGAWthXKyczij9QdXNU6ytnC04HouXbHUCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
	b=jusTfuLBnZnH0zDZILL9iXfkj/g2XFKdIhf6fVFaivGRTfJeCoOTqTf73h8pYTaKzqf2
	 Y7/xRo6wHGm3NrOV3Ojp+ZAR6QS5migEvoeRim0WIo52xwky6p7RM8NB3hsebfbfk+Jnh
	 mRyueUalVUEo+Gj9H3B45JfVH4O2apWqpdkLi7lYX+8R6FN/UcuJE1cvrJs6MJ2AGgz56
	 qUdD7IrwCrnOksqfUrWjuxDU9jBCaQR4ggf87balEhPTDCOLyP5Pm3glTh+wtOu3gVQYV
	 R74o0u5lPlrNcHdaP6f29+XxOEu/0ChLfDbuiZ8X0BfW38Jg7zYk60JbEYn60YhpDOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GzWKY/mV";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A902607259A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A902607259A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzWKY/mV
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-844a8bf7e25so1225608a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296711; x=1794901511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=GzWKY/mVfKWcBzpgE63PW0uuAo0/RVyQ/SFUi4t5mW12FeuZl0rq41jwQDC4k2xUvy
         ToRyQm/mq7JFIW65rO0dSoQ4GO+I7IX0qHXlFVwsPZT2pQNBCTCvUY+tDuKtnxgT8AlZ
         wMn8PBW//ISqUF5A9yMDGeT442sXGvmqpr8koLkmbzDXjcpyBoQ0+JuZddLzr1Gbssj2
         d80qmb4xdHpgAo7+mKgNZVbkx+7TjOhcIYHbnlys5PvhkTQ761dPpFJiTV3q95dv0s4/
         /CFz8F6bk8m9edLfjmz9m0iAb+9lKWThgHQsY/Ga1t6e3nXFEc6iCpRrOQUVx22P5MkT
         MpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296711; x=1794901511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvi6UIajIglEhxrzqUdlsFCj9Wr9GC9WiHiI7xVbplA=;
        b=KZXtcHuWMwWA9HVjGhuDchCr5y299ikk4AdbEDe6auG0+lIGiq0ckMfQFg0dG7TApK
         o0o108eA6md3JXONHd/6023KLnOynCd6qVYSI3nqPzZfeKgdxixv8qTpg1qow1zq+qMU
         an1j3ExoqRrL1PR34ImuGr7XF2c/xo49ra3VgvC4JSAKyhEWm7jMDAbwvCdgQ5tMDNqY
         rmnozI1xddEcPBv00dZ1lv3/Z4dXngRJ/cT/CZ+jofyIJlmz2GhGDvx3f1TURnLT5BUG
         eTODGTPxaPzqed2UPndVmXV7A8P1MrOfX8JEwVl+lEVZ6S0a72gLHZeaAQFasEtRlOH3
         LQQg==
X-Forwarded-Encrypted: i=1; AL+hErF+U7DgMQWongPCz3wFKqSsSGM82UkgPX8UpXFQ4xer7sS1czKe4cOnwjNDWCNnVX/LwbpDuR2EBOvngNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bmz17pV6W/Sus6V12OnXTM+AkUYSb09FatlvXv/7TkdWWkBj/
	z3LVJJM1h5ICSdTQCgx21LoCPvMAT9MyJ1RQFcW0b9xZJYLvky48vKyZ+Hb7o1+I
X-Gm-Gg: AYBFou3UVTNrP8aYd4Lv/3YYis3FJW+fh5Qus1xE05/xXeX2T1Rzc808wsbxHulOdIF
	K4LDNS5KKfkLsEjrb6pHRVrjFzq9zb4dUuLck/Bk+6sidCL5A0ZbCYHuFDrYwH8KpDLzIQc7uUE
	ABzUR6OoZF0mcav+QZRQMbYycv0S4qNnuiXtfyT0DAxV+OcSS+oYYtkXWaq1lOuxWnHUY85ElX6
	Ia0X0FRaNxKCQa1idVmHa9ewp8uhrxKda+f5fBUcYHFFR28N4oT/Dtgu6fk1+sC2M7qiLSzktEr
	CP6YIwmbnd9s1oE2XRLS4TvQf+iOvQ55zbVm2bmfwO0jfsKF02kIjQm9TiYgXxFNxAJ8c5hB4c2
	a9F1Bx4MY2o7ePf3jHYpshgYpJ4Iv7ckwier3g0Kz/4els5f1GijV7tYK78AFxw3m7+LFfgBrtN
	WFzTvvrzru6PLeYnRRZI0/KkP/VH0rSMT699oCmeRzGuRJJ10IoK/KtSa/w7Ysvg/Wf6AAcq+Ng
	S125o5I6yJENFeEYFedIDRalLPqRycknbr+aaGCDEMDzPLmTv076yWgCXryzJPJBjmSMlPCmA2/
	vf3EGdsBuZCkg9n+cfDjSOBW/MTruDy7nMdXU/v33vlQ42d4vndySyAbfLB1UjI7D8ib6xbarWz
	knRGcaFdJbzqixrz0l/XtkQbghVyRHYjAbAaZZ/zGNtGf5vU2sGuUYZjvY6pPPfseqiTHBN+p/d
	tr3Mb3NdavPn32Tt1+d3fd9dyCHUwUcy0mfzp+UYTXOEmxRTc+6zM=
X-Received: by 2002:a05:6808:1507:b0:4e8:2150:2a1 with SMTP id 5614622812f47-5683cb25815mr1249912b6e.68.1794296711013;
        Mon, 09 Nov 2026 23:45:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:48 -0700
Subject: [PATCH v2 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-45-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e481ff..291d809d0ea1 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1109,6 +1109,11 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static void flctl_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sh_flctl, chip.legacy.dummy_controller));
+}
+
 static int flctl_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1119,9 +1124,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl_release);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1197,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1223,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0

