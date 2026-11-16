Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810616;
	b=C7v6Ph3EvqkUUW17Naxyy/sFO9YrSBYHXlCP0/BbmwTKAg9sZrDXH7XQ1Xva8dBznRLU
	 IFh2lhjt0seRsy1kh+k/UoFjpUhCZ2tlaNAL+yRCdAI0KLqTFg1DFcIo2xSjJ1Pe4t2Ba
	 TkVfhO91bHzMGuG8skidWS3+HhNEVt2vhWo+pFwMdcjNsZazr0MufpDfHBFi3Qoj2C3cD
	 8VNv2aWEh8p2vGvtrSc05E+hnz61G18Z26JPdjo3Dz90wk8vDB8e08CeeJnbhmw+I9QNO
	 BwttcvkkF29Y3yvGFgksVGkfImA6xaAOZ31ybPe8G8q/iL8LjpJIe3NgrPJsT4A7RZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
	b=LrbfDoV1PO6edkJvLqI9gIIGKJ0UlnoptczHO7LyjrV1XhConf9XJtTBwH6dpaPw5Rlg
	 E//Zs36sOKz6V2yB6Gsq6jlAgzwJxshBgQotqI21qx/5Hsur7HUa4zWL0DUrnmt6WPPIH
	 fVq3dEFmZZ5unO/2IKM9aXDMfoqvzF+OwPH+2hDKxq1yH4NLNXL4EM3E4sZyYz9KyG1JA
	 Wi8KldlGF2EceRy+t7Ssn/W1wCzwGZ3IV8mzXj+DDswPjAfMQHAXNAXkbtvD1o1JYr4jQ
	 TH5ZDygQPFpTfXEaYfIchmxK4I+CuATzyBsTucnIzl20YXN0ebGCCprqN2PyPIOLHuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDVCCs3T;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8960A2639
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE8960A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDVCCs3T
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ad047710aso1094703eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810615; x=1795415415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=pDVCCs3Twl61LfseS//KJ8ELkW+z+Xbt048wJNYeCBo/4Zj/kWzsaMVvAKWrxjR7pn
         7GuY8dY5uqn9q/30HaWgsYX0az7Fc+iONG1/HLtKI34KKv/MJzvbiRzGzW34SJNmdKxc
         Z+w9HXrLYaZVFU3WBszGC7LzzI2+muJVt8aug6dGinbrVm09VpHnH2hylFSH4NkiOEjN
         dF+NXulhmnU1JnOqIbpQ3tFRRu6o3CQDncfwQ6ZgmVMr5zvKruPKUFQCeGwQf2YDOPOK
         EspbXF6tZhcXsUPFCe3LM5MoUUEhLkEAjrRdPuaWAhClAYCDFlqFRUvTB0cfkpLpjdaG
         6nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810615; x=1795415415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=iZYSb0rhkXK1vDh+56J5LwGX5MtcSWpbLFm9eyVHGwMl4COzw/YRlHwYLVFbKfkaQ5
         JENrDu9VjCyzpAMd1uoU2e+2rrPpcLsT0sj0jMiShIezFWrOovKwQsJNdQy91hxLdEFm
         zWBpEMyX1vlSkyS0fnrLgmyDz3bFKEB8arwqNOhJcQcbhHC+MsM587oCqPrafQCkVogl
         ZOce/TtTugIhpxFmWYqF6Ar8POeq9nAuuFBNMIdJg+2hwFtU4wB2uxirPiziMu3l5JQQ
         jn7exzidhdFDaLiSpvxG+Z4pS/hCCBrqP+TRU81Dt3tAT/Mzs1A8tCgAkLoTNKCEhFsM
         Bhxw==
X-Forwarded-Encrypted: i=1; AL+hErE6ewnFK1u5wbOXk8mMLWKRNGNSqQxGxlwuXqsIb/QVTrq3lWOMl3IxNbENuEz5WAI6+7zrcqTOIr7k2JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Av5Q2sRtA8l6TGWttlRCZeJPvLaPImMl0Wr3iaMfOkIxt78xc
	z1ilhhnyMZ6XuVV9CFBN/iCUqjPC6Eqv6jDCdHSfsmUmwUKEruaMO48O
X-Gm-Gg: AYBFou3hIqCnMvNvVdhyR+xTGl28yWFO8tlLna4zLmDXFQzvW3PN6tqh7Tk/kr6Kyep
	KNmloMuZ34c73MfbzYu8Zmnfuw7NzT8pOUzUI/LKFhhTzuOdaOouRuc4+5T4tBr7zW+voU1PwjO
	GdBpvk0uNjJ1tBdzr8Lm/x+rngfw1+6KzBtftSKAD7GJ6kb1jv00FSBbO4se0U5p8l+Q7dJS6nw
	y0QFw2ZUP8N1cDu94UBFfRb/O1dTvsh0rY6xCu33oEetTxKmgaHCZKjGDRgVXC+Zyuc8c7qR/Up
	/maAX3v9AjsJDfoVtZQj2J6QP1ogEYEuo1mDJlJiB/7aM4HsydHkf5xQvDtytJ9jvZe9YTsRz3N
	5koHjjVrZTfX58YLT6oiILakfqsz1t8R0Ty1ynGg2dvTlr56s44br2vhwSOu2yVYu7a1IhuZY/i
	rfdtJhQ5HHtGpnfKeFMiusgEgqTTKMMCReXKRu7fWQZV9TPgf+6hkbwNMysN+Gvy4MTe+vszGeL
	qCIkuqCnXBg7R3ncsMhIKrujwB/uG6qjsM8fukOBelKrKv6GKMKRlW/iWoKFnreoNYGkS1TA7fz
	nFccwUSLFb1YoxF/gO57SVDOKmqRPplbn28XuWAfvsrkFOlP1Bohi/cEpfikMz79YleF8UMHGBt
	d7FNyGcaGarN4jeQvAUlSLXrA5HwkzwpFPY3NZYbnhP6YkrifzcGo1n8Tzb1myatAXJtQlvBm+j
	urJwTHkOMvb+V7HnSQ/Fs02Xf3lcn5erKsgE2NbndQ4tt+yy95wbg=
X-Received: by 2002:a05:6820:3387:10b0:71a:fa06:4dc8 with SMTP id 006d021491bc7-71afa065577mr384122eaf.56.1794810615197;
        Sun, 15 Nov 2026 22:30:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:38 -0700
Subject: [PATCH v5 23/58] mtd: rawnand: ams-delta: retain open-handle state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-23-cbc49c5c5e74@gmail.com>
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

Apply write protection after unregister notifiers finish their writes.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 1afeb38145cd..af3641550b2c 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -250,10 +250,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, priv);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +357,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +383,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +410,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 	int ret;
 
-	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
-
 	/* Unregister device */
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
+
+	/* Apply write protection after draining outstanding operations. */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+	mtd_put_master(mtd);
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

