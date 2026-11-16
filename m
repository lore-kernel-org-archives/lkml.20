Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810636;
	b=HzHrfM+e7sQQ3++/+mizaDCiQFczRRj2kelA2NWdUDkAiFgaYJZr7M4wo7NiIOxEeHo0
	 +Tlq4te4hNcSe5fzp8No1x2lMGk2d6GcY+3bIAZxp77ab7ZBrEH4ChIVSdRwTLfMFLrUz
	 uWnQ/vqmvUtdAPRsg81rk9GlGWtiObz0Oi6b2qxJru/TEGnyTHsA82+LsKK/IcH8xqBmY
	 3STUWQ4J3KudA+9MetAFIs9iQadPFtmLIDSluxGmjHe1E6mWNppTA6197+JDlSxe+VXX2
	 x64TKqkBnG+QMDlrfEqsZlNzcyMY5nZDyvO4iBYl9NgUtMqzA0SYPEfJOgr4q3zVDAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
	b=rruNjkUM8cP5EvWKqzVTOgH4Wacxyvlh2asaEjrDgd4T9A6+oEd8zXxYZfqjaYViwRFo
	 uYnVhKsFhmuAtkrQBoLcqlJhUeV7eumrAij2n7u6ttqKtL7JMyZzP1jNaQuLLq2zgOll6
	 gId3pNbjF5djpxSd41H46JTNlQMURG1qfGup+NSEOBkWhvBvIRQKM+pgxkdoNY1hF8Ijf
	 0jn8mClEJJMZrqqcn8WSjQuFZ3abE7TEInhK23r+yfvMWd/OgBNHmezbm85Ar71EkvxPE
	 ukporWuopckGmH+WWXbyd+jlCCeawiZ4O9LkDJfdfzOsSUpptkfOvbbhb+F+v09mrsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzYoKKwx;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE447606B5EC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE447606B5EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzYoKKwx
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-7190d9bdb2cso2620193eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810635; x=1795415435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=IzYoKKwxG/fdwTONVlnbCWkeRGvSX7FJEQZBzdTXo6SRE8aO0QhJ5pI8m+x+6kzKzE
         IXoqQNjqG8QLJM7sP/59AFebueZZuQq5evEJgD2l3swKs4V2EamXCONf+Ioe1Xe+MkKs
         /a3TaAcpmm/fZa6w1phLM2sT/8tu1aVUlPYXoNQzZYcLcr7JdKKG4X8z/PVZ2Bs+bJc6
         2FJ1m42ffH92Yfeahm/hoZ61EFTUgFIniBQFS7F6lUCfyZQojPANEkSMFhNPv6M3mRb4
         HYKxJKhAL1/E1SiI1CSa3DQTeaqeC3C0rhq7/ajTSpfyxAEdUDEqL5kLE5Lx6LzolnEG
         bbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810635; x=1795415435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=W0j/fWnf26vWklyNDkviGGujRboBy7IHOTeV/+055fSGW6yLi7wp/vk/eeNRBPPA/Y
         wIPz+IKIuuZ6FQsAtBRz5PggPkVIGNLGV+T4J74Wbn14puOjVb8qMw2nVafD2fmcn2OQ
         7xS9p/48X+S/S+eOjjOAGdp7Y80ZpNW9+TTILNRWsf+SzHCuc+IX7afdydmUYINGfqaR
         Dpqlab8TE3/30x9iKKT0TOMsY05TcbmF1n1eS11jgVHXe6v22potZyV4jSMfFogqqhNA
         nk/BP5WjAtgk5fsOYo/IrKoM7fB39mXcJjq5gg7N6+qDyt+HK7LCWOP3ttt7/fnH9QXZ
         q98w==
X-Forwarded-Encrypted: i=1; AL+hErEOroa/Cfk9U0SWBOun9ZPxcMKOPObi1qV6oicS1FbHUZtD583z8xRP3/y1MOUb51BxA5rfYD1q9xcVzo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rYBFe+9JIMo+IRb0aSzmD4pIAxV54tSU83pELq/43yt2Q65Q4
	wtWAMeGVXrO28d/pqvnvTHxZH/G57UWB2mT2aCB4wfmD4c/d7UX/EiOfT+rIe/3Q
X-Gm-Gg: AYBFou0VCkJa+qSh0RoiPllAOqEZRADkNAlezDqOWQa0HlZOQD2JR8blcts9bG1lfOf
	ZwNPXTiLrqzCb0wrzsxmpGRZ9pmQPs4Hg4Ji74IfBtgKxwFhK7N7/4bO5Ab+qsr78eQ8Pfoh8MA
	DfGv/WffWaFGPivMjUjAp6Vi/RZWl6l6MnfHddLgsP1s3WDDTmUPKMTOdGZFWPX9B1GfbNus3nj
	A4gbMGscZEQrPYdqtE+QFLuK4HEBBJtvALbIBeqISk3Oe0UdzCh2QtLPTGApXC1iTD4xdzVb47H
	swAfxub7e8AhXuGA8buLkQZay8UZibDgqnvI9Zv8rhw3E7LzI7qEn1eujYhN0fh7iJ2Gcngt1o1
	R09SuXKaADGcHoy3/GAn5bez/vbCzqaevhMwqFlEsS+J4DbYdQeqv/Y2wKYeB6SFMbc4Q8wHfFq
	QeOjZceiEnkYKHwZcuoWhptma9uD5t1vf16V1zIBbvNoa2RrJ2NQdguVg9hrEHumVLYVJMUmdio
	4bjJ7OgAOTxbv2JrVIWcPqXyHCDt+s5Z+WlvfTOMfeh+NMgMIJrIVuy97qACcxlzV0rlvuLSZ/Z
	OTuo5hoRAno1Aqf4RJytRkVVipIA59nLRggsgn3hspN80d8plUZzfuUEPIbJ4iUuELpFqMN5CU/
	wOk4zL9W9UoIeq02utY5wU/1cfPSq4ROyXz6CHF6qse1+rEgw3GRVHhGLpkeHCzC0ggAeN4LXoU
	G3u50yqfSrHDCafFu3RnAp10iT+44Euh7To6bWUhpGxrCx7MSdT4Xi
X-Received: by 2002:a05:6820:6fc8:b0:702:dd8d:316e with SMTP id 006d021491bc7-71ab4fa6f0bmr4749517eaf.25.1794810634684;
        Sun, 15 Nov 2026 22:30:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:55 -0700
Subject: [PATCH v5 40/58] mtd: rawnand: cafe: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-40-cbc49c5c5e74@gmail.com>
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

