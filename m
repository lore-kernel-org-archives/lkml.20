Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921A3B8D4F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534859; cv=none; b=vBh7exaAcmtyIuH1hy5jwVuO93y3qQ6/sj7h9kXjViArpBTdDrX91glt20Y81xGFKIAxc3kSmBD0jhbexbroRpOf0JWeLs/f5oAv5ZfeS4VeFNEudX28j79YOF4k9KlQmmhV8i+fHnDD/S+Osn7f9Lo68HlR31CK1BDKS8YZoSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534859; c=relaxed/simple;
	bh=FCuMskY3XvDPPwvJIw9JLjawiUu1vTBO2FumCelMA38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwONfg2XcA5E+uHWI2neAapg5oFVDzgYV3Ds5RSywzf//yt5CTtoWfve/rlG2Ius7KnTKdIc9PeCBv0L5+vorCnmVhjjxFVaAElRfqfv8vkMkTokHfu3eKT0nuL07XAyqbcGsrI0AZ9wF7m0ZTbkpyb9BPeIKpdflTaEuTSsZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZIW2jpK; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZIW2jpK"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so403510b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534857; x=1790139657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=;
        b=oZIW2jpKTiXfIG0Phr/48KpCEgr3jlisDWvN4oSWk6eAPl+jwa93jCw8lf9tYa5Hhc
         0wmuQqtL9FsKj8ahd3QaH+dItoSPUk1QMNMimaDOdRVvpKr4+HqNitzg2wiKgpNa/c3j
         rEFCs+Izixw2IQM9kyJk7DcdrTqw37bGAL1FBpfPaEm9LBZqEDYq+6WOMrgZFJkOBrev
         jfsaMsSayyuQZOpIO1hAqfVdm2dsVd561yjpQvY/YcO31PyecVhWJ1tamDVE+iQrW4mE
         qFKzeOAbLLwSkBWmd8eKcnIK7Fv9yHQQfsxc59l/Zr2HAmurv61VEPFnRpFmr96Nn2US
         GB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534857; x=1790139657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=;
        b=VeNnB2JQFa+qmz6nHxBzdI3LBK7Hx5JiLoyT/sWvTZkPr+1gDkDpd1wDVHdW6MMP3G
         X9VEkuPX97PVws7jvghoC5IQdmN5DDBYcObGbc9i6oNmi2ybYM0wrt1xM161yAMym+ib
         NoEIqleWvveW2GZj0o2DZdAI6H/Lg9q6uoC8lR1n/JK4DButl81BvSRxX91faSpaVj4L
         t5iWGMd7sjF+kWmRKMTQH1R3YsLYW0VVMpqi++ieZUjKugczGLA91QvZ9u0f/ELODQXb
         Ve6TIi4rW9FQIG3RyJALCY451yVjd2BdeAGubV9IkPCKWZ6i22VQZ3Szz8q/iftO9l1y
         2EFg==
X-Forwarded-Encrypted: i=1; AKwUvBxC+wxqTEPI0FrvQXYbIqgL9DQ73/6lHHnpeHnlcxjSWtvHskAighOskxu+AuEak7O9Q+z1SGc/yiJbLP4=@vger.kernel.org
X-Gm-Message-State: AFuF++mWENSS6K24yOU0HYBxM75evDXpAjglRUQ6bfppzQb4u5j9oW/Q
	b5DXNUMmzAaEnp1bLkzh9r0JsD7Rh41p4XAsxPd49VyZ/vyGFqM1sYCp
X-Gm-Gg: AYBFou2ou4LSVWIobo2LIXsvMa7s3SEY2b6x5vQrKU2HjWPqEsJOJ6TGlpdtwtSXbcB
	tHICxvavXXH0IHci5vO5TS2gZo1FxfuMOUwsXjBokiSzqJ8SzFs7+cca50M3Ov/EIxP3ksFrFoQ
	n0cbgsdXBJH2C1xWkFF9jFmfq7dtCqyNWFsIC2/jRXfqT+57KzeGvYVXleky/8zG4vS6VPRXZLb
	zxxWLmMvSXHCWGS5hWzGi9Wq2yIYNOmNirrJpkbeSP4Sk7+kxZvY1Ws2GI1KbBa3lSZPFpNsSSq
	oCZ2QzWtbACVEptvojukAVUR3+SAgxMpKv1Q92EdFRDjCDZW64EFEq3tp1Qa/+o/mX2Ciq8qfgA
	8eHcVX7YnlkeKRY1bI8taiafUyphn7x1q0NoZ2uzJZd1T/fUZ/JakFeKahs6y9OBv5KIC/YWo7z
	5o6MXleWy1WX2rKNMWBIXCUPvioL7p3z8LvY8JJQo1F/NhO4zz9tZSaPsTEt+6V09Cx9XI89sNd
	27kBCZ6h4lpnPyPiT+PJnxm+SG/47SJuflEQU5NdY3fPvTE6aNwDfyS/sOnd95RmW1espGiyQAw
	5QHOl1UuR8X6NM0=
X-Received: by 2002:a05:6a00:b8a:b0:86c:f33d:e3b4 with SMTP id d2e1a72fcca58-872378b6fc0mr2276748b3a.8.1789534842957;
        Tue, 15 Sep 2026 22:00:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 01/12] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Wed, 16 Sep 2026 12:00:08 +0700
Message-ID: <20260916050020.14575-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_apll1_enable() and mt8189_apll2_enable() currently ignore
errors from regmap_update_bits() and do not clean up resources when
clock enable operations fail.

Propagate these errors and roll back the clocks and tuner state on
errors.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..f088ccf80448 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_disable_apll1_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_clear_mux_setting:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_disable_apll2_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_clear_mux_setting:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0

