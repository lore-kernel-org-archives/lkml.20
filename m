Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177488;
	b=PFV+3oM+iEC9A1VrXZrQM3iZjdLbuFisWWqtmnQiHM1tl7lAu9ecW8upnS8jcSLkiQnl
	 Tv8/6xzeWpHV6UbHC4qCdaC+/DP4KUTSwftsrOpxqr4v4aNQB+R3dTHOvYxXV1IUYviZV
	 W6yt5PmuGSKvJ5GI0lO/KnXf2G/Mh8biS4S7L2B9Hqa+Lpn3ZWw9V/MpJBt33vNg54NCb
	 Z4hA5HXFpbATPFJgqacM1W/xzw8F15enfVUNMsusfXjhgrQH37NHr6bxvdqZBrFrqQHLX
	 08K0wbBQMia5omrrv9BhdEs/KVNFIz5vy571Ail8GMK0hb/CjJi+RrpjmRaUz0rh2EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4DfEflGZqUk73zomQ6OOIpIEFcB7FUkB70foIaWoQCs=;
	b=kont2OgT+nsWXzMtn29ZnyQsIUv58mHXmOJm82Z0gn2VQUzo3+0DDac8qDOF+0Qnkl63
	 WPxP4klPfZVV3gdnt/JDoACD93/u352uSlSFTEjNqWT77SR+oW7NtYRWqE1y4o1+HZdRS
	 VEjJNBnTZqtjih9ELPWFfG/uUuNlEA/tsYilXwMFk6/1klTcimQp/FQrF8u6lDjyVGgcF
	 Il2hSXpvII3HojW2AlvfYfd0qzqBMRXfG1apuw4Pqum3w66zg9NDQ8aoNE8dHUtvggdMI
	 tUZsvLANdE+fUhUJ6wAGfN6D1EBdi2yJ/J10quUhbvRobuIyHDj8bP68uuGYx1DHqmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyJrSkLc;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C452606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C452606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyJrSkLc
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-705cb6ceebaso210918eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177486; x=1794782286; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DfEflGZqUk73zomQ6OOIpIEFcB7FUkB70foIaWoQCs=;
        b=oyJrSkLc47jyc1Mq2FpZWQdM9KTFSXm7SyOgIJwgCzEXV8D2U+FcVffuJYFoZ9Ar/k
         ig113A0xnSLVd5P/BvRpvbtdZD0uolDJyRjyN3qZn+8nO+x7b2+SgwiQce+HxFGgH52Z
         EH9EcZPk/J9/qC+X+7Kqe0QIVDnTGHzLs5o0c7UIoekbaz6gv69PVp5XidvJrUX9tCs9
         X+Kybq/8J+JBfcOuFVeJBgp/Hqb+7VnmnxPEdn+t3iHwF23S1Q8AZXAl4CP5SLX8FP+t
         T8jYvmsefjEDqqCNXSKCsoLxCcic1KhKUUYH1m+uNNZi6SaGeMEYGxIVlQmSiZwTkGGe
         eQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177486; x=1794782286;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4DfEflGZqUk73zomQ6OOIpIEFcB7FUkB70foIaWoQCs=;
        b=Z++/T7bUzLWaTSPrkgmjPJsf3dmE+PoBa5T9k/v9wlxo+9mmqDtl48QEXp4hvRpdzF
         j4ccNT1uvdZsMUyAYt1wAjkmpQW+HIURidR2WNpawnhLw2TyEkMVnh7MmDKLdRp75b2D
         KHHizgpK7qOG4DS9i2umR43WjfKA4I/muxvHPmRtInK23AMpYAF2mP6hrC8+0rQn8KM6
         KW5hfC8dPRH+OMeczW0QUIixVNvAT1JzL0vB1HDqsiyLUJ59kVnkLAWGx+2ClEEoIPQ2
         dYi0xLJBmg/Lise63dGjHvGHHixyR+nI879C/V+VC9gnqUuOOTyr+c9PzS4gjSniYbP9
         4QIA==
X-Forwarded-Encrypted: i=1; AL+hErEqLWp7G70KhFcSEFLSoxxWHJXD2YsKDHOxxpyzfKY4/vjyNWMMqUWUS68T0J+rG7CGiDqJ36hYnkzLSOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MKmrHRUKYdrNmJMOryK6zu2NhD6BzUPjdhA+5wPs3Dwb9AI45
	kAb7VoMQ5HuakoGnqI5MGFD4KPnUUA/MmCMDwLcDMyKas7rQwxAlw41w
X-Gm-Gg: AYBFou0SPu9m0aljdZLprProDHxD06vRPvUu123gTCEkvbr5JI3cYfgKvQlj2dLBvvX
	PZpgRlnWL4XUz5IssccOV2OmLCzmm7KTG4/B243QnWrzwcpA2Xuqx6QdmqmmU/pftxLDqYb16+J
	zSXinDL+7L3Hzr5LBB1mHLDuft3pzcvoWJ9TKxjzETFClblHXcavanoOST+rcJsumfnRHB5mIJ3
	yn1r8y0UzKR/2cqfjjpI89ITM0nIRnDly8LmBwmugUFQLPk/01dIQJOMN5vmUumhVSu7CfIbRgJ
	nQYpuUwg5Z2qdoRo7t9yuy5JDHRtiREF6py9/bHGBT41X2x96es9O9JKC6CL1icXNIlj0iVvTjO
	IN/8wiaxcgsLmn1pLm+5mLb6GySorgfnGvadcrDyKzunxNOT8ZlgC4wv3QcsBcZBKgLCpS6Za5o
	rXBqoB9raNzC0JrxWjVGpWy8aXtBP5BYB80IOTBP+hIExyFfuS47uIJ3YOps/m+8xhfe2aoJF2Z
	Ii4pzPJzM44K5cLra6T71TCdPuNIE+R+tb/mt1yOlSLttuY7UQUAKW92KSPG7IVBR64rhW/p5NY
	T5KNK/ywLWnZ7iOvfT88bF0F5YTP2D6QqLBgE+a1r3TX6Jfy/9/z06zS9JU2vfK33kWJi4VqJdt
	XHxUzu1kxGlhdetMYlqIfKavc2HnreoVXUzE7uz2JNIsZQGLdCqer0VUPFalJJ7OZF3rktrcVKQ
	SutCttFlCc42TJLFAds9R0xGKrBSN9pEj3Sa8qlL07qsHIaAcpI8w=
X-Received: by 2002:a05:6820:858a:20b0:70b:986c:b0bb with SMTP id 006d021491bc7-7170f285402mr919745eaf.39.1794177486181;
        Sun, 08 Nov 2026 14:38:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8cd359sm2111451eaf.8.2026.11.08.14.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:38:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:38:03 -0700
Subject: [PATCH] mtd: rawnand: r852: lock card-detection interrupt updates
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
Message-Id: <20261108-submit-r852-card-detect-lock-v1-v1-1-5514e7543209@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3Q6CMAyFX4X02kY2A6KvYrzYT5GqDLJNQkJ4d
 zu9afKdnPN1g0SRKcG12iDSwomnIKAOFbjBhAche2HQtW6VqjtMHztyxtg1Gp2JHj1lchnfk3v
 hovCsTrZvnL/o1oJY5kg9r78Pt/ufRfGUSdGWhjWJ0EYT3FCiMftjMEEOrRn2/Qs+xJfbowAAA
 A==
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

Hold irqlock across the register update and the transition to stable card
state. Remove the redundant unlocked card_unstable assignment in the
worker, which could otherwise clear an instability indication recorded
by an interrupt after the helper returns.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204068@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..3ff4294a80dc 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -574,7 +574,11 @@ static void r852_card_update_present(struct r852_device *dev)
  */
 static void r852_update_card_detect(struct r852_device *dev)
 {
-	int card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
+	unsigned long flags;
+	int card_detect_reg;
+
+	spin_lock_irqsave(&dev->irqlock, flags);
+	card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
 	dev->card_unstable = 0;
 
 	card_detect_reg &= ~(R852_CARD_IRQ_REMOVE | R852_CARD_IRQ_INSERT);
@@ -584,6 +588,7 @@ static void r852_update_card_detect(struct r852_device *dev)
 		R852_CARD_IRQ_REMOVE : R852_CARD_IRQ_INSERT;
 
 	r852_write_reg(dev, R852_CARD_IRQ_ENABLE, card_detect_reg);
+	spin_unlock_irqrestore(&dev->irqlock, flags);
 }
 
 static ssize_t media_type_show(struct device *sys_dev,
@@ -687,7 +692,6 @@ static void r852_card_detect_work(struct work_struct *work)
 
 	r852_card_update_present(dev);
 	r852_update_card_detect(dev);
-	dev->card_unstable = 0;
 
 	/* False alarm */
 	if (dev->card_detected == dev->card_registered)

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-card-detect-lock-v1-713bf5cd926b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

