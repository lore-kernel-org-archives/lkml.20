Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446936;
	b=Qm+Q20q8NunZWvxnhJX00GHMhqmFUq2Ehiy8LpLEN1cCsleOYroHjZGv2MLQ+/XTXSsq
	 FnyYb1ZWbOzEtIDSlJdDjozvvB6HVzKLLsKxt5vvSmo9o4HdcOC9/9nd9KTa1V/XEQg4V
	 mxmY/WtAWN31QWI46Y8sEKEtBf0tWJjjuwsspdqfwY1q7RMFOGzdpJeQZS8bmSCaSj4DD
	 IMIomgzPJxDJxsqSuTkokMbyxawtuDufTyKOynecy2DX+Xj1/MPfnGAMoZ1zxzGIf5rgy
	 bxPlDbud6kPv3uagql+lAR2LGC4PYLx2Chh4amvPVVqDdcUfiHom623t+jOnfCuZxpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
	b=RgIqo62FUuso8nVE082m9DT2orl/YwjhH5bokFFqCARP+R617RYl3twcWdkItie+QOgk
	 D3FHzKg+UO5gL3VARuuy2oItRX5omP+R9ZOaN76za63aVGAk3sas2SKfG6AeTyWaMtROs
	 BlderzphRnf8g912ljpCez/0rjBk8Mf4s5P2u1gCyJh93hR5a1N3O8osroTFe2rn55w2r
	 dywg1/wFuKMdYG+aIddM+B/MZrwJVOtwnEMGcuhATCE2xh3oOTwfa+YaxZ/EPWkwL9TKP
	 VWLLrED67gRLn30BmIaVj1iOtshKyqvpbXt5FBYgGaStDZCXzpRj362ZmtnPqc4p6/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFDWw4Wr;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D1C606A8A3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D1C606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFDWw4Wr
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43bf9548df4so3617318fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446934; x=1795051734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=jFDWw4WrPxHClKnfeQdabp4lVgU07UWkA/iD+88W7dhDW+MLUygP5VZtCO89nkOhj4
         zISRsKGW/l2DutRfuFNw+OVIH1sqHKEqKRcH5tYs0BMWfZp16KUClSxyjuAzWb9VpFxD
         /q4YV5Avcfp0eds/m+bYDoOWIVj1DRRrDFnItXpO9F1ZKL6fAIZZZghW7uQdR4BWUU/X
         VtJCDj9YFFSd7z+HTgW9Wjtxu0McZV/4fYb6i8bpfZpVu35xAGxcJXVHealL1cSmxhf0
         s0iwDtpGdODIeoapWyjCU3ntPJqjxwSjZz9N8YMLhuGr5ApzJ7GBd3QvQOLW9xCUrdHb
         oF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446934; x=1795051734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9P4upm+Ni8SQJ2mP63ZQaekyNScRSvUPOD4xUpurh9U=;
        b=jqO+QprbrvZJAAJDDoJiSAMYowrGGQhZWSbyF9CIUxJwMMw1H1PlT4hYmgWBUdG0c8
         pLc+bPTM3yxBQH7s7RNQPzSyNN6l+lSPTRZoaLic05dC97p5HqUey6t0oJ4TuVUCC+jB
         jemjjzc3Azg+0BI5/zX11W2QTIBCTor85KJkYz6aacKf/aYzhc5Q7yaj4igRuFQwZ35J
         fAxMVunRKtS3qh5ZuTySjW+yUpQCGOa3uCOWlA3+KWZ+G8sLrkQkRsufFpidMd32yFWU
         SNt6wOmCeJPxsEOpneP1gdNy7vEsfNxyh3AtBPDdD/pgt/6BC4WM97gYOCeZx6SqvSk9
         Wd7A==
X-Forwarded-Encrypted: i=1; AL+hErFqHcGEIwdDeYrmrpul3YCx/02tL+ETwrub+rQ52CwI99x4vYX3NndIJ/X1RcXOJQ14c+xm11GW41R5Y9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3fMFzUFBirD8pZ7VZIOl5pU9ks0Zs7SF/n/SGVTIdpz25Qhg4
	CACx5S3Ywm1Kq5qB/LtB2Wfw80WDsFZwDyhDjQOng596MMgWPvWicmlE
X-Gm-Gg: AYBFou21uTZlpz/lpwaxldsgI2fYTY6LrZcfTpDe6DtL50U/2Xf8+c2VNo11mD56qa0
	xHHkfxRNZXY+Jal6Gt3slThxJE1P0hUFWPqcH91F8EMTIn2ZqvsKhnkPpwa2dfTa/xjqPiNrs+U
	IZBUMjkm9zSsNJTcTBxVfnrD5UlfEiYxz0pDHnsLKNXz/0IAZXdxt1x/Hcnjx45cat4csBfb7hp
	j6FJV0M8muzismdkloqCVdBqZxIZm5YCxW4j4Z+U8ygHRJiOZkzuXtTlwv3rbyMTaZHDambrzd+
	GYfAqS9KGpqmRuuzheroRrIkZ/9UEXT8tPCFeRoIqEupg24Z2EirfjC3iilgGscFrOB/bi+8HH8
	nMHbNgEfKGjRLEpDBFLE9L5WnilVnv+F88+i40tCJEBm5/c0rUgBj7JWbtNPKvnn/PjhQ7o0ENN
	flvuHefTAGwUUNm3/NhrnD4fJgebNa7Zlcqu3onRqbi0OfWi2tFletrQX3MLyzSKHRT4LsAVmwZ
	OJYccAnsKg+oIXmaKd30xjKa0Y3kbwKDpDcTfDEJvK1dQNS+EMsHEhS694ftL0OGmGvvrHin8TQ
	s/H4aNE6Gr/jKTQO55FbSsNC43SsLzbNYCXGCROagcVFzjpIl3IVgMV/Hx2xa+ifWDrEFUx9lV+
	ggwiFxnmxbZp+RsvxItHVPFSocJgXfRx99aDPnnHAknogTzrVwdqfECUF6t94tg/87fEjIoxJr0
	FW9aosiY0sjKXoXBMJ0FBY0GmeRjmRQledXAjVyJVZ/D5GBdAH3N4PcjTuDOS1TyhLmG2QogJfj
	w==
X-Received: by 2002:a05:6808:1a09:b0:53a:ad3c:17aa with SMTP id 5614622812f47-56b98620830mr4057105b6e.55.1794446934468;
        Wed, 11 Nov 2026 17:28:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:02 -0700
Subject: [PATCH v3 23/58] mtd: rawnand: ams-delta: retain open-handle state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-23-ce537999741d@gmail.com>
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

