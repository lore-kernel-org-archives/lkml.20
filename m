Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810644;
	b=FYFUiy/raC7PeOsWf+zfMjLOIEde0ao3i+cG7Tu+zfrAJk7M76ED4CTXLd06xg9wMfEN
	 gBWjS5Ajr68koz+HIJr/honrOlpOxKHE5587Jy2pX5MMoFFi8voml4k/O8qDG2dauntId
	 oLTcjnjOGlMURaBk5KyvkHxUK74DpV8dDiFn0ZzPq/Y5xX1FDqMkaYlCeavx7KA/7l81W
	 cq8cWcgHAxp8NLDWf2hALmUofQqlQ3AyzxwkslpeADmnX3sLooItTqMNiVu1qE4i7iMtn
	 OQqWNU1JRO6l2Av8zwQwTTMGatkYUdHRgEhJOeKhxZ2kCvfs/O36JterRx8i/NnhyLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
	b=1B2AdJiJAiVrsFLn2pmaCcArIeUmDunDKU67A0Fsl1NpHEublrn6Rm3EfKeuIUirJpMC
	 66EsZlcpAhdyxISRXGS2v88NO45KwSkFVMs0YNUbDNWiAaNmyJnObwwtiTdybwA7qDwsj
	 gtPsuGeTn8ODbc5hKaKLPuYjGUT8ZsS4u69ZNvNKHpbXYsNJh4m7cGejrxuCYXjoXE4Kz
	 GFYf7yq6PyRxbBqMZSGDvxxQvsw5WpOcuBcgcsUaQ5Ko4hj6Xd1PeDAsaQtKe0nm0SY+B
	 fmbvoZLMAcuiUxkOhzqP0AEK41RfpzvOhN4Q3JEpMUisc+k+j3neYPnlOSMWq2Pg+hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKeI1nZI;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DE60A3814
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB0DE60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKeI1nZI
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6ddef424972so3560290eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810643; x=1795415443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=yKeI1nZIrdhUb3OWeUTlCjTIGpQbyFNChVUMdSkp0E/xtPDXTrvf9CiIkMwgyds9xA
         wFy7mZ7D4Ic2pMqISU4UlnddZi2iFPTUAGYZqNe+9u3Jhbargkqe3Q2tUPjVPhEkda0+
         hrKIUI5R80/+Ipfi1pKiAsIuokHPBb1gzrbo4IV/CShqKe6a+/pT/Awl0NeMgAT1qaWJ
         QOKPMPmRF4/QVN4N5Z7iyv49fWG0CE1BC3wAtX/ozurXUQRRxmZ57YUlEeZxGrKLN0FV
         HhrCiqTvsHdSgUVMUDBEXsSLdcip04qhChYfV7tugTrzmrJ7k+hbrPfuryQ0dsoo+OVq
         wRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810643; x=1795415443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=TWfN4qFwaw6U8sxgPuIRblgC924dg0w2tGfSSUScLo3r1RtaTnc9OHgYL8a1lO0tvR
         DDS0ODBROOPOeMeRqaD2EKXXziTSdbFH7IiQ9Y+QkH8KVXMRMAZcqDSDPvoWIGvJk6k7
         woEUVMtcmBGnqeW/pSX22qeoKboQTHgz1Yx7YWZBqJCjjk6Rq4kgZI6VR4J2cXpYCLw5
         N/Wj7HO7m/11ZRz7f9sVYm2hDVtSUcDjdMmRqt/4bho77GKJDPk6l4fagRZQ+V6ZAbq7
         OC57y9qbYHZoIlEUgVesbc4CJTvmXgo6g0jWqx7z/ru5FOlpuT9xr8kmXPGwJN5VSOt6
         7LTQ==
X-Forwarded-Encrypted: i=1; AL+hErH/cIvOijNmfjFLKULJ08uSdaO5YbYoExoAtmdci/U3K0PZRma0AhufE5K5dUGJqslhdO5vUxHrLttoODA=@vger.kernel.org
X-Gm-Message-State: APuU4Z//ahwQpvZovFrga3wXWT6Bb7LZb45EppQZO7QP/QUzQNEiBY3L
	GrJWcnQi5wSS2FsjMYLL8T4b2IdWZxVeUVoAtlNbYNiNtfIkAJPPdeKM
X-Gm-Gg: AYBFou2XxSDl49OwVEVIE3JB47s/Qb5rREk7g+gQthJqAGG8Kgs4y50wUpDVgoiX8KI
	5GOZuHExZ2tc/7IgftEnUPQ43YeRn2Fsv/rxrktmJPSWPaEY5rmY+2Wt/HTzvMof87basW8n7Ey
	ibJ3jWFirBurFqJ6Xa1Bv93gwH/sfwZzoHgwF7rWifc0CzQwXLuC53aV5Y1YawazGLs6pGv+Qpp
	0kny8kJ/bm8Ep3iXiYvIkKQBzsonsR7MqQNo40HKK7JIvtUgRTWd6UgErzXnpaKqMicDyEmUnrJ
	dR38wbnM33Xpdf1cCOM2v+qFuVVXBPTbQIGt+GkY+z0mw/FpxxthTEeO9zYIsA55hVoW2nTob1j
	q9J3iYeSouPdFlQRMiVoM7qYJ4iCavi2KF3Gc56uGy5kEVljA+zUMX7E5tPR+K5fgFH0Rrq9Rd+
	Y6lyAeU4z1+zh4CnHlouAroKsY0VHI3LRB8D9VJOvK4PQn82JsbFA+bYhN1oS4eejR5XVZpWakc
	eGzONrBLrrJrkoiKjwCCrLTXhzgutYyqzVALPSJv/xBoLELuV+oKtYPr0nJBmitKnr0dW1Tm8ZF
	822MLwfA+3o6UL2VwbUD6Fr9zWh3JqeMq3mUoiEiTpfMWYT4aKwENRZgY7cl0DMJhLM1qMwS9QG
	33fnMXp6c4rtvV+/dNGMnWISw2PETDeyNOZCJ6zxJ7m0akhmYU87oS1ca45wqHCpR5ZRKGeVoBX
	HNaBLxNGcMYGGeuEVfnAw+CkktF49YtPXJEtGM//D6Dbwl1ys7csY=
X-Received: by 2002:a05:6820:505c:b0:71a:e4a8:bed3 with SMTP id 006d021491bc7-71ae4a8d159mr2908459eaf.77.1794810642654;
        Sun, 15 Nov 2026 22:30:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:02 -0700
Subject: [PATCH v5 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-47-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.17-dev

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 408b2aba2fdd..633d09471760 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -687,9 +687,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, host);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +799,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +841,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +852,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

