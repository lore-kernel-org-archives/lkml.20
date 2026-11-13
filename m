Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594389;
	b=lxBMT9kfp9Xdq1LhE5iGubUbDW6fXjQ0GFLQ5OaNlhmd5ByaLlTTcYwSwF/0k1TO561i
	 bzsxLWtboA7LF8lGHROEUoRt3ux9q3t+qagKofZp9YKCGt0OWHz2unPax5xCByapU7oj7
	 XSkmjYGLhk6H/4iGBHjxbi6njrVPVRgkhsQQ1X/vDcRwNYcxY5+O+Qv4ml34s3xl+Ttt1
	 mCW4LPYl3prVa0ENcvbtlQpY4Kh9T38Rcmcu/6pnANV2t8XXXhyRfumZvgobt7pT0Wvvc
	 ff+nlGPsPubCcNTJM4Gv3Z4/1Z7HBDB+fL5P/7ecqa5He2NGvkBElgZHDvwBdj+zxZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
	b=n7zO7P16CtTEt1o61Zr8rhRZmzrBFP7Wve8K39QQcmdrojQZAiZ/sUxUqPKMzswAlRSs
	 5GQWQf7cYkpEV5227rCvEEfBRe2gMNc1702P7J3qWfYw4WSXYaoF4LYXyTYxtnhWsBBem
	 7Q/QGUKA71nIwqkvAKZNufgc1MFC6tbeA2mqEW2SSmlaT72OtvxxcxEj0Xx3cIU3w15EB
	 jJsgbkghrOQJHnPS4uZUI5UdPuDSgqe4GKiIyYfenhXez013U7kWSO2Lu7wYoAiZQ3aZ4
	 /CLpKJ5xMlosMZIsPa7P8sphXQuvOHB6Osz6/hkmRsnN/y1UgpSvh5iLf4kZnrlwW0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n3Q3G4Z5;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EDE606FEA8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EDE606FEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n3Q3G4Z5
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-703be215729so427190eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594388; x=1795199188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=n3Q3G4Z5cwIXfg6WKNk5kOmHPKbRGFoMEnKMb6UV0wAdqo6wKUwAJMymip/+Zlzp/Q
         8XpGT35ijKNZlmOFI7buMOejQWLmPIlqvFbsAMbHsrlqmgTv5eiylnsQ15CHL5vEUAog
         gWUovu3SGJX/1iziK1zm+GvDJYhnIVlKcP+5oTssEb2VkwhT3th0pGER4N+yu/sbxu2h
         gOecsdqAnewayvFUiXyYltGwHjky9vol4cz3SnAeJdR416kSgj0zG1kWUrKFd7cbQXhL
         k6gw8dSGbWc8CwgrWJxe8g3UkL3d80BjuHXsCzm32sC4DKlgKESsczba9yJ9kVQdUzyD
         iz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594388; x=1795199188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=etNOjbyXSTs6mt/7MNc5rQ0/EfrFjbBb76HxsI9F9AvM+jinRB9scyrhWURw8y9hQq
         +4MLcSf0aleT/uz/qkr7r59HIhNNZH0ncbGsjHMpQASg+ALPAh4sB73fI8raY262y6zr
         dpK+e38xLF6RelVnKGZTNFhdqmW5cgur4Lb7e6i+KOEwt9w6mW0V412bRU8fNCvtH/tY
         6kkHbB+Mzgv4I9/2GQSZzbYjSO93lMH7f0jSSLEVc8Lb2wWjoNl1Kn0n2BeVR30UTKX8
         N0ztCeCPw++Oar5alMcqgDiN4vOU/ZUiCtWsYNxNqizK4mHhp+VGoA5lMO1mZrtK6WG4
         g2TA==
X-Forwarded-Encrypted: i=1; AL+hErEJ4+JTtl6lRuCjrwTAcXZnRKJOKLcPBZsNUU0I3etqlswNePVG45evqy8p9ZkoJ9t+OL13KT/KMRwlJg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LruswbG3RIAIB4YIMkSQQNY7G0RePYWHALYf7oQxBd60HE4ZD
	mc5tagPElskmzkYH44rcTNWZO6pzJUSwhqtze8gf3nNBgwe04EsYdWCy
X-Gm-Gg: AYBFou1hXXe+hufeLQ+pMtTKYilpJsC/9JmsQRjgEN2A3qzM3VGukLCHJ/A7FllzG2k
	XiIwSNn7LME0DQWvTFBWlm3qaAUVB4yXlktCTK6758esbVJEwfNLuHp2EVPN7slc2BbrENxELLI
	zb1s4DjhNsnMw1c2u4Jn03vcIyl0hrJqpvFOPzJMuAZPNkAps2Nvv+d9EoYzcRa6GJ2jB8l0MjJ
	LziNI0qLdihOWykn2AD060amKKZ51INLingmJHFIN9RILOYMlEKAcFVl6knl/OJEPRcWYDpwc+r
	3G27FZGiAx82xSRR4JAnE8MEqw4psdVTio3L8pIXbSgKb/ulSkuQ96w+sP2n7TwN9n4z5hanJzY
	ZKmNrtNKeXeZPWIRoXXoV3KKd3KH3VvTkebkCmKiA26H8esNyDjCBnGd3LGZJm8TrPTUAZUkiaw
	jxNHYTA7f3GthlDTKwfsvuLlrQNgyYEReTa+Zah1od1jmuGj5QsuCKuAX44KIg4DNreSIoVnvQv
	KRrsQRNjBR1PskF+TXVddcGGvdgh5pzJALf/jKEcpBfLAdZ2fxER7S4pmWAeZHLOfc8xxYtx4et
	zhSKAsV+QGVUPUx+WKvdimiNsCyUoQEN4clBry0PAjGdZF/o5xr1BohEsA/q5PurdzEGgTbr67N
	1YkTIMjkyPPF9mKKwssS9SHeIeZ/sfQG4efgqCObMlutxUY6WyXq4Go+fTGm4wNFIp9A86F9chw
	t0VP2u/qNQY796ZlKr+qo7Y8dsFTEbEHHlmanXB4+/JKYa6tY8X902eFMOfeq2IGjBgUuB4SSf
X-Received: by 2002:a05:6808:19a9:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-56e659263afmr3056003b6e.68.1794594387625;
        Fri, 13 Nov 2026 10:26:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:10 -0700
Subject: [PATCH v4 54/58] mtd: rawnand: fsl_ifc: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-54-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Separate active bank membership from ownership of the shared IFC NAND
controller. Retained chip references keep the controller lock and chip
metadata alive after removal, without retaining hardware mappings.

Disconnect before device-managed resources disappear and drop the shared
controller reference from each chip's final release callback.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 46 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 20ae012adbaa..8b48c94ea8c5 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,6 +40,7 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
+	unsigned int users;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
@@ -961,11 +962,20 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
-{
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
+static DEFINE_MUTEX(fsl_ifc_nand_mutex);
 
-	return 0;
+static void fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
+{
+	struct fsl_ifc_nand_ctrl *ctrl;
+
+	ctrl = container_of(priv->chip.controller, struct fsl_ifc_nand_ctrl, controller);
+	guard(mutex)(&fsl_ifc_nand_mutex);
+	ctrl->chips[priv->bank] = NULL;
+	if (!--ctrl->users) {
+		priv->ctrl->nand = NULL;
+		ifc_nand_ctrl = NULL;
+	}
+	nand_storage_put(&ctrl->controller.storage);
 }
 
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
@@ -981,8 +991,6 @@ static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 	return (cspr & CSPR_BA) == convert_ifc_address(addr);
 }
 
-static DEFINE_MUTEX(fsl_ifc_nand_mutex);
-
 static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
 	struct fsl_ifc_runtime __iomem *ifc;
@@ -1016,30 +1024,35 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
-					     GFP_KERNEL);
+		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
+			kfree(priv);
 			return -ENOMEM;
 		}
 
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
+		nand_storage_init(&ifc_nand_ctrl->controller.storage, ifc_nand_ctrl);
 	} else {
 		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
+		nand_storage_get(&ifc_nand_ctrl->controller.storage);
 	}
+	ifc_nand_ctrl->users++;
 	mutex_unlock(&fsl_ifc_nand_mutex);
 
 	ifc_nand_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
+	priv->chip.controller = &ifc_nand_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &dev->dev;
 	priv->vbase = vbase;
 
@@ -1071,12 +1084,19 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
 		goto err;
+	ret = nand_set_lifetime(&priv->chip, priv);
+	if (ret)
+		goto cleanup_nand;
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_ifc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
 		 (unsigned long long)res->start, priv->bank);
@@ -1087,6 +1107,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	nand_cleanup(&priv->chip);
 err:
 	fsl_ifc_chip_remove(priv);
+	kfree(priv);
 
 	return ret;
 }
@@ -1099,9 +1120,10 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_ifc_chip_remove(priv);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {

-- 
2.53.0

