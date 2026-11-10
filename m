Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296717;
	b=001FsPyzlyTwVn2CMjD6j/dOqefhIBCjYgv0h//TzitjPdWRoDtOYhxF6SY53RaKn7hI
	 xYK7+gOzHhj+dDVhJRygQG22XR5YuNWO9CegJ+jjLkYGe8/81u/yVK0NL4gOe/VTVFhai
	 znrBf58oe7/ZGlqDKihrXsuwVG8/JzF3S3PCwhPLJaKXm1o8onoFoexjKrFz/nSLoiqwW
	 lYAwFYtgJ2sGdXW+l6g/hmWzywzK9uXCmY3yMxqafKyU6Ztz++c/ayZhTCLwgZJnk8znm
	 LvFLr1DLWVzeFob8wuSxf4RrJpfOMQFUGH0uhdmhumtICKFfQMzi5ioRjGHaiSdNfjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
	b=1NP8KavamZXcDit0n8u29PQzTVfYNREGNyXtOpt6L+GYONEtxG95yJVHkhoLLp2xhFeu
	 0rqxxqE3JgTlQM/tdJqosnM26/ZTP2YStJPmvl0OeGkq4dwKm08//BdTAk3TqNxF/tcTu
	 mmLHms5ejgnGE2zxd2Z0OcYlJAZMiqbE5bvx3ajdfEBJLZU2yWImasuhsaXDrAUowNVtG
	 2y2ZG3yyDm2JI9rm5KG2QggLsiWjzoiSi05BeX0SqlXDZYZrxz4SFXA+7LyE/srRBW0FB
	 g51Q3SaqQNQNJ6w6FMPbDgkZkSwgNBD8zH+Gr5rqT+R5nBFvgapcggVxYDTr71PEkRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDmq9KKd;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969AF6073C64
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969AF6073C64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDmq9KKd
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8439fe796ebso1123374a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296715; x=1794901515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
        b=eDmq9KKdrHBjQWdnI5Nh8k9AH2SqXM/AKIdoUWENShNfRywnA18GNrFxI8+VK5CvBV
         okRNlxyGyRy7XHTD/LJ1ttfb3k3vpms1ZII48mxArXgNtG8wLJHUqzRlD65dxKYqWgNM
         Iw+ME4JC3Edgqv5Nw+EcVYFpKQVQxmFlLivT23sNFKE9O4ck2qQmSbdx8/qoty/ohRBQ
         ffmPes8TYgmdBmhBeLnlc7ee/A6/AGcwoEcPyQqrhvz69ng3BgYbTn9nIUk09Gu7Y3Bk
         E+fRIhVA4+13Sr9i10Mtd8U2g6ccZFDt2IbCoT/iPt8cCHs7W4TYuMnkuoFZHwmKzJos
         3lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296715; x=1794901515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Au1rwh2obm9uwGdEt+TtwG7FPc9AMzgCv64EazeTRGE=;
        b=MoPr7CssRtf8pYIUxcsh4KrfudxaOtqMX8Ob7bQg+bfasbHJBK5RhHm/VDOjHbNVSa
         bw4mpOTizXo+5LjJhKJlzweMN43JFKNkWmHunioYh64J+FekJ6Vzz7TaFZN8ruiubJtl
         rmVKRJceKoTi3jilWoErBexSyt7ntRK/WRVcsiAJ6LKtcmkTh7gHWD8pHJz/kUkiYRXx
         oz5J5u+efQYtUwQBYxpkf7ZV/kgjGyN11kMECguOtCfCcIQYBwwYrO4EqEoygyoDsK81
         MeTv/1Rxb0a5tCyP9QHXGFhyhA9W96wv4kZs5C924DB9QCxqqa4avYNasvi8qnWkE3jq
         4VZA==
X-Forwarded-Encrypted: i=1; AL+hErEuftaAWEaFJnarkEFXePqwhbS2Q9oWb3vdr8jYfDyWU8gEkY8pGKkN7bm6vrFbq7tx0SwVbytbp+XZYtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vjPqX87iiGhuKkSeZfq5D0s3n0Sx/a9s8NUo/V5eLWOkkp39h
	VNAI6bw7z9IHs9nQvIG72c8QJOoBfzm0xoDMZfHGp3uYq1jczOjCgkzKMI6Se32y
X-Gm-Gg: AYBFou1vLSW6NjhZ6Huh7hn80d3SsSc6nDMsdWDmAdxGEagbGAD2DRNh33pb0pWiyh8
	Y5RNpmQBVUb/buUnbpxQMaR4A9x+4eSo6h8sQ4cZ4Wp5qkd+XjNYvM2GwTh9EQ1bFDUIgD2XfWg
	9csEczDoZhi8hrVMXGzy62iZ56vs6ZW6s0FMqc9bxuGQ8Srh6hwCc8QEPYPAA82UT9CxwFrGv/p
	Am49fkVb5o3BTeWehI32F3NKRrP6FHjCq+udolCAnqarxO/jEd79jtjupwO+Apqsr1S5+zm5qJp
	GaE+VthuRx3hU+7dCYcwzfjrobCnoTCzWmMX2PjEdBsSHLss1agHb7SBAtnyKB0C3DJvtIrEa0p
	Xp40tM7t/DR5vfRcQ5bf1cmrb+KLvUSggXJX4jSKritS0fuQGDfJEyvJvEL75ePcW38gne9W92x
	Zf3X15iAFqv1M6GuWp4OoyNKVOKNfNhc7X3yQ3ueouTYsvK5Pv9/Ee0X9PCJo1o/qXU9qO+0No+
	RcPv0jRN0Fazt7+KiMMwffSKtbfZZRJpw5CZGvNVbnaM0pTbLUVDLh+L8dGY6WwszsaDYTDMe42
	paWvgDYc3z/AD2Yq54HWsKPuFlNC5gNXyc/s4Pgn6rWS0khD5mbggbAs0p8A5ciojDYC7FNbHDa
	mTZ4dgKzrxkGei3t6BmJti9QS5HhnJ/o6W7yH2Vonm37T08D/gf6ABf7Af1dwTfA4J0blHK0shc
	zKDzWU+6AF4mCjS6sh5XkzmKw5xVQIbjn4FjAVOw3u9+KgHOuLWXM=
X-Received: by 2002:a05:6808:1996:b0:4a1:296:adec with SMTP id 5614622812f47-5683cbebf5dmr2115836b6e.15.1794296715421;
        Mon, 09 Nov 2026 23:45:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:52 -0700
Subject: [PATCH v2 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-49-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 42 +++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9eae5002e389 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,33 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
+static void txx9ndfmc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct txx9ndfmc_drvdata, controller));
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, txx9ndfmc_release);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +322,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +376,18 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_release(chip, txx9ndfmc_chip_release);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +402,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

