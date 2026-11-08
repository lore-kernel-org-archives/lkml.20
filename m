Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180473;
	b=PVZKIE6VZXXdTnlnDJjdd4UdmziacsVjY9FV8Ou1MZkr7OKO3su+mDfGsKJtjb3cAN+1
	 Ar++eiKTZ7MVpFxYshUtOwjj7Xh0Wg28AnLyumaZdkxQvrZUi9j1A/5gfCkCTCzGJdvr0
	 SwzHlTiH9aXNq24vWMWBiucR+oGVYE4TMxanGX1J39tc0h9FGguCoTd5TJ8bEfuAUdsss
	 yO2SVGYTAnH3gGeH+XbmOvX2SpSfj4gp93Go0nyPSQA5WZv4c3g0sR4EeQbNWBk2yuKHg
	 SCqhqaIqgO0Hr6f3LNsZ3BzljotKVFQIOXBmlaU9Axbo8oO8C3Le0oMNV7A+rH7ioWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=29ND1xXn3ELD+DnjwkyWpaNhwBfnd9yLmIeaLt62EPg=;
	b=WuQ1SNKNALYveAKaSUNMJy4dLwH37sU2of0GBeMFQg/JV6fB1bQAue7B/fpQc5Ek+nZO
	 8aKuLQeoFK5JkxPjgZApzH+xYsc7bBdLOW3Z4Is6rl9VDfxZ9LllMlIvN+JHr03kmnYiU
	 DxjI7Dfbt3bnc9WCLR0ivxHS8jog/813sizjwIvOcgHsj+Ehw3qqtKTE6UFwN4EpTrzpa
	 frn0qMeV/TelJRTCQ9zsWLR3DMBheICtt2RtF8SGnxuCPAd7d45fUfVtJFzvzcKkAkgOm
	 bkeKyHkP6wumz0tf7KWSeBlugr8JVl38rYrA3s3j/EXvnKXst05O2z1kxg6jGZolCHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r45ucx9p;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F3606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r45ucx9p
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85a6c747dc9so244192a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794180472; x=1794785272; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=29ND1xXn3ELD+DnjwkyWpaNhwBfnd9yLmIeaLt62EPg=;
        b=r45ucx9pYtzt4RdM48hMF02Iu805XHp+5VZdkW1DupekRYc8DJ3/b2zyGZ/hrhFfvp
         4iF7ePbJ4BexBp5vC10YhlagUEdSci3OQ3Fts1qomOeZn11GLW4zD78wfzPdE/BRGCmb
         mBMkutoQ0c9d/+RMVU0mfc0yECsFjzgfT129n4bKNQZenyot0wyjO85YsVdYMAvgO+CY
         WT55HNO+Dge5AAHcsi5lNR8FyeNy67VwF43FqZB4GeJ5QCJdFAfZb7rBj7IQ3p6Wo1HG
         Orhyp5qxfjumgO9KZWJt1xf9h+FEzteUT9TjON97Nv5IYIw0Bb3FOn4xSjnhMfRyl+DC
         xbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794180472; x=1794785272;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=29ND1xXn3ELD+DnjwkyWpaNhwBfnd9yLmIeaLt62EPg=;
        b=VeUJUY/bkb8DiFjcu0YWtve3w4QqSl2nY2pPgCheWUn6qHI/YHzkD/sb1uXimvzEan
         0UJ+JfNZqucGAAqpZRZJOgk0XlIYiNZ2Cct/ny3nGa48YsQxNtS5Z8i9Q+Vj7W90cR6q
         aEkyZf3RHWXEwl1ID/ibu42+K5Dtr4hrQxoTYaVawDh41pTkIbBj7C9f9gXbcMQZUdtm
         RtB4zkeuBXc51eW3e0Jbvxe+f56jn2U9Mo5F5uLPNLvzifdeO3m+fOnvl+gb9IFeIHdr
         1XYzO0ulvLxf5g01Uh1ExHleukMjtHnXDu22axUfALLalJzewqsiidlbVCX4vAK2/kh4
         PbHA==
X-Forwarded-Encrypted: i=1; AL+hErEuRPDux6kz83aKkiptehWnDnftGqu+H6CGMP/oLB/ENnAuzk0jszrKO0UgWO0IbMw5VpNrc4KqGcSp5mU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5G6RzovFiRmoQKSlGg5hAulJV3TclQTZL/x3Jn7pR69YPg1X7
	6om5LUsdlakPwLli1208k18KXVqkl6JKStmWqxMj5xGCkbQF5YhRlMKepDqy5A==
X-Gm-Gg: AYBFou1W8JrRG6A5TEK2v27SYPUd8TwC9ZsqR0wXp/fwI2jYvibAscbJOyr2V/GpqkG
	KQPF4J7E1zk7IV1IRIZ10ssnUrX1erx0Gwobre9kKlSJfLIfzU5eWVw33jPWy/0uE5Qapc/5ESx
	Pct2wInRuWWyR4g93kybExcOS8bDacN1NoQn9tXSKK7mXjRjaT8Fr7+MD9sGj281+AqDwS7dM7f
	qhjn+0uHSb5nNm816PyH5xfjLBZE+hbFYZ9D0nKQ0EwbpjB+Po8VCRqOMNeisxV3mHgLH3Gq5an
	kUJGlJTLDHfTbtkvCnwoI8URlfa23c2aFJQkPElcQrlcnNpBLnxZEvVxSwpK7He2DR+/OxRA7RX
	Uc83BREfJSeGWPjnq/xB83Yz/P83ANmiUu6U40B3nFiPdn0CRcCGQyMJ6/sn3JUPebghBwRdnAV
	ZLdhgYPP5kopDZQAe3sLDvpfU7+zuvO6eEqza3q1dFHc2ffDoCrWQ9xpVj/5ppLi2hcz6mx5GTx
	DXnPHpLKJmGvCJQyRUkPwW4e1AXJw80am/FQbrPyGV5R+tnYnjlR+R7Up8DU8M9b8XvVUo6eP5c
	HCmjn2VwjsvBtv6DfuY0OjqYl3YwUjsl1c4Yh4vBDfeeR1AZzp9I6F6fnD+HK0R7s4KTrOkVI4/
	aUsPa7ZPoYdexBmnVmhLSnxPhCfiBG0UgUuQOHFrrllGb8/GHNwsP9AWvgnp8SKD5p14WTDxNXE
	C3h/Rhir2lXYeAa8eZLcDLmvD066Zzv34r3TEl84FvP2GSZWKOS6c=
X-Received: by 2002:a05:6808:1691:b0:4a4:64b0:bf5e with SMTP id 5614622812f47-568143032a5mr1010143b6e.2.1794180472163;
        Sun, 08 Nov 2026 15:27:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e56700sm2936856b6e.17.2026.11.08.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:27:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:27:48 -0700
Subject: [PATCH v2] mtd: rawnand: r852: preserve card changes during
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
Message-Id: <20261108-submit-r852-card-detect-lock-v1-v2-1-e3251bc3680a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42O3Q6CMAyFX8Xs2iobDNQr38NwsZ8CUzfMNgmG8
 O5u+AImTZNz2n49CwnoDQZy2S3E42SCGV0SbL8jahCuRzA6acIKVlNanCC8pTUR/IkzUMJr0Bh
 RRXiO6gEThYaWsuNKn1ktSaK8PHZm3j7c2p9OiHs6ydi8IUVAkF44NWTLRn10wqWGc8zzwYQ4+
 s8WcaKZ83+aVBQ4pxU2vCpZcb72VpjnQY2WtOu6fgEUKZLuAAEAAA==
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
also change card_detected between the worker's registration checks.

Hold irqlock across the interrupt mask update and leave the mask alone
while the card is unstable. Move the transition to stable state into
the locked card sample, and return that sample for both of the worker's
registration decisions.

Keep registration failure from overwriting a newer interrupt's card
state, so the next delayed work invocation can process that change.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204068@kernel.org/
Closes: https://lore.kernel.org/r/sashiko-outbox-204135@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Keep new debounce events pending until the next card-state sample.
- Use one presence sample for the worker's registration decisions.
- Protect the registration-failure update from newer IRQ events.
- Link to v1: https://patch.msgid.link/20261108-submit-r852-card-detect-lock-v1-v1-1-5514e7543209@gmail.com

To: Maxim Levitsky <maximlevitsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/raw/r852.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..4c094648673b 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -557,15 +557,20 @@ static void r852_engine_disable(struct r852_device *dev)
  * Test if card is present
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
 	spin_unlock_irqrestore(&dev->irqlock, flags);
+
+	return present;
 }
 
 /*
@@ -574,8 +579,14 @@ static void r852_card_update_present(struct r852_device *dev)
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
@@ -584,6 +595,8 @@ static void r852_update_card_detect(struct r852_device *dev)
 		R852_CARD_IRQ_REMOVE : R852_CARD_IRQ_INSERT;
 
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
+out:
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
 static ssize_t media_type_show(struct device *sys_dev,
@@ -632,6 +645,7 @@ static void r852_update_media_status(struct r852_device *dev)
 static int r852_register_nand_device(struct r852_device *dev)
 {
 	struct mtd_info *mtd = nand_to_mtd(dev->chip);
+	unsigned long flags;
 
 	WARN_ON(dev->card_registered);
 
@@ -657,7 +671,10 @@ static int r852_register_nand_device(struct r852_device *dev)
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
 
@@ -684,20 +701,20 @@ static void r852_card_detect_work(struct work_struct *work)
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
 
 	/* Read media properties */
 	r852_update_media_status(dev);
 
 	/* Register the card */
-	if (dev->card_detected)
+	if (present)
 		r852_register_nand_device(dev);
 	else
 		r852_unregister_nand_device(dev);

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

