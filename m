Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593782;
	b=Bk1tbBbDZQLZYXgF2h9aY8HxpqT/OiIIvFXV8bL208J8KGudiiKGBB8B9ONWyrfTxSoa
	 1dOFPFJq4el4QBGmHkW1vs0qoYqYT5GYz1nion/AEsBHkqUEJLbhW9DwF44899p1xEdrn
	 aSXGbewxLqk/S/p9O7oWj/5OKyKHeCtLI1VeRkINy4iNjQCjz33YKVhp0KQqROnKVna6k
	 +y0Z3HHdD9lC4aAWjV50dQ38E4ahG15nyf4RdiNgzJ3q+fcyELFL25IoenLurB2J7FXKz
	 htp0K5aUomoyZ1tdNkbt8MIonCNcaIW/KUmTYhpgaWVUEb45hmlPFU/HyR5ipHVliGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
	b=ks1gOzkhqkZgJlH7HpdWWqs2ZuBiY6GhzBILG4Nxgm923Ru6x3ddDUhImX2aIJBEg7+I
	 Zlt1cUusB9sB2BRnYkbuuvvZxTMZ5FK82vVxu5PNcLg4zp7adsNC8jYeY9cQCSwboS8Hd
	 4LJKClFK0Xs0GaYKVcD78SQiPmVuegQd3gMkMThjt8RFn6GKP06vVEi6RHXrjaJJ9zF63
	 YNTUXfviyPgM5B+vOuYL4o2HVrg4+UhWrX8SeVRXlHpXQP65eRu//46U78ObGVnCTcxIF
	 IVNf7QUbl1Ec3x1qONICtmHhP9GAb8tRmSRJTQgEioWJgcEIcvZBjwy1pF5JKBT28Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEgif+0i;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE48A60A383D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE48A60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEgif+0i
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8490a7d6696so1580960a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593781; x=1795198581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=zEgif+0iEDmfvuq5M/rIMmyD+1W2wxQgcYXbIJoHyrNVlwGuD9G8Rzf5Vv0gRYNGsn
         9vfps4PQa1v+f6NvQrGJf2zOf14BpG+bb/ZtguELU186eBaE7IBSFTAJ0LWRGcCh1YiW
         7TMOvmO+sQCq4K1F0Hc35NLahbf+TLGBcynkX4MzOmJFo6cR/5Ey0VxnHwWL8Gb9eOV9
         WBvnuokwFsMmmzpoEFD8FDrsP65wN/SMeOU2wKDLp2Rq8TkajGALXr7HXDL7G0oIngRj
         D9Xtzov6Yfz0W+mnHs70t03ykIwKvvVQLn6aQ4ckT5/IA4v3AY4CaxvADkt6QE6I7y9g
         299Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593781; x=1795198581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=YmzSrfTGneVan+VJJPwGc1BhIksw5L0h9PnA4ZiL4BikXblXNRNSpaeCJQbxjSkZ7/
         j/gcOdYKQwrj/sSvYBoRM5U+mEzlRgYuKkcAjI/N0tPTs5M3bRiOzP5WQ0FUQQEWp8Nj
         C+EIrZGRtntZWRxN32Bb+xR0f4kb+GFfJn3GbAETzTZpYvlkLvnpLfX+4HV6FGeICH2Z
         t/Uv0CIWEBauMT23teoowMXAxHWjW+6uq7Tl2YjioXFwa/eTEngfWSsNwvxf14JyuuVF
         vNBF+3r5bB2TIEQOd3p6rNvPqbu3tX0ppNdQk29B0yGZ6JFMm1rVlnjD9ZrF0Db1xJfR
         BK/w==
X-Forwarded-Encrypted: i=1; AL+hErFOu9AG7IJLkVCFDJFirlb2Evfv7T9Nc4S8Lm1L5DSyL39CLIiNj0YRog+xeW6aCiaMWWc/681+UWZ7jR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C0FaU+zqKkb/SCe5OiFvSx9SSi5Ykia/dmjXxl+6B4tXNLu+7
	tVrk4u2y/a2AWrSgYmOgTMd1DAiUR8qeD2QNZyHEDk4zqWyUn8F6TOa+NAdagAn2
X-Gm-Gg: AYBFou2tb0HKrBTaGBnYUuKZVfMCTyXH5VaSW4Hfa00lXoqfsisTgEBAe5KQRu5arBv
	l3NxacxNxON5+76vgQbbPVVFNZZQVF1Lh6loGvKHOj9Xua8uYr0dbnP+nd+eBJ9KrUg1Wt7nmq+
	9/NVQi4wpccY/K4jTwB9C5fn73CMLl1jabdpnSrHY68t2vTeF2EFCI4UNEJAbE9xz7ZSr31wR11
	ccmSyqSMdu1j8ql5tSGBhTD0SXwSs92uCCtFSkcCSS+cd+fpOpbOvIGFdTHN/QOz8Tq+zA37HYc
	ivfL9qm9d/lyPtcIlpAROCJQsv5sM/ZTeD/vlwR9l4HF/YvqK5GO7a3MATyPXq0FLSubNZTuzQx
	YS+qXITwbRHdzUdApTzEBXwzdH81MLgai3aNx60AsUP+dKxrCZr1bGEQlFb/wlJpHZDj7I3d0mG
	WiRbQQW9UrnvXjIu97jDy1lP9E9vUY+t6hN7Nenu1Q3G4tMtJL1VUKSEYBrjE3fneOBvQZdYtUF
	BEuOIMDk/Omx1Kntq1BWCUuDUrcWeGW73c/NEzgYCodtgQrNLvW2lJawhizFyYd3qH7BGLffm9p
	0luOmuE8pPn4eWWhrzno+GSsNJADc4BEpd6PXcQUBWxGDOUgyqzDiIj8kzkECRMtAhYIJ6wnRKo
	ppQFBcgw6l1e5G0evzBjbPR3PXaf5/8nmXK7J8hkE0U4T5bQzJriF75u2ZXRbaStXx5GL4nQmEi
	dvP8gzflVUTOw56wY6aB1gHbDrwkGxNEp4c5wZnTC+JWFZoMYKogA=
X-Received: by 2002:a05:6830:7183:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-8628981220cmr2350104a34.8.1794593780921;
        Fri, 13 Nov 2026 10:16:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:59 -0700
Subject: [PATCH v4 43/58] mtd: rawnand: sharpsl: retain chip state across
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-43-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

