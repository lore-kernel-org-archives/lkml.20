Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F035CBD7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915977; cv=none; b=LdTo/TphtPJr7gjLBR63fNfXQieO0fsTG66CyP2H1RSfEqkpoRli1aVp0sSY7rDVdnONzLupr5nDVxg/p0k5UzaroBeqv2XBEj/n2HsS3IRUFkgDBWYsMjgCB2nq2TXUw+59on01QmnzAhKoDM9LjIhrKhbQtdQQjeRvzkAfLkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915977; c=relaxed/simple;
	bh=j10/ZsLN17TBlhm6+uNpFoq3nbtgD9vXY3E5nQkwFs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FT91n6AWHvWJjzekxHr7jne/gn3uVFssQl/wh/iIiH0H2G7zr6DWguwNzN+zWpZbNwuDV2HyJRQ6o0tIOqxJkfYgpOOglobx1zbKePyL2OVLK8GyFxsrQbraIxHXPw2VdABXtdine0h5b9AeAZI6MRj4lUUnioBPSfu0WSZiMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ou8fUxAP; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ou8fUxAP"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so14675915ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915975; x=1791520775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJOT7+NCf5K/5kFKuz5HB9vHPxvovBR55Pk8e6dUoC4=;
        b=ou8fUxAPlexIFSiT6uNxBNkRWgCaZFaKIPoIyOLPlrzrbZNbx8PsIZPZYj9BPZ2OMJ
         zT8HvfVGojUIOra+X65RsTm8qWs9agyWgA6wmBYKiEpJScdMfiTGsQsg/SczP497mcJn
         LyFTI99AphQM+eGqqqcAqk3qmUTVRDVTAKkHN97/KYIQLdlQf+Z+QEd3LNTKvJ1ngBpA
         iCRupcx1+gadaSr+P3zyxCcr3eS9+rLZ67jLZsctehRm+lcV+xK1MtLz/pkEtxZbfNro
         U8HEfbAKJBxkieAeppaHTx/eBqTcIz3fOhtPYzu99OfJFoRIXBbYe8wVv8QJYZksxRAQ
         B0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915975; x=1791520775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJOT7+NCf5K/5kFKuz5HB9vHPxvovBR55Pk8e6dUoC4=;
        b=SkQwIxCepLbNjcw7Ksl68aiLRsBo+vgTmQCwTYkNbot5XvA8KhXBJ/hd5JPW9yPI4H
         PkuQF+7oJKvtuPnygPA+SOr6wpq+uCEGIZct5YDrzc/F1Pt/np3QK1jhGDGgg6uuSQ2H
         5IHTDbLoLLiSAwlWy+rVwJslU46gev+5C9jzuidHvxUTdniIPQ6BMSu8gbMGhUuo9SIZ
         /LsoUEMmA+gg2SHBPFBOb2/LF8ywuunoOH7ph7E/snASp7nTrQUZuhNncqxljpud3eYM
         8DYrkNG8IMIxgwSfezanALBwaL6veYECsiiFR12V7BLYaR8gfJ1MunOM9aOw99lMDcjR
         OEsw==
X-Forwarded-Encrypted: i=1; AKwUvBwz46Re7BSDEwKeN/rkP1T2EcZPWXwi9nwMvIlju9qCat8i2HYLko5t4Q17kGqsv4zUZPDmEVGTOy/bEcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuVEfYLEbATJfX4yEhMgUE/HfB5FIgcQWsH8lptWYcX+F6twzd
	Y+tfhM2HCapVZ1+5LAtpQf4nVU6pndEA8SAzmBmA9FAvRGOD92g7LKHQ
X-Gm-Gg: AYBFou247Mat/8u1JbpudxzRg4yGM6gjKPjuKteUEJVV8o9uKWdTLq5sOANKfzUrcc0
	Sbzxvyfcg8XEsFpbPxqnGPC8rW3v30RP3Lj6vBq6/6bG29bo79awnSm+IPlpwUQyu2MTl9jFH9+
	PwrjzP5c3EVofqZE1ECVNWDEhQVpsAa7TxJ9/VpYn8i9xzqVlafd5Gbm/94a1/2DJa609LkRWWP
	FPkUOEgi8KyLaEs0Z0miKJL8nW1PU5gC4zkdXiL8IavCubPxwhI6bQf4k57GcgWExKiI2v+jRxS
	iDEcYhdRqL/4ZyofRjqbAgWzhkXOHKHYVIJfLhE+fga2W9oJCztP7Co9ItOh+WB+TWl7jz0DCpA
	InNUtMeS3qPC4lxW4dSxNyqHsGVuOF/IkCr54cCdQbSD126v0CY1Ki4EZ/0KY6DI9YEHeI8ZMf4
	77eFg/PByjNiYXA7wv/xiGWpQbs8eVoOdeugsT2gNHofNju16Ai5RfxsuhQpgozenl6abQQDQBS
	kOnNozSzByytI0EvCOwwXyDl9a4aYfn6T44+W64YrFxQOtMaEH6iOu1vjE/iE+0UXKJTUFp660O
	NTJDgEE3fTz7Og==
X-Received: by 2002:a17:903:32c5:b0:2df:b047:72d8 with SMTP id d9443c01a7336-2e49b7ffbf2mr13420335ad.74.1790915974574;
        Thu, 01 Oct 2026 21:39:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:34 -0700 (PDT)
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
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: atmel-i2s: use optional API for gclk
Date: Fri,  2 Oct 2026 11:38:54 +0700
Message-ID: <20261002043856.97295-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The gclk is an optional clock according to the device tree binding.

Use devm_clk_get_optional() to handle the optional gclk directly.

Unlike the existing code, errors other than -EPROBE_DEFER are now
returned instead of being silently ignored.

Fixes: 73ad0df57290 ("ASoC: atmel-i2s: Remove unnecessary audio PLL clock (aclk)")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index c52d048449f8..6ca230f8adc8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -670,13 +670,10 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 	}
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
-	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		if (PTR_ERR(dev->gclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/* Master Mode not supported */
-		dev->gclk = NULL;
-	}
+	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk))
+		return PTR_ERR(dev->gclk);
+
 	dev->dev = &pdev->dev;
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
-- 
2.43.0

