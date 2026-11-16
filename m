Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810653;
	b=OoHAus3b878uSIMefJu6wcyMN0p9cS60gytISLeN21ZMxlZ3dlzyf5+9FFFNXUWruT2J
	 dsOiOBT1v+Cq0H8iFbFGiIVCLtl5HD9iZ3iancRIyqY5gyZVOm4MeQ8AZ8KfOD7GT/G4Q
	 pesBisM27RF2YevQpeTu6FjC3m4koNLhk73rpJil3gvFoZWR1tl4NUeAtK2le7Q6hNIP+
	 DhgroshhF7+b423dqzgpL9xw3x6gxHJLsGTXuimiQUjgA7tFfOdgf5Asm/FYNechRSunZ
	 Y1h/3VOM3dOEtK61YW4jyqN4shgRbzsXAaSwqSdwVFBQVFDpAh62cuhQl4D7Jevzo6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=;
	b=ek+gRa0aDiYa2FtzQGZXRmeUqlUR6fZU7K9Ohe9NHmrsC3b8IyuYy1Kb0KBYvOfWGcVL
	 IlYiiU2rj5aKkgO0z2ag3twC4p7hQwUHR+zs5NEijMhz4ZSMZJn81sPk3Fkiq4JNvo0SX
	 6OtbFK5TCBXpab8ch00quTVayl4cCvARJ1hkDDLKMfi2wUPEQwqn5dFWHUpta0gVHPLYr
	 9sXPNyjoTGYdN8qcdxS6TOteaDZmR2CIYhnYP9xUIX/ntbIj/hMipC1u7FOiT+3IVjmUx
	 Ptuw2j1vZYGRkAkLnLd2SYE2xdum6ulalqzLLLhWimoBkIeOQ0rSTHHxuKFJ4rjI1IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w/Nij/vr";
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B59A606D97A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B59A606D97A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w/Nij/vr
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1afdf5196so1046837eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810652; x=1795415452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=;
        b=w/Nij/vrUxBykynyCNW+A20f7bNCm7fN8rlI9XMLUWx6j6EC4jLcfVFfedIjqh/GTg
         ZbucyeAS2H/cbSMrx7v9oPms5j8zlicGboVr/dyO6i7E5Kl7XwdY62/RxBkzIK/HT03w
         R00BpyCmR/7X8Z8QGIdgURbdpo3QAA/1g7UUSGgjrjRH7INhVVxIbFszT2jKs0NOCSPV
         yts5zHlXANFqPzwDnVBDtUy/P+IXCCdAhwBEirgbUQZn8ZdyzpPtTzJrbmNP3u0S6yti
         EhcKoF4gjjLhJ14T5PkDtpC3JsPZptOMcgrmVjNXoBYvy2mbOlasJYMlBRTEW/BqRMnj
         98tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810652; x=1795415452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWUwJV+JlBCEZrihlkA2MkXrd5z9pouBqsCsn0XzyXE=;
        b=PViKywDWUNYBKn1pL/Up1gKXqQ+WQlhWDfJFT0x7TZ+G0UnPGuHDluQEtAETDc6Bya
         1JjJwviqaF1tmaVQU4jvGvbrWXCeF+j/cKGvR2H4G+sHZwhfe+wuWA0Kjkpid3xFWHWr
         B6De/oM/W1GgGaxLuID01Xsb/i7xv6CbCOd9FZFVorEImwCxtEcvGaoP5qqZdGsY/Q61
         9mAmTAz2UAVHPi5GN9flEg39SaruHM6Do7AYVIeWX1q6BaxG7ZKYaf8I++ISgLC5t5R/
         r33375N62oN9wFK+ZKOL5LoSfNbVDclVlJRX05MkPP2p0iEmSicAfg4k9dGbLngfHDg9
         jNLA==
X-Forwarded-Encrypted: i=1; AL+hErFXC39REIw4J0Rx4xjhmpqP3sdSMQBDfHA0nKSJxyHgbnB9LHvs6WIjBvBuN2Kf6vVUZEQJgxV5d4UoClM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9761vriBWEJ/FQnRshyZnRAo4uSC0bYQdJFFUoe9u0s/guE4EM
	j9Cv0Sp1KptrUQG9jJzYgW3ySy58LqUMBeWan2Qmyfle7LzuoxQh7fFX
X-Gm-Gg: AYBFou1xasKnyjyUg6kV4Bybsy2ofSkt13UF4nzEhTjogiwO3V8XaNRBh2QQNNiYuT8
	2abVTLjkCUZdtB8t8U5BhB9s02ig867PTt+PHiV3yn9db+6tiISScTa2oEF8jj5+waB8t2/XCXv
	AEfnGQ5lXjSh82pvg26AURdU4VLHrzL1aFDCaUjHzAHtmvVQFjoQDYPQlkV7t9dwR6iNN8OZElS
	a72OoBN3AO0WRa6D2s0QS4qkTQoRLojVA98OwFZI0ec5aMQDiV2QmUKgFUlncFlUCWyBYokzyHm
	dPx3LK7SVCrgX3i+NkXD/FOO4pbMnKg0nMxPEsMBdszfGZrjnUkMciZJHlQdSfSBtkwc83jxiYj
	/WjhkWgOL+f4rs/NvYDeQbqPrQqp7tBsQP5sGThMkAjAeOM69ApDvKsZtASHzcpK/GaZIYeeCQ7
	BmuWOmmvjx4CUVcBvmeESr7z09SD6c8p1SGOIUglKPvlUmaKlwaMaAHfrtgLN0GwaFhCXuYhkvY
	17mE82lTu9XxQVefqYHsu+7g8pe7sWI+LBKgZLh9EUkAJCyFWJVJa9Uvzwh/BJ+bvgBU34azrgB
	d+3Ve2UqkSrDnMbFdUq/O1BtAHPN+SGbEkh5wSHkoTUNaS88i2lug0IuHdcaLIXdNqAZKK9yzM7
	GbL0+7pHf9Fu/N/D4GjOWnC9VqAJbf3sYbkdQlItHfcEPwntynFUkMkGIE0p4fEVfb5h+7zDK7o
	WmbGUYf5AYZJdDhFy9zj/zoTyG2N15GcdXCRFuuIEoF6ZSdAGxvTw=
X-Received: by 2002:a05:6820:1614:b0:716:dba8:a185 with SMTP id 006d021491bc7-71acc96d111mr4835971eaf.56.1794810651988;
        Sun, 15 Nov 2026 22:30:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:10 -0700
Subject: [PATCH v5 55/58] mtd: rawnand: r852: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-55-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
X-Mailer: b4 0.17-dev

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

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c      | 103 +++++++++++++++++++++++----------------
 drivers/mtd/nand/raw/r852.h      |   1 +
 drivers/mtd/nand/raw/sm_common.c |  15 ++----
 drivers/mtd/nand/raw/sm_common.h |   2 +-
 4 files changed, 65 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 566662d45c2c..3c3161bc4b30 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -625,16 +625,29 @@ static void r852_update_media_status(struct r852_device *dev)
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
-/*
- * Register the nand device
- * Called when the card is detected
- */
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
 	mtd->parent_dev = &dev->pci_dev->dev;
 
 	if (dev->readonly)
@@ -642,8 +655,17 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 	r852_engine_enable(dev);
 
-	if (sm_register_device(mtd, dev->sm))
-		goto error1;
+	ret = sm_scan_device(mtd, dev->sm);
+	if (ret)
+		goto free_chip;
+	ret = nand_set_lifetime(chip, chip);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		goto put_chip;
 
 	if (device_create_file(mtd->dev, &dev_attr_media_type)) {
 		message("can't create media type sysfs attribute");
@@ -653,8 +675,15 @@ static int r852_register_nand_device(struct r852_device *dev)
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
@@ -667,16 +696,19 @@ static int r852_register_nand_device(struct r852_device *dev)
 
 static void r852_unregister_nand_device(struct r852_device *dev)
 {
-	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	struct mtd_info *mtd;
 
 	if (!dev->card_registered)
 		return;
+	mtd = nand_to_mtd(dev->chip);
 
 	device_remove_file(mtd->dev, &dev_attr_media_type);
 	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(dev->chip);
+	nand_disconnect(dev->chip);
 	r852_engine_disable(dev);
+	dev->chip = NULL;
 	dev->card_registered = 0;
+	mtd_put_master(mtd);
 }
 
 /* Card state updater */
@@ -734,7 +766,7 @@ static irqreturn_t r852_irq(int irq, void *data)
 	card_status = r852_read_reg(dev, R852_CARD_IRQ_STA);
 	r852_write_reg(dev, R852_CARD_IRQ_STA, card_status);
 
-	if (card_status & (R852_CARD_IRQ_INSERT|R852_CARD_IRQ_REMOVE)) {
+	if (card_status & (R852_CARD_IRQ_INSERT | R852_CARD_IRQ_REMOVE)) {
 
 		ret = IRQ_HANDLED;
 		dev->card_detected = !!(card_status & R852_CARD_IRQ_INSERT);
@@ -752,8 +784,10 @@ static irqreturn_t r852_irq(int irq, void *data)
 
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
 
@@ -844,7 +878,6 @@ static const struct nand_controller_ops r852_ops = {
 static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
 	int error;
-	struct nand_chip *chip;
 	struct r852_device *dev;
 
 	/* pci initialization */
@@ -866,42 +899,27 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 
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
+	error = devm_nand_controller_init(&pci_dev->dev, &dev->controller, dev);
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
@@ -961,9 +979,6 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	dma_free_coherent(&pci_dev->dev, R852_DMA_LEN, dev->bounce_buffer,
 			  dev->phys_bounce_buffer);
 error6:
-	kfree(dev);
-error5:
-	kfree(chip);
 error4:
 	pci_release_regions(pci_dev);
 error3:
@@ -976,6 +991,11 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
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
@@ -995,9 +1015,6 @@ static void r852_remove(struct pci_dev *pci_dev)
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

