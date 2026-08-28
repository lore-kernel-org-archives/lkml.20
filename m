Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595302222D0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908569; cv=none; b=dky64J3vw5mForKoVNptAu1btYz08tm687F1riIYuF2q5SeGtIZWdC0UAT0QrI3W8ErfLujI9vHnq91feVzpeFPTw8wpdZskRp4yD9HoovQOB4XJk44ePKROtY+9ZJ3FORtaHABKetawW/oQLvwp50b88pvDQv7rvTuMYrquU8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908569; c=relaxed/simple;
	bh=KQBIs7Nmnq9Hw8gwAY+Gk44taT8sALXoi/IYHOHY3zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Navc7SD1s06abwDFOMDKqMCkdlZ1KwmdmaFl8B75aYTzX4eN/EO6vOFMBwlZKHLw51Nuu6YUwOHg7H9ikwYdef6JtU8us7QevGTVU3bwbjEBPX6uUJhGD8tKcHGAiJ+slVngrRQFR++MF97fPHXYNrrDoh4ose+IH1QLZJQVLEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfVOzqTw; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfVOzqTw"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8525efa7274so713788b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908568; x=1788513368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=XfVOzqTwZ2Ovl7sOMhsZaXZm8IqfBlDFAhSs3HbAGsakFjMKgIJCGd+eaL0pdP8cAi
         cIo5uOwvO7wCMjJj430T5ZrPa1iR3wQgK94BiI1V0WV1PGRuzmx2XfnzJalDGe5LunFv
         0BoyOZS9wVLW5ABj77D+ET8ehfrNW8wdQ54yrqBDxpLC0Hl/2yEI+am2WKjsrkWc+cyc
         LuRlpQURI7MRkrhdzAzlW2PE/7YeeYbtnvIsH7C5qSQKIX8/ImMu+OO82qYd8c0tDbV+
         Z9XIGOf91nAWhO5Q6vCTGrRaU+w0oGXOY+zGSUBHHRgsGuOQN6c5Dv1wr/dgSSPFKKsr
         xifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908568; x=1788513368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=lPvxciNNoqmzb5XxLSl6RYXsdeYUKPavcjrNfMGhgqfzakPQDcHCERUCmrOnF1Rm7Z
         brnIbMR0iihUb9jKYOhJkaa1Ge8+w+A0RDHLh3GXnqA81cLMnm17UEsvFDAnAQZSZQl8
         YqcglT6zRwVJC2csxjHS+qHznI0vssqlKZbsOXeBNIqrXvw+ql/DdEow3XyXY83GwslG
         IccnFZCAQ1sg+X6SZ58nSVGSSwA9kLTiYDeehYhpFjGhbRibwdF83LM+PrY7xUESKAQT
         HnTOmYM6qwDEiW7W304pYNKh2xF+VQo+w7i635n9P0fcIAR3HGCJBh+iehTgmoUQnYSn
         69pw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6dbIKf3g4obosxLjTruzH+LAARiWHaNcgOnl8Gujfx7/5zGEpLFAufzkjzl6IRNtAwfFemQbQ7nZSM30=@vger.kernel.org
X-Gm-Message-State: AFuF++n5k/CJEFGCrwEedcJi77Z6tWskD4Akg/3k1fajPSKE7ncjPXwP
	BlGYWdQgj7C1SMViwtETKHMxCEk2vUF/DrnDneKWyfcHGE6xYRJ8pETF
X-Gm-Gg: AR+sD103nEdj/vhYYnhMeFGs2WpJZxMm6JcIa/jDB3S+Encc94RsNfVK06bINTg8GZ7
	4JnlIrDW0Q3RFjWPGoVNKHj08vTdPpFufmA/l/nRdaTmVp/Ab3k5qW8vkutObQr8ORuWF3BXSe4
	dK1z768Z1jDmosm8jCLZInZ8nTHisnADFBQEhAULXK6ZgPxA605yHW9F02zHGagEtUhbZVUtj8T
	rec1h1UYd4kPE6zfje885sGJTxG/PBVoT763vxo/2P24OCjCZ/zgkiS6c0+Ij3WmYoLkxmnuurA
	CvzfZSp2Cj5WLb0vNmCDjp/npwopjP/MetPQmtBlK57Mb9lcx6j+XKDqi3JvHrTp0lmCPpH7nJd
	QtIrxzrkVNdw8m+J2vBiAU+PX6df3VShm5LTC741n25FgLsAGCllnIA/gzCy/8Qn6dyETM2myYu
	sYoKZWRHLEzMX4rU+Sh304i7+gtXaW+D3sfv2HCg1YIefydFIIbV6aqDt34AbLi+6z2z/0bKvBf
	s4IVcfQOYB5qiZvh1KSBT2cpsbOSh1VP5L52k6KZ4iv/UhHs0KwC/WFmRNJVEdH/Fymljw6i6fH
	+R86oA==
X-Received: by 2002:a05:6a00:2d84:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-85629a25879mr10588287b3a.10.1787908567583;
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
Date: Fri, 28 Aug 2026 16:15:26 +0700
Message-ID: <20260828091532.600047-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Move the clk_disable_unprepare() calls before clk_set_parent()
so that the clocks are always disabled and unprepared in the
disable path.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 70 +++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..a517aa67abf6 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -125,25 +125,26 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG1;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
@@ -199,25 +200,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
-- 
2.43.0

