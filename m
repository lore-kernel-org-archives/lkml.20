Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183749;
	b=Ec88aBDUe6xegc7Al/EsdCgBnR2QicHTktFDm9J0K4WMfnb2h7k74I1r0Kv41MRxUuEQ
	 KYEtf1aYeoRKxbHsh6TYYMRVjOT57DkADEHkwUkrCCjD9uc0ZuAEGNDj6Kl8mPTcZfXqZ
	 9WRazEZ6jD8PAKoFKz/I8buFvkTASAJ9lyHRhKZFwa4KFLEF+tu0X6m0iK8V4RYPzFHSS
	 RPUYm7IwgxQsdaJVUyIDs/v/31DMLSVMCt8JD4IeRZM0FOecoPT0Sf3yg71W64Jqz6J7r
	 7lfHE9DBoN4les3AGFYCi+SDP+VQudzCXNU3tiRKZMmOMtRYDumHF/Q2WO9HGUuM8nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=r0Wktv3qg84AghHEx+Ox2jLbCSIyBPFOaRI1XPUgVtY=;
	b=pqUh1WTc3P2434FJKu264bJBPKo7svt1+tuz8hvYs7YwaU2JdQ/guitPqVV2U8rgiSnT
	 2/9xTfTfbgm5L4mDcxrKobc3Ql/CsSWjILJgQ0Wv4BmxZfCv2NnC0SpT9XbasaHFZ4+Nh
	 nfEVjQqO3ux3Pl7DBDqehXCd/RGS1xx02jJbl14tPk/dhl59yjCgIayf/VNqMC+WgKwf9
	 Zu3pNMiBuMUxb9Fih6rx17w6rbvuCepldKmPs9GKDRU3UwE701J7XcOCWPEmIZIL+e7aa
	 54Q4J1o2hqDAX5jCsIFPZpLtbnJ7RB9A0EBAMOYrSAAymQFRmd9V5zNv/+kF+z0X6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVe79pf7;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EC3606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVe79pf7
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so209572fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183748; x=1794788548; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0Wktv3qg84AghHEx+Ox2jLbCSIyBPFOaRI1XPUgVtY=;
        b=hVe79pf7qZunrOPvh93Q+cZ3FrNrGPfQ8E6XG6FVcZbq+kXWRWo9Jz4+TKfUFNtuvX
         eqYANthGPNk+0PYTuxLlb5plLWd4eJR7UQSgo46ZZvuhT23ql8xVBtwd7jOywsonQ5wQ
         gDzKveQPb61+ehoEmLl12tiZSUg7MvxhOFTVY5WJ0LaiwqKehgymQmADtE/eZ/Q/qb3W
         K0CNkU8AkudDAKz/O5GQ0bMXUqvgMCHi0U/IC1BNoxsKygzDPTKwZ1WTmDp+e4o0Zz3y
         mRNB7LOa/Z/AsHia+rCb+0adeJJyuQ3hSd33zq1zNNqLXux/91AJJ11oxRZyiJU2KsFN
         K1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183748; x=1794788548;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r0Wktv3qg84AghHEx+Ox2jLbCSIyBPFOaRI1XPUgVtY=;
        b=UvNaE0RzZ/j+Cb9yHqTMTSSNfuLRQsgx13ljaAzZdMliU9/Grc3j3spZ0VaXG3bbdY
         pvvVUavu7cx54fmQaAmv1znm4RPzcVpG4SbfVsKdl4+goNMxTBh15mmzdXrznavw64Kr
         l0MW2KU83JMJky7m/VaAbCbS5ZwH3NTHj0owito67Gd0O50VbO8ps91fbBIyf82VKAd+
         tcPKoPl6yNajUJh1wiKxNHQI+7fRYEZ0fXi1YF+cTQe9bPIQtEy9y8/n/rssYmw6zQY1
         yQ9CTKjO0/mXW8Rc5xpH/OwhXuj9QRYeORZCUsumZDVNIFZCozxgjWnjlwkTDTNBzuug
         ljeg==
X-Forwarded-Encrypted: i=1; AL+hErFLirp/YmhbnE/JN0L6Wzig/TBsFVajEV2+w3yoADivEcWYoLjDx6SToV6cLxadZTa2rrxxkpudFMqucbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vAIhCh0GKqoFiPEAej50S87ITIsrPQ+NZ92cBSNmOzKJ4N2F6
	fK0KSgb9fYjxX8BSa1XHDEj3oRDxqGf/FYphrOT+NrJX3ay5BgIeCgPc
X-Gm-Gg: AYBFou2iAPc7RIXDANuGhcSgtQ4FxPa+eKs5SSoJCdSqvqQBc9pZbwRUV4j4b4WUAfM
	sJICm4qKhM9noHUpyMLOaga4eEUzmyge5Nrt+C+gEsgbyadfdDc7CQLkD7l8RUmkkUdU0edUc4r
	3tOQvXQjpj3QOSsiATKKIaeYqSa+5jG4UspJTyznjOXlYT+kzEPpDhWW6aKBv09rmhtUeJDTOKf
	rByoLRw+N2V9JYDrQZjX0rFthy1aaD4UNyqRIz7qrf7b9hHVOtV9raUyaRejxyx3Pf3qy9Ke9se
	eZ4aQOepqbN0GV5Vane0vCpqutPiU61mFYmRmcY/GsCMBtakFpwpHV0zA7GuSVAWKqEpvNVMGXq
	HrW7IHlHnZ3qN/ZY3zq0IN0DTPTwHjWtvbWUod973uFu2g0trL0lZUrNznNSmf8UAAsxNDnJnyy
	4uYXUt3kwG1aTHJls/uAhAsNtVbmg30At38/Fc9Fhgw0w7yAChI1/wJZCNLmJLHtOoE8Fq9lYxV
	8y2+7Tt2GUGZB7p0vvK4W7LaE0tiBsTKPgLW00xWmJQ4PYZpSDzIFr41FsIU8oko3TOv+4+Z268
	AjBIUBrtTeMZ8J9fZwJPqUk0IsCoqeQ+LCJop7NMGrBU2z/rit0oWB777LXSowDveiK4z8ipWUQ
	O9/mQXUc4RtXejBl50jUkr3pYQA/vONiUzKWcIAFFeuewQmXGoXuPoQOYAIa5y2oev0OuWFCfFc
	WEikaMpgoA8Z3VMoofe/ZQWVOVtBiIFkeq+RLhEhhms8pe1iPr5CCGQQ==
X-Received: by 2002:a05:6808:5088:b0:53b:6f4e:5176 with SMTP id 5614622812f47-568147aab31mr1788815b6e.66.1794183748050;
        Sun, 08 Nov 2026 16:22:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm3091574b6e.16.2026.11.08.16.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:22:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 17:22:18 -0700
Subject: [PATCH v3] mtd: rawnand: r852: preserve card changes during
 detection work
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
Message-Id: <20261108-submit-r852-card-detect-lock-v1-v3-1-ea9e5411314d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw7CMAxEr1JljaFJSFtYcQ/EIh/TBtoUJaECo
 d6dpGxYgmRZmrH9PC8S0FsMZF+8iMfJBju6JPiqILqTrkWwJmnCSlZRWjYQ7mqwEXwjGGjpDRi
 MqCP0o77CRKGmXJ2FNjtWKZIoN49n+1g+HE8fnRCXdJKxeUPJgKC8dLrL1hDNxkmXGj5innc2x
 NE/l4gTzZzf06SiIATdYi22nJW7QztI26/1OJCcZmJ/8ljiIWeCKs2rppTfvHme34OJmnRQAQA
 A
X-Change-ID: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

r852_update_card_detect() reads and writes the card interrupt enable
register without holding irqlock. A card interrupt can mask detection
interrupts and mark the card unstable between those accesses, only for
the worker to overwrite the mask with its saved value.

The worker also calls this helper before and after registering or
unregistering a card. An interrupt between these calls starts a new
debounce interval, but the second call clears card_unstable and enables
interrupts again before that interval has elapsed. The interrupt can
also change card_detected between the worker's registration checks and
its media-property update.

Hold irqlock across the interrupt mask update and leave the mask alone
while the card is unstable. Move the transition to stable state into
the locked card sample, and return that sample for both of the worker's
registration decisions. Sample the write-protect and media-type fields
there as well when a present card is not yet registered, so a later IRQ
cannot make registration use properties left over from a previous card.
Keep the properties of an already registered card unchanged.

Keep registration failure from overwriting a newer interrupt's card
state, so the next delayed work invocation can process that change.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204068@kernel.org/
Closes: https://lore.kernel.org/r/sashiko-outbox-204135@kernel.org/
Link: https://lore.kernel.org/r/sashiko-outbox-204169@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Sample media properties with card presence under irqlock.
- Keep registered-card properties unchanged and log the sampled decision.
- Link to v2: https://patch.msgid.link/20261108-submit-r852-card-detect-lock-v1-v2-1-e3251bc3680a@gmail.com

Changes in v2:
- Keep new debounce events pending until the next card-state sample.
- Use one presence sample for the worker's registration decisions.
- Protect the registration-failure update from newer IRQ events.
- Link to v1: https://patch.msgid.link/20261108-submit-r852-card-detect-lock-v1-v1-1-5514e7543209@gmail.com
---
 drivers/mtd/nand/raw/r852.c | 78 ++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..dbee043e6d8d 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -554,18 +554,28 @@ static void r852_engine_disable(struct r852_device *dev)
 }
 
 /*
- * Test if card is present
+ * Sample card presence and the properties needed for registration
  */
 
-static void r852_card_update_present(struct r852_device *dev)
+static bool r852_card_update_present(struct r852_device *dev)
 {
 	unsigned long flags;
 	uint8_t reg;
+	bool present;
 
 	spin_lock_irqsave(&dev->irqlock, flags);
 	reg = r852_read_reg(dev, R852_CARD_STA);
-	dev->card_detected = !!(reg & R852_CARD_STA_PRESENT);
+	present = !!(reg & R852_CARD_STA_PRESENT);
+	dev->card_detected = present;
+	dev->card_unstable = 0;
+	if (present && !dev->card_registered) {
+		dev->readonly = reg & R852_CARD_STA_RO;
+		reg = r852_read_reg(dev, R852_DMA_CAP);
+		dev->sm = (reg & (R852_DMA1 | R852_DMA2)) && (reg & R852_SMBIT);
+	}
 	spin_unlock_irqrestore(&dev->irqlock, flags);
+
+	return present;
 }
 
 /*
@@ -574,8 +584,14 @@ static void r852_card_update_present(struct r852_device *dev)
  */
 static void r852_update_card_detect(struct r852_device *dev)
 {
-	int card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
-	dev->card_unstable = 0;
+	unsigned long flags;
+	int card_detect_reg;
+
+	spin_lock_irqsave(&dev->irqlock, flags);
+	if (dev->card_unstable)
+		goto out;
+
+	card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
 
 	card_detect_reg &= ~(R852_CARD_IRQ_REMOVE | R852_CARD_IRQ_INSERT);
 	card_detect_reg |= R852_CARD_IRQ_GENABLE;
@@ -584,6 +600,8 @@ static void r852_update_card_detect(struct r852_device *dev)
 		R852_CARD_IRQ_REMOVE : R852_CARD_IRQ_INSERT;
 
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
+out:
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
 static ssize_t media_type_show(struct device *sys_dev,
@@ -599,32 +617,6 @@ static ssize_t media_type_show(struct device *sys_dev,
 static DEVICE_ATTR_RO(media_type);
 
 
-/* Detect properties of card in slot */
-static void r852_update_media_status(struct r852_device *dev)
-{
-	uint8_t reg;
-	unsigned long flags;
-	int readonly;
-
-	spin_lock_irqsave(&dev->irqlock, flags);
-	if (!dev->card_detected) {
-		message("card removed");
-		spin_unlock_irqrestore(&dev->irqlock, flags);
-		return ;
-	}
-
-	readonly  = r852_read_reg(dev, R852_CARD_STA) & R852_CARD_STA_RO;
-	reg = r852_read_reg(dev, R852_DMA_CAP);
-	dev->sm = (reg & (R852_DMA1 | R852_DMA2)) && (reg & R852_SMBIT);
-
-	message("detected %s %s card in slot",
-		dev->sm ? "SmartMedia" : "xD",
-		readonly ? "readonly" : "writeable");
-
-	dev->readonly = readonly;
-	spin_unlock_irqrestore(&dev->irqlock, flags);
-}
-
 /*
  * Register the nand device
  * Called when the card is detected
@@ -632,6 +624,7 @@ static void r852_update_media_status(struct r852_device *dev)
 static int r852_register_nand_device(struct r852_device *dev)
 {
 	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	unsigned long flags;
 
 	WARN_ON(dev->card_registered);
 
@@ -657,7 +650,10 @@ static int r852_register_nand_device(struct r852_device *dev)
 	nand_cleanup(dev->chip);
 error1:
 	/* Force card redetect */
-	dev->card_detected = 0;
+	spin_lock_irqsave(&dev->irqlock, flags);
+	if (!dev->card_unstable)
+		dev->card_detected = 0;
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 	return -1;
 }
 
@@ -684,23 +680,25 @@ static void r852_card_detect_work(struct work_struct *work)
 {
 	struct r852_device *dev =
 		container_of(work, struct r852_device, card_detect_work.work);
+	bool present;
 
-	r852_card_update_present(dev);
+	present = r852_card_update_present(dev);
 	r852_update_card_detect(dev);
-	dev->card_unstable = 0;
 
 	/* False alarm */
-	if (dev->card_detected == dev->card_registered)
+	if (present == dev->card_registered)
 		goto exit;
 
-	/* Read media properties */
-	r852_update_media_status(dev);
-
 	/* Register the card */
-	if (dev->card_detected)
+	if (present) {
+		message("detected %s %s card in slot",
+			dev->sm ? "SmartMedia" : "xD",
+			dev->readonly ? "readonly" : "writeable");
 		r852_register_nand_device(dev);
-	else
+	} else {
+		message("card removed");
 		r852_unregister_nand_device(dev);
+	}
 exit:
 	r852_update_card_detect(dev);
 }

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

