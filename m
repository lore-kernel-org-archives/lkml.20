Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78722364024
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915984; cv=none; b=qNK+FC20PfZdXmF1LsGpRy1uydF1IRhNd41P5lYS1TWXy9hNCLJkUXzjclWHAjspTBfC3j+IkfrnxqWESLX/XaKv0LAyGlK8OjK8sZhIFf//76e2rG6wEbDZFz0pcF20zgWLp/hf3VAweggPRbt/f5UCym4SWAm081rb0KB04Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915984; c=relaxed/simple;
	bh=vB63GPIU0CT82jKY77Joqx8rSniH5swMQgywJwLQU6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXDGU4wHD0S2Ygxi8bgF8VTTWliBd/HecTLVZYEaORuUi50J3+UnmvenT/HN7F++WAXITJch0XftlWe2jGfNri2ueKcgH6pWn5xtQFwFfEU/1THUg/sHdcs5uigZERDkAxcEybr5nePBaiMkM6/NkVufFwJ+I1FhfnlZnZBoyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkILmkPG; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkILmkPG"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so14676145ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915983; x=1791520783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUvdgCKkROCjP349zxT7t9Uo7jvFeQ+8hplckcwjOaA=;
        b=kkILmkPG6HoDCk4r+vMQc1IO53yvfM6ZDHU/0ETuAuFd4VVrHzRhMpayBbr4st+l6X
         MhBnbA8znEJ+bozQyNGWazPOAPvUEaTFmPnOZOAWaC2fA8KEiobaHORJ0G7g8o2JjiAZ
         yvByyBpitx47SJLQ+x11QvtbFPFEFxPActGlz+7v3yBn4p/kDL0+Z6v9mvej0G3jcd45
         D8UFyMctYFOc6cTM06rGoPjzzhehTGcht1J7Wz6QmS/T7e1cYz3WNRz62bW/VQZzyb2F
         r9VZojKisekJ6YnqaBmFCabgcAwvUavX2hDHyFMKOuAy79gIs0ze2jfik4o0gJbDxVWc
         j/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915983; x=1791520783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUvdgCKkROCjP349zxT7t9Uo7jvFeQ+8hplckcwjOaA=;
        b=rhc5kjwpFsKYw98Pb/GTwXG/UUlbI6yzMEoQnz/qoxJ1OKamJ/Bp4uUd0BSQPS/pv8
         NmmKpKOTr52tOv+GEogtfP7NUhz8FixrvSlpqpv1FLg2FAdb0bu6bSJA/4DV7R2P2ngg
         i2j0yq9ur+eGPEtw70o791fcThVa8uhiJvdSsLJfVYsdHKEJsVB2lg9/eorZ6D8oF2Xy
         RwFB67+mSjVuXkbnFwvcejXt9gm2hVMkowPOboMmyiDnHCT3JfnMBBSA5wqeTrzmVDT5
         /ZR+WdxOeIlx8Ch/nq2hHojKiMdDe+6U4HolthTDzex8NGi2ddi7Rs+pB7xj3GZbf6dg
         /Sjg==
X-Forwarded-Encrypted: i=1; AKwUvBzjByCKhU/X7JZebYXXytifx7MnTVLrI0VnlQO88TClxIRfZvkP43dN77ovl5IDTdzdDz1pIKV+EyIL8ME=@vger.kernel.org
X-Gm-Message-State: AFuF++kLm2THtkNDw2s+jRtgoOpS2IfEJp6YwtdNyf1085Tuydhlpf2j
	6kSd270VVtcIKjw1mqD0pm/z1JPXCyFa4ZcqevqnuqbyiDHxixghFRAd
X-Gm-Gg: AYBFou2TybSXbcLEERL3U+5iTzZY5IqhU0n4VQVMS2u3rDVqnMIZj7nqGXY+PuwePqd
	mtPT1GqUXqdjJVHkLDsbZD0iW72h0SCztmPGJpGsD6WRd6vogzmD0br47Gn4Yk2sFEdlx4e/Xur
	zEMnxip8M8Ldhlk9UQwoFzS4My981Tt0q6PCipIaWPdanQplz7EkX6Yxo9w0RAST+T/pbGLzWxi
	mGtljcD8Lzk3PjqII4sX1AYjOp4dONp7153rcERmrlhOxfkLLSyHVyligNhR3ldLG6L5ii+444+
	GMk5B6BCeKWBzKInVLgipov2WKZOfwkqfR9AH+rw8vvmOTkyI2JITWJ9U6Zp78N6Xrk4PLgInkL
	Kq6dSj4ad1J8F7aIoTL1diwvmcwG0j2SmlC926o4LnG3VfAhY9T7qEnzZD4AQ+twNcHyv9FX2h7
	86sB+YwJPfR4W6auP0Rb7fZEtHsoXkeJ7kmpjTdpJy+lYQiH1BYyiho1S0FMAEGwfgxsajwRfRs
	O62jGuGmBhHi4Vt8WHC0YLBHgbcN0/iUygF9nD+ywWD/c0J1tdmEtY8/ma6iL8htOcxVQlTmMFk
	1l5AtpKPenhBnA==
X-Received: by 2002:a17:903:1d2:b0:2e1:24ec:df50 with SMTP id d9443c01a7336-2e49b652192mr13098135ad.21.1790915982554;
        Thu, 01 Oct 2026 21:39:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:42 -0700 (PDT)
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
Subject: [PATCH 5/5] ASoC: atmel-i2s: remove redundant error message
Date: Fri,  2 Oct 2026 11:38:56 +0700
Message-ID: <20261002043856.97295-6-phucduc.bui@gmail.com>
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 9b651eb4f0a4..e1d8af056234 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -699,7 +699,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 					      &atmel_i2s_component,
 					      &atmel_i2s_dai, 1);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register DAI: %d\n", err);
 		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
@@ -714,7 +713,6 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 		pcm_flags |= SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX;
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, pcm_flags);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
 		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
-- 
2.43.0

