Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391603;
	b=c8NwbaveYA+bhaIuASg9KyXsGs0YeITlMidMKBqg9FSs+UnqfD2XAIFOp22GiMz8RKVx
	 ujUp9vXNn6raASaBEYtDI9Hbi3RrPTj9RlX2UpFPZz3a3sGbECx9uWfbBj2ywKrUyBUpi
	 NgtOeC7y7kSnx6EOH6x0NhT0qe2muTBD3XIk+O8g2ATMOFf/39aE0hoWybYxLvg2OdpqV
	 Gmx5KhLIGa+CeJ7tu+kGXrVXEGHxcoyQxKWtW0p76HPsC3SimjTpiuoGqRRqseSXMDc0y
	 P5N7UGG28r25GbPXHWzVlE4CKmSuO36KpowO/IAmri34mXf9GApy66Ab3ao+z9OuDhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
	b=o9NzHxTTnEougeWOU2fzjuavL1i/DjpAPg/BtYd+2bDFbU4LlcFh5vnP4kaw/hoSzotz
	 pQ6Wr8eQ0EL9wJQQ48fmdSn6ihpIo+2i+AwOqUvbUlMuEAjJJ06W2AjreKU/HWXsyHUXa
	 a0rbPCIdrtXFua9AZmmvWDtBhwco9lSvi5fmMJ8Oeu35PYzXEBT95jVoKAGjEMolOlc0a
	 5NGu+8Xa3vSKtr4byak6YFx4VVXFeoR6cRzsFtrpt952lgB6ami6itWHZJNDjc7LgziEX
	 YcOIGh+XLJ56v+pGjNY/IGQNNq9mV7OYbpLU6BBQLAsDYVwzHFYHcOzvndSwkdIp4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzZDsV0s;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011B6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DzZDsV0s
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so4288262c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391602; x=1794996402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
        b=DzZDsV0slanOAv+Ga2+ZN6fIpcvDf/MJz+XlMPxNBDDwH7estQbZoWAqniNTgyT2as
         TThk8EoBD1DwJ+5bAoyAn7Q7pXTkIkJfu4cY1Jaf/SdysL6ISvhIdrRdwrVSvkm583vH
         DuhtlKmuMpSWDK8UWIzWJgjsou4doDZKv1tEaInxS7Ed3JWwKwsaOWS+ZA4MGcqtIcyR
         GQISYUWEWCPRSXRtCNuqoe6cX8a965VgAQ2jOWjUeRmvsK0sBVDApQN6SC+eqxTOxGqF
         1hlh7K2MnDyVPN6Jq7kC1nDYhIv2T9P1IC4BhOkO4dZPpCxAF38XGHe++KedCdVIme1l
         hLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391602; x=1794996402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7pXPD4xGmJxoqNUMjBHFW+XcIKHkp+3oSxhorL2mg4=;
        b=o7J2sYZ9ry/CSL9W2QCASITlAJRnFFLBuzUMYiYf9XRS5bHX0ZaBkmG3wyrxyYh9FW
         dG96g7QXnrtu0oehAEMqY/4OvTnRguu8vKWVTIaPvtcn+4H0FAOMZTTSFymvfKjiYVFh
         NhcBHvpxTOC3lWeow8dQC44CZKRmJXj9izvxAXvL9JIYhSVRxAd0rsYmcINWGIlTIM/M
         RK33FzhLodq5L6BBib56FRvJWUV4sg0DcF1WJha5IQfAwIEkIHjdCwQV+1SIDH8OnSKz
         xw0fQxytSuRiPmAj0fnwscOjmqx9bas0maye8PeLQoZkMRmLzRyPjFqICPXmOCId/rpv
         GLmw==
X-Forwarded-Encrypted: i=1; AL+hErGkydoEVozc/qOGB9CGDptntUAhrzmXTsse2e6IPGa1L5Bcov5A8x/R70+uykiORpJ3XnhZ+wc4Lj2C1Mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OBvoL8AUjKP6oarnXtNAq8osU10TAOduUsfdYMJEPnSdTEJam
	becV6mAu9QCocJVZT6q4komSk44R8Ob9P1/bl3aU7m7fH4NAlkRi7C/4
X-Gm-Gg: AYBFou2wVPZlVtlpRa5bMnK50GKVe8XXqm20mqpTRjPw7SuLlYMW4HuQkPGZh6uTEKe
	U/3dxscswFeFTYiwqDxyE8raR7t58z1nA+X0cUM/RDfM1xGMG1QymWOPJt72Pt6qH+2xrNEH6gs
	EFJQk7bIPAKcHFZsXTDi0MFp/FUHDvnWNPyIylsb+GuSjzH9CFZO1qCzD3XFCDSHlATdYSZB94W
	KauxqvlLkiGEyZ4Gpe4DsJ3xakHhMg/uCGr4k+74/imS3fHTKwd8JW4RddQ2eXNuP4VW/rDr5qI
	iwWwf+IGpIPEY1rofA6/7hMhyY7T0wZ7BgPe8SNo7ZFg1c7jZ7+FZU4RiFzPN+2xG0W3TIhHeDC
	XS2U1CLsIV2fxoWBXEnB5Qx/eZK3LTd5aIknT9X4RLrjEgcQdy110IbPv/EIkatjblPjnePRuUn
	H/Z76KzmXWQy9Hfk0QgM+JccypruzrGmAVGXF/ovCDdYFY3vzWQgX+xb6rssnZw3oAAZUgOr1rl
	XsfjlXeHWb6VcVe2JvD/53+j80FCYIXj/WgJ/3hjH7lLXI6HjgN0+8+UmpGhmJgVRMNdXeEfQN+
	IXjlvlFFcjAc4nCoKb946kvz0XNuI1o+9vj+vnkhbgsC1vtXIHDjbRiNNMNzA3sP2f4ddBTCrwV
	0Or67sqSjahypxiAb7v52PUb1pPH4aIsg1NMXEacPB6KHOWmIEfG2ouEzMQMYV3sfRfo=
X-Received: by 2002:a05:701b:42c9:10b0:194:3a84:e67d with SMTP id a92af1059eb24-1b3c0360b4cmr2033927c88.44.1794391601941;
        Wed, 11 Nov 2026 02:06:41 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:41 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
Date: Wed, 11 Nov 2026 17:06:15 +0700
Message-ID: <20261111100616.31211-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The peripheral clock is only acquired and enabled once during
probe. Use devm_clk_get_enabled() to combine clock acquisition
and enabling into a single call.

Since the clock is now enabled during probe, request the IRQ
afterwards to ensure it is freed before the clock is disabled
during teardown.

This also removes the need for manual clock disable handling
on probe failures and in the remove callback, as the devm API
automatically handles clock cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the devm_request_irq() call below clock initialization and
   dev->regmap setup, as suggested by Sashiko.

 sound/soc/atmel/atmel-i2s.c | 43 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index e1d8af056234..60e885980f4c 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -650,21 +650,16 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ. */
+	/* Get the IRQ. */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
-	/* Get the peripheral clock. */
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	/* Get and enable the peripheral clock. */
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
-				     "failed to get the peripheral clock\n");
+				     "failed to get/enable the peripheral clock\n");
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
@@ -675,6 +670,15 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
+	/*
+	 * Request IRQ after initializing dev->regmap and enabling pclk,
+	 * so devres frees the IRQ before disabling pclk.
+	 */
+	err = devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	/* Do hardware specific settings to initialize I2S_MCK generator */
 	if (dev->caps && dev->caps->mck_init) {
 		err = dev->caps->mck_init(dev, np);
@@ -682,11 +686,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	/* Enable the peripheral clock. */
-	err = clk_prepare_enable(dev->pclk);
-	if (err)
-		return err;
-
 	/* Get IP version. */
 	regmap_read(dev->regmap, ATMEL_I2SC_VERSION, &version);
 	dev_info(&pdev->dev, "hw version: %#x\n", version);
@@ -698,10 +697,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &atmel_i2s_component,
 					      &atmel_i2s_dai, 1);
-	if (err) {
-		clk_disable_unprepare(dev->pclk);
+	if (err)
 		return err;
-	}
 
 	/* Prepare DMA config. */
 	dev->playback.addr	= (dma_addr_t)mem->start + ATMEL_I2SC_THR;
@@ -712,28 +709,18 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (of_property_match_string(np, "dma-names", "rx-tx") == 0)
 		pcm_flags |= SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX;
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, pcm_flags);
-	if (err) {
-		clk_disable_unprepare(dev->pclk);
+	if (err)
 		return err;
-	}
 
 	return 0;
 }
 
-static void atmel_i2s_remove(struct platform_device *pdev)
-{
-	struct atmel_i2s_dev *dev = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(dev->pclk);
-}
-
 static struct platform_driver atmel_i2s_driver = {
 	.driver		= {
 		.name	= "atmel_i2s",
 		.of_match_table	= atmel_i2s_dt_ids,
 	},
 	.probe		= atmel_i2s_probe,
-	.remove		= atmel_i2s_remove,
 };
 module_platform_driver(atmel_i2s_driver);
 
-- 
2.43.0

