Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8A3803D7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880130; cv=none; b=tuaKee2/4jM2j29SOFnoGVb9ctJDDAI+XDQ+5CWDqoPy818HPAUpL5QoEqKPwdv7LUyyTYqBvrzhcllPiCLKzHs93XEWMnvdqpSThCyumorszPVgFqpr0PY1s3BZubtxlGWjcaZd3Tjsgui/2iiRaIjZLes2MzYsdJSyKGVqzHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880130; c=relaxed/simple;
	bh=pv2gkAEIZ5zw2KW9xVGxwYIrZhPA6WLMHSM1zupGGAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PyFVZeaZNqfuxFJWRIeqEdy3ywemzQg9kcKHPSFGR+DM/28fW/DoCG1gmN0ZxSKYtYo93H1Nw5gNmAj/tzWeoReVqopsXJiAaNs2ndFJgVvh8mSEv4tO8PIdLWVxRKDGcRMD1yjDg3jB/4+LnGnIeZD8PCJDnU5c+Xf/65IJH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbTojVNN; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbTojVNN"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f0135fso19124835ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880128; x=1790484928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=KbTojVNNZE/32Iw95SaFTeRqi2OGv0TOdAZf1sqN3OcIPpz02uM2dskTokK7we47w+
         F59m2gNBUuV3NwLvLAdViqFfuGYvtzOXcu01TQVIEmLbMi3aaKWObgUwPdFJd9/6aBb6
         aoDRD5RMoyWf5q7pvWzIXQcKQbSeo86YzLWt9AWouRVkKg7D0T1L50znJVTLWSEw1rYm
         1VX9xtU1m9bUffY/Y/aI26duSpa6jSEcJkT8MuzoDsXVz7Xo8C3M0extUuWA0DEQp3ON
         PdBj1wmV66wn/Rznx5mu3foeKQVhsYaAuam21vYr/OI21gR63mMSmt+NUiYdY+gOOIoQ
         RUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880128; x=1790484928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GkASic1hpzs9f+gvFBpKnk1ih+SNPRQduHprBjjh18=;
        b=FqT2bF8evCtWBLy3qqPJzEJIWCxHTHAAnU4GYSnwG6OX6lXdXyKjDw8qTrb0RTdmtX
         nUu4c/+wjw4ZbBEFf4AXk+pbX0apieuCYIzOL/8FhsVLpMqmZmb5yCiFGcA6nJDVBu1V
         gCKH2YF68sPBHL8sZj+Plv29OZvnCAKikqmpmy6y5MckMViakhWcaKQj6AsxppbBuglB
         +g1XlmH+1KaMaW8RNi6BtVWpw4HyY6k0UT83pELg3gE9xpB+4yaQd1URQi1c/YKlyCNa
         pE2EUdTCJ0CSdmJTKesRwAzUYZL2e3d2ZqZyTrAjW3GpJoV97/GGQ1N/zRahxcdzC+/7
         hW5A==
X-Forwarded-Encrypted: i=1; AKwUvBwVhu4e7mcGaIM5cSE+dCUzb3vR3l754+fDDP3hCko8/zdJftY+8kG4jxnfkfLsVhEZxRFwVGA+JjNnFuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lUMjHybY62vQ5UfXKKFsLSQ7wU6PrGNah/H5o7bIDoyt8DL0zG
	tEbB6BHNpJQyg+hjjlxMFxbpLHsZTMPOMU5CUIbNu4xbgycI2iz5SdcC
X-Gm-Gg: AYBFou1mBzs17aOdVC51AAh133E70ZXYWmchPOEgFmVSTa4Ra3kAxs1lK8A2iav7NFB
	rpFd1jKJJpl9rFsQlp+BbD1GEUdVCShF/W2yoGgcKIdjavUUo08H2XD7Tqi4m2aGfwfk6tG/DjP
	/Rcfgc5lbUdW23VxEnL4LBO9XTH/U0f9dyStoRyQf1Cw9ve9ph8q4v1h2TcG+5h8fZVqVW+WppB
	G+kqs/vtlIgglXC/fdazFV1j2KKRrw/eBIOjHwDC8nDeF3IkaWi18mXOwx7JteQf5lmY+O4eOIC
	9HBaWAgNmJYpk3o0yTquP681A+UIJfaILRyKr+8+ViZfpESbghis7FaxXv2Gpo8IH99WWLyACXT
	REMAv/Tc2BNQeH97QwtSeVmtbtUs+Bw7ZU17amBekRkktLQr2OL+tvMTVmQJyxCynDuoyS2ALEv
	VyWnzVBPuzyeFico9QAhwtH7bWUiElGqr30jOsh73SYRWJZC2BG4t5+ZHSR+FWIo85JGXMRJi4q
	9UFo95YtGxONsXBFJLD2RBvBYUy9WhIJdnUtwVepyIvVbihgCI7p7RHuNZ+j1bu1uFbrmI/MHdH
	QNGQOsIDxn98zUKv0bsAKXe/as+f6ZqHj27+CE9wsHqx+1183g3Dy0crSA==
X-Received: by 2002:a17:903:1246:b0:2dd:ad74:ac81 with SMTP id d9443c01a7336-2ddb1bbfe2dmr111629155ad.28.1789880127792;
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:41 +1000
Subject: [PATCH 02/28] ASoC: cs42l42: Fix typo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-2-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RKZhvpz4A2rORIqdl27bjjryHeuUXe6kyHBpGORO8M0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U3+zQnhu+zaJQKbtE55GvuMdeJjUP0Xn+D6iO1s
 kfcag4dE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqRZxZvjv09Fj/vVMx40H1RefGF4ryvsty2485Ub2Gn7jwwt+e7WcZmR4oruqv/L
 X3j3Zqp6fA2dZMNX5TDt+qnrCrGgbgfol+he5AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik@protonmail.com>

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 9e40c03ada4e..b5d69d5516a6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1682,7 +1682,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
 
-	/* Read sticky registers to clear interurpt */
+	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
 				&(stickies[i]));

-- 
2.55.0

