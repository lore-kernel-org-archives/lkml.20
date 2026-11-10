Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296706;
	b=MMxemg6Zs0PTrRxFZlKSne2fragS84GbS+qT8p9O45+cZQroiwDnuhl2cMsnKIF/Jopo
	 6W4Q6WU0zq2qIjmPCXetzzr194gny6b/4EX8oJc3h7oN17maAbtSt0P2tgqovswS0fy7R
	 Vfpm52UJv6UggpwwB0TjuAFemlgxEIZ7eZsfQnhzpfKEqVPuwWCqHZ7yD7kMnNEBvQW0R
	 GjO+1WgY90z13UEu1N/6Y1Wb0TpHl/cGnTAi/ExJh+H4ICdaC6jF3Q/K9y9gkoUOeTWAz
	 +BUCya1qB9izY/6PNMrXTlmGCjDsG1LRhd0mjodpfSpSvbMo+Cg1h4B03lna52Ioapw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
	b=es+j/YszuN1mJIuDrOEq2Ws2EFib+sgsXn6fEySoFV63w+CkFg5uEz6ieA2nHJiqnsVf
	 iHMvMgz5853CrjbWpA+3LHp17nTi3s0Cy7A1cbKpXqJGy2KruAaF1yfwj5Md8ISMve/MR
	 f/4NOO2AXC1GUIwYWHI6QMpdq8DmHVNrNr9OztX77GRhYc1VXBUyUCbv91mKJBp6e2wxT
	 jEyfPVPDiGceMt4+7w5WJ0RmRo7VzydrJaH6A9QuQH5EKStXkE7XMclhcZ4c5kUgkkLdU
	 R1hzZvqZkyxP0/oYbOLW3KULFrz4td/TkOkECjBYCVPA5N2kQ3xUBBb7ppGoXaWVX5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wba9EC37;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14F607023E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F14F607023E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wba9EC37
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-53656465d1dso808491b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296705; x=1794901505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
        b=Wba9EC37on8eZvJHvy7xyDQ/7t2edboCbWVO634njcmiV7Wutfkrt4D1QZyOHPMgw3
         X/3efimOmMd6JgI24npHKeA8D47WqxWFYEY+W1h0GhXBt0lFiXFMmM8XZxrnmac839UP
         nelgwh/G1LjM04WzyeD01xdds1J8pipfjrvCK3zQu45iuU3geYTqZ/PRwcsqkmVJ0VHN
         aT/5L/TyZvH+eftkXDQSeMD24ULsM3GZzfhZX/YyFJoeFWSgGkOOEhqY38+WjTUNbRPV
         aWDHQMFyFMudNi5Uti3A+FNY/agwq7a3EYayK0X1I4AUyrJCSXltKGnI6+NEzJJFIWr0
         Pm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296705; x=1794901505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
        b=TEMl4RLa/uPWy647r+chQ6KOJCVwKg6Yox49choWXTZkGzB5dY7ZdJ4S7UTKfPIfCm
         T8lndz17oGbcBGYPPWGP/M6KBkmO4x40hDtOX3Vzkvo6GYV5KrTdkJ9zvOJ8Q5qs0WB9
         PrQzxBWQeMHD2Xhh9xLOfK/F91Fg5TtztWVgtDTucvMpX/KaMxOG6TQeI/yfydq0mjcK
         a2w2Ptv8GCW8is5eOpA8PUoDw+SpHQWDdT1g94u7j5Pkqczi1HTR64xb51vMdkEbkMjl
         +mFg5WN9b3fFOGyzxawhqAgnDIba/KCY8o0AvCO9CUhTQi7LrFzjGo3Q12F0BAhK74k2
         151g==
X-Forwarded-Encrypted: i=1; AL+hErF/CGLxt2PcLdwZJMQhxoO23Snu3sKE4iOqiYBGmaXRblz4cGCiLgCZbjQu/6L3hK44cHTeSoGaEoYM5us=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BERQi7V+oJ8I7MeNUfTPA5oB3oYM7s30aWbaF9RSmK9saiDr+
	I/zOsfeuDKiS3alowz0EF66WbudcabhyEVzfUHvwUISnwNzF6DTfA7bhk5keu74w
X-Gm-Gg: AYBFou0pEsqhzWM4o1xuQtpLB+EMuWnGYLc0JGimRbcc+6wXdDdgxh01MYQ0jntm50E
	AGSS7vkeyMp3Qo7jR3mliFHe2CvhGfoc7UnjraxxlInEAU2PTgWJHwVFWdW0uFyn+clK2e2EGBJ
	mj8KVdFbM0fClhXsBBZW/AYcS3wjQCXuZcK/sfefC7UGWiJp+Hbz8+jfFGW1Wn9cKEdJKsbJeeV
	dx1ATj87d4fu/dycjS7OQDPwb6GnhZcw8fOB3ZpTbvJxDHrkeeu2wzcvoNj4vV6vd4ydNEd3Em1
	cEod9XPs+snd5k1G4c6cUSn7Zb+3Gc/udO8LC9WVTPASbKPSh9OobF1bcHNfY6WCqo5+FE4M5qC
	IL/MhDglpNUrrwARcqwjq01bDmjeTyBVmXnuaEIJU74agvRJtFwvQeWza7IFHmKuMWlG/RUp5WU
	X85WWjBUxHYXlCghtgEuZnSbKIZzdcLfAM3vTNpZw2LOLNRstvEgNBy1Bjt2449QLbqEzVcbPWZ
	L2/9ano3ySOMPVI/AgQfxZEjVVHVK3Mn3HpQQQqljTpLOjqu2SwdsPJJfkeVx9o1sDZQDc1ECj7
	waNoHq1pnkpCDL6cgDNe2RtALBZUp3gIPzxA1tVypUQv5+SRGFaF4q2rc5eWe7LKfwLom/VEj0L
	t9nV+QIuE2L/2vcSOe+NEEEQqiSxuR0WBD/xxJM3m3gfh+dkVlYX1IyZLrSunOlrvzAq6jzZXJp
	42WhmwrXrnD/qMtSqg63BkfGh6iECP1wu5vF9S3ZA3bOdcmoU5tQs=
X-Received: by 2002:a05:6808:2220:b0:4d6:90f4:48b4 with SMTP id 5614622812f47-5683cd802b7mr1432333b6e.54.1794296705267;
        Mon, 09 Nov 2026 23:45:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:43 -0700
Subject: [PATCH v2 40/58] mtd: rawnand: cafe: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-40-9137d08f05df@gmail.com>
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

Free DMA memory at teardown and clear its pointer before deferred
detach.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index f3117b031cd2..bcf7482410e7 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -651,7 +651,10 @@ static void cafe_nand_detach_chip(struct nand_chip *chip)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+	if (cafe->dmabuf) {
+		dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+		cafe->dmabuf = NULL;
+	}
 }
 
 static const struct nand_controller_ops cafe_nand_controller_ops = {
@@ -659,6 +662,11 @@ static const struct nand_controller_ops cafe_nand_controller_ops = {
 	.detach_chip = cafe_nand_detach_chip,
 };
 
+static void cafe_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cafe_priv, nand.legacy.dummy_controller));
+}
+
 static int cafe_nand_probe(struct pci_dev *pdev,
 				     const struct pci_device_id *ent)
 {
@@ -683,6 +691,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe_nand_release);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->dev.parent = &pdev->dev;
@@ -693,7 +705,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +797,16 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		cafe_nand_detach_chip(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +820,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +833,17 @@ static void cafe_nand_remove(struct pci_dev *pdev)
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
+	cafe_nand_detach_chip(chip);
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

