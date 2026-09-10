Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220541D652
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045092; cv=none; b=f/aVB+edu4x3xQEm974JN/nNIsaxL+v7JZVIMuQDytx0pRD51KUVXwuER4B1VsSABz6sw2ROqYBdehcSZx1d+C77X0qh5txsvokCPoccdfSY2ilPG4rm/LICmcSqrQD+iYkPzGZ4pBRjnrdk0Qj1kgZNFuumWirubE/azA2Tp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045092; c=relaxed/simple;
	bh=8R+M9WKTmBHOoibWGxqqRpuDlDmGb5sK/DQtxVHwCLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HP6NsM++E26R7MSqRSImxqz/kZ4ub3tsP1nLsjs7zA5Vh6UPAJYLyTCYM4u8wb+hZN5KOcfFEZyBqxx+gFm1pqt3EzvnHP0dUWWzPFlRpKxar12GjGcqsOt2lVFwdJxKaPIQjU2psix0/sOLA1z3xQ3P/XtCMsxvtobjadtIWSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5HltfKi; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5HltfKi"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso416173a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045090; x=1789649890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=A5HltfKi8t5g56eeHdEmVbb2Ir6y8NFvDUzVTYN/JjIr1txmUsNBt2ISpxsZm7Iynx
         0M0FIce4+q/fxX6Yfd3T89R7jVafVfJu80aWi4P4aHeNAh7VpAGavHPkyhEP4tkv9Viu
         5fJF1yjNWvtMMIa507pYO66DN8YrlgvU3B2pOiat8QnVtDpyY/4NQsbBgR8C0TNVTtjk
         dR8ivJTINogvgV2jDUGkUlZsZprrsRsXjgFPeQkrol85FO+HkNBCGn21K4LQwcZ0Tcs1
         v+XnrywjpW/GMPiH8o5GkMYRhu3GULhxb88qgQLjQNWjqTM6+Lgln4oV19cuH+Sbtxck
         l3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045090; x=1789649890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=rnMeGXqsqU+jgvTfHn2ZW1oOETw+i1LYUCdtqUtgyQmRF0WTNYYG+L3M9TM0xRXTvZ
         n+dw9NYAufIeOoRrBA/GvBWE+iJ/rkKPNIg+PHHHIjABbkGc3nfgWPWypf6w4lkl7/2H
         xyQzzM7kCIeNlnYKWi9TvXN3rBp9ZREN8WuZvOYnPAJDNnD8USPHW9Yo1GPjWeCpUiIN
         i8odar/+XgaqXF5x6NV/SAT01jk+S2dz48hIz6gPRYms0NnozrPqdgtn4OGPk9Ayzwyp
         QX4baG7kIGIdfSfvz7WY/nsfhMdZfxnT3oN4fPHPWlxahh1nxfF4jOYNnFek9bHpcMEe
         7uPg==
X-Forwarded-Encrypted: i=1; AKwUvByPDHS9dU+WwC7prpO+bkyaQwVcQqrdYoVKTMosxsZ9VYdMYGD45n4/GjtGlN7ZBTK7EmgilO5raioJkQo=@vger.kernel.org
X-Gm-Message-State: AFuF++mUVB3eEANbO7mLYOlH5PlN4g0HoiDFsrEjfAcKnV387CO3fg0Y
	uZ5BgUartyCvSF9chNnSPXG7Qg2Q+DT1vs3niLxyt/WjGOGVnYwY0nEi
X-Gm-Gg: AYBFou0cXlFRX20cPyb1Kr0V2E4p1/shPMt2+aCk0DFrGII7hkhefm6FXN0omGIGeuF
	QyBL5McBmd3rnWqw0Y/3jUr/GwiJQhT/0/b0VGv4g6/wAN0D0+GfTGOA8i3b1rjnHGlh62+4lRZ
	kabiKU7Cuc8fTQFCnxOWVR7DVxRn+rIOOItwQZeuzkxUea1+h86KRp3PraZE64bqhwXUvZgpPa1
	84wHsnsOgXyshyeJR5GBX896v/g8xmStEcxSGjmncZ6ig9YStRMIybKofv/OojtLXsVNLAP8UqN
	tgcPzKgn0Hx3Dy6b1sRAx5vX48Iy6BjFf1d3WNfUqaugJJjUOtyo8eagLjKA31qN/Dz9dglCnlX
	rg/UeBv5+MiCz/8XhqEAukjuSMVTK2LI650kQrqyN56CJOLCVHx2n+UK7FYDCg9vbC/RfrtLT0J
	aqwAZKipFMUPuhN5in1FN+SmvWkZr+A5MzvGIvCiSvhWcogReL1Vdc0r3Iz50eQm6Y3hTmPGTgf
	LmhJmwoxc8McnYXzw5x5mFy1aZRF/ebBhgMEANcA5Zn3FXkCV6bC5f/IdmizXpBIoNgDb9av5+k
	B9pCjKu0p+xplrA=
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr63642021a91.8.1789045090094;
        Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:09 -0700 (PDT)
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
Subject: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Thu, 10 Sep 2026 19:57:31 +0700
Message-ID: <20260910125742.150902-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 63e03a40dbbe..a901be97e75f 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_apll1_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_apll_tuner1;
 
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
+		goto err_tuner;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll1_en_on;
 
 	return 0;
+
+err_apll1_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_apll1_ck:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_apll2_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_apll_tuner2;
 
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
+		goto err_tuner;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll2_en_on;
 
 	return 0;
+
+err_apll2_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_apll2_ck:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0

