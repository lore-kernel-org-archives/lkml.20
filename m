Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810645;
	b=zuX4ZvByPvFB5aRacoMLwLTDiHsgOYvndsT6rdlIiOLWFmgAOLWfF654klfFyt/6Z/8i
	 G5pbXQ1SgbUO+SMjGWM1Gv2Qp6rKWOn+YglAz7ELj5HbIz0L3uIaaEI3kUSK8kgS9+uVt
	 cdzRcDZp93l+1OyFFea+TrQvNMhlw4irWw1WwEzYruWiCzqsL+CbM/W6bdRfYvnsZiBvX
	 m0Dif4flkztbqIcBR6/e2PZ6ownl6GRDmp850dF+Rk2SNVtnlIgwA301wUsDgZh+qT/Vf
	 /KD/pU8j8mFdUhvOgZDq31HPVQ124lIh+tq4iiQ234Ecta/FKznDcocAJbycvyUNCVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
	b=y7E1vfVswaEzHUhuKQ15C/F0ycqiH5b//ZQXVw/vgWN5j2qZxDCAOkX7BSYmuWcQHbWE
	 gEJrFHFadtbREoH9XoplW3PVuCDnbRNxHVfWk7CphXqP6fy4qe06S1r/W8M+k4ldg6pSa
	 OEy+urrtlSEfEQXEEkoQfcZ1shSlYaYCR4+w1CYwjzfJ8cSAhGaQMxtzdjJtTAXo09j6u
	 ZXt2BS2rjM8QLZK6H6aUtOKZVfHnTPePgVOXQqNZlV0pMrjo5i66j8QysMVWEJU8J/QJY
	 10dvsPKRGueZCMhOWvB12q23fv2hPxkJPyQglovCjtbJMufDh8HPFMI2Hu5tnx9ul8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsRgxBw6;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C45606D946
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C45606D946
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsRgxBw6
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6ddef424972so3560298eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810643; x=1795415443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=dsRgxBw6yllpvt/Z6nKsorYX5zS8ZHtTV1rndwoLdRVlqATkCxU3ZNhsTeXXs2HSaY
         SLbAf10xV2zlyOm/6t7PnvWKNf1IDadmr8+RAsvVNFa/skS+BT3XQyMIv3l/zTxnpGBH
         l2HegMV4tyDRXKr0Wxx2CTuYFEAvJAfr6eHlq/gpcEr1JqwUM5rjxHIEGbIUDrKILzIN
         yCTqGMfL9vEQ6R9WLBLr1XYkP9oc/dzVd9PQb9kukWTgJ3CdHywtTLWzYRuqm0OtbZAJ
         /fHblgoV72PCU8y+10d4w4wB9E6xayXtc9Io0kE3ojUNJEdOs2mRxRu637EOw74CEp73
         9xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810643; x=1795415443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=f/nB4cdMNf37xp/kwJZjNPvIJu7i8u42gY4gdl2qoXeFSfWwMazQbtCedMzhU6HLqg
         UECRPfdku+xQt8bjol57oU9ZgELoAmbM6pduGUdvg7zXmNC3w8hCYzaQUhWeC43yKDq0
         iGAi7yCO0Am+eN4JNmjZoNJg46b1fL84r7BzKZAyx/AtLZ1rOaV44WpGR8WL9IKROgvF
         OgIH/GFOUt88kqQMxjrzcXOSAiagFo1wd1WncFKdbU2q+dJaZRQ4HR/hIawKl/iXdeYP
         BLMoZ2e911wLDf7nrtF3CeSj4tLnW6+mlfIm2a9Mhz7Ockux6iIIrbtjkbyAQsYywZfM
         DXTQ==
X-Forwarded-Encrypted: i=1; AL+hErHeQ3NUh5/pEeiqw86MCSm6KkK9zBMxUuTf1Qythl8FSVvl/DE5bZMTRChgT13+216IdUzxI8JakJWGo9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZH+zbhfKi70vfx+rB2ogKZ+LvlS2v+HhwHmkozYsuOoMLSpOD
	d/ghYMEeO5z/6cxOh6bg9I7jqGLYGDVB1LNSg80zwY+gFVPNDAriAuoI
X-Gm-Gg: AYBFou14pd7mh6WCrHUN3q5Kko0aaHq/71aeiFgGK1G38lW8xBqVR5HSHede/Vzeyzj
	+vJHgMcXI5Bn9gYvUoclOrzD+qXzFj+FPUg841YxuNty9X4/CwDJ10nO/KbtZ5L6KxqxvBUpU3E
	w+rxdzgF3pkSLnlAX842i0xCnbc7mSUEix0arZAD3Gtsz/T4VWGxjQQ21tl6d4Y9zkpjOWpW8LQ
	fiQpGXF3uyVOI80HUQ7ozpJVQ8ChuRQX93ro2sXWjVQwEnrg9pR/qcUoCHly/nShzo46QGNPbvJ
	stvJFWTuKStM3rEZqgbqLP1Hf2MnTG9sKxTW0GEKwkjLMSsRr9RDI6P/Y5vPhDhQ21KqP/AtyFL
	uw2GssXSyFlHr9ngg2w0VU/i/MJxGTomEnsTUMLUl1fWHgZUrpOtSQ3MttinOBtOA/mPvsq7dve
	Dk3fIwnWSo0n1uczIvJvWi+SKiDP6BLJye6vS/A+RMAqsLm2V2mYAQM8Qs6VmSrNMo0BU94Z5mu
	7PoL6fhIKfcaJG987QqmDqcFDyoCkCH1i5l63j9zids7L8w6pab/El0eO1pNTkqm1yTJiLFK6Qx
	3OkOSOCi1BaEAxf+vGKrr4hy+zWioCTOVpQmw5RIysZ5ftEIhEz2zmN2zUCpx3bfNMkNbaZABt2
	EZHkRcuBE8jKoet27/WwAhwCFqsaeruNg1SbLmRqOKa9g+OMPUm1XMuc2AmC4oclULgVnN/YhK2
	7fGe4BnrAO0mtqwCFKGHNs/FLiYJbhsG+iGxVOD7vFSI+iohht6hYP
X-Received: by 2002:a05:6820:83da:10b0:71a:f498:3048 with SMTP id 006d021491bc7-71af49844e7mr874342eaf.25.1794810643627;
        Sun, 15 Nov 2026 22:30:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:03 -0700
Subject: [PATCH v5 48/58] mtd: rawnand: ndfc: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-48-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index ce10fc6a41aa..27ab5c034e70 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,7 +171,16 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
@@ -187,11 +194,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +209,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +254,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0

