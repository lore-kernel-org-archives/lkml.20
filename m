Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296723;
	b=qTpjyTNazjDwvaNBla7TcuVvcPnT9XWVN1e0a8Y163100+9xOj4VgstzglSGd/U2ZJXm
	 8w7ezYmFiQ8hpzEqIJXPUELeW0ZgvXIzw1zm4QxvdvxLYB7x9BJ7fV3yRgklOOhxVB8VN
	 +wpqzfj+uYJ3AZOUrZMjLP55j/QPzPagRBDZ5lKLjFdfuRaOwFpP5Nk/3ZpGLbjuvYmQR
	 +UXISOEwjFS5AkOvPTc4VPzqAv1hrneLZqiTqEgsa1Jo/Cy3OKSlOvR3UY7e9ameLEriF
	 lO4ebunYRcSdeJhZSQ5u5AP50gErNc4jrtcC+ZaAYYAfFDTCu+pImRxuA4hTztFb0KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YoPOPR/MF4x+/gu4E+EqzfSESMwXm+KbxKOkPCT4BoY=;
	b=b7S6TU0cJJ3YQTqiOrTNip5fkadGNJmYnAm3iU4JPvkgfvD4SLPClzvb3JDyEUiRM9Lw
	 13TL7es9mtqjsTkT28pDfM6RSkhYvAUmSj+CWMKt4KEwifRVq6lMpkK2Gh/7Ft8t715lc
	 ydvBW5vSw93j3MHytNxQl/BvHrhguyornuqqNcV0UblEUv8zg8T0PEtLqCS93U5qfQmFN
	 /08ZjrrjEanfvPpaoehJc730IR04Bjix3c2xJ7Xk8O8riqfNPD5LSUQhY+W34UkIP20W2
	 dEGlB4icTjCEPeb24iNHD2AekZlZs7j8Tbe7yqzny3DPeDKBrLdiH/3veaiIO6Czqxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BrK2gZLx;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2FA6075574
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2FA6075574
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BrK2gZLx
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8253bc5a613so964898a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296722; x=1794901522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoPOPR/MF4x+/gu4E+EqzfSESMwXm+KbxKOkPCT4BoY=;
        b=BrK2gZLxfAkqBOVkmRaEzoJcrTFgAkfxfzvCb2vN+inNMEiFLPrJ1rSyFMgELUquJ7
         fWG2WD85Tk0wlsPtmq1BQwMidgYIaSZjj3AijKqr73rkEJyxd8uikAOsLebylxdbuMPK
         fUVn1YPIlBr+czSQx+XxobhdJDHCgKNSYVPdWbrs0ZC3DuUPhTwakwBeRJ1BTy8YAhLt
         eR+ddkdnHFj983PVutwDik/VydhHLvf6resDCTsavnpUGatKZaXEBY6PDCHtffkxy/uM
         0b2bSVTJGqvPBQXW79fRFWysFWmLQsLPXF5cI1FC42RumrcjF2rgvSIQ6LUSVwGg6EMJ
         DXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296722; x=1794901522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoPOPR/MF4x+/gu4E+EqzfSESMwXm+KbxKOkPCT4BoY=;
        b=RPbqgNx6t3/8dwHGiXlCaAQqpQzrmgzLzc4pcm4fbXHIGs/j/np/OQOabMw47LZ5bO
         +TgCvtpodUTsNqpELQEw2JRe9J82nYDEwTolRYrpeU3QD2CkmpDlASVIhTDoui7NrVq2
         oNuEqXVbBDzWTj0BPWkYg+1EEHbQrMzWtoDRCvYp+Z6jE2t12kUnx1rYyDpt0PEc2zT/
         pEUatsueoQdjrrnAvyGcUZZ7CMQYik5jj6IhHdUTtFpYIPCS3FgckywN2/ap9BRRkPNK
         kL+wHtdkC6JVxZqmtEYbca6z3xOcp8HugfapOHAwcdtLgpuG5QUSAVqxZCM5r1tvD6Qh
         nKZg==
X-Forwarded-Encrypted: i=1; AL+hErFmg68l1r9jK788kIH7icROkkAI9EchX+GBoJtNyEYvgecWbdbH5juektOe6ezAG5YOfc5vhHm6g/I6Zmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1je91pxAYdW0xTZ708J0Da0WFKew7uSGX3ivmPT2t6SeTJeXW
	m5SWoyQeWkORtcdTjShKBMLpgYxKHyQghqPsF1ts8e4rGKKwjOKE+j3Ff6KUm3Q/
X-Gm-Gg: AYBFou2ZEV44+xEL6HttZd/Y+U7YY6E3+8yHYmCCMBX4CFVmd2DJx/LGAUW8PLCeMSE
	SH4UhiBSbYBTh+qvYYRiDoC288Ns22dKJwAEL6eDcI951caQbnfSMK+0Te/KGiOgz3erUM3+BvZ
	SIGsaWiiyDmkqZXf13Rw6o7tMBA5YZdFeABrOS0yRyXkcWMo8P1U6H858AoTFIfjKVVSV0ZsILp
	DnjX3jxd43bkWdFCISAutITxfFYv9xhpwUAibng51fJtLk/cXyFO31Ekr30+SXy08KqMnp8D9yh
	7RRdPsN1d7/cBpa+q4bqOi+3AuULC2E759MHOnVGysE06LUvjfqmEppkV51YdchXVj7K0sm7sDc
	siGDPTIuWVayBxArw3Q8tndxU11BBQL9VKJH8aD95A1xYSflVt9imYg/1mCi7m2nR5eVuPPCAzQ
	wPOR57J9Neawhlfs8qqSBcEoUE8AgBcrFKQr4IJ2y7BmbaxlWETCo21I4AcbDUKBJwy/AxmrctF
	cibjp0nbM1q1SIelRsZudn9rGiK42GPstONGNwUmKdpV1q3VIBvQ3TBzXYXynrXBVRJ02GDRVht
	D3wGh+MKLDdYD27/GzBz47kY1WTS+pd3XZKMqvv8Kvhrb/M9XRNrsRNzTwZmJGwG+h/8XBcDxdG
	w9j+9fUQoyYiIOviO23lR2KprGDvIF/P7Kbk+c8ESSsnuuZxkmZZF+m+JuiwgBb9CRN/avY2rKk
	RyCKSWrEGkftnWwWjHCFN3dSzCC+gJ5EZ7Drm4mu9z+vrjNb9MJDc=
X-Received: by 2002:a05:6808:470b:b0:55c:7ce:cb77 with SMTP id 5614622812f47-5683cd6327cmr1396507b6e.36.1794296722215;
        Mon, 09 Nov 2026 23:45:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:58 -0700
Subject: [PATCH v2 55/58] mtd: rawnand: r852: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-55-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
X-Mailer: b4 0.15.2

A removed card can still have open MTD handles. Reinitializing the same
nand_chip for a newly inserted card lets those handles access
replacement media, while freeing it during PCI removal leaves dangling
references.

Allocate a fresh chip for every insertion and separate SmartMedia
scanning from publication so lifetime ownership is installed first.
Disconnect the old chip before disabling its hardware, and retain it and
the controller until their final MTD reference is released. Stop
IRQ-driven card-work scheduling before destroying the workqueue during
PCI removal.

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c      | 114 ++++++++++++++++++++++++---------------
 drivers/mtd/nand/raw/r852.h      |   1 +
 drivers/mtd/nand/raw/sm_common.c |  15 ++----
 drivers/mtd/nand/raw/sm_common.h |   2 +-
 4 files changed, 76 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index bf1c1be7f2aa..63f686d3a660 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -625,16 +625,34 @@ static void r852_update_media_status(struct r852_device *dev)
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
-/*
- * Register the nand device
- * Called when the card is detected
- */
+static void r852_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
+/* Register a new chip instance for each inserted card. */
 static int r852_register_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct nand_chip *chip;
+	struct mtd_info *mtd;
+	int ret;
 
 	WARN_ON(dev->card_registered);
 
+	chip = kzalloc_obj(*chip);
+	if (!chip)
+		goto error1;
+
+	chip->legacy.cmd_ctrl = r852_cmdctl;
+	chip->legacy.waitfunc = r852_wait;
+	chip->legacy.dev_ready = r852_ready;
+	chip->legacy.read_byte = r852_read_byte;
+	chip->legacy.read_buf = r852_read_buf;
+	chip->legacy.write_buf = r852_write_buf;
+	chip->controller = &dev->controller;
+	nand_set_controller_data(chip, dev);
+	dev->chip = chip;
+	mtd = nand_to_mtd(chip);
 	mtd->dev.parent = &dev->pci_dev->dev;
 
 	if (dev->readonly)
@@ -642,8 +660,17 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 	r852_engine_enable(dev);
 
-	if (sm_register_device(mtd, dev->sm))
-		goto error1;
+	ret = sm_scan_device(mtd, dev->sm);
+	if (ret)
+		goto free_chip;
+	ret = nand_set_release(chip, r852_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		goto put_chip;
 
 	if (device_create_file(&mtd->dev, &dev_attr_media_type)) {
 		message("can't create media type sysfs attribute");
@@ -653,8 +680,15 @@ static int r852_register_nand_device(struct r852_device *dev)
 	dev->card_registered = 1;
 	return 0;
 error3:
-	WARN_ON(mtd_device_unregister(nand_to_mtd(dev->chip)));
-	nand_cleanup(dev->chip);
+	WARN_ON(mtd_device_unregister(mtd));
+put_chip:
+	nand_disconnect(chip);
+	dev->chip = NULL;
+	mtd_put_master(mtd);
+	goto error1;
+free_chip:
+	dev->chip = NULL;
+	kfree(chip);
 error1:
 	/* Force card redetect */
 	dev->card_detected = 0;
@@ -667,16 +701,19 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 static void r852_unregister_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct mtd_info *mtd;
 
 	if (!dev->card_registered)
 		return;
+	mtd = nand_to_mtd(dev->chip);
 
 	device_remove_file(&mtd->dev, &dev_attr_media_type);
 	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(dev->chip);
+	nand_disconnect(dev->chip);
 	r852_engine_disable(dev);
+	dev->chip = NULL;
 	dev->card_registered = 0;
+	mtd_put_master(mtd);
 }
 
 /* Card state updater */
@@ -734,7 +771,7 @@ static irqreturn_t r852_irq(int irq, void *data)
 	card_status = r852_read_reg(dev, R852_CARD_IRQ_STA);
 	r852_write_reg(dev, R852_CARD_IRQ_STA, card_status);
 
-	if (card_status & (R852_CARD_IRQ_INSERT|R852_CARD_IRQ_REMOVE)) {
+	if (card_status & (R852_CARD_IRQ_INSERT | R852_CARD_IRQ_REMOVE)) {
 
 		ret = IRQ_HANDLED;
 		dev->card_detected = !!(card_status & R852_CARD_IRQ_INSERT);
@@ -752,8 +789,10 @@ static irqreturn_t r852_irq(int irq, void *data)
 
 		/* let, card state to settle a bit, and then do the work */
 		dev->card_unstable = 1;
-		queue_delayed_work(dev->card_workqueue,
-			&dev->card_detect_work, msecs_to_jiffies(100));
+		if (!dev->removing)
+			queue_delayed_work(dev->card_workqueue,
+					   &dev->card_detect_work,
+					   msecs_to_jiffies(100));
 		goto out;
 	}
 
@@ -841,10 +880,14 @@ static const struct nand_controller_ops r852_ops = {
 	.attach_chip = r852_attach_chip,
 };
 
+static void r852_controller_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct r852_device, controller));
+}
+
 static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
 	int error;
-	struct nand_chip *chip;
 	struct r852_device *dev;
 
 	/* pci initialization */
@@ -866,42 +909,28 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 
 	error = -ENOMEM;
 
-	/* init nand chip, but register it only on card insert */
-	chip = kzalloc_obj(struct nand_chip);
-
-	if (!chip)
-		goto error4;
-
-	/* commands */
-	chip->legacy.cmd_ctrl = r852_cmdctl;
-	chip->legacy.waitfunc = r852_wait;
-	chip->legacy.dev_ready = r852_ready;
-
-	/* I/O */
-	chip->legacy.read_byte = r852_read_byte;
-	chip->legacy.read_buf = r852_read_buf;
-	chip->legacy.write_buf = r852_write_buf;
-
 	/* init our device structure */
 	dev = kzalloc_obj(struct r852_device);
 
 	if (!dev)
-		goto error5;
+		goto error4;
+	error = devm_nand_controller_init(&pci_dev->dev, &dev->controller,
+					  r852_controller_release);
+	if (error)
+		goto error4;
 
-	nand_set_controller_data(chip, dev);
-	dev->chip = chip;
 	dev->pci_dev = pci_dev;
 	pci_set_drvdata(pci_dev, dev);
 
-	nand_controller_init(&dev->controller);
 	dev->controller.ops = &r852_ops;
-	chip->controller = &dev->controller;
 
 	dev->bounce_buffer = dma_alloc_coherent(&pci_dev->dev, R852_DMA_LEN,
 		&dev->phys_bounce_buffer, GFP_KERNEL);
 
-	if (!dev->bounce_buffer)
+	if (!dev->bounce_buffer) {
+		error = -ENOMEM;
 		goto error6;
+	}
 
 
 	error = -ENODEV;
@@ -961,9 +990,6 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
 			  dev->phys_bounce_buffer);
 error6:
-	kfree(dev);
-error5:
-	kfree(chip);
 error4:
 	pci_release_regions(pci_dev);
 error3:
@@ -976,6 +1002,11 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 static void r852_remove(struct pci_dev *pci_dev)
 {
 	struct r852_device *dev = pci_get_drvdata(pci_dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->irqlock, flags);
+	dev->removing = true;
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 
 	/* Stop detect workqueue -
 		we are going to unregister the device anyway*/
@@ -995,9 +1026,6 @@ static void r852_remove(struct pci_dev *pci_dev)
 	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
 			  dev->phys_bounce_buffer);
 
-	kfree(dev->chip);
-	kfree(dev);
-
 	/* Shutdown the PCI device */
 	pci_release_regions(pci_dev);
 	pci_disable_device(pci_dev);
diff --git a/drivers/mtd/nand/raw/r852.h b/drivers/mtd/nand/raw/r852.h
index 96fe301d15da..a89ab61ea51e 100644
--- a/drivers/mtd/nand/raw/r852.h
+++ b/drivers/mtd/nand/raw/r852.h
@@ -128,6 +128,7 @@ struct r852_device {
 	struct delayed_work card_detect_work;
 	struct workqueue_struct *card_workqueue;
 	int card_registered;		/* card registered with mtd */
+	bool removing;			/* stop card work during PCI removal */
 	int card_detected;		/* card detected in slot */
 	int card_unstable;		/* whenever the card is inserted,
 					   is not known yet */
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index e238784c8c3e..a79e3c3c77d1 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -182,28 +182,19 @@ static const struct nand_controller_ops sm_controller_ops = {
 	.attach_chip = sm_attach_chip,
 };
 
-int sm_register_device(struct mtd_info *mtd, int smartmedia)
+int sm_scan_device(struct mtd_info *mtd, int smartmedia)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nand_flash_dev *flash_ids;
-	int ret;
 
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
 	chip->legacy.dummy_controller.ops = &sm_controller_ops;
 	flash_ids = smartmedia ? nand_smartmedia_flash_ids : nand_xd_flash_ids;
-	ret = nand_scan_with_ids(chip, 1, flash_ids);
-	if (ret)
-		return ret;
-
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret)
-		nand_cleanup(chip);
-
-	return ret;
+	return nand_scan_with_ids(chip, 1, flash_ids);
 }
-EXPORT_SYMBOL_GPL(sm_register_device);
+EXPORT_SYMBOL_GPL(sm_scan_device);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Maxim Levitsky <maximlevitsky@gmail.com>");
diff --git a/drivers/mtd/nand/raw/sm_common.h b/drivers/mtd/nand/raw/sm_common.h
index 57fc9f86f9ee..d8a330d6b730 100644
--- a/drivers/mtd/nand/raw/sm_common.h
+++ b/drivers/mtd/nand/raw/sm_common.h
@@ -33,7 +33,7 @@ struct sm_oob {
 #define SM_SMALL_OOB_SIZE	8
 
 
-int sm_register_device(struct mtd_info *mtd, int smartmedia);
+int sm_scan_device(struct mtd_info *mtd, int smartmedia);
 
 
 static inline int sm_sector_valid(struct sm_oob *oob)

-- 
2.53.0

