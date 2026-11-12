Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446954;
	b=yIEsyNjC16DAxpc/pGRmm9cnM4E86tJ0KDYX+B6LLBpc7+cqPNFb/vlEgz2lQO6hmYt5
	 s4/pfsjtC5B12d0Tu0ZPspas4IuW2cv2jU3ZnGV264NxkUKso8dcIc/FgEr9w5gc0lOdj
	 W0VanGJ7KaYzLMiSIiY7VlK9Aw3SvVDpVznt1gpd5luvJBZcWdoExIUYuXlS4WyTOBOQm
	 NDTYYxFRRse7pUGMObcnH+K6KShe0DQD9mvv6benOrsUzaNUUTJeooavlkEp56iss9Jse
	 mpomnSxLxtyLqkkzZ1irb1CuLkQ6/Xk1E9HTRplopKMPce+mpRK0KY/m9jqnXC3f6Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
	b=5XXiqF77REbP0UiROxDrIAG3vhqZ+bkP/4mE8EleozIZTUSdifQB+vOzxEMYSaQXsx6K
	 1+R0SLFke/VpXNaA8xEGDjgNZxJSuyLBrJOF/yktCeXpFvvg1ipuCmV0M/g6yPBMo/FNy
	 AkYDR2JObT5l7HD91NOpF/lH7yoUEwaCqBwYd+463sGj/9voVmptlgLfZ9UAvb0kOeBNH
	 QvqZpGZqnOKmuS9p51XRO5iMoHNzCpODD5+fXrsAMt5ZvcKy042OqDw3Z3oatsslaZrx9
	 0Mr6y06M3JHErJy7iKnA7xBsirwH4tRZCmmzsMiaNmAb87x0aFPvD59ARzIRMV+MHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=furKdid9;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242E606AD76
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0242E606AD76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=furKdid9
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53ec92375d2so1479242b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446953; x=1795051753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=furKdid9gKatLvIl+0r+iFJ9vVohMkMPIgYDygevpIb8hLRI4LWTUWAGk33rmZFRJb
         3tCsLmAsR9C6nevsG7ilFko5pxFZjPuqwQp5mUgeUepGXkIfeJskrQhBOUGGRrpSxros
         w3GoFfbmNVhfDtS6vPZOjNCk02MqRunyGEvRD4NzvegSSA002+DeBYKU/eJKz3TDlRe0
         cTT3pTmIekoQ+ZpF4YJQfw/LveJ792jHCMr2ReY8D/M8ctLyQwD2dbWask3Dz7C4IbuV
         9Z0PwAB5jhZTjaRIG9Kyl1UStcDgcZa1GTreIq4NEzABoEJdMnasRoGt3fOTZNWIWWiO
         u5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446953; x=1795051753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=NdnJmLrjOELt7LLQGIgOZ5b1gVnPLbQKkcPUQhnKcuPzz3cYcJ0+XRMN8Ydzbv0wJH
         OuqGR6T81KIvETbumqQHYtmB3uqBhWMcAYuwmjEE4i/mCijTeN62vx2w0BqB+7X1MCeg
         kkCMaQCnIS8lTJNfKwhjNPMeHhJYlb0FXJXe5ZSqmp5U5eZmBz+B4zNqha8yb/cPag6B
         jTLP6dnj1AZclWWyE8jKQnhJ/CmnfiIz1aDBn6k7Rr1DRfIN7yvkUN80Ff81rORjSviT
         Uuf4rmzBCUZzCroeiT+yT3CzAeBkXPQcDWXY7C13ugfad7u5Yj47c6dffn5/sYhpR58B
         cjog==
X-Forwarded-Encrypted: i=1; AL+hErHsUGQAAJ3KqXJU27ct7JHX6/V6Wy3ihUnNzoHoGVuesQMIYBJKU+LeHExtyKerHGw8LuGRw12RZAU5iuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DHOilOcZ28Cqj/uwWOH3LadxraUcAu/kND/PgqTVcFpwUzvB5
	j5yz4E/uwD7XNqWHXDVCJot+Xew+WAiCMUiMw5XpiuGBYZu4mRShKVG898XjF6F2
X-Gm-Gg: AYBFou0d9c69iEXzEduEBV+mq0amUAB9jBtQv/+LArjApgX21ofRzLNfs8OIVn4NvP/
	+x49Xr+DHFXNWBWjX6IBm+tRvcieXI3l8ZK7MxKS3/wJbMjKUgAGLaV3p31fouBUVNYz31i8D19
	7lxbITKcvMzTcHHx75jXhlyirwt5ivvFHydOkW37JkIhL9dhUyEf5nV3r1w0vf0pWYzRcHBVE8H
	JNmNUX6R+6B5lIgD7y7ZgxvOGz/uo14isSHc53uILuFiZypNRDXFr0joDyTTj5duztRupv6Cek5
	pDxY3YVk/abOaOxnuncJmM/b4ELBuAZe/pzdfEG/DRjF8FY3ZT7Bz2/w0T+ZV6vLrWDvuA41467
	PSFgOX29qT+FO9lnihBD3O4yi91snl2chLL73eYMLZAbjH6718/rpI2TLPObwQtrD1pkl+j/cdg
	N0CH/6IynC+Xja7v0xaFqQ3ljqmQmMSU8B3SLBiwNfpmPXFQsZdgnOqtWJGbXPgRVV3FNoEdPsO
	tIT6cf6yRPQuNVsnGtk/7LhDZ7pX2klX7lMR1lbcRnhyqdEFFS0tCNVm4ZzyDm3hby8j7Mr702b
	uhaKw5sTB0Hz9+daEOlylN5gHUR1TWDnjbZgHBUBqNaZ7KJrPjPZAdms/348N4VMh76krUS1a3U
	3zGuuZI/lMsXfXH0oc90PkCp5E1cqcUQ2VsQQaBJMkL7xHe0taQOQ6459x8FVOEDR0t58Ihhqwd
	eWY+A8u7RtLQ/Es5VfOpHzWQkirTIiRDZFp1P7HmjKnVF6k9eIIDzS
X-Received: by 2002:a05:6808:6f88:b0:568:e5e:8058 with SMTP id 5614622812f47-56b968d73c9mr3832839b6e.19.1794446952920;
        Wed, 11 Nov 2026 17:29:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:19 -0700
Subject: [PATCH v3 40/58] mtd: rawnand: cafe: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-40-ce537999741d@gmail.com>
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

Free DMA memory in the synchronous NAND detach callback while the PCI
resources are available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index e936c9807bf8..be29e78d6408 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -683,6 +683,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->parent_dev = &pdev->dev;
@@ -693,7 +697,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +789,15 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +811,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +824,16 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int ret;
 
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_disconnect(chip);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-	ret = mtd_device_unregister(mtd);
-	WARN_ON(ret);
-	nand_cleanup(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 	pci_disable_device(pdev);
+	mtd_put_master(mtd);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {

-- 
2.53.0

