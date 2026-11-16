Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810639;
	b=cHGYPG8zkzxNwE9TXblh0eKpXTm2iZKtdUvQ1HrKsSd0UdrFqoZsuLo7JJZQ3kOaIisM
	 /jMjAFz5gbcVoHq/0GyO0G1btvbWHCvzHwHIXmroVQnLpzYPM1ANYMrHYawgt52bVlqcf
	 F+paGRX5JybBOobmo/QuoC7pTuGGnrHnoLiifL79sSssDkl0AHhxnV2mlNUewzh9VD/3H
	 MUzeukAlxUhRyec0sSqzUNh9RNqbUrE8W+IoL1Na2UkdiVS+dn0wIup4VEzY+ar7MPLkC
	 uQZqSxDSYgS2Pr2p54PUhWRdS3MLhDVYdcWucTn57/eiUrX8aNOfBFQsyZ+Jbgi7thg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
	b=XWgdSFSEmHDgRtq1mQa/rQPlSPOPzSNi5G4ZnjHypzQOC+0/omt0obB7gG3Yia8yKnb1
	 a+aIzTf7qEy37tDMFq4Mz1A+a/LcX4W1LG5b0gV4xJSg3bOQrOIGSwowHy1cCKowS1KbB
	 KlhDJcrL1E1xng6D2LpfzPQz5rwku+dMFhuu4cf9U8s6tsYthikl4vkjn6sAzWk09cpaw
	 8Swk9v0RG7iy9xw9hBggUj7AtyMscyF/l21b82ylIAKj+VdHLUAJ8eTh44i333E+tNm0z
	 eWf/MbIjEwBw0YxNYD2yc4DKsZSEXVdkZ9JVYUMJdLjfm71xwryshXSmKcHAWbcv7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Evxr6fSz;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB65606C208
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AB65606C208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Evxr6fSz
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1afdf5196so1046801eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810638; x=1795415438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=Evxr6fSzEqwU51gdU5nvtzxZ+qUXwyAUAKrH7Rf6l46WYbgVMWt63C5Y6HchXh5vuH
         bqQJsHxpyswYVfGjTp9HfiOMLUt5aH1KA4WO3xyFfW9FHkJD5u0K8ADogATILisY0tE2
         9SLY2TsNIbnVkd6iCa5/d6VF18fkwFc8QRV3bs7/Y118KPGwYs7FHKJp9wRlQFqOy4KY
         +pfH1fgIIww8HentnG8UPk5aVv1zYW/hKeMmDWCofdHxxI1EfsjFdj1bWJhX02gypENX
         mwumXyb3wWj5cHQnWrDEZ0Fmv1QCfY5IAksuKh7utQ0sguN2jSWLuHa0KWxA6Lo9FZr0
         kJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810638; x=1795415438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=vL6npJrYXsXoUpY7u0CifkWItOwyfu9Hmp9y07dJ+UeAAAYG/97h//fnBDCgtd9fvD
         dZw4/73VTtSP0w3ornG/nQAPS9wtCp7XuTnSnT7RuLOrKcivLFAsqXTdAEIglYsyg12O
         pxWMAP1JlYro7PZOha9eu5eeyQqg2J35+3Mb4aH6Hkr63WtIJPXpj7eZH2TO8doUqEdA
         71Ns6xPF0CY271WrCorEzOU7ti6N2g35T+dkEL+CGROHpQU9CgkE6Juiigtnm5+Mjm+i
         mVajrdLUtiTf+UjOot4H8f1TwUuYxE4WL7wASxCG5kI3523w0bVVdru+z276EUk3KY3J
         C+bg==
X-Forwarded-Encrypted: i=1; AL+hErGDelgRgYWY9dpJHoSSDqb7odqbcukNU7FKl/15g/MYKGUMgtM2VC8YQKLRdovDVL6L8PqEXQFocRWlJ0Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ds1zZCL/lcUzP3gqTu+etgKlqTPEHeLkzYhHiw4bDEw/Wm+NE
	ICWt4mzxxZIVrAHSTjZlxmJ+K7Zd0COA1fWSEB3PylLCU1/YkqCAxtoL
X-Gm-Gg: AYBFou2gKFB85cyVSzA9gqnShpsrvELhmLDoRusDGyalk4MuYsLZqV5CYLsgh+C/RZ6
	rJGFtgpEuvbj7E/sxQq9o8D+FbWAm5Tb1m1PnPxsyYU7qx+jFNlFpFn+fPjhcPCF4Vl9NcdYNV4
	2xZ/h7xow1BHg0C08uzfDD7ARP0QpPS4V1hRQI4kjYSgB1VDTSLJImiimccNXejZxPBobz5TKo+
	3jP3xYnD1T2xq9ywS5LPktqNRe4ZsZ8hfKcrCgqBIGP01SKT+c4RPQqn50iux/Pw0cW3fMh21fp
	azWGGcBYqK/BTUpoUFWc2waff7pWFhd9jdQfbUjsHHLwoG4NuSlvtS0Xh1YANdPzGLvKCdgrBqQ
	dlLUGzVl/PCEP74ZVSIRu+7yV5hKLC5FATQeic+rOk+ULjwLO6XU1SoaGt73QWKXENVgjv6W5pB
	xPeXpN6iZdi+1j0GRD/xksuGkYTFYAAaCUctK5wmEUZBMAcdTumrmIHyqe2NAc/6DBowZV06dID
	1nxKkeoWm7TR/wtUSBXrr1tqBUl46fFWO8X9AHFlY283k8kwP0EytovNOI6iwvxluoQzEU/FyYt
	TQ1hS0zaxg7caMwll91zDRFsbE9XMgd+MQWpYOmliLhyKAS9Y4ZVksgwbToD6f+Ci2vkbwKsSrQ
	AkkvQi27MEDPyAcoEhQ5ZBmoCFbpobnSwAXaigO4eLCwalFpjIw/7ItBrOVE6cd35qzINdlY/lq
	luS8s3sMLcDkqoBhOCVRpsZdlskYP5unDVeePhRK5gcHjxJp5Qy5sjlxqO4mAEZkUdsxSA8EQbu
	g==
X-Received: by 2002:a05:6820:a28c:20b0:71a:d99b:e86e with SMTP id 006d021491bc7-71ad99bf189mr2185125eaf.36.1794810638249;
        Sun, 15 Nov 2026 22:30:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:58 -0700
Subject: [PATCH v5 43/58] mtd: rawnand: sharpsl: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-43-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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

