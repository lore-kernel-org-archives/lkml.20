Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86DD3D16FD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880248; cv=none; b=Os4QvQFxrggkXsRWgvCVQXY0xEogsFxrI5CAOsXBaBRRewcntjPGC9D1qeL0pRGDlW5CtTBFu6nbRLMulglFiulnH9miPDHDP9zwwHy6cEOavyN/yLH62yMIPu0GXbBmHGw0PS3bINcYCwu18F5FCDJ2vrP2l3U85swpvHw0osI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880248; c=relaxed/simple;
	bh=fow1KNfeFBOwUBq/AuCok83xrJa9sG69vnUGOaB1hgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yt7aAx7l8B2DbuPxC0B8JYT5+sjQyS+uHs2y8i2J4ertRPIuWVE6Zow6HLAXp5mfKZ1K+YQjzTQXn6OyIksXO9m9k4UjD7Gx2MS98yjRU4NjYuFOVNdFdq6n7v85ilAorWDDJp4k/9GkKv02/zlnjzQO/A6xz02dsHxkgtoSfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/Oo2mKt; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/Oo2mKt"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2d747ec6185so12089605ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880246; x=1790485046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhSaVgPZF5rm02UijUctP+1GziT6CoSBtc+R2AKZdGQ=;
        b=J/Oo2mKtTIQoq5cyjzqWlKGA4Bd6OtR+BLMia4d40c/CjS8qq7cjHiBtL5c0l67RZb
         2k7NLOYSg047iSUWJ8hPndh8gfI6pcTmRL8iTkkGclI62fYFheEOgYZXe5EtwQFClW1o
         5KY8cTnWml2xQic+ZB03oaeTbsT5t/2a/TWjEW/3q79Zyzx52UYFtj6noEpbB9aPCPF0
         ZGuZ1IcLm0poRJaEZ0U8jDIzaX6MxS/+a1dK72t2m7wJyJRI28J9W3Nsp4MZmO3CdKze
         ui91u6OgoyLpYvahsHlzqqojIU+tEuHeoEnziPtdyYN5tY8IrpOXJzsICLITRajvq87E
         z+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880246; x=1790485046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhSaVgPZF5rm02UijUctP+1GziT6CoSBtc+R2AKZdGQ=;
        b=qcywW0aW6jRqkHHgah9RhF8ARZnod0psYMfPOvG8+U+/sEj5EZk79cpqPPRgMY9GSz
         zJT2w33gAV62jPKfzMj7sRRM3a7Bo5xdxACJWdKfP3ukoRl/x86E92kpB3s9DjtMlpUZ
         lQFmdlEOjjlQismLKU7sHLBZcIRvC84HkwFhs5FnICn9cKCUoeTspUevtkZ5uMAkV5da
         82RwOFzhWHZ+pjeNV+rRhdNsQQboAPuAJ95VypLOflc91NtS41fuFah/fosMYYd46xY1
         mBLfVCqF46vvGZH4PuSaLqgM+KfvQMGQLn4KGoE9fIiteiJ0Pt4hRYMaCJOGj7ntA8K2
         Z/gw==
X-Forwarded-Encrypted: i=1; AKwUvByf9Xr2bdhvHVQsJMpiaEHtPfJvyRuAJjjiYSNlTyZG0RK5DxkcYRnyyQOWGrsLeWF8Qz87w37JrBTHAkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kCeSBXxQbPrisqAwsJXdYbxjT3IG/gX6iWk73Krkon0Oj8meTs
	bNff5ani/nGv0o3BSLCXrFFZ8IRCTnMBxMgz+XSzu5qfR5ndXlKXtBtw
X-Gm-Gg: AYBFou1a3j7XgitP7T4eTBnDrNo7zD+va+HHlUJ5b7p/7kwgXASIkFJQ8vSzu9SMSC0
	3dULo/hfp08CYvUC4Jnb/Pya7KPlcvHEreR/QR2nrMXcV/asnnywv5au+jexe2ezyMLxNjL0z41
	pq1fHNzqvC4qXmGnLp4zMku7J5M+lGJO0bSuNzTbOMQmuN0QxQuwBz7e43OMAEaoITrl2GbuAfx
	zIdyAT8Lszs0v/t57j5yLvfKHLBEhNwmJeB24dA4XGSc2IBwNX1O6lpwL2O1S84lzja9EKECC/W
	cykLPrDAab0FLBQgEkZahUKrK4Jhj6g2YLAdyU1G2zAVCPHXkAaKwFJt2olH0AwzjTjfPsh82t5
	hdH9iEnWxafDDIcQu88L9lLAFPeyio4NMBQ8ypb8YDVDyP9ZZ4dXEHwLMXFvxpsESN0x+f4CPIl
	39awXkBS+2vH0uPTG3lEyH33dFb1hyBOCVf6zuJhCcHJHGnI7YWV1gsGu3qqow1olGT2gpBi1hQ
	yS1c7Qpj1Wln6PYnXn1RLnd3o4vzKPAUbzXEZyVdu6FFDt366rcaxrLiezlhmPvGxmHbqd/nIZ1
	z16124MXMN7ASWCB3IqvGlSsIgfF645W1bPRQD19xJ7CtSA=
X-Received: by 2002:a17:903:3205:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2ddb1ab3990mr125558885ad.1.1789880246135;
        Sat, 19 Sep 2026 21:57:26 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:54 +1000
Subject: [PATCH 15/28] ASoC: tas2764: Set up V/ISENSE on codec probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-15-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3680;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fow1KNfeFBOwUBq/AuCok83xrJa9sG69vnUGOaB1hgI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xVrK2bPvZvHF6X2dCXrwu1KRTPjZ9y5ViY06av2h
 xdHm9cVdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ6+UyG/6nut++9+/rpg8y69fskunk8ZVavXr+WVdSMRfcYq+WiK0sY/qmdUP2
 7/MWbypxjaSUxbA7lme6/Pk5q07ZaOU/qrPlOZ3YA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Setup V/ISENSE on codec probe rather than doing so on every hw_params
or TDM slot call so that it is configured at the same time as the
rest of the codec.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 61 ++++++++-----------------
 1 file changed, 20 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6654100ac91d..39372d0446d0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -266,8 +266,6 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 {
 	struct snd_soc_component *component = tas2764->component;
-	int sense_en;
-	int val;
 	int ret;
 
 	switch (bitwidth) {
@@ -297,32 +295,6 @@ static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 	if (ret < 0)
 		return ret;
 
-	val = snd_soc_component_read(tas2764->component, TAS2764_PWR_CTRL);
-	if (val < 0)
-		return val;
-
-	if (val & (1 << TAS2764_VSENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG5_VSNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
-	if (val & (1 << TAS2764_ISENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG6_ISNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -452,7 +424,6 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 				int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
 	int left_slot, right_slot;
 	int slots_cfg;
 	int slot_size;
@@ -499,15 +470,26 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
+	return 0;
+}
+
+static int tas2764_set_visense(struct tas2764_priv *tas2764, int vslot, int islot)
+{
+	int ret;
+
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
+					    TAS2764_TDM_CFG5_VSNS_ENABLE |
 					    TAS2764_TDM_CFG5_50_MASK,
-					    tas2764->v_sense_slot);
+					    TAS2764_TDM_CFG5_VSNS_ENABLE |
+					    vslot);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
+					    TAS2764_TDM_CFG6_ISNS_ENABLE |
 					    TAS2764_TDM_CFG6_50_MASK,
-					    tas2764->i_sense_slot);
+					    TAS2764_TDM_CFG6_ISNS_ENABLE |
+					    islot);
 	if (ret < 0)
 		return ret;
 
@@ -821,15 +803,12 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 			dev_warn(tas2764->dev, "failed to request IRQ: %d\n", ret);
 	}
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
+	if (tas2764->v_sense_slot != -1 || tas2764->i_sense_slot != -1) {
+		ret = tas2764_set_visense(tas2764, tas2764->v_sense_slot, tas2764->i_sense_slot);
+		if (ret < 0)
+			return ret;
+	}
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
 
 	switch (tas2764->devid) {
 	case DEVID_SN012776:

-- 
2.55.0

