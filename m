Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF4488230
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782635; cv=none; b=ulqspABSxSiR1TTyGro7rAiDiGOnfe5gY5qXebQwqVUFxIow9VNQ3c2MaVrElkNJQPgP2nkZwEO7w6HMjgEcFPYSNcHmifb/KTuDom7ZiL7iWtlBniXIh8z5xptcn2JfpNoMjyzPokv47ITcSN0/F5p2auQZx/T6CNI8fD4DtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782635; c=relaxed/simple;
	bh=aiZEyKgJmHLp53zVzZj5+EjYzrNr0SLdC82B6Z9NXh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnuNqKpkpqwVFkGpQMq+YDh3EQCSW9BvLwQIg6o5hz2tJhB+z1K56Drn6MuwYjyVvxsX68FVgbgYaE5kk9n22BXSG5BIE05SyG1UbGVwb9Bsf3IBpcIf+8RA6pkYnGN6SxjPJv+bTkj8gDHXw2R51dLxrUhVptTofpvw7WVeuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDAmdslf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDAmdslf"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db3305f94fso22468845ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782633; x=1789387433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=SDAmdslfCQP6+ORYJG4IWH02GjkxsEMmHeisv6CYeZDJ2AqqVRmH1AU/fM10fzYm8L
         PyyVJycyIKE2AZaeakb7qzh3tlCO/1R+dYkwfwYlZEdqghxy/1gKwIPg2pBd5WMCB1lZ
         uv/GMSdCvqUhivS7gcKIoW0ezPywpJJb/We6sneBTFJnByX3QHfSXt4owqgG+i62xVKX
         BNTnaeHbYvlyQNit8UfJFVGvvO7XBMHevIvSwXhzqJa8YqapOEjuZZ3hs4P6MAZtcTqx
         +ON0DArSfkKE7tZ9Ztz72dwgDUduK39bt+2UZoeMy4vhwHMTzVtk3xZECQPsYr4pJagk
         tLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782633; x=1789387433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jz0kWZe5bmFipVumA0Zj41BqLLQGOY62dKowlWDNz90=;
        b=Rofm/6NwFAZcB8kK6D3rUnF6UJprMZ5ITFI8Sc2Vaq3vL9Bp1xDVVYLoH791iLgXK3
         CTily8AOdxoqxRygklBNqjRXT4JhD2fEYJvc05mo31VDVmYsXwAeEhwAme1DL0S2JP+t
         fE7vuIe6mmxtlm4AzFjjs/J+BDBjsU+iwb1O+BX9hgH4dkV7deOPMJ6LvOKelE2BD+oX
         HAkaphZOOscjuH6wged1GDqXkZtn6DZ757WRHAhF0StT3llXBtbctArpQCK/6lMN6czx
         wfmd1Bn4iRIM3VJmBjSAlACFvD+ygSz5qkhb73FBnQ6fUbn57/arfuQMJvpFCf8e+S7I
         nuNA==
X-Forwarded-Encrypted: i=1; AKwUvByt4qw8cHT5k5zpmPxj8FKs5fKj6DZ7ni2VFplqUUYVhPnDDnR+btitu2QI9M9y9wO2TnlF8oTriZLVPKw=@vger.kernel.org
X-Gm-Message-State: AFuF++nw2yprvvSBGD18V9AEbIqyF7EOE92pVcM7NldawQ/qBXHEHT9P
	TCy00lieid7JDh+AnI1YEvWbbGFL5v3euG910NfAOwZcPuYyGkBiCh8C
X-Gm-Gg: AYBFou0kZOTzp54MPvnhMmbZns5W4UINFW8RkuEPI7AYilMnBkrSSlBI5vz1qKo5fbU
	p53oH15V637rtSpaNiXnIUg5HArGdnoTl0OftytCebS+BjmnWTED0Wke1gq0dx5hFoLwky4aM72
	UZ4Nw4l3JJM29dH7ca58ISVBjZyN9OvTKL5C864Lavbr2eKd5LQPgY4GSg1e67uuMCb15hRgLzc
	hFoaf3O7OOkPRSHbchoqPddTNBCwJ5eMRy3gxTp+vHb3HTUsi45nvFFD6ndwjIxPitiSMEo1tvf
	P0z4jMs6qBrounbuWT8hIxs+Xbwt1KeqXoxLjmHiEewt/Tej4/uTX7CwjUX5MJCK9AsXTLcf+Lh
	Y0SnijTWb5N16O5ADvlLomfm4rVDgXEde2dPE/ds55PM/ZM/7RH9JKz3jw/sn4Gaj/oHFaLcwzO
	76ncDOnFzkKHA11MzWYneQUjla4+3iJUypEsHUucanM69TlwJCCKvkc0v4iBmlftH+a3mufzhX+
	P2JfF3CLqXxKVX0XKzc6SOYDZBx8BIIu+v1Lqr6gUknrphGmGeqg9ta/iIQW2o/cS1dihIKYCh7
	DYAI
X-Received: by 2002:a17:903:4501:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2db126679c3mr222996345ad.8.1788782633459;
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
Date: Mon,  7 Sep 2026 19:03:06 +0700
Message-ID: <20260907120310.135693-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The return values from regmap_update_bits() are currently ignored
by the clock and AFE control functions.
Propagate the errors to allow callers to handle regmap update
failures.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index ecba13eda440..77511f6fba41 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -564,9 +564,7 @@ static int mt8188_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_on_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
@@ -575,9 +573,7 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_off_val(cg_type);
 
-	regmap_update_bits(afe->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(afe->regmap, reg, mask, val);
 }
 
 int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
@@ -617,14 +613,12 @@ int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 static int mt8188_afe_enable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
 }
 
 static int mt8188_afe_disable_afe_on(struct mtk_base_afe *afe)
 {
-	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
-	return 0;
+	return regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
 }
 
 static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)
-- 
2.43.0

