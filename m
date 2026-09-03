Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826AC3890EC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412337; cv=none; b=lhCiUf5hLuZxAMbFyrEyD/95GB03TC28GaME0bdMvNg8Bf/PD44GyXwErV79cQbYKE6z2N+zktV5af1ST5TFQKSGHoMbdn0pi0Kbadjz58IHOfrfLooHiwPnn5t2Fj9CrDkUlFRCOliIks454sB2zsPq48pvHlZ/GUYLVFyMACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412337; c=relaxed/simple;
	bh=YdGYLhvtvptCpYDC3ICVM4oOhiZ9/gCcjjUKAA8PwCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqpMj6pQY87X1ABSFZ9o5ZCSjHc8L895ncTcV3qMpo4fRPcSuHEQuPqlJIa/BN7BlZkuka+CZPZ+QHVwAaXU4n5vW/f2hda61WADQVo/ATPC8cXmjQ67EP8qZwx14fuHMwBed+AD9ZzmyB007A//+EgSdApbOLMbVrWv/+Ns2A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF0tt5e+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF0tt5e+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84830c774a0so2128576b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412334; x=1789017134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAiRO/oCYlRl0/keklqXsoT6bN4V7lIX81Jp9VCDRm0=;
        b=NF0tt5e+3oSOAzJVnuDjQOPtnuebhoOzOtJ/fTjcvwmNWfLnvYC3lsE8cxhsgQNUt3
         rm5roUPEkiChdsDIeRzX9ebmUE+pBFQm7rs1cnILCv0Wrl+ynZPD2ZZlgJCZXNYxTSus
         n4U+7YoBOFechpgq854EaKQE5xBWM2rSp9u5YmKt2fi2iICVGyhGYZJERkDoMJWy3kDK
         4u7cQl9zV7LYATms3PL8qo9VxEGoZPOmAa9MD15oV+8Tes2/zkRYEAK6TnVUxKiiIGi1
         6lmx50dxJZ+zfhAPTzyW7eAasM9IZTAh7c4MT81ulLNT9M8x84AXuhzxAC/tvuxcgsF0
         bKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412334; x=1789017134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAiRO/oCYlRl0/keklqXsoT6bN4V7lIX81Jp9VCDRm0=;
        b=U1JFY+D/mw9NCtcPJ6+INZD4YSZ8OYQwA0p9xzBrlyRJ3MRbeuHuVFi7r1Lbi9DC8T
         0nUQb8KbqYd0et6Mm9TkBuw3AO2CYapAtwsRFCEgGuyUcZypGPmIlx2bESBZCJbpm6mK
         YxW4IyfKimkWWm9XZTQOPfUhIuruGD8WOREp+mjPsmJANKCmRSP9vmgOH2v7z/mkyK72
         Hq00qst2ipABoQIeWCS9AxNKtU2408usrEcq+rZvGuCSftOLnEdhOcl3yRTApU3yB63r
         Aekpj+dwJRNQ7QE7dyVlTfgTRWkhUGH0NLCS63kJCYOYnKAxflFhPHiYYgfNh7/8k1H6
         Gz8A==
X-Forwarded-Encrypted: i=1; AKwUvBzujc8s0Ha5Ilm7+fn/5vKH0Q4AZ0JXjUTN7ec57CqXYneeSrrAQAzoo22GCPWC4DwF+S5KxdBsmwE8kSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n2Ixwmgi5g/eW3mIjzQgPpZrg4rluQVg+w43t2J5U8CLl5+lOa
	446Lz187MbzB6FalgG2zyigfCMO0ltJb7v92ShvtW6/qOlAJQaJ8x492
X-Gm-Gg: AYBFou1zW2xtaQyhM0leUZc9oowt40GJLQWQ8fMS/Ptr7uMpfj+0MGMtqvMPqzGg36y
	qUqWoF27TgadybB4+uyLfQ9EPPRuzzbZr1kFcbXp8PpYY2PxHKN9qpd8fCttYG9CnAKlU3U7kbV
	ufPJ1IbO2OCCACKLPQ3Pr6Ba3o8UF3gXSPQYirk4i28M3KvyYI2iLMp4dyQy6KNM6v0YjY1G6Nx
	6vnKH+ym0JcSf5Q57x2Vgs4JoLJFmVPVA26bMTyNp0XXs9ktWxmBw04aa8IYRm+H6M7teta7C36
	y804zLngvazhR/DlJ8ccjQVHweN/Lruqj8DpdzTwvoJbWwWz/2RrYsFdReGdJXqzkMhvqpfgke+
	3gijfmseON5Yc3msnqz8faEtEf4lf6D9uZ1+2Xia4mQQDBQl40e58YMbehz1B1e3j9heFvNiZgg
	WhVOE9In6VLlJTGcXIJ/SUsX2WermAfvMT3t8q7oxEPTfDNLAMUD+rQXyLaPnjiaiJkYZwPqBV0
	DyJz+LsyDkT7y9e3u3hX0v0mXnFRPSmV413n3EJ3Uh7/nFgSyfPb+oUS3bu/R9isIlPP45MZ0/h
	WGh1
X-Received: by 2002:a17:90b:4e8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39aee0840d5mr15450600a91.13.1788412333744;
        Wed, 02 Sep 2026 22:12:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 1/8] ASoC: mediatek: mt8186: Fix APLL mux setting error handling
Date: Thu,  3 Sep 2026 12:11:43 +0700
Message-ID: <20260903051150.178057-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The APLL mux setup functions return immediately when a clock operation
fails, without undoing the clock changes already made. This can leave
clocks enabled or muxes configured to an unexpected parent.

Restore the affected muxes to CLK26M and disable previously enabled
clocks on error before propagating the original error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 50 ++++++++++++++++------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index daaca36a2d08..aa8b2eaf7b95 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -98,7 +98,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
 				     afe_priv->clk[CLK_TOP_APLL1_CK]);
@@ -106,7 +106,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_TOP_APLL1_CK], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_1;
 		}
 
 		/* 180.6336 / 8 = 22.5792MHz */
@@ -114,7 +114,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_ENG1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
 				     afe_priv->clk[CLK_TOP_APLL1_D8]);
@@ -122,7 +122,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_TOP_APLL1_D8], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG1;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
@@ -131,7 +131,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -141,12 +141,25 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
 
 	return 0;
+
+ERR_SELECT_CLK_TOP_MUX_AUD_ENG1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_ENG1:
+ERR_SELECT_CLK_TOP_MUX_AUD_1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_1:
+EXIT:
+	return ret;
 }
 
 static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
@@ -159,7 +172,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
 				     afe_priv->clk[CLK_TOP_APLL2_CK]);
@@ -167,7 +180,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_TOP_APLL2_CK], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_2;
 		}
 
 		/* 196.608 / 8 = 24.576MHz */
@@ -175,7 +188,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_ENG2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
 				     afe_priv->clk[CLK_TOP_APLL2_D8]);
@@ -183,7 +196,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_TOP_APLL2_D8], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
@@ -192,7 +205,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -202,12 +215,25 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
 
 	return 0;
+
+ERR_SELECT_CLK_TOP_MUX_AUD_ENG2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_ENG2:
+ERR_SELECT_CLK_TOP_MUX_AUD_2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_2:
+EXIT:
+	return ret;
 }
 
 int mt8186_afe_enable_cgs(struct mtk_base_afe *afe)
-- 
2.43.0

