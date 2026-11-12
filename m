Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446932;
	b=p5J8ANIAIngrYY9/lqXiE1euU2LKxwY3kJCs81pTiYDIBGp4gFZLbg82rjkAOQoIgHkL
	 UBV+u9lYpRDbBR6mlG4PKZQUOaEXqzcRJ2exVQu8AoUetztRhtaPLhWRP1WDv8OCAXcxh
	 dHfJVs8U/X2+yrUBE+FiMhKa8TOK+T5frtBwFVFESG3g2eoJ7/PDK95BNRvpp1Z0+W19q
	 Dveb+mQGxEc4RUhPIioM6GvNOyrl9BuQLETBkdXUZfYfUNgLy139CvoKk/DYfi66oT3Gl
	 HKBcH/uoDgYXCuCWmFGBab9U7BzLTxOymzbQ7b+fx1pqGQHcu/Tlivni8OzJZ/thetQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
	b=CLmnSnFAHI7JtBcum2/GlsqJT6lfDxlun6G3tTFDo0PzV8K6OlbhikGCzokycEn5/yDO
	 JfodK6GS9+GGJt8axZuwcvXykjkxshG92wqi9wDRh4+xpSf9/C7ZhoU1GZ4v6xLZNSErZ
	 YLYdOYHrbqVx3hW0DOJ3Lqn09RgMNE0RkcbYPj9W2I6jNGDDDJ3NXczAiXLiDAMJndp7z
	 x8eI0bNiTnd0KVz/RFGzKrfzOLQ45G0bmNQQBpIVxTVq71D3oGZTtMQL0mz+uRm+lU/56
	 DsMy5PNRQfBFyuASY/6U5V25p0rMtOyY0ixRmujoaGoXCs0Pg8Yl1ddX0EmllWz/z5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuhNajEV;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49334606A8A9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49334606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuhNajEV
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4d198f1a591so2460953b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446931; x=1795051731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=uuhNajEViK8TbuI47TiAXvX+U+wc60v9kFGm5cIqFzro4KLvzM5vuAUoAnYZPHHBh3
         NblhuOLaW8tOHBA809pi0LtFMJt3DLTmPjqKcCQ+BQ9Wt72ezMcoEjJuLNz8BNiLwKze
         YAUgVeS2Vb4kwHlpndlh9O7YUzi4NUMu1gom0VVxhdwcLHWWfj/jr9qCyXsZQ3O+oWKJ
         WLb2b/osxg9Xivhc2iiJ/RogVd8sHVitCZThfyCGjB0prM9C9CT9Iv6tDN3gjvbCvNKz
         Sm7h0zZKpDGQMRTexUvmv0/nPZSZElrWPMOwL5m/7jEe7Fu438n1mnnomzRRb1UTI6mt
         W0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446931; x=1795051731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=1Pg+TvJTVzbBPvATVhef4kRgYSogXMoTdCB7sV2xFqbUsKoiQPbLZ6Q/WRMJ3FAGsO
         uJqaGb8aWD2wLEDbhFPIRkJH/dDIZNMnma7abLAh8k+WdqoB+OawORzFSSGhcphp2UUr
         +XI1wkBaIGUSSWKnIfx3Cx1eHFq6KWNuZDgnxj0pXp7bD5rRX4s12QX4GaVABfj6vqt9
         /Td3xq3NodCrwnFiifHg2BJ34SW4Cpe08klZPakHuorjWuvrMjv4fskuGL6fw4TpFr65
         BfH+X3ZsUvoURjY/UoACwI4tlzNIjVdPFJWb1gRtb39Ve25+haLTjdieC+IFTm4JY9NZ
         nx4g==
X-Forwarded-Encrypted: i=1; AL+hErEUZ5judyVkRrpjULUAhCFbBPHoSc0UcptoFMzPdUm3hMSXnniO0tk0X8680lmnedsFK1aLpaPgni+bgbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PDKYngyhpAFY3OOWHgVTdsRRQr5Dz+P74QOw+2hi5NWZoeN/V
	OcdGh9dYs8GLviXmP7Dvm1kklpzwaoUyzQkHWrZMNfuCikVv1VNNae2FqEq+w25v
X-Gm-Gg: AYBFou2dBdvJwPtvaQ5HM9w4ted3OEFoiavNSDJqSR3JZsMyD2Ti6YtOImNWHP6XCFa
	u9v4kB+O9DrNvhfFCJZ2HLc5mwp6lco4aisc4ZGeNZb8Oe1iO5wwDSJvzzo0IsgPewTmVp02kPt
	eg0YtjDxw5+ffsmPQbqZYuLe4OkV58iz2RUcDpBFpFqsMqocphxf7g2dMcbKxP0o9jUz68FdDF+
	75rD6d5KKiEk5TS2v42hC1jmnzjRa0AAg7Cbplo/8XdDDo9y/d7EDRi/oIxCmcaJjdt96Yqh4ZH
	g9+UdiFexX5NzsVURWt2KKUYhcGfG3oRfRsTZDt8wL1jR4kfOy7Bsvz2Y+4VtoVKSGYC4nqYWDv
	SHIqEvMwnrODyEd8mrpnXO5G61ncMPclVgSWWAuaYn+rHIpA+8aWvtGSgGZPFWz6JffahObFOVt
	UddNmBLeR6vIiL/Sqq63axdlj/CdDd2U7kA6gm8Z9sqF36Dh7CTwR50VZPlAQli9xligZwudP1g
	98ji7e9gIUQJYYIVcEhdKPbrghKg/PRrP0nvO5pdgvhVfcHYyiATUBLUhrx9MivEdBy7nzd/Gej
	AMpbPLHZu7trfPK+cscLJ2YU0Hmjg+qIjpeb612bfu6ByGkjd4A0n56TMHhrefG4a3DMfQjac9a
	SgDXvYdgQDsYoLqYXxEBtRt4u22GsvYvxOLzoavEok2Z9PONWkHh1Kw5PvLFvBwSkvJdXtsaK9g
	FGRknfvNBV66BGnkhjATMbAXtiQk+Cb68OBurBDH5OBy6wufuBuDXc
X-Received: by 2002:a05:6808:1817:b0:4f5:e13:95e2 with SMTP id 5614622812f47-56b9344d1c3mr4165492b6e.9.1794446931163;
        Wed, 11 Nov 2026 17:28:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:59 -0700
Subject: [PATCH v3 20/58] mtd: rawnand: socrates: retain open-handle state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-20-ce537999741d@gmail.com>
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

Drain operations before unmapping the FPGA registers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1b578193af3b ("[MTD] [NAND] Add support for NAND on the Socrates board")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 91d4394c1137..5b9b99bc1b38 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -142,9 +142,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +159,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +190,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_lifetime(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +218,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0

