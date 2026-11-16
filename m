Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821085;
	b=fNrzaOTS9baaNrPiDJPa7Y+jqQxNO9Q30G0jFsm/Mr2zrzqolFaLdHnbRguBdKQOzm+Z
	 6d52dbrds3kdi1wSs6Eur8fW5PFHRhfe49kZpyxwMHnOoS5zmQmEVE4js3hjDXnmw1iE3
	 GsDF6l8TbYcj1/Cba+6JPw2b8ugYhSmiiJaWIN9lcdizKV26xoxz94/5y1TQVD55X8YUr
	 anSLyBEoBEFkoTtQEPMJm7Di5ev4yfeXdQ+X/29LyJwFsxEdk4fV5kiKzC063DzwVIaOF
	 /V8VwTLqkbKpD3FS5KDRTKcFWOBr6vV6QCDrZYDsJmfOyoE1hFqtPS0o0UEzth6+Rdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
	b=mFl9l7BbELz1SIK3+3bvKjBEIvY3j+yGDbAIKWy6RdJDR+rKe2hhSV8vTJjP+dL1kWaV
	 rtTtWZx3igNdEGOycfgATLxUi9NO6w8l8lDK7E34Az+jafN5C+7V31hvD3bMN+V1hJAg5
	 j1JADwUiR68/Jh4//YEE7gPrsxW1y8f3Zq2B6mnO8L5W29IZxODpp6FUXLSanZDJxv7mR
	 nfFcePn1QcXdJtgih0k3FXK/5gCW9lpQjf3JU5+bzY5ceR75jbYFJzFDr1LQHAmlARU7V
	 a16aueZaEEKsYaFn8/EMoccWC7IJtIDeHJeHi7Q4oJz88v27cq8Q7/LB6QVclCXSLFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0tOu826;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA588606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA588606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0tOu826
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1457236a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821084; x=1795425884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
        b=l0tOu826uUrQ9BsMsFcGGhILaMOE96u3mOVvVUqEjKhXtXrgxQlGBVBk045EdhC8AM
         dw+nQk5Yp9eY1+ZKjXOdsiaQrEmYTgekhHXM1hSvnbPC36ufmSrbQkd0UJvAxGkv2XOH
         NQFcjqbJ6xAi1yTlUF5ihFVfhvVefdoro3Z9WcNlz6uyncG5tetgrPkIiSlhpTPzhpJX
         +gAmC0BJbp7R5UTJL4kNLwHkux2+MCEh631AneqwksOUvoN8XVae1uiK3wUwBZQ/falY
         AFuHhR81TtLuWcYVldnCMjeRwMzB//rXJko+t0rt3vfU0BZXxJPM+r8+aWZI/tOembTT
         CZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821084; x=1795425884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
        b=BcQC9ABsbk7m5YYMhvfJy+V+d220b8u8fluCIJxqRuOVKVvbt0IpUVnZv14VWzy/JQ
         i7kDIsYSVRQygGtijbqb3eOH9EzQIf7BgZVg5YK+UKg914PrT6rjB7hlAAuaa3CUof3v
         2ksc4qpgGHOcGtdFEuUy+OLygfmY3+7nLc6T54PuAEzyNeGch11VM2JJfbJcgRyG6CEX
         x7ZRNE7nk8zI5Oo1Hak75GAYCS1/coN0DFQprvjC13bmgLDzVenuEoz8mLw9/9ii71bj
         mpkZuolzsU8ehc+GxFP/hFXRPZN2JzXP5xYIKWNjliK4bS3k7VjGTAL0JE/eLNAdtC7l
         Eg9A==
X-Forwarded-Encrypted: i=1; AL+hErHNsVJ5sZCS22LuOzj5dDJkUww6kzJEIf1ePzb9JDhQmgdd1oKipbqzwcp1DW7QbKENBB7OJcXCXwFW+uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lbedIf5gG6nWJh1KArXToqt6jIdHq9hyGkxyhRJ65WAPDQ+/J
	FohlpFbLDV2DkU9AiTfz5jvJVPZSNreSJiOgZHi8YwxRZA9a7cck92pv
X-Gm-Gg: AZFdTZd4UWqmx+doyB/ZaGGXoduCeqpzcQSPDUOOOL+Abbg2/EfLJuzf4LO3zuNJsEb
	4wvb49X6m/zmO9Wa7KivEEJcIw8QTsipd04lQFmY1C5801roY+luJtARgEcz7BTPR793QTaNxli
	0MSov2jZWNYoHoOptAXCPZ7vGCj7aYL02C3jwCL5vtnvbMmc5e+c0L6BjPEP07ypJGV0lJ+xBjz
	lKw4VBN/XcoQ1ew1TwWFLXFMjD8MmLF1LUBzm9ELpPgNsZ9j1S6ajONW5Hwqj5JAYXsOmCpfzso
	mARD39nUOUSgtnNHjYoEyzVfPm9+WXurF69jxSOyyMmajyNQMx4BtgaJ4E4qVUyn13f+H8mL5Qt
	+DDmPuEmTiOsr19R1pcI1zraou0IHHvFVQyZakxtkJu+ihwcHY5iXYqXPc4w51tuVBeLgtkWWoC
	DNRkTNpmrmLj0dQGgbdYKdNhdLrsiqvxEVe8Wr7li8VjZHpDKxRAdAhfUeDCIbifgSH4uLQT5e+
	j8/BTRoLm8P1ukxfpVfLH+qmISC/Jy/XIGRVu/HgJBkVdVcF6R/IQX3we6ofCcptEPHvBQ04l7J
	Qsh8kwzUZRgHeWet6fslCDSKzyob77EEHLrrJN7eb6/J5eJC1sGNGz4FC+dcedNr9pPrX6M+hG0
	WqEBo0pbgQEFHOHb3NP+vJArWzR0HbD+4VK9jdLSwTyDu
X-Received: by 2002:a17:90b:1d03:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b1b0b49f55mr9644834a91.26.1794821084142;
        Mon, 16 Nov 2026 01:24:44 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:43 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk
Date: Mon, 16 Nov 2026 16:24:06 +0700
Message-ID: <20261116092407.514998-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
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

Request the IRQ after enabling the peripheral clock to ensure
the clock is available when the interrupt handler accesses
hardware registers.

This also ensures proper resource cleanup ordering, with the
IRQ being released before the clock is disabled.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index fe42a8c2cad3..6a54d3d67e86 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1059,11 +1059,6 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_i2s_mcc_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
@@ -1084,6 +1079,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
+	err = devm_request_irq(&pdev->dev, irq, mchp_i2s_mcc_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &mchp_i2s_mcc_component,
 					      &mchp_i2s_mcc_dai, 1);
-- 
2.43.0

