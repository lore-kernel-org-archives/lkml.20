Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296697;
	b=vFWITFulHr3A3f7qxdbZjfqmSs2ksFOvhblHQ+J3lAgY1Jd2SaM4QZxoMmvraqUj81ju
	 qv9zXu2oQlHyZhCtamk8/CcyuviifgBN40Q/xT3ayHAY2ZHyKIxA9VljAQDNqmR+yPcY/
	 ImYlMHiDhADi6BLgVWjKSgR11eJ+hgH/ZEwm1kArwFXEVyDafMjuHobkG7w6WllloZjJY
	 gi5HOglF8SGFxuqCDwfs9R2BK4NG9LVR2kfZUJiQ880zuEnu55qlTtl8CL6Ett14iYNZU
	 qkpDqgCOnErhwvDbie5S0NUdFVnLgbQYI0xSV2dspOlWsZxel+HYAHXqpTqogVb85zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZpsePWqmYNTbWvoSp5jGUgvnOP7GU6uaxozkU4/R0Do=;
	b=iQAz90VnTDepmQ++sPaphoifmcBFIPcoSCxVD4HqDYF6mWBopA+hkiiYMt+xR/QQOEsF
	 Wz314/w9dR0PZzwyyzPL7YxKmQRzl2wHP25t17b55dvmH5r3hgxbOkyP5cm4ucZTEckSF
	 c8a3kX9d1jnsV0dzRlGP5SPjFAQtcBoTXWEXo9NHr4GhcrPfVQVC/WwOYGLIsi01R9qCP
	 nuq2JdJOky5h1goR7efBiw8XAw+Pd1D130F4BN6OQ08eq86iI4mQftnES2qrmSXtaNzAI
	 CLZOeBqjmxQFWxBpTZyBOHWe+XGt/BoOiHEC0/Zc5rYJkkoKoLxMQ6jeAuclwuC33Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXPlKFu5;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DD606D29E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14DD606D29E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXPlKFu5
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1afdf5196so627288eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296696; x=1794901496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpsePWqmYNTbWvoSp5jGUgvnOP7GU6uaxozkU4/R0Do=;
        b=CXPlKFu5sxntUilu0XCY5PrFyCtm0xVWyocXQJ12aqe3z01bXROiDGKrZQkjsmLPfv
         oaWbowNjGFzzUEUKMujsXngEHtb1skHuHu0XUiNxLpjAYHjBoUI1x6hr5zpiPvQOiUte
         0GVl9uLYEEMf3VqQdp73pfoRh7YD6wXmnVGrZs3ER5fnB+VPHAo94pV1CG6FVjaaBSGh
         jHv2xHZpU5+V0KarlsIWtSSXEyKEX3gixVY7pW66I24TZksCdI4NmWbtsFGVDu3npV6H
         KqCxqU40DTo4+7jYbvp9HfFSZyPO2I6A+/GWyl9WiuMjHlMXcrmrDelHmLwQ04xsvIg4
         fq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296696; x=1794901496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpsePWqmYNTbWvoSp5jGUgvnOP7GU6uaxozkU4/R0Do=;
        b=H2GhER4kXQfuT6zq6OYKFfO4CKr+TnYBQY+J4+wX0J+n+CUEp4TelxEBZdttmUn2Ck
         9FNNL2nzbecdREoBYm8MsuuoazwonlyQNqp2xvVFds+qbVHHZ12KwBrv/FqzYW+ySNNG
         jYVUMISLeOSdWRbknD9BBRgCU1V01xHTApJKdbeBwUvDTIj9CxtvbPvD7Zur849flKZD
         6VkNV3LJc2+Bxqw21ICBobVkX8Bu1z8AIWDNSR6jXZU4B620dvKkvWUoui+foL3t34Vc
         3W/0xxuDT+5WXa795ki6CTFEfK/d6//NsTkcwvZUzm1i6dy7u2EPYQj7HE6j98fgz/ug
         vhpA==
X-Forwarded-Encrypted: i=1; AL+hErG44zFJYLIMZmO+wY/ypPGmxjv6hPEATky5nxN2KxlEqg9GsCjnNOfNX8OGiknD2O/WQkFUUQeZi5H6ZmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WfTO5t/S7igfMZVgdkmPSgox5YSnv2pQ5Mffi2Qh0lBa22s2e
	ulAnNU4La8rkj4Nu0wklOt7objK7D2baCnuJu5tpv7hcxiCzL4Inhr16ZRBJXEni
X-Gm-Gg: AYBFou0WP8ex/0GBavmn10GuUJGhbk0IHGpWAn/WWnGu9m505TB1I+H+wQDDAJD/XYU
	x36OVGqyZaJ4B5ZfxRKvX1lKUkHvGbNumwluy0oHLAJ81NymvuVS9jLbcYs3le+g8FN3VZd4YTZ
	Cggnwd4yi8hVY0BKFGom6MZ1znmkVHpV9ESzDz2VPcoXYZL0VMFThF8sq0TBjAaGEKDvBYbOx5j
	QFvCEI5gp5D1S45gCXJHD7J0m9kRvhbHYUVd1/EjzwiXnCYIEh8BV+QD45BTHhVyUmXhATkx7OG
	AB/lLg4mt1F9bOyxzkfE+On5ICFpwSk07MC+Yqq4QtTMa1+PrCfxk73fzboOUCq17l8/V/SaS5x
	TKFN/p8N8d8jtjd/aVQlwUBhHWjeLJ4ZTXN91oBnUw84XSCjGOPeJPTDKY25db/5BPOpzU3BSgK
	57ZaB03dSBoY4sr9+VXvvF8azRUlZm45pjUTYgMh4/SAKZhenqKoq/jWwZHKxQB0EvcPNQ6LMsO
	OTKXjuSTKGJisUU+C1ySb4jAnFrn/zZN66XhT7r1VtEsgtaA89JgfwTqOq5CyxT/Ss0yf0kBu8q
	rrSrHTRI8toBSt2PLShq9cm3JHpNgVHh7xvtQvDXGQ4H/CZhnBSNR0cpol9KlaMUzw8D3Oqmbtt
	C1oyaGfSMHQYBnWADSZG2z/f9SMcziGMILpzWgQU/nVQFnSLmO82ILkkNz26LItN1hMBfebx56p
	O0GfcyNAUpf1ERGyqcZN0srlDUJR3kuYRRtobf8tg+DO+6hIKFYuxQx8hkXMvyFRwEPeaOQn2m
X-Received: by 2002:a05:6808:138a:b0:4c4:9f7e:92ce with SMTP id 5614622812f47-5683ccd9ef8mr1560560b6e.38.1794296695733;
        Mon, 09 Nov 2026 23:44:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:35 -0700
Subject: [PATCH v2 32/58] mtd: rawnand: fsmc: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-32-9137d08f05df@gmail.com>
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

Disconnect before controller disable and DMA channel release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0b1817cdfc5a..d9cdb03e8149 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1020,6 +1020,11 @@ static void fsmc_nand_disable(struct fsmc_nand_data *host)
 	writel(val, host->regs_va + FSMC_PC);
 }
 
+static void fsmc_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsmc_nand_data, base));
+}
+
 /*
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
@@ -1037,9 +1042,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, fsmc_nand_release);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1136,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1147,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1189,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0

