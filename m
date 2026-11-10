Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296687;
	b=mF0tSXbu1SYq9XXsw/N8aeO62/y+pS5UjmLzep35NfvQVlUOtOxhSixAjeXdew2s6JGs
	 D3OS6H3p/+hHLcAV8PL7Jf0lxuOTPmZu9OewkBct77b4O26dUbB0+2oAhcrAKX7slbJey
	 k2kUJ1fiT0dtT4ufE5ITyz1p0rN301Ow/neYqCh5Yu4JZeDcncn4SyJlm67PRuX3LVnEU
	 gZwq6HhGBAovGhVzSrfs9VpJdFWKlFhgnjwjOf4IGjBBqkrIzUi+971mgy1U8kaBA3tmq
	 nKGvR5Emxt+aNl0yjEnhYW/C3nrM0FKS/2k0MgLspqa2+raTYMDrgSTMlOJ5QK8EdyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yPalnhmB2Hlw2S3v9inZlxSAgERDikfH2sBKEiU7RGo=;
	b=HOVZQ0W1ZI0Rxwq7QKgG28sP9YUcNnmYn1YaZkgX2sBwCu4LFKwacV8JPYFzwpKZFQdR
	 W6HSfqKXn5AcFB9F4jlJcEUKDhFfgCe4N3pU7eXfj8+AUcGdzzYvvjUa9Rc1iNb2YwmPC
	 LveP7W5VFB09WrZQ8RpO+U+zZuCjHzaYl8e+DvOIXTIAzVCacV87OcSCU6gnr3XjCgYXc
	 U8RtntiDlQ3P1Tnbpc6OuHNsbHorLA47nq+SLB55D+RbYAnynemclCN8ky8ExH7CPrDhK
	 w4/5QNuKx8UpJIYqeUdL4EVJSzC3K2GCLbQ2+07tw6ezchZyW4iGI5MOps5maH/odYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAlHUxAz;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F3606A955
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75F3606A955
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAlHUxAz
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso771832fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296686; x=1794901486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPalnhmB2Hlw2S3v9inZlxSAgERDikfH2sBKEiU7RGo=;
        b=rAlHUxAzlBudAfL3HE/DcqTDE7sc/IE/jczny929OxwUhgjFHZih7KGfYOLP1XW1Bs
         pBpEzUjgeU0JMBDek61LSa2I2FGJpTNuE35aICZBazLxGDIr8WNIkQShzTDkzAVFKsBX
         VibroCyj60OCFYuo7S58dSOYHnEfQSCuUGyOa4yBH+Guk8OE8wNH5QmKl+6PtFwsBcFW
         H8K+zeKvLU1lV2HEyooizI9hSSE/UO811XATf3WrNczAvR9wv/WqHDTGcGJeHebJOYv7
         2KRAgS+9REk8Bf5Gea5llSaDo8/n/qtcOfV/MAJOpQjJrfaDUNncRueo13mtmR3haeTn
         vpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296686; x=1794901486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPalnhmB2Hlw2S3v9inZlxSAgERDikfH2sBKEiU7RGo=;
        b=IZua7/BMEzEbFAyg/NCwerS59cWu+b6/wAPemTOVvT4gKkuhiWsgqw6CC+jhKnu5++
         i6HqipMw+4T3HA8i1lRdspWgPvthUG5AQQrbkqDchaNj/H9isWK7PP0QAXMprzV0GaUo
         z/U1UYtQaO8F7pNOLWch6/WUSPoaqiwOnKENnq+WjJkqzGD6W2zbB9xD0RSyKdSsrTHB
         mr7qUfbGT2rWAqHZvvYbz7erfXI6Ltm10QgtnOH83Y27QQZUGtXU27FmzviQk1yqcGGb
         2uEJZcpuX1HQ9flmawT3K4qQf7/SMSEjJ2i7VxqDeIjyWu/z7pmyxbg5P16t0e73Kqrz
         pIcA==
X-Forwarded-Encrypted: i=1; AL+hErF3LguotPlsrXr025s7JUT164VrsjllvWYmC2lH4KI5mzMmjhgmNiw+r63HdbUEZG9W93UQAqxPKtV3K24=@vger.kernel.org
X-Gm-Message-State: APuU4Z9awlWgHklG9X8CidpYCkvT2E4G8k7x76xP8ULIoNT0UDufo8tm
	GTEWaSi/xBf1xmF1kxvQ0h9Laq9YQIh4n8GYHUI9DVcKTHH77dLO146X/Xi8rHmP
X-Gm-Gg: AYBFou2+xkYezahGawYrRQxc4fxd9NsYho2k+IXRll4TA9eU7miwoab4Gvy/57F+XND
	eHmY7iQFi9dxKhiJWLtDUGp2HiGqV2eQz0DkbyMJafsKOwYmZ59F/kAxzUgm2gFqu8uv+smXU3P
	uHSTKqItXgODs6b2HFA0C9AUTVPxuT5torNNKnXw+bBFvOAOsyx6Y7ysDn/TjBmGUOrjAapzRJV
	aU7YZpayopXt9Sc8mY42PKppLZtPaCcXrjazbGRRlYOZa6ifDHrsvYsWVUeMGAPYEge1/FbjFPK
	OsLil4vbLhoL1DpZNnZSZmsBFBHASH3ihLcaI2ZsLaGWetE7mJuL4Waa+7akdZrR/KbEb/SfUEj
	CCblQ09OOdwgAHr7Py2kjrnwKXw0Sen6thsp49cBHOEgpRLL03VOMCc5AEaq/6EG2c21mEq2bd8
	Lsu+FGx3DQTdmt2ZOexP06EqWIC3pT1cMsyckZxbbGlb3oD3xZARO6T3xXIyE7RXgCCZX0/0oaP
	LjOCVpuXDmQNWC9SPU+7WrfgfENsrQEeXpBZat9HdJokKiSQ/KcId6J+8lhL6Vy/cKqQ63mM11R
	TlgSD63ZJVSOe4YcQlEr63sYi41lKsIp2LepEfPDiBYi5K0U9xkVxiPrc5kpkngP4GpvKpaFGYN
	jAbAvC9/XFTbE30gpgHFtDdcf4gegiw29uVxyP9q8q3wmZQduJQ6XL5SBBk+F7KZCmS2uzLmy22
	9DggIlrbFEqGIOGgPBMCMyHOIPClwmXtRrSiMzBnjarPbveMN/qITC
X-Received: by 2002:a05:6808:2507:b0:551:2eeb:d53c with SMTP id 5614622812f47-5683ce07f0amr1272378b6e.44.1794296685734;
        Mon, 09 Nov 2026 23:44:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:26 -0700
Subject: [PATCH v2 23/58] mtd: rawnand: ams-delta: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-23-9137d08f05df@gmail.com>
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

Apply write protection after unregister notifiers finish their writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb2b7db70297..e918a41875a5 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -230,6 +230,11 @@ static const struct nand_controller_ops gpio_nand_ops = {
 	.setup_interface = gpio_nand_setup_interface,
 };
 
+static void gpio_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpio_nand, base));
+}
+
 /*
  * Main initialization routine
  */
@@ -250,10 +255,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
-			    GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &priv->base, gpio_nand_release);
+	if (err)
+		return err;
 
 	this = &priv->nand_chip;
 
@@ -355,7 +362,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	/* Initialize the NAND controller object embedded in gpio_nand. */
 	priv->base.ops = &gpio_nand_ops;
-	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
 	/*
@@ -382,9 +388,15 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partitions, num_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_nand_cleanup;
+	err = mtd_device_register(mtd, partitions, num_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		return err;
+	}
 
 	return 0;
 
@@ -403,13 +415,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
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

