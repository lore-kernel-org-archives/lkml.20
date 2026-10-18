Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011E432ED40
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306084; cv=none; b=b82MHIKlsjM+lsmLRxAyQ2M0aKXXbamUMjlMlqoXMoV1S5gFUzQ16ZoNZFsGBzNZvw5oEhxhR1qPUSlcDt1KxMIUT4bgcRcegjHvMY+oPgJpYkXvrnUh4UUiqlm+y8WEmzWsESwqTwu/tsxWcqS+79gU7lotWg6c/NAAJNrHcEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306084; c=relaxed/simple;
	bh=iAQVZOMW0+bhS/cf91WaZ04ecjIibbvlCOaHvWxii6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxeLDwracJZqlmeHEAohqv8nTsr9oTpvJH9fBIrvXKeGOr+hqB+TtO8YbwbZL7fr6hQJ1mf76a190Gof6GpCRc78ZXT+uOi6Qh8c2rINTc8lfm+T4Ekk3hcqmLh/MVQlESs9aLaJ3yUx6ShzkDg8pkOaIfbVG0m/p6Uz+ViIoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1C4OxIn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1C4OxIn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e901e114fdso4800735ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306082; x=1792910882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Q1hldRStoWiBDf2EXexTgdIyIEGJ6QyfYQsG5TRVsk=;
        b=O1C4OxIntsBRRma1DspwdgZsTGU7k4GWX/jNt7eOFUUG8gyv0iQm0RughEyXb3aPJ2
         GeOOWo+QiXDmh5bVU0IkwEWSMW6N5wC4a32ZpVgdNgU7OZX77SK3X3VZU5RKA0vFg3Rs
         qtbMLH2cZYjqiBprrm+AuIOjEXlwotGupxLMr3+ctPEyW/WCp+ddpRECHIRjIjGvQY89
         KYbg65W6xnDca+uuo7YTMSzYbNvnezzAWXL+B5j6FWdDVqBTqSZlUptITYjElGkcSTj2
         JIP6u+GbyO+iVeZrzVLGBrAgNFslPlPdPCkorVlXWw/FaWB5qjxJTvgxJGf3iqtu5auW
         GvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306082; x=1792910882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Q1hldRStoWiBDf2EXexTgdIyIEGJ6QyfYQsG5TRVsk=;
        b=k8rZF9+w3WEsgwUr0QUZF/dIQc57N4imLeX/Jc5d4xFnRo08dYQjbAojj8iin4p0fi
         iWzILiCiY7IfNQeX3g1ZGo+ylXr8m+WElb28ftHzzAZHx8NvfwqfKwz/YFJxxdAe5Usf
         hbrPdF2u5IE85Tudjic2p0UMDllGlA+GNqP6Al1n/5RMrgVrLOJElWmUvcCAPTF2fUoY
         gQR6KCd/uFWh/bFrjXats/lDF5ffYMQbM/pBeCkmLvxB464E3DLXOLswRQl5mokIuTh8
         QGNeXfxVbJm47TyIcu9jRuNVBzxBRmZXE7cACitf1e9/8P28on0fvAaWssSqKzcE6u1O
         h0AQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8IB6t/pAvM9bv9QJN0/Jcl/x+TYOWqFiy+ZWGYJ1mBXYlv/0gIC6+/DJydKnVAxndV8irV0knWdhLi2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdUbBKqFcE+q/eyKADLl+FCTjJ7K6QHzkZFOB75PzGIpAc9FUI
	7NdXkhxwkokQ9Oo6PB/zwXuen+orKdtE1vzWmydPZ/68pRF/V/3owCK5
X-Gm-Gg: AYBFou2G5HvTZGc9nNPAohQfJrcyN3oIeqRIBeEj0Y3yY/2dw0QCObFd2ykn8QE59VI
	qh1tO9zobg3G27uFO+HAUBIPx27E1x5NFwBEW7+RS54VxROEKhofNC4/gMMJJOk1k9E2cT4ac5g
	PQLJY7e7ae1Uw46afW8i/VQR69/TUisUKzb5v49vXtB2ZZNr0k6Hw4hK4v4A1BPXNslMD5EVhLz
	0uqRwN0QqPuE4akIk5FfJ+TWVgMPAGR2J5AX3XOFA3O649hAtnZ6BFlQug3Qdoga468B5GHfAyh
	2pGL8XSDzu4dWoLhe2bxK043AMPOsaX2a6iD7lOpmMeDfTsMW7pMHe0LMJ8D0KbcA4xTfOytlq9
	gvid429XGB0uI8bl0QAnX2+8MqVMR/pODSZxHtNeIX7OlWUjMLLbp/g4TN5mupGehudKxR9SQp5
	UGRi4bZ3k24nViDu5Wz7PTp5ymLrVOXny96P1EjVIIIwK2Tx/BkBW29CeHT6EDtrsjyBHxHjZp7
	c3pvao8l+RyJloEnvO3dRLLiUn41LWRSo9vVezftvP/EsbdMfW42cD7re1u2hvUATR3umfbFos=
X-Received: by 2002:a17:903:1251:b0:2e9:66c4:1711 with SMTP id d9443c01a7336-2e9a6d40eecmr36944135ad.52.1792306082373;
        Sat, 17 Oct 2026 23:48:02 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm27280335ad.74.2026.10.17.23.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:48:01 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	marex@denx.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: tlv320aic32x4: Fix definition of TAS2505 HP Driver Gain Volume control
Date: Sun, 18 Oct 2026 15:47:46 +0900
Message-ID: <e50b88689e8efd353ee597a6692ab4db30aa63e7.1792135145.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135145.git.sammiee5311@gmail.com>
References: <cover.1792135145.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TAS2505 HP volume is bits 6:0 of page 1 register 22, not of
register 16, which holds the HP driver mute (bit 6) and gain
(bits 5:0).

Fixes: 2169d6a0f072 ("ASoC: tlv320aic32x4: Fix TAS2505 volume controls")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 sound/soc/codecs/tlv320aic32x4.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 7fec94768afb..2ee4a9d2abf2 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1057,7 +1057,7 @@ static const struct snd_kcontrol_new aic32x4_tas2505_snd_controls[] = {
 	SOC_ENUM("DAC Playback PowerTune Switch", l_ptm_enum),
 
 	SOC_SINGLE_TLV("HP Driver Gain Volume",
-		       AIC32X4_HPLGAIN, 0, 0x74, 1, tlv_tas_driver_gain),
+		       TAS2505_HPVOL, 0, 0x74, 1, tlv_tas_driver_gain),
 	SOC_SINGLE("HP DAC Playback Switch", AIC32X4_HPLGAIN, 6, 1, 1),
 
 	SOC_SINGLE_TLV("Speaker Driver Playback Volume",
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index cfab6f8ce5ac..d0c2e1002e99 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -94,6 +94,7 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define	AIC32X4_LOLGAIN		AIC32X4_REG(1, 18)
 #define	AIC32X4_LORGAIN		AIC32X4_REG(1, 19)
 #define AIC32X4_HEADSTART	AIC32X4_REG(1, 20)
+#define TAS2505_HPVOL		AIC32X4_REG(1, 22)
 #define TAS2505_SPK		AIC32X4_REG(1, 45)
 #define TAS2505_SPKVOL1		AIC32X4_REG(1, 46)
 #define TAS2505_SPKVOL2		AIC32X4_REG(1, 48)
-- 
2.43.0

