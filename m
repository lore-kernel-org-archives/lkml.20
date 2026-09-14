Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC153E3D80
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370948; cv=none; b=jIbRD8fw9tCE2yXiY4e0XTTA3sG4V4s0KaLeK/gJ8XXqLSYIHEGO5vFFseq2U/Ou4PxuRpVavkpfhSsIx8RTrNvqbSqhcsz+XwuLzhq+yJprUKPX/woxumkuEvlFHruzYoTCf3tGw51FCHspUeF+5LYVOoFLzQnAQoH7qAT/OFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370948; c=relaxed/simple;
	bh=w3TSv8DyUDLvB/8NFHyYhUD593zzZ6iqidCdBEN1Ojc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyZ8YrqYF5fWIHzJlxEBH/6ljVSfBEocQ86N0wFx9ImuzaKXFBtf+1K2gVAeTv4aNNJOdNCb6baj2wMM6pblqebH/WZO1YvkCRGyErPugJqoZEqyA8FnZVYsGs5dLfNNllImVWhRrIp5crBjALchHXyjWoAU6xTB+vpeKFC2wrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzqKtzEo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzqKtzEo"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so686780a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370947; x=1789975747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=mzqKtzEoeZi8QdM+bQHEUA81EcbSuCyh+30tsMhywznsscfIojwqYRTmT9BN776MVk
         AnZiJKlYZrShU4VARRaZOcS2T7cK6FizsEvrPmOPNb595vM6IrzdD8qe1TzFN0bWe5xM
         KEcddX2gRFmpmKZbPkbSkO7booTds7vjyAya15GN5W3KxDTptDsnsRR6C86Ffe1p+7e6
         JySWNZcqOl4864zGl651QhCkeNYf9ppzdf7INP1nIHiou+Os2RWltul8iE4LbNznNRDF
         Aqyd6gELZH0Ou5j25R23j6dz0k9rp4p7xSDT8Ata27Cf6zib9c8TYa84knnJactJETHv
         0+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370947; x=1789975747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=nR9JmgJIv46Lby6bHlCeqBEGkAsSof/HIDYZDwF3fHGygL0Wd//zpXk5cPttJVbsUH
         Bo71iEzXuZf3jwBudILXiKX6E7DKpi1smaq/yO42VotQHhHCrP5yNiDMhFwdUUYuGWTl
         rpf+oje/TYRtxvCBfEmEwrPocXpslft5YtafcqojPZvBsP/sePcViObL5sWeK2ibHRsR
         dPbK9NvMleuLpKzrkveBodwaEAjgb4IncbKM214J+1nrWKx+YM62FYxcP86NKQTjls6/
         ic6mkvzi4eWwwWFdA85kJbUonMxTJ1UJ+XWaq0dn4fb4BV1kUHTV9liN8o4G5RpAICg4
         teiA==
X-Forwarded-Encrypted: i=1; AKwUvBzIUMoLW6nkg9nq427e4c4AxD+srlpGE5VSyCC3k8Sjfc2o0aPpvCQPLYygMwCVChz0qS4dmdkSpPJJL4g=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Ye7N+laH7jeEbg8FBePD83IbZ1Z0D7rsK53vTRWcJIyyIXRv
	qxusvk30QZWj+8II42XGFvhsFtfnQTjM1Ax4v2MGBKBiTq06sKERHW2J
X-Gm-Gg: AYBFou2ki23AZIYhMsgx4VaK5O6Vfw7F0xKr8JIJskUNtr+G5OC44t6ayd898GLwAb2
	VjXvXkmzreU/p2Z2TMj2G6QSDmFmMvX+7oqaIdMGuyfDrhxB8E/RihY0wgwGPHiIMxJutQHoH2l
	ewnucWsnjOoCJnuYIRNbdTJ24P8ssYqawU2a7B413kCxLfrWhg5M9AFBgffIVSIOeOE2vEuEkNJ
	FJJ8iFADi74Ir9zNoX8VUdzC8FRVz86fzZL/faNXrobAEorKsjIfLnvZvtyx0A5LBRAcaI2CVGc
	/2/u9PLGXRX10DAsPJbrtHtdp1m6sikEVIt/rEi4NPkSqufD+V0zlQZ1kjv3P7tXBXTJm+xBB3k
	EMkMtZG0NElxF9/eP8t4pjiEwPCDgfJ450VXEjw0TI+8Lfhyft+LNKcqJA3t2dcMAOH/oNwSOk3
	pTWRPozAR++wDzBG63/axlvZJTLrEYO1SOi6ey5ldpi99D4kA2wlWNfKxq8iZLuRED7R/ro6MOR
	M5EjyiTTJkiBjNsMtQIqXxNgmp3ADZsDdBARxXFDhrmBok4HsU11ZAxXaGGACUPlmdXxijlyu4p
	13z8FQNz8sCk9sOg
X-Received: by 2002:a17:90b:1a8d:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39dec3d0ddbmr1584578a91.7.1789370946743;
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
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
Subject: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Mon, 14 Sep 2026 14:28:31 +0700
Message-ID: <20260914072842.24420-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
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
index 63e03a40dbbe..aaf4f7921363 100644
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

