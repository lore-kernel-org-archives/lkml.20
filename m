Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446957;
	b=c6tWvAqN+UrJ/4FCemzfCObscDkaPiYzthS9+ePS9q0aRqsnkPk+7ZruFyBc25/vT8Jm
	 2JVVZ4+LTDMPrU9fH0nHLUAUTLYgDFfOZj7bhCiKI5n4oDLFN42DkANW2wj3Vg6gBzRD3
	 2PDW72QTqr+/+vwqkgcaeOT/WjNiofebz4ZD3/MQ2Zo3sV4PYc16HS5zlWOn4T495ncDL
	 MasRP8Z/YWQ4sBNYdoYo2AIvgdMcsGrw1KxqIyCVvU0I3BKjZnfnxiK0N5n/YzuS2D4Zt
	 1quuXmLnxtVY2snqU0HEWkMhA6sbLnKxCZVCnacsgxf4tIavFcnO1+NUulTLols4hXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
	b=3uhMVHqsdTKwfnZlnpTToSmwk/y0Gh8pkelIjPw0vMfb5aN0Ps2ZJxWh+2UBYw2r7Fab
	 jwCg/tOyJ7M6ZhrrsdBGM/GjyCHVHNkC7d4PbKrxrljMe9++CtNQd1kpuj6uQU2gi8YLd
	 weOTRLmz0bVUHsT2f2i7xN0peTGVHKFC/TpwtuKbuDj68URSBXI6QnG7t/Ve6UQjToWgf
	 VKJj4tW4lRVHfzZWSrkDTLPC12TnU6rhvLqUWSRL5xteAlof6THFynIcLjIsAmEmrFOsQ
	 P1mG5vB/bmnPDeMAkGma2CLTZWDh3kz76B0XGJPxset8ZbJAGcrTscaZ39uGbjnTOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/4b0/H7";
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074456070214
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074456070214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/4b0/H7
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4b28d7c729fso2411251b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446956; x=1795051756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=x/4b0/H7VwEkMwN88xcoQCN1KFZpSOjLAcjm33+a3mB6H3x1n6lYZ/SdTsy/LZG3Pa
         XA9yRuLvAsRSR1Kiq1Eh/XUgd7JsEW+jr1yWP3ZiaLvlMTcCG6QxiFwJEcMhlsAW78aF
         oIbHxJ8qfgxa6+TRAu308gy5PhUhdUMNjyG5Iu8rU1nXp6R4saoWjj9PUrpb3qaky11i
         AhGLSH4qwRjMZZ27o53F5mGYKWxP+CJJtXMd//bVvM19zpmb8MT8mOOjdUJDxQsEggE4
         5XNI3LrLKWCJQZWtO2mIOVJbYC6Yqfe4bnHKJYXE0pgJAT8s1GTLfYcTFZ3c8FksX03k
         pvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446956; x=1795051756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=vAzQ6xUbF1e1oJjxuNCz1FX9J0nczuXqJPzNXStDrU2MOzeEavQ2E4p+iyUfhcJYi1
         QIbxEtvrDkDiBKZRjC2niA0jwObPdxPJd85NmrZOwEx+DwH6tB84/XL0BEt3n06LGfN3
         D3FSPJ6vmVEd1n7ZNmFw0DEfwpi3TIpUPhDH08cq3inwmrlX58zvzhJ13NvOXH4w5WUW
         LcnEgbazqiOLwu9n6HxeZmhW5HGHYKhdyoja3Lxqtd8SQXomiQ+bTI1x/8Ys8WmRo8wg
         GvwOjY/ARYhofbVJ559acWnz6xMQhAU0ldBrpLY58yDPyjToYf7C/2DnZUPsWS1IgSkV
         zrjA==
X-Forwarded-Encrypted: i=1; AL+hErEvP4enKMdMACoBJ2//8h1ofBf9jZk5pyuduTEcn7s4apVdbiV+yZTOyV1aQgMH/FoDoOg0v0LIMuEkm0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l30VhDfebPToAVCh2p4kDIPlAOVYrtWV3CuZYKq2XZgzqBw4r
	6skxQunHpto5GrCJqg6J66bpxbuggd+x/ImpTTd8y/Y0XOrwOlLvjIec
X-Gm-Gg: AYBFou3Xk6ZoS+SPsWNtUUeVnFJMlOrpEP7l7sdWNiwhE8esaq0uywmmrmSLm+kWsxl
	c2izlREWBgVvJNpKHiogRfNARYpEQQkIuMOPKov6lRb0G5IyljABcFhzU+z4zaFsYnJPqMUjarH
	Pcq5xDILg6f/XS4IrF/FmVrVDH7qyPqbxMYp+GKMAOTXnVyA0uw4ni2smUtEFcYcuRGuIYlZE7x
	I0iVaLvtXIbjUCmJ20TAc7disikL3OZ5VH8Auhq2JRlmobqpCsHCc56920xsGLX48IymtAQNsSH
	jgKEo2EFUdSFtMtN0Vtw43wBKXLHLXyW9ozelUnV3WPxDSnwVFgeeUHGsO9l+0tkdVgqlfy2uFm
	9zeGVbyTQHAXUN35FnyTM2a6GXrTt+G9yTgtoZNA2MrhyDEm67XIutlwR0sMLeBEL0ctX74WNW8
	RV60i6WkAWI+3BV0PUUHLRWTp8jAqDdimribwohIGQlKmLUxtemhx44fOwR0lwg2guc2AnUkwQd
	MPCgSNnxdyMs6mlTWANPDbiNqTxpFealIyY37vnt+OD6X6+cIVz1bYDRjKtvKRZYfTOkQgiTexp
	4BoUdvVvqRHaEIyJgvjEFgNU+qG6u47Sxyh7qwcx0luB+AhQFIcs2dG+HMYWxv7le79Kx02Jt3N
	m5sFmvi5OqapkDj39ifLSd7aEbusnPMQgMEX7K8Co/cSZImQlsPw4A361UDaWjzj+OzI9BM85rv
	yfjDHm6txYSLwv8M7iZ7SmvyMQxxB28by5ZZnj1vdmfUwlj7VvsCNFJEVysZ8BvACfNm2Z8RH8l
	Q==
X-Received: by 2002:a05:6808:c12a:b0:4f4:4eef:52cc with SMTP id 5614622812f47-56b97717f4emr3823958b6e.43.1794446955801;
        Wed, 11 Nov 2026 17:29:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:22 -0700
Subject: [PATCH v3 43/58] mtd: rawnand: sharpsl: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-43-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 5aea5afd480e..8376ac823c98 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -135,6 +135,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +157,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +190,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +211,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +228,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0

