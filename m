Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371289;
	b=5c+2wiH7LUhmlFTClOl6UoJqVwOpC6qvzQqXTVDCOKZn7HAEibYZCTLuozXblP/cV+19
	 0S353cuYET/gv9FOj4AnOQjqckKv/uwdFaW+WqMjcC8MwflzMVtGHEkZsTfjgxUSwGT5B
	 DqfQhEIlKa+y01mxS2goqoi6EM7EGUuiWhN7MWVW4BIDIy8Y35JHfbRDHrIXMlJmNcDCW
	 Tkihc5SgXEo6WMka++Gx6OvvybQwGtcxZ/2Mkag3bzmH0WAIg3c9RJ13cFODOd1IXHAfD
	 ALVf+NqrSa8lenehL5LyS5l6sRMT32zddyJC0ykqdXawR/Ao/Z8CiOxN4vQGwr8l+9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
	b=wWPR8bKi8Gbxx7O+AGtKbW+kZr0Qx5x9nXZVeUsenEC48+lD5WKMKoCiGcTbmvNOaZNb
	 Vz4HUL2Fj5B6j4QSf5SKqUft9X1Z46k669S642gVlNN8Pgbl7pNJuSLMQ5OGDEVHfXqpK
	 vQXYn87tm3jHy8SPnSCv7dCXSKf8cY2vbA9vTH+BdJmbNqCiWaAe6r6I89r8Gr4U6oguG
	 B6pOELOB1pV5y52aY40pXztel1iUSeszh0w68PVQfgCi7W3CkoTo1K0HjBABVT+YC+AiK
	 BiErUjSA2ThLfnxE4KLbeYT1wOM/fAaCY8yA0ul2euJ9FAZ1L+kuDab0ld9LuyIdfqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="owpn/r8R";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7988606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7988606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owpn/r8R
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4263917eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371288; x=1794976088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
        b=owpn/r8R9714otjCr2GYliPgfhTAREp1zvbZSxSkrbdvgddt9P+QXCkv8qKkVH5y/5
         zyekUSBFbShuAW4CdeCyGfm4IzP2OgTCtBPx/YnjoohV+MSQMVxgh99hAZ+AZ0jI6093
         AB49JePse3AmZvLzNMmNb4SgEMkKHz7Hx/kbr9YY1OPZ9CRiLxn3UU5JhVS9bpzUG6Ki
         ZlvzSK2Do7BeBrhrrI+bjuNB0GFrVP/WYpJGKg3CByALs+ndMgNsWAbhBLOzIeuJ93Q1
         3vOPkBhpFNbS2zxMTirIc8ULcXTnbQL+o6V/a6QLOSeM5LaOXzN8RETZ5Xcx0u/5m0N1
         o67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371288; x=1794976088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlI97Kbc5IzIm3OlbOAAkvy4qx91Md/wmJY6Baz+hNI=;
        b=h6oBpQdhbFHH1fUaIW2AinkgsfKZt7ISYn2MZvSVzLTCps76HVNXdjfj1AGCunDW7V
         3rTy3EaUqP2dOuBeziVKWLB0Crd8tgYcbAOMXSZc2Ge9SI+GvorMFG9JXb42iWkRcX6e
         shfeMDSQ4mSql7npEYV1+vSAeRrog8OcEn/RwEy8jfnGt4WJSHeQZEJZdRYe5MAR0oqO
         3G55OEeeXfkjxPBM8IVeTqqUKt7aHZa2ypmOBo9ZETAE1bUasq38/YJTX+lF+C+3WKLn
         9Jar5a62C8RA9ThDV1FnLppHROlml5nBRSrBfyhh/Mriqf0nZiE0LIoFYE6MBcetJ6ha
         M0Rg==
X-Forwarded-Encrypted: i=1; AL+hErHh673j2SYrwX3f1CFBxFIPL/axx14SfsOiMwxtzNLFX9w7kGlB1jVM4+3a9QlZflxUHikeKsyupyaMf2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z84s6bl1HRopBY0p24P/j3fm8yaSRNUaIQK4M6uNptbfnVsxm9i
	cGeL3bMcaPp5Uw8LTQV+L1A5H+vvkwa0Jxw+kooBhN01QPHDbIhWhRF2
X-Gm-Gg: AYBFou3+bdLA6KvggWHEKfnYG1gPrjHPIYU3LItcQhvG8KRUb2dbd1J9ouSjylbo72G
	R2jaOmpscEy8KUmuJ56gS3aKnVuE6yhJ21ylpH1vgxdyCUGc7oX6xEFKPZeLy9pzvbrlf0/oH8B
	xqrRBG2YiJeakfbRC4Nzr1wyawzM4Ji4ANqk1TzyDDyNawAIp71i0ITx/GrQcSYWBsqDXxMepKK
	s/TxX24IFKwpQWzqjCPvrt65LXL4r8TOYll7wDE887cMtLfK76cH0+FXvcJgoPr2Kr5WyllApqL
	VLpt6lLFc2vab1Q5Fgcf5pstNbW0Lt+RChV4X79cX/Ch1zPRh3iJuV1WEp6QiT1zWc28iVUlwL/
	6aTm40LlbhMkonJ5dFUm2gS2+W+45RVT1JmsNB3LOnq7d5BC8SXyh/5tEUF2pzFv9fVqZYCkiaZ
	5sHqm9Gr+2eNZJBwIQNKlU8mVvWJ7kl8fMYGzSlcN/YYnB1JYlTJkmSCcOdpKX24vUOuQK1GMVD
	exlvP2PeXV6ihG5/dqojPHlimVKj/OgDVQ+TTEbZ5RCmaRbStia6COkMAs+kSbYyFADyEmKfgLa
	m2EZDGHPXRb63bGdbEdl2eQVOuDWLdmS5Zk8Jz8NFSafQ7be9ZvydoHwwf6OosmltL9ztyO8CTm
	7RPEwuJWFuxxR9aHjbXX016J5ONDr4Vnq8HPqT6NZtrBv
X-Received: by 2002:a05:7301:d80f:20b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-37685a83893mr2193123eec.6.1794371287541;
        Tue, 10 Nov 2026 20:28:07 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm11132090eec.28.2026.11.10.20.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:28:07 -0800 (PST)
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
Subject: [PATCH] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
Date: Wed, 11 Nov 2026 11:27:46 +0700
Message-ID: <20261111042746.14714-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This also removes the need for manual clock disable handling
on probe failures and in the remove callback, as the devm API
automatically handles clock cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index e1d8af056234..a3aeb8e607f6 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -660,8 +660,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	/* Get the peripheral clock. */
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	/* Get and enable the peripheral clock. */
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
 				     "failed to get the peripheral clock\n");
@@ -682,11 +682,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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
@@ -698,10 +693,8 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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
@@ -712,28 +705,18 @@ static int atmel_i2s_probe(struct platform_device *pdev)
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

