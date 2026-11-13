Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594383;
	b=vX+BJj04GHdRVGfnvm70juvgdAL6IJWa/MPz9LWDRAg9fMBgkcyADJaZtFEhs4MGUSn7
	 38GH/51GpCJXpRC1nZ08j2J2MkLNDhLeWXdEEFBC42AxIlKwwe6rWV1Dm4QuWVB6ceLGL
	 dE6Ml2OvSxXCOqUVQp6EvauDi5EKAXcCP7SViIWJqu1jytPUs9P1hQ1tg9u6hK+iqXBm5
	 1zvQddZ+9NoBzCgtyscEPEu4NAtHxh4EVOfbNA5+XoY/TkYz/mBT8s0jfIxiWcMyOM4fg
	 y5FCtsZ555G6YMMimDm9QetHkvX4Cr1cWj609m+E6UQJFl8Dl1l23JXuXlCmAjyALKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
	b=aFXMdAZP0T8LSkLZ0/W+2z42vfM/6+vDETNflcx2klOalsKS/IT+9i/ccz8HZJ3zgDXY
	 glmXkfA3qth1YaB1f75E9KP7Nj7j7heY8Dtl5IhpmQVLK/94JWbeM6pCtQ5GDkMbSyCrD
	 VIZVw9b/fXReI/nzEHIPYK2ixPc5ZsXEviUTtr6ni7PZiulqQ8Q5926wh5Dee62a8yo2r
	 QanPjGVsxHJ7O5LrfIIfsZKIzKX41Qcsoe41l3JfGNtTLzH+wZuIWws4V4x1DfpEtCuBr
	 Y8Uj+Xyk8X96ngZ8RaFKMavC9fkDGL1YqOH2i2uXDfUjPjFfrjAYSGvXZD1mO9EceKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+svg5p+;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511FE606A89A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 511FE606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+svg5p+
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-48ed188ee81so1418176fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594382; x=1795199182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=u+svg5p+DILmumlCcpUCkxRLK68W4xmperkJzfOOq5V0eH8RboFo+fZXFIKPcIWGj2
         o1KtDx7lKmyqoa8RHaVHs6eEAC6ttB+t0BUB//ubXLrq4x4VS4bbIR5XOU1UfYkH6KOY
         +lesco84olacW8hnOOmPi+IWdqCpC4diTTjR7jogQNeIXjyQBLUXpkPPI3wETICFk54P
         ali48GyC34ev0e+VAnlnWVxP9cLJ1p0auT1A5zxzpEAu7WlW+ftWBMpif2664HLSiBIe
         3rynX3+7tqKTJdWG/oUF2NWlqdwFatk4iS2dA4RxQnML1Zem992xRZcDqNHxSQInZDZi
         PlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594382; x=1795199182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lDqHgKMjmH2LY5NTXTlzJvA5Ze9u2ECkRMDQtiflIY=;
        b=bX284tUB74Sn+e4/HOhiMrgGplVxWsdH9vDvm3Q1z9m2mA8NMFJWlbYe99gqJRzNj4
         holvt/GCoHIc3kJCHJmjgbFHDQHhrcx8pzJ0xeqRD83CoOljB08ctEE6vTvukQLLwCMX
         cyVHWNDqRGLwDs7Q4svyS/1tODzcmRHO1DXbJI4ooLPrzTnc9+RfweCH5Pdo3l7idIDQ
         Pn+4wdf5daPxo3q0WupSFOLz81BDTdw1KnKi0GwJEIfEuvtNB7wkNEY8MaR4gJ291JKv
         1uAi3N+yuVwkFiudVPq5QR6CF2P/IQwPGKUiPgUderDesn8Ts0XveDdw+hVxi90Jv1Wq
         RdgA==
X-Forwarded-Encrypted: i=1; AL+hErHL7+8yncE0GfXLj1IpIveqljBErifpsJjArJfziTw1TSo8eMQwU+lcFyr2aDQNZz1CUCrCT6KkyNazwpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VacPOE6HAKg5Ixof2SHT3EjMSwLjkO1kfPmaUq25XnM+/MfKL
	N3NfifgRGEhU7nKkgchZsKPruYniBdrG8E04B+Jkij+ZgqIn3uv2/OpB
X-Gm-Gg: AYBFou1XPrZGpjsFevhaOGVkg2rQbj5q9SByq8lyKtRr9GZf7x5Nr9IwbPjQpF+7qgJ
	BMb4u5/6r+tYEq8HP33ShOxU0eXobWZTTWXcg+Dkxmb3xNbP3MaGjeB/yfchh1/RznwsC3fxUVz
	Z1mEB9K+Ejpy/8suzacZQ0WAKYfO7Bf6HrSkRIFI9yJ4XE4FCwpEHRP/GLfEl8YF2A2Xkp44wow
	BTqQlcEyEiQA6/G2ybt1/wga4CCoKFTroCuEybDLBfsugYucoSTwDt9ZN6sgWNRQD3zNQr5lgqY
	P38FqJSts8rtEseg2mylNDmHoSci6VEDp6sF7P2XQQpOgfdGtACOy+DxG21WSPi1IUQV/pq29Sb
	yb8+NsVS19F6Pzcd9UjAuPLoge4HB2+lerITr+GioaOMlbAZwnDTbSFuLZCj26XpbZs5Ok63uDL
	ReXwNaJ76J4zfft8dB0zbpexmHBUn/JDWkrVjZLUbc+iA84kZ/aeA8XIAaO3KVBDaIONfiON7Vb
	NpK7xlYmoA0ZJ+OGTkn/RaJiAaGL0lj5Sjn6UXhOXaIeD7WpSH983uk0yzTiLGG5lICtSAJrBzh
	srnrzBdNNMiHyvcJi/+rDUlL3Rx9g3Gv6C0X4DygtXhO75QX9m/CzJ6eAsl3s2ARDv0x9hn6jc4
	/GrjBtrxO8NAMonnIBomAtjtLWAwV7MCuMnbvH0wnajpP+OtUmPLutZABATOFDTY3mhTo5wU2hH
	E8QJNmgdRQYHYtksuCBjdZW1rY8raXd25pfY/Df+0/75Wi2cDJwRO5G6CfZUXNWi4V6EokzlfX0
	Q==
X-Received: by 2002:a05:6871:440b:b0:4a6:9c12:94f0 with SMTP id 586e51a60fabf-4afdf1714a3mr3190315fac.4.1794594382251;
        Fri, 13 Nov 2026 10:26:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:08 -0700
Subject: [PATCH v4 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-52-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4cccf00f67f7..fac96ec596bc 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -26,9 +26,13 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller, b47n);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +52,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_lifetime(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +76,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0

